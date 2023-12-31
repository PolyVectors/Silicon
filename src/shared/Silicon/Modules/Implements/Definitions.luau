--!strict

local ImplementsDefinitions = {}
ImplementsDefinitions.__index = ImplementsDefinitions

function ImplementsDefinitions._OnStart(implementFunction: (...any) -> any)
	implementFunction()
end

return ImplementsDefinitions
