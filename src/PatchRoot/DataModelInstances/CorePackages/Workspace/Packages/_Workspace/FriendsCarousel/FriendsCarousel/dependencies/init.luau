local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v4.httpRequest;
local v6 = require(l_Parent_1.Style);
local v7 = require(l_Parent_1.Loggers).Logger:new("FriendsCarousel");
local v8 = v7:new("FriendsCarousel Networking");
local v9 = game:DefineFastInt("FriendsCarouselHttpRetryCount", 3);
local l_getFFlagMigrateSocialNetworking_0 = require(l_Parent_1.SharedFlags).getFFlagMigrateSocialNetworking;
local v16 = l_httpRequest_0.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 21 ]] --[[ Name: requestFunction ]]
        -- upvalues: v8 (copy), l_getFFlagMigrateSocialNetworking_0 (copy), l_httpRequest_0 (copy)
        v8:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v12, v11));
        if l_getFFlagMigrateSocialNetworking_0() then
            return l_httpRequest_0.requestFunctions.RequestInternal(v11, v12, v13);
        else
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v11, v12, v13);
        end;
    end, 
    postRequestFunction = function(v14, v15) --[[ Line: 29 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v8 (copy)
        v8:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", v15.requestMethod, v15.url, v14.StatusCode));
    end, 
    maxRetryCount = v9
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v18 = v4.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v16
});
local v19 = require(l_Parent_1.UIBlox);
local v20 = require(l_Parent_1.RobloxAppHooks);
return {
    logger = v7, 
    SocialLuaAnalytics = v3, 
    Promise = require(l_Parent_1.Promise), 
    UIBlox = v19, 
    Roact = require(l_Parent_1.Roact), 
    React = require(l_Parent_1.React), 
    Rodux = require(l_Parent_1.Rodux), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    UserProfiles = require(l_Parent_1.UserProfiles), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    t = require(l_Parent_1.t), 
    Dash = require(l_Parent_1.Dash), 
    llama = v4.llama, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    Hooks = {
        useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
        useEffectOnce = require(l_Parent_1.RoactUtils).Hooks.useEffectOnce, 
        useUiModeInfo = v20.useUiModeInfo, 
        useDesignTokens = v6.useDesignTokens
    }, 
    SocialLibraries = v4.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    Style = v6, 
    RoduxNetworking = v18, 
    NetworkingFriendsEnums = require(l_Parent_1.FriendsNetworking).Enums, 
    NetworkingFriends = require(l_Parent_1.FriendsNetworking).config({
        roduxNetworking = v18
    }), 
    NetworkingUsers = v4.NetworkingUsers.config({
        roduxNetworking = v18
    }), 
    NetworkingUserSettings = v4.NetworkingUserSettings.config({
        roduxNetworking = v18
    }), 
    NetworkingAccountInformation = v4.NetworkingAccountInformation.config({
        roduxNetworking = v18
    }), 
    NetworkingAliases = v4.NetworkingAliases.config({
        roduxNetworking = v18
    }), 
    RoduxUsers = v4.RoduxUsers.config({
        keyPath = l_RODUX_KEY_0 .. ".Users"
    }), 
    RoduxFriends = require(l_Parent_1.FriendsRodux).config({
        keyPath = l_RODUX_KEY_0 .. ".Friends"
    }), 
    RoduxPresence = v4.RoduxPresence.config({
        keyPath = l_RODUX_KEY_0 .. ".Presence"
    }), 
    RoduxUserPermissions = v4.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    RoduxAnalytics = v3.Analytics.RoduxAnalytics.config({
        keyPath = l_RODUX_KEY_0 .. ".Analytics"
    }), 
    Players = l_Players_0, 
    convertActions = require(l_Parent_1.SocialReducerAdaptors).convertActions, 
    usersActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).usersActionAdaptor, 
    friendsActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).friendsActionAdaptor, 
    presenceActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).presenceActionAdaptor, 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    enumerate = require(l_Parent_1.enumerate), 
    IXPService = game:GetService("IXPService"), 
    RetrievalStatus = require(l_Parent_1.Http).Enum.RetrievalStatus, 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    AppStorageService = game:GetService("AppStorageService"), 
    contactImporterModalInfo = require(l_Parent_1.ContactImporter).Utils.contactImporterModalInfo, 
    ShowContactImporterParams = require(l_Parent_1.ContactImporter).ShowContactImporterParams, 
    SetContactImporterDisplayLogic = require(l_Parent_1.ContactImporter).Actions.SetContactImporterDisplayLogic, 
    AutoSyncContacts = require(l_Parent_1.ContactImporter).Networking.AutoSyncContacts, 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    FetchContactImporterParams = require(l_Parent_1.ContactImporter).Networking.FetchContactImporterParams, 
    getFStringSocialFriendsLayer = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer, 
    isSubjectToDesktopPolicies = require(l_Parent_1.SharedFlags).isSubjectToDesktopPolicies, 
    isSubjectTo10ftPolicies = require(l_Parent_0.isSubjectTo10ftPolicies), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_1.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    RobloxAppEnums = require(l_Parent_1.RobloxAppEnums), 
    FFlagLuaAppFixCursorHooks = require(l_Parent_1.SharedFlags).FFlagLuaAppFixCursorHooks
};