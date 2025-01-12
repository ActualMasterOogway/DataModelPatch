local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v5 = require(l_Parent_1.VirtualizedList);
local v6 = require(l_Parent_1.UrlBuilder);
local v7 = require(l_Parent_1.SocialLuaAnalytics);
local v8 = v3.Logger.new(nil, "ContactImporter"):new("ContactImporter Networking");
local v9 = game:DefineFastInt("ContactImporterHttpRetryCount", 3);
local v15 = l_httpRequest_0.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 16 ]] --[[ Name: requestFunction ]]
        -- upvalues: v8 (copy), l_httpRequest_0 (copy)
        v8:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v11, v10));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v10, v11, v12);
    end, 
    postRequestFunction = function(v13, v14) --[[ Line: 20 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v8 (copy)
        v8:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v14.requestMethod, v14.url, v13.StatusCode, v13.Body));
    end, 
    maxRetryCount = v9
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v17 = v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v15
});
local v18 = require(l_Parent_1.ContactsRodux).config({
    keyPath = l_RODUX_KEY_0 .. ".Contacts"
});
local v19 = require(l_Parent_1.RoactAppExperiment);
local v20 = require(l_Parent_1.UIBlox);
return {
    SocialLuaAnalytics = v7, 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = v20, 
    Roact = require(l_Parent_1.Roact), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    Rodux = require(l_Parent_1.Rodux), 
    ReactRoblox = require(l_Parent_1.ReactRoblox), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    Url = require(l_Parent_1.Http).Url, 
    t = require(l_Parent_1.t), 
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    RoduxNetworking = v17, 
    enumerate = require(l_Parent_1.enumerate), 
    IXPService = game:GetService("IXPService"), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    NetworkingContacts = v2.NetworkingContacts.config({
        roduxNetworking = v17
    }), 
    NetworkingFriends = require(l_Parent_1.FriendsNetworking).config({
        roduxNetworking = v17
    }), 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v17
    }), 
    NetworkingAccountInformation = v2.NetworkingAccountInformation.config({
        roduxNetworking = v17
    }), 
    NetworkingAccountSettings = v2.NetworkingAccountSettings.config({
        roduxNetworking = v17
    }), 
    NetworkingShareLinks = v2.NetworkingShareLinks.config({
        roduxNetworking = v17
    }), 
    UrlBuilder = v6.UrlBuilder, 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    SMSProtocol = require(l_Parent_1.SMSProtocol).SMSProtocol, 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    RoduxContacts = v18, 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    RoduxShareLinks = v2.RoduxShareLinks.config({
        keyPath = l_RODUX_KEY_0 .. ".ShareLinks"
    }), 
    AppStorageService = game:GetService("AppStorageService"), 
    UserInputService = game:GetService("UserInputService"), 
    ThrottleUserId = require(l_Parent_1.AppCommonLib).ThrottleUserId, 
    getFStringSocialFriendsLayer = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer, 
    Players = game:GetService("Players"), 
    React = require(l_Parent_1.React), 
    FlatList = v5.FlatList, 
    SectionList = v5.SectionList, 
    useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
    useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
    usePrevious = require(l_Parent_1.RoactUtils).Hooks.usePrevious, 
    useNavigation = require(l_Parent_1.Navigation).useNavigation, 
    useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
    useStyle = v20.Core.Style.useStyle, 
    useUserExperiment = v19.useUserExperiment, 
    useEffectOnce = require(l_Parent_1.RoactUtils).Hooks.useEffectOnce, 
    DiscoverabilityOverlay = require(l_Parent_1.DiscoverabilityModal).DiscoverabilityOverlay, 
    DiscoverabilityAnalytics = require(l_Parent_1.DiscoverabilityModal).Analytics, 
    RoactExperimentProvider = v19.Provider, 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    SelfViewProfileDiscoverabilityUpsellIXP = require(l_Parent_1.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP, 
    AmpUpsell = require(l_Parent_1.AmpUpsell), 
    getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled = require(l_Parent_1.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled, 
    FFlagContactImporterPhoneAndContactsAfterSignupFixes = require(l_Parent_1.SharedFlags).FFlagContactImporterPhoneAndContactsAfterSignupFixes
};