local Players = game:GetService("Players")

local ImplementsDefinitions = {}
ImplementsDefinitions.__index = ImplementsDefinitions

function ImplementsDefinitions.OnStart(implementFunction: (...any) -> any)
	implementFunction()
end

function ImplementsDefinitions.OnPlayerAdded(implementFunction: (...any) -> any)
	Players.PlayerAdded:Connect(implementFunction)
end

return ImplementsDefinitions
