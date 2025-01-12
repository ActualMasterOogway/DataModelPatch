local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_FetchStatusReducer_0 = require(l_Parent_0.FetchStatusRodux).FetchStatusReducer;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_NextDataExpirationTimeReducer_0 = require(l_Parent_0.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local v17 = v3.combineReducers({
    FetchingStatus = l_FetchingStatus_0, 
    GameDetails = require(l_Parent_0.GameDetailRodux).GameDetails.GameDetailReducer, 
    [l_GameIconReducer_0.key] = l_GameIconReducer_0.reducer, 
    GameVotes = require(l_Parent_0.GameVotesRodux).GameVotes.GameVotes, 
    InGameUsersByGame = function(v15, _) --[[ Line: 27 ]] --[[ Name: InGameUsersByGame ]]
        return v15 or {};
    end, 
    OmniRecommendations = require(l_Modules_0.LuaApp.Reducers.Games.OmniRecommendations), 
    Personalization = v3.combineReducers({
        [l_FetchStatusReducer_0.key] = l_FetchStatusReducer_0.reducer, 
        [l_GameFiltersReducer_0.key] = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then l_GameFiltersReducer_0.reducer else nil, 
        GameGridFlexFeedItemBounds = v13, 
        [l_GameInfosReducer_0.key] = l_GameInfosReducer_0.reducer, 
        [l_NextDataExpirationTimeReducer_0.key] = l_NextDataExpirationTimeReducer_0.reducer, 
        [l_TopicContentsReducer_0.key] = l_TopicContentsReducer_0.reducer, 
        [l_TopicInfosReducer_0.key] = l_TopicInfosReducer_0.reducer
    }), 
    RequestsStatus = require(l_Modules_0.LuaApp.Reducers.RequestsStatus), 
    UserGameVotes = require(l_Parent_0.GameVotesRodux).UserGameVotes.UserGameVotes
});
local function v20(v18, v19) --[[ Line: 47 ]]
    -- upvalues: v17 (copy)
    return v17(v18, v19);
end;
return {
    new = function(v21, v22) --[[ Line: 53 ]] --[[ Name: new ]]
        -- upvalues: v2 (copy), v3 (copy), v20 (copy)
        if v22 == nil then
            v22 = {};
        end;
        local v23 = v2.List.join(v22, {
            v3.thunkMiddleware
        });
        return v3.Store.new(v20, v21 or {}, v23);
    end
};