local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Actions.RequestSubscriptionPurchase);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local _ = require(l_Parent_0.Network.getPremiumUpsellPrecheck);
local v7 = require(l_Parent_0.Network.getSubscriptionPurchaseInfo);
local v8 = require(l_Parent_0.Services.Network);
local v9 = require(l_Parent_0.Services.ExternalSettings);
local v10 = require(l_Parent_0.Thunks.resolveSubscriptionPromptState);
local v11 = require(l_Parent_0.Utils.hasPendingRequest);
local v12 = {
    v8, 
    v9
};
return function(v13) --[[ Line: 22 ]] --[[ Name: initiateSubscriptionPurchase ]]
    -- upvalues: v2 (copy), v12 (copy), v8 (copy), v9 (copy), v11 (copy), v4 (copy), v5 (copy), v3 (copy), v7 (copy), v10 (copy)
    return v2.new(script.Name, v12, function(v14, v15) --[[ Line: 23 ]]
        -- upvalues: v8 (ref), v9 (ref), v11 (ref), v4 (ref), v13 (copy), v5 (ref), v3 (ref), v7 (ref), v10 (ref)
        local v16 = v15[v8];
        local v17 = v15[v9];
        if v11(v14:getState()) then
            return nil;
        else
            v14:dispatch(v4(v13));
            if v17.getFlagOrder66() then
                v14:dispatch(v5(v3.PurchaseDisabled));
                return nil;
            else
                return v7(v16, v13):andThen(function(v18) --[[ Line: 38 ]]
                    -- upvalues: v14 (copy), v10 (ref)
                    v14:dispatch(v10(v18));
                end):catch(function(v19) --[[ Line: 41 ]]
                    -- upvalues: v14 (copy), v5 (ref)
                    v14:dispatch(v5(v19));
                end);
            end;
        end;
    end);
end;