local RunService = game:GetService("RunService")
local Promise = require(script.Parent.promise)

local Service = require(script.Modules.Singleton.Service)
local Controller = require(script.Modules.Singleton.Controller)

local Bridge = require(script.Modules.Bridge)
local EventType = require(script.Modules.Bridge.EventType)

local Implements = require(script.Modules.Implements)

--[=[
	@class Silicon
	A class containing all the methods and props that are used by Silicon.
]=]
local Silicon = {}

Silicon._serverStarted = false
Silicon._clientStarted = false

--[=[
	@server
	@function Service
	@within Silicon

	@param name string
	@return (implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any } | props) -> Singleton

	Creates a new Service using currying syntax.

	```lua
	Service "GreetService" { Implements.OnPlayerAdded } {
		[Implements.OnPlayerAdded] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Silicon["ServiceContainer"] = {
	Service = Service.Service,
	AddService = Service.AddService,
	AddServices = Service.AddServices,
	AddServiceContainer = Service.AddServiceContainer,
}

--[=[
	@client
	@function Controller
	@within Silicon

	@param name string
	@return (implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any | props}) -> Singleton

	Creates a new controller using currying syntax.

	```lua
	Controller "GreetController" { Implements.OnStart } {
		[Implements.OnStart] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Silicon["ControllerContainer"] = {
	Controller = Controller.Controller,
	AddController = Controller.AddController,
	AddControllers = Controller.AddControllers,
	AddControllersFolder = Controller.AddControllerContainer,
}

Silicon["BridgeContainer"] = {
	Bridge = Bridge.Bridge,
	AddBridge = Bridge.AddBridge,
	GetBridge = Bridge.GetBridge,
	EventType = EventType,
}

Silicon["Implements"] = Implements

function Silicon.Start()
	return Promise.new(function(resolve)
		if RunService:IsClient() then
			Silicon._serverStarted = true
		else
			Silicon._clientStarted = true
		end

		resolve()
	end)
end

return Silicon
