local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v6 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionRequest.CancelUserSubscriptionRequestContainer);
local v7 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionError.CancelUserSubscriptionErrorContainer);
local v8 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionSuccess.CancelUserSubscriptionSuccessContainer);
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local v10 = require(l_script_FirstAncestor_0.Hooks.useCancelSubscriptionRequestedListenerEffect);
local l_useFocusNavigationSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useFocusNavigationSurface;
local v12 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v13 = require(l_script_FirstAncestor_0.Enums.CancelUserSubscriptionAsyncPromptStateEnum);
return function() --[[ Line: 22 ]] --[[ Name: CancelSubscriptionApp ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v12 (copy), l_useFocusNavigationSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v10 (copy), v13 (copy), l_GuiService_0 (copy), l_ScreenSizeContext_0 (copy), v7 (copy), v8 (copy), v6 (copy)
    local v14, v15 = v3.useState(Vector2.new(0, 0));
    local v16 = l_useSelector_0(v12);
    local v17 = l_useFocusNavigationSurface_0({
        selectionGroupName = "CancelSubscriptionApp", 
        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
    });
    v10(v16);
    v3.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v16 (copy), v13 (ref), l_GuiService_0 (ref)
        if v16 == v13.None then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v16
    });
    return v3.createElement(l_ScreenSizeContext_0.Provider, {
        value = v14
    }, v3.createElement("ScreenGui", {
        [v3.Change.AbsoluteSize] = function(v18) --[[ Line: 42 ]]
            -- upvalues: v15 (copy)
            v15(v18.AbsoluteSize);
        end, 
        ScreenInsets = Enum.ScreenInsets.None
    }, {
        FocusNavigationEffects = v3.createElement("Frame", {
            ref = if not (v16 ~= v13.None and v16 ~= v13.Success) or v16 == v13.Pending then nil else v17, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, {
            Error = if v16 == v13.Error then v3.createElement(v7) else nil, 
            Success = if v16 == v13.Success then v3.createElement(v8) else nil, 
            Request = if v16 == v13.Request then v3.createElement(v6) else nil
        })
    }));
end;