local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Controller = Silicon.Controller.Controller
local Implements = Silicon.Implements
local GetBridge = Silicon.Bridge.GetBridge

local GreetingController

GreetingController = Controller("GreetingController")({ Implements.OnStart })({
	GreetPlayer = function(username: string)
		print(`Hello, {username}!`)
	end,

	[Implements.OnStart] = function() end,
})

return GreetingController
