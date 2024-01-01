--!strict
local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

--[=[
	@class Singleton
	A generic class used to create Services/Controllers internally.
]=]
local Singleton: Singleton = {}
Singleton.__index = Singleton

--[=[
	@within Singleton
	@type Singleton { _name: string, _implements: { Implements.Implements | string }, _props: { [string]: (...any) -> any }, AddProp: (prop: (...any) -> any | any ) -> nil }
	@private

	This type denotes a generic type which can be derived to define a Service or a Controller.
]=]

export type Singleton = {
	_name: string,
	_implements: { Implements | string },
	_props: { [string | Implements]: (...any) -> any | any },

	New: (name: string, implements: { Implements | string }, props: (...any) -> any | any) -> Singleton,

	Method: (self: Singleton, methodName: string) -> (method: (...any) -> any) -> nil,
	SetProp: (self: Singleton, propName: string) -> (prop: (...any) -> any | any) -> nil,
	GetProp: (self: Singleton, propName: string) -> (...any) -> any | any,
}

function Singleton._new(name: string, implements: { Implements | string }, props: { (...any) -> any | any }): Singleton
	return setmetatable({
		_name = name,
		_implements = implements,
		_props = props,
	}, Singleton)
end

function Singleton.SetMethod(self, methodName: string): (method: (...any) -> any) -> nil
	return function(method: (...any) -> any | any)
		self._props[methodName] = method
	end
end

function Singleton.SetProp(self, propName: string): (prop: any) -> nil
	return function(prop: (...any) -> any | any)
		self._props[propName] = prop
	end
end

function Singleton:GetProp(propName: string): (...any) -> any | any
	return self._props[propName]
end

return Singleton
