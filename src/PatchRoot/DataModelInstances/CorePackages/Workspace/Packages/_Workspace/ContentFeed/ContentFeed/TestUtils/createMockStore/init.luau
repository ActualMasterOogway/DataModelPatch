local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Constants);
local l_FetchingStatus_0 = require(l_Parent_1.Http).Reducers.FetchingStatus;
local l_GameDetailReducer_0 = require(l_Parent_1.GameDetailRodux).GameDetails.GameDetailReducer;
local l_GamesProductInfoReducer_0 = require(l_Parent_1.GameProductInfoRodux).GamesProductInfoReducer;
local v8 = require(l_Parent_1.GameVotesRodux);
local v9 = require(l_Parent_0.installReducer.Inspect);
local v10 = require(l_Parent_0.installReducer);
local v11 = require(l_Parent_0.installReducer.ItemDetails);
local v12 = require(l_Parent_0.App.Networking);
local l_NextDataExpirationTimeReducer_0 = require(l_Parent_1.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer;
local l_PlayabilityStatusReducer_0 = require(l_Parent_1.PlayabilityRodux).PlayabilityStatus.PlayabilityStatusReducer;
local v15 = require(l_Parent_0.installReducer.ScreenSize);
local l_ShowAgeVerificationOverlay_0 = require(l_Parent_1.VoiceChat).AgeVerificationOverlay.ShowAgeVerificationOverlay;
local l_UserGameVotes_0 = require(l_Parent_1.GameVotesRodux).UserGameVotes.UserGameVotes;
local v18 = {};
return function(v19) --[[ Line: 24 ]] --[[ Name: createMockStore ]]
    -- upvalues: v2 (copy), v18 (copy), v3 (copy), v4 (copy), v10 (copy), l_GamesProductInfoReducer_0 (copy), v12 (copy), l_FetchingStatus_0 (copy), v9 (copy), v11 (copy), l_GameDetailReducer_0 (copy), v8 (copy), l_NextDataExpirationTimeReducer_0 (copy), l_PlayabilityStatusReducer_0 (copy), v15 (copy), l_ShowAgeVerificationOverlay_0 (copy), l_UserGameVotes_0 (copy)
    local v20 = v2.joinDeep(v18, v19 or {});
    local v21 = v3.combineReducers({
        [v4.RoduxKey] = v10(), 
        [l_GamesProductInfoReducer_0.key] = l_GamesProductInfoReducer_0.reducer, 
        ContentSharing = v12.ContentSharingRodux.installReducer(), 
        FetchingStatus = l_FetchingStatus_0, 
        Inspect = v9, 
        ItemAssets = v11, 
        GameDetails = l_GameDetailReducer_0, 
        GameVotes = v8.GameVotes.GameVotes, 
        Games = v12.RoduxGames.installReducer(), 
        NetworkStatus = v12.RoduxNetworking.installReducer(), 
        Personalization = v3.combineReducers({
            [l_NextDataExpirationTimeReducer_0.key] = l_NextDataExpirationTimeReducer_0.reducer
        }), 
        PlayabilityStatus = l_PlayabilityStatusReducer_0, 
        ScreenSize = v15, 
        ShowAgeVerificationOverlay = l_ShowAgeVerificationOverlay_0, 
        UserGameVotes = l_UserGameVotes_0, 
        Users = v12.RoduxUsers.installReducer()
    });
    return v3.Store.new(v21, v20, {
        v3.thunkMiddleware
    });
end;