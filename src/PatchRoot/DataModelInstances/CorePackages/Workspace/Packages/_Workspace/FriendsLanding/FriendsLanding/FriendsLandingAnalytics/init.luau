local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Context_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(script.ButtonClickEvents);
local v4 = require(script.ImpressionEvents);
local v5 = require(script.AnalyticsContext);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
return {
    Class = require(script.FriendsLandingAnalytics), 
    Context = v5, 
    connect = l_Context_0.getConnect(v5), 
    with = l_Context_0.getWith(v5), 
    ButtonClickEvents = v3, 
    AddFriendsPageLoadAnalytics = require(script.AddFriendsPageLoadAnalytics), 
    AddFriendsSearchbarPressedEvent = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else require(script.AddFriendsSearchbarPressedEvent), 
    ImpressionEvents = v4, 
    PlayerSearchEvent = require(script.PlayerSearchEvent)
};