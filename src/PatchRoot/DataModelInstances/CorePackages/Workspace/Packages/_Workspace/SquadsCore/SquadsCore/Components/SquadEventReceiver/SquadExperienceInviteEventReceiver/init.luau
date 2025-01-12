local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v5 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v7 = require(l_script_FirstAncestor_0.Logger);
local v8 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v9 = require(l_script_FirstAncestor_0.RoduxSquads);
local v10 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v11 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadParentChannelId);
local v12 = require(l_Parent_0.Cryo);
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v15 = require(l_Parent_0.React);
local v16 = require(l_Parent_0.RealtimeDelivery);
local v17 = require(l_Parent_0.SharedFlags);
local v18 = require(l_Parent_0.SoundManager);
local v19 = require(l_Parent_0.ToastNotification);
local v20 = require(l_Parent_0.ToastNotificationsProtocol);
local v21 = require(l_Parent_0.LuauPolyfill);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_clearInterval_0 = v21.clearInterval;
local l_setInterval_0 = v21.setInterval;
local l_ExperienceInviteState_0 = v9.Enums.ExperienceInviteState;
local l_ExperienceInviteVoteType_0 = v9.Enums.ExperienceInviteVoteType;
local l_Sounds_0 = v18.Sounds;
local l_SoundManager_0 = v18.SoundManager;
local v32 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v33 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_LifecycleEvents_0 = v19.LifecycleEvents;
local l_NotificationTypeEnum_0 = v19.ToastNotificationTypeModule.NotificationTypeEnum;
local v36 = game:DefineFastFlag("SquadExperienceInviteLifecycleAndActionRecover", false);
local v37 = game:DefineFastFlag("SquadExperienceInviteTimerRecover", false);
local v38 = game:DefineFastFlag("SquadExperienceInviteExpireWhenMissing", false);
local v39 = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4);
local v40 = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30);
local l_FFlagDebugSquadLogsEnabled_0 = v17.FFlagDebugSquadLogsEnabled;
local l_FFlagPassDownSquadExpInvGameOrigin_0 = v17.FFlagPassDownSquadExpInvGameOrigin;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "userActionOnToastNotification");
local function _(v44) --[[ Line: 69 ]]
    -- upvalues: l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy)
    if l_FFlagDebugSquadLogsEnabled_0 then
        return l_HttpService_0:JSONEncode(v44);
    elseif v44.StatusCode then
        return v44.StatusCode;
    else
        return -1;
    end;
