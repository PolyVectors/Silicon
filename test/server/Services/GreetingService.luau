local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements
local EventType = Silicon.Bridge.EventType
local GetBridge = Silicon.Bridge.GetBridge

local GreetingService

GreetingService = Service("GreetingService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(_player: Player)
		GetBridge("GreetingBridge"):FireEvent("GreetPlayer", EventType.ServerToClient, { "test" })
	end,
})

return GreetingService
