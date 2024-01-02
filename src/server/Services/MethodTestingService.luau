local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Silicon = require(ReplicatedStorage.Shared.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements

local MethodTestingService

MethodTestingService = Service("MethodTestingService")({ Implements.OnStart })({
	[Implements.OnStart] = function()
		MethodTestingService.MyMethod()
	end,
})

function MethodTestingService.MyMethod()
	print("Hello, world")
end

return MethodTestingService
