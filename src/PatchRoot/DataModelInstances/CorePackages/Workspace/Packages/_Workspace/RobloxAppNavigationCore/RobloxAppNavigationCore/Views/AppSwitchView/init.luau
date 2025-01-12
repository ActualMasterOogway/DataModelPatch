local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local l_useSwitchScreenKeys_0 = require(l_Parent_0.TenFootUiShell).Hooks.useSwitchScreenKeys;
local _ = require(l_Parent_0.Navigation);
local v4 = require(script.Parent.AppCard);
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
return function(v6) --[[ Line: 30 ]] --[[ Name: AppSwitchView ]]
    -- upvalues: l_useSwitchScreenKeys_0 (copy), v1 (copy), v4 (copy), l_FFlagEnableRNFocusRestoration_0 (copy)
    local l_descriptors_0 = v6.descriptors;
    local l_state_0 = v6.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v10 = l_useSwitchScreenKeys_0({
        activeKey = l_key_0, 
        descriptors = l_descriptors_0, 
        keepVisitedScreensMounted = v6.navigationConfig.keepVisitedScreensMounted
    });
    local v11 = {};
    for _, v13 in v10 do
        v11[v13] = v1.createElement(v4, {
            isActive = if l_FFlagEnableRNFocusRestoration_0 then v13 == l_key_0 else nil, 
            descriptor = l_descriptors_0[v13], 
            screenProps = v6.screenProps, 
            isVisible = v13 == l_key_0
        });
    end;
    return v11;
end;