local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.Packages.React);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v8 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v10 = require(l_Parent_0.Enums.RequestType);
local v11 = require(l_Parent_0.Thunks.completeRequest);
local v12 = require(l_Parent_0.Thunks.launchPremiumUpsell);
local v13 = require(l_Parent_0.Thunks.sendEvent);
local v14 = require(l_Parent_0.connectToStore);
local v15 = require(l_Parent_0.Thunks.initiatePremiumPrecheck);
local v16 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v17 = require(script.Parent.PremiumUpsellOverlay);
local v18 = require(l_Parent_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local v19 = l_Roact_0.Component:extend(script.Name);
local v20 = require(l_Parent_0.Flags.GetFFlagFixPlayerGuiSelectionBugOnPromptExitPremium);
v19.init = function(v21) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    v21.state = {
        screenSize = Vector2.new(0, 0)
    };
    v21.changeScreenSize = function(v22) --[[ Line: 43 ]]
        -- upvalues: v21 (copy)
        if v21.state.screenSize ~= v22.AbsoluteSize then
            v21:setState({
                screenSize = v22.AbsoluteSize
            });
        end;
    end;
    if v20() then
        v21.savedSelectedCoreObject = nil;
        v21.endPurchase = function() --[[ Line: 52 ]]
            -- upvalues: v21 (copy)
            v21:restoreSelectedObject();
            v21.props.completeRequest();
        end;
    end;
end;
v19.saveSelectedObject = function(v23) --[[ Line: 59 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: v20 (copy), l_GuiService_0 (copy)
    if not v20() then
        return;
    else
        v23.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
        l_GuiService_0.SelectedCoreObject = nil;
        return;
    end;
end;
v19.restoreSelectedObject = function(v24) --[[ Line: 68 ]] --[[ Name: restoreSelectedObject ]]
    -- upvalues: v20 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    if not v20() then
        return;
    else
        if v24.savedSelectedCoreObject == nil or v24.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedCoreObject = v24.savedSelectedCoreObject;
        end;
        return;
    end;
end;
v19.createElement = function(v25) --[[ Line: 79 ]] --[[ Name: createElement ]]
    -- upvalues: v10 (copy), v20 (copy), l_Roact_0 (copy), v17 (copy), v16 (copy), l_GuiService_0 (copy)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    if l_props_0.requestType ~= v10.Premium then
        return nil;
    else
        if v20() then
            v25:saveSelectedObject();
        end;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v25.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v17, {
                screenSize = l_state_0.screenSize, 
                promptState = l_props_0.promptState, 
                purchaseError = l_props_0.purchaseError, 
                currencySymbol = l_props_0.premiumProductInfo.currencySymbol, 
                robuxPrice = l_props_0.premiumProductInfo.price, 
                robuxAmount = l_props_0.premiumProductInfo.robuxAmount, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                promptPremiumPurchase = l_props_0.promptPremiumPurchase, 
                dispatchPremiumPrecheck = l_props_0.dispatchPremiumPrecheck, 
                endPurchase = if v20() then v25.endPurchase else l_props_0.completeRequest, 
                onAnalyticEvent = l_props_0.onAnalyticEvent
            }), 
            ModalFix = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }), 
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v16, {
                event = l_GuiService_0.MenuOpened, 
                callback = function() --[[ Line: 124 ]] --[[ Name: callback ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v19.render = function(v28) --[[ Line: 131 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), v8 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v18() then
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationEffects = v4.createElement(v8, {
                selectionGroupName = "PremiumUpsellContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                PremiumUpsellContainer = v28:createElement()
            })
        });
    else
        return v28:createElement();
    end;
end;
return (v14(function(v29) --[[ Line: 146 ]]
    return {
        requestType = v29.promptRequest.requestType, 
        promptState = v29.promptState, 
        purchaseError = v29.purchaseError, 
        premiumProductInfo = v29.premiumProductInfo, 
        isGamepadEnabled = v29.gamepadEnabled
    };
end, function(v30) --[[ Line: 157 ]]
    -- upvalues: v12 (copy), v11 (copy), v13 (copy), v15 (copy)
    return {
        promptPremiumPurchase = function() --[[ Line: 159 ]] --[[ Name: promptPremiumPurchase ]]
            -- upvalues: v30 (copy), v12 (ref)
            return v30(v12());
        end, 
        completeRequest = function() --[[ Line: 162 ]] --[[ Name: completeRequest ]]
            -- upvalues: v30 (copy), v11 (ref)
            return v30(v11());
        end, 
        onAnalyticEvent = function(v31, v32) --[[ Line: 165 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v30 (copy), v13 (ref)
            return v30(v13(v31, v32));
        end, 
        dispatchPremiumPrecheck = function() --[[ Line: 168 ]] --[[ Name: dispatchPremiumPrecheck ]]
            -- upvalues: v30 (copy), v15 (ref)
            return v30(v15());
        end
    };
end)(v19));