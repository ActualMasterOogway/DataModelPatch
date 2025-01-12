local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Parent_1.Dash);
local v9 = require(l_Parent_1.Promise);
local v10 = require(l_Parent_1.Cryo);
local v11 = require(l_Parent_1.SocialModalsCommon);
local v12 = require(l_Parent_1.RobloxAppHooks);
local v13 = require(l_Parent_1.SocialCommon);
local v14 = require(l_Parent_1.AppStartup);
local l_useQuery_0 = require(l_Parent_1.ApolloClient).useQuery;
local v16 = require(l_Parent_1.ApolloLocalState);
local v17 = require(l_Parent_1.ApolloFriends);
local l_queries_0 = v16.queries;
local l_ContactsToast_0 = require(l_Parent_1.ContactsToast).ContactsToast;
local l_ContactsToastIXP_0 = require(l_Parent_1.ContactsToast).ContactsToastIXP;
local l_PermissionsProtocol_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol;
local l_SetCurrentToastMessage_0 = require(l_Parent_1.ToastRodux).Actions.SetCurrentToastMessage;
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useFetchContactImporterInfoOnce_0 = require(l_Parent_0.Utils).useFetchContactImporterInfoOnce;
local l_useAutoSyncContacts_0 = require(l_Parent_0.Utils).useAutoSyncContacts;
local l_getContactImporterParams_0 = require(l_Parent_0.Utils).getContactImporterParams;
local l_userIdExists_0 = v13.Utils.userIdExists;
local l_rolloutByApplicationId_0 = require(l_Parent_1.AppCommonLib).rolloutByApplicationId;
local l_EnumScreens_0 = v11.EnumScreens;
local l_updateOptedInUsers_0 = v11.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v11.Actions.UpdateContactImporterModalLogic;
local l_useLaunchContext_0 = v14.Hooks.useLaunchContext;
local l_LaunchContext_0 = v14.Enums.LaunchContext;
local l_useLocalUserId_0 = v12.useLocalUserId;
local l_useScreenSize_0 = v12.useScreenSize;
local l_UniversalAppPolicy_0 = v5.UniversalAppPolicy;
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local l_NetworkingFriends_0 = v5.NetworkingFriends;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagContactsToastEnabled;
local v41 = require(l_Parent_0.Flags.FFlagUpsellPhoneAndContactsAfterSignup);
local v42 = require(l_Parent_0.Experiments.AfterSignupIXP);
local v43 = require(l_Parent_0.Common.SignupIXPVariants);
local v44 = require(l_Parent_0.Experiments.PaginatedFriendsCarouselIXP);
local l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 = require(l_Parent_1.SharedFlags).FFlagContactImporterPhoneAndContactsAfterSignupFixes;
local v46 = require(l_Parent_0.Flags.FFlagContactImporterManagerPolicyFix);
local v47 = require(l_Parent_0.Flags.FFlagAddPolicyForVoiceUpsellSignup);
local v48 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false);
local v49 = game:DefineFastFlag("CheckUserIdExistsFetchFriendsV1", false);
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_1.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local l_FIntFriendsCarouselInitialFetchSize_0 = require(l_Parent_1.SharedFlags).FIntFriendsCarouselInitialFetchSize;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v53 = l_rolloutByApplicationId_0(function() --[[ Line: 69 ]]
    return game:DefineFastInt("CallFriendCountAtStartupRollout", 0);
end);
return l_UniversalAppPolicy_0.connect(function(v54) --[[ Line: 326 ]]
    -- upvalues: l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy)
    return {
        isContactImporterPolicyEnabled = v54.getContactImporterEnabled(), 
        isContactsToastPolicyEnabled = if not not l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled then v54.getContactsToastEnabled() else false
    };
