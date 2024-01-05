local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)

local Service = Silicon.Service.Service
local AddService = Silicon.Service.AddService

local Implements = Silicon.Implements

local GreetService = Service("GreetService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
})

AddService(GreetService)

Silicon.Start()
