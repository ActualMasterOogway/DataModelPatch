local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigationCore");
local v1 = require(l_script_FirstAncestor_0.createAdaptiveSwitchNavigator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local l_CurrentTabContext_0 = require(l_Parent_0.RobloxAppNavigation).CurrentTabContext;
local v7 = game:DefineFastFlag("MainSwitchNavigationOptionsFix", false);
return function(v8) --[[ Line: 17 ]] --[[ Name: createMainSwitchNavigator ]]
    -- upvalues: v1 (copy), v7 (copy), v4 (copy), v3 (copy), l_CurrentTabContext_0 (copy)
    local v9 = v1(v8, if v7 then {
        keepVisitedScreensMounted = true, 
        resetOnBlur = false, 
        backBehavior = v4.BackBehavior.InitialRoute
    } else {
        defaultNavigationOptions = {
            keepVisitedScreensMounted = true, 
            resetOnBlur = false, 
            backBehavior = v4.BackBehavior.InitialRoute
        }
    });
    local v10 = v3.Component:extend("SwitchNavigatorWrapper");
    v10.router = v9.router;
    v10.render = function(v11) --[[ Line: 38 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), l_CurrentTabContext_0 (ref), v9 (copy)
        local l_state_0 = v11.props.navigation.state;
        local v13 = l_state_0.routes[l_state_0.index];
        return v3.createElement(l_CurrentTabContext_0.Provider, {
            value = v13.routeName
        }, {
            Navigator = v3.createElement(v9, v11.props)
        });
    end;
    return v10;
end;