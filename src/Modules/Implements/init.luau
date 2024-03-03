--!strict

--[=[
	@class Implements
	A subclass contained under the main Silicon class that handles the implementations for Singletons.
]=]
local Implements = {}

--[=[
	@within Implements
	@type Implements "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

	This type dictates all of the default implementations that can be implemented into a Service/Controller.
]=]
export type Implements = "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

--[=[
	@within Implements
	@prop OnStart Implements
	@readonly

	An implementation that fires when Silicon starts.
]=]
Implements.OnStart = "OnStart"

--[=[
	@within Implements
	@prop OnPlayerAdded Implements
	@readonly

	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.
]=]
Implements.OnPlayerAdded = "OnPlayerAdded"

--[=[
	@within Implements
	@prop OnCharacterAdded Implements
	@readonly

	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.
]=]
Implements.OnCharacterAdded = "OnCharacterAdded"

--[=[
	@within Implements
	@prop None Implements
	@readonly

	Does nothing.
]=]
Implements.None = ""

function Implements.GetImplements(): { [Implements]: Implements }
	return {
		[Implements.OnStart :: Implements] = Implements.OnStart :: Implements,
		[Implements.OnPlayerAdded :: Implements] = Implements.OnPlayerAdded :: Implements,
		[Implements.OnCharacterAdded :: Implements] = Implements.OnCharacterAdded :: Implements,
	}
end

return Implements
