local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_FFlagAddFriendsSeparateReducers_0 = require(l_script_FirstAncestor_0.SharedFlags).FFlagAddFriendsSeparateReducers;
return {
    EntryPoint = require(script.Components.FriendsLandingEntryPoint), 
    FriendsLandingAnalytics = require(script.FriendsLandingAnalytics), 
    getEntryPointWithParentContext = require(script.Components.FriendsLandingEntryPoint.getFriendsLandingEntryPointWithParentContext), 
    EnumScreens = require(script.EnumScreens), 
    installReducer = require(script.installReducer), 
    installAddFriendsReducer = if l_FFlagAddFriendsSeparateReducers_0 then require(script.AddFriends.Redux.installReducer) else nil, 
    Components = require(script.Components), 
    ["jest.config"] = script["jest.config"]
};