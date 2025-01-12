local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(script.Parent.EditDisplayNameModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_writeNamesQuery_0 = v4.Mutations.writeNamesQuery;
local v7 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v8 = require(l_Parent_0.UIBlox);
local v9 = v7.SocialLibraries.config({});
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_getDeepValue_0 = v9.Dictionary.getDeepValue;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v14 = require(l_Parent_0.SocialToast);
local v15 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v17 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_Images_0 = v8.App.ImageSet.Images;
local v19 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v19.EventNames;
local l_useAnalytics_0 = v19.useAnalytics;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileUseSocialToast);
local v24 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
return function(v25) --[[ Line: 45 ]] --[[ Name: EditDisplayNameModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v23 (copy), v14 (copy), l_useAnalytics_0 (copy), l_useEffectOnMount_0 (copy), l_EventNames_0 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (copy), v24 (copy), l_useLocalization_0 (copy), v17 (copy), l_useLocalUserId_0 (copy), v4 (copy), v15 (copy), l_writeNamesQuery_0 (copy), l_getDeepValue_0 (copy), l_Images_0 (copy), v3 (copy), v1 (copy)
    local v26 = l_useDispatch_0();
    local v27 = l_useScreenSize_0();
    local v28 = v25.navigation.getParam("showToast");
    local v29 = v25.navigation.getParam("setDisplayNameAvailable");
    local v30 = nil;
    if v23 then
        v30 = v14.useOpenToast();
    end;
    local v31 = l_useAnalytics_0();
    l_useEffectOnMount_0(function() --[[ Line: 58 ]]
        -- upvalues: v31 (copy), l_EventNames_0 (ref)
        v31.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalLoaded);
    end);
    local v32 = nil;
    local v33 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v32 = v24();
    else
        v33 = l_useLocalization_0({
            DisplayNameModalCaption = v17.DisplayNameModalCaption, 
            EditDisplayName = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v17.EditDisplayName, 
            Toast = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v17.DisplayNameUpdated
        });
    end;
    local v34 = l_useLocalUserId_0();
    local v35 = v25.navigation.getParam("displayName");
    local v36 = nil;
    local v37 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v34
        }, 
        query = v4.Queries.userProfilesAllNamesByUserIds
    });
    if v37.data then
        v36 = v4.Selectors.getUserProfileFromId(v37.data, v34);
    end;
    local function v38() --[[ Line: 87 ]] --[[ Name: cancelOnActivated ]]
        -- upvalues: v25 (copy)
        v25.navigation.goBack();
    end;
    local function v41(v39) --[[ Line: 91 ]] --[[ Name: saveDisplayName ]]
        -- upvalues: v26 (copy), v15 (ref), v34 (copy), l_writeNamesQuery_0 (ref), v37 (copy), v4 (ref), l_getDeepValue_0 (ref), v36 (ref), v31 (copy), l_EventNames_0 (ref), v25 (copy), v23 (ref), v30 (ref), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v32 (ref), v33 (ref), l_Images_0 (ref), v28 (copy), v29 (copy)
        return v26(v15.SetDisplayName.API(v34, v39)):andThen(function(_) --[[ Line: 92 ]]
            -- upvalues: l_writeNamesQuery_0 (ref), v37 (ref), v4 (ref), v34 (ref), l_getDeepValue_0 (ref), v36 (ref), v39 (copy), v31 (ref), l_EventNames_0 (ref), v25 (ref), v23 (ref), v30 (ref), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v32 (ref), v33 (ref), l_Images_0 (ref), v28 (ref), v29 (ref)
            l_writeNamesQuery_0({
                client = v37.client, 
                query = v4.Queries.userProfilesAllNamesByUserIds, 
                userId = v34, 
                names = {
                    alias = l_getDeepValue_0(v36, "names.alias"), 
                    contactName = l_getDeepValue_0(v36, "names.contactName"), 
                    displayName = v39, 
                    username = l_getDeepValue_0(v36, "names.username")
                }
            });
            v31.fireAnalyticsEvent(l_EventNames_0.DisplayNameSaved, {
                displayName = v39
            });
            v25.navigation.goBack();
            if v23 then
                v30({
                    toastTitle = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v32.displayNameUpdatedMessage else v33.Toast, 
                    iconImage = l_Images_0["icons/actions/accept"]
                });
            else
                v28(if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v32.displayNameUpdatedMessage else v33.Toast);
            end;
            v29(false);
        end);
    end;
    local function v43(v42) --[[ Line: 129 ]] --[[ Name: validateDisplayName ]]
        -- upvalues: v26 (copy), v15 (ref), v34 (copy)
        return v26(v15.GetDisplayNameValidation.API(v34, v42));
    end;
    return v3.createElement(v1, {
        screenSize = v27, 
        title = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v32.displayNameEditMessage else v33.EditDisplayName, 
        description = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v32.displayNameCaption else v33.DisplayNameCaption, 
        initialText = v35, 
        localUserId = v34, 
        cancelOnActivated = v38, 
        saveOnActivated = v41, 
        validateDisplayName = v43
    });
end;