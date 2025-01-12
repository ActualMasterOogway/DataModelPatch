local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Network);
local v3 = require(l_Parent_0.Services.ExternalSettings);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Enums.PromptState);
local _ = require(l_Parent_0.Enums.UpsellFlow);
local v7 = require(l_Parent_0.Enums.PaymentPlatform);
local v8 = require(l_Parent_0.Actions.SetPromptState);
local v9 = require(l_Parent_0.Thunks.launchPremiumUpsell);
local v10 = require(l_Parent_0.Network.checkUserPurchaseSettings);
local v11 = require(l_Parent_0.Utils.getPaymentPlatform);
local v12 = require(l_Parent_0.Actions.ErrorOccurred);
local v13 = require(l_Parent_0.Enums.PurchaseError);
local v14 = {
    v4, 
    v2, 
    v3
};
local v15 = {
    None = "None", 
    PurchaseNotEnabled = "PurchaseNotEnabled", 
    SpendLimitExceeded = "SpendLimitExceeded"
};
return function() --[[ Line: 33 ]] --[[ Name: initiatePremiumPrecheck ]]
    -- upvalues: v1 (copy), v14 (copy), v2 (copy), v4 (copy), v3 (copy), v9 (copy), v11 (copy), v7 (copy), v10 (copy), v12 (copy), v13 (copy), v15 (copy), v8 (copy), v5 (copy)
    return v1.new(script.Name, v14, function(v16, v17) --[[ Line: 34 ]]
        -- upvalues: v2 (ref), v4 (ref), v3 (ref), v9 (ref), v11 (ref), v7 (ref), v10 (ref), v12 (ref), v13 (ref), v15 (ref), v8 (ref), v5 (ref)
        local v18 = v17[v2];
        local v19 = v17[v4];
        local v20 = v17[v3];
        if v20.isStudio() then
            return v16:dispatch(v9());
        elseif v11(v20.getPlatform()) == v7.Web then
            return v16:dispatch(v9());
        else
            return v10(v18):andThen(function(v21) --[[ Line: 51 ]]
                -- upvalues: v16 (copy), v12 (ref), v13 (ref), v9 (ref), v15 (ref), v19 (copy), v8 (ref), v5 (ref)
                if v21 == nil or v21.isEligible == nil or v21.failureReason == nil then
                    return v16:dispatch(v12(v13.UnknownFailure));
                elseif v21.isEligible == true then
                    return v16:dispatch(v9());
                elseif v21.failureReason == v15.PurchaseNotEnabled then
                    v19.signalUserSettingEligibilityModal(v15.PurchaseNotEnabled);
                    return v16:dispatch(v8(v5.EnablePurchaseVPCModal));
                elseif v21.failureReason == v15.SpendLimitExceeded then
                    return v16:dispatch(v9());
                else
                    return v16:dispatch(v12(v13.UnknownFailure));
                end;
            end):catch(function(_) --[[ Line: 73 ]]
                -- upvalues: v16 (copy), v12 (ref), v13 (ref)
                return v16:dispatch(v12(v13.UnknownFailure));
            end);
        end;
    end);
end;