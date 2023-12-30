local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.Shared.Silicon)

local Service = Silicon.Service
local Implements = Silicon.Implements

Service("GreetService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function() end,
})
