local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Common.Constants);
local l_Analytics_0 = l_Parent_0.Analytics;
local v6 = require(l_Analytics_0.useAnalytics);
local v7 = require(l_Analytics_0.Enums.EventNames);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local l_UpdateIsDiscoverabilityUnset_0 = v1.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_Dash_0 = v1.Dash;
local l_AppStorageService_0 = v1.AppStorageService;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_React_0 = v1.React;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local v20 = require(l_Parent_0.Flags.SelfViewProfileDiscoverabilityUpsellIXP);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v22 = require(script.Parent.DiscoverabilityOverlay);
local v24 = {
    checkOrRequestPermissions = function(v23) --[[ Line: 62 ]] --[[ Name: checkOrRequestPermissions ]]
        -- upvalues: l_PermissionsProtocol_0 (copy)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v23);
    end
};
return function(v25) --[[ Line: 68 ]]
    -- upvalues: l_Dash_0 (copy), v24 (copy), l_getDeepValue_0 (copy), v20 (copy), v4 (copy), l_useDispatch_0 (copy), v6 (copy), l_useSelector_0 (copy), l_React_0 (copy), v7 (copy), v3 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_UpdateIsDiscoverabilityUnset_0 (copy), l_NetworkingUserSettings_0 (copy), l_EnumScreens_0 (copy), l_PermissionsProtocol_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_Promise_0 (copy), v22 (copy)
    local v26 = l_Dash_0.join(v24, v25 or {});
    local function _(v27) --[[ Line: 70 ]]
        -- upvalues: v26 (copy), l_getDeepValue_0 (ref)
        if v26.navigation then
            return v26.navigation.getParam(v27);
        else
            return l_getDeepValue_0(v26, v27);
        end;
    end;
    local v29;
    if v20.SetupEnabled() then
        local l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 = v4.IS_STANDALONE_DISCOVERABILITY_MODAL;
        v29 = if v26.navigation then v26.navigation.getParam(l_IS_STANDALONE_DISCOVERABILITY_MODAL_0) else l_getDeepValue_0(v26, l_IS_STANDALONE_DISCOVERABILITY_MODAL_0);
    else
        v29 = v26.navigation.getParam(v4.IS_STANDALONE_DISCOVERABILITY_MODAL);
    end;
    local v31 = l_useDispatch_0();
    local v32 = v6();
    local v34 = l_useSelector_0(function(v33) --[[ Line: 82 ]]
        return v33.ScreenSize;
    end);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 85 ]]
        return v35.LocalUserId;
    end);
    local v37 = l_React_0.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v26 (copy)
        if v26.navigation then
            v26.navigation.pop();
            return;
        else
            if v26.onClose then
                v26.onClose();
            end;
            return;
        end;
    end, {
        v26
    });
    local v39 = l_useSelector_0(function(v38) --[[ Line: 97 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v38, "DiscoverabilityModal.UserPermissions.userSettingsMetadata");
    end);
    l_React_0.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v39 (copy), v4 (ref), v32 (copy), v7 (ref)
        local v40 = nil;
        v40 = if v39.prefillDiscoverabilitySetting then v4.NON_GDPR_VERSION_CHECKBOX else v4.GDPR_VERSION;
        v32.fireAnalyticsEvent(v7.DiscoverabilityModalLoad, {
            version = v40, 
            wordingVersion = v4.WORDING_VERSION_1
        });
    end, {});
    local function v42(v41) --[[ Line: 115 ]]
        -- upvalues: v32 (copy), v7 (ref), v20 (ref), v37 (copy), v26 (copy)
        v32.fireAnalyticsEvent(v7.DiscoverabilityModalClose, {
            selected = v41
        });
        if v20.SetupEnabled() then
            v37();
            return;
        else
            v26.navigation.pop();
            return;
        end;
    end;
    local function v45() --[[ Line: 126 ]]
        -- upvalues: v20 (ref), v4 (ref), v26 (copy), l_getDeepValue_0 (ref)
        local v43;
        if v20.SetupEnabled() then
            local l_OPEN_LEARN_MORE_LINK_0 = v4.OPEN_LEARN_MORE_LINK;
            v43 = if v26.navigation then v26.navigation.getParam(l_OPEN_LEARN_MORE_LINK_0) else l_getDeepValue_0(v26, l_OPEN_LEARN_MORE_LINK_0);
        else
            v43 = v26.navigation.getParam(v4.OPEN_LEARN_MORE_LINK);
        end;
        v43();
    end;
    local function v49(_) --[[ Line: 133 ]]
        -- upvalues: v20 (ref), v4 (ref), v26 (copy), l_getDeepValue_0 (ref), v3 (ref)
        local v47;
        if v20.SetupEnabled() then
            local l_SHOW_TOAST_0 = v4.SHOW_TOAST;
            v47 = if v26.navigation then v26.navigation.getParam(l_SHOW_TOAST_0) else l_getDeepValue_0(v26, l_SHOW_TOAST_0);
        else
            v47 = v26.navigation.getParam(v4.SHOW_TOAST);
        end;
        v47(v3.CI_FAILED);
    end;
    local function _() --[[ Line: 140 ]]
        -- upvalues: v31 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        return v31(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local function _() --[[ Line: 147 ]]
        -- upvalues: v31 (copy), l_UpdateIsDiscoverabilityUnset_0 (ref)
        return v31(l_UpdateIsDiscoverabilityUnset_0({
            isDiscoverabilityUnset = false
        }));
    end;
    local function _(v52, v53) --[[ Line: 153 ]]
        -- upvalues: v31 (copy), l_NetworkingUserSettings_0 (ref)
        return v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
            canUploadContacts = v52, 
            phoneNumberDiscoverability = v53
        }));
    end;
    local function v65(v55) --[[ Line: 160 ]]
        -- upvalues: v32 (copy), v7 (ref), v29 (copy), v31 (copy), l_NetworkingUserSettings_0 (ref), v20 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v4 (ref), v26 (copy), l_getDeepValue_0 (ref), v37 (copy), v3 (ref), l_EnumScreens_0 (ref), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v36 (copy), l_UpdateContactImporterModalLogic_0 (ref), v34 (copy), l_Promise_0 (ref), v49 (copy)
        v32.fireAnalyticsEvent(v7.DiscoverabilityModalContinue, {
            selected = v55
        });
        if v29 then
            v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = nil, 
                phoneNumberDiscoverability = v55
            })):andThen(function() --[[ Line: 165 ]]
                -- upvalues: v20 (ref), v31 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v4 (ref), v26 (ref), l_getDeepValue_0 (ref), v37 (ref), v3 (ref), l_EnumScreens_0 (ref)
                if v20.SetupEnabled() then
                    local v56 = v31(l_UpdateIsDiscoverabilityUnset_0({
                        isDiscoverabilityUnset = false
                    }));
                    local l_NAVIGATE_ON_ACTIVATED_0 = v4.NAVIGATE_ON_ACTIVATED;
                    v56 = if v26.navigation then v26.navigation.getParam(l_NAVIGATE_ON_ACTIVATED_0) else l_getDeepValue_0(v26, l_NAVIGATE_ON_ACTIVATED_0);
                    local l_SHOW_TOAST_1 = v4.SHOW_TOAST;
                    l_NAVIGATE_ON_ACTIVATED_0 = if v26.navigation then v26.navigation.getParam(l_SHOW_TOAST_1) else l_getDeepValue_0(v26, l_SHOW_TOAST_1);
                    v37();
                    v56();
                    l_NAVIGATE_ON_ACTIVATED_0(v3.SETTING_SAVED);
                    return;
                else
                    local v59 = v26.navigation.getParam(v4.SHOW_TOAST);
                    v26.navigation.pop();
                    v26.navigation.navigate(l_EnumScreens_0.AddFriendsPage);
                    v59(v3.SETTING_SAVED);
                    return;
                end;
            end);
            return;
        else
            v26.checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v60) --[[ Line: 185 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v36 (ref), v31 (ref), l_UpdateContactImporterModalLogic_0 (ref), v55 (copy), l_NetworkingUserSettings_0 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v26 (ref), l_EnumScreens_0 (ref), v4 (ref), v34 (ref), l_Promise_0 (ref)
                if v60 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v36);
                    local _ = v31(l_UpdateContactImporterModalLogic_0({
                        hasOSPermissions = true, 
                        shouldShowContactImporterUpsellModal = false
                    }));
                    local l_v55_0 = v55;
                    v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                        canUploadContacts = true, 
                        phoneNumberDiscoverability = l_v55_0
                    })):andThen(function() --[[ Line: 189 ]]
                        -- upvalues: v31 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v26 (ref), l_EnumScreens_0 (ref), v4 (ref)
                        local _ = v31(l_UpdateIsDiscoverabilityUnset_0({
                            isDiscoverabilityUnset = false
                        }));
                        v26.navigation.pop();
                        v26.navigation.navigate(l_EnumScreens_0.ContactsList, {
                            [v4.IS_PHONE_VERIFIED] = true
                        });
                    end);
                    return;
                elseif v60 == l_PermissionsProtocol_0.Status.DENIED then
                    local l_v55_1 = v55;
                    v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                        canUploadContacts = false, 
                        phoneNumberDiscoverability = l_v55_1
                    })):andThen(function() --[[ Line: 197 ]]
                        -- upvalues: v26 (ref), l_EnumScreens_0 (ref), v34 (ref)
                        v26.navigation.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                            screenSize = v34, 
                            closeModal = function() --[[ Line: 200 ]] --[[ Name: closeModal ]]
                                -- upvalues: v26 (ref)
                                v26.navigation.pop();
                            end
                        });
                    end);
                    return;
                else
                    return l_Promise_0.reject();
                end;
            end):catch(v49);
            return;
        end;
    end;
    return l_React_0.createElement(v22, {
        screenSize = v34, 
        onCloseClicked = v42, 
        onLearnMoreClick = v45, 
        onActivated = v65, 
        prefillDiscoverabilitySetting = v39.prefillDiscoverabilitySetting, 
        analytics = v32
    });
end;