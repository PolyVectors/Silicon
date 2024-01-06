local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.silicon)
local Bridge = Silicon.Bridge.Bridge
local EventType = Silicon.Bridge.EventType

Bridge("GreetingBridge")({ EventType.ServerToClient })({
	[EventType.ServerToClient] = { "GreetPlayer" },
})
