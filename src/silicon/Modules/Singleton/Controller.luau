local RunService = game:GetService("RunService")

local Promise = require(script.Parent.Parent.Parent.Parent.promise)
local Singleton = require(script.Parent)

local Implements = require(script.Parent.Parent.Implements)
local ImplementsDefinitions = require(script.Parent.Parent.Implements.Definitions)

type Implements = Implements.Implements

--[=[
    @client
    @class Controller
    
    A class derived from singletons meant for use on the Client.
]=]
local Controller = {}

--[=[
	@client
	@prop Controllers { [string]: Singleton }
	@within Controller

	Contains all Controllers added by Controller.AddController (or any of its variations).
]=]
Controller.Controllers = {}

--[=[
	@client
	@function Controller
	@within Controller

	@param name string
	@return (implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any | props }) -> Singleton

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
) -> (props: { [string | Implements]: (...any) -> any }) -> unknown
	if RunService:IsServer() then
		warn(
			"[Silicon/Singleton/Service] Cannot create a controller on the server, this method will return a malformed controller."
		)
	end

	return function(implements: { string | Implements })
		return function(props: { [string]: (...string) -> nil })
			if RunService:IsClient() then
				return Singleton._new(name, implements, props)
			else
				return {}
			end
		end
	end
end

--[=[
	@client
	@function AddController
	@within Controller

	@param controller Singleton
	@return nil

	Adds a controller to the Controller.Controllers table while running recognised implementation methods under the Controller.
]=]
function Controller.AddController(controller)
	if next(controller) == nil then
		warn(
			"[Silicon/Singleton/Controller] Cannot add a malformed controller, did you create the controller on the server?"
		)
		return
	end

	Controller.Controllers[controller._name] = controller

	for functionName, implementFunction in controller do
		for _, implement in controller._implements do
			if functionName == implement then
				ImplementsDefinitions[functionName](implementFunction)
			end
		end
	end

	return Controller.Controllers[controller._name]
end

function Controller.AddControllers(controllers: {[string]: unknown})
	for _, controller in controllers do
		Controller.AddController(controller)
	end
end

--[=[
	@client
	@function AddControllerContainer
	@within Controller

	@param controllerContainer Instance
	@return nil

	Iterates through children of a given instance, accesses any module scripts found, and calls Controller.AddController if the module script returns a Singleton.
]=]
function Controller.AddControllerContainer(controllerContainer: ModuleScript)
	for _, controllerModule in controllerContainer:GetChildren() do
		if not controllerModule:IsA("ModuleScript") then
			print(`Skipped loading instance "{controllerModule.Name}" as it is not a ModuleScript`)
			continue
		end

		Promise.try(function()
			return require(controllerModule)
		end)
			:andThen(function(controller: unknown)
				Controller.AddController(controller)
			end)
			:catch(function(err)
				warn(`Failed to load Controller contained in module "{controllerModule.Name}" due to: "{err}"`)
			end)
	end
end

return Controller
