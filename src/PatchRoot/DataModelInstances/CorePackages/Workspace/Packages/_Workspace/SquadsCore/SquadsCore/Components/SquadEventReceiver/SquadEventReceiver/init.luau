local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.SquadAppChatEventReceiver);
local v4 = require(script.Parent.SquadExperienceInviteEventReceiver);
local v5 = require(script.Parent.SquadLifecycleEventReceiver);
local v6 = require(script.Parent.SquadParentChannelEventReceiver);
local v7 = require(script.Parent.SquadStorageEventReceiver);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v9 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v10 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local v11 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v12 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v13 = require(l_script_FirstAncestor_0.Thunks.joinSquad);
local v14 = require(l_script_FirstAncestor_0.Hooks.useOnSquadEnded);
local v15 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoiceConnector);
local v16 = require(l_Parent_0.CrossExperienceVoice);
local l_CrossExperienceVoiceManager_0 = v16.CrossExperienceVoiceManager;
local v18 = require(l_Parent_0.React);
local v19 = require(l_Parent_0.RoduxSquads);
local v20 = require(l_Parent_0.SharedFlags);
local v21 = require(l_Parent_0.SoundManager);
local v22 = require(l_Parent_0.ToastNotification);
local v23 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useCrossExperienceVoice_0 = v16.Hooks.useCrossExperienceVoice;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCurrentSquadSelector_0 = v19.Hooks.useCurrentSquadSelector;
local l_Sounds_0 = v21.Sounds;
local l_SoundManager_0 = v21.SoundManager;
local l_GetFFlagEnableCrossExpVoice_0 = v20.GetFFlagEnableCrossExpVoice;
local l_GetFFlagHidePartyInviteToastsU13_0 = v20.GetFFlagHidePartyInviteToastsU13;
local l_FFlagPartyVoiceBlockSync_0 = v20.FFlagPartyVoiceBlockSync;
local l_FFlagSquadAppChatRTNFix_0 = v20.FFlagSquadAppChatRTNFix;
local l_default_0 = v23.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v22.LifecycleEvents;
local l_NotificationTypeEnum_0 = v22.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v22.ToastNotificationSnoozeManager.default;
return function() --[[ Line: 54 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v18 (copy), v9 (copy), l_GetFFlagHidePartyInviteToastsU13_0 (copy), l_useAppPolicy_0 (copy), l_useCurrentSquadSelector_0 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v8 (copy), v11 (copy), v12 (copy), l_HttpService_0 (copy), l_default_0 (copy), v13 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_useCrossExperienceVoice_0 (copy), v15 (copy), v14 (copy), v5 (copy), v6 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v10 (copy), v3 (copy), v4 (copy), v7 (copy)
    local v40 = l_useDispatch_0();
    local v41 = tonumber(l_useLocalUserId_0()) or 0;
    local v42 = v18.useContext(v9);
    local v43 = v42.useSquadRootView();
    local v44 = nil;
    if l_GetFFlagHidePartyInviteToastsU13_0() then
        local v46 = v18.useCallback(function(v45) --[[ Line: 65 ]]
            return v45.getCanSeeChatTab();
        end, {});
        v44 = l_useAppPolicy_0(v46);
    end;
    local v47 = l_useCurrentSquadSelector_0();
    local v48 = if v47 and v47.squadId then v47.squadId else "";
    local v49 = if v47 and v47.parentChannelId then v47.parentChannelId else "";
    v18.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v42 (copy), v8 (ref), v49 (copy), v11 (ref), v12 (ref), l_HttpService_0 (ref), l_default_0 (ref), v40 (copy), v13 (ref)
        local v52 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v50) --[[ Line: 88 ]]
            -- upvalues: v42 (ref), v8 (ref), v49 (ref), v11 (ref), v12 (ref), l_HttpService_0 (ref), l_default_0 (ref), v40 (ref), v13 (ref)
            if v50 and v50.userActionType == "click" and v50.notificationData and v50.visualItem and v50.visualItem.eventName == "JoinSquad" and v50.visualItem.actionEventParams then
                v42.fireSquadAnalytics(v8.SquadToastActions, {
                    parentChannelId = v49, 
                    toastAction = v11.SquadInviteAccept, 
                    toastType = v12.SquadInvite
                });
                local v51 = l_HttpService_0:JSONDecode(v50.visualItem.actionEventParams);
                l_default_0:dismissNotification(v50.notificationData.id);
                v40(v13(v51.squadId, v42.setSquadPrompt));
            end;
        end);
        return function() --[[ Line: 109 ]]
            -- upvalues: v52 (copy)
            v52();
        end;
    end, {
        v40
    });
    v18.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: l_GetFFlagHidePartyInviteToastsU13_0 (ref), v44 (ref), l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v53 = nil;
        if not l_GetFFlagHidePartyInviteToastsU13_0() or v44 then
            v53 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v54) --[[ Line: 121 ]]
                -- upvalues: l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
                if not l_default_1:isSnoozedNotificationType(v54.notificationType) then
                    l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
                end;
            end);
        end;
        return function() --[[ Line: 129 ]]
            -- upvalues: v53 (ref)
            if v53 then
                v53();
            end;
        end;
    end, {
        v44
    });
    v18.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: l_default_0 (ref), v41 (copy), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v48 (copy), l_GetFFlagHidePartyInviteToastsU13_0 (ref), v44 (ref)
        local v57 = l_default_0:listenToDisplayNotification(function(v55) --[[ Line: 139 ]]
            -- upvalues: v41 (ref), l_NotificationTypeEnum_0 (ref), l_default_0 (ref), l_HttpService_0 (ref), v48 (ref), l_GetFFlagHidePartyInviteToastsU13_0 (ref), v44 (ref)
            if not v55 then
                return;
            elseif v41 <= 0 then
                if v55.notificationId and (v55.notificationType == l_NotificationTypeEnum_0.SquadInvitation or v55.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v55.notificationId);
                end;
                return;
            else
                if v55.notificationType == l_NotificationTypeEnum_0.SquadInvitation then
                    local v56 = l_HttpService_0:JSONDecode(v55.lifecycleData);
                    if v48 == v56.squadId or l_GetFFlagHidePartyInviteToastsU13_0() and not v44 then
                        l_default_0:dismissNotification(v55.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 177 ]]
            -- upvalues: v57 (copy)
            v57:Disconnect();
        end;
    end, {
        v48, 
        v41, 
        v44
    });
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v59 = v18.useCallback(function(v58) --[[ Line: 185 ]]
            return v58.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v60 = l_useSelector_0(v59);
        local v61 = v18.useRef({});
        v18.useEffect(function() --[[ Line: 192 ]]
            -- upvalues: v61 (copy), v60 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v61.current == v60 then
                return;
            else
                for v62, v63 in pairs(v60) do
                    local v64 = v61.current[v62] or false;
                    if v63 and not v64 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v62);
                    elseif not v63 and v64 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v62);
                    end;
                end;
                v61.current = v60;
                return;
            end;
        end, {
            v60
        });
    end;
    if l_GetFFlagEnableCrossExpVoice_0() then
        l_useCrossExperienceVoice_0();
        local v65 = v15();
        v14(function() --[[ Line: 215 ]]
            -- upvalues: v65 (copy)
            v65();
        end);
    end;
    return v18.createElement(v18.Fragment, nil, {
        ActiveSquadEventReceivers = if v47 then v18.createElement(v18.Fragment, nil, {
            SquadLifecycleEventReceiver = v18.createElement(v5, {
                currentSquadId = v47.squadId
            }), 
            SquadParentChannelEventReceiver = v18.createElement(v6, {
                currentParentChannelId = v47.parentChannelId
            })
        }) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v43 ~= v10.None then v18.createElement(v3, {
            conversationId = if v47 then v47.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v18.createElement(v4, {
            currentSquadId = v48
        }), 
        SquadStorageEventReceiver = v18.createElement(v7)
    });
end;