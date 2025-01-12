local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = game:GetService("AssetService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v5.Roact;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_IAPExperience_0 = v5.IAPExperience;
local l_RobuxUpsellFlow_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlow;
local l_RobuxUpsellFlowState_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlowState;
local l_U13ConfirmType_0 = l_IAPExperience_0.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v13 = require(l_Parent_0.Enums.PromptState);
local v14 = require(l_Parent_0.Enums.PurchaseError);
local v15 = require(l_Parent_0.connectToStore);
local v16 = require(l_Parent_0.Enums.VPCModalType);
local v17 = l_Roact_0.PureComponent:extend(script.Name);
local v18 = require(l_Parent_0.Flags.GetFFlagDisablePurchasePromptFunctionForMaquettes);
local v19 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v20 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabledAllPlatforms);
local v21 = require(l_Parent_0.Enums.PaymentPlatform);
local v22 = require(l_Parent_0.Utils.getPaymentPlatform);
local v23 = require(l_Parent_0.Services.ExternalSettings);
v17.init = function(v24) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), v13 (copy), v14 (copy)
    v24.state = {
        canAcceptInput = false
    };
    v24.dispatchFetchPurchaseWarning = function() --[[ Line: 83 ]]
        -- upvalues: v24 (copy)
        local l_props_0 = v24.props;
        return v24.props.dispatchFetchPurchaseWarning(l_props_0.robuxProviderId);
    end;
    v24.promptRobuxPurchase = function() --[[ Line: 88 ]]
        -- upvalues: v24 (copy)
        local l_props_1 = v24.props;
        v24.props.promptRobuxPurchase(v24.props.networking, l_props_1.robuxProviderId, l_props_1.robuxProductId);
    end;
    v24.onDelayedInputComplete = function() --[[ Line: 93 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            canAcceptInput = true
        });
    end;
    v24.canAcceptInput = function() --[[ Line: 99 ]]
        -- upvalues: v24 (copy), l_Players_0 (ref)
        local l_state_0 = v24.state;
        if l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            return l_state_0.canAcceptInput;
        end;
    end;
    v24.confirmButtonPressed = function() --[[ Line: 109 ]]
        -- upvalues: v24 (copy), v13 (ref), v14 (ref)
        local l_props_2 = v24.props;
        local l_promptState_0 = l_props_2.promptState;
        local l_purchaseError_0 = l_props_2.purchaseError;
        if not v24.canAcceptInput() then
            return;
        elseif l_promptState_0 == v13.RobuxUpsell then
            l_props_2.dispatchFetchPurchaseWarning();
            return;
        elseif l_promptState_0 == v13.LargeRobuxUpsell then
            l_props_2.openRobuxStore();
            return;
        elseif l_promptState_0 == v13.U13PaymentModal or l_promptState_0 == v13.U13MonthlyThreshold1Modal or l_promptState_0 == v13.U13MonthlyThreshold2Modal or l_promptState_0 == v13.ParentalConsentWarningPaymentModal13To17 then
            l_props_2.promptRobuxPurchase();
            return;
        elseif l_promptState_0 == v13.PurchaseComplete then
            l_props_2.endPurchase();
            return;
        elseif l_promptState_0 == v13.Error then
            if l_purchaseError_0 == v14.TwoFactorNeeded or l_purchaseError_0 == v14.TwoFactorNeededSettings then
                l_props_2.openSecuritySettings();
                return;
            else
                l_props_2.endPurchase();
                return;
            end;
        else
            return;
        end;
    end;
    v24.cancelButtonPressed = function() --[[ Line: 149 ]]
        -- upvalues: v24 (copy)
        v24.props.endPurchase();
    end;
