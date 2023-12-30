--!strict

local Implements = require(script.Modules.Implements)

local silicon = {}
silicon.__index = silicon

silicon["Implements"] = Implements

function silicon.Service(name: string): (implementation: any) -> (functions: { [string]: (...any) -> nil }) -> any
	return function(implementation: any)
		return function(functions: { [string]: (...any) -> nil })
			return nil
		end
	end
end

return silicon
