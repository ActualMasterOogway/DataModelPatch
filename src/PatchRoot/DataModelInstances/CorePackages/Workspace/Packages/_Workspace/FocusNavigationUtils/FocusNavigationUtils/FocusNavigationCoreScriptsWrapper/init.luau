local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry);
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v6 = nil;
v6 = if l_GetFFlagEnableAppCommonInputHooks_0() then require(l_script_FirstAncestor_0.useLastInputMethod) else require(l_Parent_0.ReactFocusNavigation).useLastInputMethod;
local l_useRegisterFocusNavigableSurface_0 = v4.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = v4.useDeRegisterFocusNavigableSurface;
local v9 = require(l_script_FirstAncestor_0.useAutoFocus);
local v10 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
return function(v12) --[[ Line: 34 ]] --[[ Name: FocusNavigationCoreScriptsWrapper ]]
    -- upvalues: v3 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), v9 (copy), v10 (copy), v6 (ref), l_GuiService_0 (copy)
    local v13, v14 = v3.useState(nil);
    local v15 = l_useRegisterFocusNavigableSurface_0();
    local v16 = l_useDeRegisterFocusNavigableSurface_0();
    local v17 = v9({
        v13
    }, 0.1);
    local v18 = v10(v13);
    local v19 = v6();
    local v20 = true;
    if v19 ~= "Gamepad" then
        v20 = v19 == "Keyboard";
    end;
    v3.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v13 (copy), v15 (copy), v12 (copy), l_GuiService_0 (ref), v16 (copy)
        if v13 then
            v15(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:AddSelectionParent(v12.selectionGroupName, v13);
            end;
        else
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            end;
        end;
        return function() --[[ Line: 57 ]]
            -- upvalues: v16 (ref), v12 (ref), v13 (ref), l_GuiService_0 (ref)
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            end;
        end;
    end, {
        v13, 
        v12.focusNavigableSurfaceIdentifier, 
        v12.selectionGroupName
    });
    local v21 = v20 and v13 and not v18;
    v3.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v21 (copy), v17 (copy)
        local v22 = nil;
        if v21 then
            v22 = v17();
        end;
        return function() --[[ Line: 72 ]]
            -- upvalues: v22 (ref)
            if v22 then
                v22.cancel();
            end;
        end;
    end, {
        v21, 
        v17
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = v12.automaticSize, 
        Size = if v12.size then v12.size else UDim2.new(1, 0, 1, 0), 
        ref = v14
    }, v12.children);
end;