local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Shared.Silicon)
local AddServicesFolder = Silicon.Service.AddServicesFolder

AddServicesFolder(script.Services)

Silicon.Start()