end;
v17.didMount = function(v31) --[[ Line: 156 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v33, _) --[[ Line: 157 ]]
        -- upvalues: v31 (copy)
        if v33 == Enum.UserInputState.Begin then
            v31.confirmButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v36, _) --[[ Line: 162 ]]
        -- upvalues: v31 (copy)
        if v36 == Enum.UserInputState.Begin then
            v31.cancelButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v17.willUnmount = function(_) --[[ Line: 169 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
end;
v17.getFlowState = function(v39) --[[ Line: 174 ]] --[[ Name: getFlowState ]]
    -- upvalues: v13 (copy), l_RobuxUpsellFlowState_0 (copy), v14 (copy)
    local l_props_3 = v39.props;
    local l_promptState_1 = l_props_3.promptState;
    local l_purchaseError_1 = l_props_3.purchaseError;
    if l_promptState_1 == v13.RobuxUpsell then
        return l_RobuxUpsellFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v13.LargeRobuxUpsell then
        return l_RobuxUpsellFlowState_0.LargeRobuxPurchaseModal;
    elseif l_promptState_1 == v13.PurchaseInProgress then
        return l_RobuxUpsellFlowState_0.ItemPurchasePending;
    elseif l_promptState_1 == v13.UpsellInProgress then
        return l_RobuxUpsellFlowState_0.RobuxPurchasePending;
    elseif l_promptState_1 == v13.PollingBalance then
        return l_RobuxUpsellFlowState_0.RobuxGrantPending;
    elseif l_promptState_1 == v13.U13PaymentModal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v13.U13MonthlyThreshold1Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v13.U13MonthlyThreshold2Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v13.PurchaseComplete then
        return l_RobuxUpsellFlowState_0.Success;
    elseif l_promptState_1 == v13.LeaveRobloxWarning then
        return l_RobuxUpsellFlowState_0.LeaveRobloxWarning;
    elseif l_promptState_1 == v13.EnablePurchaseVPCModal then
        return l_RobuxUpsellFlowState_0.PurchaseVPCModal;
    elseif l_promptState_1 == v13.Error then
        if l_purchaseError_1 == v14.TwoFactorNeeded or l_purchaseError_1 == v14.TwoFactorNeededSettings then
            return l_RobuxUpsellFlowState_0.TwoStepRequired;
        else
            return l_RobuxUpsellFlowState_0.Error;
        end;
    else
        return l_RobuxUpsellFlowState_0.None;
    end;
end;
v17.getU13ConfirmType = function(v43) --[[ Line: 212 ]] --[[ Name: getU13ConfirmType ]]
    -- upvalues: v13 (copy), l_U13ConfirmType_0 (copy)
    local l_promptState_2 = v43.props.promptState;
    if l_promptState_2 == v13.U13PaymentModal then
        return l_U13ConfirmType_0.U13PaymentModal;
    elseif l_promptState_2 == v13.U13MonthlyThreshold1Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold1Modal;
    elseif l_promptState_2 == v13.U13MonthlyThreshold2Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold2Modal;
    elseif l_promptState_2 == v13.ParentalConsentWarningPaymentModal13To17 then
        return l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17;
    else
        return l_U13ConfirmType_0.None;
    end;
end;
v17.getErrorType = function(v45) --[[ Line: 230 ]] --[[ Name: getErrorType ]]
    -- upvalues: v14 (copy), l_PurchaseErrorType_0 (copy)
    local l_props_4 = v45.props;
    if l_props_4.purchaseError == v14.AlreadyOwn then
        return l_PurchaseErrorType_0.AlreadyOwn;
    elseif l_props_4.purchaseError == v14.NotEnoughRobux or l_props_4.purchaseError == v14.NotEnoughRobuxXbox or l_props_4.purchaseError == v14.NotEnoughRobuxNoUpsell then
        return l_PurchaseErrorType_0.NotEnoughRobux;
    elseif l_props_4.purchaseError == v14.Limited then
        return l_PurchaseErrorType_0.Limited;
    elseif l_props_4.purchaseError == v14.NotForSale then
        return l_PurchaseErrorType_0.NotForSale;
    elseif l_props_4.purchaseError == v14.NotForSaleHere then
        return l_PurchaseErrorType_0.NotForSaleExperience;
    elseif l_props_4.purchaseError == v14.PremiumOnly then
        return l_PurchaseErrorType_0.PremiumOnly;
    elseif l_props_4.purchaseError == v14.ThirdPartyDisabled then
        return l_PurchaseErrorType_0.ThirdPartyDisabled;
    elseif l_props_4.purchaseError == v14.Under13 then
        return l_PurchaseErrorType_0.Under13;
    elseif l_props_4.purchaseError == v14.InvalidFunds then
        return l_PurchaseErrorType_0.FailedGrant;
    elseif l_props_4.purchaseError == v14.InvalidFundsUnknown then
        return l_PurchaseErrorType_0.FailedGrantUnknown;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v17.getVPCModalType = function(v47) --[[ Line: 262 ]] --[[ Name: getVPCModalType ]]
    -- upvalues: v13 (copy), v16 (copy)
    if v47.props.promptState == v13.EnablePurchaseVPCModal then
        return v16.toRawValue(v16.EnablePurchase);
    else
        return v16.toRawValue(v16.None);
    end;
end;
v17.render = function(v48) --[[ Line: 274 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), l_Roact_0 (copy), l_RobuxUpsellFlow_0 (copy), v18 (copy), v22 (copy), v21 (copy)
    local l_props_5 = v48.props;
    local v50 = v23.new();
    return l_Roact_0.createElement(l_RobuxUpsellFlow_0, {
        screenSize = l_props_5.screenSize, 
        shouldAnimate = true, 
        isDelayedInput = true, 
        onDelayedInputComplete = v48.onDelayedInputComplete, 
        model = l_props_5.humanoidModel, 
        itemIcon = l_props_5.itemIcon, 
        itemName = l_props_5.itemName, 
        itemRobuxCost = l_props_5.itemRobuxCost, 
        iapRobuxAmount = l_props_5.iapRobuxAmount, 
        beforeRobuxBalance = l_props_5.beforeRobuxBalance, 
        purchaseState = v48:getFlowState(), 
        errorType = v48:getErrorType(), 
        u13ConfirmType = v48:getU13ConfirmType(), 
        purchaseVPCType = v48:getVPCModalType(), 
        acceptControllerIcon = l_props_5.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        cancelControllerIcon = l_props_5.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
        purchaseRobux = v48.dispatchFetchPurchaseWarning, 
        acceptPurchaseWarning = v48.promptRobuxPurchase, 
        openBuyRobux = l_props_5.openRobuxStore, 
        showTermsOfUse = l_props_5.openTermsOfUse, 
        openSecuritySettings = l_props_5.openSecuritySettings, 
        cancelPurchase = l_props_5.endPurchase, 
        flowComplete = l_props_5.endPurchase, 
        onAnalyticEvent = l_props_5.onAnalyticEvent, 
        eventPrefix = "InGame", 
        isQuest = v18() and v22(v50.getPlatform()) == v21.Maquettes
    });
end;
if v19 and not v20 then
    v17 = v15(function(v51) --[[ Line: 319 ]] --[[ Name: mapStateToProps ]]
        return {
            humanoidModel = v51.promptRequest.humanoidModel
        };
    end, nil)(v17);
end;
return v17;