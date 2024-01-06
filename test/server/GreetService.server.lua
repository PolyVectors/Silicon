local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.silicon)

local Service = Silicon.Service.Service
local AddService = Silicon.Service.AddService

local Implements = Silicon.Implements

AddService(Service("GreetService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
}))

Silicon.Start()
