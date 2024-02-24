local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.silicon)

local Service = Silicon.ServiceContainer.Service
local AddService = Silicon.ServiceContainer.AddService

local Implements = Silicon.Implements

AddService(Service("GreetService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
}))

Silicon()
