local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.silicon)

local Controller = Silicon.Controller.Controller
local AddController = Silicon.Controller.AddController

local Implements = Silicon.Implements

local GreetController = Controller("GreetController")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
})

AddController(GreetController)

Silicon.Start()
