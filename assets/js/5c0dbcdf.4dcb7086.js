"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[557],{3905:(e,t,n)=>{n.d(t,{Zo:()=>m,kt:()=>y});var r=n(67294);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,r,o=function(e,t){if(null==e)return{};var n,r,o={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(o[n]=e[n]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(o[n]=e[n])}return o}var c=r.createContext({}),s=function(e){var t=r.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},m=function(e){var t=s(e.components);return r.createElement(c.Provider,{value:t},e.children)},p="mdxType",u={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},f=r.forwardRef((function(e,t){var n=e.components,o=e.mdxType,a=e.originalType,c=e.parentName,m=l(e,["components","mdxType","originalType","parentName"]),p=s(n),f=o,y=p["".concat(c,".").concat(f)]||p[f]||u[f]||a;return n?r.createElement(y,i(i({ref:t},m),{},{components:n})):r.createElement(y,i({ref:t},m))}));function y(e,t){var n=arguments,o=t&&t.mdxType;if("string"==typeof e||o){var a=n.length,i=new Array(a);i[0]=f;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l[p]="string"==typeof e?e:o,i[1]=l;for(var s=2;s<a;s++)i[s]=n[s];return r.createElement.apply(null,i)}return r.createElement.apply(null,n)}f.displayName="MDXCreateElement"},27523:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>c,contentTitle:()=>i,default:()=>u,frontMatter:()=>a,metadata:()=>l,toc:()=>s});var r=n(87462),o=(n(67294),n(3905));const a={sidebar_position:4},i="Silicon Versus Other Frameworks",l={unversionedId:"silicon-vs-other-frameworks",id:"silicon-vs-other-frameworks",title:"Silicon Versus Other Frameworks",description:"This page is a small collection of examples from frameworks that were huge inspirations for Silicon compared to a versions that were ported to Silicon itself.",source:"@site/docs/silicon-vs-other-frameworks.md",sourceDirName:".",slug:"/silicon-vs-other-frameworks",permalink:"/docs/silicon-vs-other-frameworks",draft:!1,editUrl:"https://github.com/PolyVectors/Silicon/edit/main/docs/silicon-vs-other-frameworks.md",tags:[],version:"current",sidebarPosition:4,frontMatter:{sidebar_position:4},sidebar:"defaultSidebar",previous:{title:"Silicon By Example",permalink:"/docs/silicon-by-example"}},c={},s=[{value:"Money Service (from Knit)",id:"money-service-from-knit",level:2},{value:"Boilerplate Showcase (from Flamework)",id:"boilerplate-showcase-from-flamework",level:2}],m={toc:s},p="wrapper";function u(e){let{components:t,...n}=e;return(0,o.kt)(p,(0,r.Z)({},m,n,{components:t,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"silicon-versus-other-frameworks"},"Silicon Versus Other Frameworks"),(0,o.kt)("p",null,"This page is a small collection of examples from frameworks that were huge inspirations for Silicon compared to a versions that were ported to Silicon itself."),(0,o.kt)("h2",{id:"money-service-from-knit"},"Money Service (from ",(0,o.kt)("a",{parentName:"h2",href:"https://github.com/Sleitnick/Knit"},"Knit"),")"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)\n\n-- Create the service:\nlocal MoneyService = Knit.CreateService {\n    Name = "MoneyService",\n}\n\n-- Add some methods to the service:\n\nfunction MoneyService:GetMoney(player)\n    -- Do some sort of data fetch\n    local money = someDataStore:GetAsync("money")\n    return money\nend\n\nfunction MoneyService:GiveMoney(player, amount)\n    -- Do some sort of data fetch\n    local money = self:GetMoney(player)\n    money += amount\n    someDataStore:SetAsync("money", money)\nend\n\nKnit.Start():catch(warn)\n')),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"Knit (from ",(0,o.kt)("a",{parentName:"p",href:"https://github.com/Sleitnick/Knit/blob/main/README.md"},"README.md"),")")),(0,o.kt)("p",null,"This example shows the clever usage of ",(0,o.kt)("a",{parentName:"p",href:"https://github.com/evaera/roblox-lua-promise"},"Promises")," in Knit which means that any errors caused by Knit services are caught safely by the ",(0,o.kt)("inlineCode",{parentName:"p"},"warn")," function.\nSilicon takes this idea, an example of inspiration taken from Knit."),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'local Silicon = require(game:GetService("ReplicatedStorage").Packages.Silicon)\n\nlocal Service = Silicon.Service.Service\nlocal Implements = Silicon.Implements\n\n--- Create the service:\nService "MoneyService" { Implements.None } {\n    -- Add some methods to the service:\n\n    GetMoney = function(player: Player)\n        -- Do some sort of data fetch\n        local money = someDataStore:GetAsync("money")\n        return money\n    end\n\n    GiveMoney = function()\n        -- Do some sort of data fetch\n        local money = self:GetMoney(player: Player, amount: string)\n        money += amount\n        someDataStore:SetAsync("money", money)\n    end\n}\n\nSilicon.Start():catch(warn)\n')),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"Silicon 0.1.0.alpha.3")),(0,o.kt)("h2",{id:"boilerplate-showcase-from-flamework"},"Boilerplate Showcase (from ",(0,o.kt)("a",{parentName:"h2",href:"https://github.com/rbxts-flamework/core"},"Flamework"),")"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-ts"},"@Service()\nexport class MyService {}\n")),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"Flamework (from ",(0,o.kt)("a",{parentName:"p",href:"https://fireboltofdeath.dev/docs/flamework"},"Flamework docs"),")")),(0,o.kt)("p",null,"The lack of boilerplate in Flamework is a huge inspiration for Silicon.\nSilicon also takes more inspiration from Flamework due to its awesome type safe networking model."),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'Service "MyService" {} {}\n')),(0,o.kt)("p",null,"or an alternative:"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'Service "MyService" { Implements.None } {}\n')),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"Silicon 0.1.0.alpha.3")))}u.isMDXComponent=!0}}]);