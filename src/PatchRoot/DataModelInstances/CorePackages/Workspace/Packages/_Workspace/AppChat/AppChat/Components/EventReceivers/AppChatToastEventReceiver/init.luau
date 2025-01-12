local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.ToastNotification);
local l_default_0 = require(l_Parent_0.ToastNotificationsProtocol).ToastNotificationProtocol.default;
local l_default_1 = v6.ToastNotificationSnoozeManager.default;
local l_SnoozeActionEnum_0 = v6.ToastNotificationTypeModule.SnoozeActionEnum;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_LifecycleEvents_0 = v6.LifecycleEvents;
local l_NotificationTypeEnum_0 = v6.ToastNotificationTypeModule.NotificationTypeEnum;
local l_NotificationSnoozedSignal_0 = v6.Signals.NotificationSnoozedSignal;
local l_ShowNotificationSnoozeMenuSignal_0 = v6.Signals.ShowNotificationSnoozeMenuSignal;
local l_DismissNotificationSnoozeMenuSignal_0 = v6.Signals.DismissNotificationSnoozeMenuSignal;
local v17 = require(l_Parent_0.UniversalAppPolicy);
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local v19 = game:DefineFastFlag("AppChatHideToastsU13_2", false);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v21 = {
    hideAllChatToasts = false, 
    isAppChatVisible = false, 
    navigateToChat = function() --[[ Line: 41 ]] --[[ Name: navigateToChat ]]

    end
};
return function(v22) --[[ Line: 44 ]]
    -- upvalues: v3 (copy), v21 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), v19 (copy), v17 (copy), v4 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_dependencyArray_0 (copy), l_NotificationSnoozedSignal_0 (copy), l_SnoozeActionEnum_0 (copy), l_default_1 (copy), l_DismissNotificationSnoozeMenuSignal_0 (copy)
    local v23 = v3.Dictionary.join(v21, v22);
    local v24 = l_useLocalization_0({
        snoozeDescription = "Feature.Chat.Description.SnoozeDescription", 
        snoozeTitle = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.SnoozePartyNotifications" or "Feature.Chat.Label.SnoozeChatNotifications"
    });
    local v25 = 0;
    local v26 = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v23.isAppChatVisible else v23.hideAllChatToasts;
    local v27 = not v19 or v17.getAppFeaturePolicies().getCanSeeChatTab();
    v4.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), v23 (copy), l_ShowNotificationSnoozeMenuSignal_0 (ref), v24 (copy)
        local v30 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.ChatNewMessage, function(v28) --[[ Line: 67 ]]
            -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), v23 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v24 (ref), l_NotificationTypeEnum_0 (ref)
            if v28 and v28.userActionType == "click" and v28.notificationData and v28.visualItem and v28.visualItem.eventName == "ChatMessageBody" and v28.visualItem.actionEventParams then
                local v29 = l_HttpService_0:JSONDecode(v28.visualItem.actionEventParams);
                l_default_0:dismissNotification(v28.notificationData.id);
                v23.navigateToChat(v29.conversationId);
            end;
            if v28 and v28.userActionType == "click" and v28.notificationData and v28.visualItem and v28.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v24.snoozeDescription, 
                    notificationType = l_NotificationTypeEnum_0.ChatNewMessage, 
                    title = v24.snoozeTitle
                });
            end;
        end);
        return function() --[[ Line: 99 ]]
            -- upvalues: v30 (copy)
            v30();
        end;
    end, l_dependencyArray_0(v23.navigateToChat, v24));
    v4.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), v26 (copy), v27 (copy), v25 (ref), l_NotificationSnoozedSignal_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
        local v32 = l_default_0:listenToDisplayNotification(function(v31) --[[ Line: 106 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v26 (ref), v27 (ref), l_default_0 (ref), v25 (ref)
            if v31.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                if v26 or not v27 then
                    l_default_0:dismissNotification(v31.notificationId);
                    return;
                else
                    v25 = v25 + 1;
                end;
            end;
        end);
        local v34 = l_NotificationSnoozedSignal_0:connect(function(v33) --[[ Line: 117 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
            if v33.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                if v33.actionType == l_SnoozeActionEnum_0.Mute then
                    l_default_1:snoozeNotification({
                        context = v33.context, 
                        durationMinutes = v33.durationMinutes, 
                        notificationType = l_NotificationTypeEnum_0.SquadInvitation
                    });
                    return;
                elseif v33.actionType == l_SnoozeActionEnum_0.Unmute then
                    l_default_1:unmuteNotification({
                        context = v33.context, 
                        notificationType = l_NotificationTypeEnum_0.SquadInvitation
                    });
                end;
            end;
        end);
        return function() --[[ Line: 140 ]]
            -- upvalues: v32 (copy), v34 (copy)
            v32:Disconnect();
            v34:disconnect();
        end;
    end, {
        v26, 
        v27
    });
    if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
        v4.useEffect(function() --[[ Line: 147 ]]
            -- upvalues: v23 (copy), l_DismissNotificationSnoozeMenuSignal_0 (ref)
            if not v23.isAppChatVisible and l_DismissNotificationSnoozeMenuSignal_0 then
                l_DismissNotificationSnoozeMenuSignal_0:fire();
            end;
        end, {
            v23.isAppChatVisible
        });
    end;
end;