--[=[
	@class EventType
	A subclass contained under the main Bridge class that handles the implementation for default events.
]=]
local EventType = {}

--[=[
	@within EventType
	@type EventType "OnStart" | "OnPlayerAdded" | "OnCharacterAdded" | "None"

	This type dictates all of the default events that can be implemented into a Bridge.
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

return EventType
