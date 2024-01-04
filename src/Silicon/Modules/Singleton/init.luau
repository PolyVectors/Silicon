local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

local Singleton: Singleton = {}
Singleton.__index = Singleton

export type Singleton = {
	_name: string,
	_implements: { Implements | string },
	_new: (name: string, implements: { Implements | string }, props: (...any) -> any | any) -> Singleton,
}

function Singleton._new(name: string, implements: { Implements | string }, props: { (...any) -> any | any }): Singleton
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
