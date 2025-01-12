local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local _ = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Lumberyak).Logger.new(nil, "FriendsLanding");
local v5 = v4:new("FriendsLanding Networking");
local v6 = game:DefineFastInt("FriendsLandingHttpRetryCount", 3);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_TextService_0 = game:GetService("TextService");
local v11 = require(l_Parent_0.Otter);
local l_getFStringSocialAddFriendsPageLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialAddFriendsPageLayer;
local l_getFStringSocialFriendsLandingLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialFriendsLandingLayer;
local l_getFStringSocialFriendsLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialFriendsLayer;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local l_FFlagMigrateFriendsLandingHttpRequestToRequestInternal_0 = require(l_Parent_0.SharedFlags).FFlagMigrateFriendsLandingHttpRequestToRequestInternal;
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v19 = game:DefineFastFlag("EnableFriendsLandingChallengeInterceptor", false);
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local l_httpRequest_0 = v1.httpRequest;
local v27 = l_httpRequest_0.config({
    requestFunction = function(v22, v23, v24) --[[ Line: 34 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), l_FFlagMigrateFriendsLandingHttpRequestToRequestInternal_0 (copy), l_httpRequest_0 (copy)
        v5:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v23, v22));
        if l_FFlagMigrateFriendsLandingHttpRequestToRequestInternal_0 then
            return l_httpRequest_0.requestFunctions.RequestInternal(v22, v23, v24);
        else
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v22, v23, v24);
        end;
    end, 
    postRequestFunction = function(v25, v26) --[[ Line: 41 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v26.requestMethod, v26.url, v25.StatusCode, v25.Body));
    end, 
    maxRetryCount = v6
});
local v28 = v1.RoduxNetworking.config({
    keyPath = "FriendsLanding.NetworkStatus", 
    networkImpl = if v19 then l_ChallengeRequestWrapper_0(v27) else v27
});
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_RoduxUsers_0 = v1.RoduxUsers;
local v31 = require(l_Parent_0.ContactImporter);
local v32 = v1.SocialLibraries.config({});
return {
    Promise = require(l_Parent_0.Promise), 
    llama = v1.llama, 
    Roact = require(l_Parent_0.Roact), 
    Rodux = require(l_Parent_0.Rodux), 
    React = require(l_Parent_0.React), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactAppExperiment = require(l_Parent_0.RoactAppExperiment), 
    Logger = v4, 
    Text = require(l_Parent_0.AppCommonLib).Text, 
    t = require(l_Parent_0.t), 
    UIBlox = require(l_Parent_0.UIBlox), 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    memoize = require(l_Parent_0.AppCommonLib).memoize, 
    enumerate = require(l_Parent_0.enumerate), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    Url = require(l_Parent_0.Http).Url, 
    Lumberyak = require(l_Parent_0.Lumberyak), 
    FormFactor = require(l_Parent_0.FormFactor).Enums.FormFactor, 
    SocialLibraries = v32, 
    SocialLuaAnalytics = v2, 
    ProfileQRCode = require(l_Parent_0.ProfileQRCode), 
    SocialCommon = require(l_Parent_0.SocialCommon), 
    ReactFocusNavigation = require(l_Parent_0.ReactFocusNavigation), 
    FocusNavigationUtils = require(l_Parent_0.FocusNavigationUtils), 
    InputHandlers = require(l_Parent_0.InputHandlers), 
    UniversalAppPolicy = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy, 
    tutils = require(l_Parent_0.tutils), 
    AnalyticsService = require(l_Parent_0.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    RoduxNetworking = v28, 
    RoduxFriends = require(l_Parent_0.FriendsRodux).config({
        keyPath = "FriendsLanding.Friends"
    }), 
    Dash = require(l_Parent_0.Dash), 
    RoduxUsers = l_RoduxUsers_0.config({
        keyPath = "FriendsLanding.Users"
    }), 
    RoduxPresence = l_RoduxPresence_0.config({
        keyPath = "FriendsLanding.Presence"
    }), 
    RoduxGames = if l_FFlagAddFriendsSeparateReducers_0 then nil else v1.RoduxGames.config({
        keyPath = "FriendsLanding.Games"
    }), 
    RoduxUserPermissions = v1.RoduxUserPermissions.config({
        keyPath = "FriendsLanding.UserPermissions"
    }), 
    RoduxAnalytics = v2.Analytics.RoduxAnalytics.config({
        keyPath = "FriendsLanding.Analytics"
    }), 
    CoreGui = l_CoreGui_0, 
    Players = l_Players_0, 
    LocalizationService = l_LocalizationService_0, 
    TextService = l_TextService_0, 
    NetworkingFriendsEnums = require(l_Parent_0.FriendsNetworking).Enums, 
    FriendsNetworking = require(l_Parent_0.FriendsNetworking).config({
        roduxNetworking = v28
    }), 
    GamesNetworking = v1.NetworkingGames.config({
        roduxNetworking = v28
    }), 
    NetworkingUserSettings = v1.NetworkingUserSettings.config({
        roduxNetworking = v28
    }), 
    NetworkingAccountInformation = v1.NetworkingAccountInformation.config({
        roduxNetworking = v28
    }), 
    Otter = v11, 
    CollisionMatchers = v1.CollisionMatchers, 
    getFStringSocialAddFriendsPageLayer = l_getFStringSocialAddFriendsPageLayer_0, 
    getFStringSocialFriendsLandingLayer = l_getFStringSocialFriendsLandingLayer_0, 
    getFStringSocialFriendsLayer = l_getFStringSocialFriendsLayer_0, 
    GetFFlagEnableAppCommonInputHooks = l_GetFFlagEnableAppCommonInputHooks_0, 
    FFlagEnableUniversalFocusNavigation = l_FFlagEnableUniversalFocusNavigation_0, 
    FindFriendsModal = v31.FindFriendsModal, 
    ContactsList = v31.ContactsList, 
    CINavigator = v31.Navigator, 
    ContactsRevokedAccessDialog = v31.ContactsRevokedAccessDialog, 
    updateOptedInUsers = require(l_Parent_0.SocialModalsCommon).Utils.updateOptedInUsers, 
    fetchOSPermissionsForContacts = require(l_Parent_0.ContactImporter).Utils.fetchOSPermissionsForContacts, 
    PermissionsProtocol = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol, 
    AppStorageService = game:GetService("AppStorageService"), 
    ContactImporterConstants = require(l_Parent_0.ContactImporter).Constants, 
    ShowContactImporterParams = v31.ShowContactImporterParams, 
    FetchUserSettingsMetadata = require(l_Parent_0.DiscoverabilityModal).FetchUserSettingsMetadata, 
    DiscoverabilityOverlay = require(l_Parent_0.DiscoverabilityModal).DiscoverabilityOverlay, 
    DiscoverabilityAnalytics = require(l_Parent_0.DiscoverabilityModal).Analytics, 
    Hooks = {
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization
    }, 
    getRbxthumbWithTypeSizeAndOptions = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions, 
    UserLibConstants = require(l_Parent_0.UserLib).Utils.Constants, 
    useFocusGuiObject = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject, 
    AppHeaderBar = require(l_Parent_0.AppHeaderBar), 
    GetFFlagFixConnectTabSearchBarHeight = require(l_Parent_0.SharedFlags).GetFFlagFixConnectTabSearchBarHeight, 
    GetFFlagLuaAppEnableFoundationColors = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors
};