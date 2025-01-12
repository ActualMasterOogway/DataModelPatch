local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableCFM);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagSupportGameCardForInExpPlatChat);
local v4 = require(l_Parent_0.GameDetailRodux);
local v5 = require(l_Parent_0.Http);
local v6 = require(l_Parent_0.PlayabilityRodux);
local v7 = require(l_Parent_0.Rodux);
local v8 = require(l_Parent_0.SquadsCore);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v10 = require(l_Parent_0.UserLib);
local l_GameDetailReducer_0 = v4.GameDetails.GameDetailReducer;
local l_FetchingStatus_0 = v5.Reducers.FetchingStatus;
local l_UserReducer_0 = v10.Reducers.UserReducer;
local l_LocalUserIdReducer_0 = v10.Reducers.LocalUserIdReducer;
local l_PlayabilityStatusReducer_0 = v6.PlayabilityStatus.PlayabilityStatusReducer;
local v16 = require(l_script_FirstAncestor_0.installReducer);
local l_FriendCount_0 = require(l_Parent_0.LegacyFriendsRodux).Reducers.FriendCount;
local v18 = require(l_Parent_0.PlayerContextualMenu);
local l_SquadLocation_0 = v8.Enums.SquadLocation;
return (v7.combineReducers({
    PlayerContextualMenu = v18.installReducer(), 
    EventReceievers = if v2() then v7.combineReducers({
        NetworkStatus = require(l_script_FirstAncestor_0.Http.RoduxNetworking).installReducer()
    }) else nil, 
    ChatAppReducer = v16(), 
    FetchingStatus = if v3() then l_FetchingStatus_0 else nil, 
    GameDetails = if v3() then l_GameDetailReducer_0 else nil, 
    LocalUserId = l_LocalUserIdReducer_0, 
    FriendCount = l_FriendCount_0, 
    PlayabilityStatus = if v3() then l_PlayabilityStatusReducer_0 else nil, 
    Users = l_UserReducer_0, 
    [v8.RoduxKey] = if l_GetFFlagLuaAppEnableSquadPage_0() then v8.installReducer(l_SquadLocation_0.InExperience) else nil
}));