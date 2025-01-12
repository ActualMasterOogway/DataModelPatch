local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.t);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local v6 = game:DefineFastFlag("FixSearchLandingPageGameImpressionsInterface", false);
local v7 = v1.strictInterface({
    absPositions = v1.string, 
    topicDataPositions = v1.string, 
    rootPlaceIds = v1.string, 
    universeIds = v1.string, 
    gameSetTypeId = v1.string, 
    sortPos = v1.number, 
    locale = v1.string, 
    thumbnailAssetIds = v1.optional(v1.string), 
    thumbnailListIds = v1.optional(v1.string), 
    componentType = v1.optional(v1.string), 
    gameSetTargetId = v1.optional(v1.number), 
    pageId = v1.optional(v1.string), 
    adFlags = v1.optional(v1.string), 
    adIds = v1.optional(v1.string), 
    rows = v1.optional(v1.string), 
    rowsOnPage = v1.optional(v1.string), 
    positionsInRows = v1.optional(v1.string), 
    tileBadgeContexts = v1.optional(v1.string), 
    appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v1.optional(v1.string) else nil
});
local v8 = v1.strictInterface({
    absPositions = v1.string, 
    topicDataPositions = v1.string, 
    rootPlaceIds = v1.string, 
    universeIds = v1.string, 
    gameSetTypeId = v1.string, 
    locale = v1.string, 
    seeAllFlag = v1.number, 
    gameSetTargetId = v1.optional(v1.number), 
    pageId = v1.optional(v1.string), 
    adFlags = v1.optional(v1.string), 
    adIds = v1.optional(v1.string), 
    appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v1.optional(v1.string) else nil
});
local v9 = v1.strictInterface({
    absPositions = v1.string, 
    topicDataPositions = v1.string, 
    rootPlaceIds = v1.string, 
    universeIds = v1.string, 
    searchUuid = v1.string, 
    emphasisFlag = v1.number, 
    seeAllFlag = v1.number, 
    sortPos = v1.optional(v1.number), 
    gameSetTypeId = v1.optional(v1.string), 
    locale = v1.optional(v1.string), 
    adFlags = v1.optional(v1.string), 
    adIds = v1.optional(v1.string), 
    rows = v1.optional(v1.string), 
    rowsOnPage = v1.optional(v1.string), 
    positionsInRows = v1.optional(v1.string)
});
local v10 = v1.strictInterface({
    absPositions = v1.string, 
    topicDataPositions = v1.string, 
    rootPlaceIds = v1.string, 
    universeIds = v1.string, 
    refId = v1.string, 
    adFlags = v1.optional(v1.string), 
    adIds = v1.optional(v1.string), 
    locale = v1.optional(v1.string)
});
local v11 = if l_FFlagSearchOmniAutocompletePage_0 then v1.strictInterface({
    absPositions = v1.string, 
    topicDataPositions = v1.string, 
    rootPlaceIds = v1.string, 
    universeIds = v1.string, 
    sortPos = v1.number, 
    gameSetTypeId = v1.optional(v1.string), 
    locale = v1.optional(v1.string), 
    thumbnailAssetIds = v1.optional(v1.string), 
    componentType = v1.optional(v1.string), 
    gameSetTargetId = if v6 then v1.optional(v1.number) else nil, 
    adFlags = if v6 then v1.optional(v1.string) else nil, 
    adIds = if v6 then v1.optional(v1.string) else nil, 
    tileBadgeContexts = if v6 then v1.optional(v1.string) else nil, 
    thumbnailListIds = if v6 then v1.optional(v1.string) else nil
}) else nil;
local v12 = {
    [l_AppPage_0.Home] = v7, 
    [l_AppPage_0.Games] = v7, 
    [l_AppPage_0.SearchPage] = v9, 
    [l_AppPage_0.SearchLandingPage] = if l_FFlagSearchOmniAutocompletePage_0 then v11 else nil, 
    recommended = v10, 
    Deeplink = v8
};
return function(v13, v14, v15) --[[ Line: 114 ]]
    -- upvalues: l_AppPage_0 (copy), v8 (copy), v12 (copy), l_mutedError_0 (copy)
    local v16 = nil;
    v16 = if v15.seeAllFlag and (not (v14 ~= l_AppPage_0.Home) or v14 == l_AppPage_0.Games) then v8 else v12[v14];
    if v16 then
        local v17, v18 = v16(v15);
        if not v17 then
            l_mutedError_0(v18);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check gameImpressions event parameters", v14));
    end;
    v13:sendEventDeferred(v14, "gameImpressions", v15);
end;