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
local Silicon = require(Path.To.Silicon) -- Replace Path.To.Silicon with the actual Silicon path (preferably absolute).

local Service = Silicon.Service.Service -- The first occurrence of "Service" is a table that holds public methods in the Service class, the second occurrence of "Service" is the method that creates a new Service.
local AddService = Silicon.Service.AddService -- "AddService" is a method that tells Silicon to add a service and execute its Implementations.

local Implements = Silicon.Implements -- The "Implements" class tells Silicon to hook to certain methods in a Singleton to run them under certain conditions, essentially "implementing" certain methods.

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
> This is an example of a "standalone" Service which does not require the use of any other Services or `Bridges`.
> Standalone Services still need to be added using any variation of the `AddService` method.

Services however, do not to be this complex and a simple Service can be created with a minimal amount of syntax.

```lua
-- //snip//
Service "MyService" {} {}
```
> This is a Service that essentially does nothing, however it does showcase the minimal syntax of Silicon.

## Controllers
Controllers run parallel to Services in the way that they mimic each others methods.
The difference between controllers and Services however, is that Controllers run on the client.
Controllers are also derived from Singletons.
Here is an example of a simple controller that will also be brought up repeatedly and expanded upon in the tutorial:

```lua
local Players = game:GetService("Players")
local Silicon = require(Path.To.Silicon) -- Replace Path.To.Silicon with the actual Silicon path (preferably absolute).

local Controller = Silicon.Controller.Controller -- Similar to Services, Controllers are contained in the Controller table under Silicon.
local AddController = Silicon.Controller.AddController -- A method in the Controller table equivalent to AddService on the server.

local Implements = Silicon.Implements

-- Here, the Implement "OnStart" is used which calls the "OnStart" method of the Controller when Silicon starts on the client.
local GreetController = Controller("GreetController")({ Implements.OnStart })({
	[Implements.OnStart] = function()
		print(`Hello, {Players.LocalPlayer.Name}!`)
	end,
})

AddController(GreetController)

Silicon.Start()
```

## Bridges
Bridges are a concept unique to Silicon which essentially handle networking between Services and Controllers.
Here is example of basic usage of bridges to handle client to server communication:
