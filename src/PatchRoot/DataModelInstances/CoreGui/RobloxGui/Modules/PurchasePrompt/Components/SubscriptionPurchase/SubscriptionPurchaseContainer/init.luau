local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v9 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v11 = require(l_Parent_0.Enums.RequestType);
local v12 = require(l_Parent_0.Thunks.completeRequest);
local v13 = require(l_Parent_0.Thunks.launchSubscriptionPurchase);
local v14 = require(l_Parent_0.Thunks.sendEvent);
local v15 = require(l_Parent_0.connectToStore);
local v16 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v17 = require(script.Parent.SubscriptionPurchaseOverlay);
local l_SetCurrentToastMessage_0 = v5.Actions.SetCurrentToastMessage;
local v19 = l_Roact_0.Component:extend(script.Name);
local v20 = require(l_Parent_0.Flags.GetFFlagFixPlayerGuiSelectionBugOnPromptExit);
local v21 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
local v22 = require(l_Parent_0.Flags.GetFFlagEnableSubscriptionPurchaseToast);
v19.init = function(v23) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    v23.state = {
        screenSize = Vector2.new(0, 0)
    };
    v23.changeScreenSize = function(v24) --[[ Line: 42 ]]
        -- upvalues: v23 (copy)
        if v23.state.screenSize ~= v24.AbsoluteSize then
            v23:setState({
                screenSize = v24.AbsoluteSize
            });
        end;
    end;
    if v20() then
        v23.savedSelectedCoreObject = nil;
        v23.endPurchase = function() --[[ Line: 51 ]]
            -- upvalues: v23 (copy)
            v23:restoreSelectedObject();
            v23.props.completeRequest();
        end;
    end;
end;
v19.saveSelectedObject = function(v25) --[[ Line: 58 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: v20 (copy), l_GuiService_0 (copy)
    if not v20() then
        return;
    else
        v25.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
        l_GuiService_0.SelectedCoreObject = nil;
        return;
    end;
end;
v19.restoreSelectedObject = function(v26) --[[ Line: 67 ]] --[[ Name: restoreSelectedObject ]]
    -- upvalues: v20 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    if not v20() then
        return;
    else
        if v26.savedSelectedCoreObject == nil or v26.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedCoreObject = v26.savedSelectedCoreObject;
        end;
        return;
    end;
end;
v19.createElement = function(v27) --[[ Line: 78 ]] --[[ Name: createElement ]]
    -- upvalues: v20 (copy), v21 (copy), l_Roact_0 (copy), v17 (copy), v16 (copy), l_GuiService_0 (copy)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    if v20() then
        v27:saveSelectedObject();
    end;
    local v30 = nil;
    local v31 = nil;
    local l_subscriptionPurchaseInfo_0 = l_props_0.subscriptionPurchaseInfo;
    if v21() and l_subscriptionPurchaseInfo_0 ~= nil then
        v30 = l_subscriptionPurchaseInfo_0.PrimaryPaymentProviderType;
        v31 = if l_subscriptionPurchaseInfo_0.AllPaymentProviderTypes then l_subscriptionPurchaseInfo_0.AllPaymentProviderTypes[2] else nil;
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v27.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Prompt = l_Roact_0.createElement(v17, {
            screenSize = l_state_0.screenSize, 
            promptState = l_props_0.promptState, 
            purchaseError = l_props_0.purchaseError, 
            subscriptionId = l_props_0.subscriptionId, 
            name = l_props_0.subscriptionPurchaseInfo.Name, 
            subscriptionProviderId = l_props_0.subscriptionPurchaseInfo.SubscriptionProviderId, 
            subscriptionProviderName = l_props_0.subscriptionPurchaseInfo.SubscriptionProviderName, 
            priceTier = l_props_0.subscriptionPurchaseInfo.PriceTier, 
            displayPrice = l_props_0.subscriptionPurchaseInfo.DisplayPrice, 
            period = l_props_0.subscriptionPurchaseInfo.DisplaySubscriptionPeriod, 
            disclaimerText = l_props_0.subscriptionPurchaseInfo.DisclaimerText, 
            description = l_props_0.subscriptionPurchaseInfo.Description, 
            itemIcon = l_props_0.subscriptionPurchaseInfo.ImageUrl, 
            primaryPaymentMethod = v30, 
            secondaryPaymentMethod = v31, 
            isGamepadEnabled = l_props_0.isGamepadEnabled, 
            isTestingMode = l_props_0.subscriptionPurchaseInfo.IsTestingMode, 
            promptSubscriptionPurchase = l_props_0.promptSubscriptionPurchase, 
            endPurchase = if v20() then v27.endPurchase else l_props_0.completeRequest, 
            onAnalyticEvent = l_props_0.onAnalyticEvent, 
            setCurrentToastMessage = l_props_0.setCurrentToastMessage
        }), 
        ModalFix = l_Roact_0.createElement("ImageButton", {
            BackgroundTransparency = 0, 
            Modal = true, 
            Size = UDim2.new(0, 0, 0, 0)
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v16, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 137 ]] --[[ Name: callback ]]
                -- upvalues: l_props_0 (copy)
                l_props_0.completeRequest();
            end
        })
    });
end;
v19.render = function(v33) --[[ Line: 144 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), v9 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v33.props.requestType ~= v11.Subscription then
        return nil;
    else
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationEffects = v4.createElement(v9, {
                selectionGroupName = "SubscriptionPurchaseContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                SubscriptionPurchaseContainer = v33:createElement()
            })
        });
    end;
end;
return (v15(function(v34) --[[ Line: 158 ]]
    return {
        requestType = v34.promptRequest.requestType, 
        promptState = v34.promptState, 
        purchaseError = v34.purchaseError, 
        subscriptionPurchaseInfo = v34.subscriptionPurchaseInfo, 
        subscriptionId = v34.promptRequest.id, 
        isGamepadEnabled = v34.gamepadEnabled
    };
end, function(v35) --[[ Line: 169 ]]
    -- upvalues: v13 (copy), v12 (copy), v14 (copy), v22 (copy), l_SetCurrentToastMessage_0 (copy)
    return {
        promptSubscriptionPurchase = function(v36) --[[ Line: 171 ]] --[[ Name: promptSubscriptionPurchase ]]
            -- upvalues: v35 (copy), v13 (ref)
            return v35(v13(v36));
        end, 
        completeRequest = function() --[[ Line: 174 ]] --[[ Name: completeRequest ]]
            -- upvalues: v35 (copy), v12 (ref)
            return v35(v12());
        end, 
        onAnalyticEvent = function(v37, v38) --[[ Line: 177 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v35 (copy), v14 (ref)
            return v35(v14(v37, v38));
        end, 
        setCurrentToastMessage = v22() and function(v39) --[[ Line: 181 ]]
            -- upvalues: v35 (copy), l_SetCurrentToastMessage_0 (ref)
            v35(l_SetCurrentToastMessage_0(v39));
        end or nil
    };
end)(v19));