--!strict
local Singelton = require(script.Parent.Parent.Singleton)

--- @class ImplementsDefinitions
--- Contains the definitions for the default implementations
local ImplementsDefinitions = {}
ImplementsDefinitions.__index = ImplementsDefinitions

function ImplementsDefinitions.OnStart(_singleton: Singelton.Singleton) end

return ImplementsDefinitions
