local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local v8 = {
    [require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum).NotPurchasable] = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
};
return function(v9) --[[ Line: 23 ]] --[[ Name: CommercePurchaseError ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v8 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy)
    local v10 = l_useScreenSize_0();
    local v11 = l_useLocalization_0({
        title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.CantBuy", 
        errorReason = v8[v9.errorCode], 
        dismissCTA = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.DismissCTA"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v11.title, 
        titleIcon = l_Images_0["icons/status/error_large"], 
        bodyText = v11.errorReason, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v9.onDismiss, 
                        text = v11.dismissCTA
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v10
    });
end;