local _ = require(script.RoduxTypes);
local v1 = require(script.Flags.GetFIntLuaAppRecommendedGamesCount);
return {
    Constants = {
        DEFAULT_GAME_FETCH_COUNT = 40, 
        GAME_CAROUSEL_CHILD_PADDING = 12, 
        GAME_CAROUSEL_PADDING = 15, 
        GAME_CAROUSEL_SIDE_COMPACT_PADDING = 24, 
        GAME_CAROUSEL_SIDE_WIDE_PADDING = 48, 
        GAME_DETAILS_ACTION_BAR_HEIGHT = 48, 
        GAME_GRID_CHILD_PADDING = 12, 
        GAME_GRID_PADDING = 15, 
        GAME_GRID_TILE_FOOTER_HEIGHT = 70, 
        MAX_RECOMMENDED_GAMES_FETCH_COUNT = v1()
    }, 
    ExploreContentType = require(script.ExploreContentType), 
    GameBasicStatsLayoutType = require(script.GameBasicStatsLayoutType), 
    GameCardLayoutType = require(script.GameCardLayoutType), 
    GameMediaImageType = require(script.GameMediaImageType), 
    GameSortGroups = require(script.GameSortGroups), 
    GameTopicIds = require(script.GameTopicIds), 
    OmniRecommendationsContentType = require(script.OmniRecommendationsContentType), 
    SearchSourceEvent = require(script.SearchSourceEvent), 
    ["jest.config"] = script["jest.config"]
};