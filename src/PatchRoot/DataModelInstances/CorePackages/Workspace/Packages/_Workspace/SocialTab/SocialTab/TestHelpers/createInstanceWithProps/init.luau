local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local v6 = require(l_Parent_0.ApolloClient);
local v7 = require(l_Parent_0.GraphQLServer);
local v8 = require(l_Parent_0.UserProfiles);
local l_mockApolloClient_0 = v7.ApolloClientTestUtils.mockApolloClient;
local l_UnitTestHelpers_0 = require(l_script_FirstAncestor_0.devDependencies).UnitTestHelpers;
local v13 = l_Rodux_0.Store.new(function(v11, _) --[[ Line: 17 ]]
    return v11;
end, {
    ScreenSize = Vector2.new(100, 100)
}, {
    l_Rodux_0.thunkMiddleware
});
return function(v14, v15, v16) --[[ Line: 23 ]]
    -- upvalues: l_mockApolloClient_0 (copy), v8 (copy), l_Roact_0 (copy), v6 (copy), l_RoactRodux_0 (copy), v13 (copy), l_UnitTestHelpers_0 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v18 = l_mockApolloClient_0({});
    v18:writeQuery({
        variables = {
            userIds = {
                "1"
            }
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = "1", 
                    names = {
                        __typename = "Names", 
                        combinedName = "Stacey", 
                        username = "This shouldn't show"
                    }
                }
            }
        }
    });
    v18:writeQuery({
        variables = {
            userIds = {
                "test"
            }
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = "test", 
                    names = {
                        __typename = "Names", 
                        combinedName = "DisplayName", 
                        username = "Username"
                    }
                }
            }
        }
    });
    local v19 = nil;
    v19 = if not v16 then l_Roact_0.createElement(v14, v15) else l_Roact_0.createElement("Frame", {
        Size = v16
    }, {
        testElement = l_Roact_0.createElement(v14, v15)
    });
    local v20 = l_Roact_0.createFragment({
        apolloProvider = l_Roact_0.createElement(v6.ApolloProvider, {
            client = v18
        }, {
            storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v13
            }, {
                styleProvider = l_UnitTestHelpers_0.createStyleProvider({
                    myElement = v19
                })
            })
        })
    });
    local v21 = l_Roact_0.mount(l_UnitTestHelpers_0.mockLocale(v20), l_ScreenGui_0);
    return l_ScreenGui_0, function() --[[ Line: 94 ]]
        -- upvalues: l_Roact_0 (ref), v21 (copy), l_ScreenGui_0 (copy)
        l_Roact_0.unmount(v21);
        l_ScreenGui_0:Destroy();
    end;
end;