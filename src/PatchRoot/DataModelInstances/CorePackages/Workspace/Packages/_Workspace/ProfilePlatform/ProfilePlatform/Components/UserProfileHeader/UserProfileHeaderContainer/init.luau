local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.SetAlias);
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingUsers);
local l_useEffectOnce_0 = v5.Hooks.useEffectOnce;
local l_Constants_0 = v3.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_useNavigation_0 = v4.useNavigation;
local _ = require(l_script_FirstAncestor_0.Contexts.ProfileWrapperContext);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v18 = require(l_Parent_0.SocialStopwatch);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v20 = require(l_script_FirstAncestor_0.Common.Enums);
local v21 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v22 = require(l_Parent_0.RobloxAppHooks);
local v23 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v24 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v25 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v26 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileHeader);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local l_useLocalUserId_0 = v22.useLocalUserId;
local v30 = require(script.Parent.useProfileHeaderInfoFromJson);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableUserProfileSettings);
local function _(v32, v33, v34) --[[ Line: 49 ]]
    local v35 = v32.names.primaryName or "";
    if v33.profileUserNickname and v34 and v33.profileUserNickname ~= "" then
        return v33.profileUserNickname .. " (" .. v35 .. ")";
    else
        return v35;
    end;
end;
return function(v37) --[[ Line: 66 ]] --[[ Name: UserProfileHeaderContainer ]]
    -- upvalues: v25 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v2 (copy), v23 (copy), l_useLocalUserId_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v30 (copy), v20 (copy), v24 (copy), v18 (copy), v6 (copy), l_dependencyArray_0 (copy), l_useEffectOnce_0 (copy), v7 (copy), v31 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v21 (copy), l_UrlBuilder_0 (copy), v26 (copy)
    local v38 = v25();
    local v39 = l_useNavigation_0();
    local v40 = l_useDispatch_0();
    local v41 = v2.useRef(false);
    local v42 = v23();
    local l_profileUserId_0 = v38.profileUserId;
    local v44 = l_useLocalUserId_0();
    local v46 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v45) --[[ Line: 77 ]]
        return v45.getFriendRequestNicknamesEnabled();
    end) else false;
    local v47 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileUserId_0, l_Constants_0.RbxthumbTypes.Avatar, 720);
    local v48 = v30();
    local v50 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v48 (copy), v20 (ref), v42 (copy), v24 (ref), v41 (copy), v39 (copy), v18 (ref), l_profileUserId_0 (copy), v6 (ref)
        if not v48.editName then
            return;
        elseif v48.editName.field == v20.NameTypes.DisplayName then
            v42.fireAnalyticsEvent(v24.EditDisplayNameButton, {
                canSetDisplayName = v41.current
            });
            if v41.current then
                v39.navigate(v20.Screens.EditDisplayNameModal, {
                    showToast = function() --[[ Line: 99 ]] --[[ Name: showToast ]]

                    end, 
                    setDisplayNameAvailable = function(v49) --[[ Line: 102 ]] --[[ Name: setDisplayNameAvailable ]]
                        -- upvalues: v41 (ref)
                        v41.current = v49;
                    end, 
                    displayName = v48.names.primaryName
                });
                return;
            else
                v39.navigate(v20.Screens.EditDisplayNameErrorModal);
                return;
            end;
        else
            v18.Stopwatch.start(v18.Events.CustomizeNameOpened);
            v42.fireAnalyticsEvent(v24.SetAliasButton);
            v39.navigate(v20.Screens.SetAliasModal, {
                profileUserId = l_profileUserId_0, 
                origin = v6.Analytics.EntryPoints.ProfileCardName
            });
            return;
        end;
    end, l_dependencyArray_0(v39, v48.editName, v48.names));
    l_useEffectOnce_0(function() --[[ Line: 120 ]]
        -- upvalues: v40 (copy), v7 (ref), l_profileUserId_0 (copy), v41 (copy)
        local function _() --[[ Line: 121 ]]
            -- upvalues: v40 (ref), v7 (ref), l_profileUserId_0 (ref)
            return v40(v7.GetDisplayNameValidation.API(l_profileUserId_0, "testName"));
        end;
        v40(v7.GetDisplayNameValidation.API(l_profileUserId_0, "testName")):andThen(function() --[[ Line: 126 ]]
            -- upvalues: v41 (ref)
            v41.current = true;
        end):catch(function() --[[ Line: 129 ]]
            -- upvalues: v41 (ref)
            v41.current = false;
        end);
    end, v48.editName and v48.editName.field == v20.NameTypes.DisplayName);
    local v52 = v48.counts ~= nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if v48.counts then
        v53 = v48.counts.followersCount;
        v54 = v48.counts.followingsCount;
        v55 = v48.counts.friendsCount;
    end;
    local v56 = nil;
    local v57 = nil;
    if v31 then
        v56 = v48.userProfileSettings ~= nil;
        if v56 then
            v57 = v48.userProfileSettings.isInExperienceNameEnabled;
        end;
    end;
    local v58 = v2.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v42 (copy), v24 (ref), v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileUserId_0 (copy), v21 (ref)
        v42.fireAnalyticsEvent(v24.FollowersButton);
        v40(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = string.format("%susers/%s/friends#!/followers", l_Url_0.BASE_URL, l_profileUserId_0), 
            extraProps = {
                titleKey = v21.Followers
            }
        }, nil));
    end, l_dependencyArray_0(v40, l_profileUserId_0, v42));
    local v59 = v2.useCallback(function() --[[ Line: 161 ]]
        -- upvalues: v42 (copy), v24 (ref), v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileUserId_0 (copy), v21 (ref)
        v42.fireAnalyticsEvent(v24.FollowingsButton);
        v40(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = string.format("%susers/%s/friends#!/following", l_Url_0.BASE_URL, l_profileUserId_0), 
            extraProps = {
                titleKey = v21.Following
            }
        }, nil));
    end, l_dependencyArray_0(v40, l_profileUserId_0, v42));
    local v60 = v2.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v42 (copy), v24 (ref), l_profileUserId_0 (copy), v44 (copy), v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v21 (ref)
        v42.fireAnalyticsEvent(v24.FriendsButton);
        if l_profileUserId_0 == tostring(v44) then
            v40(l_NavigateDown_0({
                name = l_AppPage_0.ViewFriends, 
                extraProps = {
                    navigateToFriendsLandingEventStart = {
                        startPage = l_AppPage_0.ProfilePeekView, 
                        startTime = os.clock()
                    }
                }
            }, nil));
            return;
        else
            v40(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = l_UrlBuilder_0.user.friends({
                    userId = l_profileUserId_0
                }), 
                extraProps = {
                    titleKey = v21.Friends
                }
            }, nil));
            return;
        end;
    end, l_dependencyArray_0(v40, l_profileUserId_0, v44, v42));
    local l_createElement_0 = v2.createElement;
    local l_v26_0 = v26;
    local v63 = {
        userThumbnail = v47, 
        layoutOrder = v37.layoutOrder, 
        openEditName = if v48.editName then v50 else nil, 
        openFollowers = v58, 
        openFollowings = v59, 
        openFriends = v60
    };
    local v64 = v48.names.primaryName or "";
    v63.primaryName = if v38.profileUserNickname and v46 and v38.profileUserNickname ~= "" then v38.profileUserNickname .. " (" .. v64 .. ")" else v64;
    v63.username = v48.names.username;
    v63.isPremium = v48.isPremium;
    v63.isVerified = v48.isVerified;
    v63.isEdited = v48.editName and v48.editName.isEdited;
    v63.shouldDisplayUserProfileSettings = v56;
    v63.isInExperienceNameEnabled = v57;
    v63.shouldDisplayCounts = v52;
    v63.followersCount = v53;
    v63.followingsCount = v54;
    v63.friendsCount = v55;
    return l_createElement_0(l_v26_0, v63);
end;