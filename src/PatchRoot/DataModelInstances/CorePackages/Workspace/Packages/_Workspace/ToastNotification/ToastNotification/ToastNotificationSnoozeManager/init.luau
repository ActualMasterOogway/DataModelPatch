local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.analytics.analyticsService);
local v4 = require(l_Parent_0.dependencies);
local l_NotificationSnoozedSignal_0 = require(l_Parent_0.Signals).NotificationSnoozedSignal;
local v6 = require(l_Parent_0.type);
local l_Cryo_0 = v4.Cryo;
local l_LocalStorage_0 = v4.LocalStorage;
local l_NotificationModalsManager_0 = v4.NotificationModalsManager;
local l_Images_0 = v4.UIBlox.App.ImageSet.Images;
local l_FFlagSnoozeIndefiniteEnabled_0 = v4.SharedFlags.FFlagSnoozeIndefiniteEnabled;
local l_LocalStorageKey_0 = l_LocalStorage_0.Enums.LocalStorageKey;
local v13 = {};
v13.__index = v13;
v13._isExpiredSnooze = function(v14) --[[ Line: 30 ]] --[[ Name: _isExpiredSnooze ]]
    -- upvalues: l_FFlagSnoozeIndefiniteEnabled_0 (copy)
    if l_FFlagSnoozeIndefiniteEnabled_0 then
        if v14.durationMinutes ~= -1 and (DateTime.now().UnixTimestampMillis - v14.snoozedTimestampMs) / 1000 >= v14.durationMinutes * 60 then
            return true;
        end;
    elseif (DateTime.now().UnixTimestampMillis - v14.snoozedTimestampMs) / 1000 >= v14.durationMinutes * 60 then
        return true;
    end;
    return false;
end;
v13._showNotificationsModal = function(_, v16) --[[ Line: 53 ]] --[[ Name: _showNotificationsModal ]]
    -- upvalues: l_NotificationModalsManager_0 (copy), l_Images_0 (copy)
    l_NotificationModalsManager_0.SetUIBloxToast({
        iconImage = l_Images_0["icons/common/notificationOn"], 
        toastTitle = v16
    });
end;
v13._updateAppStorage = function(v17) --[[ Line: 70 ]] --[[ Name: _updateAppStorage ]]
    -- upvalues: l_LocalStorageKey_0 (copy), l_HttpService_0 (copy)
    v17._appStorageService:SetItem(l_LocalStorageKey_0.SnoozedNotificationTypesLocalStorageKey, l_HttpService_0:JSONEncode(v17.snoozedNotificationTypes));
    v17._appStorageService:Flush();
end;
v13.unmuteNotification = function(v18, v19) --[[ Line: 87 ]] --[[ Name: unmuteNotification ]]
    -- upvalues: l_NotificationSnoozedSignal_0 (copy), v6 (copy)
    if v18.snoozedNotificationTypes[v19.notificationType] then
        v18.snoozedNotificationTypes[v19.notificationType] = nil;
    end;
    v18:_updateAppStorage();
    l_NotificationSnoozedSignal_0:fire({
        actionType = v6.SnoozeActionEnum.Unmute, 
        notificationType = v19.notificationType
    });
    local v20 = v19.context or "";
    local v21 = {
        action_type = v6.SnoozeActionEnum.Unmute, 
        notification_type = v19.notificationType
    };
    v18._eventStream.sendEventDeferred(v20, "notificationSnoozedEvent", v21);
    if v19.modalMessage and v19.modalMessage ~= "" then
        v18:_showNotificationsModal(v19.modalMessage);
    end;
end;
v13.snoozeNotification = function(v22, v23) --[[ Line: 125 ]] --[[ Name: snoozeNotification ]]
    -- upvalues: l_Cryo_0 (copy), v6 (copy), l_NotificationSnoozedSignal_0 (copy)
    v22.snoozedNotificationTypes = l_Cryo_0.Dictionary.join(v22.snoozedNotificationTypes, {
        [v23.notificationType] = {
            durationMinutes = v23.durationMinutes, 
            snoozedTimestampMs = DateTime.now().UnixTimestampMillis
        }
    });
    v22:_updateAppStorage();
    local v24 = v23.context or "";
    local v25 = {
        action_type = v6.SnoozeActionEnum.Mute, 
        duration_minutes = v23.durationMinutes, 
        notification_type = v23.notificationType
    };
    v22._eventStream.sendEventDeferred(v24, "notificationSnoozedEvent", v25);
    l_NotificationSnoozedSignal_0:fire({
        actionType = v6.SnoozeActionEnum.Mute, 
        context = v23.context, 
        durationMinutes = v23.durationMinutes, 
        notificationType = v23.notificationType
    });
    if v23.modalMessage and v23.modalMessage ~= "" then
        v22:_showNotificationsModal(v23.modalMessage);
    end;
end;
v13.isSnoozedNotificationType = function(v26, v27) --[[ Line: 170 ]] --[[ Name: isSnoozedNotificationType ]]
    -- upvalues: l_Cryo_0 (copy)
    if v26.snoozedNotificationTypes[v27] then
        if v26._isExpiredSnooze(v26.snoozedNotificationTypes[v27]) then
            v26.snoozedNotificationTypes = l_Cryo_0.Dictionary.omit(v26.snoozedNotificationTypes, v27);
            v26:_updateAppStorage();
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v13.new = function(v28) --[[ Line: 188 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v13 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy)
    local v29 = {
        _appStorageService = v28, 
        _eventStream = v3.EventStream, 
        snoozedNotificationTypes = {}
    };
    setmetatable(v29, v13);
    local v30 = {};
    local v31 = {};
    local v32 = false;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 201 ]]
        -- upvalues: v29 (copy), l_LocalStorageKey_0 (ref)
        return v29._appStorageService:GetItem(l_LocalStorageKey_0.SnoozedNotificationTypesLocalStorageKey);
    end);
    if l_status_0 and l_result_0 ~= "" then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 206 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            v30 = l_result_1;
        end;
    end;
    for v37, v38 in pairs(v30) do
        if v29._isExpiredSnooze(v38) then
            v32 = true;
        else
            v31[v37] = v38;
        end;
    end;
    v29.snoozedNotificationTypes = v31;
    if v32 then
        v29:_updateAppStorage();
    end;
    return v29;
end;
v13.default = v13.new(l_AppStorageService_0);
return v13;