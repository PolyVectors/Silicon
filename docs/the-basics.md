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
> This is the minimum amount of required syntax to create a service using Silicon.

From here on imports will be hidden for clarity.

Although this syntax works and can be read by the Luau compiler, some may prefer to use the following syntax instead, as it uses syntax accepted by formatted:
```lua
-- //snip//
Service("MyService")({})({})
```

## Controller
Creating a controller in Silicon it is essentially the same, except the `Service` method is swapped out for the `Controller` method.

```lua
Controller "MyController" {} {}
```

It can also be written like this:
```lua
Controller("MyController")({})({})
```

## Props
In Silicon, a Prop is either a field or a method underneath a Singleton.
Props can come in very useful when creating a Singleton.
This is because these values stay the same across all methods and can all read eachother.
The following is an example of prop usage.

```lua
local CounterService = Service "CounterService" { Implements.OnPlayerAdded } {
    PlayerCount = 0
}

CounterService:AddProp (Implements.OnPlayerAdded) (function(player: Player)
    CounterService:SetProp "PlayerCount" (function(oldValue: number)
        return oldValue + 1
    end)
end)
```