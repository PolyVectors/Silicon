local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(script.Parent.Parent.Parent.promise)

local EventType = require(script.EventType)
type EventType = EventType.EventType

--[=[
	@class Bridge
	A class that handles networking under a unique "bridge" model.
]=]
local Bridge = {}
Bridge.__index = Bridge

Bridge.Bridges = {}

local function createSubFolder(name: string, parent: Instance)
	if parent:FindFirstChild(name) == nil then
		local new_folder = Instance.new("Folder")
		new_folder.Parent = parent
		new_folder.Name = name
	end
end

Bridge.Bridge = function(
	name: string
): (eventTypes: { EventType }) -> (bridgeEvents: { [EventType]: { string } }) -> unknown
	return function(eventTypes: { EventType })
		return function(bridgeEvents: { [EventType]: { string } })
			return setmetatable({
				_name = name,
				_eventTypes = eventTypes,
				_bridgeEvents = bridgeEvents,
			}, Bridge)
		end
	end
end

function Bridge.AddBridge(bridge)
	if next(bridge) == nil or bridge._name == nil or bridge._eventTypes == nil or bridge._bridgeEvents == nil then
		warn("[Silicon/Bridge] Cannot add malformed bridge.")
		return
	end

	for _, eventType in bridge._eventTypes do
		if bridge._bridgeEvents[eventType] ~= nil and EventType[eventType] ~= nil then
			createSubFolder("_Silicon/Bridges", ReplicatedStorage)
			createSubFolder(bridge._name, ReplicatedStorage["_Silicon/Bridges"])
			createSubFolder(eventType, ReplicatedStorage["_Silicon/Bridges"][bridge._name])

			for _, eventName in bridge._bridgeEvents[eventType] do
				local newRemote = Instance.new("RemoteEvent")
				newRemote.Name = eventName
				newRemote.Parent = ReplicatedStorage["_Silicon/Bridges"][bridge._name][eventType]
			end
		end
	end
end

function Bridge.AddBridgeContainer(bridgeContainer: ModuleScript)
	for _, bridgeModule in bridgeContainer:GetChildren() do
		if not bridgeModule:IsA("ModuleScript") then
			print(`Skipped loading instance "{bridgeModule.Name}" as it is not a ModuleScript`)
			continue
		end

		Promise.try(function()
			return require(bridgeModule)
		end)
			:andThen(function(bridge: unknown)
				Bridge.AddBridge(bridge)
			end)
			:catch(function(err)
				warn(`Failed to load Service contained in module "{bridgeModule.Name}" due to: "{err}"`)
			end)
	end
end

function Bridge.AddBridges(bridges: { unknown })
	for _, bridge in bridges do
		Bridge.AddBridge(bridge)
	end
end

function Bridge.GetBridge(name: string): unknown?
	if ReplicatedStorage["_Silicon/Bridges"] and ReplicatedStorage["_Silicon/Bridges"][name] ~= nil then
		local newBridge = {}
		newBridge._name = name

		for _, eventTypeFolder in ReplicatedStorage["_Silicon/Bridges"][name]:GetChildren() do
			if ReplicatedStorage["_Silicon/Bridges"][name][eventTypeFolder.Name] ~= nil then
				local events = {}

				for _, event in ReplicatedStorage["_Silicon/Bridges"][name][eventTypeFolder.Name]:GetChildren() do
					if events[eventTypeFolder.Name] == nil then
						events[eventTypeFolder.Name] = {}
					end

					table.insert(events[eventTypeFolder.Name], event.Name)
				end

				newBridge._bridgeEvents = events
			end
		end

		return setmetatable(newBridge, Bridge)
	end

  return nil
end

function Bridge.FireEvent(self, eventType: EventType, name: string): (args: { [number]: any }) -> nil
	return function(args: { [number]: any })
		local remoteEvent: RemoteEvent = ReplicatedStorage["_Silicon/Bridges"][self._name][eventType][name]

		if eventType == EventType.ServerToClient then
			remoteEvent:FireAllClients(table.unpack(args))
		elseif eventType == EventType.ClientToServer then
			remoteEvent:FireServer(table.unpack(args))
		end
	end
end

function Bridge.WhenFired(self, eventType: EventType, name: string): (fn: (...any) -> nil) -> nil
	return function(fn: (...any) -> nil)
		local remoteEvent: RemoteEvent = ReplicatedStorage["_Silicon/Bridges"][self._name][eventType][name]

		if eventType == EventType.ServerToClient then
			remoteEvent.OnClientEvent:Connect(fn)
		elseif eventType == EventType.ClientToServer then
			remoteEvent.OnServerEvent:Connect(fn)
		end
	end
end

return Bridge
