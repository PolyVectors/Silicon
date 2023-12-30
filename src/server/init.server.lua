local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.Shared.Silicon)

local Service = Silicon.Service
local Implements = Silicon.Implements

Service("TestService")(Implements.OnStart())({
	OnStart = function()
		print("Test")
	end,
})
