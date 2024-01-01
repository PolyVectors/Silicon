local Players = game:GetService("Players")
--!strict

local ImplementsDefinitions = {}
ImplementsDefinitions.__index = ImplementsDefinitions

function ImplementsDefinitions._OnStart(implementFunction: (...any) -> any)
	implementFunction()
end

function ImplementsDefinitions._OnPlayerAdded(implementFunction: (...any) -> any)
	Players.PlayerAdded:Connect(implementFunction)
end

return ImplementsDefinitions
