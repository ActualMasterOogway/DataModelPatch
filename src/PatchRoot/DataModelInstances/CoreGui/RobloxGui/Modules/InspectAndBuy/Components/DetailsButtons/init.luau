local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.UtilityFunctions);
local v9 = require(l_Parent_0.Components.FavoritesButton);
local v10 = require(l_Parent_0.Components.TryOnButton);
local v11 = require(l_Parent_0.Components.BuyButton);
local v12 = require(l_Parent_0.Components.InspectAndBuyControllerBar);
local v13 = require(l_Parent_0.Selectors.GetIsFavorite);
local v14 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v15 = require(l_CorePackages_0.Packages.tutils);
local v16 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local v17 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v18 = require(l_Parent_0.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles);
local v19 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v20 = game:DefineFastFlag("IBFixResaleAfterQuantityLimit", false);
local v21 = v5.PureComponent:extend("DetailsButtons");
local function _(v22) --[[ Line: 40 ]] --[[ Name: isAnimationAsset ]]
    -- upvalues: v7 (copy)
    return v7.AnimationAssetTypes[v22] ~= nil;
end;
local function v30(v24, v25, v26, v27) --[[ Line: 44 ]] --[[ Name: getBuyText ]]
    -- upvalues: v19 (copy), v14 (copy), v7 (copy), l_Players_0 (copy)
    local v28 = nil;
    local v29 = v24.isLimited or v19() and v24.isLimitedUnique;
    if v27 then
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", v25, {
            PRICE = tostring(v27)
        }));
    elseif v26 and v24.isForSale then
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", v25));
    elseif v24.price ~= nil and v24.productType == v7.ProductType.CollectibleItem and v24.isForSale then
        return v24.price;
    elseif v24.owned then
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", v25));
    elseif v29 then
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", v25));
    elseif not v24.isForSale and not v29 then
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", v25));
    else
        if v24.isForSale then
            if v24.premiumPricing ~= nil then
                if l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
                    return v24.premiumPricing.premiumPriceInRobux;
                elseif v24.price == nil then
                    return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", v25));
                else
                    return v24.price;
                end;
            else
                v28 = v24.price;
            end;
        end;
        return v28;
    end;
end;
v21.init = function(v31) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v31.tryOnButtonRef = v5.createRef();
    v31.buyButtonRef = v5.createRef();
    v31.favoriteButtonRef = v5.createRef();
