local RunService = game:GetService("RunService")

local Promise = require(script.Parent.Parent.Parent.Parent.promise)
local Singleton = require(script.Parent)

local Implements = require(script.Parent.Parent.Implements)
local ImplementsDefinitions = require(script.Parent.Parent.Implements.Definitions)

type Implements = Implements.Implements

--[=[
    @server
    @class Service
    
    A class derived from singletons meant for use on the Server.
]=]
local Service = {}

--[=[
	@server
	@prop Services { [string]: Singleton }
	@within Service

	Contains all Services added by Service.AddService (or any of its variations).
]=]
Service.Services = {}

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
) -> (props: { [string | Implements]: (...any) -> any | any }) -> unknown
	if RunService:IsClient() then
		warn(
			"[Silicon/Singleton/Service] Cannot create a service on the client, this method will return a malformed service."
		)
	end

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

--[=[
	@server
	@function AddService
	@within Service

	@param service Singleton
	@return nil

	Adds a service to the Service.Services table while running recognised implementation methods under the Service.
]=]
function Service.AddService(service)
	if service == {} then
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

--[=[
	@server
	@function AddServices
	@within Service

	@param services { Singleton }
	@return nil

	Iterates through an array of services and calls Service.AddService on each member of the array.
]=]
function Service.AddServices(services: {unknown})
	for _, service in services do
		Service.AddService(service)
	end
end

--[=[
	@server
	@function AddServiceContainer
	@within Service

	@param serviceContainer Instance
	@return nil

	Iterates through children of a given instance, accesses any module scripts found, and calls Service.AddService if the module script returns a Singleton.
]=]
function Service.AddServiceContainer(servicesContainer: ModuleScript)
	for _, serviceModule in servicesContainer:GetChildren() do
		if not serviceModule:IsA("ModuleScript") then
			print(`Skipped loading instance "{serviceModule.Name}" as it is not a ModuleScript`)
			continue
		end

		Promise.try(function()
			return require(serviceModule)
		end)
			:andThen(function(service: unknown)
				Service.AddService(service)
			end)
			:catch(function(err)
				warn(`Failed to load Service contained in module "{serviceModule.Name}" due to: "{err}"`)
			end)
	end
end

return Service
