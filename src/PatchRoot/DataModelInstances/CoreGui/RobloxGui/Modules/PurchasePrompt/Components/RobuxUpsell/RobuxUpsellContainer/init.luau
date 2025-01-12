local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v7 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v9 = require(l_Parent_0.Enums.PurchaseFlow);
local v10 = require(l_Parent_0.Thunks.completeRequest);
local v11 = require(l_Parent_0.Thunks.purchaseItem);
local v12 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v13 = require(l_Parent_0.Thunks.openRobuxStore);
local v14 = require(l_Parent_0.Thunks.openSecuritySettings);
local v15 = require(l_Parent_0.Thunks.openTermsOfUse);
local v16 = require(l_Parent_0.Thunks.initiatePurchasePrecheck);
local v17 = require(l_Parent_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local v18 = require(l_Parent_0.Thunks.sendEvent);
local v19 = require(l_Parent_0.Utils.isMockingPurchases);
local v20 = require(l_Parent_0.Utils.getPlayerPrice);
local v21 = require(l_Parent_0.Utils.isLinksAllowed);
local v22 = require(l_Parent_0.connectToStore);
local v23 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local _ = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v25 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabledAllPlatforms);
local v26 = require(l_Parent_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local v27 = require(script.Parent.RobuxUpsellOverlay);
local v28 = l_Roact_0.Component:extend(script.Name);
local v29 = game:DefineFastFlag("FixLimitedUMobilePurchasePrompt", false);
local v30 = require(l_Parent_0.Flags.GetFFlagEnableTexasU18VPCForInExperienceRobuxUpsellFlow);
v28.init = function(v31) --[[ Line: 53 ]] --[[ Name: init ]]
    v31.state = {
        screenSize = Vector2.new(0, 0)
    };
    v31.changeScreenSize = function(v32) --[[ Line: 58 ]]
        -- upvalues: v31 (copy)
        if v31.state.screenSize ~= v32.AbsoluteSize then
            v31:setState({
                screenSize = v32.AbsoluteSize
            });
        end;
    end;
end;
v28.createElement = function(v33) --[[ Line: 67 ]] --[[ Name: createElement ]]
    -- upvalues: v9 (copy), v21 (copy), v29 (copy), v20 (copy), l_Roact_0 (copy), v27 (copy), v25 (copy), v23 (copy), l_GuiService_0 (copy)
    local l_props_0 = v33.props;
    local l_state_0 = v33.state;
    if l_props_0.purchaseFlow ~= v9.RobuxUpsellV2 and l_props_0.purchaseFlow ~= v9.LargeRobuxUpsell then
        return nil;
    else
        local v36 = v21();
        local l_imageUrl_0 = l_props_0.productInfo.imageUrl;
        if string.find(l_props_0.productInfo.imageUrl, "assetid=0") then
            l_imageUrl_0 = nil;
        end;
        local v38 = v29 and v20(l_props_0.productInfo, l_props_0.accountInfo.membershipType == 4, l_props_0.expectedPrice) or v20(l_props_0.productInfo, l_props_0.accountInfo.membershipType == 4);
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v33.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v27, {
                screenSize = l_state_0.screenSize, 
                requestType = l_props_0.requestType, 
                promptState = l_props_0.promptState, 
                purchaseFlow = l_props_0.purchaseFlow, 
                purchaseError = l_props_0.purchaseError, 
                robuxProviderId = l_props_0.nativeUpsell.robuxProductId, 
                robuxProductId = l_props_0.nativeUpsell.productId, 
                itemIcon = l_imageUrl_0, 
                itemName = l_props_0.productInfo.name, 
                itemRobuxCost = v38, 
                iapRobuxAmount = l_props_0.nativeUpsell.robuxPurchaseAmount or 0, 
                beforeRobuxBalance = l_props_0.accountInfo.balance, 
                isTestPurchase = l_props_0.isTestPurchase, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                purchaseItem = l_props_0.purchaseItem, 
                promptRobuxPurchase = l_props_0.promptRobuxPurchase, 
                openRobuxStore = l_props_0.openRobuxStore, 
                openTermsOfUse = v36 and l_props_0.openTermsOfUse or nil, 
                openSecuritySettings = v36 and l_props_0.openSecuritySettings or nil, 
                dispatchFetchPurchaseWarning = l_props_0.dispatchFetchPurchaseWarning, 
                endPurchase = l_props_0.completeRequest, 
                onAnalyticEvent = l_props_0.onAnalyticEvent, 
                humanoidModel = if v25 then l_props_0.humanoidModel else nil
            }), 
            ModalFix = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }), 
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v23, {
                event = l_GuiService_0.MenuOpened, 
                callback = function() --[[ Line: 132 ]] --[[ Name: callback ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v28.render = function(v39) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), v7 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v26() then
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationEffects = v4.createElement(v7, {
                selectionGroupName = "RobuxUpsellContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                RobuxUpsellContainer = v39:createElement()
            })
        });
    else
        return v39:createElement();
    end;
