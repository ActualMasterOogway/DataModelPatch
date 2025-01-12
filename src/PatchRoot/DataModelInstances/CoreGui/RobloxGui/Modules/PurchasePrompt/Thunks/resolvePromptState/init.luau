local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.Actions.SetPurchaseFlow);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.ProductInfoReceived);
local v6 = require(l_Parent_0.Actions.AccountInfoReceived);
local v7 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v8 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v9 = require(l_Parent_0.Actions.ErrorOccurred);
local v10 = require(l_Parent_0.Actions.CompleteRequest);
local v11 = require(l_Parent_0.Enums.PurchaseFlow);
local v12 = require(l_Parent_0.Enums.PromptState);
local v13 = require(l_Parent_0.Enums.PurchaseError);
local v14 = require(l_Parent_0.Enums.PaymentPlatform);
local v15 = require(l_Parent_0.Enums.RequestType);
local _ = require(l_Parent_0.Models.RobuxUpsell);
local v17 = require(l_Parent_0.Network.getRobuxUpsellProduct);
local v18 = require(l_Parent_0.Services.ABTest);
local v19 = require(l_Parent_0.Services.Analytics);
local v20 = require(l_Parent_0.Services.ExternalSettings);
local v21 = require(l_Parent_0.Services.Network);
local v22 = require(l_Parent_0.Enums.Counter);
local v23 = require(l_Parent_0.Thunks.sendCounter);
local v24 = require(l_Parent_0.Utils.meetsPrerequisites);
local v25 = require(l_Parent_0.Utils.getPlayerProductInfoPrice);
local v26 = require(l_Parent_0.Utils.getPaymentPlatform);
local _ = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local _ = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v29 = require(l_Parent_0.Utils.hasPendingRequest);
local v30 = require(l_Parent_0.Thunk);
local _ = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local l_GetFStringLargerRobuxUpsellIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer;
local v33 = require(l_Parent_0.Flags.LargerRobuxUpsellTest);
local v34 = {
    v18, 
    v19, 
    v20, 
    v21
};
return function(v35, v36, v37, v38, v39, v40) --[[ Line: 53 ]] --[[ Name: resolvePromptState ]]
    -- upvalues: v30 (copy), v34 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v5 (copy), v6 (copy), v7 (copy), v24 (copy), v13 (copy), v10 (copy), v9 (copy), v25 (copy), l_UserInputService_0 (copy), v26 (copy), v14 (copy), v3 (copy), v11 (copy), v33 (copy), l_GetFStringLargerRobuxUpsellIxpLayer_0 (copy), v17 (copy), v29 (copy), v8 (copy), v23 (copy), v22 (copy), v4 (copy), v12 (copy), v15 (copy)
    return v30.new(script.Name, v34, function(v41, v42) --[[ Line: 54 ]]
        -- upvalues: v18 (ref), v19 (ref), v20 (ref), v21 (ref), v5 (ref), v35 (copy), v6 (ref), v36 (copy), v7 (ref), v37 (copy), v39 (copy), v24 (ref), v38 (copy), v40 (copy), v13 (ref), v10 (ref), v9 (ref), v25 (ref), l_UserInputService_0 (ref), v26 (ref), v14 (ref), v3 (ref), v11 (ref), v33 (ref), l_GetFStringLargerRobuxUpsellIxpLayer_0 (ref), v17 (ref), v29 (ref), v8 (ref), v23 (ref), v22 (ref), v4 (ref), v12 (ref), v15 (ref)
        local v43 = v41:getState();
        local v44 = v42[v18];
        local v45 = v42[v19];
        local v46 = v42[v20];
        local v47 = v42[v21];
        v41:dispatch(v5(v35));
        v41:dispatch(v6(v36));
        v41:dispatch(v7(v37));
        local v48 = (not v46.getFlagBypassThirdPartySettingForRobloxPurchase() or not v39) and (v46.getLuaUseThirdPartyPermissions() or v46.getFlagRestrictSales2());
        local v49, v50 = v24(v35, v38, v48, v46, v40);
        if not v49 then
            if not v46.isStudio() and v50 == v13.ThirdPartyDisabled then
                return v41:dispatch(v10());
            else
                return v41:dispatch(v9(v50));
            end;
        else
            local l_robux_0 = v37.robux;
            local l_isPremium_0 = v36.isPremium;
            local v53 = v25(v35, l_isPremium_0);
            if v40 ~= nil then
                v53 = v40;
            end;
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_robux_0 < v53 then
                if v46.getFFlagDisableRobuxUpsell() then
                    return v41:dispatch(v9(v13.NotEnoughRobuxNoUpsell));
                else
                    local v55 = v26(l_l_UserInputService_0_Platform_0);
                    if v55 ~= v14.Web then
                        v41:dispatch(v3(v11.RobuxUpsellV2));
                    end;
                    local _ = false;
                    if v33.isEnabled() then
                        local v57 = l_GetFStringLargerRobuxUpsellIxpLayer_0();
                        local v58 = v44.getLayerData(v57);
                        if v58 then
                            v44.logUserLayerExposure(v57);
                            if v33.isUserEnrolled(v58) then
                                v41:dispatch(v3(v11.LargeRobuxUpsell));
                            end;
                        end;
                    end;
                    return v17(v47, v53, l_robux_0, v55):andThen(function(v59) --[[ Line: 115 ]]
                        -- upvalues: v29 (ref), v41 (copy), v45 (copy), v43 (copy), v8 (ref), v23 (ref), v22 (ref)
                        if not v29(v41:getState()) then
                            return;
                        else
                            v45.signalProductPurchaseUpsellShown(v59.id, v43.requestType, v59.providerId);
                            v41:dispatch(v8(v59.providerId, v59.id, v59.robuxAmount));
                            v41:dispatch(v23(v22.UpsellModalShown));
                            return;
                        end;
                    end, function() --[[ Line: 125 ]]
                        -- upvalues: v29 (ref), v41 (copy), v11 (ref), v4 (ref), v12 (ref), v23 (ref), v22 (ref), v9 (ref), v13 (ref)
                        if not v29(v41:getState()) then
                            return;
                        elseif v41:getState().purchaseFlow == v11.LargeRobuxUpsell then
                            v41:dispatch(v4(v12.LargeRobuxUpsell));
                            v41:dispatch(v23(v22.UpsellModalShown));
                            return;
                        else
                            v41:dispatch(v9(v13.NotEnoughRobuxXbox));
                            v41:dispatch(v23(v22.UpsellGenericModalShown));
                            return;
                        end;
                    end);
                end;
            else
                if v43.requestType ~= v15.AvatarCreationFee then
                    v45.signalProductPurchaseShown(v35.productId, v43.requestType);
                end;
                return v41:dispatch(v4(v12.PromptPurchase));
            end;
        end;
    end);
end;