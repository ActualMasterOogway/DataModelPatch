local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.TextKeys);
local v3 = require(l_Parent_0.Utils.contactImporterModalInfoUpdater);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v6 = require(l_Parent_0.Common.Constants);
local v7 = require(l_Parent_0.Analytics);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
local v13 = require(script.Parent.ContactsImporterOverlay);
local v14 = require(script.Parent.mapDispatchToProps);
local l_Selectors_0 = v1.RoduxContacts.Selectors;
local l_AppStorageService_0 = v1.AppStorageService;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.ContactsList.Components.ContactImporterContext);
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = v1.getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 = v1.FFlagContactImporterPhoneAndContactsAfterSignupFixes;
local v22 = game:DefineFastFlag("ContactImporterFixRedirectsFromSocialOnboardingBtns", false);
local v23 = l_Roact_0.PureComponent:extend("ContactsImporterOverlayContainer");
v23.defaultProps = {
    checkOrRequestPermissions = function(v24) --[[ Line: 50 ]] --[[ Name: checkOrRequestPermissions ]]
        -- upvalues: l_PermissionsProtocol_0 (copy)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v24);
    end, 
    localUserId = "", 
    handleShowToastForTests = nil
};
v23.init = function(v25) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_PermissionsProtocol_0 (copy), v2 (copy), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (copy), l_EnumScreens_0 (copy), l_Promise_0 (copy), v7 (copy), l_DiscoverabilityAnalytics_0 (copy), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (copy)
    local v26 = v25.props.navigation.getParam(v6.OPEN_AMP_UPSELL);
    v25.checkOrRequestContactsPermissions = function() --[[ Line: 60 ]]
        -- upvalues: v25 (copy), l_PermissionsProtocol_0 (ref)
        return v25.props.checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    v25.failedToUpload = function(_) --[[ Line: 67 ]]
        -- upvalues: v25 (copy), v6 (ref), v2 (ref)
        v25.props.navigation.getParam(v6.SHOW_TOAST)(v2.CI_FAILED);
    end;
    v25.closeModal = function() --[[ Line: 74 ]]
        -- upvalues: v25 (copy)
        v25.props.navigation.pop();
    end;
    v25.permissionsFlowToContactImporter = function() --[[ Line: 78 ]]
        -- upvalues: v25 (copy), v6 (ref), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (ref), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (ref), l_EnumScreens_0 (ref), v26 (copy), l_Promise_0 (ref)
        local l_props_0 = v25.props;
        local l_navigation_0 = l_props_0.navigation;
        local v30 = l_navigation_0.getParam(v6.IS_FROM_SIGNUP);
        local v31 = if l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then l_props_0.handleShowToastForTests or l_navigation_0.getParam(v6.SHOW_TOAST) else nil;
        v25.checkOrRequestContactsPermissions():andThen(function(v32) --[[ Line: 87 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), l_props_0 (copy), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (ref), v30 (copy), l_navigation_0 (copy), l_EnumScreens_0 (ref), v6 (ref), v31 (copy), v26 (ref), l_Promise_0 (ref), v25 (ref)
            if v32 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, l_props_0.localUserId);
                if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 and v30 then
                    l_props_0.updateUserSettings();
                    l_props_0.navigation.pop();
                else
                    l_props_0.hideContactImporterModal();
                    l_navigation_0.navigate(l_EnumScreens_0.ContactsList, {
                        [v6.SHOULD_UPDATE_USER_SETTINGS] = true, 
                        [v6.IS_PHONE_VERIFIED] = l_navigation_0.getParam(v6.IS_PHONE_VERIFIED), 
                        [v6.OPEN_LEARN_MORE_LINK] = l_navigation_0.getParam(v6.OPEN_LEARN_MORE_LINK), 
                        [v6.SHOW_TOAST] = v31, 
                        openAmpUpsell = v26
                    });
                end;
                return l_Promise_0.resolve();
            elseif v32 == l_PermissionsProtocol_0.Status.DENIED then
                l_navigation_0.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                    screenSize = l_props_0.screenSize, 
                    closeModal = v25.closeModal
                });
                return l_Promise_0.resolve();
            else
                return l_Promise_0.reject();
            end;
        end):catch(v25.failedToUpload);
    end;
    v25.checkDiscoverability = function(v33) --[[ Line: 118 ]]
        -- upvalues: v25 (copy), v6 (ref)
        local v34 = v25.props.navigation.getParam(v6.IS_PHONE_VERIFIED);
        return v33 and v34;
    end;
    v25.onConnectContacts = function() --[[ Line: 124 ]]
        -- upvalues: v25 (copy), v7 (ref)
        local l_props_1 = v25.props;
        local v36 = l_props_1.navigation.getParam("isDiscoverabilityUnset");
        l_props_1.fireAnalyticsEvent(v7.EventNames.ContactImportModalContinue);
        if v25.checkDiscoverability(v36) then
            v25.navigateToDiscoverabilityModal();
            return;
        else
            v25.permissionsFlowToContactImporter();
            return;
        end;
    end;
    v25.navigateToDiscoverabilityModal = function() --[[ Line: 136 ]]
        -- upvalues: v25 (copy), v6 (ref), l_EnumScreens_0 (ref), l_DiscoverabilityAnalytics_0 (ref), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (ref)
        local l_props_2 = v25.props;
        local l_navigation_1 = l_props_2.navigation;
        local v39 = l_navigation_1.getParam(v6.SHOW_TOAST);
        local v40 = l_navigation_1.getParam(v6.OPEN_LEARN_MORE_LINK);
        local v41 = l_navigation_1.getParam(v6.IS_FROM_ADD_FRIENDS_PAGE, false);
        local l_eventIngestService_0 = l_props_2.eventIngestService;
        local l_diagService_0 = l_props_2.diagService;
        l_props_2.getUserSettingsMetadata():andThen(function() --[[ Line: 145 ]]
            -- upvalues: l_navigation_1 (copy), l_EnumScreens_0 (ref), v39 (copy), v40 (copy), v41 (copy), l_DiscoverabilityAnalytics_0 (ref), v6 (ref), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (ref), l_diagService_0 (copy), l_eventIngestService_0 (copy)
            l_navigation_1.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                showToast = v39, 
                openLearnMoreLink = v40, 
                entryPoint = if v41 then l_DiscoverabilityAnalytics_0.EntryPoints.AddFriends else l_DiscoverabilityAnalytics_0.EntryPoints.HomePage, 
                [v6.DIAG_SERVICE] = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then l_diagService_0 else nil, 
                [v6.EVENT_INGEST_SERVICE] = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then l_eventIngestService_0 else nil
            });
        end);
    end;
    v25.onAddFriendsActivated = function() --[[ Line: 162 ]]
        -- upvalues: v25 (copy), v7 (ref), l_EnumScreens_0 (ref)
        local l_props_3 = v25.props;
        l_props_3.fireAnalyticsEvent(v7.EventNames.ContactImportModalAddFriends);
        l_props_3.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v25.onCloseClicked = function() --[[ Line: 169 ]]
        -- upvalues: v25 (copy), v7 (ref)
        local l_props_4 = v25.props;
        l_props_4.fireAnalyticsEvent(v7.EventNames.ContactImportModalClose);
        l_props_4.navigation.pop();
    end;
    v25.onLearnMoreClick = function() --[[ Line: 176 ]]
        -- upvalues: v25 (copy), v6 (ref)
        v25.props.navigation.getParam(v6.OPEN_LEARN_MORE_LINK)();
    end;
