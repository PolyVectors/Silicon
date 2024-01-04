--- @class EventType
--- A subclass contained under the main Bridge class that handles the implementation for default events.
local EventType = {}

--[=[
	@within Implements
	@type Implements "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

	This type dictates all of the default events that can be implemented into a Service or Controller.
]=]
export type EventType = "ServerToClient" | "ClientToServer"

--[=[
	@within EventType
	@prop ServerToClient EventType
	@readonly

	A bridge type that handles one way messages from the server to the client.
]=]
EventType.ServerToClient = "ServerToClient"

--[=[
	@within EventType
	@prop ClientToServer EventType
	@readonly

	A bridge type that handles one way messages from the client to the server.
]=]
EventType.ClientToServer = "ClientToServer"

function EventType.GetEvents()
	return {
		ServerToClient = EventType.ServerToClient,
		ClientToServer = EventType.ClientToServer,
	}
end

return EventType
