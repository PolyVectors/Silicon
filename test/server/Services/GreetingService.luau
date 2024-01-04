local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements
local GetBridge = Silicon.Bridge.GetBridge

local GreetingService

GreetingService = Service("GreetingService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		GetBridge("GreetingBridge")
	end,
})

return GreetingService
