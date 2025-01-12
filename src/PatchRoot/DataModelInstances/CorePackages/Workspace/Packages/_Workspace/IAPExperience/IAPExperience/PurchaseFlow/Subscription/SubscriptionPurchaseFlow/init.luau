local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local l_getPartialPageModalMiddleContentWidth_0 = require(l_Parent_2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v6 = require(l_Parent_0.SubscriptionPurchaseFlowState);
local v7 = require(l_Parent_1.Generic.Animator);
local v8 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v9 = require(l_Parent_1.Subscription.SubscriptionPurchasePrompt);
local v10 = require(l_Parent_1.Flags.getEnableSubscriptionPurchaseInstrumentation);
local v11 = require(l_Parent_1.Flags.getEnableDisableSubPurchase);
local v12 = require(l_Parent_1.Utility.formatSubscriptionPurchaseEventData);
local v13 = require(l_Parent_1.Flags.GetFFlagEnableRobloxCreditPurchase);
local v14 = v4.Component:extend(script.Name);
local l_Generic_0 = l_Parent_1.Generic;
local v16 = require(l_Generic_0.PurchaseFlowType);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
v14.init = function(v18) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    v18.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
end;
v14.didUpdate = function(v19, v20, _) --[[ Line: 82 ]] --[[ Name: didUpdate ]]
    -- upvalues: v10 (copy)
    local l_props_0 = v19.props;
    if v20.purchaseState ~= l_props_0.purchaseState and v10() then
        v19:reportPurchaseEvent("ViewShown");
    end;
end;
v14.reportUserInput = function(v23, v24) --[[ Line: 92 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v10 (copy)
    if not v10() then
        return;
    else
        v23:reportPurchaseEvent("UserInput", v24);
        return;
    end;
end;
v14.reportPurchaseEvent = function(v25, v26, v27) --[[ Line: 100 ]] --[[ Name: reportPurchaseEvent ]]
    -- upvalues: v10 (copy), v12 (copy), v6 (copy)
    if not v10() then
        return;
    else
        local l_props_1 = v25.props;
        if not v25.props.onAnalyticEvent then
            return;
        else
            local v29 = v12(v25.state.analyticId, v26, v6.toRawValue(l_props_1.purchaseState), v27, l_props_1.subscriptionProviderId, l_props_1.subscriptionId, l_props_1.name, l_props_1.description, l_props_1.period, l_props_1.priceTier, l_props_1.displayPrice);
            l_props_1.onAnalyticEvent("SubscriptionPurchase", v29);
            return;
        end;
    end;
end;
v14.render = function(v30) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (copy), v4 (copy), v7 (copy), v6 (copy), v9 (copy), v11 (copy), v13 (copy), v8 (copy), v16 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_2 = v30.props;
    local l_purchaseState_0 = l_props_2.purchaseState;
    local v33 = l_getPartialPageModalMiddleContentWidth_0(l_props_2.screenSize.X);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        SubscriptionPurchasePromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.PurchaseModal, 
            shouldAnimate = true, 
            animateDown = v33 == 492, 
            renderChildren = function() --[[ Line: 142 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v9 (ref), l_props_2 (copy), v11 (ref), v13 (ref), v30 (copy)
                return v4.createElement(v9, {
                    name = l_props_2.name, 
                    subscriptionProviderName = l_props_2.subscriptionProviderName, 
                    displayPrice = l_props_2.displayPrice, 
                    period = l_props_2.period, 
                    disclaimerText = l_props_2.disclaimerText, 
                    description = l_props_2.description, 
                    itemIcon = l_props_2.itemIcon, 
                    disablePurchase = if v11() then l_props_2.disablePurchase else nil, 
                    disablePurchaseText = if v11() then l_props_2.disablePurchaseText else nil, 
                    primaryPaymentMethod = if v13() then l_props_2.primaryPaymentMethod else nil, 
                    secondaryPaymentMethod = if v13() then l_props_2.secondaryPaymentMethod else nil, 
                    isTestingMode = l_props_2.isTestingMode, 
                    screenSize = l_props_2.screenSize, 
                    purchaseSubscriptionActivated = function(v34) --[[ Line: 164 ]] --[[ Name: purchaseSubscriptionActivated ]]
                        -- upvalues: v30 (ref), l_props_2 (ref)
                        v30:reportUserInput("Subscribe");
                        l_props_2.purchaseSubscription(v34);
                        if l_props_2.isTestingMode then
                            l_props_2.flowComplete();
                        end;
                    end, 
                    cancelPurchaseActivated = function() --[[ Line: 171 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v30 (ref), l_props_2 (ref)
                        v30:reportUserInput("Cancel");
                        l_props_2.cancelPurchase();
                    end
                });
            end
        }), 
        PurchaseErrorPromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.Error, 
            shouldAnimate = true, 
            renderChildren = function() --[[ Line: 181 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v8 (ref), l_props_2 (copy), v16 (ref), v30 (copy)
                return v4.createElement(v8, {
                    screenSize = l_props_2.screenSize, 
                    errorType = l_props_2.errorType, 
                    flowType = v16.Subscription, 
                    doneControllerIcon = l_props_2.acceptControllerIcon, 
                    doneActivated = function() --[[ Line: 189 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v30 (ref), l_props_2 (ref)
                        v30:reportUserInput("Done");
                        l_props_2.flowComplete();
                    end
                });
            end
        }), 
        PurchaseVPCPromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.PurchaseVPCModal, 
            shouldAnimate = true, 
            renderChildren = function() --[[ Line: 199 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_2 (copy), v30 (copy)
                return v4.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = l_props_2.screenSize, 
                    isActionable = l_props_2.openSettingsPage ~= nil, 
                    modalType = l_props_2.purchaseVPCType, 
                    onAction = l_props_2.openSettingsPage and function() --[[ Line: 204 ]]
                        -- upvalues: v30 (ref), l_props_2 (ref)
                        v30:reportUserInput("Confirm");
                        l_props_2.openSettingsPage();
                        l_props_2.flowComplete();
                    end, 
                    onDismiss = function() --[[ Line: 209 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v30 (ref), l_props_2 (ref)
                        v30:reportUserInput("Cancel");
                        l_props_2.cancelPurchase();
                    end
                });
            end
        })
    });
end;
return v14;