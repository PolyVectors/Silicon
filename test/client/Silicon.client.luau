local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon)
local AddControllersFolder = Silicon.Controller.AddControllersFolder

AddControllersFolder(script.Parent.Controllers)

Silicon.Start()
