--!strict

local Implements = require(script.Modules.Implements)

local silicon = {}
silicon.__index = silicon

silicon["Implements"] = Implements

function silicon.Service(
	name: string
): (implementation: { string }) -> (functions: { [string]: (...any) -> any }) -> any
	return function(implementations: { string })
		return function(functions: { [string]: (...any) -> nil })
			return nil
		end
	end
end

return silicon
