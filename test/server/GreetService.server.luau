local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Silicon = require(ReplicatedStorage.Silicon) -- Replace Path.To.Silicon with the actual Silicon path (preferably absolute).

local Service = Silicon.Service.Service -- The first occurance of "Service" is a table that holds public methods in the Service class, the second occurance of "Service" is the method that creates a new Service.
local AddService = Silicon.Service.AddService -- "AddService" is a method that tells Silicon to add a service and execute its Implementations.

local Implements = Silicon.Implements -- The "Implements" class tells Silicon to hook to certain methods in a Singleton to run them under certain conditions, essentialy "implementing" certain methods.

-- Here, the Implement "OnPlayerAdded" is used which calls the "OnPlayerAdded" method of the Service when a new player joins the experience.
local GreetService = Service("GreetService")({ Implements.OnPlayerAdded })({
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
})

-- Here is where implementations will be evaluated and executed by Silicon.
AddService(GreetService)

-- Start Silicon and consequently run the OnStart implementation.
Silicon.Start()
