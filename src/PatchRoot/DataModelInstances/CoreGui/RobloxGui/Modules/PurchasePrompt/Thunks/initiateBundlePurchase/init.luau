local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.RequestBundlePurchase);
local v4 = require(l_Parent_0.Enums.PurchaseError);
local v5 = require(l_Parent_0.Network.getBundleDetails);
local v6 = require(l_Parent_0.Network.getProductPurchasableDetails);
local v7 = require(l_Parent_0.Network.getCatalogItemDetails);
local v8 = require(l_Parent_0.Network.getAccountInfo);
local v9 = require(l_Parent_0.Network.getBalanceInfo);
local v10 = require(l_Parent_0.Network.getIsAlreadyOwned);
local v11 = require(l_Parent_0.Services.Network);
local v12 = require(l_Parent_0.Services.ExternalSettings);
local v13 = require(l_Parent_0.Utils.hasPendingRequest);
local v14 = require(l_Parent_0.Promise);
local v15 = require(l_Parent_0.Thunk);
local v16 = require(script.Parent.resolveBundlePromptState);
local v17 = require(l_Parent_0.Parent.Flags.FFlagEnableBundlePurchaseChecks);
local v18 = require(l_Parent_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v19 = {
    v11, 
    v12
};
local v20 = require(l_Parent_0.Flags.GetFFlagReturnNotForSaleOnInvalidBundleId);
return function(v21, v22, v23, v24, v25, v26, v27) --[[ Line: 34 ]] --[[ Name: initiateBundlePurchase ]]
    -- upvalues: v15 (copy), v19 (copy), v11 (copy), v12 (copy), v13 (copy), v3 (copy), l_Players_0 (copy), v2 (copy), v4 (copy), v14 (copy), v5 (copy), v8 (copy), v9 (copy), v17 (copy), v10 (copy), v20 (copy), v18 (copy), v7 (copy), v16 (copy), v6 (copy)
    return v15.new(script.Name, v19, function(v28, v29) --[[ Line: 43 ]]
        -- upvalues: v11 (ref), v12 (ref), v13 (ref), v3 (ref), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), l_Players_0 (ref), v2 (ref), v4 (ref), v14 (ref), v5 (ref), v8 (ref), v9 (ref), v17 (ref), v10 (ref), v20 (ref), v18 (ref), v7 (ref), v16 (ref), v6 (ref)
        local v30 = v29[v11];
        local v31 = v29[v12];
        if v13(v28:getState()) then
            return nil;
        else
            v28:dispatch(v3(v21, v22, v23, v24, v25, v26, v27));
            if not v31.isStudio() and l_Players_0.LocalPlayer.UserId <= 0 then
                v28:dispatch(v2(v4.Guest));
                return nil;
            elseif v31.getFlagOrder66() then
                v28:dispatch(v2(v4.PurchaseDisabled));
                return nil;
            else
                return v14.all({
                    bundleDetails = v5(v30, v21), 
                    accountInfo = v8(v30, v31), 
                    balanceInfo = v9(v30, v31), 
                    alreadyOwned = if v17 then v10(v30, v21, Enum.InfoType.Bundle) else nil
                }):andThen(function(v32) --[[ Line: 82 ]]
                    -- upvalues: v20 (ref), v18 (ref), v7 (ref), v30 (copy), v21 (ref), v28 (copy), v16 (ref), v27 (ref), v17 (ref), v2 (ref), v6 (ref), v4 (ref)
                    if v20() then
                        if v32.bundleDetails.product then
                            if v18() then
                                v7(v30, v21, "bundle"):andThen(function(v33) --[[ Line: 89 ]]
                                    -- upvalues: v28 (ref), v16 (ref), v32 (copy), v27 (ref), v17 (ref)
                                    v28:dispatch(v16(v33, v32.bundleDetails, v32.accountInfo, v32.balanceInfo, v27, if v17 then v32.alreadyOwned else nil));
                                end):catch(function(v34) --[[ Line: 101 ]]
                                    -- upvalues: v28 (ref), v2 (ref)
                                    v28:dispatch(v2(v34));
                                end);
                                return;
                            else
                                local l_id_0 = v32.bundleDetails.product.id;
                                v6(v30, l_id_0):andThen(function(v36) --[[ Line: 107 ]]
                                    -- upvalues: v28 (ref), v16 (ref), v32 (copy), v27 (ref), v17 (ref)
                                    v28:dispatch(v16(v36, v32.bundleDetails, v32.accountInfo, v32.balanceInfo, v27, if v17 then v32.alreadyOwned else nil));
                                end);
                                return;
                            end;
                        else
                            v28:dispatch(v2(v4.NotForSale));
                            return;
                        end;
                    elseif v18() then
                        v7(v30, v21, "bundle"):andThen(function(v37) --[[ Line: 128 ]]
                            -- upvalues: v28 (ref), v16 (ref), v32 (copy), v27 (ref)
                            v28:dispatch(v16(v37, v32.bundleDetails, v32.accountInfo, v32.balanceInfo, v27));
                        end):catch(function(v38) --[[ Line: 139 ]]
                            -- upvalues: v28 (ref), v2 (ref)
                            v28:dispatch(v2(v38));
                        end);
                        return;
                    else
                        local l_id_1 = v32.bundleDetails.product.id;
                        v6(v30, l_id_1):andThen(function(v40) --[[ Line: 145 ]]
                            -- upvalues: v28 (ref), v16 (ref), v32 (copy), v27 (ref)
                            v28:dispatch(v16(v40, v32.bundleDetails, v32.accountInfo, v32.balanceInfo, v27));
                        end);
                        return;
                    end;
                end):catch(function(v41) --[[ Line: 160 ]]
                    -- upvalues: v28 (copy), v2 (ref)
                    v28:dispatch(v2(v41));
                end);
            end;
        end;
    end);
end;