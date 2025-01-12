local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialOnboardingButtons");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v1.EventNames;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getContactImporterParams_0 = require(l_Parent_0.ContactImporter).Utils.getContactImporterParams;
local v10 = require(l_Parent_0.SocialModalsCommon);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v12 = require(l_Parent_0.AppStartup);
local l_useLaunchContext_0 = v12.Hooks.useLaunchContext;
local l_LaunchContext_0 = v12.Enums.LaunchContext;
local l_EnumScreens_0 = v10.EnumScreens;
local v16 = require(l_script_FirstAncestor_0.Enums.SocialOnboardingButtonsEnum);
local v17 = require(l_script_FirstAncestor_0.Experiments.SocialOnboardingButtonsIXP);
local v18 = require(l_script_FirstAncestor_0.Hooks.useSocialOnboardingButtonsColors);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v20 = l_Images_0[game:DefineFastString("FindContactsIcon_v3", "icons/actions/friend_sort/find_contacts")];
local v21 = l_Images_0[game:DefineFastString("MyQRCodeIcon_v3", "icons/actions/friend_sort/qr_code")];
local v22 = l_Images_0[game:DefineFastString("SearchPeopleIcon_v3", "icons/actions/friend_sort/search_people")];
local v23 = l_Images_0[game:DefineFastString("UnlockVoiceIcon_v3", "icons/actions/friend_sort/unlock_voice")];
local v24 = l_Images_0[game:DefineFastString("MyProfileIcon_v3", "icons/actions/friend_sort/my_profile")];
local v25 = l_Images_0[game:DefineFastString("AddFriendsIcon_v3", "icons/actions/friend_sort/add_friends")];
local l_FFlagSocialBtnsFollowupExperiment_0 = require(l_script_FirstAncestor_0.Flags).FFlagSocialBtnsFollowupExperiment;
return function(v27, v28) --[[ Line: 73 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_FFlagSocialBtnsFollowupExperiment_0 (copy), l_useLaunchContext_0 (copy), l_useLocalization_0 (copy), v17 (copy), v18 (copy), v4 (copy), v1 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_getContactImporterParams_0 (copy), l_EventNames_0 (copy), l_EnumScreens_0 (copy), v16 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v20 (copy), v25 (copy), l_LaunchContext_0 (copy)
    local v29 = l_useLocalUserId_0();
    local v30 = l_useNavigation_0();
    local v31 = if l_FFlagSocialBtnsFollowupExperiment_0 then l_useLaunchContext_0() else nil;
    local v32 = l_useLocalization_0({
        addFriends = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        searchPeople = "Feature.Friends.Label.SearchPeople", 
        findContacts = "Feature.Contacts.Label.FindContacts", 
        unlockVoice = "Feature.Friends.Label.UnlockVoice", 
        myProfile = "Feature.Friends.Label.MyProfile", 
        shareQRCode = "Feature.AddFriends.Label.MyQrCode"
    });
    local v33 = v17.useSocialOnboardingBtnsEnabled();
    local v34, v35, v36 = v18();
    local v37 = if l_FFlagSocialBtnsFollowupExperiment_0 then v17.useSocialOnboardingBtnsOrder() else nil;
    local v38 = if l_FFlagSocialBtnsFollowupExperiment_0 then v17.useSocialOnboardingBtnsHideAfterSignup() else nil;
    local v39 = v4.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v1 (ref), v27 (copy)
        return v1.getAnalytics(v27.entryPoint)().fireAnalyticsEvent;
    end, {
        v27, 
        v1
    });
    local v43 = l_useSelector_0(function(v40) --[[ Line: 103 ]]
        local l_HomePageUpsellCardVariation_0 = v40.HomePageUpsellCardVariation;
        local v42 = false;
        if l_HomePageUpsellCardVariation_0 ~= nil then
            v42 = false;
            if l_HomePageUpsellCardVariation_0.upsellCardType ~= nil then
                v42 = l_HomePageUpsellCardVariation_0.upsellCardType ~= "";
            end;
        end;
        return v42;
    end);
    local v45 = l_useAppPolicy_0(function(v44) --[[ Line: 110 ]]
        return {
            contactImporterEnabled = v44.getContactImporterEnabled(), 
            upsellVoiceForPhoneVerification = v44.getUpsellVoiceForPhoneVerification()
        };
    end);
    local v46 = l_useSelector_0(l_getContactImporterParams_0);
    local v47 = v46.hasOSPermissions or false;
    local v48 = v46.canUploadContacts or false;
    local v49 = v46.isDiscoverabilityUnset or false;
    local v50 = v46.isPhoneVerified or false;
    local l_contactImporterEnabled_0 = v45.contactImporterEnabled;
    local v52 = v45.upsellVoiceForPhoneVerification and not v50 and not v43;
    local v55 = v4.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v39 (copy), l_EventNames_0 (ref), v47 (copy), v48 (copy), v28 (copy), v49 (copy), v50 (copy), v30 (copy), l_EnumScreens_0 (ref)
        v39(l_EventNames_0.FindContactsBtn);
        local v53 = not v47 or not v48;
        local v54 = {
            isFromAddFriendsPage = false, 
            openLearnMoreLink = v28.openLearnMoreLink, 
            showToast = v28.showToast, 
            isDiscoverabilityUnset = v49, 
            isPhoneVerified = v50, 
            openAmpUpsell = v28.openAmpUpsell, 
            isFromSocialOnboardingButtons = true
        };
        if v53 then
            v30.navigate(l_EnumScreens_0.ContactImporter, v54);
            return;
        else
            v30.navigate(l_EnumScreens_0.ContactsList, v54);
            return;
        end;
    end, {
        v28, 
        v49, 
        v50, 
        v30, 
        v39
    });
    local v56 = v4.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: v28 (copy), v27 (copy)
        v28.hideUpsellCard();
        v28.openDiscoverabilityModal({
            showToast = v28.showToast, 
            openLearnMoreLink = v28.openLearnMoreLink, 
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = v27.entryPoint, 
            onClose = v28.closeCentralOverlay, 
            navigateOnActivated = v28.closeCentralOverlay
        });
    end, {
        v28, 
        v27
    });
    local v69, v70 = v4.useMemo(l_FFlagSocialBtnsFollowupExperiment_0 and function() --[[ Line: 159 ]]
        -- upvalues: v39 (copy), l_EventNames_0 (ref), v28 (copy), v16 (ref), v32 (copy), v21 (ref), v34 (copy), v35 (copy), v36 (copy), v22 (ref), v52 (copy), v56 (copy), v23 (ref), v29 (copy), v24 (ref), l_contactImporterEnabled_0 (copy), v20 (ref), v55 (copy), v37 (copy), v25 (ref)
        local v57 = {};
        local function v58() --[[ Line: 164 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref)
            v39(l_EventNames_0.MyQRCodeBtn);
            v28.navigateToQRCodePage();
        end;
        v57[v16.ShareQRCodeBtn] = {
            id = v16.ShareQRCodeBtn, 
            text = v32.shareQRCode, 
            icon = v21, 
            onActivated = v58, 
            backgroundColor = v34.myQRCode, 
            iconColor = v35, 
            extraId = v36
        };
        local function v59() --[[ Line: 181 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref)
            v39(l_EventNames_0.SearchPeopleBtn);
            v28.navigateToSearchFriends();
        end;
        v57[v16.SearchFriendsBtn] = {
            id = v16.SearchFriendsBtn, 
            text = v32.searchPeople, 
            icon = v22, 
            onActivated = v59, 
            backgroundColor = v34.searchPeople, 
            iconColor = v35, 
            extraId = v36
        };
        if v52 then
            local function v60() --[[ Line: 199 ]]
                -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref), v56 (ref)
                v39(l_EventNames_0.UnlockVoiceBtn);
                v28.openPhoneVerificationModal(v56);
            end;
            v57[v16.UnlockVoiceBtn] = {
                id = v16.UnlockVoiceBtn, 
                text = v32.unlockVoice, 
                icon = v23, 
                onActivated = v60, 
                backgroundColor = v34.unlockVoice, 
                iconColor = v35, 
                extraId = v36
            };
        end;
        local function v61() --[[ Line: 217 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref), v29 (ref)
            v39(l_EventNames_0.MyProfileBtn);
            v28.openProfilePeekView((tostring(v29)));
        end;
        if v29 then
            v57[v16.CompleteProfileBtn] = {
                id = v16.CompleteProfileBtn, 
                text = v32.myProfile, 
                icon = v24, 
                onActivated = v61, 
                backgroundColor = v34.myProfile, 
                iconColor = v35, 
                extraId = v36
            };
        end;
        if l_contactImporterEnabled_0 then
            v57[v16.FindContactsBtn] = {
                id = v16.FindContactsBtn, 
                text = v32.findContacts, 
                icon = v20, 
                onActivated = v55, 
                backgroundColor = v34.findContacts, 
                iconColor = v35, 
                extraId = v36
            };
        end;
        local v62 = {};
        for v63 in string.gmatch(v37 or "", "([^,]+)") do
            if v57[v63] then
                table.insert(v62, v57[v63]);
            end;
        end;
        return v62, {
            id = v16.AddFriendsBtn, 
            icon = v25, 
            backgroundColor = v34.addFriends, 
            iconColor = v35, 
            extraId = v36
        };
    end or function() --[[ Line: 268 ]]
        -- upvalues: v39 (copy), l_EventNames_0 (ref), v28 (copy), v16 (ref), v32 (copy), v21 (ref), v34 (copy), v35 (copy), v36 (copy), v22 (ref), v52 (copy), v56 (copy), v23 (ref), v29 (copy), v24 (ref), l_contactImporterEnabled_0 (copy), v48 (copy), v20 (ref), v55 (copy), v25 (ref)
        local v64 = {};
        local function v65() --[[ Line: 273 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref)
            v39(l_EventNames_0.MyQRCodeBtn);
            v28.navigateToQRCodePage();
        end;
        table.insert(v64, {
            id = v16.ShareQRCodeBtn, 
            text = v32.shareQRCode, 
            icon = v21, 
            onActivated = v65, 
            backgroundColor = v34.myQRCode, 
            iconColor = v35, 
            extraId = v36
        });
        local function v66() --[[ Line: 290 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref)
            v39(l_EventNames_0.SearchPeopleBtn);
            v28.navigateToSearchFriends();
        end;
        table.insert(v64, {
            id = v16.SearchFriendsBtn, 
            text = v32.searchPeople, 
            icon = v22, 
            onActivated = v66, 
            backgroundColor = v34.searchPeople, 
            iconColor = v35, 
            extraId = v36
        });
        if v52 then
            local function v67() --[[ Line: 308 ]]
                -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref), v56 (ref)
                v39(l_EventNames_0.UnlockVoiceBtn);
                v28.openPhoneVerificationModal(v56);
            end;
            table.insert(v64, {
                id = v16.UnlockVoiceBtn, 
                text = v32.unlockVoice, 
                icon = v23, 
                onActivated = v67, 
                backgroundColor = v34.unlockVoice, 
                iconColor = v35, 
                extraId = v36
            });
        end;
        local function v68() --[[ Line: 326 ]]
            -- upvalues: v39 (ref), l_EventNames_0 (ref), v28 (ref), v29 (ref)
            v39(l_EventNames_0.MyProfileBtn);
            v28.openProfilePeekView((tostring(v29)));
        end;
        if v29 then
            table.insert(v64, {
                id = v16.CompleteProfileBtn, 
                text = v32.myProfile, 
                icon = v24, 
                onActivated = v68, 
                backgroundColor = v34.myProfile, 
                iconColor = v35, 
                extraId = v36
            });
        end;
        if l_contactImporterEnabled_0 then
            if v48 then
                table.insert(v64, {
                    id = v16.FindContactsBtn, 
                    text = v32.findContacts, 
                    icon = v20, 
                    onActivated = v55, 
                    backgroundColor = v34.findContacts, 
                    iconColor = v35, 
                    extraId = v36
                });
            else
                table.insert(v64, 1, {
                    id = v16.FindContactsBtn, 
                    text = v32.findContacts, 
                    icon = v20, 
                    onActivated = v55, 
                    backgroundColor = v34.findContacts, 
                    iconColor = v35, 
                    extraId = v36
                });
            end;
        end;
        return v64, {
            id = v16.AddFriendsBtn, 
            icon = v25, 
            backgroundColor = v34.addFriends, 
            iconColor = v35, 
            extraId = v36
        };
    end, {
        v27, 
        v28, 
        l_contactImporterEnabled_0, 
        v52, 
        v56, 
        v55, 
        v32, 
        v39, 
        v48, 
        v34, 
        v35, 
        v36, 
        v37
    });
    if v33 then
        if l_FFlagSocialBtnsFollowupExperiment_0 and v38 and v31 == l_LaunchContext_0.SignUp then
            return nil, v70;
        else
            return v69, v70;
        end;
    else
        return nil, nil;
    end;
end;