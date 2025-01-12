local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local l_expect_0 = v1.expect;
return {
    ApolloClient = require(l_Parent_0.Dev.ApolloClient), 
    DeferredLuaHelpers = require(l_Parent_0.Dev.TestUtils).DeferredLuaHelpers, 
    GraphQLServer = require(l_Parent_0.Dev.GraphQLServer), 
    JestGlobals = v1, 
    Rhodium = require(l_Parent_0.Dev.Rhodium), 
    RhodiumHelpers = function() --[[ Line: 13 ]] --[[ Name: RhodiumHelpers ]]
        -- upvalues: l_Parent_0 (copy)
        return require(l_Parent_0.Dev.RhodiumHelpers);
    end, 
    UnitTestHelpers = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers, 
    createTreeWithProviders = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders, 
    findImageSet = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.findImageSet, 
    jest = v1.jest, 
    jestExpect = l_expect_0
};