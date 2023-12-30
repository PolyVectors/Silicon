--!strict

--- @class Implements
--- A subclass contained under the main Silicon class that handles the implementation for default events
local Implements = {}

--[=[
	This type dictates all of the default events that can be implemented into a Service
	@within Implements

	@type Implements "OnStart" | "OnPlayerAdded" | "OnCharacterAdded"
]=]
export type Implements = "OnStart" | "OnPlayerAdded" | "OnCharacterAdded"

--[=[
	Default implementation

	@within Implements
	@prop OnStart Implements
]=]
Implements.OnStart = "OnStart"

--[=[
	Default implementation

	@within Implements
	@prop OnStart Implements
]=]
Implements.OnPlayerAdded = "OnPlayerAdded"

--[=[
	Default implementation

	@within Implements
	@prop OnStart Implements
]=]
Implements.OnCharacterAdded = "OnCharacterAdded"

return Implements
