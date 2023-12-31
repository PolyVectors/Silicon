--!strict
local Service = require(script.Service)
local Controller = require(script.Controller)

local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

--[=[
	@class Singleton
	A generic class used to create Services/Controllers internally
]=]
local Singleton = {}

--[=[
	@within Singleton
	@type Singleton { Name: string, Implements: { Implements.Implements | string }, Functions: { [string]: (...any) -> any } }

	This type denotes a generic type which can be derived to define a Service or a Controller.
]=]
export type Singleton = {
	Name: string,
	Implements: { Implements | string },
	Functions: { [string | Implements]: (...any) -> any },
}

--[=[
	@server
	@function Server
	@within Singleton

	@param _name string
	@return (implementation: { string }) -> (functions: { [string]: (...any) -> any }) -> any

	Creates a new service using currying.

	```lua
	Service "GreetService" { Implements.OnPlayerAdded() } {
		Implements.OnPlayerAdded() = function(player: Player)
			print(`Hello, {player.Name}`)
		end
	}
	```
]=]
Singleton["Service"] = Service

--[=[
	@client
	@function Controller
	@within Singleton

	@param _name string
	@return (implementation: { string }) -> (functions: { [string]: (...any) -> any }) -> any

	Creates a new controller using currying.

	```lua
	Service "GreetController" { Implements.OnStart() } {
		Implements.OnStart() = function()
			print(`Hello, {Players.LocalPlayer.Name}`)
		end
	}
	```
]=]
Singleton["Controller"] = Controller

return Singleton
