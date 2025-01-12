local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Promise);
local l_UsersGetPresence_0 = require(l_Parent_0.UserLib).Requests.UsersGetPresence;
local v6 = require(l_Parent_0.UserProfiles);
local l_getCombinedNameFromId_0 = v6.Selectors.getCombinedNameFromId;
local l_PostSendExperienceInvite_0 = require(l_Parent_0.GameInvite).PostSendExperienceInvite;
local l_JoinExperience_0 = require(l_Parent_0.NotificationsCommon).JoinExperience;
local v10 = require(l_script_FirstAncestor_0.Enums.SocialContextToastDiagKeys);
local v11 = require(l_script_FirstAncestor_0.Actions.SetToastContent);
local v12 = require(l_script_FirstAncestor_0.Actions.SetConfirmationModal);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local v15 = require(l_script_FirstAncestor_0.Enums.SocialContextToastAnalyticsActionTypes);
local v16 = require(l_script_FirstAncestor_0.SocialContextToastEvents);
local l_DEPRECATED_FriendsGetFriendStatuses_0 = require(l_Parent_0.Http).Requests.DEPRECATED_FriendsGetFriendStatuses;
local l_GetFFlagShowSocialContextToastToAll_0 = require(l_Parent_0.SharedFlags).GetFFlagShowSocialContextToastToAll;
local l_SocialContextToastIxpConfig_0 = require(l_Parent_0.SharedFlags).SocialContextToastIxpConfig;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local v21 = game:DefineFastFlag("FriendJoinedYouFallbackEnabled", false);
local v22 = game:DefineFastInt("SocialContextToastDelay", 10);
local function _(v23) --[[ Line: 46 ]] --[[ Name: canShowToasts ]]
    -- upvalues: l_GetFFlagShowSocialContextToastToAll_0 (copy)
    if l_GetFFlagShowSocialContextToastToAll_0() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
            -- upvalues: v23 (copy)
            return v23:GetLayerData("PlayerApp.GameJoin.UX");
        end);
        if l_status_0 and l_result_0 and l_result_0.IsInformationalSCTEnabled then
            return true;
        else
            return false;
        end;
    end;
end;
local function v36(v27, v28) --[[ Line: 62 ]] --[[ Name: getNames ]]
    -- upvalues: v4 (copy), v6 (copy), l_getCombinedNameFromId_0 (copy)
    local v29 = {};
    for v30 = 1, #v28 do
        v29[v30] = tostring(v28[v30]);
    end;
    return v4.new(function(v31, _) --[[ Line: 67 ]]
        -- upvalues: v27 (copy), v6 (ref), v29 (copy), v28 (copy), l_getCombinedNameFromId_0 (ref)
        v27:query({
            query = v6.Queries.userProfilesAllNamesByUserIds, 
            variables = {
                userIds = v29
            }
        }):andThen(function(v33) --[[ Line: 75 ]]
            -- upvalues: v28 (ref), l_getCombinedNameFromId_0 (ref), v31 (copy)
            local v34 = {};
            for v35 = 1, #v28 do
                table.insert(v34, {
                    userId = v28[v35], 
                    name = l_getCombinedNameFromId_0(v33.data, v28[v35])
                });
            end;
            v31(v34);
        end);
    end);
end;
local function _(v37, v38, v39) --[[ Line: 88 ]] --[[ Name: sortFriendsList ]]
    -- upvalues: v3 (copy)
    if not v39 then
        return v37;
    else
        v37 = v3.List.removeValue(v37, v38);
        table.insert(v37, 1, v38);
        return v37;
    end;
end;
local function v50(v41, v42, v43, v44, v45, v46, v47) --[[ Line: 98 ]] --[[ Name: showYouJoinedFriendsToast ]]
    -- upvalues: v11 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v3 (copy), v36 (copy)
    if #v44 == 0 then
        return v42(v11(nil));
    else
        v41.analytics.Diag:reportCounter(v10.YouJoinedFriends, 1);
        if l_GetFFlagSocialContextToastEventStream_0() then
            v16(v41.eventIngest, {
                toastType = v14.YouJoinedFriends, 
                friendId = table.concat(v44, ","), 
                universeId = v46, 
                placeId = v47, 
                actionType = v15.Shown
            });
        end;
        if v43 > 0 then
            local l_v44_0 = v44;
            if not v45 then
                v44 = l_v44_0;
            else
                l_v44_0 = v3.List.removeValue(l_v44_0, v43);
                table.insert(l_v44_0, 1, v43);
                v44 = l_v44_0;
            end;
        end;
        return v36(v41.apolloClient, v44):andThen(function(v49) --[[ Line: 125 ]]
            -- upvalues: v42 (copy), v11 (ref), v14 (ref)
            v42(v11({
                toastType = v14.YouJoinedFriends, 
                userList = v49
            }));
        end);
    end;
