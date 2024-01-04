local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Controller = Silicon.Controller.Controller
local Implements = Silicon.Implements

local EventType = Silicon.Bridge.EventType
local GetBridge = Silicon.Bridge.GetBridge

return Controller("GreetingController")({ Implements.OnStart })({
	[Implements.OnStart] = function()
		GetBridge("GreetingBridge"):FireEvent(EventType.ClientToServer, "GreetPlayer")({ Players.LocalPlayer.Name })
	end,
})
