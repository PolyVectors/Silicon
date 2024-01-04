local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)
local AddServicesFolder = Silicon.Service.AddServicesFolder
local AddBridge = Silicon.Bridge.AddBridge

AddBridge(require(ReplicatedStorage.Shared.Bridges.GreetingBridge))
AddServicesFolder(script.Parent.Services)

Silicon.Start()
