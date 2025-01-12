local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v10.App.Button.Button;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_Toast_0 = v10.App.Dialog.Toast;
local l_Images_0 = v10.App.ImageSet.Images;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_validateStyle_0 = v10.Style.Validator.validateStyle;
local v17 = require(script.Parent.Parent.PromptType);
local v18 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy);
local v19 = require(script.Parent.VoiceChatConsentModal);
local v20 = require(script.Parent.VoiceChatTooltip);
local v21 = require(script.Parent.DevicePermissionsModal);
local v22 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v23 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local v28 = require(v23.Flags.GetFFlagEnableVoiceNudge);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds);
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceBanShowToastOnSubsequentJoins);
local v31 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v32 = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false);
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateNudgeV3VoiceBanUI);
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceUpsell);
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceConsentAnalytics);
local l_GetFFlagShowDevicePermissionsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceUX);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSendDevicePermissionsModalAnalytics);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local v42 = nil;
v42 = if v31() then require(l_RobloxGui_0.Modules.RobloxTranslator) else require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local v43 = nil;
if v41() then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v43 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local _ = v5.PureComponent:extend("VoiceChatPromptFrame");
local v46 = {
    [v17.None] = "", 
    [v17.NotAudible] = v42:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"), 
    [v17.Permission] = v42:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v17.Retry] = v42:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v17.Place] = "Exceeds Max Players", 
    [v17.User] = "Not Eligible for Voice", 
    [v17.VoiceChatSuspendedTemporaryAvatarChat] = v42:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"), 
    [v17.VoiceChatSuspendedTemporary] = v42:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v17.VoiceChatSuspendedTemporaryB] = v42:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v17.VoiceChatSuspendedPermanent] = v42:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v17.VoiceLoading] = v42:FormatByKey("Feature.SettingsHub.Prompt.Connecting"), 
    [v17.VoiceToxicityModal] = v42:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v17.VoiceToxicityToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v17.VoiceToxicityFeedbackToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"), 
    [v17.VoiceChatSuspendedTemporaryToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v17.VoiceConsentDeclinedToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"), 
    [v17.VoiceConsentAcceptedToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v17.VoiceConsentModalV1] = v42:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v17.VoiceConsentModalV2] = v42:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"), 
    [v17.VoiceConsentModalV3] = v42:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v17.JoinedVoiceToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v17.JoinVoiceSTUX] = v42:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v17.LeaveVoice] = v42:FormatByKey("Feature.SettingsHub.Prompt.LeaveVoiceChat"), 
    [v17.JoinVoice] = v42:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"), 
    [v17.DevicePermissionsModal] = v42:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"), 
    [v17.VoiceDataConsentOptOutToast] = if v41() then v43:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil
};
local v48 = {
    [v17.None] = "", 
    [v17.NotAudible] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"), 
    [v17.Permission] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"), 
    [v17.Retry] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"), 
    [v17.Place] = "Spatial voice is only available for places with Max Players of 30 or less.", 
    [v17.User] = "This account is not eligible to use Spatial Voice.", 
    [v17.VoiceChatSuspendedTemporary] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"), 
    [v17.VoiceChatSuspendedTemporaryAvatarChat] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"), 
    [v17.VoiceChatSuspendedTemporaryB] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"), 
    [v17.VoiceChatSuspendedPermanent] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"), 
    [v17.VoiceLoading] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"), 
    [v17.VoiceToxicityModal] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"), 
    [v17.VoiceToxicityToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"), 
    [v17.VoiceToxicityFeedbackToast] = if v33() then v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow") else v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThankYouForFeedback"), 
    [v17.VoiceChatSuspendedTemporaryToast] = function(v47) --[[ Line: 158 ]]
        -- upvalues: v42 (ref)
        return v42:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", {
            dateTime = v47
        });
    end, 
    [v17.VoiceConsentDeclinedToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"), 
    [v17.VoiceConsentAcceptedToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"), 
    [v17.VoiceConsentModalV1] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"), 
    [v17.VoiceConsentModalV2] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v17.VoiceConsentModalV3] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v17.JoinedVoiceToast] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"), 
    [v17.JoinVoiceSTUX] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"), 
    [v17.DevicePermissionsModal] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"), 
    [v17.VoiceDataConsentOptOutToast] = if v41() then v43:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil
};
if l_RunService_0:IsStudio() then
    v46[v17.Place] = v42:FormatByKey("Feature.SettingsHub.Prompt.Place");
    v46[v17.User] = v42:FormatByKey("Feature.SettingsHub.Prompt.User");
    v48[v17.Place] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place");
    v48[v17.User] = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User");
