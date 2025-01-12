local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent;
local l_Reducers_0 = l_Parent_0.Reducers;
local v7 = require(l_Reducers_0.Reducer);
local l_Connection_0 = script.Parent.Components.Connection;
local l_Provider_0 = require(l_Connection_0.LayoutValues).Provider;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_mockApolloClient_0 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_Array_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array;
local v13 = require(l_Parent_0.CreateLayoutValues);
return function(v14) --[[ Line: 28 ]] --[[ Name: TestProviders ]]
    -- upvalues: v2 (copy), v7 (copy), l_mockApolloClient_0 (copy), l_Array_0 (copy), v1 (copy), v3 (copy), l_ApolloProvider_0 (copy), l_Provider_0 (copy), v13 (copy), v4 (copy)
    local v15 = v2.Store.new(v7);
    local v23 = l_mockApolloClient_0({
        mockResolvers = {
            Query = {
                userProfiles = function(_, v17, _, _) --[[ Line: 33 ]] --[[ Name: userProfiles ]]
                    -- upvalues: l_Array_0 (ref)
                    return (l_Array_0.map(v17.userIds, function(v20) --[[ Line: 34 ]]
                        return {
                            userId = v20, 
                            names = {
                                alias = ("alias%*"):format(v20), 
                                combinedName = ("combinedName%*"):format(v20), 
                                contactName = ("contactName%*"):format(v20), 
                                displayName = ("displayName%*"):format(v20), 
                                username = ("username%*"):format(v20), 
                                platformName = ("platformName%*"):format(v20), 
                                inExperienceCombinedName = ("inExperienceCombinedName%*"):format(v20)
                            }
                        };
                    end));
                end
            }, 
            UserProfile = {
                id = function(v21) --[[ Line: 52 ]] --[[ Name: id ]]
                    return (tostring(v21.userId));
                end, 
                names = function(v22) --[[ Line: 55 ]] --[[ Name: names ]]
                    return v22.names;
                end
            }
        }
    });
    return v1.createElement(v3.StoreProvider, {
        store = v14.store or v15
    }, {
        ApolloProvider = v1.createElement(l_ApolloProvider_0, {
            client = v14.client or v23
        }, {
            LayoutValuesProvider = v1.createElement(l_Provider_0, {
                layoutValues = v14.layoutValues or v13(false)
            }, {
                ThemeProvider = v1.createElement(v4.Style.Provider, {}, v14.children)
            })
        })
    });
end;