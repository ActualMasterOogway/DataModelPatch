local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.JestGlobals);
local l_createTreeWithProviders_0 = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
local v4 = require(script.Parent.mockAnalytics);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactAppExperiment);
local l_MagicMock_0 = require(l_Parent_0.LuaSocialLibrariesDeps).Mock.MagicMock;
local l_mockPolicyProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).mockPolicyProvider;
return function(v10, v11) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v2 (copy), v6 (copy), v5 (copy), v7 (copy), l_MagicMock_0 (copy), l_mockPolicyProvider_0 (copy), l_createTreeWithProviders_0 (copy)
    local v12 = v4({
        uid = "123"
    }, v2.jest);
    return v6.createElement(v5.Context.Provider, {
        value = if v11.mockAnalytics then v11.mockAnalytics else v12.value
    }, {
        v6.createElement(v7.Provider, {
            value = l_MagicMock_0.new()
        }, {
            Element = l_mockPolicyProvider_0(l_createTreeWithProviders_0(v10, v11), v11.mockPolicy)
        })
    }), v12;
end;