end;
v23.didMount = function(v46) --[[ Line: 183 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v3 (copy), l_AppStorageService_0 (copy)
    v46.props.fireAnalyticsEvent(v7.EventNames.ContactImportModalPageLoad);
    v3:addSeenCount(l_AppStorageService_0, v46.props.localUserId);
    v3:updateTimestamp(l_AppStorageService_0, v46.props.localUserId, DateTime.now().UnixTimestampMillis);
end;
v23.render = function(v47) --[[ Line: 196 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_Roact_0 (copy), v13 (copy), v22 (copy), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (copy)
    local l_props_5 = v47.props;
    local l_navigation_2 = l_props_5.navigation;
    local v50 = l_navigation_2.getParam(v6.IS_FROM_ADD_FRIENDS_PAGE, false);
    local v51 = v47.props.navigation.getParam(v6.IS_FROM_SIGNUP);
    local v52 = l_navigation_2.getParam(v6.IS_FROM_SOCIAL_ONBOARDING_BUTTONS);
    return l_Roact_0.createElement(v13, {
        screenSize = l_props_5.screenSize, 
        onCloseClicked = v47.onCloseClicked, 
        onAddFriendsActivated = v47.onAddFriendsActivated, 
        onConnectContacts = v47.onConnectContacts, 
        onLearnMoreClick = v47.onLearnMoreClick, 
        isFromAddFriendsPage = v50, 
        isFromSignup = v22 and v52 and true or if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then v51 else nil
    });
end;
return l_compose_0(v7.connect(function(v53) --[[ Line: 218 ]]
    return {
        fireAnalyticsEvent = v53.fireAnalyticsEvent, 
        diagService = v53.diagService, 
        eventIngestService = v53.eventIngestService
    };
end), l_RoactRodux_0.connect(function(v54) --[[ Line: 225 ]]
    -- upvalues: l_Selectors_0 (copy)
    return {
        contacts = l_Selectors_0.sortContacts(v54), 
        localUserId = v54.LocalUserId, 
        screenSize = v54.ScreenSize
    };
end, v14))(v23);