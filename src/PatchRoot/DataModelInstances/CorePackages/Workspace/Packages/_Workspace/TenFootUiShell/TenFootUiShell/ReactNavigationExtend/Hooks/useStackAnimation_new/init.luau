local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local l_useEarlyIsFocused_0 = require(l_Parent_0.Navigation).useEarlyIsFocused;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v6 = require(l_ReactNavigationExtend_0.Views.RouteViewState);
local v7 = require(l_ReactNavigationExtend_0.Views.Constants);
local v8 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v9 = {
    FRONT_HIDDEN = -1, 
    CENTER_VISIBLE = 0, 
    BACK_HIDDEN = 1
};
local l_FRONT_HIDDEN_0 = v9.FRONT_HIDDEN;
local function _(v11) --[[ Line: 28 ]] --[[ Name: getSpringTarget ]]
    -- upvalues: v9 (copy)
    if v11 then
        return v9.CENTER_VISIBLE;
    else
        return v9.BACK_HIDDEN;
    end;
end;
return function(v13) --[[ Line: 32 ]] --[[ Name: useStackAnimation ]]
    -- upvalues: v2 (copy), v3 (copy), l_FRONT_HIDDEN_0 (copy), v6 (copy), v9 (copy), v7 (copy), l_useEarlyIsFocused_0 (copy), v8 (copy)
    local l_isTopOfStack_0 = v13.isTopOfStack;
    local l_totalInStack_0 = v13.totalInStack;
    local l_viewState_0 = v13.viewState;
    local v17, v18 = v2.useState(false);
    local v19 = l_isTopOfStack_0 or v17;
    local v20 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v18 (copy)
        v13.onAnimationComplete();
        v18(false);
    end, {
        v13.onAnimationComplete
    });
    local v21, v22 = v3.useAnimatedBinding(l_FRONT_HIDDEN_0, v20);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: l_viewState_0 (copy), v6 (ref), v18 (copy), v22 (copy), v3 (ref), l_isTopOfStack_0 (copy), v9 (ref), v7 (ref)
        if l_viewState_0 == v6.ViewState.Opening or l_viewState_0 == v6.ViewState.Opened then
            v18(true);
            v22(v3.spring(if l_isTopOfStack_0 then v9.CENTER_VISIBLE else v9.BACK_HIDDEN, v7.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            return;
        else
            if l_viewState_0 == v6.ViewState.Closing then
                v18(true);
                v22(v3.spring(v9.FRONT_HIDDEN, v7.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            end;
            return;
        end;
    end, {
        l_viewState_0, 
        l_isTopOfStack_0
    });
    local v23 = l_useEarlyIsFocused_0();
    v2.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy), l_isTopOfStack_0 (copy), v7 (ref), l_totalInStack_0 (copy), v8 (ref)
        if v23 and l_isTopOfStack_0 then
            local v24 = v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v7.Z_DIRECTION_ZOOM_FACTOR;
            local v25 = (l_totalInStack_0 - 1) * v24;
            v8.updateZPosition(-v25);
        end;
    end, {
        v23, 
        l_isTopOfStack_0, 
        l_totalInStack_0
    });
    return v2.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy), v21 (copy), v7 (ref)
        return {
            isVisible = v19, 
            cFrame = v21:map(function(v26) --[[ Line: 71 ]]
                -- upvalues: v7 (ref)
                local v27 = v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v7.Z_DIRECTION_ZOOM_FACTOR * v26;
                return CFrame.new(0, 0, -v27);
            end), 
            transparency = v21:map(function(v28) --[[ Line: 76 ]]
                return (math.abs(v28));
            end)
        };
    end, {
        v19, 
        v21
    });
end;