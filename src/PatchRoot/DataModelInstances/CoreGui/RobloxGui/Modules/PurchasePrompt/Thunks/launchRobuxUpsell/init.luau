local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Parent_0.Actions.ErrorOccurred);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Enums.UpsellFlow);
local v6 = require(l_Parent_0.Enums.PromptState);
local v7 = require(l_Parent_0.Enums.PurchaseError);
local v8 = require(l_Parent_0.Enums.PurchaseFlow);
local v9 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v10 = require(l_Parent_0.Misc.Constants);
local v11 = require(l_Parent_0.Network.postPurchaseWarningAcknowledge);
local v12 = require(l_Parent_0.Services.Analytics);
local v13 = require(l_Parent_0.Services.ExternalSettings);
local v14 = require(l_Parent_0.Services.Network);
local v15 = require(l_Parent_0.Services.PlatformInterface);
local v16 = require(l_Parent_0.Thunk);
local v17 = require(l_Parent_0.Promise);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnablePreSignedVngShopRedirectUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePreSignedVngShopRedirectUrl;
local l_GetFStringVNGWebshopUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVNGWebshopUrl;
local v21 = require(script.Parent.retryAfterUpsell);
local v22 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_PreparePaymentCheck_0 = v22.PreparePaymentCheck;
local l_GetEnableConsolePreparePaymentCheck_0 = v22.GetEnableConsolePreparePaymentCheck;
local v25 = {
    v12, 
    v13, 
    v14, 
    v15
};
return function() --[[ Line: 41 ]] --[[ Name: launchRobuxUpsell ]]
    -- upvalues: v16 (copy), v25 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v9 (copy), v5 (copy), l_GetEnableConsolePreparePaymentCheck_0 (copy), l_PreparePaymentCheck_0 (copy), v3 (copy), v7 (copy), v6 (copy), v11 (copy), l_getAppFeaturePolicies_0 (copy), l_FFlagEnablePreSignedVngShopRedirectUrl_0 (copy), v4 (copy), l_GetFStringVNGWebshopUrl_0 (copy), v8 (copy), l_Players_0 (copy), v17 (copy), v10 (copy), v21 (copy)
    return v16.new(script.Name, v25, function(v26, v27) --[[ Line: 42 ]]
        -- upvalues: v12 (ref), v13 (ref), v14 (ref), v15 (ref), v9 (ref), v5 (ref), l_GetEnableConsolePreparePaymentCheck_0 (ref), l_PreparePaymentCheck_0 (ref), v3 (ref), v7 (ref), v6 (ref), v11 (ref), l_getAppFeaturePolicies_0 (ref), l_FFlagEnablePreSignedVngShopRedirectUrl_0 (ref), v4 (ref), l_GetFStringVNGWebshopUrl_0 (ref), v8 (ref), l_Players_0 (ref), v17 (ref), v10 (ref), v21 (ref)
        local v28 = v27[v12];
        local v29 = v27[v13];
        local v30 = v27[v14];
        local v31 = v27[v15];
        local v32 = v26:getState();
        local v33 = v9(v29.getPlatform());
        local v34 = false;
        if v33 ~= v5.Web then
            v34 = v32.nativeUpsell.robuxProductId;
        end;
        local l_productId_0 = v32.productInfo.productId;
        if l_GetEnableConsolePreparePaymentCheck_0() and not l_PreparePaymentCheck_0(v34) then
            v26:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
            return;
        else
            if v32.promptState == v6.U13PaymentModal then
                v28.signalScaryModalConfirmed(l_productId_0, "U13PaymentModal", v34);
            elseif v32.promptState == v6.U13MonthlyThreshold1Modal then
                v28.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold1Modal", v34);
            elseif v32.promptState == v6.U13MonthlyThreshold2Modal then
                v28.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold2Modal", v34);
            elseif v32.promptState == v6.ParentalConsentWarningPaymentModal13To17 then
                v28.signalScaryModalConfirmed(l_productId_0, "ConfirmedParentalConsentWarningPaymentModal13To17", v34);
            end;
            if v32.promptState == v6.U13PaymentModal then
                v11.Post(v30, v11.UserActionType.ConfirmedU13PaymentModal);
            elseif v32.promptState == v6.U13MonthlyThreshold1Modal then
                v11.Post(v30, v11.UserActionType.ConfirmedU13MonthlyThreshold1Modal);
            elseif v32.promptState == v6.U13MonthlyThreshold2Modal then
                v11.Post(v30, v11.UserActionType.ConfirmedU13MonthlyThreshold2Modal);
            elseif v32.promptState == v6.ParentalConsentWarningPaymentModal13To17 then
                v11.Post(v30, v11.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17);
            end;
            if v29.getFFlagDisableRobuxUpsell() then
                v26:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
                return;
            elseif v33 == v5.Web then
                local l_requestType_0 = v32.requestType;
                v28.signalProductPurchaseUpsellConfirmed(l_productId_0, l_requestType_0, v32.nativeUpsell.productId);
                if l_getAppFeaturePolicies_0().getRedirectBuyRobuxToVNG() then
                    if v32.promptState == v6.LeaveRobloxWarning then
                        if l_FFlagEnablePreSignedVngShopRedirectUrl_0 then
                            v30:getVngShopUrl():andThen(function(v37) --[[ Line: 95 ]]
                                -- upvalues: v31 (copy), v26 (copy), v4 (ref), v6 (ref)
                                v31.openVngStore(v37.vngShopRedirectUrl);
                                v26:dispatch(v4(v6.UpsellInProgress));
                            end):catch(function() --[[ Line: 98 ]]
                                -- upvalues: v31 (copy), l_GetFStringVNGWebshopUrl_0 (ref), v26 (copy), v4 (ref), v6 (ref)
                                v31.openVngStore(l_GetFStringVNGWebshopUrl_0());
                                v26:dispatch(v4(v6.UpsellInProgress));
                            end);
                            return;
                        else
                            v31.openVngStore();
                            v26:dispatch(v4(v6.UpsellInProgress));
                            return;
                        end;
                    else
                        v26:dispatch(v4(v6.LeaveRobloxWarning));
                        return;
                    end;
                else
                    local l_purchaseFlow_0 = v32.purchaseFlow;
                    if l_purchaseFlow_0 == v8.RobuxUpsellV2 or l_purchaseFlow_0 == v8.LargeRobuxUpsell then
                        v31.startRobuxUpsellWeb(v32.nativeUpsell.productId);
                    else
                        v31.startRobuxUpsellWeb();
                    end;
                    v26:dispatch(v4(v6.UpsellInProgress));
                    return;
                end;
            elseif v33 == v5.Mobile then
                local l_robuxProductId_0 = v32.nativeUpsell.robuxProductId;
                local l_productId_1 = v32.productInfo.productId;
                local l_requestType_1 = v32.requestType;
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v28.signalProductPurchaseUpsellConfirmed(l_productId_1, l_requestType_1, l_robuxProductId_0);
                if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                    v31.promptNativePurchaseWithLocalPlayer(l_robuxProductId_0);
                else
                    v31.promptNativePurchase(l_LocalPlayer_0, l_robuxProductId_0);
                end;
                v26:dispatch(v4(v6.UpsellInProgress));
                return;
            elseif v33 == v5.Xbox then
                local l_robuxProductId_1 = v32.nativeUpsell.robuxProductId;
                local l_productId_2 = v32.productInfo.productId;
                local l_requestType_2 = v32.requestType;
                v28.signalProductPurchaseUpsellConfirmed(l_productId_2, l_requestType_2, l_robuxProductId_1);
                v26:dispatch(v4(v6.UpsellInProgress));
                return v17.new(function(v46, v47) --[[ Line: 139 ]]
                    -- upvalues: v31 (copy), l_robuxProductId_1 (copy)
                    local v48 = nil;
                    local v49 = nil;
                    local v50 = nil;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
                        -- upvalues: v48 (ref), v31 (ref), l_robuxProductId_1 (ref)
                        v48 = v31.beginPlatformStorePurchase(l_robuxProductId_1);
                    end);
                    v49 = l_status_0;
                    v50 = l_result_0;
                    if v49 then
                        v46(v48);
                    else
                        v47(v50);
                    end;
                end):andThen(function(v53) --[[ Line: 155 ]]
                    -- upvalues: v10 (ref), v28 (copy), l_productId_2 (copy), l_requestType_2 (copy), l_robuxProductId_1 (copy), v26 (copy), v21 (ref), v3 (ref), v7 (ref)
                    if v53 == v10.PlatformPurchaseResult.PurchaseResult_Success then
                        v28.signalXboxInGamePurchaseSuccess(l_productId_2, l_requestType_2, l_robuxProductId_1);
                    elseif v53 == v10.PlatformPurchaseResult.PurchaseResult_UserCancelled then
                        v28.signalXboxInGamePurchaseCanceled(l_productId_2, l_requestType_2, l_robuxProductId_1);
                    else
                        v28.signalXboxInGamePurchaseFailure(l_productId_2, l_requestType_2, l_robuxProductId_1);
                    end;
                    if v53 == v10.PlatformPurchaseResult.PurchaseResult_Success or v53 == v10.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then
                        return v26:dispatch(v21());
                    else
                        return v26:dispatch(v3(v7.UnknownFailure));
                    end;
                end);
            elseif v33 == v5.Unavailable then
                v26:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
                return;
            else
                warn("Need more Robux: platform not supported for Robux purchase");
                return;
            end;
        end;
    end);
end;