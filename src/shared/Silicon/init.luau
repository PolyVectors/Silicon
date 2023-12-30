--!strict

--- @class Silicon
--- A class containing all the methods for Silicon
local Silicon = {}
Silicon.__index = Silicon

local Implements = require(script.Modules.Implements)

Silicon["Implements"] = Implements

function Silicon.Service(
	_name: string
): (implementation: { string }) -> (functions: { [string]: (...any) -> any }) -> any
	return function(_implementations: { string })
		return function(_functions: { [string]: (...any) -> nil })
			return nil
		end
	end
end

return Silicon
