--!strict

--- @class ImplementsDefinitions
--- Contains the definitions for the default implementations.
local ImplementsDefinitions = {}
ImplementsDefinitions.__index = ImplementsDefinitions

function ImplementsDefinitions._OnStart(implementFunction: (...any) -> any)
	implementFunction()
end

return ImplementsDefinitions
