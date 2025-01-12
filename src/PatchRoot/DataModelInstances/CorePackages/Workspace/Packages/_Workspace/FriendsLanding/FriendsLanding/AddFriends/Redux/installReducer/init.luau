local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_Parent_0.ContactImporter);
local v4 = require(l_Parent_0.Rodux);
return function() --[[ Line: 8 ]]
    -- upvalues: v4 (copy), l_AddFriends_0 (copy), v3 (copy)
    return v4.combineReducers({
        NetworkStatus = require(l_AddFriends_0.Networking.myRoduxNetworking).installReducer(), 
        Games = require(script.Parent.RoduxGames).installReducer(), 
        Friends = require(script.Parent.RoduxFriends).installReducer(), 
        Users = require(script.Parent.RoduxUsers).installReducer(), 
        Analytics = require(script.Parent.RoduxAnalytics).installReducer(), 
        Presence = require(script.Parent.RoduxPresence).installReducer(), 
        ShowContactImporterParams = v3.ShowContactImporterParams, 
        RequestsFromOriginSourceType = require(script.Parent.RequestsFromOriginSourceType), 
        ContactImporterWarning = require(script.Parent.contactImporterWarning), 
        IsUserFollowing = require(script.Parent.IsUserFollowing)
    });
end;