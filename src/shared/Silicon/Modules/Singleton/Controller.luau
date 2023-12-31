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
    @client
    @class Controller
    
    A class derived from singletons meant for use on the Client.
]=]
local Controller = {}
Controller.Controllers = {} :: Singleton

--[=[
	@client
	@function Controller
	@within Controller

	@param name string
	@return (implements: { string | Implements }) -> (functions: { [string | Implements]: (...any) -> any }) -> Option<Singleton>

	Creates a new controller using currying syntax.

	```lua
	Controller "GreetController" { Implements.OnStart } {
		[Implements.OnStart] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
function Controller.Controller(name: string): (
	implements: { string | Implements }
) -> (functions: { [string | Implements]: (...any) -> any }) -> Singleton
	return function(implements: { string | Implements })
		return function(functions: { [string]: (...any) -> nil })
			local controller: Option<Singleton> = Option.None

			if RunService:IsClient() then
				controller = Option.Some({
					_name = name,
					_implements = implements,
					_functions = functions,
				} :: Singleton)
			end

			return controller:UnwrapOrElse(function(): Singleton
				warn("[Silicon/Singleton/Controller] Controllers can only be created on the client.")
				return {}
			end)
		end
	end
end

function Controller.AddController(controller: Singleton)
	if Option.Wrap(next(controller)):IsNone() then
		warn(
			"[Silicon/Singleton/Controller] Cannot add a malformed controller, did you create the controller on the server?"
		)
		return
	end

	Controller.Controllers[controller._name] = controller

	for functionName, implementFunction in controller._functions do
		for _, implement in controller._implements do
			if functionName == implement then
				ImplementsDefinitions[functionName](implementFunction)
			end
		end
	end

	setmetatable(Controller.Controllers[controller._name], Controller.Controllers[controller._name])
	Controller.Controllers[controller._name].__index = Controller.Controllers[controller._name]._functions

	return Controller.Controllers[controller._name]
end

return Controller
