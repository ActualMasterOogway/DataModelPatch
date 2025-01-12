local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = game:GetService("AssetService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v5.Roact;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_PolicyService_0 = require(l_RobloxGui_0.Modules.Common:WaitForChild("PolicyService"));
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_UIBlox_0 = v5.UIBlox;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v16 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_ProductPurchase_0 = v16.ProductPurchase;
local l_ProductPurchaseRobuxUpsell_0 = v16.ProductPurchaseRobuxUpsell;
local l_LeaveRobloxAlert_0 = v16.LeaveRobloxAlert;
local l_Animator_0 = v16.Animator;
local v21 = require(l_Parent_0.Enums.PurchaseFlow);
local v22 = require(l_Parent_0.Enums.RequestType);
local v23 = require(l_Parent_0.Enums.PromptState);
local v24 = require(l_Parent_0.Enums.WindowState);
local v25 = require(l_Parent_0.Enums.PurchaseError);
local v26 = require(l_Parent_0.Thunks.hideWindow);
local v27 = require(l_Parent_0.Thunks.completeRequest);
local v28 = require(l_Parent_0.Thunks.purchaseItem);
local v29 = require(l_Parent_0.Thunks.completePurchase);
local v30 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v31 = require(l_Parent_0.Thunks.openSecuritySettings);
local v32 = require(l_Parent_0.Thunks.initiatePurchasePrecheck);
local v33 = require(l_Parent_0.Utils.isMockingPurchases);
local v34 = require(l_Parent_0.connectToStore);
local v35 = require(l_Parent_0.Thunks.sendEvent);
local v36 = require(l_Parent_0.Utils.PublishAssetAnalytics);
local _ = require(l_Parent_0.Components.Connection.PurchasePromptPolicy);
local v38 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v39 = require(l_Parent_0.Components.Connection.MultiTextLocalizer);
local v40 = require(l_Parent_0.Localization.LocalizationService);
local v41 = require(l_Parent_0.Utils.getPlayerPrice);
local v42 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local v43 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v44 = require(l_Parent_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local v45 = require(l_Parent_0.Flags.GetFFlagEnableTexasU18VPCForInExperienceBundleRobuxUpsellFlow);
local l_VerifiedParentalConsentDialog_0 = require(l_CorePackages_0.Workspace.Packages.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v47 = require(l_Parent_0.Enums.VPCModalType);
local v48 = require(script.Parent.Animator);
local v49 = l_Roact_0.Component:extend(script.Name);
local v50 = game:DefineFastFlag("PPTwoFactorLogOutMessage", false);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local function _(v53, v54) --[[ Line: 91 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: v21 (copy), v22 (copy), v43 (copy)
    if v54 == v21.RobuxUpsellV2 or v54 == v21.LargeRobuxUpsell then
        return false;
    else
        local v55 = true;
        if v53 ~= v22.Asset then
            v55 = true;
            if v53 ~= v22.Bundle then
                v55 = true;
                if v53 ~= v22.GamePass then
                    v55 = true;
                    if v53 ~= v22.Product then
                        v55 = v43 and v53 == v22.AvatarCreationFee;
                    end;
                end;
            end;
        end;
        return v55;
    end;
end;
v49.init = function(v57) --[[ Line: 102 ]] --[[ Name: init ]]
    -- upvalues: l_PolicyService_0 (copy), v23 (copy), l_Players_0 (copy), v21 (copy), v22 (copy), v43 (copy), v25 (copy), v42 (copy), v36 (copy), v24 (copy), l_ContextActionService_0 (copy), v47 (copy)
    v57.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false
    };
    coroutine.wrap(function() --[[ Line: 108 ]]
        -- upvalues: l_PolicyService_0 (ref), v57 (copy)
        if l_PolicyService_0:IsSubjectToChinaPolicies() then
            v57:setState({
                isLuobu = true
            });
        end;
    end)();
    v57.changeScreenSize = function(v58) --[[ Line: 116 ]]
        -- upvalues: v57 (copy)
        if v57.state.screenSize ~= v58.AbsoluteSize then
            v57:setState({
                screenSize = v58.AbsoluteSize
            });
        end;
    end;
    v57.hasDelayedInput = function() --[[ Line: 124 ]]
        -- upvalues: v57 (copy), v23 (ref)
        if v57.props.isTestPurchase then
            return false;
        else
            local l_promptState_0 = v57.props.promptState;
            local v60 = true;
            if l_promptState_0 ~= v23.PromptPurchase then
                v60 = true;
                if l_promptState_0 ~= v23.PurchaseInProgress then
                    v60 = true;
                    if l_promptState_0 ~= v23.RobuxUpsell then
                        v60 = l_promptState_0 == v23.UpsellInProgress;
                    end;
                end;
            end;
            return v60;
        end;
    end;
    v57.isWindowShowAndDoneAnimating = function() --[[ Line: 138 ]]
        -- upvalues: v57 (copy)
        return v57.state.isAnimating == false;
    end;
    v57.canConfirmInput = function() --[[ Line: 142 ]]
        -- upvalues: l_Players_0 (ref), v57 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v61 = v57.isWindowShowAndDoneAnimating();
            if v57.hasDelayedInput() then
                local v62 = false;
                if v57.state.doneAnimatingTime then
                    v62 = os.clock() - v57.state.doneAnimatingTime > 2.5;
                end;
                return v61 and v62;
            else
                return v61;
            end;
        end;
    end;
    v57.getConfirmButtonAction = function(v63, v64, v65) --[[ Line: 168 ]]
        -- upvalues: v23 (ref), v21 (ref), v22 (ref), v43 (ref), v57 (copy), v25 (ref), v42 (ref)
        if v63 == v23.None or not (v21.RobuxUpsellV2 ~= nil and not (v21.LargeRobuxUpsell == nil) and (v64 == v22.Asset or v64 == v22.Bundle or v64 == v22.GamePass or v64 == v22.Product or v43 and v64 == v22.AvatarCreationFee)) then
            return nil;
        elseif v63 == v23.PromptPurchase or v63 == v23.PurchaseInProgress then
            return v57.props.onBuy;
        elseif v63 == v23.RobuxUpsell or v63 == v23.UpsellInProgress or v63 == v23.LeaveRobloxWarning then
            return v57.props.onRobuxUpsell;
        elseif v63 == v23.U13PaymentModal or v63 == v23.U13MonthlyThreshold1Modal or v63 == v23.U13MonthlyThreshold2Modal or v63 == v23.ParentalConsentWarningPaymentModal13To17 then
            return v57.props.onScaryModalConfirm;
        elseif v63 == v23.Error and v65 == v25.TwoFactorNeededSettings then
            return v57.props.onOpenSecuritySettings;
        elseif v42(v65) then
            return function() --[[ Line: 189 ]]
                -- upvalues: v57 (ref), v65 (copy)
                v57.props.onOpenSecuritySettings(v65);
            end;
        else
            return v57.props.hideWindow;
        end;
    end;
    v57.getCancelButtonAction = function(v66, v67) --[[ Line: 197 ]]
        -- upvalues: v23 (ref), v21 (ref), v22 (ref), v43 (ref), v57 (copy)
        if v66 == v23.None or not (v21.RobuxUpsellV2 ~= nil and not (v21.LargeRobuxUpsell == nil) and (v67 == v22.Asset or v67 == v22.Bundle or v67 == v22.GamePass or v67 == v22.Product or v43 and v67 == v22.AvatarCreationFee)) then
            return nil;
        else
            return v57.props.hideWindow;
        end;
    end;
    v57.confirmButtonPressed = function() --[[ Line: 205 ]]
        -- upvalues: v57 (copy), v22 (ref), v23 (ref), v36 (ref)
        if v57.props.requestType == v22.AvatarCreationFee and v57.props.promptState == v23.PromptPurchase then
            v36.sendButtonClicked(v36.Section.BuyItemModal, v36.Element.Buy);
        end;
        local v68 = v57.getConfirmButtonAction(v57.props.promptState, v57.props.requestType, v57.props.purchaseError);
        if v68 ~= nil and v57.canConfirmInput() then
            v68();
        end;
    end;
    v57.cancelButtonPressed = function() --[[ Line: 222 ]]
        -- upvalues: v57 (copy), v22 (ref), v23 (ref), v36 (ref)
        if v57.props.requestType == v22.AvatarCreationFee and v57.props.promptState == v23.PromptPurchase then
            v36.sendButtonClicked(v36.Section.BuyItemModal, v36.Element.Cancel);
        end;
        local v69 = v57.getCancelButtonAction(v57.props.promptState, v57.props.requestType);
        if v69 ~= nil then
            v69();
        end;
    end;
    v57.configContextActionService = function(v70) --[[ Line: 239 ]]
        -- upvalues: v24 (ref), l_ContextActionService_0 (ref), v57 (copy)
        if v70 == v24.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v72, _) --[[ Line: 241 ]]
                -- upvalues: v57 (ref)
                if v72 == Enum.UserInputState.Begin then
                    v57.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v75, _) --[[ Line: 246 ]]
                -- upvalues: v57 (ref)
                if v75 == Enum.UserInputState.Begin then
                    v57.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v57.getVPCModalType = function(v77) --[[ Line: 257 ]]
        -- upvalues: v23 (ref), v47 (ref)
        if v77 == v23.EnablePurchaseVPCModal then
            return v47.toRawValue(v47.EnablePurchase);
        else
            return v47.toRawValue(v47.None);
        end;
    end;
end;
v49.didMount = function(v78) --[[ Line: 265 ]] --[[ Name: didMount ]]
    -- upvalues: v24 (copy), v21 (copy), v22 (copy), v43 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v78.props.purchaseFlow;
    local l_requestType_0 = v78.props.requestType;
    if v78.props.windowState == v24.Shown and l_purchaseFlow_0 ~= v21.RobuxUpsellV2 and not (l_purchaseFlow_0 == v21.LargeRobuxUpsell) and (l_requestType_0 == v22.Asset or l_requestType_0 == v22.Bundle or l_requestType_0 == v22.GamePass or l_requestType_0 == v22.Product or v43 and l_requestType_0 == v22.AvatarCreationFee) then
        v78:setState({
            isAnimating = true
        });
        v78.configContextActionService(v78.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v49.willUpdate = function(v81, v82) --[[ Line: 279 ]] --[[ Name: willUpdate ]]
    if v81.props.expectedPrice ~= v82.expectedPrice then
        v81:setState({});
    end;
end;
v49.didUpdate = function(v83, v84, _) --[[ Line: 285 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Players_0 (copy), v21 (copy), v22 (copy), v43 (copy), l_GuiService_0 (copy), v24 (copy), v23 (copy), v36 (copy)
    if l_Players_0.LocalPlayer.GameplayPaused then
        v83.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v83.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v83.props.purchaseFlow;
    local l_requestType_1 = v83.props.requestType;
    if v84.windowState ~= v83.props.windowState and l_purchaseFlow_1 ~= v21.RobuxUpsellV2 and not (l_purchaseFlow_1 == v21.LargeRobuxUpsell) and (l_requestType_1 == v22.Asset or l_requestType_1 == v22.Bundle or l_requestType_1 == v22.GamePass or l_requestType_1 == v22.Product or v43 and l_requestType_1 == v22.AvatarCreationFee) then
        v83:setState({
            isAnimating = true
        });
        v83.configContextActionService(v83.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v83.props.windowState == v24.Shown);
    end;
    if l_requestType_1 == v22.AvatarCreationFee and v83.props.promptState == v23.PurchaseComplete and v84.promptState ~= v23.PurchaseComplete then
        v36.sendPageLoad(v36.Section.ProcessCompleteModal);
    end;
end;
v49.getMessageKeysFromPromptState = function(v88) --[[ Line: 315 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v23 (copy), v25 (copy), v40 (copy), v42 (copy), v50 (copy)
    local l_promptState_1 = v88.props.promptState;
    local l_productInfo_0 = v88.props.productInfo;
    local l_purchaseError_0 = v88.props.purchaseError;
    if l_promptState_1 == v23.PurchaseComplete then
        return {
            messageText = {
                key = ("CoreScripts.PurchasePrompt.PurchaseMessage.%s"):format("Succeeded"), 
                params = {
                    ITEM_NAME = l_productInfo_0.name
                }
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v23.U13PaymentModal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v23.U13MonthlyThreshold1Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v23.U13MonthlyThreshold2Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v23.ParentalConsentWarningPaymentModal13To17 then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v23.Error then
        if l_purchaseError_0 == v25.UnknownFailure then
            return {
                messageText = {
                    key = v40.getErrorKey(l_purchaseError_0), 
                    params = {
                        ITEM_NAME = l_productInfo_0.name
                    }
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        elseif l_purchaseError_0 == v25.TwoFactorNeededSettings or v42(l_purchaseError_0) then
            local v92 = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV";
            if v50 then
                v92 = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout";
            end;
            return {
                messageText = {
                    key = v92
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.Settings"
                }, 
                cancelText = {
                    key = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel"
                }, 
                titleText = {
                    key = "CoreScripts.PurchasePrompt.Title.VerificationRequired"
                }
            };
        else
            return {
                messageText = {
                    key = v40.getErrorKey(l_purchaseError_0)
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        end;
    else
        return;
    end;
end;
v49.render = function(v93) --[[ Line: 389 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), v21 (copy), v22 (copy), v43 (copy), l_Roact_0 (copy), l_ProductPurchase_0 (copy), v41 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v11 (copy), l_ButtonType_0 (copy), v25 (copy), v42 (copy), v39 (copy), l_Images_0 (copy), v45 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), v48 (copy), v24 (copy), v36 (copy), v38 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_purchaseFlow_2 = v93.props.purchaseFlow;
    local l_promptState_2 = v93.props.promptState;
    local l_expectedPrice_0 = v93.props.expectedPrice;
    local l_requestType_2 = v93.props.requestType;
    local l_purchaseError_1 = v93.props.purchaseError;
    local l_productInfo_1 = v93.props.productInfo;
    local l_accountInfo_0 = v93.props.accountInfo;
    local l_nativeUpsell_0 = v93.props.nativeUpsell;
    local l_isTestPurchase_0 = v93.props.isTestPurchase;
    local v103 = nil;
    v103 = if l_promptState_2 ~= v23.None and l_purchaseFlow_2 ~= v21.RobuxUpsellV2 and not (l_purchaseFlow_2 == v21.LargeRobuxUpsell) and (l_requestType_2 == v22.Asset or l_requestType_2 == v22.Bundle or l_requestType_2 == v22.GamePass or l_requestType_2 == v22.Product or v43 and l_requestType_2 == v22.AvatarCreationFee) then if not (l_promptState_2 ~= v23.PromptPurchase) or l_promptState_2 == v23.PurchaseInProgress then l_Roact_0.createElement(l_ProductPurchase_0, {
        screenSize = v93.state.screenSize, 
        isDisabled = l_promptState_2 == v23.PurchaseInProgress, 
        model = v93.props.humanoidModel, 
        itemIcon = l_productInfo_1.imageUrl, 
        itemName = l_productInfo_1.name, 
        itemRobuxCost = v41(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
        currentBalance = l_accountInfo_0.balance, 
        testPurchase = l_isTestPurchase_0, 
        isDelayedInput = v93.hasDelayedInput(), 
        enableInputDelayed = v93.isWindowShowAndDoneAnimating(), 
        buyItemControllerIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        cancelControllerIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
        buyItemActivated = v93.confirmButtonPressed, 
        cancelPurchaseActivated = v93.cancelButtonPressed, 
        isLuobu = v93.state.isLuobu
    }) else if not (l_promptState_2 ~= v23.RobuxUpsell) or l_promptState_2 == v23.UpsellInProgress then l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
        screenSize = v93.state.screenSize, 
        isDisabled = l_promptState_2 == v23.UpsellInProgress, 
        model = v93.props.humanoidModel, 
        itemIcon = l_productInfo_1.imageUrl, 
        itemName = l_productInfo_1.name, 
        itemRobuxCost = v41(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
        robuxPurchaseAmount = l_nativeUpsell_0.robuxPurchaseAmount, 
        balanceAmount = l_accountInfo_0.balance, 
        isDelayedInput = v93.hasDelayedInput(), 
        enableInputDelayed = v93.isWindowShowAndDoneAnimating(), 
        buyItemControllerIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        cancelControllerIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
        buyItemActivated = v93.confirmButtonPressed, 
        cancelPurchaseActivated = v93.cancelButtonPressed, 
        isLuobu = v93.state.isLuobu, 
        isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
    }) else if l_promptState_2 == v23.LeaveRobloxWarning then l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
        screenSize = v93.state.screenSize, 
        cancelActivated = v93.cancelButtonPressed, 
        continueActivated = v93.confirmButtonPressed
    }) else if v43 and l_promptState_2 == v23.PurchaseComplete and l_requestType_2 == v22.AvatarCreationFee then l_Roact_0.createElement(l_InteractiveAlert_0, {
        bodyText = v11:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v93.confirmButtonPressed, 
                        text = v11:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                        inputIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                    }
                }
            }
        }, 
        screenSize = v93.state.screenSize, 
        title = v11:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
    }) else if not (not (l_promptState_2 == v23.Error) or l_purchaseError_1 ~= v25.TwoFactorNeededSettings) or v42(l_purchaseError_1) then l_Roact_0.createElement(v39, {
        locKeys = v93:getMessageKeysFromPromptState(), 
        render = function(v104) --[[ Line: 492 ]] --[[ Name: render ]]
            -- upvalues: l_Roact_0 (ref), l_InteractiveAlert_0 (ref), v93 (copy), l_ButtonType_0 (ref), l_Images_0 (ref)
            return l_Roact_0.createElement(l_InteractiveAlert_0, {
                bodyText = v104.messageText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                onActivated = v93.cancelButtonPressed, 
                                text = v104.cancelText, 
                                inputIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v93.confirmButtonPressed, 
                                text = v104.okText, 
                                inputIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                            }
                        }
                    }
                }, 
                screenSize = v93.state.screenSize, 
                title = v104.titleText, 
                titleIcon = l_Images_0["icons/status/error_large"]
            });
        end
    }) else if v45() and l_promptState_2 == v23.EnablePurchaseVPCModal then l_Roact_0.createElement(l_Animator_0, {
        shouldAnimate = true, 
        shouldShow = l_promptState_2 == v23.EnablePurchaseVPCModal, 
        renderChildren = function() --[[ Line: 527 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v93 (copy), l_promptState_2 (copy)
            return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                screenSize = v93.state.screenSize, 
                isActionable = false, 
                modalType = v93.getVPCModalType(l_promptState_2), 
                onDismiss = function() --[[ Line: 532 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v93 (ref)
                    v93.confirmButtonPressed();
                end
            });
        end
    }) else l_Roact_0.createElement(v39, {
        locKeys = v93:getMessageKeysFromPromptState(), 
        render = function(v105) --[[ Line: 541 ]] --[[ Name: render ]]
            -- upvalues: l_Roact_0 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), v93 (copy)
            return l_Roact_0.createElement(l_InteractiveAlert_0, {
                bodyText = v105.messageText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v93.confirmButtonPressed, 
                                text = v105.okText, 
                                inputIcon = v93.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                            }
                        }
                    }
                }, 
                screenSize = v93.state.screenSize, 
                title = v105.titleText
            });
        end
    }) else nil;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v93.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v48, {
            shouldShow = v93.props.windowState ~= v24.Hidden, 
            onShown = function() --[[ Line: 570 ]] --[[ Name: onShown ]]
                -- upvalues: v93 (copy), v22 (ref), l_promptState_2 (copy), v23 (ref), v36 (ref)
                if v93.props.requestType == v22.AvatarCreationFee and l_promptState_2 == v23.PromptPurchase then
                    v36.sendPageLoad(v36.Section.BuyItemModal);
                end;
                v93:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 582 ]] --[[ Name: onHidden ]]
                -- upvalues: v93 (copy), v24 (ref), v21 (ref), v22 (ref), v43 (ref)
                v93:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
                if v93.props.windowState == v24.Hidden then
                    local l_requestType_3 = v93.props.requestType;
                    if v21.RobuxUpsellV2 ~= nil and not (v21.LargeRobuxUpsell == nil) and (l_requestType_3 == v22.Asset or l_requestType_3 == v22.Bundle or l_requestType_3 == v22.GamePass or l_requestType_3 == v22.Product or v43 and l_requestType_3 == v22.AvatarCreationFee) then
                        v93.props.completeRequest();
                    end;
                end;
            end, 
            [l_Roact_0.Ref] = v93.animatorRef
        }, {
            Prompt = v103, 
            ModalFix = v103 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v38, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 603 ]] --[[ Name: callback ]]
                -- upvalues: v93 (copy)
                if v93.props.hideWindow then
                    v93.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v38, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v107, v108) --[[ Line: 611 ]] --[[ Name: callback ]]
                -- upvalues: v93 (copy)
                if not v107 or not v108 then
                    v93.props.hideWindow();
                end;
            end
        })
    });