end;
local _ = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect");
local v50 = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations");
local v51 = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil");
local v52 = v42:FormatByKey("Feature.SettingsHub.Prompt.Understand");
local v53 = v42:FormatByKey("Feature.SettingsHub.Prompt.GotIt");
local v54 = v42:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge");
local v55 = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2");
local function _(v56) --[[ Line: 208 ]] --[[ Name: PromptTypeIsBan ]]
    -- upvalues: v17 (copy)
    local v57 = true;
    if v56 ~= v17.VoiceChatSuspendedPermanent then
        v57 = true;
        if v56 ~= v17.VoiceChatSuspendedTemporary then
            v57 = true;
            if v56 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                v57 = v56 == v17.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v57;
end;
local function _(v59) --[[ Line: 215 ]] --[[ Name: IsModalNudge ]]
    -- upvalues: v17 (copy)
    return v59 == v17.VoiceToxicityModal;
end;
local function _(v61) --[[ Line: 219 ]] --[[ Name: IsVoiceConsentModal ]]
    -- upvalues: v17 (copy)
    local v62 = true;
    if v61 ~= v17.VoiceConsentModalV1 then
        v62 = true;
        if v61 ~= v17.VoiceConsentModalV2 then
            v62 = v61 == v17.VoiceConsentModalV3;
        end;
    end;
    return v62;
end;
local function _(v64) --[[ Line: 225 ]] --[[ Name: IsDevicePermissionsModal ]]
    -- upvalues: v17 (copy)
    return v64 == v17.DevicePermissionsModal;
end;
local function _(v66) --[[ Line: 229 ]] --[[ Name: PromptTypeIsModal ]]
    -- upvalues: v17 (copy)
    local v67 = true;
    if v66 ~= v17.VoiceChatSuspendedPermanent then
        v67 = true;
        if v66 ~= v17.VoiceChatSuspendedTemporary then
            v67 = true;
            if v66 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                v67 = v66 == v17.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v67 then
        v67 = v66 == v17.VoiceToxicityModal;
        if not v67 then
            v67 = true;
            if v66 ~= v17.VoiceConsentModalV1 then
                v67 = true;
                if v66 ~= v17.VoiceConsentModalV2 then
                    v67 = v66 == v17.VoiceConsentModalV3;
                end;
            end;
            if not v67 then
                v67 = v66 == v17.DevicePermissionsModal;
            end;
        end;
    end;
    return v67;
end;
local function _(v69) --[[ Line: 236 ]] --[[ Name: PromptTypeIsVoiceConsent ]]
    -- upvalues: v17 (copy)
    local v70 = true;
    if v69 ~= v17.VoiceConsentDeclinedToast then
        v70 = v69 == v17.VoiceConsentAcceptedToast;
    end;
    return v70;
end;
local function _(v72) --[[ Line: 240 ]] --[[ Name: PromptTypeIsVoiceDataConsent ]]
    -- upvalues: v17 (copy)
    return v72 == v17.VoiceDataConsentOptOutToast;
end;
local function _(v74) --[[ Line: 244 ]] --[[ Name: PromptTypeIsConnectDisconnectToast ]]
    -- upvalues: v17 (copy)
    local v75 = true;
    if v74 ~= v17.JoinVoice then
        v75 = v74 == v17.LeaveVoice;
    end;
    return v75;
end;
local function _(v77) --[[ Line: 248 ]] --[[ Name: ShouldShowBannedUntil ]]
    -- upvalues: v17 (copy)
    local v78 = true;
    if v77 ~= v17.VoiceChatSuspendedTemporary then
        v78 = true;
        if v77 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
            v78 = true;
            if v77 ~= v17.VoiceChatSuspendedTemporaryToast then
                v78 = v77 == v17.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v78;
