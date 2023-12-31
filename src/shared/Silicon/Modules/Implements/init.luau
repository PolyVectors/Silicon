--!strict

--- @class Implements
--- A subclass contained under the main Silicon class that handles the implementation for default events.
local Implements = {}

--[=[
	This type dictates all of the default events that can be implemented into a Service or Controller.
	@within Implements

	@type Implements "OnStart" | "OnPlayerAdded" | "OnCharacterAdded"
]=]
export type Implements = "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

--[=[
	An implementation that fires when Silicon starts.

	@within Implements
	@prop OnStart Implements
]=]
Implements.OnStart = "_OnStart"

--[=[
	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.

	@within Implements
	@prop OnPlayerAdded Implements
]=]
Implements.OnPlayerAdded = "_OnPlayerAdded"

--[=[
	An implementation that passes in players as arguments each time the Players.PlayerAdded signal is fired.

	@within Implements
	@prop OnCharacterAdded Implements
]=]
Implements.OnCharacterAdded = "_OnCharacterAdded"

--[=[
	Does nothing.

	@within Implements
	@prop None Implements
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
