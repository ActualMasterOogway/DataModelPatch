local l_Parent_0 = script:FindFirstAncestor("GameProductInfoRodux").Parent;
local v1 = require(l_Parent_0.Result);
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local v3 = {
    new = function() --[[ Line: 20 ]] --[[ Name: new ]]
        return {};
    end
};
v3.mock = function(v4) --[[ Line: 25 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy)
    local v5 = v3.new();
    v5.universeId = v4;
    v5.isForSale = true;
    v5.productId = 12345;
    v5.price = 5;
    v5.sellerId = 6789;
    return v5;
end;
v3.fromJsonData = function(v6) --[[ Line: 35 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v1 (copy), v3 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy)
    if type(v6.universeId) ~= "number" or type(v6.isForSale) ~= "boolean" or type(v6.productId) ~= "number" or type(v6.price) ~= "number" or type(v6.sellerId) ~= "number" then
        return v1.error("invalid data type");
    else
        local v7 = v3.new();
        v7.universeId = tostring(v6.universeId);
        v7.isForSale = v6.isForSale;
        v7.productId = v6.productId;
        v7.price = v6.price;
        v7.sellerId = v6.sellerId;
        if l_FFlagLuaAppFiatPaidAccess_0 and v6.fiatPurchaseData then
            v7.localizedFiatPrice = v6.fiatPurchaseData.localizedFiatPrice;
            v7.fiatBasePriceId = v6.fiatPurchaseData.basePriceId;
        end;
        return v1.success(v7);
    end;
end;
return v3;