end;
return (v34(function(v109) --[[ Line: 621 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v33 (copy)
    return {
        purchaseFlow = v109.purchaseFlow, 
        promptState = v109.promptState, 
        requestType = v109.promptRequest.requestType, 
        humanoidModel = v109.promptRequest.humanoidModel, 
        expectedPrice = v109.promptRequest.expectedPrice, 
        windowState = v109.windowState, 
        purchaseError = v109.purchaseError, 
        productInfo = v109.productInfo, 
        accountInfo = v109.accountInfo, 
        nativeUpsell = v109.nativeUpsell, 
        isTestPurchase = v33(), 
        isGamepadEnabled = v109.gamepadEnabled
    };
end, function(v110) --[[ Line: 638 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v31 (copy), v45 (copy), v44 (copy), v32 (copy), v26 (copy), v27 (copy), v35 (copy)
    return {
        onBuy = function() --[[ Line: 640 ]] --[[ Name: onBuy ]]
            -- upvalues: v110 (copy), v28 (ref)
            v110(v28());
        end, 
        completePurchase = function() --[[ Line: 643 ]] --[[ Name: completePurchase ]]
            -- upvalues: v110 (copy), v29 (ref)
            v110(v29());
        end, 
        onScaryModalConfirm = function() --[[ Line: 646 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v110 (copy), v30 (ref)
            v110(v30());
        end, 
        onOpenSecuritySettings = function(v111) --[[ Line: 649 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v110 (copy), v31 (ref)
            if v111 then
                v110(v31(v111));
                return;
            else
                v110(v31());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 656 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v45 (ref), v110 (copy), v44 (ref), v32 (ref)
            if v45() then
                v110(v44());
                return;
            else
                v110(v32());
                return;
            end;
        end, 
        hideWindow = function() --[[ Line: 663 ]] --[[ Name: hideWindow ]]
            -- upvalues: v110 (copy), v26 (ref)
            v110(v26());
        end, 
        completeRequest = function() --[[ Line: 666 ]] --[[ Name: completeRequest ]]
            -- upvalues: v110 (copy), v27 (ref)
            v110(v27());
        end, 
        onAnalyticEvent = function(v112, v113) --[[ Line: 669 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v110 (copy), v35 (ref)
            v110(v35(v112, v113));
        end
    };
end)(v49));