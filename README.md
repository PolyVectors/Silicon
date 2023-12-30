# Silicon
A [Fusion](https://github.com/dphfox/Fusion) and [Flamework](https://github.com/rbxts-flamework/core) inspired modern game framework created for use in Roblox.\
Written by PolyVector.

## Documentation
Documentation, guides and the API Reference will be hosted under [silicon.polyvector.xyz](https://silicon.polyvector.xyz) when the documentation is written to a cohesive and easily readable standard and a release is available under the releases section.

## Warning
|❗Do not use this framework right now❗|
|-------------------------------------------------------------------------------------------------------------|
| Silicon should not be used under any circumstances until a semi-stable release is published on the [GitHub releases section](https://github.com/PolyVectors/Silicon) |
> Documentation for Silicon is mostly hypothetical and real code has most likely not been written for a majority of mentioned features, check the API reference for implemented features.

## Example
```lua
Service "MyCoolService" Implements.OnStart() {
    OnStart = function()
        print("Game has started!")
    end
}

Silicon.start()
```
> The method `start` under `Silicon` is currently missing