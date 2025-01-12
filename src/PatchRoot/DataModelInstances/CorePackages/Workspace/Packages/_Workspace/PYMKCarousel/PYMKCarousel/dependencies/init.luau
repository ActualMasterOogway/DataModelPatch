local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.SocialLuaAnalytics);
local v4 = require(l_Parent_0.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v6 = game:DefineFastFlag("MigratePymkCarouselHttpRequestToRequestInternal", false);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v8 = game:DefineFastFlag("EnablePymkCarouselChallengeInterceptor", false);
local v9 = v4.Logger.new(nil, "PYMKCarousel"):new("PYMKCarousel Networking");
local v10 = game:DefineFastInt("PYMKCarouselHttpRetryCount", 3);
local v16 = l_httpRequest_0.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 19 ]] --[[ Name: requestFunction ]]
        -- upvalues: v9 (copy), v6 (copy), l_httpRequest_0 (copy)
        v9:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v12, v11));
        if v6 then
            return l_httpRequest_0.requestFunctions.RequestInternal(v11, v12, v13);
        else
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v11, v12, v13);
        end;
    end, 
    postRequestFunction = function(v14, v15) --[[ Line: 26 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v9 (copy)
        v9:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v15.requestMethod, v15.url, v14.StatusCode, v14.Body));
    end, 
    maxRetryCount = v10
});
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v18 = v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = if v8 then l_ChallengeRequestWrapper_0(v16) else v16
});
return {
    SocialLuaAnalytics = v3, 
    UIBlox = require(l_Parent_0.UIBlox), 
    Roact = require(l_Parent_0.Roact), 
    React = require(l_Parent_0.React), 
    Rodux = require(l_Parent_0.Rodux), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Result = require(l_Parent_0.Result), 
    llama = v2.llama, 
    Dash = require(l_Parent_0.Dash), 
    RoduxNetworking = v18, 
    RoduxFriends = require(l_Parent_0.FriendsRodux).config({
        keyPath = l_RODUX_KEY_0 .. ".Friends"
    }), 
    RoduxUsers = v2.RoduxUsers.config({
        keyPath = l_RODUX_KEY_0 .. ".Users"
    }), 
    NetworkingFriendsEnums = require(l_Parent_0.FriendsNetworking).Enums, 
    NetworkingFriends = require(l_Parent_0.FriendsNetworking).config({
        roduxNetworking = v18
    }), 
    RoduxAnalytics = v3.Analytics.RoduxAnalytics.config({
        keyPath = l_RODUX_KEY_0 .. ".Analytics"
    }), 
    Players = game:GetService("Players"), 
    convertActions = require(l_Parent_0.SocialReducerAdaptors).convertActions, 
    usersActionAdaptor = require(l_Parent_0.SocialReducerAdaptors).usersActionAdaptor, 
    friendsActionAdaptor = require(l_Parent_0.SocialReducerAdaptors).friendsActionAdaptor, 
    SocialCommon = require(l_Parent_0.SocialCommon), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    Hooks = {
        useSelector = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray
    }, 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    enumerate = require(l_Parent_0.enumerate), 
    getFFlagPYMKAddFriendsEntry = require(l_Parent_0.SharedFlags).getFFlagPYMKAddFriendsEntry
};