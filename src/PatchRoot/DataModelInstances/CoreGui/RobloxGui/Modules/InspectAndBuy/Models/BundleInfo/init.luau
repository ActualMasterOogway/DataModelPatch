local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Constants);
local v4 = require(script.Parent.Parent.MockId);
local v5 = {
    new = function() --[[ Line: 30 ]] --[[ Name: new ]]
        return {};
    end
};
v5.mock = function() --[[ Line: 36 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v6 = v5.new();
    v6.name = "";
    v6.bundleId = v4();
    v6.description = "";
    v6.bundleType = "";
    v6.creatorId = "";
    v6.creatorName = "";
    v6.productId = "";
    v6.isForSale = false;
    v6.price = "";
    v6.assetIds = {};
    v6.numFavorites = 0;
    v6.costumeId = "";
    v6.owned = false;
    v6.isForSale = false;
    v6.collectibleItemId = "";
    v6.collectibleIsLimited = nil;
    v6.collectibleProductId = "";
    v6.collectibleLowestResalePrice = 0;
    v6.collectibleLowestAvailableResaleProductId = "";
    v6.collectibleLowestAvailableResaleItemInstanceId = "";
    v6.collectibleQuantityLimitPerUser = 0;
    v6.remaining = 0;
    v6.productType = "";
    return v6;
end;
v5.fromGetAssetBundles = function(v7) --[[ Line: 66 ]] --[[ Name: fromGetAssetBundles ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v8 = v5.new();
    v8.name = v7.name;
    v8.bundleId = tostring(v7.id);
    v8.description = v7.description;
    v8.bundleType = v7.bundleType;
    v8.creatorId = tostring(v7.creator.id);
    v8.creatorName = v7.creator.name;
    v8.productId = tostring(v7.product.id);
    if v7.collectibleItemDetail then
        v8.isForSale = v7.collectibleItemDetail.saleStatus == v3.SaleStatus.OnSale;
        v8.collectibleItemId = v7.collectibleItemDetail.collectibleItemId or "";
        v8.collectibleProductId = v7.collectibleItemDetail.collectibleProductId or "";
        v8.collectibleLowestResalePrice = v7.collectibleItemDetail.lowestResalePrice or 0;
        v8.collectibleLowestAvailableResaleProductId = v7.collectibleItemDetail.lowestAvailableResaleProductId or "";
        v8.collectibleLowestAvailableResaleItemInstanceId = v7.collectibleItemDetail.lowestAvailableResaleItemInstanceId or "";
        v8.collectibleQuantityLimitPerUser = v7.collectibleItemDetail.quantityLimitPerUser or 0;
        v8.productType = v3.ProductType.CollectibleItem;
        v8.price = v7.collectibleItemDetail.price;
        v8.remaining = v7.collectibleItemDetail.unitsAvailable or 0;
        v8.collectibleIsLimited = v7.collectibleItemDetail.collectibleItemType == "Limited";
        v8.saleLocation = v7.collectibleItemDetail.saleLocation;
    end;
    v8.assetIds = {};
    for _, v10 in pairs(v7.items) do
        if v10.type == "UserOutfit" then
            v8.costumeId = tostring(v10.id);
        else
            table.insert(v8.assetIds, (tostring(v10.id)));
        end;
    end;
    return v8;
end;
v5.fromGetItemDetails = function(v11) --[[ Line: 113 ]] --[[ Name: fromGetItemDetails ]]
    -- upvalues: v5 (copy)
    local v12 = v5.new();
    v12.bundleId = tostring(v11.Id);
    v12.owned = v11.Owned;
    v12.isForSale = v11.IsPurchasable;
    v12.price = v11.Price or 0;
    v12.hasResellers = v11.HasResellers;
    v12.collectibleItemId = v11.CollectibleItemId;
    return v12;
end;
v5.fromGetBundleFavoriteCount = function(v13, v14) --[[ Line: 126 ]] --[[ Name: fromGetBundleFavoriteCount ]]
    -- upvalues: v5 (copy)
    local v15 = v5.new();
    v15.bundleId = tostring(v13);
    v15.numFavorites = v14;
    return v15;
end;
v5.fromGetEconomyProductInfo = function(v16, v17, v18, v19) --[[ Line: 133 ]] --[[ Name: fromGetEconomyProductInfo ]]
    -- upvalues: v5 (copy)
    local v20 = v5.new();
    v20.bundleId = tostring(v17);
    v20.owned = v16;
    v20.price = v18;
    v20.isForSale = v19;
    return v20;
end;
v5.fromPurchaseSuccess = function(v21) --[[ Line: 142 ]] --[[ Name: fromPurchaseSuccess ]]
    -- upvalues: v5 (copy)
    local v22 = v5.new();
    v22.bundleId = tostring(v21);
    v22.owned = true;
    return v22;
end;
v5.getSaleDetailsForCollectibles = function(v23) --[[ Line: 149 ]] --[[ Name: getSaleDetailsForCollectibles ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v24 = v1.joinDeep({}, v23);
    if v23.productType == v3.ProductType.CollectibleItem then
        local l_saleLocation_0 = v24.saleLocation;
        local v26 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ShopOnly;
        local v27 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ShopAndExperiencesById;
        local v28 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId == v3.SaleLocationType.ShopAndExperiencesById and type(l_saleLocation_0.universeIds) == "table" and table.find(l_saleLocation_0.universeIds, game.GameId) ~= nil;
        local v29 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ExperiencesDevApiOnly;
        v24.isForSale = v24.isForSale and v26 and (v27 or v28) and v29;
        if not v23.collectibleIsLimited then
            v24.isForSale = v24.isForSale and not v24.owned;
        end;
    end;
    return v24;
end;
return v5;