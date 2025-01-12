local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.UpsellFlow);
local v2 = require(l_Parent_0.Services.Network);
local v3 = require(l_Parent_0.Network.checkUserPurchaseSettings);
local v4 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v5 = require(l_Parent_0.Services.Analytics);
local v6 = require(l_Parent_0.Services.ExternalSettings);
local v7 = require(l_Parent_0.Actions.ErrorOccurred);
local v8 = require(l_Parent_0.Enums.PurchaseError);
local v9 = require(l_Parent_0.Thunk);
local v10 = require(l_Parent_0.Thunks.initiatePurchasePrecheck);
local v11 = require(l_Parent_0.Actions.SetPromptState);
local v12 = require(l_Parent_0.Enums.PromptState);
local v13 = {
    v5, 
    v2, 
    v6
};
local function _(v14) --[[ Line: 24 ]] --[[ Name: validateResult ]]
    if v14 == nil then
        return false;
    elseif v14.isEligible == nil or v14.failureReason == nil then
        return false;
    else
        return true;
    end;
end;
local v16 = {
    None = "None", 
    PurchaseNotEnabled = "PurchaseNotEnabled", 
    SpendLimitExceeded = "SpendLimitExceeded"
};
return function() --[[ Line: 40 ]] --[[ Name: initiateUserPurchaseSettingsPrecheck ]]
    -- upvalues: v9 (copy), v13 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy), v4 (copy), v1 (copy), v3 (copy), v7 (copy), v8 (copy), v16 (copy), v11 (copy), v12 (copy)
    return v9.new(script.Name, v13, function(v17, v18) --[[ Line: 41 ]]
        -- upvalues: v2 (ref), v5 (ref), v6 (ref), v10 (ref), v4 (ref), v1 (ref), v3 (ref), v7 (ref), v8 (ref), v16 (ref), v11 (ref), v12 (ref)
        local v19 = v18[v2];
        local v20 = v18[v5];
        local v21 = v18[v6];
        if v21.isStudio() then
            return v17:dispatch(v10());
        elseif v4(v21.getPlatform()) == v1.Web then
            return v17:dispatch(v10());
        else
            return v3(v19):andThen(function(v22) --[[ Line: 60 ]]
                -- upvalues: v17 (copy), v7 (ref), v8 (ref), v10 (ref), v16 (ref), v20 (copy), v11 (ref), v12 (ref)
                if (v22 ~= nil and v22.isEligible ~= nil and v22.failureReason ~= nil) == false then
                    return v17:dispatch(v7(v8.UnknownFailure));
                elseif v22.isEligible == true then
                    return v17:dispatch(v10());
                elseif v22.failureReason == v16.PurchaseNotEnabled then
                    v20.signalUserSettingEligibilityModal("PurchaseNotEnabled");
                    return v17:dispatch(v11(v12.EnablePurchaseVPCModal));
                elseif v22.failureReason == v16.SpendLimitExceeded then
                    return v17:dispatch(v10());
                else
                    return v17:dispatch(v7(v8.UnknownFailure));
                end;
            end):catch(function(_) --[[ Line: 82 ]]
                -- upvalues: v17 (copy), v7 (ref), v8 (ref)
                return v17:dispatch(v7(v8.UnknownFailure));
            end);
        end;
    end);
end;