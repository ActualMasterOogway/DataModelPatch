local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTestHelpers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_RoactNavigation_0 = v2.RoactNavigation;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Rodux_0 = v2.Rodux;
local l_LocalizationProvider_0 = v2.LocalizationProvider;
local l_Mock_0 = v2.Mock;
local l_UnitTestHelpers_0 = v2.UnitTestHelpers;
local l_mockNavigation_0 = l_UnitTestHelpers_0.mockNavigation;
local v11 = require(l_Parent_0.Foundation);
local l_createStyleProvider_0 = l_UnitTestHelpers_0.createStyleProvider;
local l_ApolloProvider_0 = v2.ApolloClient.ApolloProvider;
local l_mockApolloClient_0 = v2.GraphQLServer.ApolloClientTestUtils.mockApolloClient;
local l_FoundationProvider_0 = v11.FoundationProvider;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v17 = l_Mock_0.MagicMock.new({
    name = "Localization"
});
v17.Format = function(_, v19, _) --[[ Line: 25 ]]
    return v19;
end;
local function v22(v21) --[[ Line: 29 ]]
    -- upvalues: l_Rodux_0 (copy)
    return l_Rodux_0.Store.new(function() --[[ Line: 30 ]]
        -- upvalues: v21 (copy)
        return v21;
    end, {}, {
        l_Rodux_0.thunkMiddleware
    });
end;
local v23 = l_Rodux_0.Store.new(function() --[[ Line: 35 ]]
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v24, v25) --[[ Line: 39 ]]
    -- upvalues: l_Roact_0 (copy), l_RoactRodux_0 (copy), v22 (copy), v23 (copy), l_createStyleProvider_0 (copy), l_LocalizationProvider_0 (copy), v17 (copy), l_ApolloProvider_0 (copy), l_mockApolloClient_0 (copy), l_DesignTokenProvider_0 (copy), l_RoactNavigation_0 (copy), l_mockNavigation_0 (copy), l_FoundationProvider_0 (copy)
    local v26 = l_Roact_0.createFragment({
        storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = if v25.state then v22(v25.state) else v25.store or v23
        }, {
            styleProvider = l_createStyleProvider_0({
                localizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                    localization = v17
                }, {
                    apolloClient = l_Roact_0.createElement(l_ApolloProvider_0, {
                        client = v25.apolloClient or l_mockApolloClient_0({})
                    }, {
                        designTokenProvider = l_Roact_0.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            myElement = if v25.navigation then l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
                                value = v25.navigation
                            }, l_Roact_0.createElement(v24, v25.props)) else l_mockNavigation_0(l_Roact_0.createElement(v24, v25.props))
                        })
                    })
                })
            })
        })
    });
    if v25.includeFoundationProvider then
        v26 = l_Roact_0.createElement(l_FoundationProvider_0, {
            device = "Phone", 
            theme = "Dark"
        }, v26);
    end;
    if v25.mockProvider then
        v26 = v25.mockProvider(v26);
    end;
    return v26;
end;