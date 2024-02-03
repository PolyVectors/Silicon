local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.silicon)

local Controller = Silicon.ControllerContainer.Controller
local AddController = Silicon.ControllerContainer.AddController

local Implements = Silicon.Implements

local GreetController = Controller("GreetController")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
})

AddController(GreetController)

Silicon.Start()