end;
local function v73(v51, v52, v53, v54, v55, v56) --[[ Line: 133 ]] --[[ Name: handleFollowedPlayerDisconnected ]]
    -- upvalues: l_UsersGetPresence_0 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v36 (copy), v11 (copy), l_SocialContextToastIxpConfig_0 (copy), v12 (copy), l_JoinExperience_0 (copy), v50 (copy), l_PostSendExperienceInvite_0 (copy)
    local l_analytics_0 = v51.analytics;
    local l_networking_0 = v51.networking;
    l_UsersGetPresence_0(l_networking_0, {
        v53
    }):andThen(function(v59) --[[ Line: 136 ]]
        -- upvalues: v55 (copy), l_analytics_0 (copy), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v51 (copy), v14 (ref), v53 (copy), v56 (copy), v15 (ref), v36 (ref), v52 (copy), v11 (ref), l_SocialContextToastIxpConfig_0 (ref), v12 (ref), l_JoinExperience_0 (ref), v50 (ref), v54 (copy), l_PostSendExperienceInvite_0 (ref)
        if not v59.responseBody or not v59.responseBody.userPresences or #v59.responseBody.userPresences == 0 then
            return;
        else
            local v60 = v59.responseBody.userPresences[1];
            local l_universeId_0 = v60.universeId;
            if tostring(l_universeId_0) == tostring(v55) then
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherPlace, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v51.eventIngest, {
                        toastType = v14.FriendInNonRootPlace, 
                        friendId = tostring(v53), 
                        universeId = v55, 
                        placeId = v56, 
                        actionType = v15.Shown
                    });
                end;
                return v36(v51.apolloClient, {
                    v53
                }):andThen(function(v62) --[[ Line: 161 ]]
                    -- upvalues: v52 (ref), v11 (ref), v14 (ref), v53 (ref)
                    if #v62 == 0 then
                        return;
                    else
                        v52(v11({
                            toastType = v14.FriendInNonRootPlace, 
                            joinerUserId = v53, 
                            joinerName = v62[1].name
                        }));
                        return;
                    end;
                end);
            elseif l_universeId_0 ~= nil then
                if l_SocialContextToastIxpConfig_0.CheckIsActionableToastEnabled() then
                    l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherUniverse, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v51.eventIngest, {
                            toastType = v14.FollowYourFriend, 
                            friendId = tostring(v53), 
                            universeId = v55, 
                            placeId = v56, 
                            actionType = v15.Shown
                        });
                    end;
                    local function v65(v63) --[[ Line: 183 ]] --[[ Name: closeCallback ]]
                        -- upvalues: v52 (ref), v12 (ref), l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v51 (ref), v53 (ref), v55 (ref), v56 (ref), v15 (ref), v60 (copy), l_JoinExperience_0 (ref)
                        if not v63 then
                            v52(v12(false));
                            return;
                        else
                            l_analytics_0.Diag:reportCounter(v10.ConfirmLeaveGameButtonClicked, 1);
                            if l_GetFFlagSocialContextToastEventStream_0() then
                                v16(v51.eventIngest, {
                                    toastType = "LeaveGameConfirmationModal", 
                                    friendId = tostring(v53), 
                                    universeId = v55, 
                                    placeId = v56, 
                                    actionType = v15.ButtonClicked
                                });
                            end;
                            local v64 = string.format("roblox://userid=%s&placeid=%s", tostring(v53), v60.placeId);
                            l_JoinExperience_0(v64, true);
                            return;
                        end;
                    end;
                    local function v66() --[[ Line: 206 ]] --[[ Name: onJoinFriendButtonClick ]]
                        -- upvalues: l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v51 (ref), v14 (ref), v53 (ref), v55 (ref), v56 (ref), v15 (ref), v52 (ref), v12 (ref), v65 (copy)
                        l_analytics_0.Diag:reportCounter(v10.JoinFriendButtonClicked, 1);
                        if l_GetFFlagSocialContextToastEventStream_0() then
                            v16(v51.eventIngest, {
                                toastType = v14.FollowYourFriend, 
                                friendId = tostring(v53), 
                                universeId = v55, 
                                placeId = v56, 
                                actionType = v15.ButtonClicked
                            });
                        end;
                        v52(v12(true, v65));
                    end;
                    return v36(v51.apolloClient, {
                        v53
                    }):andThen(function(v67) --[[ Line: 220 ]]
                        -- upvalues: v52 (ref), v11 (ref), v14 (ref), v53 (ref), v60 (copy), v66 (copy)
                        if #v67 == 0 then
                            return;
                        else
                            v52(v11({
                                toastType = v14.FollowYourFriend, 
                                joinerUserId = v53, 
                                joinerName = v67[1].name, 
                                experienceName = v60.lastLocation, 
                                onActivated = v66
                            }));
                            return;
                        end;
                    end);
                else
                    return v50(v51, v52, v53, v54, false, v55, v56);
                end;
            elseif l_SocialContextToastIxpConfig_0.CheckIsActionableToastEnabled() then
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendNotInGame, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v51.eventIngest, {
                        toastType = v14.InviteBack, 
                        friendId = tostring(v53), 
                        universeId = v55, 
                        placeId = v56, 
                        actionType = v15.Shown
                    });
                end;
                local function v70() --[[ Line: 247 ]] --[[ Name: onInviteBackButtonClick ]]
                    -- upvalues: l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v51 (ref), v14 (ref), v53 (ref), v55 (ref), v56 (ref), v15 (ref), l_PostSendExperienceInvite_0 (ref), v52 (ref), v11 (ref)
                    l_analytics_0.Diag:reportCounter(v10.InviteBackButtonClicked, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v51.eventIngest, {
                            toastType = v14.InviteBack, 
                            friendId = tostring(v53), 
                            universeId = v55, 
                            placeId = v56, 
                            actionType = v15.ButtonClicked
                        });
                    end;
                    l_PostSendExperienceInvite_0(v51.networking, tostring(v53), tostring(v56), "SocialContextToast"):andThen(function(_) --[[ Line: 263 ]]
                        -- upvalues: v52 (ref), v11 (ref), v14 (ref)
                        v52(v11({
                            toastType = v14.InviteSuccess
                        }));
                    end, function(_) --[[ Line: 267 ]]
                        -- upvalues: v52 (ref), v11 (ref), v14 (ref)
                        v52(v11({
                            toastType = v14.InviteFailure
                        }));
                    end);
                end;
                return v36(v51.apolloClient, {
                    v53
                }):andThen(function(v71) --[[ Line: 275 ]]
                    -- upvalues: v52 (ref), v11 (ref), v14 (ref), v53 (ref), v70 (copy)
                    if #v71 == 0 then
                        return;
                    else
                        v52(v11({
                            toastType = v14.InviteBack, 
                            joinerUserId = v53, 
                            joinerName = v71[1].name, 
                            onActivated = v70
                        }));
                        return;
                    end;
                end);
            else
                return v50(v51, v52, v53, v54, false, v55, v56);
            end;
        end;
    end, function(_) --[[ Line: 291 ]]
        -- upvalues: l_analytics_0 (copy), v10 (ref)
        l_analytics_0.Diag:reportCounter(v10.ErrorFetchingPresence, 1);
    end);
