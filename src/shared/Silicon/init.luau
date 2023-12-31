--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Promise = require(ReplicatedStorage.Packages.promise)

local Service = require(script.Modules.Singleton.Service)
local Controller = require(script.Modules.Singleton.Controller)

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
Silicon["Service"] = Service.Service
Silicon["AddService"] = Service.AddService

--[=[
	@client
	@function Controller
	@within Silicon

	@param name string
	@return (implements: { string | Implements }) -> (functions: { [string | Implements]: (...any) -> any }) -> Singleton

	Creates a new controller using currying syntax.

	```lua
	Controller "GreetController" { Implements.OnStart } {
		[Implements.OnStart] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Silicon["Controller"] = Controller.Controller
Silicon["AddController"] = Controller.AddController

Silicon["Implements"] = Implements

function Silicon.Start()
	return Promise.new(function(resolve)
		if RunService:IsServer() then
			Silicon._serverStarted = true
		else
			Silicon._clientStarted = true
		end

		resolve()
	end)
end

return Silicon
