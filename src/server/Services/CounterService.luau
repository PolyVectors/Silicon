local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.Shared.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements

local CounterService = Service("CounterService")({ Implements.OnPlayerAdded })({
	PlayerCount = 0,
})

CounterService:SetMethod(Implements.OnPlayerAdded)(function()
	CounterService:SetProp("PlayerCount")(CounterService:GetProp("PlayerCount") + 1)
end)

return CounterService
