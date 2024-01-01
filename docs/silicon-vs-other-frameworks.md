---
sidebar_position: 4
---

# Silicon Versus Other Frameworks

This page is a small collection of examples from frameworks that were huge inspirations for Silicon compared to a versions that were ported to Silicon itself.

## Money Service (from [Knit](https://github.com/Sleitnick/Knit))
```lua
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

-- Create the service:
local MoneyService = Knit.CreateService {
	Name = "MoneyService",
}

-- Add some methods to the service:

function MoneyService:GetMoney(player)
	-- Do some sort of data fetch
	local money = someDataStore:GetAsync("money")
	return money
end

function MoneyService:GiveMoney(player, amount)
	-- Do some sort of data fetch
	local money = self:GetMoney(player)
	money += amount
	someDataStore:SetAsync("money", money)
end

Knit.Start():catch(warn)
```
> Knit (from [README.md](https://github.com/Sleitnick/Knit/blob/main/README.md))

This example shows the clever usage of [Promises](https://github.com/evaera/roblox-lua-promise) in Knit which means that any errors caused by Knit services are caught safely by the `warn` function.
Silicon takes this idea, an example of inspiration taken from Knit.

```lua
local Silicon = require(game:GetService("ReplicatedStorage").Packages.Silicon)

local Service = Silicon.Service.Service
local Implements = Silicon.Implements

--- Create the service:
Service "MoneyService" { Implements.None } {
    -- Add some methods to the service:

    GetMoney = function(player: Player)
        -- Do some sort of data fetch
	    local money = someDataStore:GetAsync("money")
	    return money
    end

    GiveMoney = function()
        -- Do some sort of data fetch
        local money = self:GetMoney(player: Player, amount: string)
        money += amount
        someDataStore:SetAsync("money", money)
    end
}

Silicon.Start():catch(warn)
```
> Silicon 0.1.0.alpha.3

## Boilerplate Showcase (from [Flamework](https://github.com/rbxts-flamework/core))

```ts
@Service()
export class MyService {}
```
> Flamework (from [Flamework docs](https://fireboltofdeath.dev/docs/flamework))

The lack of boilerplate in Flamework is a huge inspiration for Silicon.
Silicon also takes more inspiration from Flamework due to its awesome type safe networking model.

```lua
Service "MyService" {} {}
```
or an alternative:
```lua
Service "MyService" { Implements.None } {}
```
> Silicon 0.1.0.alpha.3