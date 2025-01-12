local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.NotificationModalsManager);
local l_default_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol.default;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v8 = require(script.Parent.Components.PushNotificationsUpsellModal);
local v9 = require(script.Parent.NotificationsUpsellConstants);
local v10 = require(script.Parent.Analytics.ModalEventConstants);
local v11 = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName);
local v12 = require(script.Parent.Util.PushNotificationsUpsellUtils);
local v13 = require(l_Parent_0.Promise);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v15 = require(script.Parent.Flags.FIntPushUpsellCooldownPeriod);
local v16 = require(script.Parent.Flags.FIntPushUpsellMaxPromptCount);
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents;
local v19 = game:DefineFastFlag("CacheShouldShowPushUpsellHideResponse", false);
local v20 = game:DefineFastInt("ShouldShowPushUpsellHideResponseCacheExpirationTime", 6);
local v21 = false;
local v22 = 0;
local function v32(v23) --[[ Line: 38 ]] --[[ Name: shouldShowUpsell ]]
    -- upvalues: l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v13 (copy), l_getAppFeaturePolicies_0 (copy), v19 (copy), v22 (ref), v20 (copy), v21 (ref), v12 (copy), l_AppStorageService_0 (copy), v16 (copy), v15 (copy), l_default_0 (copy)
    if not l_GetFFlagEnablePushNotificationsUpsellModal_0() then
        return v13.resolve(false);
    else
        local v24 = l_getAppFeaturePolicies_0();
        if not v24.getNotificationsCanReceivePush() or not v24.getPushNotificationsUpsell() then
            return v13.resolve(false);
        elseif v19 and (os.time() - v22) / 3600 < v20 and v21 then
            return v13.resolve(false);
        else
            local v25 = v12.getPushUpsellPromptedCount(l_AppStorageService_0);
            local v26 = if v23 then v12.getPushEduUpsellResponseTimestamp(l_AppStorageService_0) else v12.getPushSysUpsellPromptTimestamp(l_AppStorageService_0);
            local v27 = false;
            if v25 >= 0 and v26 >= 0 then
                local v28 = (os.time() - v26) / 86400;
                local v29 = false;
                if v25 < v16 then
                    v29 = true;
                    if v15 > v28 then
                        v29 = v26 == 0;
                    end;
                end;
                v27 = v29;
            end;
            if v27 then
                return l_default_0:shouldShowUpsell({
                    l_default_0.Permissions.POST_NOTIFICATIONS
                }):andThen(function(v30) --[[ Line: 74 ]]
                    -- upvalues: l_default_0 (ref), v13 (ref), v19 (ref), v21 (ref), v22 (ref)
                    if v30.upsellStatus and v30.upsellStatus == l_default_0.UpsellStatus.SHOW then
                        return v13.resolve(true);
                    else
                        if v19 then
                            v21 = true;
                            v22 = os.time();
                        end;
                        return v13.resolve(false);
                    end;
                end, function(_) --[[ Line: 86 ]]
                    -- upvalues: v13 (ref)
                    return v13.resolve(false);
                end);
            else
                return v13.resolve(false);
            end;
        end;
    end;
end;
return {
    OpenModal = function(v33, v34, v35) --[[ Line: 94 ]] --[[ Name: openModal ]]
        -- upvalues: l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (copy), l_sendEventDeferred_0 (copy), v10 (copy), l_default_1 (copy), v11 (copy), v3 (copy), v12 (copy), l_AppStorageService_0 (copy), v8 (copy), v9 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_default_0 (copy)
        if not l_GetFFlagEnablePushNotificationsUpsellModal_0() then
            return;
        elseif v34 then
            local function v36() --[[ Line: 100 ]]
                -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextPushEduUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.Closed
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.Closed
                }, v10.ModalContextPushEduUpsell);
            end;
            local function v37() --[[ Line: 117 ]]
                -- upvalues: v3 (ref), v33 (copy)
                v3.CloseModal(v33);
            end;
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v10.ModalContextPushEduUpsell, v10.OptInPushEventName, {
                    [v10.ActionType] = v10.Opened
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v11, {}, {
                [v10.ActionType] = v10.Opened, 
                [v10.EntryPoint] = v35 or ""
            }, v10.ModalContextPushEduUpsell);
            v12.incrementPushUpsellPromptedCount(l_AppStorageService_0);
            v3.OpenModal(v33, v8, {
                CloseCallback = v36, 
                Props = {
                    CloseModal = v37, 
                    TranslationKeys = v9.TranslationKeys[v33]
                }, 
                DisableBackgroundDismiss = true, 
                DisplayOrder = 2, 
                Localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            });
            return;
        else
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                    [v10.ActionType] = v10.Opened
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v11, {}, {
                [v10.ActionType] = v10.Opened, 
                [v10.EntryPoint] = v35 or ""
            }, v10.ModalContextSysUpsell);
            l_default_0:requestPermissions({
                l_default_0.Permissions.POST_NOTIFICATIONS
            }):andThen(function(_) --[[ Line: 159 ]]
                -- upvalues: v12 (ref), l_AppStorageService_0 (ref), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                v12.setPushSysUpsellPromptTimestamp(l_AppStorageService_0, os.time());
                v12.incrementPushUpsellPromptedCount(l_AppStorageService_0);
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.RequestSuccess
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.RequestSuccess
                }, v10.ModalContextSysUpsell);
            end, function(_) --[[ Line: 173 ]]
                -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.RequestFailed
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.RequestFailed
                }, v10.ModalContextSysUpsell);
            end);
            return;
        end;
    end, 
    CloseModal = function(v40) --[[ Line: 189 ]] --[[ Name: closeModal ]]
        -- upvalues: v3 (copy)
        v3.CloseModal(v40);
    end, 
    ShouldShowUpsell = v32
};