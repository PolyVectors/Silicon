local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

local Singleton = {}
Singleton.__index = Singleton

function Singleton._new(name: string, implements: { Implements | string }, props: { [string]: (...string) -> nil })
	local newSingleton = {
		_name = name,
		_implements = implements,
	}

	for propName, prop in props do
		newSingleton[propName] = prop
	end

	return setmetatable(newSingleton, Singleton)
end

return Singleton
