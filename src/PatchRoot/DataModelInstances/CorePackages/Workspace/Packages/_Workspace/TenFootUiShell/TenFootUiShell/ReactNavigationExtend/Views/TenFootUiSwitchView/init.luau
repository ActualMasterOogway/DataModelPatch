local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
local v5 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiSwitchViewCard_new);
local v6 = require(l_ReactNavigationExtend_0.Hooks.useSwitchScreenKeys);
local _ = require(l_Parent_0.Navigation);
local function v12(v8) --[[ Line: 17 ]] --[[ Name: useTabIndeces ]]
    -- upvalues: v3 (copy)
    local v9, v10 = v3.useState({
        current = v8, 
        previous = v8
    });
    v3.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v10 (copy), v8 (copy)
        v10(function(v11) --[[ Line: 24 ]]
            -- upvalues: v8 (ref)
            if v8 ~= v11.current then
                return {
                    current = v8, 
                    previous = v11.current
                };
            else
                return v11;
            end;
        end);
    end, {
        v8
    });
    return v9.current, v9.previous;
end;
return function(v13) --[[ Line: 47 ]] --[[ Name: TenFootUiSwitchView ]]
    -- upvalues: v12 (copy), v6 (copy), v3 (copy), v5 (copy)
    local l_descriptors_0 = v13.descriptors;
    local l_navigation_0 = v13.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_index_0 = l_state_0.index;
    local v19, v20 = v12(l_index_0);
    local v21 = v6({
        activeKey = l_key_0, 
        descriptors = l_descriptors_0, 
        keepVisitedScreensMounted = v13.navigationConfig.keepVisitedScreensMounted
    });
    local v22 = {};
    for _, v24 in v21 do
        v22[v24] = v3.createElement(v5, {
            descriptor = l_descriptors_0[v24], 
            screenProps = v13.screenProps, 
            navigation = l_navigation_0, 
            isActiveTab = v24 == l_key_0, 
            currentTabIndex = v19, 
            previousTabIndex = v20
        });
    end;
    return v22;
end;