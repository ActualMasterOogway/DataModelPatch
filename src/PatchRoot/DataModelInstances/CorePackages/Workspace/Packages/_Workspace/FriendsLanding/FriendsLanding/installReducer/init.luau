local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_RoduxGames_0 = v1.RoduxGames;
local l_RoduxUserPermissions_0 = v1.RoduxUserPermissions;
local l_RoduxAnalytics_0 = v1.RoduxAnalytics;
local v9 = require(l_AddFriends_0.Redux.contactImporterWarning);
local l_ShowContactImporterParams_0 = v1.ShowContactImporterParams;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
return function() --[[ Line: 16 ]]
    -- upvalues: l_Rodux_0 (copy), l_RoduxUserPermissions_0 (copy), l_RoduxNetworking_0 (copy), l_RoduxAnalytics_0 (copy), l_FFlagAddFriendsSeparateReducers_0 (copy), l_AddFriends_0 (copy), l_ShowContactImporterParams_0 (copy), v9 (copy), l_RoduxGames_0 (copy)
    return l_Rodux_0.combineReducers({
        DeletedUsers = require(script.DeletedUsers), 
        VerifiedUsers = require(script.VerifiedUsers), 
        InactiveFriends = require(script.InactiveFriends), 
        Users = require(script.Users), 
        Friends = require(script.Friends)(), 
        Presence = require(script.Presence), 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        Analytics = l_RoduxAnalytics_0.installReducer(), 
        IsUserFollowing = if l_FFlagAddFriendsSeparateReducers_0 then nil else require(l_AddFriends_0.Redux.IsUserFollowing), 
        ShowContactImporterParams = if l_FFlagAddFriendsSeparateReducers_0 then nil else l_ShowContactImporterParams_0, 
        ContactImporterWarning = if l_FFlagAddFriendsSeparateReducers_0 then nil else v9, 
        RequestsFromOriginSourceType = if l_FFlagAddFriendsSeparateReducers_0 then nil else require(l_AddFriends_0.Redux.RequestsFromOriginSourceType), 
        Games = if l_FFlagAddFriendsSeparateReducers_0 then nil else l_RoduxGames_0.installReducer()
    });
end;