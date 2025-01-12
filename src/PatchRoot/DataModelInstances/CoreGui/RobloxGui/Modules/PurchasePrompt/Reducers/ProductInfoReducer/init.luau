local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_Parent_0.Misc.Constants);
local v6 = require(l_Parent_0.Actions.CompleteRequest);
local v7 = require(l_Parent_0.Actions.ProductInfoReceived);
local v8 = require(l_Parent_0.Actions.BundleProductInfoReceived);
local v9 = require(l_Parent_0.Enums.ItemType);
local v10 = require(l_Parent_0.getPreviewImageUrl);
local v11 = require(l_Parent_0.Flags.GetFFlagTranslateDevProducts);
local v12 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v13 = require(l_Parent_0.Flags.GetFFlagFixBundlePromptThumbnail);
return (l_Rodux_0.createReducer({}, {
    [v7.name] = function(_, v15) --[[ Line: 25 ]]
        -- upvalues: v5 (copy), v11 (copy), v12 (copy), v10 (copy)
        local l_productInfo_0 = v15.productInfo;
        local v17 = "";
        local v18 = "";
        if l_productInfo_0.ProductType == v5.ProductType.CollectibleItem then
            v17 = l_productInfo_0.CollectibleItemId;
            v18 = l_productInfo_0.CollectibleProductId;
        end;
        return {
            name = v11() and (l_productInfo_0.DisplayName or l_productInfo_0.Name) or l_productInfo_0.Name, 
            description = if v12 then l_productInfo_0.Description else nil, 
            price = l_productInfo_0.PriceInRobux or 0, 
            premiumPrice = l_productInfo_0.PremiumPriceInRobux, 
            imageUrl = v10(l_productInfo_0), 
            assetTypeId = l_productInfo_0.AssetTypeId, 
            productId = l_productInfo_0.ProductId, 
            productType = l_productInfo_0.ProductType, 
            membershipTypeRequired = l_productInfo_0.MinimumMembershipLevel, 
            itemType = l_productInfo_0.AssetTypeId, 
            collectibleItemId = v17, 
            collectibleProductId = v18
        };
    end, 
    [v8.name] = function(_, v20) --[[ Line: 51 ]]
        -- upvalues: v13 (copy), v9 (copy), v10 (copy)
        local l_bundleProductInfo_0 = v20.bundleProductInfo;
        local v22 = nil;
        for _, v24 in ipairs(l_bundleProductInfo_0.items) do
            if v24.type == "UserOutfit" then
                v22 = v24.id;
                if v13() then
                    break;
                end;
            end;
        end;
        l_bundleProductInfo_0.costumeId = v22;
        l_bundleProductInfo_0.itemType = v9.Bundle;
        return {
            name = l_bundleProductInfo_0.name, 
            price = l_bundleProductInfo_0.product.priceInRobux or 0, 
            imageUrl = v10(l_bundleProductInfo_0), 
            assetTypeId = nil, 
            productId = l_bundleProductInfo_0.product.id, 
            membershipTypeRequired = nil, 
            itemType = l_bundleProductInfo_0.itemType
        };
    end, 
    [v6.name] = function(_, _) --[[ Line: 78 ]]
        return {};
    end
}));