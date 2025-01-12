local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.SocialTabContext);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v4.Roact;
local l_Rodux_0 = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local l_Mock_0 = v4.Mock;
local v9 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_UnitTestHelpers_0 = require(l_script_FirstAncestor_0.devDependencies).UnitTestHelpers;
local v14 = l_Rodux_0.Store.new(function(v12, _) --[[ Line: 20 ]]
    return v12;
end, {
    ScreenSize = Vector2.new(100, 100)
}, {
    l_Rodux_0.thunkMiddleware
});
return function(v15, v16) --[[ Line: 32 ]]
    -- upvalues: l_Mock_0 (copy), l_mockApolloClient_0 (copy), l_Roact_0 (copy), v9 (copy), l_RoactRodux_0 (copy), v14 (copy), l_UnitTestHelpers_0 (copy), v4 (copy), v1 (copy), v2 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v18 = l_Mock_0.MagicMock.new();
    local v19 = l_mockApolloClient_0({});
    v18.wideMode = true;
    v18.isLuaProfilePageEnabled = true;
    local v20 = l_Roact_0.createFragment({
        l_Roact_0.createElement(v9.ApolloProvider, {
            client = v19
        }, {
            storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v16.store or v14
            }, {
                styleProvider = l_UnitTestHelpers_0.createStyleProvider({
                    policyProvider = l_Roact_0.createElement(v4.UniversalAppPolicy.Provider, {
                        policy = v16.policy or {
                            function() --[[ Line: 51 ]]
                                return {
                                    getShowDisplayName = function() --[[ Line: 53 ]] --[[ Name: getShowDisplayName ]]
                                        return true;
                                    end, 
                                    getFriendFinder = function() --[[ Line: 56 ]] --[[ Name: getFriendFinder ]]
                                        return true;
                                    end, 
                                    getAccountProviderName = function() --[[ Line: 59 ]] --[[ Name: getAccountProviderName ]]
                                        return "";
                                    end, 
                                    shouldInviteFromAccountProvider = function() --[[ Line: 62 ]] --[[ Name: shouldInviteFromAccountProvider ]]
                                        return true;
                                    end, 
                                    getShouldShowGroupsTile = function() --[[ Line: 65 ]] --[[ Name: getShouldShowGroupsTile ]]
                                        return true;
                                    end, 
                                    getChatHeaderNotifications = function() --[[ Line: 68 ]] --[[ Name: getChatHeaderNotifications ]]
                                        return true;
                                    end, 
                                    getContactImporterEnabled = function() --[[ Line: 71 ]] --[[ Name: getContactImporterEnabled ]]
                                        return true;
                                    end, 
                                    getWebViewSupport = function() --[[ Line: 74 ]] --[[ Name: getWebViewSupport ]]
                                        return true;
                                    end, 
                                    getNotificationsCanReceiveStream = function() --[[ Line: 77 ]] --[[ Name: getNotificationsCanReceiveStream ]]
                                        return true;
                                    end
                                };
                            end
                        }
                    }, {
                        analyticsProvider = l_Roact_0.createElement(v1.Context.Provider, {
                            value = l_Mock_0.MagicMock.new()
                        }, {
                            socialTabContext = l_Roact_0.createElement(v2.Provider, {
                                value = v18
                            }, {
                                myElement = l_Roact_0.createElement(v15, v16.props)
                            })
                        })
                    })
                })
            })
        })
    });
    local v21 = l_Roact_0.mount(l_UnitTestHelpers_0.mockLocale(v20), l_ScreenGui_0);
    return l_ScreenGui_0, function() --[[ Line: 100 ]]
        -- upvalues: l_Roact_0 (ref), v21 (copy), l_ScreenGui_0 (copy)
        l_Roact_0.unmount(v21);
        l_ScreenGui_0:Destroy();
    end;
end;