end;
return function(v46) --[[ Line: 77 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v15 (copy), v32 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v20 (copy), l_useSelector_0 (copy), v11 (copy), l_ExperienceInviteVoteType_0 (copy), v9 (copy), v8 (copy), v7 (copy), l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy), v33 (copy), v12 (copy), l_dependencyArray_0 (copy), v40 (copy), l_ExperienceInviteState_0 (copy), l_ExperienceService_0 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (copy), v39 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v10 (copy), v5 (copy), v6 (copy), v16 (copy), l_NotificationTypeEnum_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), v37 (copy), v38 (copy), l_LifecycleEvents_0 (copy), v36 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy)
    local v47 = l_useDispatch_0();
    local v48 = tonumber(l_useLocalUserId_0()) or 0;
    local v49 = v15.useContext(v32);
    local v50, v51 = v15.useState("");
    v15.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v51 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 87 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
        end);
        if l_status_0 then
            v51(l_result_0);
        end;
        local v56 = l_AppStorageService_0.ItemWasSet:Connect(function(v54, v55) --[[ Line: 94 ]]
            -- upvalues: l_LocalStorageKey_0 (ref), v51 (ref)
            if v54 == l_LocalStorageKey_0.BrowserTrackerId then
                v51(v55);
            end;
        end);
        return function() --[[ Line: 99 ]]
            -- upvalues: v56 (copy)
            v56:Disconnect();
        end;
    end, {
        v51
    });
    local l_default_0 = v20.ToastNotificationProtocol.default;
    local v58 = v15.useRef(false);
    local v60 = v15.useCallback(function(v59) --[[ Line: 107 ]]
        if v59.Squad and v59.Squad.Squad then
            return v59.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v61 = l_useSelector_0(v60);
    local v62 = v11();
    local v66, v67 = v15.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v61 (copy), l_ExperienceInviteVoteType_0 (ref), v48 (copy), v50 (copy)
        if not v61 or not v61.model then
            if v61 and v61.notification.isInviter then
                return l_ExperienceInviteVoteType_0.Accept, false;
            else
                return l_ExperienceInviteVoteType_0.Invalid, false;
            end;
        else
            for _, v64 in ipairs(v61.model.votes) do
                if v64.userId == v48 then
                    local v65 = false;
                    if v64.voteIdentifier and v64.voteIdentifier ~= "" then
                        v65 = v64.voteIdentifier ~= v50;
                    end;
                    return v64.voteType, v65;
                end;
            end;
            return l_ExperienceInviteVoteType_0.NoVote, false;
        end;
    end, {
        v61, 
        v48, 
        v50
    });
    local v70 = v15.useCallback(function(v68, v69) --[[ Line: 141 ]]
        -- upvalues: l_default_0 (copy), v47 (copy), v9 (ref), v58 (copy)
        if v69 then
            l_default_0:dismissNotification(v68);
        end;
        v47(v9.Actions.CurrentExperienceInviteDismissed(v68));
        v58.current = false;
    end, {
        v47
    });
    local v74 = v15.useCallback(function(v71, v72) --[[ Line: 152 ]]
        -- upvalues: v47 (copy), v8 (ref), v7 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref)
        return v47(v8.GetExperienceInvite.API({
            experienceInviteId = v71, 
            membershipEntityId = v72
        })):catch(function(v73) --[[ Line: 156 ]]
            -- upvalues: v7 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref), v71 (copy), v72 (copy)
            v7:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v73) else if v73.StatusCode then v73.StatusCode else -1, v71, v72);
        end);
    end, {
        v47
    });
    local v84 = v15.useCallback(function(v75, v76, v77) --[[ Line: 165 ]]
        -- upvalues: v62 (copy), v47 (copy), v8 (ref), v50 (copy), v49 (copy), v33 (ref), v12 (ref), l_HttpService_0 (ref), v7 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref)
        local v78 = {
            parentChannelId = v62, 
            experienceInviteId = v75, 
            voteType = v76
        };
        return v47(v8.VoteForExperienceInvite.API({
            experienceInviteId = v75, 
            membershipEntityId = v77, 
            voteIdentifier = v50, 
            voteType = v76
        })):andThen(function() --[[ Line: 178 ]]
            -- upvalues: v49 (ref), v33 (ref), v12 (ref), v78 (copy)
            v49.fireSquadAnalytics(v33.SquadVoteApiCall, v12.Dictionary.union(v78, {
                isSuccess = true
            }));
        end):catch(function(v79) --[[ Line: 186 ]]
            -- upvalues: l_HttpService_0 (ref), v49 (ref), v33 (ref), v12 (ref), v78 (copy), v7 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), v75 (copy), v77 (copy), v76 (copy)
            local l_Body_0 = v79.Body;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 188 ]]
                -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                return l_HttpService_0:JSONDecode(l_Body_0);
            end);
            local v83 = if l_status_1 then l_result_1.errorType else nil;
            v49.fireSquadAnalytics(v33.SquadVoteApiCall, v12.Dictionary.union(v78, {
                isSuccess = false, 
                errorMessage = v83, 
                errorType = if v79.StatusCode then tostring(v79.StatusCode) else nil
            }));
            v7:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v79) else if v79.StatusCode then v79.StatusCode else -1, v75, v77, v76);
        end);
    end, l_dependencyArray_0(v47, v50));
    v15.useEffect(function() --[[ Line: 216 ]]
        -- upvalues: v61 (copy), v40 (ref), v70 (copy)
        local v85 = nil;
        if v61 then
            v85 = task.delay(v40, function() --[[ Line: 219 ]]
                -- upvalues: v70 (ref), v61 (ref)
                v70(v61.notification.notificationId, true);
            end);
        end;
        return function() --[[ Line: 223 ]]
            -- upvalues: v85 (ref)
            if v85 then
                task.cancel(v85);
            end;
        end;
    end, {
        v70, 
        v61
    });
    v15.useEffect(function() --[[ Line: 231 ]]
        -- upvalues: v61 (copy), v66 (copy), l_ExperienceInviteVoteType_0 (ref), v58 (copy), l_ExperienceInviteState_0 (ref), v7 (ref), v70 (copy), l_ExperienceService_0 (ref), l_FFlagPassDownSquadExpInvGameOrigin_0 (ref)
        if not v61 or v66 ~= l_ExperienceInviteVoteType_0.Accept or v58.current then
            return;
        else
            local l_model_0 = v61.model;
            local l_notification_0 = v61.notification;
            if l_model_0 and l_model_0.state == l_ExperienceInviteState_0.ReservationSuccessful then
                local l_gameInstanceId_0 = l_model_0.experienceDetail.gameInstanceId;
                local l_placeId_0 = l_model_0.experienceDetail.placeId;
                assert(l_gameInstanceId_0, "Game instance id should exist.");
                v58.current = true;
                v7:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", l_gameInstanceId_0, l_placeId_0);
                local v90 = task.delay(1, function() --[[ Line: 251 ]]
                    -- upvalues: v70 (ref), l_notification_0 (copy), l_ExperienceService_0 (ref), l_gameInstanceId_0 (copy), l_placeId_0 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (ref)
                    v70(l_notification_0.notificationId, true);
                    l_ExperienceService_0:LaunchExperience({
                        gameInstanceId = l_gameInstanceId_0, 
                        placeId = l_placeId_0, 
                        joinAttemptOrigin = l_FFlagPassDownSquadExpInvGameOrigin_0 and "SquadExperienceInviteJoin" or nil
                    });
                end);
                return function() --[[ Line: 261 ]]
                    -- upvalues: v90 (copy)
                    task.cancel(v90);
                end;
            else
                return;
            end;
        end;
    end, {
        v61, 
        v70, 
        v66
    });
    v15.useEffect(function() --[[ Line: 269 ]]
        -- upvalues: v39 (ref), v61 (copy), l_ExperienceInviteState_0 (ref), l_setInterval_0 (ref), v74 (copy), l_clearInterval_0 (ref)
        local l_v39_0 = v39;
        local v92 = nil;
        if v61 and (not v61.model or v61.model.state == l_ExperienceInviteState_0.Active or v61.model.state == l_ExperienceInviteState_0.Reserving) then
            v92 = l_setInterval_0(function() --[[ Line: 280 ]]
                -- upvalues: v74 (ref), v61 (ref)
                v74(v61.notification.experienceInviteId, v61.notification.membershipEntityId);
            end, l_v39_0 * 1000);
        end;
        return function() --[[ Line: 288 ]]
            -- upvalues: v92 (ref), l_clearInterval_0 (ref)
            if v92 then
                l_clearInterval_0(v92);
            end;
        end;
    end, {
        v61, 
        v74
    });
    v15.useEffect(function() --[[ Line: 297 ]]
        -- upvalues: v61 (copy), v46 (copy), v67 (copy), v70 (copy)
        if v61 and (v46.currentSquadId ~= v61.notification.membershipEntityId or v67) then
            v70(v61.notification.notificationId, true);
        end;
    end, {
        v61, 
        v70, 
        v46.currentSquadId, 
        v67
    });
    v15.useEffect(function() --[[ Line: 309 ]]
        -- upvalues: v61 (copy), v7 (ref), v10 (ref), v48 (copy), l_ExperienceInviteState_0 (ref), l_default_0 (copy), v70 (copy), v66 (copy), l_ExperienceInviteVoteType_0 (ref), v49 (copy), v33 (ref), v62 (copy), v5 (ref), v6 (ref)
        if not v61 or not v61.model then
            return;
        else
            v7:debug("Current experience invite updated: {}", v10(v61.model));
            local l_notificationId_0 = v61.notification.notificationId;
            local l_state_0 = v61.model.state;
            if v61.model.inviterId == v48 then
                if l_state_0 == l_ExperienceInviteState_0.Active then
                    if v61.model.spotsTaken > 1 then
                        l_default_0:updateNotification(l_notificationId_0, v61.model.spotsTaken .. "SpotsFilled");
                        return;
                    end;
                elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                    l_default_0:updateNotification(l_notificationId_0, "launching");
                    return;
                else
                    v70(l_notificationId_0, true);
                    if l_state_0 ~= l_ExperienceInviteState_0.Cancelled and l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                        v7:warning("Invitee unexpected squad experience invite state: {}", l_state_0);
                        return;
                    end;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Active then
                if v66 == l_ExperienceInviteVoteType_0.Invalid or v66 == l_ExperienceInviteVoteType_0.NoVote then
                    if v61.model.spotsTaken >= v61.model.totalSpots then
                        v49.fireSquadAnalytics(v33.SquadToastActions, {
                            parentChannelId = v62, 
                            experienceInviteId = v61.model.experienceInviteId, 
                            toastAction = v5.ExpInvSlotsFull, 
                            toastType = v6.ExperienceInvite
                        });
                        l_default_0:updateNotification(l_notificationId_0, "slotsFull");
                        return;
                    end;
                elseif v66 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v66 == l_ExperienceInviteVoteType_0.Decline or v66 == l_ExperienceInviteVoteType_0.Dismiss then
                    v70(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                if v66 == l_ExperienceInviteVoteType_0.Invalid or v66 == l_ExperienceInviteVoteType_0.NoVote then
                    v49.fireSquadAnalytics(v33.SquadToastActions, {
                        parentChannelId = v62, 
                        experienceInviteId = v61.model.experienceInviteId, 
                        toastAction = v5.ExpInvExpired, 
                        toastType = v6.ExperienceInvite
                    });
                    l_default_0:updateNotification(l_notificationId_0, "expired");
                    return;
                elseif v66 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v66 == l_ExperienceInviteVoteType_0.Decline or v66 == l_ExperienceInviteVoteType_0.Dismiss then
                    v70(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Cancelled then
                l_default_0:updateNotification(l_notificationId_0, "cancelled");
                return;
            else
                v70(l_notificationId_0, true);
                if l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                    v7:warning("Inviter unexpected squad experience invite state: {}", l_state_0);
                end;
            end;
            return;
        end;
    end, {
        v61, 
        v62, 
        v70, 
        v48, 
        v49.fireSquadAnalytics, 
        v66
    });
    v16.useRealtimeNamespace("ExperienceInviteUpdate", function(v95) --[[ Line: 401 ]]
        -- upvalues: v7 (ref), v10 (ref), v47 (copy), v9 (ref)
        v7:debug("Experience invite RTN received. Detail: {}", v10(v95));
        v47(v9.Actions.CurrentExperienceInviteUpdated(v95));
    end, {
        v47
    });
    v15.useEffect(function() --[[ Line: 413 ]]
        -- upvalues: l_default_0 (copy), v61 (copy), v66 (copy), l_ExperienceInviteVoteType_0 (ref), v70 (copy), l_ExperienceInviteState_0 (ref), v49 (copy), v33 (ref), v62 (copy), v5 (ref), v6 (ref), v84 (copy)
        local v97 = l_default_0:listenToDismissNotification(function(v96) --[[ Line: 415 ]]
            -- upvalues: v61 (ref), v66 (ref), l_ExperienceInviteVoteType_0 (ref), v70 (ref), l_ExperienceInviteState_0 (ref), v49 (ref), v33 (ref), v62 (ref), v5 (ref), v6 (ref), v84 (ref)
            if v61 and v61.notification.notificationId == v96.notificationId then
                if v66 ~= l_ExperienceInviteVoteType_0.Accept then
                    v70(v96.notificationId, false);
                end;
                if (not v61.model or v61.model.state == l_ExperienceInviteState_0.Active) and (v66 == l_ExperienceInviteVoteType_0.Invalid or v66 == l_ExperienceInviteVoteType_0.NoVote) then
                    v49.fireSquadAnalytics(v33.SquadToastActions, {
                        parentChannelId = v62, 
                        experienceInviteId = v61.notification.experienceInviteId, 
                        toastAction = v5.ExpInvDismiss, 
                        toastType = v6.ExperienceInvite
                    });
                    v84(v61.notification.experienceInviteId, l_ExperienceInviteVoteType_0.Dismiss, v61.notification.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 456 ]]
            -- upvalues: v97 (copy)
            v97:Disconnect();
        end;
    end, {
        v61, 
        v62, 
        v70, 
        v47, 
        v49.fireSquadAnalytics, 
        v66, 
        v84
    });
    v15.useEffect(function() --[[ Line: 470 ]]
        -- upvalues: l_default_0 (copy), v48 (copy), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v47 (copy), v9 (ref)
        local v100 = l_default_0:listenToDisplayNotification(function(v98) --[[ Line: 472 ]]
            -- upvalues: v48 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v47 (ref), v9 (ref)
            if not v98 then
                return;
            elseif v48 <= 0 then
                return;
            else
                if v98.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation then
                    local v99 = l_HttpService_0:JSONDecode(v98.lifecycleData);
                    v47(v9.Actions.CurrentExperienceInviteReceived(v99.experienceInviteId, v99.membershipEntityId, v98.notificationId, v99.isInviter));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 493 ]]
            -- upvalues: v100 (copy)
            v100:Disconnect();
        end;
    end, {
        v48
    });
    v15.useEffect(function() --[[ Line: 500 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_NotificationTypeEnum_0 (ref), v61 (copy), v37 (ref), v38 (ref), l_HttpService_0 (ref), v47 (copy), v9 (ref), l_default_0 (copy), l_ExperienceInviteState_0 (ref), v66 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v103 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v101) --[[ Line: 503 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v61 (ref), v37 (ref), v38 (ref), l_HttpService_0 (ref), v47 (ref), v9 (ref), l_default_0 (ref), l_ExperienceInviteState_0 (ref), v66 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v101.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation and v101.userActionType == "timerElapsed" then
                if not v61 and (v37 or v38) then
                    if v37 then
                        local v102 = l_HttpService_0:JSONDecode(v101.parameters);
                        v47(v9.Actions.CurrentExperienceInviteReceived(v102.experienceInviteId, v102.membershipEntityId, v101.notificationId, v102.isInviter));
                    end;
                    if v38 then
                        l_default_0:updateNotification(v101.notificationId, "expired");
                    end;
                    return;
                else
                    assert(v61, "Experience invite must exist to perform actions.");
                    if (not v61.model or v61.model.state == l_ExperienceInviteState_0.Active) and (v66 == l_ExperienceInviteVoteType_0.Invalid or v66 == l_ExperienceInviteVoteType_0.NoVote) then
                        l_default_0:updateNotification(v101.notificationId, "expired");
                    end;
                end;
            end;
        end, false, true);
        return function() --[[ Line: 553 ]]
            -- upvalues: v103 (copy)
            v103:Disconnect();
        end;
    end, {
        v61, 
        v66, 
        v84
    });
    v15.useEffect(function() --[[ Line: 559 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v62 (copy), v6 (ref), v36 (ref), v61 (copy), v47 (copy), v9 (ref), v49 (copy), v33 (ref), v12 (ref), v5 (ref), v84 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v107 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v104) --[[ Line: 563 ]]
            -- upvalues: l_HttpService_0 (ref), v62 (ref), v6 (ref), v36 (ref), v61 (ref), v47 (ref), v9 (ref), v49 (ref), v33 (ref), v12 (ref), v5 (ref), v84 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v104 and v104.userActionType == "click" and v104.visualItem and v104.visualItem.actionEventParams then
                local v105 = l_HttpService_0:JSONDecode(v104.visualItem.actionEventParams);
                local v106 = {
                    parentChannelId = v62, 
                    experienceInviteId = v105.experienceInviteId, 
                    toastType = v6.ExperienceInvite
                };
                if v36 and not v61 then
                    v47(v9.Actions.CurrentExperienceInviteReceived(v105.experienceInviteId, v105.membershipEntityId, v104.notificationData.id, v105.isInviter));
                end;
                if v104.visualItem.eventName == "GroupUpSquadExperience" then
                    v49.fireSquadAnalytics(v33.SquadToastActions, v12.Dictionary.union(v106, {
                        toastAction = v5.ExpInvAccept
                    }));
                    v84(v105.experienceInviteId, l_ExperienceInviteVoteType_0.Accept, v105.membershipEntityId);
                    return;
                elseif v104.visualItem.eventName == "DismissSquadExperienceInvited" then
                    v49.fireSquadAnalytics(v33.SquadToastActions, v12.Dictionary.union(v106, {
                        toastAction = v5.ExpInvDecline
                    }));
                    v84(v105.experienceInviteId, l_ExperienceInviteVoteType_0.Decline, v105.membershipEntityId);
                    return;
                elseif v104.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
                    v49.fireSquadAnalytics(v33.SquadToastActions, v12.Dictionary.union(v106, {
                        toastAction = v5.ExpInvCancel
                    }));
                    v84(v105.experienceInviteId, l_ExperienceInviteVoteType_0.Cancel, v105.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 631 ]]
            -- upvalues: v107 (copy)
            v107();
        end;
    end, {
        v61, 
        v62, 
        v47, 
        v49.fireSquadAnalytics, 
        v84
    });
    v15.useEffect(function() --[[ Line: 643 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), v36 (ref), v47 (copy), v9 (ref), l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref)
        local function v109(v108) --[[ Line: 644 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), v36 (ref), v47 (ref), v9 (ref)
            if v108.currentState == "invited" then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
            if v36 then
                v47(v9.Actions.CurrentExperienceInviteReceived(v108.clientEventsPayload.experience_invite_id, v108.clientEventsPayload.squad_id, v108.id, v108.clientEventsPayload.is_inviter));
            end;
        end;
        local v110 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, v109);
        local v111 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Update, l_NotificationTypeEnum_0.SquadExperienceInvitation, v109);
        return function() --[[ Line: 675 ]]
            -- upvalues: v110 (copy), v111 (copy)
            v110();
            v111();
        end;
    end, {});
    return nil;
end;