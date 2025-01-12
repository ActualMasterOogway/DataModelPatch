local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v7 = require(script.Parent.useRelationshipSelector);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v11 = require(l_Parent_0.RoactUtils);
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence).Enums.PresenceType;
local v13 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_useJoinUserInExperience_0 = require(l_Parent_0.SocialExperienceJoin).useJoinUserInExperience;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v20 = require(l_script_FirstAncestor_0.Utils.PresenceHelpers);
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_FFlagBlendedSerpUserPresenceExperiment_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceExperiment;
return function(v23, v24) --[[ Line: 46 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useStyle_0 (copy), l_useJoinUserInExperience_0 (copy), l_Contexts_0 (copy), l_Images_0 (copy), l_FFlagBlendedSerpUserPresenceExperiment_0 (copy), v20 (copy), l_PresenceType_0 (copy), v13 (copy), l_SetCurrentToastMessage_0 (copy), v8 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Enums_0 (copy)
    local v25 = l_useLocalUserId_0();
    local v26 = l_useDispatch_0();
    local v27 = v7(v23.userId);
    local v28 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v29 = l_useStyle_0();
    local v30 = l_useJoinUserInExperience_0(v23.userId, {
        analyticProps = {
            context = l_Contexts_0.PlayerSearch, 
            subpage = v23.subpage
        }
    });
    local v31 = if v23.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendAdd"];
    local v32 = if v23.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendpending"];
    local v33 = l_Images_0["icons/common/play"];
    if v27.status == Enum.FriendStatus.Friend and v23.shouldUseCompactTiles and if l_FFlagBlendedSerpUserPresenceExperiment_0 then v20.isUserInGame(v23.userPresence) else v23.userPresence and v23.userPresence.userPresenceType == l_PresenceType_0.InGame and v23.userPresence.universeId then
        return {
            {
                icon = v33, 
                isSecondary = false, 
                isDisabled = v30.isLoading, 
                onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                    -- upvalues: v30 (copy)
                    v30.joinExperience();
                end, 
                imageColor = v29.Theme.ContextualPrimaryContent.Color, 
                backgroundColor = v29.Theme.OnlineStatus.Color
            }
        };
    elseif v27.isMyself or v27.status == Enum.FriendStatus.Friend then
        return nil;
    elseif v27.status == Enum.FriendStatus.FriendRequestReceived then
        return {
            {
                icon = v31, 
                isSecondary = false, 
                isDisabled = false, 
                onActivated = function() --[[ Line: 103 ]] --[[ Name: onActivated ]]
                    -- upvalues: v26 (copy), v13 (ref), v23 (copy), v25 (copy), l_SetCurrentToastMessage_0 (ref), v24 (copy), v8 (ref)
                    v26(v13.AcceptFriendRequestFromUserId.API({
                        targetUserId = v23.userId, 
                        currentUserId = v25
                    })):andThen(function() --[[ Line: 108 ]]
                        -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                        v26(l_SetCurrentToastMessage_0({
                            toastMessage = "Feature.AddFriends.Action.FriendAdded"
                        }));
                    end):catch(function() --[[ Line: 113 ]]
                        -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                        v26(l_SetCurrentToastMessage_0({
                            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                        }));
                    end);
                    if v24 then
                        v24(v8.PlayerFriendAccept);
                    end;
                end
            }
        };
    elseif v27.status == Enum.FriendStatus.FriendRequestSent then
        return {
            {
                icon = v32, 
                isSecondary = false, 
                isDisabled = true, 
                onActivated = v2.noop()
            }
        };
    elseif not v27.status or v27.status == Enum.FriendStatus.NotFriend then
        return {
            {
                icon = v31, 
                isSecondary = false, 
                isDisabled = false, 
                onActivated = function() --[[ Line: 139 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_FriendRequestNicknamesIXP_0 (ref), v28 (copy), v24 (copy), v8 (ref), v26 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v23 (copy), l_Enums_0 (ref), v13 (ref), v25 (copy), l_SetCurrentToastMessage_0 (ref)
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v28 then
                        if v24 then
                            v24(v8.PlayerFriendRequest);
                        end;
                        v26(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = v23.userId, 
                                    source = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                                }
                            }
                        }));
                        return;
                    else
                        v26(v13.RequestFriendshipFromUserId.API({
                            targetUserId = v23.userId, 
                            currentUserId = v25, 
                            friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                        })):andThen(function() --[[ Line: 159 ]]
                            -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                            v26(l_SetCurrentToastMessage_0({
                                toastMessage = "Feature.Friends.Action.FriendRequestSent"
                            }));
                        end):catch(function() --[[ Line: 164 ]]
                            -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                            v26(l_SetCurrentToastMessage_0({
                                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                            }));
                        end);
                        if v24 then
                            v24(v8.PlayerFriendRequest);
                        end;
                        return;
                    end;
                end
            }
        };
    else
        return nil;
    end;
end;