local Implements = {}
export type Implements = "OnStart" | "OnPlayerAdded" | "OnCharacterAdded"

function Implements.OnStart(): { Implements }
	return { "OnStart" }
end

function Implements.OnPlayerAdded(): { Implements }
	return { "OnPlayerAdded" }
end

function Implements.OnCharacterAdded(): { Implements }
	return { "OnCharacterAdded" }
end

return Implements
