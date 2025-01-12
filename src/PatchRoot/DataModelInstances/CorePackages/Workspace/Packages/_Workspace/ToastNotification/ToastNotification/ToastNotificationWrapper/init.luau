local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_context_0 = l_Parent_0.context;
local l_utils_0 = l_Parent_0.utils;
local v10 = require(l_Parent_0.dependencies);
local v11 = require(l_Parent_0.Logger);
local v12 = require(l_utils_0.toastNotificationHelper);
local v13 = require(l_utils_0.toastNotificationSessionizationHelper);
local l_Parent_1 = l_Parent_0.Parent;
local v15 = require(l_Parent_1.NotificationsCommon);
local v16 = require(l_Parent_1.React);
local v17 = require(l_Parent_1.UIBlox);
local v18 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_1.Dash);
local l_Logging_0 = require(l_Parent_1.AppCommonLib).Logging;
local l_IsVRAppBuild_0 = require(l_Parent_1.AppCommonLib).IsVRAppBuild;
local v22 = require(l_Parent_1.ReactOtter);
local v23 = require(script.Parent.utils.LifecycleEvents);
local l_ToastNotificationProtocol_0 = require(l_Parent_1.ToastNotificationsProtocol).ToastNotificationProtocol;
local l_Images_0 = v17.App.ImageSet.Images;
local l_ImageSetLabel_0 = v17.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v17.Core.Style.useStyle;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local l_AppNotificationService_0 = require(l_Parent_1.RoactServiceTags).AppNotificationService;
local v30 = require(l_Parent_1.SharedFlags);
local l_dependencyArray_0 = v10.Hooks.dependencyArray;
local v32 = require(l_Parent_0.analytics.analyticsService);
local v33 = require(l_context_0.NotificationCardProvider);
local v34 = require(l_Components_0.NotificationCard);
local v35 = require(l_Components_0.ToastNotificationSnoozeMenu);
local l_DeeplinkConfirmationModal_0 = v15.DeeplinkConfirmationModal;
local v37 = require(l_Components_0.SwipeDetectionWrapper);
local v38 = require(l_Components_0.ToastVRWrapper);
local v39 = require(l_Components_0.ClientNotificationWrapper);
local v40 = require(l_Parent_0.type);
local v41 = require(l_Parent_0.constants);
local l_JoinExperience_0 = v15.JoinExperience;
local l_ixpHelper_0 = v15.ixpHelper;
local l_SpringAnimatedItem_0 = v17.Utility.SpringAnimatedItem;
local v45 = l_Images_0["icons/navigation/close"];
local l_FFlagEnableToastNotificationsForMobile_0 = require(l_Parent_1.SharedFlags).FFlagEnableToastNotificationsForMobile;
local v47 = game:DefineFastFlag("EnableToastNotificationWrapper3", false);
local v48 = game:DefineFastFlag("EnableExternalPauseToastNotification2", false);
local l_getFStringDesktopToastNotificationLayer_0 = require(l_Parent_1.SharedFlags).getFStringDesktopToastNotificationLayer;
local v50 = game:DefineFastFlag("EnableDesktopToastNotificationIxp2", false);
local v51 = game:DefineFastFlag("EnableToastUpdateLifecycleEvent", false);
local l_GetFFlagEnableChatNewMessage_0 = v30.GetFFlagEnableChatNewMessage;
local l_GetFFlagToastNotificationsGamepadSupport_0 = v30.GetFFlagToastNotificationsGamepadSupport;
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientToastNotificationsEnabled");
local l_GetFFlagEnableToastReduceMotionSupport_0 = v30.GetFFlagEnableToastReduceMotionSupport;
local l_FFlagToastNotificationEnableNewLogger_0 = v30.FFlagToastNotificationEnableNewLogger;
local l_default_0 = require(l_Parent_0.ToastNotificationSnoozeManager).default;
local v58 = {
    frequency = 4, 
    damping = 1
};
local l_getDeviceOrientation_0 = v12.getDeviceOrientation;
local l_getNotificationSize_0 = v12.getNotificationSize;
local l_marshalNotificationData_0 = v12.marshalNotificationData;
local l_calculateToastPosition_0 = v12.calculateToastPosition;
local l_isToastToRight_0 = v12.isToastToRight;
local l_calculateTimeRemaining_0 = v12.calculateTimeRemaining;
return function(v65) --[[ Line: 88 ]]
    -- upvalues: v47 (copy), v40 (copy), v12 (copy), l_GetFFlagToastNotificationsGamepadSupport_0 (copy), l_GuiService_0 (copy), l_FFlagEnableToastNotificationsForMobile_0 (copy), v41 (copy), l_ToastNotificationProtocol_0 (copy), l_GetFFlagEnableToastReduceMotionSupport_0 (copy), v16 (copy), l_UserGameSettings_0 (copy), l_getNotificationSize_0 (copy), l_getDeviceOrientation_0 (copy), l_calculateToastPosition_0 (copy), l_isToastToRight_0 (copy), l_useStyle_0 (copy), v48 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), l_Players_0 (copy), l_FFlagToastNotificationEnableNewLogger_0 (copy), v11 (copy), v32 (copy), v13 (copy), v18 (copy), l_default_0 (copy), l_game_EngineFeature_0 (copy), l_dependencyArray_0 (copy), l_JoinExperience_0 (copy), l_HttpService_0 (copy), l_Logging_0 (copy), l_calculateTimeRemaining_0 (copy), v23 (copy), l_GetFFlagEnableChatNewMessage_0 (copy), v50 (copy), l_ixpHelper_0 (copy), l_getFStringDesktopToastNotificationLayer_0 (copy), l_marshalNotificationData_0 (copy), v51 (copy), v22 (copy), v58 (copy), l_IsVRAppBuild_0 (copy), l_TouchEnabled_0 (copy), l_SpringAnimatedItem_0 (copy), v37 (copy), v39 (copy), v33 (copy), v34 (copy), l_ImageSetLabel_0 (copy), v45 (copy), v38 (copy), v35 (copy), l_DeeplinkConfirmationModal_0 (copy)
    if not v47 then
        return nil;
    else
        local v66 = v65.renderLocation == v40.RenderLocationEnum.CoreScript;
        local v67 = v12.isDesktopDevice();
        if not l_GetFFlagToastNotificationsGamepadSupport_0() and l_GuiService_0:IsTenFootInterface() then
            return nil;
        elseif v66 and not l_FFlagEnableToastNotificationsForMobile_0() and not v67 then
            return nil;
        else
            local v68 = if v66 then v41.CardTopMargin.Experience else v41.CardTopMargin.App;
            local l_default_1 = l_ToastNotificationProtocol_0.default;
            local function _() --[[ Line: 110 ]]
                return workspace.CurrentCamera.ViewportSize;
            end;
            local function _(v71) --[[ Line: 115 ]]
                -- upvalues: v41 (ref)
                return v71 and workspace.CurrentCamera.ViewportSize.X < v41.CompactCardThreashold;
            end;
            local v73 = nil;
            local v74 = nil;
            if l_GetFFlagEnableToastReduceMotionSupport_0() then
                local v75, v76 = v16.useState(l_UserGameSettings_0.ReducedMotion);
                v73 = v75;
                v74 = v76;
            end;
            local v77, v78 = v16.useState(l_getNotificationSize_0(v66, workspace.CurrentCamera.ViewportSize.X));
            local v79, v80 = v16.useState(l_getDeviceOrientation_0(workspace.CurrentCamera.ViewportSize));
            local v81, v82 = v16.useState(false);
            local v83, v84 = v16.useState(nil);
            local v85, v86 = v16.useState(nil);
            local v87 = nil;
            local v88 = nil;
            if l_GetFFlagEnableToastReduceMotionSupport_0() then
                local v89, v90 = v16.useState(l_calculateToastPosition_0(false, l_isToastToRight_0(v79), v68, v73));
                v87 = v89;
                v88 = v90;
            else
                local v91, v92 = v16.useState(l_calculateToastPosition_0(false, l_isToastToRight_0(v79), v68));
                v87 = v91;
                v88 = v92;
            end;
            local v93, v94 = v16.useState(nil);
            local v95, v96 = v16.useState(nil);
            local v97, v98 = v16.useState(function() --[[ Line: 142 ]]
                -- upvalues: v66 (copy), v41 (ref)
                return v66 and workspace.CurrentCamera.ViewportSize.X < v41.CompactCardThreashold;
            end);
            local v99, v100 = v16.useState(false);
            local v101, v102 = v16.useState(false);
            local v103, v104 = v16.useState(false);
            local v105, v106 = v16.useState(false);
            local v107, v108 = v16.useState(false);
            local v109, v110 = v16.useState(false);
            local v111, v112 = v16.useState(false);
            local v113, v114 = v16.useState({});
            local v115, v116 = v16.useState((Instance.new("BindableEvent")));
            local v117 = l_useStyle_0();
            local v118 = if v48 then l_useRoactService_0(l_AppNotificationService_0) else nil;
            local function v122() --[[ Line: 162 ]]
                -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v66 (copy), v78 (copy), v98 (copy), v41 (ref), v80 (copy)
                local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
                local v120 = l_getDeviceOrientation_0(l_ViewportSize_0);
                local v121 = l_getNotificationSize_0(v66, l_ViewportSize_0.X);
                v78(v121);
                v98(v66 and workspace.CurrentCamera.ViewportSize.X < v41.CompactCardThreashold);
                v80(v120);
            end;
            local function _(v123) --[[ Line: 171 ]]
                -- upvalues: l_default_1 (copy)
                l_default_1:dismissNotification(v123);
            end;
            local v125 = v105 or v107;
            local v126 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
            local function v132(v127, v128, v129) --[[ Line: 178 ]]
                -- upvalues: l_FFlagToastNotificationEnableNewLogger_0 (ref), v11 (ref), v32 (ref), v13 (ref), v12 (ref), v18 (ref), v41 (ref), v66 (copy), l_default_0 (ref)
                if v129 == nil then
                    return;
                else
                    if l_FFlagToastNotificationEnableNewLogger_0 then
                        v11:info("NotificationType: {} with event: {}", v129.notificationType, v127);
                    end;
                    local l_EventStream_0 = v32.EventStream;
                    v13(v127);
                    local v131 = 0;
                    if v129 and v129.displayTimestamp then
                        v131 = DateTime.now().UnixTimestampMillis - v129.displayTimestamp;
                    end;
                    v12.fireEvent(l_EventStream_0, v18.Dictionary.join({
                        action_type = v127, 
                        delivery_channel = v41.DeliveryChannel, 
                        notification_type = v129 and v129.notificationType or nil, 
                        notification_id = v129 and v129.id or nil, 
                        recipient_userid = v128 or nil, 
                        recipient_universe_id = if v66 then game and game.GameId else nil, 
                        client_destination = if v66 then v41.Destinations.Experience else v41.Destinations.App, 
                        deliver_timestamp = v129 and v129.deliverTimestamp or nil, 
                        snoozed = if v129 and v129.notificationType then l_default_0:isSnoozedNotificationType(v129.notificationType) else false, 
                        time_to_action_timestamp = v131
                    }, v129 and v129.clientEventsPayload or {}));
                    return;
                end;
            end;
            if l_GetFFlagEnableToastReduceMotionSupport_0() then
                v16.useEffect(function() --[[ Line: 223 ]]
                    -- upvalues: l_UserGameSettings_0 (ref), v74 (ref)
                    local v136 = l_UserGameSettings_0.Changed:Connect(function(v133) --[[ Line: 224 ]]
                        -- upvalues: l_UserGameSettings_0 (ref), v74 (ref)
                        if v133 == "ReducedMotion" then
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 226 ]]
                                -- upvalues: l_UserGameSettings_0 (ref), v133 (copy)
                                return l_UserGameSettings_0[v133];
                            end);
                            if l_status_0 then
                                v74(l_result_0);
                            end;
                        end;
                    end);
                    return function() --[[ Line: 236 ]]
                        -- upvalues: v136 (copy)
                        if v136 then
                            v136:Disconnect();
                        end;
                    end;
                end, {
                    v74, 
                    l_UserGameSettings_0
                });
            end;
            local function v138(v137) --[[ Line: 244 ]]
                -- upvalues: v132 (copy), v40 (ref), v126 (copy), v83 (copy), v102 (copy), v115 (copy)
                if not v137 then
                    v132(v40.ToastNotificationActionsEnum.ModalCancel, v126, v83);
                    v102(false);
                end;
                if v115 then
                    v132(v40.ToastNotificationActionsEnum.ModalConfirm, v126, v83);
                    v115:Fire(v137);
                end;
            end;
            local v139 = v16.useCallback(function() --[[ Line: 255 ]]
                -- upvalues: v93 (copy), v94 (copy)
                if v93 then
                    task.cancel(v93);
                end;
                v94(nil);
            end, {
                v93
            });
            local function _(v140) --[[ Line: 264 ]]
                -- upvalues: l_default_1 (copy), v86 (copy), v139 (copy)
                l_default_1:dismissNotification(v140);
                v86(nil);
                v139();
            end;
            local function _(v142) --[[ Line: 270 ]]
                -- upvalues: v41 (ref)
                local v143 = v142.state and v142.state.timeOnScreenMs;
                if v143 then
                    v143 = v143 / 1000;
                end;
                return (v143 or v41.DefaultNotificationDisplayTime) + 1;
            end;
            local v149 = v16.useCallback(function(v145, v146, v147) --[[ Line: 281 ]]
                -- upvalues: v139 (copy), v103 (copy), v132 (copy), v40 (ref), v126 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v86 (copy), v94 (copy)
                v139();
                local v148 = task.delay(v146, function() --[[ Line: 283 ]]
                    -- upvalues: v103 (ref), v132 (ref), v40 (ref), v126 (ref), v147 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v145 (copy), l_default_1 (ref), v86 (ref), v139 (ref)
                    if not v103 then
                        v132(v40.ToastNotificationActionsEnum.Ignored, v126, v147);
                        if l_game_EngineFeature_0 and v147 and v147.luaNotifInfo then
                            l_GuiService_0:DismissNotification(v145);
                            return;
                        else
                            l_default_1:dismissNotification(v145);
                            v86(nil);
                            v139();
                        end;
                    end;
                end);
                v94(v148);
            end, {
                v103
            });
            local v151 = v16.useCallback(function() --[[ Line: 299 ]]
                -- upvalues: v83 (copy), v85 (copy), l_default_1 (copy), v86 (copy), v139 (copy)
                if v83 and v85 and v85.id == v83.id then
                    local l_id_0 = v83.id;
                    l_default_1:dismissNotification(l_id_0);
                    v86(nil);
                    v139();
                end;
            end, {
                v83, 
                v85
            });
            local function v152() --[[ Line: 312 ]]
                -- upvalues: v132 (copy), v40 (ref), v126 (copy), v83 (copy), v151 (copy)
                v132(v40.ToastNotificationActionsEnum.Dismissed, v126, v83);
                v151();
            end;
            local v153 = v16.useCallback(function() --[[ Line: 318 ]]
                -- upvalues: v66 (copy), v115 (copy), v102 (copy)
                if v66 and v115 then
                    v102(true);
                    return v115.Event:Wait();
                else
                    return true;
                end;
            end, {
                v66, 
                v115
            });
            local function v158() --[[ Line: 332 ]]
                -- upvalues: v83 (copy), v85 (copy), v93 (copy), v149 (copy), v41 (ref)
                if v83 and v85 and not v93 then
                    local l_v149_0 = v149;
                    local l_id_1 = v83.id;
                    local l_v83_0 = v83;
                    local v157 = l_v83_0.state and l_v83_0.state.timeOnScreenMs;
                    if v157 then
                        v157 = v157 / 1000;
                    end;
                    l_v149_0(l_id_1, (v157 or v41.DefaultNotificationDisplayTime) + 1, v83);
                end;
            end;
            local function _(v159, v160, v161) --[[ Line: 343 ]]
                if v159 then
                    v160();
                    return;
                else
                    v161();
                    return;
                end;
            end;
            local v165 = v16.useCallback(function() --[[ Line: 352 ]]
                -- upvalues: v113 (copy)
                for _, v164 in ipairs(v113) do
                    task.cancel(v164);
                end;
            end, l_dependencyArray_0(v113));
            local v171 = v16.useCallback(function(v166, v167) --[[ Line: 359 ]]
                -- upvalues: v40 (ref), v151 (copy), v153 (copy), l_JoinExperience_0 (ref), v66 (copy), v102 (copy), l_default_1 (copy), v132 (copy), v126 (copy), l_HttpService_0 (ref), l_FFlagToastNotificationEnableNewLogger_0 (ref), v11 (ref), l_Logging_0 (ref), l_ToastNotificationProtocol_0 (ref)
                if v166.actionType == v40.ActionTypeEnum.Dismiss then
                    v151();
                    return;
                else
                    if v166.actionType == v40.ActionTypeEnum.Deeplink then
                        if v153() then
                            if l_JoinExperience_0(v166.path or "", v66) then
                                v102(false);
                                if v167 then
                                    local l_id_2 = v167.id;
                                    l_default_1:dismissNotification(l_id_2);
                                    return;
                                end;
                            else
                                v132(v40.ToastNotificationActionsEnum.DeeplinkFailed, v126, v167);
                                v151();
                                return;
                            end;
                        end;
                    elseif v166.actionType == v40.ActionTypeEnum.VoltronBroadcast then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 386 ]]
                            -- upvalues: l_HttpService_0 (ref), v166 (copy)
                            return l_HttpService_0:JSONDecode(v166.parameters);
                        end);
                        if l_status_1 then
                            l_default_1:voltronBroadcast(v166.messageId, l_result_1);
                            return;
                        elseif l_FFlagToastNotificationEnableNewLogger_0 then
                            v11:warning("Invalid decoded payload for voltronBroadcast");
                            return;
                        else
                            l_Logging_0.warn("Invalid decoded payload for voltronBroadcast");
                            return;
                        end;
                    elseif v166.actionType == v40.ActionTypeEnum.UpdateState and v166.nextState ~= nil and v166.nextState ~= "" and v167 and v167.id then
                        l_ToastNotificationProtocol_0:updateNotification(v167.id, v166.nextState);
                    end;
                    return;
                end;
            end, l_dependencyArray_0(v151, v153));
            local v187 = v16.useCallback(function(v172) --[[ Line: 419 ]]
                -- upvalues: v171 (copy), v165 (copy), l_calculateTimeRemaining_0 (ref), v114 (copy)
                local _ = function(v173) --[[ Line: 420 ]] --[[ Name: executeAllActions ]]
                    -- upvalues: v171 (ref), v172 (copy)
                    for _, v175 in ipairs(v173) do
                        v171(v175, v172);
                    end;
                end;
                v165();
                if v172.timers then
                    local v177 = {};
                    for _, v179 in pairs(v172.timers) do
                        local v180 = l_calculateTimeRemaining_0(v179, v172.notificationReceivedTimestampMs, v172.displayTimestamp);
                        if v180 > 0 then
                            table.insert(v177, (task.delay(v180 / 1000, function() --[[ Line: 436 ]]
                                -- upvalues: v179 (copy), v171 (ref), v172 (copy)
                                local l_actions_0 = v179.actions;
                                for _, v183 in ipairs(l_actions_0) do
                                    v171(v183, v172);
                                end;
                            end)));
                        else
                            local l_actions_1 = v179.actions;
                            for _, v186 in ipairs(l_actions_1) do
                                v171(v186, v172);
                            end;
                        end;
                    end;
                    if #v177 > 0 then
                        v114(v177);
                    end;
                end;
            end, l_dependencyArray_0(v171, v165, l_calculateTimeRemaining_0));
            local v191 = v16.useCallback(function(v188) --[[ Line: 452 ]]
                -- upvalues: v99 (copy), v100 (copy), v132 (copy), v126 (copy), v83 (copy), v23 (ref), v171 (copy), v40 (ref), v153 (copy)
                if v99 then
                    return;
                else
                    v100(true);
                    if v188.eventName then
                        v132(v188.eventName, v126, v83);
                    end;
                    if v188.actionEventParams and v83 then
                        v23:DispatchEvent(v23.ToastEvents.UserAction, v83.notificationType, {
                            notificationData = v83, 
                            visualItem = v188, 
                            userActionType = "click", 
                            parameters = v188.actionEventParams
                        });
                    end;
                    if v188.actions and #v188.actions > 0 then
                        for _, v190 in ipairs(v188.actions) do
                            v171(v190, v83);
                            if v190.actionType == v40.ActionTypeEnum.Deeplink and v153() then
                                break;
                            end;
                        end;
                    end;
                    v100(false);
                    return;
                end;
            end, {
                v83, 
                v151, 
                v99, 
                v153
            });
            local function v198(v192, v193) --[[ Line: 494 ]]
                -- upvalues: v40 (ref), v132 (copy), v126 (copy), l_default_0 (ref), l_default_1 (copy), v84 (copy), v41 (ref), v149 (copy), v187 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v96 (copy)
                v192.displayTimestamp = DateTime.now().UnixTimestampMillis;
                local v194 = if v193 == "update" then v40.ToastNotificationActionsEnum.Update else v40.ToastNotificationActionsEnum.Display;
                v132(v194, v126, v192);
                if l_default_0:isSnoozedNotificationType(v192.notificationType) then
                    local l_id_3 = v192.id;
                    l_default_1:dismissNotification(l_id_3);
                    return;
                else
                    v84(v192);
                    local v196 = v192.state and v192.state.timeOnScreenMs;
                    if v196 then
                        v196 = v196 / 1000;
                    end;
                    local v197 = (v196 or v41.DefaultNotificationDisplayTime) + 1;
                    v149(v192.id, v197, v192);
                    if v193 == "display" then
                        v187(v192);
                    end;
                    if l_game_EngineFeature_0 and v192 and v192.luaNotifInfo then
                        l_GuiService_0:OnNotificationDisplayed(v192.id);
                    end;
                    v96(nil);
                    return;
                end;
            end;
            local function _(v199) --[[ Line: 526 ]]
                -- upvalues: v95 (copy), v41 (ref), v198 (copy), v23 (ref), v96 (copy)
                if v95 then
                    task.cancel(v95);
                end;
                local v200 = task.delay(v41.DisplayNotificationDelay, function() --[[ Line: 530 ]]
                    -- upvalues: v198 (ref), v199 (copy), v23 (ref)
                    v198(v199, "display");
                    v23:DispatchEvent(v23.ToastEvents.Display, v199.notificationType, v199);
                end);
                v96(v200);
            end;
            local v205 = v16.useCallback(function(v202) --[[ Line: 537 ]]
                -- upvalues: l_GetFFlagToastNotificationsGamepadSupport_0 (ref), l_GuiService_0 (ref), v40 (ref), l_GetFFlagEnableChatNewMessage_0 (ref), l_default_1 (copy), v67 (copy), v50 (ref), l_ixpHelper_0 (ref), l_getFStringDesktopToastNotificationLayer_0 (ref), l_marshalNotificationData_0 (ref), v86 (copy), v23 (ref)
                if l_GetFFlagToastNotificationsGamepadSupport_0() and l_GuiService_0:IsTenFootInterface() and v202 and v202.notificationType ~= nil and v202.notificationType ~= v40.NotificationTypeEnum.ClientNotification then
                    return;
                elseif v202 and v202.notificationType == v40.NotificationTypeEnum.ChatNewMessage and not l_GetFFlagEnableChatNewMessage_0() and v202.content and v202.content.id then
                    local l_id_4 = v202.content.id;
                    l_default_1:dismissNotification(l_id_4);
                    return;
                else
                    if v67 and v50 and v202 and v202.notificationType ~= v40.NotificationTypeEnum.CallReceived then
                        l_ixpHelper_0.logUserLayerExposure(l_getFStringDesktopToastNotificationLayer_0());
                    end;
                    if v202 and v202.content and v202.content.id ~= nil then
                        local v204 = l_marshalNotificationData_0(v202);
                        v86(v204);
                        v23:DispatchEvent(v23.ToastEvents.AttemptDisplay, v204.notificationType, v204);
                        return;
                    else
                        v86(nil);
                        return;
                    end;
                end;
            end, {});
            v16.useEffect(function() --[[ Line: 585 ]]
                -- upvalues: v85 (copy), v83 (copy), v198 (copy), v51 (ref), v23 (ref), v95 (copy), v41 (ref), v96 (copy)
                if v85 then
                    if v83 and v83.id == v85.id then
                        v198(v85, "update");
                        if v51 then
                            v23:DispatchEvent(v23.ToastEvents.Update, v85.notificationType, v85);
                            return;
                        end;
                    else
                        local l_v85_0 = v85;
                        if v95 then
                            task.cancel(v95);
                        end;
                        local v207 = task.delay(v41.DisplayNotificationDelay, function() --[[ Line: 530 ]]
                            -- upvalues: v198 (ref), l_v85_0 (copy), v23 (ref)
                            v198(l_v85_0, "display");
                            v23:DispatchEvent(v23.ToastEvents.Display, l_v85_0.notificationType, l_v85_0);
                        end);
                        v96(v207);
                    end;
                end;
            end, {
                v85
            });
            v16.useEffect(function() --[[ Line: 607 ]]
                -- upvalues: v85 (copy), v83 (copy), v82 (copy)
                local v208 = v85 and v83 and v85.id == v83.id or false;
                v82(v208);
            end, {
                v85, 
                v83
            });
            v16.useEffect(function() --[[ Line: 619 ]]
                -- upvalues: v48 (ref), v118 (copy), v110 (copy)
                if v48 and v118 then
                    local v210 = v118.RobloxEventReceived:Connect(function(v209) --[[ Line: 621 ]]
                        -- upvalues: v110 (ref)
                        if v209.namespace == "AppInput" then
                            if v209.detailType == "Focused" then
                                v110(false);
                                return;
                            elseif v209.detailType == "Unfocused" then
                                v110(true);
                            end;
                        end;
                    end);
                    return function() --[[ Line: 633 ]]
                        -- upvalues: v210 (copy)
                        v210:Disconnect();
                    end;
                else
                    return function() --[[ Line: 637 ]]

                    end;
                end;
            end, {});
            v16.useEffect(function() --[[ Line: 642 ]]
                -- upvalues: v48 (ref), v81 (copy), v99 (copy), v105 (copy), v107 (copy), v109 (copy), v111 (copy), v104 (copy)
                local v211 = nil;
                v211 = if v48 then v81 and (v99 or v105 or v107 or v109 or v111) else v81 and (v99 or v105 or v107);
                v104(v211);
            end, {
                v81, 
                v99, 
                v105, 
                v107, 
                v109, 
                v111
            });
            v16.useEffect(function() --[[ Line: 664 ]]
                -- upvalues: v103 (copy), v139 (copy), v158 (copy)
                local l_v103_0 = v103;
                local l_v139_0 = v139;
                local l_v158_0 = v158;
                if l_v103_0 then
                    l_v139_0();
                    return;
                else
                    l_v158_0();
                    return;
                end;
            end, {
                v103
            });
            local v215 = nil;
            local v216 = nil;
            if l_GetFFlagEnableToastReduceMotionSupport_0() then
                local v217, v218 = v22.useAnimatedBinding(1, function() --[[ Line: 673 ]]
                    -- upvalues: v81 (copy), v84 (copy), v165 (copy)
                    if not v81 then
                        v84(nil);
                        v165();
                    end;
                end);
                v215 = v217;
                v216 = v218;
                v16.useEffect(function() --[[ Line: 680 ]]
                    -- upvalues: v216 (ref), v22 (ref), v81 (copy), v58 (ref)
                    v216(v22.spring(v81 and 0 or 1, v58));
                end, l_dependencyArray_0(v81, v216));
            end;
            v16.useEffect(function() --[[ Line: 687 ]]
                -- upvalues: l_GetFFlagEnableToastReduceMotionSupport_0 (ref), l_calculateToastPosition_0 (ref), v81 (copy), l_isToastToRight_0 (ref), v79 (copy), v68 (copy), v73 (ref), v88 (ref)
                local v219 = nil;
                v219 = if l_GetFFlagEnableToastReduceMotionSupport_0() then l_calculateToastPosition_0(v81, l_isToastToRight_0(v79), v68, v73) else l_calculateToastPosition_0(v81, l_isToastToRight_0(v79), v68);
                v88(v219);
            end, {
                v79, 
                v81, 
                v73
            });
            v16.useEffect(function() --[[ Line: 709 ]]
                -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v66 (copy), v78 (copy), v98 (copy), v41 (ref), v80 (copy), v122 (copy)
                local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
                local v221 = l_getDeviceOrientation_0(l_ViewportSize_1);
                local v222 = l_getNotificationSize_0(v66, l_ViewportSize_1.X);
                v78(v222);
                v98(v66 and workspace.CurrentCamera.ViewportSize.X < v41.CompactCardThreashold);
                v80(v221);
                l_ViewportSize_1 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v122);
                return function() --[[ Line: 715 ]]
                    -- upvalues: l_ViewportSize_1 (copy)
                    if l_ViewportSize_1 then
                        l_ViewportSize_1:Disconnect();
                    end;
                end;
            end, {});
            v16.useEffect(function() --[[ Line: 723 ]]
                -- upvalues: v95 (copy), v93 (copy), v115 (copy), v116 (copy)
                return function() --[[ Line: 724 ]]
                    -- upvalues: v95 (ref), v93 (ref), v115 (ref), v116 (ref)
                    if v95 then
                        task.cancel(v95);
                    end;
                    if v93 then
                        task.cancel(v93);
                    end;
                    if v115 then
                        v116(nil);
                        v115:Fire(false);
                        v115:Destroy();
                    end;
                end;
            end, {});
            v16.useEffect(function() --[[ Line: 740 ]]
                -- upvalues: v67 (copy), v50 (ref), l_ixpHelper_0 (ref), l_getFStringDesktopToastNotificationLayer_0 (ref), v40 (ref), v66 (copy), l_default_1 (copy)
                if v67 and v50 then
                    local v223 = l_ixpHelper_0.getIxpLayerData(l_getFStringDesktopToastNotificationLayer_0());
                    local v224 = v223 and v223.isDesktopToastNotificationEnabled;
                    task.delay(0, function() --[[ Line: 747 ]]
                        -- upvalues: v40 (ref), v224 (copy), v66 (ref), l_default_1 (ref)
                        local v225 = {
                            v40.ChannelListEnum.Desktop
                        };
                        if v224 then
                            table.insert(v225, v40.ChannelListEnum.Dual);
                            if v66 then
                                table.insert(v225, v40.ChannelListEnum.Experience);
                            else
                                table.insert(v225, v40.ChannelListEnum.App);
                            end;
                        end;
                        l_default_1:setupNotifications(v225);
                    end);
                    return;
                else
                    task.delay(0, function() --[[ Line: 760 ]]
                        -- upvalues: v66 (ref), v40 (ref), v67 (ref), l_default_1 (ref)
                        local v226 = if v66 then {
                            v40.ChannelListEnum.Experience, 
                            v40.ChannelListEnum.Dual
                        } else {
                            v40.ChannelListEnum.App, 
                            v40.ChannelListEnum.Dual
                        };
                        if v67 then
                            table.insert(v226, v40.ChannelListEnum.Desktop);
                        end;
                        l_default_1:setupNotifications(v226);
                    end);
                    return;
                end;
            end, {});
            v16.useEffect(function() --[[ Line: 780 ]]
                -- upvalues: l_default_1 (copy), v205 (copy)
                local v227 = l_default_1:listenToDisplayNotification(v205);
                return function() --[[ Line: 782 ]]
                    -- upvalues: v227 (copy)
                    v227:Disconnect();
                end;
            end, {
                v205
            });
            local v228 = l_IsVRAppBuild_0();
            local v229 = v81 or not v228;
            local v230 = if l_GetFFlagEnableToastReduceMotionSupport_0() then v125 and not l_TouchEnabled_0 and not v228 and v81 else v125 and not l_TouchEnabled_0 and not v228;
            local v233 = v16.useMemo(function() --[[ Line: 798 ]]
                -- upvalues: v16 (ref), l_SpringAnimatedItem_0 (ref), v77 (copy), v229 (copy), v83 (copy), v132 (copy), v40 (ref), v126 (copy), v106 (copy), v87 (ref), v58 (ref), v228 (copy), v81 (copy), v84 (copy), v165 (copy), v37 (ref), v151 (copy), l_game_EngineFeature_0 (ref), v39 (ref), v112 (copy), v33 (ref), v97 (copy), v191 (copy), l_GetFFlagEnableToastReduceMotionSupport_0 (ref), v215 (ref), v34 (ref), v125 (copy), v230 (copy), v41 (ref), v117 (copy), v152 (copy), v108 (copy), l_ImageSetLabel_0 (ref), v45 (ref)
                return v16.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                    regularProps = {
                        ClipsDescendants = false, 
                        Size = v77, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Active = true, 
                        Visible = v229 and v83 ~= nil, 
                        [v16.Event.MouseEnter] = function() --[[ Line: 807 ]]
                            -- upvalues: v132 (ref), v40 (ref), v126 (ref), v83 (ref), v106 (ref)
                            v132(v40.ToastNotificationActionsEnum.Hover, v126, v83);
                            v106(true);
                        end, 
                        [v16.Event.MouseLeave] = function() --[[ Line: 815 ]]
                            -- upvalues: v106 (ref)
                            v106(false);
                        end
                    }, 
                    animatedValues = v87, 
                    springOptions = v58, 
                    mapValuesToProps = function(v231) --[[ Line: 821 ]] --[[ Name: mapValuesToProps ]]
                        -- upvalues: v228 (ref)
                        return {
                            Position = if v228 then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(v231.positionX, v231.positionXOffset, v231.positionY, v231.positionYOffset), 
                            AnchorPoint = if v228 then Vector2.new(0.5, 0.5) else Vector2.new(v231.anchorX, v231.anchorY)
                        };
                    end, 
                    onComplete = function() --[[ Line: 836 ]] --[[ Name: onComplete ]]
                        -- upvalues: v81 (ref), v84 (ref), v165 (ref)
                        if not v81 then
                            v84(nil);
                            v165();
                        end;
                    end
                }, {
                    SwipeDetector = v16.createElement(v37, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        swipeEnabled = v81, 
                        swipeCallback = function(v232) --[[ Line: 847 ]] --[[ Name: swipeCallback ]]
                            -- upvalues: v132 (ref), v40 (ref), v126 (ref), v83 (ref), v151 (ref)
                            if v232 == Enum.SwipeDirection.Up or v232 == Enum.SwipeDirection.Right then
                                v132(v40.ToastNotificationActionsEnum.Dismissed, v126, v83);
                                v151();
                            end;
                        end
                    }, {
                        NotificationProvider = if l_game_EngineFeature_0 and v83 and v83.luaNotifInfo and v83.id then v16.createElement(v39, {
                            notificationInfo = v83.luaNotifInfo, 
                            notificationId = v83.id, 
                            onPause = v112
                        }) else v16.createElement(v33, {
                            state = v83 and v83.state, 
                            isCompact = v97, 
                            handleActions = v191, 
                            notificationReceivedTimestampMs = v83 and v83.notificationReceivedTimestampMs, 
                            timers = v83 and v83.timers, 
                            displayTimestampMs = v83 and v83.displayTimestamp
                        }, {
                            NotificationCardCanvasGroup = if l_GetFFlagEnableToastReduceMotionSupport_0() and v83 then v16.createElement("CanvasGroup", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = v77, 
                                BackgroundTransparency = 1, 
                                GroupTransparency = v215, 
                                LayoutOrder = 2
                            }, {
                                NotificationCard = v16.createElement(v34, {
                                    isHover = v125
                                })
                            }) else nil, 
                            NotificationCard = if not l_GetFFlagEnableToastReduceMotionSupport_0() then v16.createElement(v34, {
                                LayoutOrder = 2, 
                                isHover = v125
                            }) else nil, 
                            ToastCloseButton = if v230 then v16.createElement("TextButton", {
                                ZIndex = 2, 
                                LayoutOrder = 1, 
                                AnchorPoint = Vector2.new(0, 0), 
                                Size = UDim2.new(0, v41.CardSizeDefault.closeButton, 0, v41.CardSizeDefault.closeButton), 
                                Position = UDim2.new(0, -10, 0, -10), 
                                BackgroundTransparency = v117.Theme.BackgroundUIDefault.Transparency, 
                                BackgroundColor3 = v117.Theme.BackgroundUIDefault.Color, 
                                Text = "", 
                                [v16.Event.Activated] = v152, 
                                [v16.Event.MouseEnter] = function() --[[ Line: 907 ]]
                                    -- upvalues: v108 (ref)
                                    v108(true);
                                end, 
                                [v16.Event.MouseLeave] = function() --[[ Line: 910 ]]
                                    -- upvalues: v108 (ref)
                                    v108(false);
                                end
                            }, {
                                Border = v16.createElement("UIStroke", {
                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                                    Color = v117.Theme.UIDefault.Color
                                }), 
                                UICorner = v16.createElement("UICorner", {
                                    CornerRadius = v41.DefaultCardCloseButtonCornerRadius
                                }), 
                                CloseButtonIcon = v16.createElement(l_ImageSetLabel_0, {
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    BackgroundTransparency = 1, 
                                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                                    Size = UDim2.new(0, v41.CardSizeDefault.closeIcon, 0, v41.CardSizeDefault.closeIcon), 
                                    Image = v45, 
                                    ImageColor3 = v117.Theme.SystemPrimaryDefault.Color
                                })
                            }) else nil
                        })
                    })
                });
            end, {
                v41, 
                v117, 
                v83, 
                v229, 
                v81, 
                v97, 
                v230, 
                v125, 
                v87, 
                v152, 
                v106, 
                v108, 
                v191
            });
            if v228 then
                return v16.createElement(v38, {
                    isConfirmModalOpen = v101, 
                    isToastOpen = v81, 
                    isCoreScript = v66, 
                    ToastComponent = v233, 
                    ToastNotificationSnoozeMenu = v16.createElement(v35), 
                    ConfirmationModalComponent = v16.createElement(l_DeeplinkConfirmationModal_0, {
                        closeCallback = v138, 
                        backgroundTransparency = 1
                    })
                });
            else
                return v16.createElement("ScreenGui", {
                    DisplayOrder = v65.displayOrder, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    IgnoreGuiInset = true
                }, {
                    Toast = v233, 
                    ToastNotificationSnoozeMenu = v16.createElement(v35), 
                    DeeplinkConfirmationModal = v101 and v16.createElement(l_DeeplinkConfirmationModal_0, {
                        closeCallback = v138
                    })
                });
            end;
        end;
    end;
end;