--!strict
local Singleton = require(script.Parent)
local Implements = require(script.Parent.Parent.Implements)

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
	@within Controller

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
function Controller.Controller(name: string): (
	implements: { string | Implements }
) -> (functions: { [string]: (...any) -> any }) -> Singleton
	return function(implements: { string | Implements })
		return function(functions: { [string]: (...any) -> nil })
			Controller.Controllers[name] = {
				Name = name,
				Implements = implements,
				Functions = functions,
			} :: Singleton

			return Controller.Controllers[name]
		end
	end
end

return Controller
