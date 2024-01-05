"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[770],{89275:e=>{e.exports=JSON.parse('{"functions":[{"name":"Service","desc":"Creates a new Service using currying syntax.\\n\\n```lua\\nService \\"GreetService\\" { Implements.OnPlayerAdded } {\\n\\t[Implements.OnPlayerAdded] = function(player: Player)\\n\\t\\tprint(`Hello, {player.Name}`)\\n\\tend\\n}\\n```","params":[{"name":"name","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"(implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any } | props) -> Singleton"}],"function_type":"static","realm":["Server"],"source":{"line":39,"path":"src/silicon/init.luau"}},{"name":"Controller","desc":"Creates a new controller using currying syntax.\\n\\n```lua\\nController \\"GreetController\\" { Implements.OnStart } {\\n\\t[Implements.OnStart] = function(player: Player)\\n\\t\\tprint(`Hello, {player.Name}`)\\n\\tend\\n}\\n```","params":[{"name":"name","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"(implements: { string | Implements }) -> (props: { [string | Implements]: (...any) -> any | props}) -> Singleton"}],"function_type":"static","realm":["Client"],"source":{"line":64,"path":"src/silicon/init.luau"}}],"properties":[],"types":[],"name":"Silicon","desc":"A class containing all the methods and props that are used by Silicon.","source":{"line":16,"path":"src/silicon/init.luau"}}')}}]);