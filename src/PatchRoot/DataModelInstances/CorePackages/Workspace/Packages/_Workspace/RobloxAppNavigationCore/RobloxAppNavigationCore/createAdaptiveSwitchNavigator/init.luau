local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigationCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local l_createNavigator_0 = v2.createNavigator;
local l_SwitchRouter_0 = v2.SwitchRouter;
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_script_FirstAncestor_0.Views.AdaptiveSwitchView);
return function(v7, v8) --[[ Line: 11 ]] --[[ Name: createAdaptiveSwitchNavigator ]]
    -- upvalues: l_SwitchRouter_0 (copy), l_createNavigator_0 (copy), v6 (copy)
    local v9 = l_SwitchRouter_0(v7, v8);
    return l_createNavigator_0(v6, v9, v8);
end;