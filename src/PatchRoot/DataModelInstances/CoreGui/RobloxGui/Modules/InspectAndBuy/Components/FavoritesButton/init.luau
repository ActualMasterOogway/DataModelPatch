local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Colors);
local v6 = require(l_Parent_0.Thunks.CreateFavoriteForAsset);
local v7 = require(l_Parent_0.Thunks.DeleteFavoriteForAsset);
local v8 = require(l_Parent_0.Thunks.CreateFavoriteForBundle);
local v9 = require(l_Parent_0.Thunks.DeleteFavoriteForBundle);
local v10 = require(l_Parent_0.Thunks.GetFavoriteForAsset);
local v11 = require(l_Parent_0.Thunks.GetFavoriteForBundle);
local v12 = require(l_Parent_0.Selectors.GotFavoriteForDetailsItem);
local v13 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v14 = require(l_Parent_0.Selectors.GetIsFavorite);
local v15 = require(l_Parent_0.UtilityFunctions);
local v16 = require(l_Parent_0.getSelectionImageObjectRounded);
local v17 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local l_Favorite_0 = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite;
local v19 = v2.PureComponent:extend("FavoritesButton");
v19.init = function(v20) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_ContextActionService_0 (copy), l_Favorite_0 (copy)
    v20.selectedImage = v16();
    v20.fetchFavoriteRetries = 0;
    l_ContextActionService_0:BindCoreAction("FavoriteGamepadShortcut", function(_, v22, _) --[[ Line: 34 ]]
        -- upvalues: v20 (copy)
        if v22 == Enum.UserInputState.End then
            v20:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_Favorite_0);
end;
v19.willUpdate = function(v24, v25) --[[ Line: 43 ]] --[[ Name: willUpdate ]]
    -- upvalues: v15 (copy)
    local l_gotFavoriteForDetailsItem_0 = v25.gotFavoriteForDetailsItem;
    local l_getFavoriteForAsset_0 = v24.props.getFavoriteForAsset;
    local l_getFavoriteForBundle_0 = v24.props.getFavoriteForBundle;
    if v25 and v25.assetInfo and not l_gotFavoriteForDetailsItem_0 and v24.fetchFavoriteRetries < 10 then
        local l_assetInfo_0 = v25.assetInfo;
        local v30 = l_assetInfo_0 and l_assetInfo_0.parentBundleId ~= nil;
        coroutine.wrap(function() --[[ Line: 57 ]]
            -- upvalues: v30 (copy), l_getFavoriteForAsset_0 (copy), l_assetInfo_0 (copy), v15 (ref), l_getFavoriteForBundle_0 (copy)
            if not v30 then
                l_getFavoriteForAsset_0(l_assetInfo_0.assetId);
                return;
            else
                local v31 = v15.getBundleId(l_assetInfo_0);
                l_getFavoriteForBundle_0(v31);
                return;
            end;
        end)();
        v24.fetchFavoriteRetries = v24.fetchFavoriteRetries + 1;
    end;
end;
v19.activateButton = function(v32) --[[ Line: 69 ]] --[[ Name: activateButton ]]
    -- upvalues: v17 (copy), v15 (copy)
    local l_isFavorited_0 = v32.props.isFavorited;
    local l_IsDetailsItemPartOfBundleAndOffsale_0 = v32.props.IsDetailsItemPartOfBundleAndOffsale;
    local l_createFavoriteForAsset_0 = v32.props.createFavoriteForAsset;
    local l_deleteFavoriteForAsset_0 = v32.props.deleteFavoriteForAsset;
    local l_createFavoriteForBundle_0 = v32.props.createFavoriteForBundle;
    local l_deleteFavoriteForBundle_0 = v32.props.deleteFavoriteForBundle;
    local l_assetInfo_1 = v32.props.assetInfo;
    local v40 = l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    if not v17 and v40 ~= "1" then
        return;
    elseif l_isFavorited_0 then
        if l_IsDetailsItemPartOfBundleAndOffsale_0 then
            l_deleteFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
            return;
        else
            l_deleteFavoriteForAsset_0(l_assetInfo_1.assetId);
            return;
        end;
    elseif l_IsDetailsItemPartOfBundleAndOffsale_0 then
        l_createFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
        return;
    else
        l_createFavoriteForAsset_0(l_assetInfo_1.assetId);
        return;
    end;
end;
v19.willUnmount = function(_) --[[ Line: 103 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("FavoriteGamepadShortcut");
end;
v19.render = function(v42) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v17 (copy)
    local l_isFavorited_1 = v42.props.isFavorited;
    local l_favoriteButtonRef_0 = v42.props.favoriteButtonRef;
    local l_assetInfo_2 = v42.props.assetInfo;
    local v46 = l_assetInfo_2 and l_assetInfo_2.creatorId or 0;
    return v2.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 44, 0, 44), 
        LayoutOrder = 1, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageColor3 = v5.White, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20), 
        SelectionImageObject = v42.selectedImage, 
        Visible = v17 and true or v46 == "1", 
        [v2.Ref] = l_favoriteButtonRef_0, 
        [v2.Event.Activated] = function() --[[ Line: 126 ]]
            -- upvalues: v42 (copy)
            v42:activateButton();
        end
    }, {
        FavoriteIcon = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 26, 0, 26), 
            Position = UDim2.new(0, 22, 0, 22), 
            Image = l_isFavorited_1 and "rbxasset://textures/ui/InspectMenu/ico_favorite.png" or "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png", 
            ImageColor3 = v5.White
        })
    });
end;
return v3.UNSTABLE_connect2(function(v47, _) --[[ Line: 141 ]]
    -- upvalues: v12 (copy), v14 (copy), v13 (copy)
    local l_assetId_0 = v47.detailsInformation.assetId;
    return {
        view = v47.view, 
        assetInfo = v47.assets[l_assetId_0], 
        bundleInfo = v47.bundles, 
        gotFavoriteForDetailsItem = v12(v47), 
        isFavorited = v14(v47), 
        IsDetailsItemPartOfBundleAndOffsale = v13(v47)
    };
end, function(v50) --[[ Line: 152 ]]
    -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return {
        createFavoriteForAsset = function(v51) --[[ Line: 154 ]] --[[ Name: createFavoriteForAsset ]]
            -- upvalues: v50 (copy), v6 (ref)
            v50(v6(v51));
        end, 
        deleteFavoriteForAsset = function(v52) --[[ Line: 157 ]] --[[ Name: deleteFavoriteForAsset ]]
            -- upvalues: v50 (copy), v7 (ref)
            v50(v7(v52));
        end, 
        createFavoriteForBundle = function(v53) --[[ Line: 160 ]] --[[ Name: createFavoriteForBundle ]]
            -- upvalues: v50 (copy), v8 (ref)
            v50(v8(v53));
        end, 
        deleteFavoriteForBundle = function(v54) --[[ Line: 163 ]] --[[ Name: deleteFavoriteForBundle ]]
            -- upvalues: v50 (copy), v9 (ref)
            v50(v9(v54));
        end, 
        getFavoriteForAsset = function(v55) --[[ Line: 166 ]] --[[ Name: getFavoriteForAsset ]]
            -- upvalues: v50 (copy), v10 (ref)
            v50(v10(v55));
        end, 
        getFavoriteForBundle = function(v56) --[[ Line: 169 ]] --[[ Name: getFavoriteForBundle ]]
            -- upvalues: v50 (copy), v11 (ref)
            v50(v11(v56));
        end
    };
end)(v19);