local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local v2 = require(l_Parent_0.Dev.LuaSocialLibrariesDeps);
v1.expect.extend(v2.CollisionMatchers.Jest);
return {
    JestGlobals = v1, 
    UnitTestHelpers = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers, 
    Rhodium = require(l_Parent_0.Dev.Rhodium), 
    RhodiumHelpers = function() --[[ Line: 13 ]] --[[ Name: RhodiumHelpers ]]
        -- upvalues: l_Parent_0 (copy)
        return require(l_Parent_0.Dev.RhodiumHelpers);
    end, 
    createTreeWithProviders = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
};