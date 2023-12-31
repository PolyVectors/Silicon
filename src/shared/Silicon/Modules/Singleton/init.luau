--!strict
local Implements = require(script.Parent.Implements)
type Implements = Implements.Implements

--[=[
	@class Singleton
	A generic class used to create Services/Controllers internally.
]=]
local Singleton = {}

--[=[
	@within Singleton
	@type Singleton { _Name: string, _Implements: { Implements.Implements | string }, _Functions: { [string]: (...any) -> any } }
	@private

	This type denotes a generic type which can be derived to define a Service or a Controller.
]=]
export type Singleton = {
	_name: string,
	_implements: { Implements | string },
	_functions: { [string | Implements]: (...any) -> any },
}

return Singleton
