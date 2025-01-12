local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
return {
    Loading = "Loading", 
    Playable = "Playable", 
    PaidAccess = "PaidAccess", 
    Private = "Private", 
    UnplayableOther = "UnplayableOther", 
    PlayableWithParty = "PlayableWithParty", 
    WaitingForParty = "WaitingForParty", 
    ActionNeeded = l_FFlagLuaAppPlayButtonUpdates_0 and "ActionNeeded" or nil, 
    FiatPaidAccess = l_FFlagLuaAppFiatPaidAccess_0 and "FiatPaidAccess" or nil
};