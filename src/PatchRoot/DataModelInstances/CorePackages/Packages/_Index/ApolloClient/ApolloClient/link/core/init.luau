local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_DEV_0 = require(l_Parent_0.utilities).DEV;
l_invariant_0(typeof(l_DEV_0) == "boolean", (tostring(l_DEV_0)));
v0.empty = require(script.empty).empty;
v0.from = require(script.from).from;
v0.split = require(script.split).split;
v0.concat = require(script.concat).concat;
v0.execute = require(script.execute).execute;
v0.ApolloLink = require(script.ApolloLink).ApolloLink;
local v6 = require(script.types);
l_Object_0.assign(v0, v6);
return v0;