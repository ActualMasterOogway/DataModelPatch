local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Enums.PurchaseWarning);
local v3 = require(l_Parent_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local function v4() --[[ Line: 14 ]] --[[ Name: getABTestGroup ]]
    -- upvalues: v1 (copy)
    return v1.resolve(false);
end;
local function v7(_, _) --[[ Line: 18 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        AssetId = 1, 
        AssetTypeId = 2, 
        ContentRatingTypeId = 0, 
        Creator = {
            CreatorType = "Group", 
            CreatorTargetId = 1, 
            Name = "ROBLOX", 
            Id = 1
        }, 
        Description = "This item isn't real!", 
        IconImageAssetId = 1, 
        IsForSale = true, 
        IsLimited = false, 
        IsLimitedUnique = false, 
        IsNew = false, 
        IsPublicDomain = false, 
        MinimumMembershipLevel = 0, 
        Name = "Test Item", 
        PriceInRobux = 100, 
        ProductId = 1
    });
end;
local function v11(_, _, _) --[[ Line: 43 ]] --[[ Name: getPlayerOwns ]]
    -- upvalues: v1 (copy)
    return v1.resolve(false);
end;
local function v16(_, _, _, _) --[[ Line: 47 ]] --[[ Name: performPurchase ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        success = true, 
        purchased = true, 
        receipt = "fake-receipt-hash"
    });
end;
local function v18(_) --[[ Line: 55 ]] --[[ Name: loadAssetForEquip ]]
    -- upvalues: v1 (copy)
    return v1.resolve(Instance.new("Tool"));
end;
local function v19() --[[ Line: 59 ]] --[[ Name: getAccountInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        isPremium = false
    });
end;
local function v20() --[[ Line: 65 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        robux = 2147483647
    });
end;
local function v22(_) --[[ Line: 71 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        id = 1, 
        name = "mock-name", 
        description = "mock-description", 
        items = {
            [1] = {
                id = 1, 
                name = "outfit-name", 
                type = "UserOutfit"
            }
        }, 
        creator = {
            id = 1, 
            name = "ROBLOX", 
            type = "User"
        }, 
        product = {
            id = 1, 
            isForSale = true, 
            priceInRobux = 100
        }
    });
end;
local function v24(_) --[[ Line: 96 ]] --[[ Name: getProductPurchasableDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        purchasable = false, 
        reason = "mock-reason", 
        price = 100
    });
end;
local function v27(_, _) --[[ Line: 104 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        bundleType = 1, 
        bundledItems = {
            [1] = {
                id = 10001, 
                name = "Mock bundle - Left Arm", 
                owned = true, 
                type = "Asset"
            }, 
            [2] = {
                id = 1002, 
                name = "Mock bundle - Right Leg", 
                owned = true, 
                type = "Asset"
            }, 
            [3] = {
                id = 1003, 
                name = "Mock bundle - Right Arm", 
                owned = true, 
                type = "Asset"
            }, 
            [4] = {
                id = 1004, 
                name = "Mock bundle - Left Leg", 
                owned = true, 
                type = "Asset"
            }, 
            [5] = {
                id = 1005, 
                name = "Mock bundle - Dynamic Head", 
                owned = true, 
                type = "Asset"
            }, 
            [6] = {
                id = 1006, 
                name = "Default Mood", 
                owned = true, 
                type = "Asset"
            }, 
            [7] = {
                id = 1007, 
                name = "Mock bundle - Torso", 
                owned = true, 
                type = "Asset"
            }, 
            [8] = {
                id = 1008, 
                name = "Mock item", 
                owned = true, 
                type = "UserOutfit"
            }, 
            [9] = {
                id = 1009, 
                name = "Mock bundle Head", 
                owned = true, 
                type = "UserOutfit"
            }
        }, 
        collectibleItemId = "random-collectible-item-id-123", 
        creatorHasVerifiedBadge = true, 
        creatorName = "mockRobloxCreator", 
        creatorTargetId = 123, 
        creatorType = "User", 
        description = "Mock bundle", 
        expectedSellerId = 123, 
        favoriteCount = 908, 
        hasReseller = false, 
        id = 123456, 
        isPurchasable = true, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = "Bundle", 
        lowestPrice = 175, 
        lowestResalePrice = 0, 
        name = "Roblox Collectible Bundle", 
        owned = false, 
        price = 175, 
        productId = 1.234567890123456E15, 
        purchaseCount = 0, 
        saleLocationType = "ShopAndAllExperiences", 
        totalQuantity = 0, 
        unitsAvailableForConsumption = 0
    });
end;
local function v31(_, _, _) --[[ Line: 190 ]] --[[ Name: getRobuxUpsellProduct ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        roblox_product_id = 50, 
        provider_product_id = "robux50", 
        roblox_product_name = "providerRobux50", 
        robux_amount = 500
    });
end;
local function v32() --[[ Line: 199 ]] --[[ Name: postPremiumImpression ]]
    -- upvalues: v1 (copy)
    return v1.resolve();
end;
local function v33() --[[ Line: 203 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v1 (copy)
    return v1.resolve(true);
end;
local function v35(_) --[[ Line: 207 ]] --[[ Name: getPurchaseWarning ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.resolve({
        action = v2.NoAction
    });
end;
local function v36() --[[ Line: 213 ]] --[[ Name: postPurchaseWarningAcknowledge ]]
    -- upvalues: v1 (copy)
    return v1.resolve();
end;
local function v37() --[[ Line: 217 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        isEligible = false, 
        failureReason = "PurchaseNotEnabled"
    });
end;
local v38 = {};
v38.__index = v38;
v38.new = function(v39, v40) --[[ Line: 228 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v7 (copy), v11 (copy), v16 (copy), v18 (copy), v19 (copy), v20 (copy), v22 (copy), v24 (copy), v27 (copy), v31 (copy), v32 (copy), v33 (copy), v35 (copy), v36 (copy), v37 (copy)
    local v41 = nil;
    if v40 or v39 then
        local function v42() --[[ Line: 232 ]]
            -- upvalues: v39 (copy), v1 (ref), v40 (copy)
            if v39 then
                return v1.resolve(v39);
            else
                return v1.reject(v40);
            end;
        end;
        v41 = {
            getABTestGroup = v42, 
            getProductInfo = v42, 
            getPlayerOwns = v42, 
            performPurchase = v42, 
            loadAssetForEquip = v42, 
            getAccountInfo = v42, 
            getBalanceInfo = v42, 
            getBundleDetails = v42, 
            getProductPurchasableDetails = v42, 
            getCatalogItemDetails = if v3() then v42 else nil, 
            getRobuxUpsellProduct = v42, 
            postPremiumImpression = v42, 
            getPremiumUpsellPrecheck = v42, 
            getPurchaseWarning = v42, 
            postPurchaseWarningAcknowledge = v42, 
            checkUserPurchaseSettings = v42
        };
    else
        v41 = {
            getABTestGroup = v4, 
            getProductInfo = v7, 
            getPlayerOwns = v11, 
            performPurchase = v16, 
            loadAssetForEquip = v18, 
            getAccountInfo = v19, 
            getBalanceInfo = v20, 
            getBundleDetails = v22, 
            getProductPurchasableDetails = v24, 
            getCatalogItemDetails = if v3() then v27 else nil, 
            getRobuxUpsellProduct = v31, 
            postPremiumImpression = v32, 
            getPremiumUpsellPrecheck = v33, 
            getPurchaseWarning = v35, 
            postPurchaseWarningAcknowledge = v36, 
            checkUserPurchaseSettings = v37
        };
    end;
    setmetatable(v41, {
        __tostring = function() --[[ Line: 281 ]] --[[ Name: __tostring ]]
            return "MockService(Network)";
        end
    });
    return v41;
end;
return v38;