local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Misc.Constants);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local v5 = require(l_Parent_0.Parent.Flags.FFlagEnableTempFixCollectibleBundlePurchase);
local v6 = require(l_Parent_0.Parent.Flags.FFlagEnableCollectibleCheckToPurchaseItem);
return function(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 14 ]] --[[ Name: performPurchaseV2 ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), v2 (copy), v1 (copy), v4 (copy)
    if not v6 and v5 then
        local v18 = false;
        if v8 == Enum.InfoType.Bundle then
            v18 = v13 and v13 ~= "";
        end;
        if v18 then
            v8 = Enum.InfoType.Asset;
            v17 = nil;
        end;
    end;
    return v7.performPurchaseV2(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17):andThen(function(v19) --[[ Line: 53 ]]
        -- upvalues: v3 (ref), v2 (ref), v1 (ref), v4 (ref)
        if v19.purchased or v19.reason == "AlreadyOwned" then
            return v3.resolve(v19);
        elseif v19.reason == v2.PurchaseFailureReason.EconomyDisabled then
            return v3.reject(v1.PurchaseDisabled);
        elseif v19.reason == v2.PurchaseFailureReason.TwoStepVerificationRequired then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v19.transactionStatus == 24 then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v4(v19) then
            return v3.reject(v19);
        else
            return v3.reject(v1.UnknownFailure);
        end;
    end, function(_) --[[ Line: 73 ]]
        -- upvalues: v3 (ref), v1 (ref)
        return v3.reject(v1.UnknownFailure);
    end);
end;