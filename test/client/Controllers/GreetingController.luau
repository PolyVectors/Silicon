local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Controller = Silicon.Controller.Controller
local Implements = Silicon.Implements
local EventType = Silicon.Bridge.EventType
local GetBridge = Silicon.Bridge.GetBridge

local GreetingController

GreetingController = Controller("GreetingController")({ Implements.OnStart })({
	GreetPlayer = function(username: string)
		print(`Hello, {username}!`)
	end,

	[Implements.OnStart] = function()
		GetBridge("GreetingBridge"):WhenFired("GreetPlayer", EventType.ServerToClient, function(testString: string)
			GreetingController.GreetPlayer(testString)
		end)
	end,
})

return GreetingController
