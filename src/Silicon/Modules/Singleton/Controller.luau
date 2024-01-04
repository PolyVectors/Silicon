local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Promise = require(ReplicatedStorage.Packages.promise)
local Singleton = require(script.Parent)

local Implements = require(script.Parent.Parent.Implements)
local ImplementsDefinitions = require(script.Parent.Parent.Implements.Definitions)

type Singleton = Singleton.Singleton
type Implements = Implements.Implements

--[=[
    @client
    @class Controller
    
    A class derived from singletons meant for use on the Client.
]=]
local Controller = {}
Controller.Controllers = {} :: { Singleton }

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
) -> (props: { [string | Implements]: (...any) -> any }) -> Singleton
	return function(implements: { string | Implements })
		return function(props: { [string]: (...any) -> nil })
			if RunService:IsClient() then
				return Singleton._new(name, implements, props)
			else
				return {}
			end
		end
	end
end

function Controller.AddController(controller: Singleton)
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

function Controller.AddControllers(controllers: { Singleton })
	for _, controller in controllers do
		Controller.AddService(controller)
	end
end

function Controller.AddControllersFolder(controllersFolder: Folder)
	for _, controllerModule: ModuleScript in controllersFolder:GetChildren() do
		if not controllerModule:IsA("ModuleScript") then
			return
		end

		Promise.try(function()
			return require(controllerModule)
		end)
			:andThen(function(service: Singleton)
				Controller.AddController(service)
			end)
			:catch(function(err)
				warn(`Failed to load Controller contained in module "{controllerModule.Name}" due to: "{err}"`)
			end)
	end
end

return Controller
