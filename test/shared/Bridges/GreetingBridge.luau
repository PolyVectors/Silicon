local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Bridge = Silicon.Bridge.Bridge
local EventType = Silicon.Bridge.EventType

return Bridge("GreetingBridge")({ EventType.ClientToServer })({
	[EventType.ClientToServer] = { "GreetPlayer" },
})
