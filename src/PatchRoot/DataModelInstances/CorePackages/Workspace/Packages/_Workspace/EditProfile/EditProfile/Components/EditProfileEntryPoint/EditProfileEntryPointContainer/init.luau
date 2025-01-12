local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.NavigationRodux);
local l_NavigateToRoute_0 = v3.Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.UserProfiles);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.SharedFlags);
local v10 = require(script.Parent.EditProfileEntryPoint);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_ProfileScreens_0 = require(l_script_FirstAncestor_0.Common.Constants).ProfileScreens;
local v15 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local v16 = require(l_Parent_0.SocialLuaAnalytics);
local v17 = require(l_Parent_0.SocialStopwatch);
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v8.Hooks.useEffectOnMount;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local v24 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v25 = require(l_script_FirstAncestor_0.Networking.SocialLinksNetworking);
local v26 = require(l_Parent_0.SocialToast);
local l_LoadingStages_0 = v16.Analytics.Enums.LoadingStages;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v29 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local l_FFlagEditProfileAddLoadingTracker_0 = v9.FFlagEditProfileAddLoadingTracker;
local v32 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v32.EventNames;
local l_useAnalytics_0 = v32.useAnalytics;
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFetchUserInfoOnLoad);
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileAddOnEditField);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileUseSocialToast);
return function(v38) --[[ Line: 59 ]] --[[ Name: EditProfileEntryPointContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_ProfileScreens_0 (copy), v6 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v24 (copy), l_Players_0 (copy), v35 (copy), l_useLocalRobuxBalance_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useEffectOnMount_0 (copy), v15 (copy), l_useAnalytics_0 (copy), v36 (copy), l_useUserExperiment_0 (copy), v29 (copy), l_EventNames_0 (copy), v25 (copy), v37 (copy), v26 (copy), l_Images_0 (copy), l_NavigateToRoute_0 (copy), v7 (copy), l_FFlagEditProfileAddLoadingTracker_0 (copy), v17 (copy), l_LoadingStages_0 (copy), l_useEffectOnce_0 (copy), v10 (copy), v30 (copy)
    local v39 = l_useDispatch_0();
    local v40 = l_useLocalUserId_0();
    local v41 = "";
    local v42 = "";
    local v43 = true;
    local v44 = v38.navigation.getParam(l_ProfileScreens_0);
    local v45, v46 = v6.useState(false);
    local v48 = l_useSelector_0(function(v47) --[[ Line: 67 ]]
        -- upvalues: l_getDeepValue_0 (ref), v40 (copy)
        return l_getDeepValue_0(v47, (("Profile.AdditionalUserFields.%*.description"):format(v40)));
    end);
    local v49 = v24.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v50 = v24.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v51 = v50 and v50 ~= v24.Variants.Control;
    local v53 = if v49 then l_useSelector_0(function(v52) --[[ Line: 76 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v52, "Profile.SocialLinks.selfSocialLinks") or {};
    end) else nil;
    local v54 = if v49 and v51 and l_Players_0.LocalPlayer then l_Players_0.LocalPlayer:GetUnder13() else false;
    if v35 then
        v48 = "";
    end;
    local v55 = l_useLocalRobuxBalance_0();
    local v56 = v38.navigation.getParam("navigateToEditUsername");
    local function v57() --[[ Line: 92 ]]
        -- upvalues: v39 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v39(l_NavigateDown_0({
            {
                name = l_AppPage_0.PurchaseRobux
            }
        }));
    end;
    local v58, v59 = v6.useState(v48);
    if v35 then
        l_useEffectOnMount_0(function() --[[ Line: 100 ]]
            -- upvalues: v39 (copy), v15 (ref), v40 (copy), v59 (copy)
            v39(v15.GetUserV2FromUserId.API(v40)):andThen(function(v60) --[[ Line: 102 ]]
                -- upvalues: v59 (ref)
                v59(v60.responseBody.description or "");
            end):catch(function() --[[ Line: 105 ]]
                -- upvalues: v59 (ref)
                v59("");
            end);
        end);
    end;
    local v61 = l_useAnalytics_0();
    local v62 = nil;
    local v63 = nil;
    if v36 then
        local v64 = v38.navigation.getParam("onIdentityChange");
        local l_v64_0 = v64 --[[ copy: 23 -> 33 ]];
        v62 = v6.useCallback(function(v66) --[[ Line: 116 ]]
            -- upvalues: v59 (copy), l_v64_0 (copy)
            v59(v66);
            if l_v64_0 then
                l_v64_0();
            end;
        end, {
            v59, 
            v64
        });
        v63 = v6.useCallback(function(v67) --[[ Line: 123 ]]
            -- upvalues: v46 (copy), l_v64_0 (copy)
            v46(v67);
            if l_v64_0 then
                l_v64_0();
            end;
        end, {
            v46, 
            v64
        });
    end;
    local v69 = l_useUserExperiment_0({
        v29
    }, function(v68) --[[ Line: 131 ]]
        -- upvalues: v29 (ref)
        return (v68[v29] or {}).profile_picture_on;
    end);
    l_useEffectOnMount_0(function() --[[ Line: 136 ]]
        -- upvalues: v61 (copy), l_EventNames_0 (ref), v39 (copy), v15 (ref), v40 (copy), v46 (copy), v49 (copy), v51 (copy), v25 (ref)
        v61.fireAnalyticsEvent(l_EventNames_0.EditProfileOpened);
        v39(v15.GetDisplayNameValidation.API(v40, "Test")):andThen(function(_) --[[ Line: 141 ]]
            -- upvalues: v46 (ref)
            v46(true);
        end):catch(function(_) --[[ Line: 144 ]]

        end);
        if v49 and v51 then
            v39(v25.GetSelfSocialLinks.API({
                alwaysReturnUrls = false, 
                filterLink = false
            })):catch(function(_) --[[ Line: 148 ]]

            end);
        end;
    end);
    local v73 = nil;
    if v37 then
        v73 = v26.useOpenToast();
    end;
    local function v75(v74) --[[ Line: 158 ]] --[[ Name: showToast ]]
        -- upvalues: v37 (ref), v73 (ref), l_Images_0 (ref), v38 (copy), v44 (copy)
        if v37 then
            v73({
                toastTitle = v74, 
                iconImage = l_Images_0["icons/actions/accept"]
            });
            return;
        else
            v38.navigation.navigate(v44.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v74, 
                        iconImage = l_Images_0["icons/actions/accept"]
                    }
                }
            });
            return;
        end;
    end;
    local v76 = v38.testProp_openEditProfilePicture or function() --[[ Line: 177 ]]
        -- upvalues: v61 (copy), l_EventNames_0 (ref), v39 (copy), l_NavigateToRoute_0 (ref), l_AppPage_0 (ref)
        v61.fireAnalyticsEvent(l_EventNames_0.OpenAvatarMarketplace);
        v39(l_NavigateToRoute_0({
            {
                name = l_AppPage_0.Catalog
            }
        }));
    end;
    local v77 = v7.Hooks.useUserProfilesFetch({
        userIds = {
            v40
        }, 
        query = v7.Queries.userProfilesDisplayNameAndUsernameByUserIds
    });
    if v77.data then
        v41 = v7.Selectors.getUsernameFromId(v77.data, v40);
        v42 = v7.Selectors.getDisplayNameFromId(v77.data, v40);
        v43 = false;
    end;
    if l_FFlagEditProfileAddLoadingTracker_0 then
        v6.useEffect(function() --[[ Line: 197 ]]
            -- upvalues: v17 (ref), v61 (copy), l_EventNames_0 (ref), l_LoadingStages_0 (ref)
            local v78 = v17.Stopwatch.get(v17.Events.EditProfileOpened);
            v61.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
                status = l_LoadingStages_0.Fetching, 
                statValue = v78 and v78.timeElapsed
            });
            return function() --[[ Line: 204 ]]
                -- upvalues: v17 (ref)
                v17.Stopwatch.stop(v17.Events.EditProfileOpened);
            end;
        end, {});
        l_useEffectOnce_0(function() --[[ Line: 209 ]]
            -- upvalues: v17 (ref), v61 (copy), l_EventNames_0 (ref), v77 (copy), l_LoadingStages_0 (ref)
            local v79 = v17.Stopwatch.get(v17.Events.EditProfileOpened);
            v61.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
                status = if v77.data then l_LoadingStages_0.Done else l_LoadingStages_0.Failed, 
                statValue = v79 and v79.timeElapsed
            });
        end, v77.data or v77.error);
    end;
    local function v80() --[[ Line: 218 ]] --[[ Name: onClose ]]
        -- upvalues: v38 (copy)
        v38.navigation.pop();
    end;
    local function v81() --[[ Line: 222 ]] --[[ Name: openDisplayNameModal ]]
        -- upvalues: v61 (copy), l_EventNames_0 (ref), v45 (copy), v38 (copy), v44 (copy), v37 (ref), v75 (copy), v36 (ref), v63 (ref), v46 (copy), v42 (ref)
        if v61 then
            v61.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalOpened);
        end;
        if v45 then
            v38.navigation.navigate(v44.EditDisplayNameModal, {
                showToast = if v37 then nil else v75, 
                setDisplayNameAvailable = if v36 then v63 else v46, 
                displayName = v42
            });
            return;
        else
            v38.navigation.navigate(v44.EditDisplayNameErrorModal);
            return;
        end;
    end;
    local function v82() --[[ Line: 240 ]] --[[ Name: openEditUsername ]]
        -- upvalues: v61 (copy), l_EventNames_0 (ref), v55 (copy), v56 (copy), v75 (copy), v38 (copy), v44 (copy), v57 (copy)
        v61.fireAnalyticsEvent(l_EventNames_0.EditUsernameOpened);
        if v55 >= 1000 then
            v56(v75);
            return;
        else
            v38.navigation.navigate(v44.UsernameInsufficientFundsModal, {
                robux = 1000 - v55, 
                navigateDownToPurchaseRobux = v57
            });
            return;
        end;
    end;
    local function v83() --[[ Line: 254 ]] --[[ Name: openEditDescription ]]
        -- upvalues: v38 (copy), v44 (copy), v58 (copy), v36 (ref), v62 (ref), v59 (copy)
        v38.navigation.navigate(v44.EditDescriptionModal, {
            initialText = v58, 
            setDescription = if v36 then v62 else v59
        });
    end;
    local function v85(v84) --[[ Line: 263 ]] --[[ Name: openEditSocialLinksModal ]]
        -- upvalues: v49 (copy), v39 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v49 then
            v39(l_NavigateDown_0({
                name = l_AppPage_0.EditSocialNetworks, 
                extraProps = {
                    focusOn = v84
                }
            }));
        end;
    end;
    return v6.createElement(v10, {
        shouldShimmerName = v43, 
        username = v41, 
        displayName = v42, 
        description = v58, 
        localUserId = v40, 
        onClose = v80, 
        openDisplayNameModal = v81, 
        navigateToEditUsername = v82, 
        openEditDescription = v83, 
        openEditProfilePicture = if not not v30 or v69 then v76 else nil, 
        socialInfo = if v49 and v51 then v53 else nil, 
        openEditSocialLinksModal = if v49 and v51 then v85 else nil, 
        isUnder13 = if v49 and v51 then v54 else nil
    });
end;