end;
local function _(v80) --[[ Line: 255 ]] --[[ Name: ShouldShowSecondaryButton ]]
    -- upvalues: v17 (copy)
    local v81 = true;
    if v80 ~= v17.VoiceChatSuspendedTemporaryB then
        v81 = v80 == v17.VoiceToxicityModal;
    end;
    return v81;
end;
local v83 = v5.PureComponent:extend("VoiceChatPromptFrame");
v83.validateProps = v6.strictInterface({
    promptSignal = v6.optional(v6.RBXScriptSignal), 
    errorText = v6.optional(v6.string), 
    bannedUntil = v6.optional(v6.string), 
    onContinueFunc = v6.optional(v6.callback), 
    onPrimaryActivated = v6.optional(v6.callback), 
    onSecondaryActivated = v6.optional(v6.callback), 
    onReadyForSignal = v6.optional(v6.callback), 
    Analytics = v6.optional(v6.table), 
    VoiceChatServiceManager = v6.optional(v6.table), 
    showNewContent = v6.optional(v6.boolean), 
    showCheckbox = v6.optional(v6.boolean), 
    showDataConsentToast = v6.optional(v6.boolean), 
    policyMapper = v6.optional(v6.callback), 
    appStyle = l_validateStyle_0, 
    settingsAppAvailable = v6.optional(v6.boolean), 
    UserInputService = v6.optional(v6.table)
});
v83.init = function(v84) --[[ Line: 279 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v42 (ref), v46 (copy), v48 (copy), v35 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v40 (copy), v30 (copy), v34 (copy), v38 (copy), l_Images_0 (copy), v41 (copy), v33 (copy), v5 (copy), l_ContextActionService_0 (copy), v32 (copy)
    v84.promptStyle = {
        Theme = v84.props.appStyle.Theme, 
        Font = v84.props.appStyle.Font
    };
    v84.state = {
        screenSize = Vector2.new(0, 0), 
        promptType = v17.None, 
        toastContent = nil, 
        banEnd = "", 
        showPrompt = true
    };
    if v84.props.showNewContent then
        local v85 = v42:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended");
        local v86 = v42:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2");
        v46[v17.VoiceChatSuspendedTemporary] = v85;
        v46[v17.VoiceChatSuspendedPermanent] = v85;
        v48[v17.VoiceChatSuspendedTemporary] = v86;
    end;
    v84.onScreenSizeChanged = function(v87) --[[ Line: 301 ]]
        -- upvalues: v84 (copy)
        if v84.state.screenSize ~= v87.AbsoluteSize then
            v84:setState({
                screenSize = v87.AbsoluteSize
            });
        end;
    end;
    v84.promptSignalCallback = function(v88) --[[ Line: 309 ]]
        -- upvalues: v17 (ref), v84 (copy), v35 (ref), l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref), v40 (ref), v46 (ref), v48 (ref), v30 (ref), v34 (ref), v38 (ref), l_Images_0 (ref), v41 (ref), v42 (ref), v33 (ref), v5 (ref)
        local v89 = false;
        local v90 = false;
        local v91 = true;
        if v88 ~= v17.VoiceChatSuspendedPermanent then
            v91 = true;
            if v88 ~= v17.VoiceChatSuspendedTemporary then
                v91 = true;
                if v88 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                    v91 = v88 == v17.VoiceChatSuspendedTemporaryB;
                end;
            end;
        end;
        if v91 then
            if v84.props.Analytics then
                v84.props.Analytics:reportBanMessageEvent("Shown");
            end;
            if v84.props.VoiceChatServiceManager then
                v84.props.VoiceChatServiceManager:reportBanMessage("Shown");
            end;
        end;
        v91 = true;
        if v88 ~= v17.VoiceConsentModalV1 then
            v91 = true;
            if v88 ~= v17.VoiceConsentModalV2 then
                v91 = v88 == v17.VoiceConsentModalV3;
            end;
        end;
        if v91 and v35() and v84.props.Analytics then
            v91 = "";
            if l_game_EngineFeature_0 then
                v91 = l_RbxAnalyticsService_0:GetPlaySessionId();
            end;
            v84.props.Analytics:reportInExpConsent("shown", v84.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, v91);
        end;
        if v40() and v88 == v17.DevicePermissionsModal and v84.props.Analytics and v84.props.VoiceChatServiceManager then
            v84.props.Analytics:reportDevicePermissionsModalEvent("Shown", v84.props.VoiceChatServiceManager:GetSessionId(), v84.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData());
        end;
        if v88 and v88 ~= v17.None then
            v91 = v46[v88];
            local v92 = v48[v88];
            if v30() then
                if typeof(v91) == "function" then
                    v91 = v91(v84.props.bannedUntil);
                end;
                if typeof(v92) == "function" then
                    v92 = v92(v84.props.bannedUntil);
                end;
            end;
            local v93 = nil;
            if v34() then
                local v94 = true;
                if v88 ~= v17.VoiceConsentDeclinedToast then
                    v94 = v88 == v17.VoiceConsentAcceptedToast;
                end;
                v89 = v94;
            end;
            if not v89 then
                if not v38() or v88 ~= v17.JoinedVoiceToast then
                    if v38() then
                        local v95 = true;
                        if v88 ~= v17.JoinVoice then
                            v95 = v88 == v17.LeaveVoice;
                        end;
                        if v95 then
                            v93 = l_Images_0["icons/actions/info"];
                            v90 = true;
                        end;
                    end;
                    if not v90 then
                        v93 = if v88 == v17.VoiceDataConsentOptOutToast and v41() then nil else l_Images_0["icons/status/alert"];
                        v90 = true;
                    end;
                end;
            end;
            if not v90 then
                if not v90 then
                    v89 = false;
                    v93 = l_Images_0["icons/controls/publicAudioJoin"];
                end;
            end;
            v90 = false;
            v84:setState({
                showPrompt = true, 
                promptType = v88, 
                toastContent = {
                    iconImage = v93, 
                    toastTitle = v91, 
                    toastSubtitle = v92, 
                    onActivated = function() --[[ Line: 378 ]] --[[ Name: onActivated ]]
                        -- upvalues: v84 (ref)
                        if v84.props.onPrimaryActivated then
                            v84.props.onPrimaryActivated();
                        end;
                    end, 
                    onDismissed = function() --[[ Line: 383 ]] --[[ Name: onDismissed ]]

                    end
                }
            });
            local v96 = true;
            if v88 ~= v17.VoiceChatSuspendedTemporary then
                v96 = true;
                if v88 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                    v96 = true;
                    if v88 ~= v17.VoiceChatSuspendedTemporaryToast then
                        v96 = v88 == v17.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v96 then
                v96 = v42:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
                    banDurationInMinutes = v84.props.bannedUntil
                });
                local v97 = if v33() and v88 == v17.VoiceChatSuspendedTemporaryB then v96 else " " .. v84.props.bannedUntil .. ".";
                v84:setState({
                    banEnd = v97
                });
                return;
            end;
        else
            v84:setState({
                promptType = v17.None, 
                toastContent = v5.None
            });
        end;
    end;
    v84.closeVoiceBanPrompt = function() --[[ Line: 408 ]]
        -- upvalues: v84 (copy), l_ContextActionService_0 (ref), v33 (ref), v17 (ref), v32 (ref)
        v84:setState({
            showPrompt = false
        });
        if v84.props.onContinueFunc then
            v84.props.onContinueFunc();
        end;
        l_ContextActionService_0:UnbindCoreAction("CloseVoiceBanPrompt");
        local v98 = v33() and v84.state.promptType == v17.VoiceChatSuspendedTemporaryB;
        if v32 then
            local l_promptType_0 = v84.state.promptType;
            local v100 = true;
            if l_promptType_0 ~= v17.VoiceChatSuspendedPermanent then
                v100 = true;
                if l_promptType_0 ~= v17.VoiceChatSuspendedTemporary then
                    v100 = true;
                    if l_promptType_0 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                        v100 = l_promptType_0 == v17.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v100 and not v98 then
                if v84.props.Analytics then
                    v84.props.Analytics:reportBanMessageEvent("Acknowledged");
                end;
                if v84.props.VoiceChatServiceManager then
                    v84.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
                    return;
                end;
            end;
        elseif not v98 then
            if v84.props.Analytics then
                v84.props.Analytics:reportBanMessageEvent("Acknowledged");
            end;
            if v84.props.VoiceChatServiceManager then
                v84.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
            end;
        end;
    end;
    v84.checkInputStateForClosePrompt = function(_, v102, _) --[[ Line: 443 ]]
        -- upvalues: v84 (copy)
        if v102 == Enum.UserInputState.Begin then
            v84.closeVoiceBanPrompt();
        end;
    end;
    v84.handlePrimayActivated = function() --[[ Line: 449 ]]
        -- upvalues: v84 (copy)
        v84.closeVoiceBanPrompt();
        if v84.props.onPrimaryActivated then
            v84.props.onPrimaryActivated();
        end;
    end;
    v84.handleSecondaryActivated = function() --[[ Line: 456 ]]
        -- upvalues: v84 (copy)
        v84.closeVoiceBanPrompt();
        if v84.props.onSecondaryActivated then
            v84.props.onSecondaryActivated();
        end;
    end;
