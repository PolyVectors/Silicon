--!strict

local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

type SingletonImpl = {
	__index: SingletonImpl,
	_new: (
		name: string,
		implements: { Implements | string },
		props: { [string | Implements]: (...any) -> any | any }
	) -> Singleton,
}

export type Singleton = typeof(setmetatable(
	{} :: { _name: string, _implements: { Implements | string } },
	{} :: SingletonImpl
))

local Singleton: SingletonImpl = {} :: SingletonImpl
Singleton.__index = Singleton

function Singleton._new(name, implements, props)
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
