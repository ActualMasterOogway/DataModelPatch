local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v6 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v7 = require(l_script_FirstAncestor_0.Features.BulkPurchaseError.BulkPurchaseErrorContainer);
local v8 = require(l_script_FirstAncestor_0.Features.BulkPurchaseSuccess.BulkPurchaseSuccessContainer);
local v9 = require(l_script_FirstAncestor_0.Features.BulkPurchasePartialSuccess.BulkPurchasePartialSuccessContainer);
local v10 = require(l_script_FirstAncestor_0.Features.BulkPurchaseRequest.BulkPurchaseRequestContainer);
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local v12 = require(l_script_FirstAncestor_0.Hooks.useBulkPurchaseRequestListenerEffect);
local l_useFocusNavigationSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useFocusNavigationSurface;
local v14 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
return function() --[[ Line: 21 ]] --[[ Name: BulkPurchaseApp ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v14 (copy), l_useFocusNavigationSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v12 (copy), v6 (copy), l_GuiService_0 (copy), l_ScreenSizeContext_0 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy)
    local v15, v16 = v3.useState(Vector2.new(0, 0));
    local v17 = l_useSelector_0(v14);
    local v18 = l_useFocusNavigationSurface_0({
        selectionGroupName = "BulkPurchaseApp", 
        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
    });
    v12();
    v3.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v17 (copy), v6 (ref), l_GuiService_0 (ref)
        if v17 == v6.None then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v17
    });
    return v3.createElement(l_ScreenSizeContext_0.Provider, {
        value = v15
    }, v3.createElement("ScreenGui", {
        [v3.Change.AbsoluteSize] = function(v19) --[[ Line: 41 ]]
            -- upvalues: v16 (copy)
            v16(v19.AbsoluteSize);
        end, 
        ScreenInsets = Enum.ScreenInsets.None
    }, {
        FocusNavigationEffects = v3.createElement("Frame", {
            ref = if v17 == v6.None then nil else v18, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, {
            Error = if v17 == v6.Error then v3.createElement(v7) else nil, 
            Success = if v17 == v6.Success then v3.createElement(v8) else nil, 
            Request = if v17 == v6.Request then v3.createElement(v10) else nil, 
            PartialSuccess = if v17 == v6.PartialSuccess then v3.createElement(v9) else nil
        })
    }));
end;