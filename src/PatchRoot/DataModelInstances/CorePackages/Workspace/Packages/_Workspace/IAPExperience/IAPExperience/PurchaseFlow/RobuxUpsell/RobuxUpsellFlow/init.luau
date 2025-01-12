local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_0.RobuxUpsellFlowState);
local v7 = require(l_Parent_1.Generic.Animator);
local v8 = require(l_Parent_1.Generic.Constants);
local v9 = require(l_Parent_1.Generic.LoadingOverlay);
local v10 = require(l_Parent_1.Generic.LoadingOverlayState);
local v11 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v12 = require(l_Parent_1.Generic.U13ConfirmPrompt);
local v13 = require(l_Parent_1.Generic.TwoStepReqPrompt);
local v14 = require(l_Parent_1.Generic.InsufficientRobuxPrompt);
local v15 = require(l_Parent_1.ProductPurchaseRobuxUpsell.InsufficientRobuxProductPrompt);
local v16 = require(l_Parent_1.Generic.LeaveRobloxPrompt);
local v17 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellSuccessPrompt);
local v18 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellPrompt);
local v19 = require(l_Parent_1.Utility.getModalShownEventData);
local v20 = require(l_Parent_1.Utility.getUserInputEventData);
local v21 = require(l_Parent_1.Flags.getEnableCentralOverlayForUpsellPrompt);
local v22 = v5.Component:extend(script.Name);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v24 = require(l_Parent_0.Events.InGameRobuxUpsellEvent);
local l_Players_0 = game:GetService("Players");
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
game:DefineFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent", false);
game:DefineFastFlag("EnableSchematizedInGameRobuxUpsellEvent2", false);
v22.init = function(v27) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_props_0 = v27.props;
    v27.state = {
        analyticId = l_HttpService_0:GenerateGUID(false), 
        isDelayedInput = l_props_0.isDelayedInput, 
        enableInputDelayed = false
    };
    v27.closeModal = function() --[[ Line: 104 ]]
        -- upvalues: v27 (copy)
        local l_props_1 = v27.props;
        v27:reportUserInput("Cancel");
        l_props_1.cancelPurchase();
        v27:closeCentralOverlay();
        v27:UnbindActions();
    end;
end;
v22.didUpdate = function(v30, v31, _) --[[ Line: 114 ]] --[[ Name: didUpdate ]]
    local l_props_2 = v30.props;
    if v31.purchaseState ~= l_props_2.purchaseState then
        v30:reportModalShown();
        v30:dispatchCentralOverlayAndRenderModal(l_props_2);
    end;
end;
v22.UnbindActions = function(v34) --[[ Line: 123 ]] --[[ Name: UnbindActions ]]
    -- upvalues: v21 (copy), l_ContextActionService_0 (copy), v8 (copy)
    if v21() and v34.props.dispatchCentralOverlay then
        l_ContextActionService_0:UnbindAction(v8.CLOSE_MODAL_ACTION);
    end;
