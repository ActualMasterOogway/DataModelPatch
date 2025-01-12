local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local l_StackRouter_0 = require(l_Parent_0.RoactNavigation).StackRouter;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.LuaAppNavigationActions);
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy), l_StackRouter_0 (copy)
    local v8 = v2.Dictionary.join(v5 or {}, {
        getCustomActionCreators = function(_, _) --[[ Line: 17 ]] --[[ Name: getCustomActionCreators ]]
            -- upvalues: v3 (ref)
            return {
                clearAppScreens = v3.clearAppScreens
            };
        end
    });
    local v9 = l_StackRouter_0(v4, v8);
    local l_getStateForAction_0 = v9.getStateForAction;
    v9.getStateForAction = function(v11, v12) --[[ Line: 26 ]] --[[ Name: getStateForAction ]]
        -- upvalues: v3 (ref), v2 (ref), l_getStateForAction_0 (copy)
        if v11.type == v3.ClearAppScreensAction then
            local v13 = v2.List.toSet(v11.routeNames);
            local v15 = v2.List.filter(v12.routes, function(v14) --[[ Line: 29 ]]
                -- upvalues: v13 (copy)
                return not v13[v14.routeName];
            end);
            return (v2.Dictionary.join(v12, {
                routes = v15, 
                index = #v15
            }));
        else
            return l_getStateForAction_0(v11, v12);
        end;
    end;
    return v9;
end;