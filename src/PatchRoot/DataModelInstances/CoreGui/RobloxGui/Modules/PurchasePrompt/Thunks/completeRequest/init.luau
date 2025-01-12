local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_Parent_0.Actions.CompleteRequest);
local v5 = require(l_Parent_0.Enums.PromptState);
local v6 = require(l_Parent_0.Enums.RequestType);
local v7 = require(l_Parent_0.Enums.PurchaseError);
local v8 = require(l_Parent_0.Enums.Counter);
local v9 = require(l_Parent_0.Thunks.sendCounter);
local v10 = require(l_Parent_0.Services.Analytics);
local v11 = require(l_Parent_0.Services.PublicBindables);
local v12 = require(l_Parent_0.Thunk);
local v13 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagHideAvatarIECPromptOnUpsellSuccess);
local v14 = nil;
v14 = if v13 then {
    v10, 
    v11
} else {
    v10
};
return function() --[[ Line: 35 ]] --[[ Name: completeRequest ]]
    -- upvalues: v12 (copy), v14 (ref), v10 (copy), v5 (copy), v9 (copy), v8 (copy), v6 (copy), l_Players_0 (copy), l_MarketplaceService_0 (copy), v7 (copy), v13 (copy), v11 (copy), v4 (copy)
    return v12.new(script.Name, v14, function(v15, v16) --[[ Line: 36 ]]
        -- upvalues: v10 (ref), v5 (ref), v9 (ref), v8 (ref), v6 (ref), l_Players_0 (ref), l_MarketplaceService_0 (ref), v7 (ref), v13 (ref), v11 (ref), v4 (ref)
        local v17 = v16[v10];
        local v18 = v15:getState();
        local l_requestType_0 = v18.promptRequest.requestType;
        local l_purchaseError_0 = v18.purchaseError;
        local l_id_0 = v18.promptRequest.id;
        local l_hasCompletedPurchase_0 = v18.hasCompletedPurchase;
        local v23 = v18.nativeUpsell and v18.nativeUpsell.robuxProductId;
        local v24 = v18.productInfo and v18.productInfo.productId;
        if v18.promptState == v5.U13PaymentModal then
            v17.signalScaryModalCanceled(v24, "U13PaymentModal", v23);
        elseif v18.promptState == v5.U13MonthlyThreshold1Modal then
            v17.signalScaryModalCanceled(v24, "U13MonthlyThreshold1Modal", v23);
        elseif v18.promptState == v5.U13MonthlyThreshold2Modal then
            v17.signalScaryModalCanceled(v24, "U13MonthlyThreshold2Modal", v23);
        elseif v18.promptState == v5.ParentalConsentWarningPaymentModal13To17 then
            v17.signalScaryModalCanceled(v24, "ParentalConsentWarningPaymentModal13To17", v23);
        end;
        if v18.promptState == v5.PurchaseComplete then
            v15:dispatch(v9(v8.Success));
        elseif v18.promptState == v5.Error then
            v15:dispatch(v9(v8.Failed));
        else
            v15:dispatch(v9(v8.Cancelled));
        end;
        if l_requestType_0 == v6.Product then
            local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
            l_MarketplaceService_0:SignalPromptProductPurchaseFinished(l_UserId_0, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.GamePass then
            l_MarketplaceService_0:SignalPromptGamePassPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.Bundle then
            l_MarketplaceService_0:SignalPromptBundlePurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.Asset then
            l_MarketplaceService_0:SignalPromptPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
            local l_assetTypeId_0 = v18.productInfo.assetTypeId;
            if l_hasCompletedPurchase_0 and l_assetTypeId_0 then
                pcall(function() --[[ Line: 79 ]]
                    -- upvalues: l_MarketplaceService_0 (ref), l_Players_0 (ref), l_assetTypeId_0 (copy)
                    l_MarketplaceService_0:SignalAssetTypePurchased(l_Players_0.LocalPlayer, l_assetTypeId_0);
                end);
            end;
        elseif l_requestType_0 == v6.Premium then
            l_MarketplaceService_0:SignalPromptPremiumPurchaseFinished(l_hasCompletedPurchase_0 or l_purchaseError_0 == v7.AlreadyPremium);
        elseif l_requestType_0 == v6.Subscription then
            l_MarketplaceService_0:SignalPromptSubscriptionPurchaseFinished(l_id_0, l_hasCompletedPurchase_0 or l_purchaseError_0 == v7.AlreadySubscribed);
        end;
        if v13 then
            local v27 = v16[v11].getWindowStateChangedBindable();
            if v27 then
                v27:Fire({
                    isShown = false, 
                    hasCompletedPurchase = l_hasCompletedPurchase_0
                });
            end;
        end;
        return v15:dispatch(v4());
    end);
end;