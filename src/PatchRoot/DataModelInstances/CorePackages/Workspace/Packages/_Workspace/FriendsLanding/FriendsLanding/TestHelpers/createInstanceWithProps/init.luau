local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.devDependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local l_UnitTestHelpers_0 = v3.UnitTestHelpers;
local v8 = require(l_script_FirstAncestor_0.installReducer);
local v9 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
return function(v11) --[[ Line: 19 ]]
    -- upvalues: l_Roact_0 (copy), l_Rodux_0 (copy), v8 (copy), l_UnitTestHelpers_0 (copy), v9 (copy), l_mockApolloClient_0 (copy), l_RoactRodux_0 (copy)
    return function(v12, v13, v14) --[[ Line: 20 ]]
        -- upvalues: l_Roact_0 (ref), l_Rodux_0 (ref), v8 (ref), l_UnitTestHelpers_0 (ref), v9 (ref), l_mockApolloClient_0 (ref), l_RoactRodux_0 (ref), v11 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = game:GetService("CoreGui");
        local v16 = nil;
        v16 = if not v14 then l_Roact_0.createElement(v12, v13) else l_Roact_0.createElement("Frame", {
            Size = v14
        }, {
            testElement = l_Roact_0.createElement(v12, v13)
        });
        local v18 = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
            FriendsLanding = v8(), 
            LocalUserId = function(v17) --[[ Line: 38 ]] --[[ Name: LocalUserId ]]
                return v17;
            end
        }), {}, {
            l_Rodux_0.thunkMiddleware
        });
        local v19 = l_Roact_0.createFragment({
            styleProvider = l_UnitTestHelpers_0.createStyleProvider({
                apolloClient = l_Roact_0.createElement(v9.ApolloProvider, {
                    client = l_mockApolloClient_0({})
                }, {
                    StoreProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                        store = v18
                    }, {
                        myElement = v16
                    })
                })
            })
        });
        local v20 = l_Roact_0.mount(v11(v19), l_ScreenGui_0);
        return l_ScreenGui_0, function() --[[ Line: 60 ]]
            -- upvalues: l_Roact_0 (ref), v20 (copy), l_ScreenGui_0 (copy)
            l_Roact_0.unmount(v20);
            l_ScreenGui_0:Destroy();
        end;
    end;
end;