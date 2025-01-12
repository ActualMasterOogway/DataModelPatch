local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.MockId);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.Flags.FFlagEnableRestrictedAssetSaleLocationInspectAndBuy);
local v7 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v8 = {
    new = function() --[[ Line: 45 ]] --[[ Name: new ]]
        return {};
    end
};
v8.mock = function() --[[ Line: 51 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy), v4 (copy), v7 (copy)
    local v9 = v8.new();
    v9.name = "";
    v9.assetId = v4();
    v9.assetTypeId = "";
    v9.creatorId = "";
    v9.creatorName = "";
    v9.creatorHasVerifiedBadge = false;
    v9.owned = false;
    v9.isForSale = false;
    v9.description = "";
    v9.price = "";
    v9.productId = "";
    v9.isLimited = false;
    v9.isLimitedUnique = not v7() and nil;
    v9.collectibleIsLimited = not v7() and nil;
    v9.bundlesAssetIsIn = {};
    v9.parentBundleId = nil;
    v9.numFavorites = 0;
    v9.minimumMembershipLevel = 0;
    v9.collectibleItemId = "";
    v9.collectibleProductId = "";
    v9.collectibleLowestResalePrice = 0;
    v9.collectibleLowestAvailableResaleProductId = "";
    v9.collectibleLowestAvailableResaleItemInstanceId = "";
    v9.collectibleQuantityLimitPerUser = 0;
    v9.remaining = 0;
    v9.creatingUniverseId = nil;
    return v9;
end;
v8.fromGetProductInfo = function(v10) --[[ Line: 90 ]] --[[ Name: fromGetProductInfo ]]
    -- upvalues: v8 (copy), v5 (copy), v7 (copy)
    local v11 = v8.new();
    v11.name = v10.Name;
    v11.description = v10.Description;
    v11.price = v10.PriceInRobux;
    v11.productType = v10.ProductType;
    v11.remaining = v10.Remaining;
    v11.creatorId = tostring(v10.Creator.Id);
    v11.creatorName = v10.Creator.Name;
    v11.assetId = tostring(v10.AssetId);
    v11.assetTypeId = tostring(v10.AssetTypeId);
    v11.productId = tostring(v10.ProductId);
    v11.isForSale = v10.IsForSale;
    v11.canBeSoldInThisGame = v10.CanBeSoldInThisGame;
    v11.saleLocation = v10.SaleLocation;
    v11.remaining = v10.Remaining or 0;
    if v11.productType == v5.ProductType.CollectibleItem then
        v11.collectibleItemId = v10.CollectibleItemId or "";
        v11.collectibleProductId = v10.CollectibleProductId or "";
        if v10.CollectiblesItemDetails then
            v11.collectibleLowestResalePrice = v10.CollectiblesItemDetails.CollectibleLowestResalePrice or 0;
            v11.collectibleLowestAvailableResaleProductId = v10.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or "";
            v11.collectibleLowestAvailableResaleItemInstanceId = v10.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or "";
            v11.collectibleQuantityLimitPerUser = v10.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0;
            v11.collectibleIsLimited = v10.CollectiblesItemDetails.IsLimited;
        end;
    end;
    v11.creatorHasVerifiedBadge = v10.Creator.HasVerifiedBadge;
    if v7() then
        v11.isLimited = v10.IsLimited;
        v11.isLimitedUnique = v10.IsLimitedUnique;
        return v11;
    else
        v11.isLimited = v10.IsLimited or v10.IsLimitedUnique;
        return v11;
    end;
end;
v8.fromHumanoidDescription = function(v12) --[[ Line: 135 ]] --[[ Name: fromHumanoidDescription ]]
    -- upvalues: v8 (copy)
    local v13 = v8.new();
    v13.assetId = tostring(v12);
    return v13;
end;
v8.fromGetAssetBundles = function(v14, v15) --[[ Line: 143 ]] --[[ Name: fromGetAssetBundles ]]
    -- upvalues: v8 (copy)
    local v16 = v8.new();
    v16.assetId = tostring(v14);
    v16.bundlesAssetIsIn = v15;
    return v16;
end;
v8.fromBundleInfo = function(v17, v18) --[[ Line: 150 ]] --[[ Name: fromBundleInfo ]]
    -- upvalues: v8 (copy), v5 (copy)
    local v19 = v8.new();
    v19.assetId = tostring(v17);
    v19.parentBundleId = v18.bundleId;
    v19.bundlesAssetIsIn = {
        v18.bundleId
    };
    v19.collectibleItemId = v18.collectibleItemId;
    v19.collectibleProductId = v18.collectibleProductId;
    v19.collectibleLowestResalePrice = v18.collectibleLowestResalePrice;
    v19.collectibleLowestAvailableResaleProductId = v18.collectibleLowestAvailableResaleProductId;
    v19.collectibleLowestAvailableResaleItemInstanceId = v18.collectibleLowestAvailableResaleItemInstanceId;
    v19.collectibleQuantityLimitPerUser = v18.collectibleQuantityLimitPerUser;
    v19.collectibleIsLimited = v18.collectibleIsLimited;
    v19.isForSale = v18.isForSale;
    v19.remaining = v18.remaining;
    v19.owned = v18.owned;
    if not v19.collectibleIsLimited then
        v19.isForSale = v19.isForSale and not v19.owned;
    end;
    v19.description = v18.description or "";
    v19.productType = v5.ProductType.CollectibleItem;
    if v18.price then
        v19.price = v18.price;
    end;
    return v19;
end;
v8.fromGetAssetFavoriteCount = function(v20, v21) --[[ Line: 192 ]] --[[ Name: fromGetAssetFavoriteCount ]]
    -- upvalues: v8 (copy)
    local v22 = v8.new();
    v22.assetId = tostring(v20);
    v22.numFavorites = v21;
    return v22;
end;
v8.fromGetEconomyProductInfo = function(v23, v24, v25, v26, v27) --[[ Line: 201 ]] --[[ Name: fromGetEconomyProductInfo ]]
    -- upvalues: v8 (copy)
    local v28 = v8.new();
    v28.assetId = tostring(v23.assetId);
    v28.owned = v24;
    if v25 then
        v28.price = v25;
    end;
    v28.isForSale = v26;
    v28.premiumPricing = v27;
    return v28;
end;
v8.fromGetItemDetails = function(v29) --[[ Line: 215 ]] --[[ Name: fromGetItemDetails ]]
    -- upvalues: v8 (copy)
    local v30 = v8.new();
    v30.assetId = tostring(v29.Id);
    v30.owned = v29.Owned;
    v30.isForSale = v29.IsPurchasable;
    v30.price = v29.Price or 0;
    v30.hasResellers = v29.HasResellers;
    v30.collectibleItemId = v29.CollectibleItemId;
    return v30;
end;
v8.fromPurchaseSuccess = function(v31) --[[ Line: 228 ]] --[[ Name: fromPurchaseSuccess ]]
    -- upvalues: v8 (copy)
    local v32 = v8.new();
    v32.assetId = tostring(v31);
    v32.owned = true;
    return v32;
end;
v8.fromGetVersionInfo = function(v33, v34) --[[ Line: 241 ]] --[[ Name: fromGetVersionInfo ]]
    -- upvalues: v8 (copy)
    local v35 = v8.new();
    v35.assetId = tostring(v33);
    v35.creatingUniverseId = if v34.creatingUniverseId then tostring(v34.creatingUniverseId) else nil;
    return v35;
end;
v8.getSaleDetailsForCollectibles = function(v36) --[[ Line: 252 ]] --[[ Name: getSaleDetailsForCollectibles ]]
    -- upvalues: v2 (copy), v5 (copy), v6 (copy)
    local v37 = v2.joinDeep({}, v36);
    local l_saleLocation_0 = v36.saleLocation;
    if v36.productType == v5.ProductType.CollectibleItem then
        local v39 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ShopOnly;
        local v40 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ShopAndExperiencesById;
        local v41 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType == v5.SaleLocationType.ShopAndExperiencesById and type(l_saleLocation_0.UniverseIds) == "table" and table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
        local v42 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly;
        v37.isForSale = v36.isForSale and v36.canBeSoldInThisGame and v39 and (v40 or v41) and v42;
        if not v36.collectibleIsLimited then
            v37.isForSale = v37.isForSale and not v37.owned;
            return v37;
        end;
    elseif v6 then
        v37.isForSale = v36.isForSale and v36.canBeSoldInThisGame;
        if v36.canBeSoldInThisGame == nil then
            v37.isForSale = v36.isForSale;
            return v37;
        end;
    else
        v37.isForSale = v36.isForSale;
    end;
    return v37;
end;
return v8;