local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v5 = require(l_Parent_0.UIBlox);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_LayerCollectorProvider_0 = v5.Core.Layout.LayerCollector.LayerCollectorProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.UniversalAppPolicy);
local v11 = require(l_Parent_0.SocialPolicies);
local v12 = require(l_Parent_0.UserProfiles);
local v13 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local v15 = require(l_Parent_0.Rodux);
local v16 = require(l_Parent_0.RoactRodux);
local v17 = require(l_Parent_0.RoactNavigation);
local v18 = {
    withUiModeSupport = false
};
return function(v19) --[[ Line: 47 ]] --[[ Name: MockProviders ]]
    -- upvalues: v9 (copy), v18 (copy), l_FoundationProvider_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Signal_0 (copy), l_LayerCollectorProvider_0 (copy), v16 (copy), v15 (copy), v10 (copy), v11 (copy), l_mockApolloClient_0 (copy), v12 (copy), v13 (copy), v17 (copy), v1 (copy), l_ProviderContainer_0 (copy)
    local v20 = v9.Dictionary.union(v18, v19);
    local v21 = {};
    table.insert(v21, {
        class = l_FoundationProvider_0, 
        props = {}
    });
    table.insert(v21, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true, 
            withUiModeSupport = v20.withUiModeSupport
        }
    });
    table.insert(v21, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v23) --[[ Line: 68 ]] --[[ Name: Format ]]
                    return v23;
                end, 
                changed = l_Signal_0.new()
            }
        }
    });
    table.insert(v21, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    table.insert(v21, {
        class = v16.StoreProvider, 
        props = {
            store = v20.rodux and v20.rodux.store or v15.Store.new(function() --[[ Line: 84 ]]
                -- upvalues: v20 (copy)
                return v20.rodux and v20.rodux.state or {};
            end, v20.rodux and v20.rodux.state, {
                v15.thunkMiddleware
            })
        }
    });
    table.insert(v21, {
        class = v10.RoactAppPolicy.Provider, 
        props = {
            policy = {
                v10.AppFeaturePolicies, 
                v11.ChatPolicies
            }
        }
    });
    local v24 = l_mockApolloClient_0({});
    v12.TestUtils.writeProfileDataToCache(v24, {
        ["1989"] = {
            combinedName = "Test Primary Name", 
            alias = "Test Primary Name", 
            contactName = "Test Contact Name", 
            displayName = "Test Display Name", 
            username = "username"
        }, 
        ["1969"] = {
            combinedName = "OrangeClement", 
            alias = "OrangeClement", 
            contactName = "Test Contact Name", 
            displayName = "ClementOrange", 
            username = "username"
        }, 
        ["1949"] = {
            combinedName = "AzurePine", 
            alias = "AzurePine", 
            contactName = "Test Contact Name", 
            displayName = "PineAzure", 
            username = "username"
        }
    });
    table.insert(v21, {
        class = v13.ApolloProvider, 
        props = {
            client = v24
        }
    });
    table.insert(v21, {
        class = v17.Provider, 
        props = {
            value = {
                state = {
                    params = {}, 
                    routeName = "", 
                    key = ""
                }, 
                dispatch = function() --[[ Line: 139 ]] --[[ Name: dispatch ]]

                end, 
                goBack = function() --[[ Line: 140 ]] --[[ Name: goBack ]]

                end, 
                addListener = function() --[[ Line: 141 ]] --[[ Name: addListener ]]

                end, 
                isFocused = function() --[[ Line: 142 ]] --[[ Name: isFocused ]]

                end, 
                setParams = function() --[[ Line: 143 ]] --[[ Name: setParams ]]

                end, 
                getParam = function() --[[ Line: 144 ]] --[[ Name: getParam ]]

                end, 
                replace = function() --[[ Line: 145 ]] --[[ Name: replace ]]

                end, 
                push = function() --[[ Line: 146 ]] --[[ Name: push ]]

                end, 
                getScreenProps = function() --[[ Line: 147 ]] --[[ Name: getScreenProps ]]

                end
            }
        }
    });
    return v1.createElement(l_ProviderContainer_0, {
        providers = v21
    }, v20.children);
end;