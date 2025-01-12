local l_Parent_0 = script.Parent.Parent;
return {
    JestGlobals = require(l_Parent_0.Dev.JestGlobals), 
    ReactRoblox = require(l_Parent_0.Dev.ReactRoblox), 
    Mock = require(l_Parent_0.LuaSocialLibrariesDeps).Mock, 
    UnitTestHelpers = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers, 
    RhodiumHelpers = function() --[[ Line: 9 ]] --[[ Name: RhodiumHelpers ]]
        -- upvalues: l_Parent_0 (copy)
        return require(l_Parent_0.Dev.RhodiumHelpers);
    end, 
    DeferredLuaHelpers = require(l_Parent_0.Dev.TestUtils).DeferredLuaHelpers
};