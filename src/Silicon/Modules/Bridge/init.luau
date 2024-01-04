local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BridgeType = require(script.EventType)
type EventType = BridgeType.EventType

local Bridge = {}
Bridge.__index = Bridge

type Bridge = {}

Bridge.Bridges = {}

local function createSubFolder(name: string, parent: Instance)
	if parent:FindFirstChild(name) == nil then
		local new_folder = Instance.new("Folder")
		new_folder.Parent = parent

		new_folder.Name = name
	end
end

local function addBridgeFolders(bridgeName: string, eventType: EventType)
	createSubFolder("_Silicon/Bridges", ReplicatedStorage)
	createSubFolder(bridgeName, ReplicatedStorage["_Silicon/Bridges"])
	createSubFolder(eventType, ReplicatedStorage["_Silicon/Bridges"][bridgeName])
end

Bridge.Bridge = function(
	name: string
): (eventTypes: { EventType }) -> (bridgeEvents: { [EventType]: { string } }) -> Bridge
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

function Bridge.AddBridge(bridge: Bridge)
	if next(bridge) == nil then
		warn("[Silicon/Bridge] Cannot add malformed bridge.")
		return
	end

	for _, eventType in bridge._eventTypes do
		if bridge._bridgeEvents[eventType] ~= nil and BridgeType[eventType] ~= nil then
			addBridgeFolders(bridge._name, eventType)

			for _, eventName in bridge._bridgeEvents[eventType] do
				local newRemote = Instance.new("RemoteEvent")
				newRemote.Name = eventName
				newRemote.Parent = ReplicatedStorage["_Silicon/Bridges"][bridge._name][eventType]
			end
		end
	end
end

function Bridge.GetBridge(name: string): Bridge
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

			return setmetatable(newBridge, Bridge)
		end
	end
end

return Bridge
