---
sidebar_position: 2
---

# A Comprehensive Guide To Silicon
A Comprehensive Guide is a long tutorial relative to other Silicon tutorials (such as Silicon By Example), however it goes more in depth about the design of Silicon.

## Singletons
A `Singleton` is an idea taken from Knit.
Singletons are used in Silicon as a template for creating `Services` and `Controllers` (ideas inspired from Flamework and Knit).

## Services
A Service is a class derived from a Singleton that is exclusive to the server.
Creating a Service in Silicon requires minimal syntax and Services can be used powerfully to define behaviour on the server.
Here is an example of a simple service that will be brought up repeatedly and expanded on in the tutorial:

```lua
local Silicon = require(ReplicatedStorage.Silicon) -- Replace Path.To.Silicon with the actual Silicon path (preferably absolute).

local Service = Silicon.Service.Service -- The first occurance of "Service" is a table that holds public methods in the Service class, the second occurance of "Service" is the method that creates a new Service.
local AddService = Silicon.Service.AddService -- "AddService" is a method that tells Silicon to add a service and execute its Implementations.

local Implements = Silicon.Implements -- The "Implements" class tells Silicon to hook to certain methods in a Singleton to run them under certain conditions, essentialy "implementing" certain methods.

-- Here, the Implement "OnPlayerAdded" is used which calls the "OnPlayerAdded" method of the Service when a new player joins the experience.
local GreetService = Service "GreetService" { Implements.OnPlayerAdded } {
	[Implements.OnPlayerAdded] = function(player: Player)
		print(`Hello, {player.Name}!`)
	end,
}

-- Here is where implementations will be evaluated and executed by Silicon.
AddService(GreetService)

-- Start Silicon and consequently run the (unused) OnStart implementation.
Silicon.Start()
```
> This is an example of a "standalone" service which does not require the use of any other services or `Bridges`.
> Standalone services still need to be added using any variation of the `AddService` method.

Services, however do not to be this complex and a simple service can be created with a minimal amount of syntax.

```lua
-- //snip//
Service "MyService" {} {}
```
> This is a service that essentially does nothing, however it does showcase the minimal syntax of Silicon.

## Controllers
A 