end;
v22.BindCancelAction = function(v35) --[[ Line: 129 ]] --[[ Name: BindCancelAction ]]
    -- upvalues: v21 (copy), l_ContextActionService_0 (copy), v8 (copy)
    if v21() and v35.props.dispatchCentralOverlay then
        l_ContextActionService_0:BindAction(v8.CLOSE_MODAL_ACTION, v35.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v22.closeCentralOverlay = function(v36) --[[ Line: 145 ]] --[[ Name: closeCentralOverlay ]]
    -- upvalues: v21 (copy)
    local l_props_3 = v36.props;
    if v21() and l_props_3.dispatchCentralOverlay then
        l_props_3.dispatchCentralOverlay();
    end;
end;
v22.constructRobuxUpsellPromptAnimatorObj = function(v38) --[[ Line: 153 ]] --[[ Name: constructRobuxUpsellPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v18 (copy)
    local l_props_4 = v38.props;
    local l_state_0 = v38.state;
    v38:BindCancelAction();
    return {
        shouldAnimate = l_props_4.shouldAnimate, 
        shouldShow = l_props_4.purchaseState == v6.PurchaseModal, 
        onShown = l_props_4.isDelayedInput and function() --[[ Line: 162 ]]
            -- upvalues: v38 (copy), l_props_4 (copy)
            v38:setState({
                enableInputDelayed = true
            });
            delay(3, function() --[[ Line: 166 ]]
                -- upvalues: v38 (ref), l_props_4 (ref)
                v38:setState({
                    isDelayedInput = false, 
                    enableInputDelayed = false
                });
                if l_props_4.onDelayedInputComplete then
                    l_props_4.onDelayedInputComplete();
                end;
            end);
        end or nil, 
        onHidden = l_props_4.isDelayedInput and function() --[[ Line: 176 ]]
            -- upvalues: v38 (copy), l_props_4 (copy)
            v38:setState({
                isDelayedInput = l_props_4.isDelayedInput, 
                enableInputDelayed = false
            });
        end or nil, 
        renderChildren = function() --[[ Line: 182 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v18 (ref), l_props_4 (copy), l_state_0 (copy), v38 (copy)
            return v5.createElement(v18, {
                screenSize = l_props_4.screenSize, 
                isDelayedInput = l_state_0.isDelayedInput, 
                enableInputDelayed = l_state_0.enableInputDelayed, 
                model = l_props_4.model, 
                itemIcon = l_props_4.itemIcon, 
                itemName = l_props_4.itemName, 
                itemRobuxCost = l_props_4.itemRobuxCost, 
                robuxCostStr = l_props_4.iapCostStr, 
                robuxPurchaseAmount = l_props_4.iapRobuxAmount, 
                balanceAmount = l_props_4.beforeRobuxBalance, 
                buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                cancelControllerIcon = l_props_4.cancelControllerIcon, 
                buyItemActivated = function() --[[ Line: 200 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v38 (ref), l_props_4 (ref)
                    v38:reportUserInput("Buy");
                    l_props_4.purchaseRobux();
                    v38:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function() --[[ Line: 205 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v38 (ref), l_props_4 (ref)
                    v38:reportUserInput("Cancel");
                    l_props_4.cancelPurchase();
                    v38:closeCentralOverlay();
                end, 
                termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 210 ]]
                    -- upvalues: v38 (ref), l_props_4 (ref)
                    v38:reportUserInput("TermsOfService");
                    l_props_4.showTermsOfUse();
                end or nil, 
                isQuest = v38.props.isQuest, 
                isVng = v38.props.isVng
            });
        end
    };
end;
v22.constructU13ConfirmPromptAnimatorObj = function(v41) --[[ Line: 221 ]] --[[ Name: constructU13ConfirmPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v12 (copy)
    local l_props_5 = v41.props;
    v41:BindCancelAction();
    return {
        shouldAnimate = l_props_5.shouldAnimate, 
        shouldShow = l_props_5.purchaseState == v6.PurchaseWarning, 
        renderChildren = function() --[[ Line: 229 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v12 (ref), l_props_5 (copy), v41 (copy)
            return v5.createElement(v12, {
                screenSize = l_props_5.screenSize, 
                modalType = l_props_5.u13ConfirmType, 
                doneControllerIcon = l_props_5.acceptControllerIcon, 
                cancelControllerIcon = l_props_5.cancelControllerIcon, 
                doneActivated = function() --[[ Line: 238 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v41 (ref), l_props_5 (ref)
                    v41:reportUserInput("Confirm");
                    l_props_5.acceptPurchaseWarning();
                    v41:closeCentralOverlay();
                end, 
                cancelActivated = function() --[[ Line: 243 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v41 (ref), l_props_5 (ref)
                    v41:reportUserInput("Cancel");
                    l_props_5.cancelPurchase();
                    v41:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.constructPurchaseErrorPromptAnimatorObj = function(v43) --[[ Line: 253 ]] --[[ Name: constructPurchaseErrorPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v11 (copy)
    local l_props_6 = v43.props;
    v43:BindCancelAction();
    return {
        shouldAnimate = l_props_6.shouldAnimate, 
        shouldShow = l_props_6.purchaseState == v6.Error, 
        renderChildren = function() --[[ Line: 261 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v11 (ref), l_props_6 (copy), v43 (copy)
            return v5.createElement(v11, {
                screenSize = l_props_6.screenSize, 
                errorType = l_props_6.errorType, 
                doneControllerIcon = l_props_6.acceptControllerIcon, 
                doneActivated = function() --[[ Line: 269 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v43 (ref), l_props_6 (ref)
                    v43:reportUserInput("Done");
                    l_props_6.flowComplete();
                    v43:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.constructTwoStepRequiredAnimatorObj = function(v45) --[[ Line: 279 ]] --[[ Name: constructTwoStepRequiredAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v13 (copy)
    local l_props_7 = v45.props;
    v45:BindCancelAction();
    return {
        shouldAnimate = l_props_7.shouldAnimate, 
        shouldShow = l_props_7.purchaseState == v6.TwoStepRequired, 
        renderChildren = function() --[[ Line: 287 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v13 (ref), l_props_7 (copy), v45 (copy)
            return v5.createElement(v13, {
                screenSize = l_props_7.screenSize, 
                doneControllerIcon = l_props_7.acceptControllerIcon, 
                openSecuritySettings = function() --[[ Line: 293 ]] --[[ Name: openSecuritySettings ]]
                    -- upvalues: v45 (ref), l_props_7 (ref)
                    v45:reportUserInput("GoToSecuritySettings");
                    l_props_7.openSecuritySettings();
                    l_props_7.flowComplete();
                    v45:closeCentralOverlay();
                end, 
                closePrompt = function() --[[ Line: 299 ]] --[[ Name: closePrompt ]]
                    -- upvalues: v45 (ref), l_props_7 (ref)
                    v45:reportUserInput("Cancel");
                    l_props_7.flowComplete();
                    v45:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.constructRobuxUpsellSuccessPromptAnimatorObj = function(v47) --[[ Line: 309 ]] --[[ Name: constructRobuxUpsellSuccessPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v17 (copy)
    local l_props_8 = v47.props;
    v47:BindCancelAction();
    return {
        shouldAnimate = l_props_8.shouldAnimate, 
        shouldShow = l_props_8.purchaseState == v6.Success, 
        renderChildren = function() --[[ Line: 317 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v17 (ref), l_props_8 (copy), v47 (copy)
            return v5.createElement(v17, {
                screenSize = l_props_8.screenSize, 
                model = l_props_8.model, 
                itemIcon = l_props_8.itemIcon, 
                itemName = l_props_8.itemName, 
                balance = l_props_8.iapRobuxAmount + l_props_8.beforeRobuxBalance - l_props_8.itemRobuxCost, 
                confirmControllerIcon = l_props_8.acceptControllerIcon, 
                cancelControllerIcon = l_props_8.cancelControllerIcon, 
                doneActivated = function() --[[ Line: 329 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v47 (ref), l_props_8 (ref)
                    v47:reportUserInput("Done");
                    l_props_8.flowComplete();
                    v47:closeCentralOverlay();
                end, 
                equipActivated = l_props_8.equipItem and function() --[[ Line: 334 ]]
                    -- upvalues: v47 (ref), l_props_8 (ref)
                    v47:reportUserInput("Equip");
                    l_props_8.equipItem();
                    v47:closeCentralOverlay();
                end or nil
            });
        end
    };
end;
v22.constructInsufficientRobuxAnimatorObj = function(v49) --[[ Line: 344 ]] --[[ Name: constructInsufficientRobuxAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v14 (copy)
    local l_props_9 = v49.props;
    v49:BindCancelAction();
    return {
        shouldAnimate = l_props_9.shouldAnimate, 
        shouldShow = l_props_9.purchaseState == v6.GenericPurchaseModal, 
        renderChildren = function() --[[ Line: 352 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v14 (ref), l_props_9 (copy), v49 (copy)
            return v5.createElement(v14, {
                screenSize = l_props_9.screenSize, 
                robuxBalance = l_props_9.beforeRobuxBalance, 
                buyRobux = function() --[[ Line: 358 ]] --[[ Name: buyRobux ]]
                    -- upvalues: v49 (ref), l_props_9 (ref)
                    v49:reportUserInput("Buy Robux");
                    l_props_9.openBuyRobux();
                    l_props_9.flowComplete();
                    v49:closeCentralOverlay();
                end, 
                closePrompt = function() --[[ Line: 364 ]] --[[ Name: closePrompt ]]
                    -- upvalues: v49 (ref), l_props_9 (ref)
                    v49:reportUserInput("Cancel");
                    l_props_9.flowComplete();
                    v49:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.constructInsufficientRobuxProductAnimatorObj = function(v51) --[[ Line: 374 ]] --[[ Name: constructInsufficientRobuxProductAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v15 (copy)
    local l_props_10 = v51.props;
    v51:BindCancelAction();
    return {
        shouldAnimate = l_props_10.shouldAnimate, 
        shouldShow = l_props_10.purchaseState == v6.LargeRobuxPurchaseModal, 
        renderChildren = function() --[[ Line: 382 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v15 (ref), l_props_10 (copy), v51 (copy)
            return v5.createElement(v15, {
                screenSize = l_props_10.screenSize, 
                model = l_props_10.model, 
                itemIcon = l_props_10.itemIcon, 
                itemName = l_props_10.itemName, 
                itemRobuxCost = l_props_10.itemRobuxCost, 
                balanceAmount = l_props_10.beforeRobuxBalance, 
                acceptControllerIcon = l_props_10.acceptControllerIcon, 
                cancelControllerIcon = l_props_10.cancelControllerIcon, 
                robuxStoreActivated = function() --[[ Line: 395 ]] --[[ Name: robuxStoreActivated ]]
                    -- upvalues: v51 (ref), l_props_10 (ref)
                    v51:reportUserInput("Go to Robux store");
                    l_props_10.openBuyRobux();
                    v51:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function() --[[ Line: 400 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v51 (ref), l_props_10 (ref)
                    v51:reportUserInput("Cancel");
                    l_props_10.flowComplete();
                    v51:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.constructLeaveRobloxPromptAnimatorObj = function(v53) --[[ Line: 410 ]] --[[ Name: constructLeaveRobloxPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v16 (copy)
    local l_props_11 = v53.props;
    v53:BindCancelAction();
    return {
        shouldAnimate = l_props_11.shouldAnimate, 
        shouldShow = l_props_11.purchaseState == v6.LeaveRobloxWarning, 
        renderChildren = function() --[[ Line: 418 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v16 (ref), l_props_11 (copy), v53 (copy)
            return v5.createElement(v16, {
                screenSize = l_props_11.screenSize, 
                cancelActivated = function() --[[ Line: 422 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v53 (ref)
                    v53:closeCentralOverlay();
                end, 
                continueActivated = function() --[[ Line: 425 ]] --[[ Name: continueActivated ]]
                    -- upvalues: l_props_11 (ref)
                    l_props_11.openVngShop();
                end
            });
        end
    };
end;
v22.constructPurchaseVPCPromptAnimatorObj = function(v55) --[[ Line: 433 ]] --[[ Name: constructPurchaseVPCPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_12 = v55.props;
    v55:BindCancelAction();
    return {
        shouldAnimate = l_props_12.shouldAnimate, 
        shouldShow = l_props_12.purchaseState == v6.PurchaseVPCModal, 
        renderChildren = function() --[[ Line: 441 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_12 (copy), v55 (copy)
            return v5.createElement(l_VerifiedParentalConsentDialog_0, {
                screenSize = l_props_12.screenSize, 
                isActionable = l_props_12.openSettingsPage ~= nil, 
                modalType = l_props_12.purchaseVPCType, 
                onAction = l_props_12.openSettingsPage and function() --[[ Line: 446 ]]
                    -- upvalues: v55 (ref), l_props_12 (ref)
                    v55:reportUserInput("Confirm");
                    l_props_12.openSettingsPage();
                    l_props_12.flowComplete();
                end, 
                onDismiss = function() --[[ Line: 451 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v55 (ref), l_props_12 (ref)
                    v55:reportUserInput("Cancel");
                    l_props_12.cancelPurchase();
                    v55:closeCentralOverlay();
                end
            });
        end
    };
end;
v22.dispatchCentralOverlayAndRenderModal = function(v57, v58) --[[ Line: 463 ]] --[[ Name: dispatchCentralOverlayAndRenderModal ]]
    -- upvalues: v21 (copy), v6 (copy), v8 (copy)
    if not v21() or not v58.dispatchCentralOverlay then
        return;
    else
        local l_purchaseState_0 = v58.purchaseState;
        if l_purchaseState_0 == v6.PurchaseModal then
            v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructRobuxUpsellPromptAnimatorObj());
            return;
        else
            if l_purchaseState_0 == v6.PurchaseWarning then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructU13ConfirmPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Error then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructPurchaseErrorPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.TwoStepRequired then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructTwoStepRequiredAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Success then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructRobuxUpsellSuccessPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.GenericPurchaseModal then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructInsufficientRobuxAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LargeRobuxPurchaseModal then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructInsufficientRobuxProductAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LeaveRobloxWarning then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructLeaveRobloxPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.PurchaseVPCModal then
                v58.dispatchCentralOverlay(v8.CENTRAL_OVERLAY_TYPE_ANIMATOR, v57:constructPurchaseVPCPromptAnimatorObj());
            end;
            return;
        end;
    end;
end;
v22.reportModalShown = function(v60) --[[ Line: 541 ]] --[[ Name: reportModalShown ]]
    -- upvalues: v19 (copy), v6 (copy)
    local l_props_13 = v60.props;
    local l_state_1 = v60.state;
    if not v60.props.onAnalyticEvent then
        return;
    else
        local v63 = v19(l_state_1.analyticId, l_props_13.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_13.purchaseState));
        l_props_13.onAnalyticEvent("UserPurchaseFlow", v63);
        return;
    end;
end;
v22.reportUserInput = function(v64, v65) --[[ Line: 559 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v20 (copy), v6 (copy), l_Players_0 (copy), l_default_0 (copy), v24 (copy)
    local l_props_14 = v64.props;
    local l_state_2 = v64.state;
    local v68 = v20(l_state_2.analyticId, l_props_14.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_14.purchaseState), v65);
    if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and v64.props.onAnalyticEvent then
        l_props_14.onAnalyticEvent("UserPurchaseFlow", v68);
    end;
    if game:GetFastFlag("EnableSchematizedInGameRobuxUpsellEvent2") then
        local v69 = nil;
        if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then
            v69 = l_Players_0.LocalPlayer.UserId;
        end;
        l_default_0:logRobloxTelemetryEvent(v24, {
            l_default_0.StandardizedFields.addOsInfo, 
            l_default_0.StandardizedFields.addSessionId
        }, {
            universe_id = game.GameId, 
            price = l_props_14.itemRobuxCost, 
            view_name = v68.view_name, 
            purchase_event_type = v68.purchase_event_type, 
            input_type = v65, 
            user_id = tostring(v69)
        });
    end;
end;
v22.purchaseStateToOverlayState = function(_, v71) --[[ Line: 596 ]] --[[ Name: purchaseStateToOverlayState ]]
    -- upvalues: v6 (copy), v10 (copy)
    if v71 == v6.Loading then
        return v10.Loading;
    elseif v71 == v6.RobuxPurchasePending then
        return v10.PurchasingRobux;
    elseif v71 == v6.RobuxGrantPending then
        return v10.WaitingForRobux;
    elseif v71 == v6.ItemPurchasePending then
        return v10.PurchasingItem;
    elseif v71 == v6.None then
        return nil;
    else
        return v10.None;
    end;
end;
v22.getChildrenElements = function(v72) --[[ Line: 613 ]] --[[ Name: getChildrenElements ]]
    -- upvalues: v5 (copy), v7 (copy)
    return {
        RobuxUpsellPromptAnimator = v5.createElement(v7, v72:constructRobuxUpsellPromptAnimatorObj()), 
        U13ConfirmPromptAnimator = v5.createElement(v7, v72:constructU13ConfirmPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v5.createElement(v7, v72:constructPurchaseErrorPromptAnimatorObj()), 
        TwoStepRequiredAnimator = v5.createElement(v7, v72:constructTwoStepRequiredAnimatorObj()), 
        RobuxUpsellSuccessPromptAnimator = v5.createElement(v7, v72:constructRobuxUpsellSuccessPromptAnimatorObj()), 
        InsufficientRobuxAnimator = v5.createElement(v7, v72:constructInsufficientRobuxAnimatorObj()), 
        InsufficientRobuxProductAnimator = v5.createElement(v7, v72:constructInsufficientRobuxProductAnimatorObj()), 
        PurchaseVPCPromptAnimator = v5.createElement(v7, v72:constructPurchaseVPCPromptAnimatorObj())
    };
end;
v22.render = function(v73) --[[ Line: 632 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v5 (copy), v9 (copy)
    local l_props_15 = v73.props;
    local v75 = {};
    if not v21() or not l_props_15.dispatchCentralOverlay then
        v75 = v73:getChildrenElements();
    end;
    return v5.createElement(v9, {
        shouldAnimate = l_props_15.shouldAnimate, 
        loadingState = v73:purchaseStateToOverlayState(l_props_15.purchaseState)
    }, v75);
end;
return v22;