--!strict

--- @class Implements
--- A subclass contained under the main Silicon class that handles the implementation for default events.
local Implements = {}

--[=[
	@within Implements
	@type Implements "OnStart" | "OnPlayerAdded" | "OnCharacterAdded"

	This type dictates all of the default events that can be implemented into a Service or Controller.
]=]
export type Implements = "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

--[=[
	@within Implements
	@prop OnStart Implements
	@readonly

	An implementation that fires when Silicon starts.
]=]
Implements.OnStart = "_OnStart"

--[=[
	@within Implements
	@prop OnPlayerAdded Implements
	@readonly

	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.
]=]
Implements.OnPlayerAdded = "_OnPlayerAdded"

--[=[
	@within Implements
	@prop OnCharacterAdded Implements
	@readonly

	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.
]=]
Implements.OnCharacterAdded = "_OnCharacterAdded"

--[=[
	@within Implements
	@prop None Implements
	@readonly

	Does nothing.
]=]
Implements.None = ""

function Implements.GetImplements(): { [Implements]: Implements }
	return {
		[Implements.OnStart] = Implements.OnStart,
		[Implements.OnPlayerAdded] = Implements.OnPlayerAdded,
		[Implements.OnCharacterAdded] = Implements.OnCharacterAdded,
	}
end

return Implements
