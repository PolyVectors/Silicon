local RunService = game:GetService("RunService")

local Promise = require(script.Parent.Parent.Parent.Parent.promise)
local Singleton = require(script.Parent)

local Implements = require(script.Parent.Parent.Implements)
local ImplementsDefinitions = require(script.Parent.Parent.Implements.Definitions)

type Singleton = Singleton.Singleton
type Implements = Implements.Implements

--[=[
    @server
    @class Service
    
    A class derived from singletons meant for use on the Server.
]=]
local Service = {}
Service.Services = {} :: { [string]: {} }

--[=[
	@server
	@function Service
	@within Service

	@param name string
	@return (implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any | props }) -> ()

	Creates a new Service using currying syntax.

	```lua
	Service "GreetService" { Implements.OnPlayerAdded } {
		[Implements.OnPlayerAdded] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
function Service.Service(name: string): (
	implements: { string | Implements }
) -> (props: { [string | Implements]: (...any) -> any | any }) -> Singleton
	return function(implements: { string | Implements })
		return function(props: { [string]: (...any) -> nil })
			if RunService:IsServer() then
				return Singleton._new(name, implements, props)
			else
				return {}
			end
		end
	end
end

function Service.AddService(service: Singleton)
	if next(service) == nil then
		warn("[Silicon/Singleton/Service] Cannot add a malformed service, did you create the service on the client?")
		return
	end

	Service.Services[service._name] = service

	for functionName, implementFunction in service do
		for _, implement in service._implements do
			if functionName == implement then
				ImplementsDefinitions[functionName](implementFunction)
			end
		end
	end
end

function Service.AddServiceContainer(servicesContainer: Instance)
	for _, serviceModule: ModuleScript in servicesContainer:GetChildren() do
		if not serviceModule:IsA("ModuleScript") then
			print(`Skipped loading instance "{serviceModule.Name}" as it is not a ModuleScript`)
			continue
		end

		Promise.try(function()
			return require(serviceModule)
		end)
			:andThen(function(service: Singleton)
				Service.AddService(service)
			end)
			:catch(function(err)
				warn(`Failed to load Service contained in module "{serviceModule.Name}" due to: "{err}"`)
			end)
	end
end

function Service.AddServices(services: { Singleton })
	for _, service in services do
		Service.AddService(service)
	end
end

return Service
