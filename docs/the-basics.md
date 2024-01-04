---
sidebar_position: 2
---

# The Basics
To get started with Silicon, it is important to understand the basics of the Singleton model.
A singleton at its core is a class that is used to create Services and Controllers.
Singletons are derived by Services and Controllers, this is to create seperation between the Server and Client.
Services being used on the server and Controllers being used on the client.

## Services
To create a service, use the `Service` method under `Silicon`.

```lua
local Silicon = require(Path.To.Silicon)
local Service = Silicon.Service

Service "MyService" {} {}
```
> This is the minimum amount of required code to create a service using Silicon.

From here on imports will be hidden for clarity.

Although this code works and can be read by the Luau interpreter, some may prefer to use the following syntax instead as it uses syntax accepted by formatters such as StyLua by default:
```lua
-- //snip//
Service("MyService")({})({})
```

## Controllers
Creating a controller in Silicon it is essentially the same, except the `Service` method is swapped out for the `Controller` method.

```lua
Controller "MyController" {} {}
```

It can also be written like this:
```lua
Controller("MyController")({})({})
```

## Props
In Silicon, a Prop is either a property or a method underneath a Singleton.
Props can come in very useful when creating a Singleton.
This is because these values stay the same across all methods and can all read eachother.
The following is an example of prop usage:

```lua
local CounterService

CounterService = Service "CounterService" { Implements.OnPlayerAdded } {
    PlayerCount = 0,

    [Implements.OnPlayerAdded] = function()
        CounterService.PlayerCount += 1
    end
}
```

You can also create methods by directly adding them into the list of props when you initalise your service.
The following is example usage of methods.

```lua
local MethodTestingService

MethodTestingService = Service "MethodTestingService" { Implements.OnStart } {
    MyMethod = function(value: string)
	    print(`Here is your value: "{value}"`)
    end

	[Implements.OnStart] = function()
		MethodTestingService.MyMethod()
	end,
}
```
or, alternatively:

```lua
local MethodTestingService

MethodTestingService = Service "MethodTestingService" { Implements.OnStart } {
	[Implements.OnStart] = function()
		MethodTestingService.MyMethod()
	end,
}

function MethodTestingService.MyMethod()
    print("Hello, world")
end
```

## Bridges

Silicon works off of a "bridge" model, where data between services and controllers are defined and generated before usage.
Under the hood, bridges are turned into sets of RemoteFunctions neatly organised under ReplicatedStorage.
Here is an example of a simple bridge that allows for communication between a greeting service and a greeting controller:

```lua
return Bridge"GreetingBridge" { EventType.ServerToClient } {
	[EventType.ServerToClient] = { "GreetPlayer" },
}
```
> src/shared/GreetingBridge

```lua
return Controller "GreetingController" { Implements.OnStart } {
	[Implements.OnStart] = function()
		GetBridge "GreetingBridge" : FireEvent (EventType.ClientToServer, "GreetPlayer") { Players.LocalPlayer.Name }
	end,
}
```
> src/client/GreetingController

```lua
local GreetingService

GreetingService = Service "GreetingService" { Implements.OnStart } {
	GreetPlayer = function(name: string)
		print(`Hello, {name}!`)
	end,

	[Implements.OnStart] = function()
		GetBridge "GreetingBridge" : WhenFired (EventType.ClientToServer, "GreetPlayer") (GreetingService.GreetPlayer)
	end,
}
```
> src/server/GreetingService