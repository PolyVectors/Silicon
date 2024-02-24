local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.silicon)
local Bridge = Silicon.BridgeContainer.Bridge
local EventType = Silicon.BridgeContainer.EventType

Bridge("GreetingBridge")({ EventType.ServerToClient })({
	[EventType.ServerToClient] = { "GreetPlayer" },
})
