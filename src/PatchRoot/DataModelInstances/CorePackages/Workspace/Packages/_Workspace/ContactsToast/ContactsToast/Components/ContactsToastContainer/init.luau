local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ExperienceService);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Cryo);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v9 = require(l_Parent_0.RobloxAppHooks);
local l_useLocalUserId_0 = v9.useLocalUserId;
local l_useScreenSize_0 = v9.useScreenSize;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local v14 = require(l_Parent_0.SocialModalsCommon);
local l_EnumScreens_0 = v14.EnumScreens;
local l_updateOptedInUsers_0 = v14.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v14.Actions.UpdateContactImporterModalLogic;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v19 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v19.App.Dialog.Toast;
local l_Images_0 = v19.App.ImageSet.Images;
local l_IconSize_0 = v19.App.Constant.IconSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagContactsToastEnabled;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local l_ExperienceService_0 = v4.ExperienceService;
local v29 = require(l_script_FirstAncestor_0.Common.Constants);
local v30 = require(l_script_FirstAncestor_0.Utils.localStorageContactsToast);
local v31 = require(l_script_FirstAncestor_0.Networking.configureRoduxUsers);
local v32 = require(l_script_FirstAncestor_0.Experiments.ContactsToastIXP);
local l_Analytics_0 = require(l_script_FirstAncestor_0.Analytics).Analytics;
local v34 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v36 = game:DefineFastInt("ContactsToastAccountAgeThresholdInDays", 7);
local v37 = l_Images_0["icons/graphic/connectcontacts_large"];
local v38 = Vector2.new(l_IconSize_0.Large, l_IconSize_0.Large);
return function(v39) --[[ Line: 65 ]]
    -- upvalues: v6 (copy), l_useDispatch_0 (copy), l_Analytics_0 (copy), l_useLocalization_0 (copy), v29 (copy), v32 (copy), l_useSelector_0 (copy), l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagContactsToastEnabled_0 (copy), l_getDeepValue_0 (copy), l_PermissionsProtocol_0 (copy), l_SetCurrentToastMessage_0 (copy), v7 (copy), v34 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_EnumScreens_0 (copy), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (copy), v5 (copy), l_Toast_0 (copy), v37 (copy), v38 (copy), v31 (copy), v36 (copy), v30 (copy), l_ExperienceService_0 (copy), l_setTimeout_0 (copy)
    local v40, v41 = v6.useState(false);
    local v42 = l_useDispatch_0();
    local v43 = l_Analytics_0();
    local v44 = l_useLocalization_0({
        title = v29.Translations.title, 
        subtitle = v29.Translations.subtitle, 
        button = v29.Translations.button, 
        buttonV2 = v29.Translations.buttonV2
    });
    local v45 = v32.useContactsToastVariant();
    local v46 = l_useSelector_0(v39.getContactImporterParams);
    local l_isDiscoverabilityUnset_0 = v46.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v46.isPhoneVerified;
    local v49 = l_useScreenSize_0();
    local v50 = l_useLocalUserId_0();
    local v52 = l_useSelector_0(function(v51) --[[ Line: 82 ]]
        return v51.IsLocalUserUnder13;
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 86 ]]
        -- upvalues: l_GetFFlagContactsToastEnabled_0 (ref), v45 (copy), l_getDeepValue_0 (ref), v29 (ref), v50 (copy)
        if l_GetFFlagContactsToastEnabled_0() or v45 then
            return (l_getDeepValue_0(v53, (("%*.Users.byUserId.%*"):format(v29.RODUX_KEY, v50))));
        else
            return {};
        end;
    end);
    local l_default_0 = l_PermissionsProtocol_0.default;
    local function v57(v56) --[[ Line: 94 ]]
        -- upvalues: v42 (copy), l_SetCurrentToastMessage_0 (ref)
        v42(l_SetCurrentToastMessage_0({
            toastMessage = v56
        }));
    end;
    local function v58() --[[ Line: 99 ]]
        -- upvalues: v42 (copy), v39 (copy)
        v42(v39.openContactImporterLearnMoreLink());
    end;
    local function v61(v59, v60) --[[ Line: 102 ]]
        -- upvalues: v42 (copy), v39 (copy)
        v42(v39.openProfilePeekView(v59, v60));
    end;
    local function v64(v62, v63) --[[ Line: 106 ]]
        -- upvalues: v42 (copy), v39 (copy)
        v42(v39.openAmpWizardContainer(v62, v63));
    end;
    local function v67(v65, v66) --[[ Line: 110 ]]
        -- upvalues: v42 (copy), v39 (copy), v7 (ref)
        v42(v39.navigateToRoute({
            v7.Dictionary.join({
                name = v65
            }, v66)
        }));
    end;
    local function _() --[[ Line: 114 ]]
        -- upvalues: l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function _() --[[ Line: 120 ]]
        -- upvalues: v39 (copy), l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        if v39.hasPermissions then
            return (v39.hasPermissions());
        else
            return (l_default_0:hasPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }));
        end;
    end;
    local function v70() --[[ Line: 126 ]]
        -- upvalues: v41 (copy), v43 (copy), v34 (ref), v45 (copy)
        v41(false);
        v43.fireAnalyticsEvent(v34.ContactsToastDismissed, {
            variant = v45
        });
    end;
    local function _() --[[ Line: 133 ]]
        -- upvalues: v42 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        v42(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local function v73() --[[ Line: 140 ]]
        -- upvalues: l_l_UserInputService_0_Platform_0 (ref), l_default_0 (copy), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v50 (copy), v42 (copy), l_UpdateContactImporterModalLogic_0 (ref), v67 (copy), l_EnumScreens_0 (ref), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (ref), v57 (copy), l_isPhoneVerified_0 (copy), v58 (copy), v64 (copy), v5 (ref), v49 (copy), l_isDiscoverabilityUnset_0 (copy), v61 (copy), v41 (copy), v43 (copy), v34 (ref), v45 (copy)
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            l_default_0:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v72) --[[ Line: 142 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v50 (ref), v42 (ref), l_UpdateContactImporterModalLogic_0 (ref), v67 (ref), l_EnumScreens_0 (ref), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (ref), v57 (ref), l_isPhoneVerified_0 (ref), v58 (ref), v64 (ref), v5 (ref), v49 (ref)
                if v72 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v50);
                    v42(l_UpdateContactImporterModalLogic_0({
                        hasOSPermissions = true, 
                        shouldShowContactImporterUpsellModal = false
                    }));
                    v67(l_EnumScreens_0.ContactsList, {
                        showToast = if l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then v57 else nil, 
                        shouldUpdateUserSettings = true, 
                        isPhoneVerified = l_isPhoneVerified_0, 
                        openLearnMoreLink = v58, 
                        openAmpUpsell = v64
                    });
                    return v5.resolve();
                elseif v72 == l_PermissionsProtocol_0.Status.DENIED then
                    v67(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                        screenSize = v49
                    });
                    return v5.resolve();
                else
                    return v5.reject();
                end;
            end);
        else
            v67(l_EnumScreens_0.ContactImporter, {
                showToast = v57, 
                openLearnMoreLink = v58, 
                isFromAddFriendsPage = false, 
                isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                isPhoneVerified = l_isPhoneVerified_0, 
                openProfilePeekView = v61, 
                openAmpUpsell = v64
            });
        end;
        v41(false);
        v43.fireAnalyticsEvent(v34.ContactsToastButtonPressed, {
            variant = v45
        });
    end;
    local v74 = v6.createElement(l_Toast_0, {
        duration = 4, 
        toastContent = {
            iconImage = v37, 
            toastTitle = v44.title, 
            toastSubtitle = v44.subtitle, 
            iconSize = v38, 
            onActivated = v73, 
            onDismissed = v70, 
            buttonText = if v45 == v29.Experiment.FIND_FRIENDS then v44.button else v44.buttonV2, 
            swipeUpDismiss = true
        }
    });
    local function _() --[[ Line: 196 ]]
        -- upvalues: v50 (copy), v42 (copy), v31 (ref)
        if v50 and string.len(v50) > 0 and v50 ~= "0" then
            v42(v31.GetUserV2FromUserId.API(v50));
        end;
    end;
    v6.useEffect(function() --[[ Line: 202 ]]
        -- upvalues: v50 (copy), v42 (copy), v31 (ref)
        if v50 and string.len(v50) > 0 and v50 ~= "0" then
            v42(v31.GetUserV2FromUserId.API(v50));
        end;
    end, {
        v50
    });
    v6.useEffect(function() --[[ Line: 206 ]]
        -- upvalues: v50 (copy), v54 (copy), v36 (ref), v39 (copy), v52 (copy), v30 (ref), l_default_0 (copy), l_PermissionsProtocol_0 (ref), l_ExperienceService_0 (ref), l_setTimeout_0 (ref), v41 (copy), v43 (copy), v34 (ref), v45 (copy)
        if v50 and string.len(v50) > 0 and v54 and v54.created then
            local v76, v77, v78 = v54.created:match("(%d+)-(%d+)-(%d+)");
            if math.floor((os.time() - os.time({
                year = v76, 
                month = v77, 
                day = v78
            })) / 86400) <= v36 and v39.isContactsToastPolicyEnabled and not v52 and v30:CheckUserHasNotSeen(v50) then
                (if v39.hasPermissions then v39.hasPermissions() else l_default_0:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                })):andThen(function(v79) --[[ Line: 217 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v30 (ref), v50 (ref), l_ExperienceService_0 (ref), l_setTimeout_0 (ref), v41 (ref), v43 (ref), v34 (ref), v45 (ref)
                    if v79.status == l_PermissionsProtocol_0.Status.DENIED and v79.missingPermissions[1] == l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS or v79.status ~= l_PermissionsProtocol_0.Status.DENIED and v30:CheckUserHasNotOptedIn(v50) then
                        l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 226 ]]
                            -- upvalues: v30 (ref), v50 (ref), l_setTimeout_0 (ref), v41 (ref), v43 (ref), v34 (ref), v45 (ref)
                            if v30:CheckUserHasNotSeen(v50) then
                                l_setTimeout_0(function() --[[ Line: 229 ]]
                                    -- upvalues: v41 (ref), v30 (ref), v50 (ref), v43 (ref), v34 (ref), v45 (ref)
                                    v41(true);
                                    v30:AddUser(v50);
                                    v43.fireAnalyticsEvent(v34.ContactsToastSeen, {
                                        variant = v45
                                    });
                                end, 1000);
                            end;
                        end);
                    end;
                end);
            end;
        end;
    end, {
        v50, 
        v39.isContactsToastPolicyEnabled, 
        v52, 
        v54
    });
    if v39.isContactsToastPolicyEnabled and not v52 and v40 or v39.testOverride then
        return (v6.createElement("ScreenGui", {
            DisplayOrder = 13
        }, {
            v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -20), 
                Position = UDim2.new(0, 0, 0, 20)
            }, v74)
        }));
    else
        return nil;
    end;
end;