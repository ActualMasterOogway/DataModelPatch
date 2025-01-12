local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local v4 = v3.Logger.new(nil, "SocialTab");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = require(l_Parent_1.SharedFlags).GetFFlagHideConnectPageWebViewItemsForVR;
local v7 = require(l_Parent_1.StreamNotifications);
local v8 = game:DefineFastInt("SocialTabHttpRetryCount", 3);
local l_httpRequest_0 = v2.httpRequest;
local v10 = v4:new("SocialTab Networking");
local v16 = l_httpRequest_0.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 20 ]] --[[ Name: requestFunction ]]
        -- upvalues: v10 (copy), l_httpRequest_0 (copy)
        v10:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v12, v11));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v11, v12, v13);
    end, 
    postRequestFunction = function(v14, v15) --[[ Line: 24 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v10 (copy)
        v10:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v15.requestMethod, v15.url, v14.StatusCode, v14.Body));
    end, 
    maxRetryCount = v8
});
local v17 = require(l_Parent_0.Flags.getFFlagSocialTabReplaceRefreshConversations);
local v18 = v2.RoduxNetworking.config({
    keyPath = "SocialTab.NetworkStatus", 
    networkImpl = v16
});
local l_validatePropsWithForwardRef_0 = require(l_Parent_1.RoactUtils).validatePropsWithForwardRef;
local l_RoduxPresence_0 = v2.RoduxPresence;
local v21 = require(l_Parent_1.FriendsRodux);
local l_RoduxGames_0 = v2.RoduxGames;
local l_RoduxUsers_0 = v2.RoduxUsers;
local l_NetworkingGames_0 = v2.NetworkingGames;
return {
    LocalizationService = l_LocalizationService_0, 
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    FitFrame = require(l_Parent_1.FitFrame), 
    Otter = require(l_Parent_1.Otter), 
    Roact = require(l_Parent_1.Roact), 
    React = require(l_Parent_1.React), 
    Rodux = require(l_Parent_1.Rodux), 
    Cryo = require(l_Parent_1.Cryo), 
    RetrievalStatus = require(l_Parent_1.Http).Enum.RetrievalStatus, 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    RoactAppExperiment = require(l_Parent_1.RoactAppExperiment), 
    ConnectTabChatTileRecolorExperimentation = require(l_Parent_1.SocialCommon).Experiments.ConnectTabChatTileRecolorExperimentation.default, 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    ExternalEventConnection = require(l_Parent_1.RoactUtils).ExternalEventConnection, 
    Logger = v4, 
    t = require(l_Parent_1.t), 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    UIBlox = require(l_Parent_1.UIBlox), 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
    useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
    useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    PromiseUtilities = require(l_Parent_1.AppCommonLib).Utils.PromiseUtilities, 
    enumerate = require(l_Parent_1.enumerate), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Url = require(l_Parent_1.Http).Url, 
    VerifiedBadges = require(l_Parent_1.VerifiedBadges), 
    DiscoverabilityModal = require(l_Parent_1.DiscoverabilityModal), 
    ShowContactImporterParams = require(l_Parent_1.ContactImporter).ShowContactImporterParams, 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    UiModeStyleProvider = require(l_Parent_1.Style).UiModeStyleProvider, 
    Mock = v2.Mock, 
    tutils = require(l_Parent_1.tutils), 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    NetworkingPresence = v2.NetworkingPresence.config({
        roduxNetworking = v18
    }), 
    NetworkingFriends = require(l_Parent_1.FriendsNetworking).config({
        roduxNetworking = v18
    }), 
    NetworkingUsers = v2.NetworkingUsers.config({
        roduxNetworking = v18
    }), 
    NetworkingGames = l_NetworkingGames_0.config({
        roduxNetworking = v18
    }) or nil, 
    Players = game:GetService("Players"), 
    RoduxNetworking = v18, 
    RoduxUsers = l_RoduxUsers_0.config({
        keyPath = "SocialTab.Users"
    }), 
    RoduxFriends = v21.config({
        keyPath = "SocialTab.Friends"
    }), 
    RoduxPresence = l_RoduxPresence_0.config({
        keyPath = "SocialTab.Presence"
    }), 
    RoduxGames = l_RoduxGames_0.config({
        keyPath = "SocialTab.Games"
    }), 
    NetworkingChat = v17() and v2.NetworkingChat.config({
        roduxNetworking = v18
    }) or nil, 
    CollisionMatchers = v2.CollisionMatchers, 
    Lumberyak = v3, 
    RunService = game:GetService("RunService"), 
    validatePropsWithForwardRef = l_validatePropsWithForwardRef_0, 
    SocialLibraries = v2.SocialLibraries.config({}), 
    GetFFlagHideConnectPageWebViewItemsForVR = l_GetFFlagHideConnectPageWebViewItemsForVR_0, 
    GetFFlagConnectTabChatTileRecolorEnabled = require(l_Parent_1.SharedFlags).GetFFlagConnectTabChatTileRecolorEnabled, 
    SelfViewProfileDiscoverabilityUpsellIXP = require(l_Parent_1.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP, 
    UserLib = require(l_Parent_1.UserLib), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_1.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    AppChat = require(l_Parent_1.AppChat), 
    StreamNotifications = v7, 
    AppPage = require(l_Parent_1.RobloxAppEnums).AppPage
};