local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.React);
local l_useLazyRef_0 = require(l_Parent_0.UIBlox).Core.Hooks.useLazyRef;
local v5 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Hooks.useProcessNavigationStateChange);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function(v7) --[[ Line: 22 ]] --[[ Name: RnBypassAdapter ]]
    -- upvalues: l_useNavigation_0 (copy), l_useLazyRef_0 (copy), v3 (copy), v5 (copy)
    local l_rnBypassActionSignal_0 = v7.rnBypassActionSignal;
    local v9 = l_useNavigation_0();
    local v11 = l_useLazyRef_0(function() --[[ Line: 26 ]]
        -- upvalues: l_rnBypassActionSignal_0 (copy), v9 (copy)
        return l_rnBypassActionSignal_0:connect(function(v10) --[[ Line: 27 ]]
            -- upvalues: v9 (ref)
            v9.dispatch(v10);
        end);
    end);
    v3.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v11 (copy)
        v11.current:disconnect();
    end, {});
    v3.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_rnBypassActionSignal_0 (copy), v9 (copy)
        local v13 = l_rnBypassActionSignal_0:connect(function(v12) --[[ Line: 38 ]]
            -- upvalues: v9 (ref)
            v9.dispatch(v12);
        end);
        return function() --[[ Line: 42 ]]
            -- upvalues: v13 (copy)
            v13:disconnect();
        end;
    end, {
        v9, 
        l_rnBypassActionSignal_0
    });
    local v14 = v5(v7.ApplyRoactNavigationHistory, v7.updateRoute);
    v3.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v14 (copy), v9 (copy)
        v14(nil, v9.state, nil);
    end, {
        v9.state
    });
    return nil;
end;