end)(function(v55) --[[ Line: 91 ]] --[[ Name: Container ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useLaunchContext_0 (copy), l_useScreenSize_0 (copy), v6 (copy), v42 (copy), l_PermissionsProtocol_0 (copy), v46 (copy), l_getAppFeaturePolicies_0 (copy), v47 (copy), l_useFetchContactImporterInfoOnce_0 (copy), l_SetCurrentToastMessage_0 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_useSelector_0 (copy), l_getContactImporterParams_0 (copy), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (copy), l_EnumScreens_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), v9 (copy), v43 (copy), l_userIdExists_0 (copy), v41 (copy), l_LaunchContext_0 (copy), v48 (copy), v44 (copy), v17 (copy), l_useQuery_0 (copy), l_queries_0 (copy), v49 (copy), v10 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), l_useAutoSyncContacts_0 (copy), v53 (copy), l_NetworkingFriends_0 (copy), l_FFlagEnableNewFriendRequestsBadge_0 (copy), l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy), v7 (copy), l_CoreGui_0 (copy), l_ContactsToast_0 (copy), v8 (copy)
    local v56 = l_useDispatch_0();
    local v57 = l_useLocalUserId_0();
    local v58 = l_useLaunchContext_0();
    local v59 = l_useScreenSize_0();
    local v60, v61 = v6.useState(false);
    local v62 = if v42.FFlagPVandCIAfterSignupExperimentEnabled then v42.usePVAndCIAfterSignupVariant({
        isExposureEnabled = true
    }) else nil;
    local l_default_0 = l_PermissionsProtocol_0.default;
    local v64 = if v46 then v55.isContactImporterPolicyEnabled or l_getAppFeaturePolicies_0().getContactImporterEnabled() else v55.isContactImporterPolicyEnabled;
    local v65 = not v47 or l_getAppFeaturePolicies_0().getUpsellVoiceForPhoneVerification();
    l_useFetchContactImporterInfoOnce_0({
        policyIsEnabled = v64
    });
    local function v67(v66) --[[ Line: 113 ]]
        -- upvalues: v56 (copy), l_SetCurrentToastMessage_0 (ref)
        v56(l_SetCurrentToastMessage_0({
            toastMessage = v66
        }));
    end;
    local function _() --[[ Line: 119 ]]
        -- upvalues: l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function _() --[[ Line: 125 ]]
        -- upvalues: v56 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        v56(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local v70 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isPhoneVerified_0 = v70.isPhoneVerified;
    local l_isDiscoverabilityUnset_0 = v70.isDiscoverabilityUnset;
    local function v74() --[[ Line: 136 ]]
        -- upvalues: l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (ref), v55 (copy), l_EnumScreens_0 (ref), v67 (copy), l_isDiscoverabilityUnset_0 (copy), l_isPhoneVerified_0 (copy), l_l_UserInputService_0_Platform_0 (ref), l_default_0 (copy), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v57 (copy), v56 (copy), l_UpdateContactImporterModalLogic_0 (ref), v9 (ref), v59 (copy)
        if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then
            v55.navigate(l_EnumScreens_0.ContactImporter, {
                showToast = v67, 
                openLearnMoreLink = v55.openContactImporterLearnMoreLink, 
                isFromAddFriendsPage = false, 
                isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                isPhoneVerified = l_isPhoneVerified_0, 
                openProfilePeekView = v55.openProfilePeekView, 
                openAmpUpsell = v55.openAmpUpsell, 
                isFromSignup = true
            });
            return;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            l_default_0:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v73) --[[ Line: 150 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v57 (ref), v56 (ref), l_UpdateContactImporterModalLogic_0 (ref), v9 (ref), v55 (ref), l_EnumScreens_0 (ref), v59 (ref)
                if v73 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v57);
                    v56(l_UpdateContactImporterModalLogic_0({
                        hasOSPermissions = true, 
                        shouldShowContactImporterUpsellModal = false
                    }));
                    return v9.resolve();
                elseif v73 == l_PermissionsProtocol_0.Status.DENIED then
                    v55.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                        screenSize = v59
                    });
                    return v9.resolve();
                else
                    return v9.reject();
                end;
            end);
            return;
        else
            v55.navigate(l_EnumScreens_0.ContactImporter, {
                showToast = v67, 
                openLearnMoreLink = v55.openContactImporterLearnMoreLink, 
                isFromAddFriendsPage = false, 
                isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                isPhoneVerified = l_isPhoneVerified_0, 
                openProfilePeekView = v55.openProfilePeekView, 
                openAmpUpsell = v55.openAmpUpsell
            });
            return;
        end;
    end;
    local function v75() --[[ Line: 178 ]]
        -- upvalues: l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (ref), v55 (copy), v67 (copy), v62 (copy), v43 (ref), v74 (copy)
        if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 and v55.hideUpsellCard then
            v55.hideUpsellCard();
        end;
        v55.openDiscoverabilityModal({
            showToast = v67, 
            openLearnMoreLink = v55.openContactImporterLearnMoreLink, 
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = "", 
            onClose = v55.onCloseDiscoverabilityModal, 
            navigateOnActivated = if v62 == v43.FULL then v74 else v55.onCloseDiscoverabilityModal
        });
    end;
    local function v76() --[[ Line: 194 ]]
        -- upvalues: v56 (copy), v55 (copy)
        v56(v55.closeCentralOverlay());
    end;
    local function v77() --[[ Line: 198 ]]
        -- upvalues: v65 (copy), v56 (copy), v55 (copy), v75 (copy), l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 (ref), v76 (copy), v62 (copy), v43 (ref), v74 (copy)
        if v65 then
            v56(v55.openPhoneUpsellModal({
                onSuccess = v75, 
                eventContext = "verificationUpsell", 
                origin = "signup", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat", 
                extraButtonTextKey = "Feature.AccountSecurityPrompt.Action.RemindMeLater", 
                onExtraButtonClick = if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then v76 else v55.closeCentralOverlay
            }, true));
            return;
        else
            if v62 == v43.FULL then
                v74();
            end;
            return;
        end;
    end;
    v6.useEffect(function() --[[ Line: 216 ]]
        -- upvalues: v46 (ref), l_userIdExists_0 (ref), v57 (copy), v55 (copy), v61 (copy)
        if v46 and l_userIdExists_0(v57) then
            v55.waitUntilIXPUserInit(v57):andThen(function() --[[ Line: 218 ]]
                -- upvalues: v61 (ref)
                v61(true);
            end);
        end;
    end, {
        v57
    });
    v6.useEffect(function() --[[ Line: 225 ]]
        -- upvalues: v41 (ref), v62 (copy), l_userIdExists_0 (ref), v57 (copy), v58 (copy), l_LaunchContext_0 (ref), v64 (copy), v42 (ref), v43 (ref), v77 (copy), v74 (copy)
        if (v41 or v62) and l_userIdExists_0(v57) and v58 == l_LaunchContext_0.SignUp and v64 then
            if v42.FFlagPVandCIAfterSignupExperimentEnabled then
                v42.logExposure();
            end;
            if v62 == v43.FULL or v62 == v43.PHONE_VERIFCATION or v41 then
                v77();
                return;
            elseif v62 == v43.CONTACT_IMPORTER then
                v74();
            end;
        end;
    end, if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then {
        v57, 
        v58, 
        v62, 
        v64, 
        v60
    } else {
        v57, 
        v58, 
        v62
    });
    if v48 then
        local v78, v79 = v44.usePaginatedFriendsCarouselExperiment();
        local v80 = {
            userId = v57, 
            sort = v78 and v79 or v17.Enums.Sort.FriendshipScore
        };
        l_useQuery_0(l_queries_0.allFriendsByUserId, {
            errorPolicy = "all", 
            skip = not v78 or v49 and not l_userIdExists_0(v57), 
            notifyOnNetworkStatusChange = true, 
            variables = v10.Dictionary.join(v80, {
                pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
                pageCursor = ""
            })
        });
        l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
            skip = not v78 or v49 and not l_userIdExists_0(v57), 
            notifyOnNetworkStatusChange = true, 
            variables = v80
        });
    end;
    l_useAutoSyncContacts_0();
    if v53() then
        v6.useEffect(function() --[[ Line: 293 ]]
            -- upvalues: l_userIdExists_0 (ref), v57 (copy), v56 (copy), l_NetworkingFriends_0 (ref)
            if l_userIdExists_0(v57) then
                v56(l_NetworkingFriends_0.GetFriendsCountFromUserId.API(v57));
            end;
        end, {
            v57
        });
    end;
    if l_FFlagEnableNewFriendRequestsBadge_0 then
        v6.useEffect(function() --[[ Line: 301 ]]
            -- upvalues: l_userIdExists_0 (ref), v57 (copy), v56 (copy), l_NetworkingFriends_0 (ref)
            if l_userIdExists_0(v57) then
                v56(l_NetworkingFriends_0.GetNewFriendRequestsCount.API({
                    currentUserId = v57
                }));
            end;
        end, {
            v57
        });
    end;
    if l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled and l_ContactsToastIXP_0.useContactsToastVariant() then
        return (v6.createElement(v7.Portal, {
            target = l_CoreGui_0
        }, {
            v6.createElement(l_ContactsToast_0, v8.join(v55, {
                getContactImporterParams = l_getContactImporterParams_0, 
                isContactsToastPolicyEnabled = v55.isContactsToastPolicyEnabled
            }))
        }));
    else
        return nil;
    end;
end);