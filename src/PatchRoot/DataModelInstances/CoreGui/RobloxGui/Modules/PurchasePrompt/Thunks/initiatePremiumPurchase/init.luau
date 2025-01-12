local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Actions.RequestPremiumPurchase);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local v6 = require(l_Parent_0.Network.getPremiumUpsellPrecheck);
local v7 = require(l_Parent_0.Network.getPremiumProductInfo);
local v8 = require(l_Parent_0.Network.getAccountInfo);
local v9 = require(l_Parent_0.Network.getBalanceInfo);
local v10 = require(l_Parent_0.Services.Network);
local v11 = require(l_Parent_0.Services.ExternalSettings);
local v12 = require(l_Parent_0.Thunks.resolvePremiumPromptState);
local v13 = require(l_Parent_0.Utils.hasPendingRequest);
local v14 = {
    v10, 
    v11
};
return function(_, _, _) --[[ Line: 24 ]] --[[ Name: initiatePremiumPurchase ]]
    -- upvalues: v2 (copy), v14 (copy), v10 (copy), v11 (copy), v13 (copy), v4 (copy), v5 (copy), v3 (copy), v1 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v12 (copy)
    return v2.new(script.Name, v14, function(v18, v19) --[[ Line: 25 ]]
        -- upvalues: v10 (ref), v11 (ref), v13 (ref), v4 (ref), v5 (ref), v3 (ref), v1 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v12 (ref)
        local v20 = v19[v10];
        local v21 = v19[v11];
        if v13(v18:getState()) then
            return nil;
        else
            v18:dispatch(v4());
            if v21.getFlagOrder66() then
                v18:dispatch(v5(v3.PurchaseDisabled));
                return nil;
            else
                local v22 = not v21.isStudio();
                return v1.all({
                    canShowUpsell = v22 and v6(v20) or v1.resolve(true), 
                    premiumProductInfo = v7(v20), 
                    accountInfo = v8(v20, v21), 
                    balanceInfo = v9(v20, v21)
                }):andThen(function(v23) --[[ Line: 46 ]]
                    -- upvalues: v18 (copy), v12 (ref)
                    v18:dispatch(v12(v23.accountInfo, v23.balanceInfo, v23.premiumProductInfo, v23.canShowUpsell));
                end):catch(function(v24) --[[ Line: 49 ]]
                    -- upvalues: v18 (copy), v5 (ref)
                    v18:dispatch(v5(v24));
                end);
            end;
        end;
    end);
end;