end;
v21.didUpdate = function(v32, v33) --[[ Line: 94 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v16 (copy), l_GuiService_0 (copy), v17 (copy)
    local l_detailsInformation_0 = v32.props.detailsInformation;
    local l_gamepadEnabled_0 = v32.props.gamepadEnabled;
    if l_detailsInformation_0.viewingDetails then
        local l_assetInfo_0 = v32.props.assetInfo;
        local l_assetTypeId_0 = l_assetInfo_0.assetTypeId;
        local v38 = not (v7.AnimationAssetTypes[l_assetTypeId_0] ~= nil);
        local l_visible_0 = v32.props.visible;
        if l_gamepadEnabled_0 and l_visible_0 then
            l_assetTypeId_0 = l_assetInfo_0 and l_assetInfo_0.creatorId or 0;
            if v16 then
                l_GuiService_0.SelectedCoreObject = v32.favoriteButtonRef.current;
            elseif l_assetTypeId_0 == "1" then
                l_GuiService_0.SelectedCoreObject = v32.favoriteButtonRef.current;
            elseif v38 then
                l_GuiService_0.SelectedCoreObject = v32.tryOnButtonRef.current;
            else
                l_GuiService_0.SelectedCoreObject = v32.buyButtonRef.current;
            end;
        end;
    elseif v32.props.assetInfo.bundlesAssetIsIn == nil and l_detailsInformation_0.viewingDetails and l_gamepadEnabled_0 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    if v17 then
        local l_overlay_0 = v32.props.overlay;
        local l_overlay_1 = v33.overlay;
        if l_gamepadEnabled_0 and l_overlay_0 and l_overlay_0.overlay == nil and l_overlay_1 and l_overlay_1.overlay ~= nil then
            l_GuiService_0.SelectedCoreObject = v32.tryOnButtonRef.current;
        end;
    end;
end;
v21.calculateBuyStatusForLimitedItem = function(v42, v43, v44, v45) --[[ Line: 134 ]] --[[ Name: calculateBuyStatusForLimitedItem ]]
    -- upvalues: v8 (copy), v15 (copy), v20 (copy), l_Players_0 (copy), v30 (copy), v7 (copy)
    local v46 = v8.isLimited2Point0_Or_LimitedCollectible(v43);
    local v47 = v8.isLimited1Point0(v43) or v8.isLimited1Point0_LimitedUnique(v43);
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if v46 then
        v45 = v43.isForSale;
        local l_resellableInstances_0 = v42.props.resellableInstances;
        local v54 = l_resellableInstances_0 and l_resellableInstances_0[v43.collectibleItemId] and v15.fieldCount(l_resellableInstances_0[v43.collectibleItemId]);
        v48 = v54 and v43.collectibleQuantityLimitPerUser ~= nil and v43.collectibleQuantityLimitPerUser > 0 and v43.collectibleQuantityLimitPerUser <= v54;
        local v55 = v43.collectibleLowestAvailableResaleProductId and v43.collectibleLowestAvailableResaleProductId ~= "";
        local v56 = false;
        v56 = if v20 then if v43.remaining > 0 then v55 and (v43.price or 0) > v43.collectibleLowestResalePrice else v55 and v43.collectibleLowestResalePrice else v55 and (v43.price or 0) > v43.collectibleLowestResalePrice;
        if v55 then
            if not v45 or v48 or v56 then
                v49 = v43.collectibleLowestResalePrice;
                v50 = v43.collectibleLowestAvailableResaleItemInstanceId;
                v51 = v43.collectibleLowestAvailableResaleProductId;
                v52 = v43.collectibleItemId;
                v45 = true;
            end;
        elseif v48 then
            v45 = false;
        end;
    else
        v45 = v43.isForSale and not v43.owned and not v47;
    end;
    if v45 and v43.price == nil and v43.premiumPricing ~= nil then
        v45 = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium;
    end;
    local v57 = v30(v43, v44, v48, v49);
    local v58 = not (not (v43.price ~= nil) or v43.owned) and v45 or v49 ~= nil or v43.price ~= nil and v43.productType == v7.ProductType.CollectibleItem and v45;
    return {
        buyText = v57, 
        showRobuxIcon = v58, 
        forSale = v45, 
        collectibleQuantityLimitReached = v48, 
        collectibleLowestResalePrice = v49, 
        collectibleLowestAvailableResaleItemInstanceId = v50, 
        collectibleLowestAvailableResaleProductId = v51, 
        collectibleItemId = v52
    };
end;
v21.render = function(v59) --[[ Line: 214 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), v18 (copy), v5 (copy), v12 (copy), v16 (copy), v9 (copy), v10 (copy), v11 (copy)
    local l_locale_0 = v59.props.locale;
    local l_assetInfo_1 = v59.props.assetInfo;
    local v62 = false;
    local v63 = false;
    local v64 = l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    if l_assetInfo_1 then
        v67 = l_assetInfo_1.parentBundleId ~= nil;
        v71 = v67 and not l_assetInfo_1.isForSale;
        if v67 then
            v68 = v8.getBundleId(l_assetInfo_1);
            v69 = v7.ItemType.Bundle;
            v70 = v68;
        else
            v69 = v7.ItemType.Asset;
            v70 = l_assetInfo_1.assetId;
        end;
        local v76 = v59:calculateBuyStatusForLimitedItem(l_assetInfo_1, l_locale_0, v66);
        v65 = v76.buyText;
        v62 = v76.showRobuxIcon;
        v66 = v76.forSale;
        local _ = v76.collectibleQuantityLimitReached;
        v73 = v76.collectibleLowestResalePrice;
        v74 = v76.collectibleLowestAvailableResaleProductId;
        v75 = v76.collectibleLowestAvailableResaleItemInstanceId;
        v72 = v76.collectibleItemId;
        local l_assetTypeId_1 = l_assetInfo_1.assetTypeId;
        v63 = not (v7.AnimationAssetTypes[l_assetTypeId_1] ~= nil);
        if v7.AssetTypeIdStringToHumanoidDescriptionProp[l_assetInfo_1.assetTypeId] == nil and v7.AssetTypeIdToAccessoryTypeEnum[l_assetInfo_1.assetTypeId] == nil then
            v63 = false;
        end;
    end;
    local v79 = nil;
    if v18() then
        v79 = v8.isUnlimitedCollectibleAsset(v69, l_assetInfo_1) or v8.isLimitedBundle(v69, l_assetInfo_1) or v8.isUnlimitedCollectibleBundle(v69, l_assetInfo_1);
    end;
    if l_assetInfo_1 then
        v72 = l_assetInfo_1.collectibleItemId;
        local v80 = v59.props.assetBundles[l_assetInfo_1.assetId];
        v79 = v67 and #v80 > 1;
    end;
    local v81 = v59.props.detailsInformation.viewingDetails and v59.props.gamepadEnabled;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 51), 
        Position = UDim2.new(0, 0, 1, -51)
    }, {
        UIListLayout = v5.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ControllerBar = v81 and v5.createElement(v12, {
            showTryOn = v63, 
            tryingOn = v59.props.tryingOn, 
            showFavorite = v16 and true or v64 == "1", 
            isFavorited = v59.props.isFavorited
        }), 
        FavoriteButton = v5.createElement(v9, {
            favoriteButtonRef = v59.favoriteButtonRef
        }), 
        TryOnButton = v5.createElement(v10, {
            showTryOn = v63, 
            assetInfo = l_assetInfo_1, 
            partOfBundleAndOffsale = v71, 
            bundleId = v68, 
            tryOnButtonRef = v59.tryOnButtonRef, 
            localPlayerModel = v59.props.localPlayerModel
        }), 
        TryOnFiller = v5.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.5, -32, 0, 44), 
            Visible = not v63, 
            LayoutOrder = 2, 
            Image = "", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(5, 5, 120, 20)
        }), 
        BuyButton = if v18() and v79 then nil else v5.createElement(v11, {
            itemType = v69, 
            itemId = v70, 
            showRobuxIcon = v62, 
            forSale = v66, 
            buyText = v65, 
            buyButtonRef = v59.buyButtonRef, 
            collectibleItemId = v72, 
            collectibleLowestAvailableResaleProductId = v74, 
            collectibleLowestAvailableResaleItemInstanceId = v75, 
            collectibleLowestResalePrice = v73
        })
    });
end;
return v6.UNSTABLE_connect2(function(v82, _) --[[ Line: 342 ]]
    -- upvalues: v13 (copy), v17 (copy)
    local l_assetId_0 = v82.detailsInformation.assetId;
    local v85 = v13(v82);
    return {
        visible = v82.visible, 
        assetInfo = v82.assets[l_assetId_0] or {}, 
        assetBundles = v82.assetBundles, 
        detailsInformation = v82.detailsInformation, 
        bundleInfo = v82.bundles, 
        locale = v82.locale, 
        gamepadEnabled = v82.gamepadEnabled, 
        isFavorited = v85, 
        tryingOn = v82.tryingOnInfo.tryingOn, 
        resellableInstances = v82.collectibleResellableInstances, 
        overlay = if v17 then v82.overlay else nil
    };
end)(v21);