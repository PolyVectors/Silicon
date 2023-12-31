--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Option = require(ReplicatedStorage.Packages.option)
local Singleton = require(script.Parent)

local Implements = require(script.Parent.Parent.Implements)
local ImplementsDefinitions = require(script.Parent.Parent.Implements.Definitions)

type Option<T> = Option.Option<T>
type Singleton = Singleton.Singleton
type Implements = Implements.Implements

--[=[
    @server
    @class Service
    
    A class derived from singletons meant for use on the Server.
]=]
local Service = {}
Service.Services = {} :: Singleton

--[=[
	@server
	@function Service
	@within Service

	@param name string
	@return (implements: { string | Implements }) -> (functions: { [string | Implements]: (...any) -> any }) -> Singleton

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
) -> (functions: { [string | Implements]: (...any) -> any }) -> Singleton
	return function(implements: { string | Implements })
		return function(functions: { [string]: (...any) -> nil })
			local service: Option<Singleton> = Option.None

			if RunService:IsClient() then
				service = Option.Some({
					_name = name,
					_implements = implements,
					_functions = functions,
				} :: Singleton)
			end

			return service:UnwrapOrElse(function(): Singleton
				warn("[Silicon/Singleton/Service] Services can only be created on the server.")
				return {}
			end)
		end
	end
end

function Service.AddService(service: Singleton)
	if Option.Wrap(next(service)):IsNone() then
		warn("[Silicon/Singleton/Controller] Cannot add a malformed service, did you create the service on the client?")
		return
	end

	Service.Services[service._name] = service

	for functionName, implementFunction in service._functions do
		for _, implement in service._implements do
			if functionName == implement then
				ImplementsDefinitions[functionName](implementFunction)
			end
		end
	end

	setmetatable(Service.Services[service._name], Service.Services[service._name])
	Service.Services[service._name].__index = Service.Services[service._name]._functions
end

return Service
