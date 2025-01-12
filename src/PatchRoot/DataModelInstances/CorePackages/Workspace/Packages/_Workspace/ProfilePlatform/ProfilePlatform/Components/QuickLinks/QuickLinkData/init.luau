local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_QuickLinks_0 = v2.QuickLinks;
return {
    [l_QuickLinks_0.Favorites] = {
        Title = v1.FavoritesQuickLink, 
        Icon = "icons/actions/favoriteOff", 
        Route = "%susers/%s/favorites#!/places", 
        EventName = v3.FavoritesQuickLinkClicked
    }, 
    [l_QuickLinks_0.Inventory] = {
        Title = v1.InventoryQuickLink, 
        Icon = "icons/menu/inventoryOff", 
        Route = "%susers/%s/inventory#!/accessories", 
        EventName = v3.InventoryQuickLinkClicked
    }, 
    [l_QuickLinks_0.Groups] = {
        Title = v1.GroupsQuickLink, 
        Icon = "icons/menu/groups", 
        Route = "%smy/communities", 
        EventName = v3.GroupsQuickLinkClicked
    }, 
    [l_QuickLinks_0.Badges] = {
        Title = v1.BadgesQuickLink, 
        Icon = "icons/controls/leaderboardOff", 
        Route = "%susers/%s/inventory#!/badges", 
        EventName = v3.BadgesQuickLinkClicked
    }
};