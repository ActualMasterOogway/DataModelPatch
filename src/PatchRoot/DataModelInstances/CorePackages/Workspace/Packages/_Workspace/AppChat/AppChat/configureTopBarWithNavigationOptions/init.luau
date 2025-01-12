local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_script_FirstAncestor_0.createChatTopBar);
local v7 = require(l_script_FirstAncestor_0.TopBarContext);
return function(v8) --[[ Line: 56 ]]
    -- upvalues: v5 (copy), v4 (copy), v7 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v9 = v5.getActiveChildNavigationOptions(v8);
    return v4.createElement(v7.Consumer, {
        render = function(v10) --[[ Line: 59 ]] --[[ Name: render ]]
            -- upvalues: v8 (copy), v2 (ref), v6 (ref), v3 (ref), v9 (copy)
            local l_state_0 = v8.state;
            local v12 = l_state_0.routes[l_state_0.index];
            local v13 = v10.getScreenTopBar(v12.routeName);
            v2.isType(v13, "table", "screenTopBar");
            return v6(v3.Dictionary.join(v13, v9, {
                navigation = v8
            }));
        end
    });
end;