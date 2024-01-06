---
sidebar_position: 1
---

# Intro
Silicon is a modern game framework that focuses on being fast and easy. Silicon is inspired by [Fusion](https://github.com/dphfox/Fusion), [Flamework](https://github.com/rbxts-flamework/core) and [Knit](https://github.com/Sleitnick/Knit).
This tutorial will help you to understand how to use Silicon as quickly as possible, while learning important design choices and rules along the way.

## Installation
1. Wally/Rojo Install (Recommended)
   1. Go to the [wally page for Silicon](https://wally.run/package/polyvectors/silicon) and check for the latest release.
   2. Copy the code under the "Install" section and add it to your `wally.toml` file in your Rojo project.
   3. Run `wally install` to install Silicon and its dependencies.
2. Roblox Studio Install (Not Recommended)
   1. If Wally doesn't work for you or your workflow you can still use Silicon
   2. Go to the [releases section](https://github.com/PolyVectors/Silicon/releases) of the repository.
   3. Download the latest release `Silicon.rbxm` file and insert it under `ReplicatedStorage`.

## Project Setup
This setup assumes you are using [Rojo](https://rojo.space), [Wally](https://wally.run) and [Aftman](https://github.com/LPGhatguy/aftman) to manage your game.
Follow these steps to be able to use Silicon in your game:

1. Create a new folder.
2. `cd` into your folder and run the following commands:
   1. `aftman init`
   2. `rojo init`
   3. `rojo build -o build.rbxl`
3. Create the following folders:
   1. 