local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_canGoBack_0 = require(l_Parent_0.Navigation).canGoBack;
local v8 = require(l_script_FirstAncestor_0.FocusNavigationEventNameEnum);
local l_useFocusRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useFocusRegistryEntry;
local v10 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v11 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local l_FFlagFixCanGoBackForPop_0 = require(l_Parent_0.SharedFlags).FFlagFixCanGoBackForPop;
local v14 = game:DefineFastFlag("OptimizeFocusBindings", false);
local v15 = {
    [Enum.KeyCode.ButtonB] = v8.NavigateBack, 
    [Enum.KeyCode.Escape] = v8.NavigateBack, 
    [Enum.KeyCode.ButtonY] = v8.Search, 
    [Enum.KeyCode.Slash] = v8.Search, 
    [Enum.KeyCode.PageUp] = v8.ScrollUp, 
    [Enum.KeyCode.LeftBracket] = v8.ScrollUp, 
    [Enum.KeyCode.PageDown] = v8.ScrollDown, 
    [Enum.KeyCode.RightBracket] = v8.ScrollDown
};
local function _(v16) --[[ Line: 41 ]] --[[ Name: getScrollableAncestor ]]
    if v16 == nil then
        return nil;
    elseif v16:IsA("ScrollingFrame") then
        return v16;
    else
        return v16:FindFirstAncestorWhichIsA("ScrollingFrame");
    end;
end;
local function v21(v18, v19) --[[ Line: 52 ]] --[[ Name: scrollTo ]]
    if v18 ~= nil then
        local v20 = v18.AbsoluteCanvasSize.Y - v18.AbsoluteWindowSize.Y;
        if v19 > 0 and v18.CanvasPosition.Y >= v20 - 350 then
            v18.CanvasPosition = Vector2.new(0, v20);
            return;
        elseif v19 < 0 and v18.CanvasPosition.Y <= 350 then
            v18.CanvasPosition = Vector2.new(0, 0);
            return;
        else
            v18.CanvasPosition = v18.CanvasPosition + Vector2.new(0, v19);
        end;
    end;
end;
useDefaultFocusNavigationBindings = function(v22) --[[ Line: 71 ]] --[[ Name: useDefaultFocusNavigationBindings ]]
    -- upvalues: l_useNavigation_0 (copy), v14 (copy), l_useRegistryEntry_0 (copy), v10 (copy), l_useFocusRegistryEntry_0 (copy), v11 (copy), l_useSelector_0 (copy), v3 (copy), v15 (copy), v2 (copy), v8 (copy), v4 (copy), l_canGoBack_0 (copy), l_FFlagFixCanGoBackForPop_0 (copy), v21 (copy)
    local v23 = l_useNavigation_0();
    local v24 = if v14 then l_useRegistryEntry_0(v10.SearchBar) else nil;
    local v25 = l_useFocusRegistryEntry_0(v10.SearchBar);
    local v26 = l_useFocusRegistryEntry_0(v10.NavBar);
    local v27 = l_useRegistryEntry_0(v10.NavBar);
    local v28 = v11(v27);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 80 ]]
        return v29.TabBarVisible;
    end);
    local v31 = v3.useFocusedGuiObject();
    local v32 = if v31 == nil then nil else if v31:IsA("ScrollingFrame") then v31 else v31:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v33 = v32 ~= nil;
    local v34 = v3.useEventMap(v15, v22);
    local v42 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v14 (ref), v28 (copy), v8 (ref), v4 (ref), l_canGoBack_0 (ref), v23 (copy), l_FFlagFixCanGoBackForPop_0 (ref), v30 (copy), v26 (copy), v25 (copy), v24 (copy), v33 (copy), v21 (ref), v32 (copy)
        local v35 = {};
        if v14 then
            if not v28 then
                v35[v8.NavigateBack] = {
                    handler = v4.onRelease(function(_) --[[ Line: 95 ]]
                        -- upvalues: l_canGoBack_0 (ref), v23 (ref), l_FFlagFixCanGoBackForPop_0 (ref), v30 (ref), v26 (ref)
                        if l_canGoBack_0(v23) then
                            if l_FFlagFixCanGoBackForPop_0 then
                                v23.goBack(false);
                                return;
                            elseif v23.pop ~= nil then
                                v23.pop();
                                return;
                            else
                                v23.goBack();
                                return;
                            end;
                        else
                            if v30 then
                                v26();
                            end;
                            return;
                        end;
                    end)
                };
            end;
        else
            v35[v8.NavigateBack] = {
                handler = v4.onRelease(function(_) --[[ Line: 114 ]]
                    -- upvalues: l_canGoBack_0 (ref), v23 (ref), v30 (ref), v28 (ref), v26 (ref)
                    if l_canGoBack_0(v23) then
                        if v23.pop ~= nil then
                            v23.pop();
                            return;
                        else
                            v23.goBack();
                            return;
                        end;
                    else
                        if v30 and not v28 then
                            v26();
                        end;
                        return;
                    end;
                end)
            };
        end;
        if v25 and (not v14 or v24 ~= nil) then
            v35[v8.Search] = {
                handler = v4.onRelease(function(_) --[[ Line: 130 ]]
                    -- upvalues: v25 (ref), v14 (ref), v24 (ref)
                    v25();
                    if v14 and v24 ~= nil then
                        local v39 = if v24:IsA("TextBox") then v24 else v24:FindFirstChildWhichIsA("TextBox", true);
                        if v39 then
                            v39:CaptureFocus();
                        end;
                    end;
                end)
            };
        end;
        if v33 then
            v35[v8.ScrollDown] = {
                handler = v4.onRelease(function(_) --[[ Line: 147 ]]
                    -- upvalues: v21 (ref), v32 (ref)
                    v21(v32, 300);
                end)
            };
            v35[v8.ScrollUp] = {
                handler = v4.onRelease(function(_) --[[ Line: 152 ]]
                    -- upvalues: v21 (ref), v32 (ref)
                    v21(v32, -300);
                end)
            };
        end;
        return v35;
    end, {
        v23, 
        v24, 
        v25, 
        v26, 
        v28, 
        v30, 
        v33
    });
    return (v3.useEventHandlerMap(v42, v34));
end;
return useDefaultFocusNavigationBindings;