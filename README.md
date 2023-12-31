# Silicon
<div align="center">
<img align="center" src="https://github.com/PolyVectors/Silicon/blob/main/.moonwave/static/logo.png?raw=true" width="128" style="padding-bottom: 16px">

A [Fusion](https://github.com/dphfox/Fusion), [Flamework](https://github.com/rbxts-flamework/core) and [Knit](https://github.com/Sleitnick/Knit) inspired modern game framework created for use in Roblox.\
Written by PolyVector.
</div>

> [!WARNING]  
> Silicon is unfinished and is currently unusable until a semi-stable release is published on the [GitHub releases section](https://github.com/PolyVectors/Silicon)

## Documentation
Documentation, guides and the API Reference will be hosted under [silicon.polyvector.xyz](https://silicon.polyvector.xyz) when the documentation is written to a cohesive and easily readable standard and a release is available under the releases section.
> Documentation for Silicon is mostly hypothetical and real code has most likely not been written for a majority of mentioned features, check the API reference for implemented features.

## Example
```lua
Service "MyCoolService" { Implements.OnStart } {
    [Implements.OnStart] = function()
        print("Game has started!")
    end
}

Silicon.start()
```
> The method `start` under `Silicon` is currently missing