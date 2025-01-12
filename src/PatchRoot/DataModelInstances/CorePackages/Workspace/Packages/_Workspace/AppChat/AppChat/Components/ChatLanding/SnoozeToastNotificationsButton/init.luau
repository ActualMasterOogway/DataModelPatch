local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ToastNotification);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_NotificationSnoozedSignal_0 = v3.Signals.NotificationSnoozedSignal;
local l_ShowNotificationSnoozeMenuSignal_0 = v3.Signals.ShowNotificationSnoozeMenuSignal;
local l_default_0 = v3.ToastNotificationSnoozeManager.default;
local l_ToastNotificationTypeModule_0 = v3.ToastNotificationTypeModule;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_Images_0 = v4.App.ImageSet.Images;
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v13 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
return function(v15) --[[ Line: 29 ]] --[[ Name: SnoozeToastNotificationsButton ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v2 (copy), l_default_0 (copy), l_ToastNotificationTypeModule_0 (copy), l_NotificationSnoozedSignal_0 (copy), v13 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), v12 (copy)
    local v16 = l_useLocalization_0({
        chat = "Feature.Chat.Action.StartChatWithFriends", 
        party = "Feature.Squads.Label.Party", 
        snoozeTitle = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.SnoozePartyNotifications" or "Feature.Chat.Label.SnoozeChatNotifications", 
        unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback"
    });
    local v17, v18 = v2.useState(l_default_0:isSnoozedNotificationType(l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage));
    v2.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: l_NotificationSnoozedSignal_0 (ref), l_ToastNotificationTypeModule_0 (ref), v18 (copy)
        local v20 = l_NotificationSnoozedSignal_0:connect(function(v19) --[[ Line: 46 ]]
            -- upvalues: l_ToastNotificationTypeModule_0 (ref), v18 (ref)
            if v19.notificationType == l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage then
                v18(v19.actionType == l_ToastNotificationTypeModule_0.SnoozeActionEnum.Mute);
            end;
        end);
        return function() --[[ Line: 57 ]]
            -- upvalues: v20 (copy)
            v20:disconnect();
        end;
    end, {});
    local v21 = v13();
    return v2.createElement(l_IconButton_0, {
        size = v15.size, 
        icon = if v17 then l_Images_0["icons/common/snoozeNotificationsOn"] else l_Images_0["icons/common/snoozeNotificationsOff"], 
        layoutOrder = v15.layoutOrder, 
        onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
            -- upvalues: v17 (copy), v16 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_default_0 (ref), l_ToastNotificationTypeModule_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v21 (copy), v12 (ref)
            if v17 then
                local v22 = v16.unmuteFeedback:gsub("{title}", if l_GetFFlagAppChatRebrandStringUpdates_0() then v16.party else v16.chat);
                l_default_0:unmuteNotification({
                    notificationType = l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage, 
                    modalMessage = v22, 
                    context = "ChatLandingSnoozeToastNotificationsButton"
                });
            else
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "ChatLandingSnoozeToastNotificationsButton", 
                    notificationType = l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage, 
                    title = v16.snoozeTitle
                });
            end;
            if v21 then
                v21.fireAnalyticsEvent(v12.ChatLandingSnoozeBtnClicked, {
                    isChatNotificationsMuted = v17
                });
            end;
        end
    });
end;