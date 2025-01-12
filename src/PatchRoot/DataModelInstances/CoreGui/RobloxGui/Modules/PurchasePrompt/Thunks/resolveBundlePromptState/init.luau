local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local v6 = require(l_Parent_0.Actions.BundleProductInfoReceived);
local v7 = require(l_Parent_0.Actions.AccountInfoReceived);
local v8 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v9 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v10 = require(l_Parent_0.Enums.PromptState);
local v11 = require(l_Parent_0.Enums.PurchaseError);
local v12 = require(l_Parent_0.Enums.UpsellFlow);
local _ = require(l_Parent_0.Models.RobuxUpsell);
local v14 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v15 = require(l_Parent_0.Network.getRobuxUpsellProduct);
local v16 = require(l_Parent_0.Services.Analytics);
local v17 = require(l_Parent_0.Services.Network);
local v18 = require(l_Parent_0.Utils.getPaymentPlatform);
local _ = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local _ = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v21 = require(l_Parent_0.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio);
local v22 = require(l_Parent_0.Thunk);
local _ = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v24 = require(l_Parent_0.Flags.GetFFlagEnableInsufficientRobuxForBundleUpsellFix);
local v25 = require(l_Parent_0.Parent.Flags.FFlagEnableBundlePurchaseChecks);
local v26 = require(l_Parent_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local function _(v27, v28) --[[ Line: 41 ]] --[[ Name: getBundlePriceFromProductInfo ]]
    if v27 and v27.product ~= nil then
        if v28 and v27.product.premiumPricing ~= nil then
            return v27.product.premiumPricing.premiumPriceInRobux or 0;
        else
            return v27.product.priceInRobux or 0;
        end;
    else
        return 0;
    end;
end;
local function v38(v30, v31, v32, v33) --[[ Line: 54 ]] --[[ Name: meetsBundlePrerequisitesV2 ]]
    -- upvalues: v11 (copy)
    local l_owned_0 = v30.owned;
    local l_collectibleItemDetail_0 = v31.collectibleItemDetail;
    local v36 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemId ~= nil and l_collectibleItemDetail_0.collectibleItemId ~= "";
    local v37 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemType == "Limited";
    if v36 then
        if not v37 and l_owned_0 then
            return false, v11.AlreadyOwn;
        end;
    elseif l_owned_0 then
        return false, v11.AlreadyOwn;
    end;
    if not v30.isPurchasable then
        return false, v11.NotForSale;
    elseif v33 ~= nil and v32.robux ~= nil and v32.robux < v33 then
        return false, v11.NotEnoughRobux;
    else
        return true, nil;
    end;
end;
local function v49(v39, v40, v41, v42) --[[ Line: 91 ]] --[[ Name: meetsBundlePrerequisites ]]
    -- upvalues: v25 (copy), v11 (copy), l_Players_0 (copy)
    local l_collectibleItemDetail_1 = v39.collectibleItemDetail;
    local v44 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemId ~= nil and l_collectibleItemDetail_1.collectibleItemId ~= "";
    if v25 then
        local v45 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemType ~= nil and l_collectibleItemDetail_1.collectibleItemType == "Limited";
        if v44 then
            if not v45 and v42 then
                return false, v11.AlreadyOwn;
            end;
        elseif v42 then
            return false, v11.AlreadyOwn;
        end;
    end;
    local _ = nil;
    if not if v44 then l_collectibleItemDetail_1.saleStatus == "OnSale" else v39.product and v39.product.isForSale then
        return false, v11.NotForSale;
    else
        if v25 then
            if v41 ~= nil and v40.robux ~= nil and v40.robux < v41 then
                return false, v11.NotEnoughRobux;
            elseif v39.itemRestrictions ~= nil then
                for _, v48 in v39.itemRestrictions do
                    if v48 == "ThirteenPlus" then
                        if l_Players_0.LocalPlayer:GetUnder13() then
                            return false, v11.Under13;
                        else
                            break;
                        end;
                    end;
                end;
            end;
        end;
        return true, nil;
    end;
end;
local v50 = {
    v16, 
    v17
};
return function(v51, v52, v53, v54, v55, v56) --[[ Line: 156 ]] --[[ Name: resolveBundlePromptState ]]
    -- upvalues: v22 (copy), v50 (copy), v16 (copy), v17 (copy), v6 (copy), v7 (copy), v8 (copy), v25 (copy), v26 (copy), v38 (copy), v49 (copy), l_UserInputService_0 (copy), v14 (copy), v11 (copy), l_RunService_0 (copy), v21 (copy), v24 (copy), v12 (copy), v4 (copy), v10 (copy), v18 (copy), v15 (copy), v9 (copy), v5 (copy)
    return v22.new(script.Name, v50, function(v57, v58) --[[ Line: 164 ]]
        -- upvalues: v16 (ref), v17 (ref), v6 (ref), v52 (copy), v7 (ref), v53 (copy), v8 (ref), v54 (copy), v25 (ref), v55 (ref), v26 (ref), v38 (ref), v51 (copy), v49 (ref), v56 (copy), l_UserInputService_0 (ref), v14 (ref), v11 (ref), l_RunService_0 (ref), v21 (ref), v24 (ref), v12 (ref), v4 (ref), v10 (ref), v18 (ref), v15 (ref), v9 (ref), v5 (ref)
        local v59 = v57:getState();
        local v60 = v58[v16];
        local v61 = v58[v17];
        v57:dispatch(v6(v52));
        v57:dispatch(v7(v53));
        v57:dispatch(v8(v54));
        if v25 and v55 == nil then
            local l_isPremium_0 = v53.isPremium;
            local l_v52_0 = v52;
            v55 = if l_v52_0 and l_v52_0.product ~= nil then if l_isPremium_0 and l_v52_0.product.premiumPricing ~= nil then l_v52_0.product.premiumPricing.premiumPriceInRobux or 0 else l_v52_0.product.priceInRobux or 0 else 0;
        end;
        local v64 = nil;
        local v65 = nil;
        if v26() then
            local v66, v67 = v38(v51, v52, v54, v55);
            v64 = v66;
            v65 = v67;
        else
            local v68, v69 = v49(v52, v54, v55, v56);
            v64 = v68;
            v65 = v69;
        end;
        local l_v55_0 = v55;
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v72 = v14(l_l_UserInputService_0_Platform_0);
        local v73 = v65 == v11.NotEnoughRobux;
        if l_RunService_0:IsStudio() and v21() and v73 then
            v73 = v54.robux < l_v55_0;
            if not v64 then
                v64 = not v73;
            end;
        end;
        if not v64 then
            if v73 then
                if not v24() and v72 == v12.Web then
                    return v57:dispatch(v4(v10.RobuxUpsell));
                else
                    local _ = l_v55_0 - v54.robux;
                    local _ = v53.isPremium;
                    local v76 = v18(l_l_UserInputService_0_Platform_0);
                    local l_robux_0 = v54.robux;
                    return v15(v61, l_v55_0, l_robux_0, v76):andThen(function(v78) --[[ Line: 220 ]]
                        -- upvalues: v60 (copy), v59 (copy), v57 (copy), v9 (ref)
                        v60.signalProductPurchaseUpsellShown(v78.id, v59.requestType, v78.providerId);
                        v57:dispatch(v9(v78.providerId, v78.id, v78.robuxAmount));
                    end, function() --[[ Line: 228 ]]
                        -- upvalues: v57 (copy), v5 (ref), v11 (ref)
                        v57:dispatch(v5(v11.NotEnoughRobuxXbox));
                    end);
                end;
            else
                return v57:dispatch(v5(v65));
            end;
        else
            return v57:dispatch(v4(v10.PromptPurchase));
        end;
    end);
end;