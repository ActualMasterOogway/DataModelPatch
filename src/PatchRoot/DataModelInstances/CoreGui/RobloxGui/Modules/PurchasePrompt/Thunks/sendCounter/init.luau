local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.Counter);
local v2 = require(l_Parent_0.Enums.PurchaseFlow);
local v3 = require(l_Parent_0.Enums.PaymentPlatform);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Utils.getPaymentPlatform);
local v7 = require(l_Parent_0.Utils.getCounterCombinations);
local v8 = require(l_Parent_0.Thunk);
local v9 = {
    v4, 
    v5
};
return function(v10) --[[ Line: 22 ]] --[[ Name: sendCounter ]]
    -- upvalues: v8 (copy), v9 (copy), v4 (copy), v5 (copy), v1 (copy), v2 (copy), v6 (copy), v3 (copy), v7 (copy)
    return v8.new(script.Name, v9, function(v11, v12) --[[ Line: 23 ]]
        -- upvalues: v4 (ref), v5 (ref), v1 (ref), v10 (copy), v2 (ref), v6 (ref), v3 (ref), v7 (ref)
        local v13 = v12[v4];
        local v14 = v12[v5];
        local v15 = v1.toRawValue(v10);
        local v16 = v11:getState();
        local l_purchaseFlow_0 = v16.purchaseFlow;
        local v18 = if l_purchaseFlow_0 ~= nil then v2.toRawValue(l_purchaseFlow_0) else nil;
        local l_robuxPurchaseAmount_0 = v16.nativeUpsell.robuxPurchaseAmount;
        local v20 = v14.getPlatform();
        local v21 = v6(v20);
        local v22 = v3.toRawValue(v21);
        for _, v24 in (v7("PurchasePrompt", v15, v22, v18, l_robuxPurchaseAmount_0)) do
            v13.sendCounter(v24);
        end;
    end);
end;