end;
v83.render = function(v104) --[[ Line: 464 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v17 (copy), v33 (copy), v34 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), v28 (copy), l_TextService_0 (copy), v51 (copy), v55 (copy), v50 (copy), v5 (copy), v10 (copy), v22 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v53 (copy), v52 (copy), v54 (copy), v21 (copy), v46 (copy), v48 (copy), l_UserInputService_0 (copy), v19 (copy), l_CoreGui_0 (copy), v38 (copy), v20 (copy), v29 (copy), v39 (copy), v41 (copy), l_Toast_0 (copy), l_ExternalEventConnection_0 (copy)
    local v105 = v27() and v104.props.errorText or nil;
    local v106 = v104.state.promptType == v17.VoiceToxicityModal;
    local v107 = v104.state.promptType == v17.VoiceToxicityToast;
    local v108 = v33() and v104.state.promptType == v17.VoiceChatSuspendedTemporaryB;
    local v109 = v34();
    if v109 then
        local l_promptType_1 = v104.state.promptType;
        v109 = true;
        if l_promptType_1 ~= v17.VoiceConsentModalV1 then
            v109 = true;
            if l_promptType_1 ~= v17.VoiceConsentModalV2 then
                v109 = l_promptType_1 == v17.VoiceConsentModalV3;
            end;
        end;
    end;
    local v111 = l_GetFFlagShowDevicePermissionsModal_0() and v104.state.promptType == v17.DevicePermissionsModal;
    local v112 = if v28() then Enum.AutomaticSize.Y else Enum.AutomaticSize.None;
    local _ = nil;
    local l_promptType_2 = v104.state.promptType;
    local v115 = true;
    if l_promptType_2 ~= v17.VoiceChatSuspendedPermanent then
        v115 = true;
        if l_promptType_2 ~= v17.VoiceChatSuspendedTemporary then
            v115 = true;
            if l_promptType_2 ~= v17.VoiceChatSuspendedTemporaryAvatarChat then
                v115 = l_promptType_2 == v17.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v115 then
        v115 = l_promptType_2 == v17.VoiceToxicityModal;
        if not v115 then
            v115 = true;
            if l_promptType_2 ~= v17.VoiceConsentModalV1 then
                v115 = true;
                if l_promptType_2 ~= v17.VoiceConsentModalV2 then
                    v115 = l_promptType_2 == v17.VoiceConsentModalV3;
                end;
            end;
            if not v115 then
                v115 = l_promptType_2 == v17.DevicePermissionsModal;
            end;
        end;
    end;
    if v115 then
        v115 = v104.state.toastContent.toastTitle;
        l_promptType_2 = v104.promptStyle.Font.Header1.Font;
        local v116 = v104.promptStyle.Font.Header1.RelativeSize * v104.promptStyle.Font.BaseSize;
        local v117 = 20 + l_TextService_0:GetTextSize(v115, v116, l_promptType_2, Vector2.new(325, 1e999)).Y;
        local v118 = if v108 then v104.state.banEnd else v51 .. v104.state.banEnd;
        local v119 = if v104.state.banEnd ~= "" then "<b>" .. v118 .. "</b><br />" .. v104.state.toastContent.toastSubtitle else v104.state.toastContent.toastSubtitle .. v104.state.banEnd;
        local v120 = v105 or v119;
        local l_Font_0 = v104.promptStyle.Font.Body.Font;
        local v122 = v104.promptStyle.Font.Body.RelativeSize * v104.promptStyle.Font.BaseSize;
        local v123 = 20 + l_TextService_0:GetTextSize(v120, v122, l_Font_0, Vector2.new(325, 1e999)).Y;
        if v108 then
            v123 = v123 + 20;
        end;
        local v124 = if v108 then v55 else v50;
        local v125 = 20 + l_TextService_0:GetTextSize(v124, v122, l_Font_0, Vector2.new(325, 1e999)).Y;
        local v126;
        if v33() then
            local l_promptType_3 = v104.state.promptType;
            v126 = true;
            if l_promptType_3 ~= v17.VoiceChatSuspendedTemporaryB then
                v126 = l_promptType_3 == v17.VoiceToxicityModal;
            end;
        else
            v126 = v106;
        end;
        local v128 = v5.createElement("ScreenGui", {
            DisplayOrder = 8, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            Enabled = v104.state.showPrompt, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Overlay = v5.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v104.promptStyle.Theme.Overlay.Color, 
                BackgroundTransparency = v104.promptStyle.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            DialogMainFrame = v5.createElement(v10.Core.ImageSet.ImageSetLabel, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v22.Images.RoundedRect.Image, 
                ImageColor3 = v104.promptStyle.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v104.promptStyle.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = v22.Images.RoundedRect.ScaleType, 
                Size = UDim2.new(0, 365, 0, 55 + v117 + 1 + v123 + 14 + v125 + 36 + 40), 
                AutomaticSize = v112, 
                SliceCenter = v22.Images.RoundedRect.SliceCenter
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 20), 
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = v5.createElement(v10.Core.ImageSet.ImageSetLabel, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v104.state.toastContent.iconImage, 
                    Size = UDim2.new(0, 55, 0, 55), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }), 
                TitleTextContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v117), 
                    AutomaticSize = v112
                }, {
                    TitleText = v5.createElement(v10.App.Text.StyledTextLabel, {
                        fontStyle = v104.promptStyle.Font.Header1, 
                        colorStyle = v104.promptStyle.Theme.SystemPrimaryDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v115
                    })
                }), 
                Divider = v5.createElement("Frame", {
                    BackgroundColor3 = v104.promptStyle.Theme.Divider.Color, 
                    BackgroundTransparency = v104.promptStyle.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(0.8, 0, 0, 1)
                }), 
                DividerSpaceContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 7)
                }), 
                BodyTextContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    Size = UDim2.new(1, 0, 0, v123)
                }, {
                    BodyText = v5.createElement(v10.App.Text.StyledTextLabel, {
                        fontStyle = v104.promptStyle.Font.Body, 
                        colorStyle = v104.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v120
                    })
                }), 
                TextSpaceContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, 7)
                }), 
                SubBodyTextContainer = not v106 and v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 7, 
                    Size = UDim2.new(1, 0, 0, v125), 
                    AutomaticSize = v112
                }, {
                    BodyText = v5.createElement(v10.App.Text.StyledTextLabel, {
                        fontStyle = v104.promptStyle.Font.Body, 
                        colorStyle = v104.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v124
                    })
                }), 
                SpaceContainer2 = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, 10)
                }), 
                ButtonContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 9, 
                    Size = UDim2.new(1, 0, 0, 36), 
                    AutomaticSize = v112
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        FillDirection = if v28() then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 20), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ConfirmButton = v5.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        layoutOrder = 1, 
                        size = if v28() then UDim2.new(1, -5, 0, 48) else UDim2.new(1, -5, 1, 0), 
                        text = if v106 then v53 else v52, 
                        onActivated = if v28() then v104.handlePrimayActivated else v104.closeVoiceBanPrompt
                    }), 
                    SecondaryButton = v126 and v5.createElement(v10.App.Button.LinkButton, {
                        layoutOrder = 1, 
                        size = UDim2.new(1, -5, 0, 36), 
                        text = v54, 
                        colorStyleDefault = "TextMuted", 
                        colorStyleHover = "TextMuted", 
                        onActivated = v104.handleSecondaryActivated
                    })
                })
            })
        });
        if v111 then
            v128 = v5.createElement(v21, {
                titleText = v46[v104.state.promptType], 
                bodyText = v48[v104.state.promptType], 
                handlePrimaryActivated = v104.handlePrimayActivated, 
                handleSecondaryActivated = v104.handleSecondaryActivated, 
                Analytics = v104.props.Analytics, 
                promptStyle = v104.promptStyle, 
                showPrompt = v104.state.showPrompt, 
                settingsAppAvailable = v104.props.settingsAppAvailable, 
                UserInputService = if v104.props.UserInputService ~= nil then v104.props.UserInputService else l_UserInputService_0
            });
        end;
        if v109 then
            v128 = v5.createElement(v19, {
                titleText = v46[v104.state.promptType], 
                bodyText = v48[v104.state.promptType], 
                handlePrimaryActivated = v104.handlePrimayActivated, 
                handleSecondaryActivated = v104.handleSecondaryActivated, 
                Analytics = v104.props.Analytics, 
                showCheckbox = v104.props.showCheckbox, 
                promptStyle = v104.promptStyle, 
                showPrompt = v104.state.showPrompt
            });
        end;
        return (v5.createElement(v5.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = v128
        }));
    elseif v38() and v104.state.promptType == v17.JoinVoiceSTUX then
        return (v5.createElement(v20, {
            titleText = v46[v104.state.promptType], 
            subtitleText = v48[v104.state.promptType], 
            promptStyle = v104.promptStyle, 
            showPrompt = v104.state.showPrompt, 
            onClose = function() --[[ Line: 717 ]] --[[ Name: onClose ]]
                -- upvalues: v104 (copy)
                v104:setState({
                    showPrompt = false
                });
            end, 
            onMenuOpen = v104.hideOnMenuOpen
        }));
    else
        v115 = nil;
        if v38() then
            v115 = if v107 then v29() else if v104.state.promptType == v17.JoinedVoiceToast then v39() else 3;
        end;
        l_promptType_2 = v104.state.showPrompt;
        if v104.state.promptType == v17.VoiceDataConsentOptOutToast and v41() then
            l_promptType_2 = if v104.props.showDataConsentToast then v104.props.showDataConsentToast else false;
        end;
        local l_createElement_0 = v5.createElement;
        local v130 = "Frame";
        local v131 = {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Change.AbsoluteSize] = v104.onScreenSizeChanged
        };
        local v132 = {};
        local v133 = false;
        if v104.state.promptType ~= v17.None then
            v133 = v5.createElement(l_Toast_0, {
                duration = if v107 then v29() else if v38() then v115 else 3, 
                toastContent = v104.state.toastContent, 
                show = l_promptType_2
            });
        end;
        v132.Toast = v133;
        v132.EventConnection = v104.props.promptSignal and v5.createElement(l_ExternalEventConnection_0, {
            event = v104.props.promptSignal, 
            callback = v104.promptSignalCallback
        });
        return (l_createElement_0(v130, v131, v132));
    end;
end;
v83.didMount = function(v134) --[[ Line: 763 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v134.props.onReadyForSignal then
        v134.props.onReadyForSignal();
    end;
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v134.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v134.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB);
end;
v83 = v18.connect(function(v135, _) --[[ Line: 781 ]]
    -- upvalues: v34 (copy)
    return {
        showNewContent = v135.getGameInfoShowChatFeatures(), 
        showCheckbox = not v34() or v135.getDisplayCheckboxInVoiceConsent(), 
        showDataConsentToast = v135.getDisplayCheckboxInVoiceConsent() ~= nil and v135.getDisplayCheckboxInVoiceConsent()
    };
end)(v83);
local function v139(v137) --[[ Line: 789 ]] --[[ Name: WrappedVoiceChatPromptFrame ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), v83 (ref), v7 (copy)
    local v138 = l_useStyle_0();
    return v5.createElement(v83, v7.Dictionary.join(v137, {
        appStyle = v138
    }));
end;
return function(v140) --[[ Line: 798 ]]
    -- upvalues: v8 (copy), v5 (copy), v139 (copy)
    return v8({
        v5.createElement(v139, v140)
    });
end;