end;
return (v22(function(v40) --[[ Line: 154 ]]
    -- upvalues: v25 (copy), v29 (copy), v19 (copy)
    local v41 = if v25 then v40.promptRequest.humanoidModel else nil;
    if v29 then
        return {
            purchaseFlow = v40.purchaseFlow, 
            requestType = v40.promptRequest.requestType, 
            expectedPrice = v40.promptRequest.expectedPrice, 
            promptState = v40.promptState, 
            purchaseError = v40.purchaseError, 
            productInfo = v40.productInfo, 
            accountInfo = v40.accountInfo, 
            nativeUpsell = v40.nativeUpsell, 
            isTestPurchase = v19(), 
            isGamepadEnabled = v40.gamepadEnabled, 
            humanoidModel = v41
        };
    else
        return {
            purchaseFlow = v40.purchaseFlow, 
            requestType = v40.promptRequest.requestType, 
            promptState = v40.promptState, 
            purchaseError = v40.purchaseError, 
            productInfo = v40.productInfo, 
            accountInfo = v40.accountInfo, 
            nativeUpsell = v40.nativeUpsell, 
            isTestPurchase = v19(), 
            isGamepadEnabled = v40.gamepadEnabled, 
            humanoidModel = v41
        };
    end;
end, function(v42) --[[ Line: 193 ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v30 (copy), v17 (copy), v16 (copy), l_GuiService_0 (copy), v10 (copy), v18 (copy)
    return {
        purchaseItem = function() --[[ Line: 195 ]] --[[ Name: purchaseItem ]]
            -- upvalues: v42 (copy), v11 (ref)
            return v42(v11());
        end, 
        promptRobuxPurchase = function() --[[ Line: 198 ]] --[[ Name: promptRobuxPurchase ]]
            -- upvalues: v42 (copy), v12 (ref)
            return v42(v12());
        end, 
        openRobuxStore = function() --[[ Line: 201 ]] --[[ Name: openRobuxStore ]]
            -- upvalues: v42 (copy), v13 (ref)
            return v42(v13());
        end, 
        openSecuritySettings = function() --[[ Line: 204 ]] --[[ Name: openSecuritySettings ]]
            -- upvalues: v42 (copy), v14 (ref)
            return v42(v14());
        end, 
        openTermsOfUse = function() --[[ Line: 207 ]] --[[ Name: openTermsOfUse ]]
            -- upvalues: v42 (copy), v15 (ref)
            return v42(v15());
        end, 
        dispatchFetchPurchaseWarning = function() --[[ Line: 210 ]] --[[ Name: dispatchFetchPurchaseWarning ]]
            -- upvalues: v30 (ref), v42 (copy), v17 (ref), v16 (ref)
            if v30() then
                return v42(v17());
            else
                return v42(v16());
            end;
        end, 
        completeRequest = function() --[[ Line: 217 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_GuiService_0 (ref), v42 (copy), v10 (ref)
            l_GuiService_0.SelectedCoreObject = nil;
            return v42(v10());
        end, 
        onAnalyticEvent = function(v43, v44) --[[ Line: 221 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v42 (copy), v18 (ref)
            return v42(v18(v43, v44));
        end
    };
end)(v28));