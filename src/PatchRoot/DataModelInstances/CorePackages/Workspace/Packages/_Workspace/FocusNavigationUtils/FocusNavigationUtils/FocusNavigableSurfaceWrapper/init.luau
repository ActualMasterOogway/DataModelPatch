local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Navigation);
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v7 = require(l_script_FirstAncestor_0.useFocusNavigableSurfaceRegistryConnection);
local v8 = require(l_script_FirstAncestor_0.useDefaultFocusNavigationBindings);
local l_FFlagFixSearchFocusBinding_0 = require(l_Parent_0.SharedFlags).FFlagFixSearchFocusBinding;
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
local l_FFlagFocusRegistryConnectionRefactor_0 = require(l_Parent_0.SharedFlags).FFlagFocusRegistryConnectionRefactor;
local v12 = {
    Size = UDim2.fromScale(1, 1), 
    BackgroundTransparency = 1, 
    SelectionGroup = true
};
local v13 = {};
local v14 = {
    SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorUp = Enum.SelectionBehavior.Stop
};
local function _(v15, v16, v17) --[[ Line: 44 ]] --[[ Name: useWrappedFrameProps ]]
    -- upvalues: v2 (copy), v4 (copy), v14 (copy), v12 (copy)
    return v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v16 (copy), v15 (copy), v4 (ref), v14 (ref), v12 (ref), v17 (copy)
        local v18 = v16 or {};
        if v15 then
            v18 = v4.Dictionary.join(v14, v18);
        end;
        return v4.Dictionary.join(v12, v18, {
            ref = v17
        });
    end, {
        v15, 
        v16, 
        v17
    });
end;
return function(v20) --[[ Line: 68 ]] --[[ Name: FocusNavigableSurfaceWrapper ]]
    -- upvalues: l_FFlagFixSearchFocusBinding_0 (copy), v13 (copy), l_FFlagFocusRegistryConnectionRefactor_0 (copy), v2 (copy), v3 (copy), v8 (copy), v5 (copy), l_FFlagEnableRNFocusRestoration_0 (copy), v7 (copy), v4 (copy), v14 (copy), v12 (copy)
    local v21 = v20.customEventHandlers or if l_FFlagFixSearchFocusBinding_0 then v13 else {};
    local v22 = nil;
    local v23 = nil;
    if l_FFlagFocusRegistryConnectionRefactor_0 then
        v22 = v2.useRef(if v20.frameProps and v20.frameProps.ref then v20.frameProps.ref.current else nil);
    else
        local v24, v25 = v2.useState(function() --[[ Line: 77 ]]
            -- upvalues: v20 (copy)
            if v20.frameProps and v20.frameProps.ref then
                return v20.frameProps.ref;
            else
                return nil;
            end;
        end);
        v22 = v24;
        v23 = v25;
    end;
    local v26 = v3.useEventHandlerMap(v21, if l_FFlagFocusRegistryConnectionRefactor_0 then v22 else v23);
    v26 = v8(v26);
    local l_isFocusable_0 = v20.isFocusable;
    if l_FFlagFocusRegistryConnectionRefactor_0 then
        local v28 = v5.useNavigationFocus();
        l_isFocusable_0 = (l_isFocusable_0 == nil or l_isFocusable_0) and (v28 == nil or v28);
    end;
    local l_v26_0 = v26;
    if l_FFlagEnableRNFocusRestoration_0 then
        local v30 = v20.shouldRestoreFocus == nil or v20.shouldRestoreFocus;
        local v31 = v3.useMostRecentFocusBehavior(v26);
        if v30 then
            l_v26_0 = v31;
        end;
    end;
    v7(if l_FFlagFocusRegistryConnectionRefactor_0 then v22 and v22.current else v22, v20.surfaceIdentifier, if l_FFlagEnableRNFocusRestoration_0 then l_isFocusable_0 else nil);
    local l_isIsolated_0 = v20.isIsolated;
    local l_frameProps_0 = v20.frameProps;
    local l_l_v26_0_0 = l_v26_0;
    local v36 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: l_frameProps_0 (copy), l_isIsolated_0 (copy), v4 (ref), v14 (ref), v12 (ref), l_l_v26_0_0 (copy)
        local v35 = l_frameProps_0 or {};
        if l_isIsolated_0 then
            v35 = v4.Dictionary.join(v14, v35);
        end;
        return v4.Dictionary.join(v12, v35, {
            ref = l_l_v26_0_0
        });
    end, {
        l_isIsolated_0, 
        l_frameProps_0, 
        l_l_v26_0_0
    });
    return v2.createElement("Frame", v36, v20.children);
end;