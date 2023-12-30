--!strict
local Singleton = require(script.Modules.Singleton)
local Implements = require(script.Modules.Implements)

--[=[
	@class Silicon
	A class containing all the methods and props that are used by Silicon.
]=]
local Silicon = {}
Silicon.__index = Silicon

--[=[
	@server
	@function Service
	@within Silicon

	@param name string
	@return (implements: { string | Implements }) -> (functions: { [string]: (...any) -> any }) -> Singleton

	Creates a new Service using currying.

	```lua
	Service "GreetService" { Implements.OnPlayerAdded } {
		[Implements.OnStart] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Silicon["Service"] = Singleton.Service.Service

--[=[
	@client
	@function Controller
	@within Silicon

	@param name string
	@return (implements: { string | Implements }) -> (functions: { [string]: (...any) -> any }) -> Singleton

	Creates a new controller using currying.

	```lua
	Controller "GreetController" { Implements.OnStart } {
		[Implements.OnStart] = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Silicon["Controller"] = Singleton.Controller.Controller

Silicon["Implements"] = Implements

return Silicon
