local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_Parent_0.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local v5 = v1.strictInterface({
    pg = v1.string, 
    universeId = v1.union(v1.string, v1.number), 
    navigationUniverseId = v1.optional(v1.string), 
    pos = v1.optional(v1.number), 
    pid = v1.optional(v1.union(v1.number, v1.string)), 
    sortPos = v1.optional(v1.number), 
    ad = v1.optional(v1.string), 
    gameSetTargetId = v1.optional(v1.number), 
    gameSetTypeId = v1.optional(v1.string), 
    tis = v1.optional(v1.number), 
    refId = v1.optional(v1.string), 
    src = v1.optional(v1.string), 
    friendId = v1.optional(v1.string), 
    position = v1.optional(v1.number), 
    absolutePosition = v1.optional(v1.number), 
    fromWhere = v1.optional(v1.string), 
    locale = v1.optional(v1.string), 
    conversationId = v1.optional(v1.number), 
    shareLinkType = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v1.optional(v1.string) else nil, 
    shareLinkId = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v1.optional(v1.string) else nil, 
    rowOnPage = v1.optional(v1.number), 
    appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v1.optional(v1.string) else nil, 
    topicDataPosition = v1.optional(v1.number)
});
return function(v6, v7, v8) --[[ Line: 35 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy)
    local v9, v10 = v5(v8);
    if not v9 then
        l_mutedError_0(v10);
    end;
    v6:sendEventDeferred(v7, "gameDetailReferral", v8);
end;