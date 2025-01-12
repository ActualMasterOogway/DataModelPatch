local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_TestHelpers_0 = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers;
local v4 = require(script.Parent.mockAnalytics);
local v5 = require(l_script_FirstAncestor_0.Analytics);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_TestHelpers_0 (copy)
    local v8 = v7.mockAnalytics or v4();
    return v2.createElement(v5.Context.Provider, {
        value = v8.value
    }, {
        l_TestHelpers_0.createTreeWithProviders(v6, v7)
    }), v8;
end;