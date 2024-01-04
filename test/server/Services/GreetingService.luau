local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements

local EventType = Silicon.Bridge.EventType
local GetBridge = Silicon.Bridge.GetBridge

local GreetingService

GreetingService = Service("GreetingService")({ Implements.OnStart })({
	GreetPlayer = function(name: string)
		print(`Hello, {name}!`)
	end,

	[Implements.OnStart] = function()
		GetBridge("GreetingBridge"):WhenFired(EventType.ClientToServer, "GreetPlayer")(GreetingService.GreetPlayer)
	end,
})

return GreetingService