end;
SocialContextToastDispatcher = function(v74) --[[ Line: 297 ]] --[[ Name: SocialContextToastDispatcher ]]
    -- upvalues: v2 (copy), l_useDispatch_0 (copy), l_DEPRECATED_FriendsGetFriendStatuses_0 (copy), v73 (copy), v50 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v36 (copy), v21 (copy), v11 (copy), v22 (copy), l_GetFFlagShowSocialContextToastToAll_0 (copy)
    local l_services_0 = v74.services;
    local l_analytics_1 = l_services_0.analytics;
    local l_playersService_0 = l_services_0.playersService;
    local l_ixpService_0 = l_services_0.ixpService;
    local v79 = v2.createRef();
    local l_networking_1 = l_services_0.networking;
    local v81 = v2.useRef(nil);
    local v82 = l_useDispatch_0();
    local function v94() --[[ Line: 309 ]] --[[ Name: showToastOnJoin ]]
        -- upvalues: l_playersService_0 (copy), l_DEPRECATED_FriendsGetFriendStatuses_0 (ref), l_networking_1 (copy), v73 (ref), l_services_0 (copy), v82 (copy), v74 (copy), v50 (ref)
        local l_FollowUserId_0 = l_playersService_0.LocalPlayer.FollowUserId;
        local v84 = false;
        local v85 = {};
        local v86 = {};
        for _, v88 in pairs(l_playersService_0:GetPlayers()) do
            table.insert(v86, v88.UserId);
        end;
        l_DEPRECATED_FriendsGetFriendStatuses_0(l_networking_1, v86):andThen(function(v89) --[[ Line: 321 ]]
            -- upvalues: l_FollowUserId_0 (copy), v84 (ref), v85 (copy), v73 (ref), l_services_0 (ref), v82 (ref), v74 (ref), v50 (ref)
            if v89 and v89.responseBody and v89.responseBody.data then
                local l_data_0 = v89.responseBody.data;
                for _, v92 in pairs(l_data_0) do
                    local l_id_0 = v92.id;
                    if l_id_0 == l_FollowUserId_0 then
                        v84 = true;
                    end;
                    if v92.status == "Friends" then
                        table.insert(v85, l_id_0);
                    end;
                end;
                if l_FollowUserId_0 > 0 and not v84 then
                    return v73(l_services_0, v82, l_FollowUserId_0, v85, v74.gameId, v74.placeId);
                else
                    return v50(l_services_0, v82, l_FollowUserId_0, v85, v84, v74.gameId, v74.placeId);
                end;
            else
                return;
            end;
        end);
    end;
    local function v102(v95) --[[ Line: 357 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: l_playersService_0 (copy), l_analytics_1 (copy), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), l_services_0 (copy), v14 (ref), v74 (copy), v15 (ref), v36 (ref), v21 (ref), v82 (copy), v11 (ref)
        local l_LocalPlayer_0 = l_playersService_0.LocalPlayer;
        if v95.FollowUserId == l_LocalPlayer_0.UserId then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 360 ]]
                -- upvalues: l_LocalPlayer_0 (copy), v95 (copy)
                return l_LocalPlayer_0:IsFriendsWith(v95.UserId);
            end);
            if l_status_1 and l_result_1 then
                l_analytics_1.Diag:reportCounter(v10.YouWereFollowed, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(l_services_0.eventIngest, {
                        toastType = v14.FriendJoinedYou, 
                        friendId = tostring(v95.UserId), 
                        universeId = v74.gameId, 
                        placeId = v74.placeId, 
                        actionType = v15.Shown
                    });
                end;
                local v99 = {
                    v95.UserId
                };
                v36(l_services_0.apolloClient, v99):andThen(function(v100) --[[ Line: 378 ]]
                    -- upvalues: v21 (ref), v95 (copy), v82 (ref), v11 (ref), v14 (ref)
                    local l_name_0 = v100[1].name;
                    if v21 and l_name_0 == nil then
                        l_name_0 = v95.DisplayName;
                    end;
                    v82(v11({
                        toastType = v14.FriendJoinedYou, 
                        joinerUserId = v95.UserId, 
                        joinerName = l_name_0
                    }));
                end);
            end;
        end;
    end;
    v2.useEffect(function() --[[ Line: 394 ]]
        -- upvalues: v22 (ref), l_ixpService_0 (copy), l_GetFFlagShowSocialContextToastToAll_0 (ref), v79 (copy), l_playersService_0 (copy), v94 (copy), v81 (copy), v102 (copy)
        task.delay(v22, function() --[[ Line: 397 ]]
            -- upvalues: l_ixpService_0 (ref), l_GetFFlagShowSocialContextToastToAll_0 (ref), v79 (ref), l_playersService_0 (ref), v94 (ref), v81 (ref), v102 (ref)
            local l_l_ixpService_0_0 = l_ixpService_0;
            local v104;
            if l_GetFFlagShowSocialContextToastToAll_0() then
                v104 = true;
            else
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 51 ]]
                    -- upvalues: l_l_ixpService_0_0 (copy)
                    return l_l_ixpService_0_0:GetLayerData("PlayerApp.GameJoin.UX");
                end);
                v104 = l_status_2 and l_result_2 and l_result_2.IsInformationalSCTEnabled and true or false;
            end;
            if not v104 then
                return;
            else
                if not v79.current then
                    if #l_playersService_0:GetPlayers() > 0 then
                        v94();
                    end;
                    v81.current = l_playersService_0.PlayerAdded:Connect(v102);
                end;
                return;
            end;
        end);
        return function() --[[ Line: 413 ]]
            -- upvalues: v79 (ref), v81 (ref)
            v79.current = true;
            if v81.current then
                v81.current:disconnect();
            end;
        end;
    end, {});
end;
return SocialContextToastDispatcher;