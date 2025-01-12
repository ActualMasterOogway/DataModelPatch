local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagLuaAppAddFriendIdToGamePlayIntentEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddFriendIdToGamePlayIntentEvents;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local v7 = v2.strictInterface({
    placeId = v2.union(v2.string, v2.number), 
    rootPlaceId = v2.union(v2.number, v2.string), 
    referralSource = v2.optional(v2.string), 
    sortIndex = v2.optional(v2.string), 
    sortEntryIndex = v2.optional(v2.string), 
    gameSetTypeId = v2.optional(v2.string), 
    gameSetTargetId = v2.optional(v2.number), 
    linkId = v2.optional(v2.union(v2.string, v2.number)), 
    linkType = v2.optional(v2.string), 
    linkStatus = v2.optional(v2.string), 
    conversationId = v2.optional(v2.union(v2.number, v2.string)), 
    joinAttemptId = v2.optional(v2.string), 
    uid = v2.optional(v2.string)
});
local v8 = v2.strictInterface({
    placeId = v2.union(v2.string, v2.number), 
    rootPlaceId = v2.union(v2.number, v2.string), 
    referralSource = v2.optional(v2.string)
});
local v9 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    universeId = v2.optional(v2.string), 
    referralSource = v2.optional(v2.string), 
    sortIndex = v2.string, 
    sortEntryIndex = v2.string, 
    gameSetTypeId = v2.optional(v2.string), 
    gameSetTargetId = v2.optional(v2.number), 
    appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v2.optional(v2.string) else nil, 
    topicDataPosition = v2.optional(v2.number)
});
local v10 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    sortEntryIndex = v2.string, 
    gameSetTypeId = v2.string, 
    sortIndex = v2.number, 
    rowOnPage = v2.optional(v2.number), 
    topicDataPosition = v2.optional(v2.number)
});
local v11 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    joinAttemptId = v2.optional(v2.string), 
    friendId = if l_FFlagLuaAppAddFriendIdToGamePlayIntentEvents_0 then v2.string else nil
});
local v12 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    joinAttemptId = v2.optional(v2.string), 
    friendId = if l_FFlagLuaAppAddFriendIdToGamePlayIntentEvents_0 then v2.string else nil
});
local v13 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    joinAttemptId = v2.optional(v2.string), 
    conversationId = v2.optional(v2.string)
});
local v14 = v2.strictInterface({
    placeId = v2.union(v2.string, v2.number), 
    rootPlaceId = v2.union(v2.number, v2.string), 
    linkId = v2.string, 
    linkType = v2.string, 
    linkStatus = v2.string, 
    joinAttemptId = v2.optional(v2.string)
});
local v15 = v2.strictInterface({
    friendId = v2.string, 
    pageName = v2.string, 
    placeId = v2.optional(v2.string), 
    rootPlaceId = v2.optional(v2.string), 
    joinAttemptId = v2.string
});
local v16 = v2.strictInterface({
    placeId = v2.string, 
    rootPlaceId = v2.number, 
    universeId = v2.string, 
    referralSource = v2.string, 
    sortIndex = v2.string, 
    sortEntryIndex = v2.string, 
    gameSetTypeId = v2.string, 
    gameSetTargetId = v2.optional(v2.number), 
    topicDataPosition = v2.optional(v2.number)
});
local v17 = {
    PlayButton = v8, 
    [v4.Context.ExperienceTile] = v9, 
    [v4.Context.SearchExperienceTile] = v10, 
    [v4.Context.PeopleListInHomePage] = v11, 
    [v4.Context.GamePlayIntentInPlacesList] = v12, 
    shareLinks = v14, 
    PlayGameFromPlayTogether = v7, 
    PlayGameFromLinkCard = v13, 
    [v4.Context.PlayerContextualMenu] = v15, 
    [v4.Context.HoldToPlayLauncher] = v16
};
return function(v18, v19, v20) --[[ Line: 121 ]]
    -- upvalues: v17 (copy), l_mutedError_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy)
    if v17[v19] ~= nil then
        local v21, v22 = v17[v19](v20);
        if not v21 then
            l_mutedError_0(v22);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check gamePlayIntent event parameters", v19));
    end;
    v18:sendEventDeferred(v19, "gamePlayIntent", {
        placeId = v20.placeId, 
        rootPlaceId = v20.rootPlaceId, 
        universeId = v20.universeId, 
        referralSource = v20.referralSource, 
        sortIndex = v20.sortIndex, 
        sortEntryIndex = v20.sortEntryIndex, 
        gameSetTypeId = v20.gameSetTypeId, 
        gameSetTargetId = v20.gameSetTargetId, 
        linkId = v20.linkId, 
        linkType = v20.linkType, 
        linkStatus = v20.linkStatus, 
        conversationId = v20.conversationId, 
        joinAttemptId = v20.joinAttemptId, 
        friendId = v20.friendId, 
        pageName = v20.pageName, 
        rowOnPage = v20.rowOnPage, 
        appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v20.appliedFilters else nil, 
        topicDataPosition = v20.topicDataPosition
    });
end;