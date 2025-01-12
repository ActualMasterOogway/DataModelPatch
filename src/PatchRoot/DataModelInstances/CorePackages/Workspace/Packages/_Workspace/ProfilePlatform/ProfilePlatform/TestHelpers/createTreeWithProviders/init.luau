local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_createTreeWithProviders_0 = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy), l_createTreeWithProviders_0 (copy)
    return v1.createElement(v2.FoundationProvider, {
        device = "Phone", 
        theme = "Dark"
    }, {
        Element = l_createTreeWithProviders_0(v4, v5)
    });
end;