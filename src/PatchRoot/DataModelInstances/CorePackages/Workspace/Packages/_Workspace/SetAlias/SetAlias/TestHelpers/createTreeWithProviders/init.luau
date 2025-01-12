local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Analytics);
local l_createTreeWithProviders_0 = require(l_Parent_1.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
local v4 = require(l_Parent_1.React);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy), l_createTreeWithProviders_0 (copy)
    return v4.createElement(v2.Context.Provider, {
        value = v6.mockAnalytics or {}
    }, {
        Element = l_createTreeWithProviders_0(v5, v6)
    });
end;