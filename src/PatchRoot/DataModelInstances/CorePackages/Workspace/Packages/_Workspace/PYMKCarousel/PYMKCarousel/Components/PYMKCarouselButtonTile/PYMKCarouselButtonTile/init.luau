local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v5 = require(l_Parent_0.Common.TextKeys);
local v6 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v6.EventNames;
local l_BtnValues_0 = v6.BtnValues;
local l_CarouselGenericSquareTile_0 = v2.SocialCommon.Components.CarouselGenericSquareTile;
local l_FFlagLuaAppPYMKCollectionMigration_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPYMKCollectionMigration;
local l_UIBlox_0 = v2.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v14 = l_Images_0["icons/graphic/findfriends_large"];
local v15 = l_Images_0["icons/navigation/pushRight"];
return function(v16) --[[ Line: 29 ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), l_EventNames_0 (copy), l_BtnValues_0 (copy), l_React_0 (copy), l_CarouselGenericSquareTile_0 (copy), v14 (copy), l_FFlagLuaAppPYMKCollectionMigration_0 (copy), v15 (copy), l_IconSize_0 (copy)
    local v17 = l_useLocalization_0({
        findFriendsLabel = v5.FindFriendsLabel, 
        seeAllLabel = v5.SeeAllLabel, 
        newTextBadge = v5.NewText
    });
    local function _(v18, v19) --[[ Line: 36 ]]
        -- upvalues: v16 (copy), l_EventNames_0 (ref)
        return function() --[[ Line: 37 ]]
            -- upvalues: v16 (ref), l_EventNames_0 (ref), v18 (copy), v19 (copy)
            v16.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v18
            });
            v16.goToAddFriendsPage(v19);
        end;
    end;
    if v16.id == l_BtnValues_0.FindFriends.rawValue() then
        local l_createElement_0 = l_React_0.createElement;
        local l_l_CarouselGenericSquareTile_0_0 = l_CarouselGenericSquareTile_0;
        local v23 = {
            borderThickness = 1, 
            badgeValue = if v16.shouldShowContactImporterBadge then v17.newTextBadge else nil, 
            icon = v14, 
            labelText = v17.findFriendsLabel
        };
        local v24 = l_BtnValues_0.FindFriends.rawValue();
        local v25 = true;
        v23.onActivated = function() --[[ Line: 37 ]]
            -- upvalues: v16 (copy), l_EventNames_0 (ref), v24 (copy), v25 (copy)
            v16.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v24
            });
            v16.goToAddFriendsPage(v25);
        end;
        v23.tileSize = if l_FFlagLuaAppPYMKCollectionMigration_0 then v16.tileWidth else nil;
        v23.LayoutOrder = if l_FFlagLuaAppPYMKCollectionMigration_0 then v16.LayoutOrder else nil;
        return l_createElement_0(l_l_CarouselGenericSquareTile_0_0, v23);
    elseif v16.id == l_BtnValues_0.SeeAll.rawValue() then
        local l_createElement_1 = l_React_0.createElement;
        local l_l_CarouselGenericSquareTile_0_1 = l_CarouselGenericSquareTile_0;
        local v28 = {
            icon = v15, 
            iconSize = l_IconSize_0.Medium, 
            labelText = v17.seeAllLabel
        };
        local v29, v30 = l_BtnValues_0.SeeAll.rawValue();
        v28.onActivated = function() --[[ Line: 37 ]]
            -- upvalues: v16 (copy), l_EventNames_0 (ref), v29 (copy), v30 (copy)
            v16.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v29
            });
            v16.goToAddFriendsPage(v30);
        end;
        v28.tileSize = if l_FFlagLuaAppPYMKCollectionMigration_0 then v16.tileWidth else nil;
        v28.LayoutOrder = if l_FFlagLuaAppPYMKCollectionMigration_0 then v16.LayoutOrder else nil;
        return l_createElement_1(l_l_CarouselGenericSquareTile_0_1, v28);
    else
        return nil;
    end;
end;