local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v12 = UserSettings();
local l_GameSettings_0 = v12.GameSettings;
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_UserGameSettings_0 = v12:GetService("UserGameSettings");
local v16 = require(l_RobloxGui_0.Modules.Common.Url);
local v17 = nil;
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SafetyService_0 = game:GetService("SafetyService");
local v20 = nil;
if game:GetEngineFeature("CaptureModeEnabled") then
    v20 = game:GetService("ExperienceStateCaptureService");
end;
local v21 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local v22 = nil;
if v21() then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v22 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local v24 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v25 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v27 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v28 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v29 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v30 = v29.GetFFlagAvatarChatCoreScriptSupport();
local l_GetFFlagEnableCrossExpVoice_0 = v29.GetFFlagEnableCrossExpVoice;
local l_GetFFlagSelfViewCameraSettings_0 = v29.GetFFlagSelfViewCameraSettings;
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local v34 = require(l_RobloxGui_0.Modules.Flags.FFlagInExperienceSettingsRefactorAnalytics);
local l_GetFFlagAddHapticsToggle_0 = v29.GetFFlagAddHapticsToggle;
local l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0 = v29.GetFFlagEnableCrossExpVoiceVolumeIXPCheck;
local l_GetFFlagEnablePreferredTextSizeSettingInMenus_0 = v29.GetFFlagEnablePreferredTextSizeSettingInMenus;
local v38 = game:DefineFastFlag("CameraSensitivityPadding2", false);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagDebounceConnectDisconnectButton);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFIntDebounceDisconnectButtonDelay);
local v41 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagInExperienceMenuReorderFirstVariant1);
local v42 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagOverrideInExperienceMenuReorderFirstVariant1);
local v43 = game:DefineFastFlag("CameraToggleInitBugFix", false);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local __ = nil;
local v46 = l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0() and l_default_1 and l_default_1.getHasPartyVoiceVolume();
local v47 = {
    ["Enum.SavedQualitySetting.Automatic"] = 0, 
    ["Enum.SavedQualitySetting.QualityLevel1"] = 1, 
    ["Enum.SavedQualitySetting.QualityLevel2"] = 2, 
    ["Enum.SavedQualitySetting.QualityLevel3"] = 3, 
    ["Enum.SavedQualitySetting.QualityLevel4"] = 4, 
    ["Enum.SavedQualitySetting.QualityLevel5"] = 5, 
    ["Enum.SavedQualitySetting.QualityLevel6"] = 6, 
    ["Enum.SavedQualitySetting.QualityLevel7"] = 7, 
    ["Enum.SavedQualitySetting.QualityLevel8"] = 8, 
    ["Enum.SavedQualitySetting.QualityLevel9"] = 9, 
    ["Enum.SavedQualitySetting.QualityLevel10"] = 10
};
local v48 = {
    DevComputerMovementMode = true, 
    DevComputerCameraMode = true, 
    DevEnableMouseLock = true
};
local v49 = {
    DevTouchMovementMode = true, 
    DevTouchCameraMode = true
};
local v50 = l_UserInputService_0.TouchEnabled and "Default (Follow)" or "Default (Classic)";
local v51 = {
    Input = "Input", 
    Output = "Output"
};
local v52 = l_UserInputService_0.TouchEnabled and "Default (Dynamic Thumbstick)" or "Default (Keyboard)";
local v53 = l_UserInputService_0.TouchEnabled and "Tap to Move" or "Click to Move";
local v54 = nil;
if v41 or v42 then
    v54 = require(l_RobloxGui_0.Modules.Settings.Resources.GameSettingsConstants).SETTINGS_MENU_LAYOUT_ORDER;
else
    v54 = {
        OverscanAdjustButton = 1, 
        ShiftLockFrame = 10, 
        CameraModeFrame = 11, 
        MovementModeFrame = 12, 
        GamepadSensitivityFrame = 13, 
        VoiceConnectFrame = 18, 
        VoiceDisconnectFrame = 19, 
        LanguageSelectorFrame = 20, 
        FeedbackModeButton = 30, 
        ChatTranslationFrame = 40, 
        ChatLanguageSelectorFrame = 41, 
        ChatTranslationToggleFrame = 42, 
        MouseAdvancedFrame = 50, 
        DeviceFrameInput = 60, 
        DeviceFrameOutput = 61, 
        VolumeFrame = 62, 
        HapticsFrame = v46 and 64 or 63, 
        FullScreenFrame = 70, 
        GraphicsEnablerFrame = 71, 
        GraphicsQualityFrame = 72, 
        ReducedMotionFrame = 73, 
        PreferredTransparencyFrame = 74, 
        PreferredTextSizeFrame = 75, 
        UiNavigationKeyBindEnabledFrame = 76, 
        PerformanceStatsFrame = 80, 
        MicroProfilerFrame = 81, 
        CameraInvertedFrame = 90, 
        CameraDeviceFrame = 91, 
        VREnabledFrame = 100, 
        DeveloperConsoleButton = 101, 
        UiToggleRow = 200, 
        UiToggleRowCustom = 200, 
        UiToggleRowBillboards = 201, 
        UiToggleRowNameplates = 202, 
        FreecamToggleRow = 203, 
        InformationFrame = 999
    };
    if v46 then
        v54.PartyVoiceVolumeFrame = 63;
    end;
end;
local v55 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v56 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationSettingEnabled);
local v57 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationLayerName);
local v58 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationLaunchEnabled);
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled);
local v60 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationWaitForIXP);
local v61 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationForceSetting);
local v62 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationNewDefaults);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v64 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer);
local l_game_EngineFeature_1 = game:GetEngineFeature("GameBasicSettingsFramerateCap");
local v66 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Constants_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v68 = require(l_RobloxGui_0.Modules.CoreUtility);
local v69 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v70 = require(l_RobloxGui_0.Modules.Common.GetHasGuiHidingPermission);
local v71 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v72 = require(l_CorePackages_0.Packages.Cryo);
local v73 = require(script.Parent.Parent.GfxReset);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v75 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall);
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub");
local v76 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local __ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v80 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local l_default_2 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default;
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v85 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Video.SystemDefault");
local v86 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Video.VideoCamera");
local v87 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 251 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v90 = l_status_0 and l_result_0;
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1);
local l_game_FastInt_0 = game:GetFastInt("RomarkStartWithGraphicQualityLevel");
local v92 = not v80:IsSubjectToChinaPolicies();
local v93 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v93 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v93 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
local v94 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v94 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v95 = (not not v94 or v93) and v92;
local v96 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay);
local v97 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v98 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v99 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics);
local l_GetFFlagGameSettingsCameraModeFixEnabled_0 = v29.GetFFlagGameSettingsCameraModeFixEnabled;
local v101 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent);
local v102 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false);
local v103 = game:DefineFastFlag("UserShowGuiHideToggles", false);
local v104 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false);
local v105 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false);
local v106 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false);
local v107 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false);
local l_GetFFlagEnableShowVoiceUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShowVoiceUI;
local function v114(v109, v110, v111, v112) --[[ Line: 286 ]] --[[ Name: reportSettingsChangeForAnalytics ]]
    -- upvalues: v99 (copy), l_UserInputService_0 (copy), v72 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    if not v99() or v110 == v111 or v110 == nil or v111 == nil then
        return;
    else
        local v113 = {
            universe_id = tostring(game.GameId), 
            name = v109, 
            old_value = tostring(v110), 
            new_value = tostring(v111), 
            has_touch = l_UserInputService_0.TouchEnabled, 
            has_mouse = l_UserInputService_0.MouseEnabled, 
            has_gamepad = l_UserInputService_0.GamepadEnabled
        };
        if v112 then
            v113 = v72.Dictionary.join(v113, v112);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsExplicitSettingsChangeName, v113);
        return;
    end;
end;
local function v118() --[[ Line: 317 ]] --[[ Name: reportSettingsForAnalytics ]]
    -- upvalues: l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_game_EngineFeature_1 (copy), l_GetFFlagEnablePreferredTextSizeSettingInMenus_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    local v115 = {};
    if l_UserInputService_0.TouchEnabled then
        v115.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
    else
        v115.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
    end;
    if l_UserInputService_0.TouchEnabled then
        v115.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
    else
        v115.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
    end;
    if l_UserInputService_0.MouseEnabled then
        v115.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
    end;
    if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
        local l_GamepadCameraSensitivity_0 = l_GameSettings_0.GamepadCameraSensitivity;
        v115.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", l_GamepadCameraSensitivity_0))));
    end;
    if l_UserInputService_0.MouseEnabled then
        local l_X_0 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        v115.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", l_X_0))));
    end;
    v115.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
    v115.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
    v115.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
    v115.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
    if l_game_EngineFeature_1 then
        v115.framerate_cap = tostring(l_GameSettings_0.FramerateCap);
    end;
    v115.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
    v115.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
    v115.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
    v115.reduced_motion = tostring(l_GameSettings_0.ReducedMotion);
    v115.preferred_transparency = tostring(l_GameSettings_0.PreferredTransparency);
    if l_GetFFlagEnablePreferredTextSizeSettingInMenus_0() then
        v115.preferred_text_size = tostring(l_GameSettings_0.PreferredTextSize);
    end;
    v115.ui_navigation_key_bind_enabled = tostring(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v115.universeid = tostring(game.GameId);
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v115);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v119 = game:DefineFastFlag("IGMEnableGFXReset", false);
return ((function() --[[ Line: 381 ]] --[[ Name: Initialize ]]
    -- upvalues: v119 (copy), v73 (copy), l_RobloxGui_0 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v66 (copy), v54 (ref), l_GuiService_0 (copy), v101 (copy), v99 (copy), v114 (copy), v118 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_game_EngineFeature_1 (copy), l_RobloxTranslator_0 (copy), v41 (copy), v42 (copy), v34 (copy), l_game_FastInt_0 (copy), v47 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v71 (copy), v94 (copy), v93 (copy), v76 (copy), l_LocalPlayer_0 (copy), v68 (copy), l_GetFFlagGameSettingsCameraModeFixEnabled_0 (copy), v50 (copy), v43 (copy), v33 (copy), l_getAppFeaturePolicies_0 (copy), l_TextChatService_0 (copy), l_game_EngineFeature_0 (copy), v60 (copy), v55 (copy), v62 (copy), v56 (copy), v58 (copy), v59 (copy), v57 (copy), v61 (copy), v52 (copy), v53 (copy), v49 (copy), v48 (copy), v16 (copy), l_HttpService_0 (copy), v107 (copy), l_SafetyService_0 (copy), v20 (ref), v106 (copy), v102 (copy), v87 (copy), l_Players_0 (copy), l_RunService_0 (copy), v38 (copy), l_CorePackages_0 (copy), l_ContextActionService_0 (copy), v104 (copy), v69 (copy), v103 (copy), v17 (ref), v97 (copy), l_SoundService_0 (copy), v51 (copy), v96 (copy), l_default_2 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_default_3 (copy), v86 (copy), l_UserGameSettings_0 (copy), l_VideoCaptureService_0 (copy), v85 (copy), v22 (ref), v40 (copy), v39 (copy), v75 (copy), v21 (copy), v98 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v30 (copy), l_GetFFlagSelfViewCameraSettings_0 (copy), v28 (copy), v25 (copy), v24 (copy), l_default_0 (copy), v27 (copy), v46 (copy), l_GetFFlagAddHapticsToggle_0 (copy), l_GetFFlagEnablePreferredTextSizeSettingInMenus_0 (copy), v80 (copy), v95 (copy), v70 (copy), v90 (copy), v105 (copy), v64 (copy)
    if v119 then
        v73.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v121 = false;
    local v122 = {};
    local __ = function() --[[ Line: 391 ]] --[[ Name: onVRSettingsReady ]]
        -- upvalues: l_VRService_0 (ref), v122 (copy)
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v124, __ in pairs(v122) do
            v124.Visible = not l_VREnabled_0;
        end;
    end;
    local function v130() --[[ Line: 398 ]] --[[ Name: onVREnabled ]]
        -- upvalues: l_VRService_0 (ref), v121 (ref), v122 (copy)
        if l_VRService_0.VREnabled and v121 then
            local l_VREnabled_1 = l_VRService_0.VREnabled;
            for v128, __ in pairs(v122) do
                v128.Visible = not l_VREnabled_1;
            end;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v130);
    if l_VRService_0.VREnabled and v121 then
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        for v132, __ in pairs(v122) do
            v132.Visible = not l_VREnabled_2;
        end;
    end;
    local function v172() --[[ Line: 410 ]] --[[ Name: createGraphicsOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v122 (copy), l_GuiService_0 (ref), v101 (ref), v99 (ref), v114 (ref), v118 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_game_EngineFeature_1 (ref), l_VRService_0 (ref), l_RobloxTranslator_0 (ref), v41 (ref), v42 (ref), v119 (ref), v73 (ref), v34 (ref), l_game_FastInt_0 (ref), v47 (ref)
        local v134 = 1;
        if not l_GameSettings_0:InFullScreen() then
            v134 = 2;
        end;
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local l_l_NewPage_0_2 = l_NewPage_0;
        local v138, v139, v140 = v66:AddNewRow(l_NewPage_0, "Fullscreen", "Selector", {
            "On", 
            "Off"
        }, v134);
        l_l_NewPage_0_0.FullscreenFrame = v138;
        l_l_NewPage_0_1.FullscreenLabel = v139;
        l_l_NewPage_0_2.FullscreenEnabler = v140;
        l_NewPage_0.FullscreenFrame.LayoutOrder = v54.FullScreenFrame;
        v122[l_NewPage_0.FullscreenFrame] = true;
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v141) --[[ Line: 423 ]]
            -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref), v101 (ref), l_NewPage_0 (ref), v99 (ref), v114 (ref), v118 (ref)
            local v142 = l_GameSettings_0:InFullScreen();
            if v141 == 1 then
                if not l_GameSettings_0:InFullScreen() then
                    l_GuiService_0:ToggleFullscreen();
                    if v101() then
                        if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 1 then
                            l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                        end;
                    else
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    end;
                end;
            elseif v141 == 2 and l_GameSettings_0:InFullScreen() then
                l_GuiService_0:ToggleFullscreen();
                if v101() then
                    if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 2 then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                    end;
                else
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            end;
            spawn(function() --[[ Line: 448 ]]
                -- upvalues: v99 (ref), v114 (ref), v142 (copy), l_GameSettings_0 (ref), v118 (ref)
                if v99() then
                    v114("fullscreen_enabled", v142, l_GameSettings_0:InFullScreen());
                end;
                v118();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v143) --[[ Line: 456 ]]
            -- upvalues: l_NewPage_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
            if v143 then
                if l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 1 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                end;
            elseif l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 2 then
                l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsFullscreenModeName, {
                enabled = v143
            });
        end);
        l_l_NewPage_0_0 = 1;
        if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            l_l_NewPage_0_0 = 2;
        end;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v138 = l_NewPage_0;
        local v144;
        v139, v140, v144 = v66:AddNewRow(l_NewPage_0, "Graphics Mode", "Selector", {
            "Automatic", 
            "Manual"
        }, l_l_NewPage_0_0);
        l_l_NewPage_0_1.GraphicsEnablerFrame = v139;
        l_l_NewPage_0_2.GraphicsEnablerLabel = v140;
        v138.GraphicsQualityEnabler = v144;
        l_NewPage_0.GraphicsEnablerFrame.LayoutOrder = v54.GraphicsEnablerFrame;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v138 = l_NewPage_0;
        v139, v140, v144 = v66:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", 10, 1);
        l_l_NewPage_0_1.GraphicsQualityFrame = v139;
        l_l_NewPage_0_2.GraphicsQualityLabel = v140;
        v138.GraphicsQualitySlider = v144;
        l_NewPage_0.GraphicsQualityFrame.LayoutOrder = v54.GraphicsQualityFrame;
        l_NewPage_0.GraphicsQualitySlider:SetMinStep(1);
        if l_game_EngineFeature_1 and not l_VRService_0.VREnabled then
            l_l_NewPage_0_1 = table.clone(l_Constants_0.FramerateCaps);
            l_l_NewPage_0_2 = {
                l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
                    Frames = l_GameSettings_0:GetDefaultFramerateCap()
                })
            };
            for __, v146 in l_l_NewPage_0_1 do
                table.insert(l_l_NewPage_0_2, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
                    Frames = v146
                }));
            end;
            table.insert(l_l_NewPage_0_1, 1, -1);
            local l_l_l_NewPage_0_2_0 = l_l_NewPage_0_2 --[[ copy: 3 -> 9 ]];
            local l_l_l_NewPage_0_1_0 = l_l_NewPage_0_1 --[[ copy: 2 -> 10 ]];
            task.defer(function() --[[ Line: 520 ]]
                -- upvalues: l_NewPage_0 (ref), v66 (ref), l_RobloxTranslator_0 (ref), l_l_l_NewPage_0_2_0 (copy), l_l_l_NewPage_0_1_0 (copy), l_GameSettings_0 (ref), v41 (ref), v42 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v152, v153, v154 = v66:AddNewRow(l_NewPage_0, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_l_l_NewPage_0_2_0, table.find(l_l_l_NewPage_0_1_0, l_GameSettings_0.FramerateCap), nil, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v152;
                l_l_NewPage_0_4.FramerateCapLabel = v153;
                l_l_NewPage_0_5.FramerateCapMode = v154;
                if v41 or v42 then
                    l_NewPage_0.FramerateCapFrame.LayoutOrder = v54.FramerateCap;
                else
                    l_NewPage_0.FramerateCapFrame.LayoutOrder = 12;
                end;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v155) --[[ Line: 538 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_l_l_NewPage_0_1_0 (ref), v99 (ref), v114 (ref), v118 (ref)
                    local l_FramerateCap_0 = l_GameSettings_0.FramerateCap;
                    l_GameSettings_0.FramerateCap = l_l_l_NewPage_0_1_0[v155];
                    if v99() then
                        v114("framerate_cap", l_FramerateCap_0, l_GameSettings_0.FramerateCap);
                    end;
                    v118();
                end);
            end);
        end;
        settings().Rendering.EnableFRM = true;
        SetGraphicsQuality = function(v157, v158) --[[ Line: 556 ]] --[[ Name: SetGraphicsQuality ]]
            -- upvalues: v119 (ref), v73 (ref), l_GameSettings_0 (ref)
            if v119 then
                local v159, v160 = v73.TemporaryOverride(v157);
                if v159 then
                    settings().Rendering.QualityLevel = v160;
                    return;
                end;
            end;
            local v161 = v157 / 10;
            local v162 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * v161);
            if v162 == 20 then
                v162 = 21;
            elseif v157 == 1 then
                v162 = 1;
            elseif v157 < 1 and not v158 then
                v157 = 1;
                v162 = 1;
            elseif settings().Rendering:GetMaxQualityLevel() < v162 then
                v162 = settings().Rendering:GetMaxQualityLevel() - 1;
            end;
            l_GameSettings_0.SavedQualityLevel = v157;
            settings().Rendering.QualityLevel = v162;
        end;
        l_l_NewPage_0_1 = function() --[[ Line: 582 ]] --[[ Name: setGraphicsToAuto ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        l_l_NewPage_0_2 = function(v163) --[[ Line: 590 ]] --[[ Name: setGraphicsToManual ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() == v163 then
                SetGraphicsQuality(v163);
                return;
            else
                l_NewPage_0.GraphicsQualitySlider:SetValue(v163);
                return;
            end;
        end;
        v138 = false;
        l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v164) --[[ Line: 604 ]]
            -- upvalues: v138 (ref), v118 (ref)
            SetGraphicsQuality(v164);
            if v138 == true then
                v118();
            end;
            v138 = true;
        end);
        l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v165) --[[ Line: 612 ]]
            -- upvalues: v34 (ref), l_NewPage_0 (ref), l_l_NewPage_0_2 (copy), v118 (ref), v114 (ref)
            if v34 then
                local v166 = {
                    Automatic = {
                        Name = "Automatic", 
                        Value = 1
                    }, 
                    Manual = {
                        Name = "Manual", 
                        Value = 2
                    }
                };
                local l_Name_0 = v166.Automatic.Name;
                local l_Name_1 = v166.Manual.Name;
                if v165 == v166.Automatic.Value then
                    l_Name_0 = v166.Manual.Name;
                    l_Name_1 = v166.Automatic.Name;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                    SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
                elseif v165 == v166.Manual.Value then
                    l_l_NewPage_0_2(l_NewPage_0.GraphicsQualitySlider:GetValue());
                end;
                v118();
                v114("gfx_mode", l_Name_0, l_Name_1);
                return;
            else
                if v165 == 1 then
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                    SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
                elseif v165 == 2 then
                    l_l_NewPage_0_2(l_NewPage_0.GraphicsQualitySlider:GetValue());
                end;
                v118();
                return;
            end;
        end);
        game.GraphicsQualityChangeRequest:Connect(function(v169) --[[ Line: 639 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                local l_Value_0 = l_NewPage_0.GraphicsQualitySlider:GetValue();
                l_Value_0 = if v169 then l_Value_0 + 1 else l_Value_0 - 1;
                l_NewPage_0.GraphicsQualitySlider:SetValue(l_Value_0);
            end;
        end);
        if l_game_FastInt_0 >= 0 then
            if l_game_FastInt_0 == 0 then
                l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(1);
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
            else
                l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(2);
                l_l_NewPage_0_2(l_game_FastInt_0);
            end;
        elseif l_GameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
            l_NewPage_0.GraphicsQualitySlider:SetValue(5);
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        else
            v139 = tostring(l_GameSettings_0.SavedQualityLevel);
            v139 = if v47[v139] then v47[v139] else 10;
            SetGraphicsQuality(v139);
            do
                local l_v139_0 = v139;
                spawn(function() --[[ Line: 672 ]]
                    -- upvalues: l_NewPage_0 (ref), l_v139_0 (ref)
                    l_NewPage_0.GraphicsQualitySlider:SetValue(l_v139_0);
                end);
            end;
        end;
    end;
    local function v186() --[[ Line: 678 ]] --[[ Name: createReducedMotionOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_RobloxTranslator_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v173 = 2;
        if l_GameSettings_0.ReducedMotion then
            v173 = 1;
        end;
        local v174 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.ReducedMotion");
        local v175 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.ReducedMotion");
        local v176 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
        local v177 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_6 = l_NewPage_0;
        local l_l_NewPage_0_7 = l_NewPage_0;
        local l_l_NewPage_0_8 = l_NewPage_0;
        local v181, v182, v183 = v66:AddNewRow(l_NewPage_0, v174, "Selector", {
            v176, 
            v177
        }, v173, nil, v175);
        l_l_NewPage_0_6.ReducedMotionFrame = v181;
        l_l_NewPage_0_7.ReducedMotionLabel = v182;
        l_l_NewPage_0_8.ReducedMotionMode = v183;
        l_NewPage_0.ReducedMotionFrame.LayoutOrder = v54.ReducedMotionFrame;
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v184) --[[ Line: 700 ]]
            -- upvalues: l_GameSettings_0 (ref), v99 (ref), v114 (ref), v118 (ref)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v184 == 1;
            if v99() then
                v114("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v118();
        end);
    end;
    local function v200() --[[ Line: 711 ]] --[[ Name: createPreferredTransparencyOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_RobloxTranslator_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v187 = 10 - math.clamp(math.floor(l_GameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10);
        local v188 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency");
        local v189 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.PreferredTransparency");
        local v190 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent");
        local v191 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque");
        local l_l_NewPage_0_9 = l_NewPage_0;
        local l_l_NewPage_0_10 = l_NewPage_0;
        local l_l_NewPage_0_11 = l_NewPage_0;
        local v195, v196, v197 = v66:AddNewRow(l_NewPage_0, v188, "Slider", 10, v187, nil, v189, v190, v191);
        l_l_NewPage_0_9.PreferredTransparencyFrame = v195;
        l_l_NewPage_0_10.PreferredTransparencyLabel = v196;
        l_l_NewPage_0_11.PreferredTransparencySlider = v197;
        l_NewPage_0.PreferredTransparencyFrame.LayoutOrder = v54.PreferredTransparencyFrame;
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v198) --[[ Line: 737 ]]
            -- upvalues: l_GameSettings_0 (ref), v99 (ref), v114 (ref), v118 (ref)
            v198 = (10 - math.clamp(math.floor(v198), 0, 10)) / 10;
            local l_PreferredTransparency_0 = l_GameSettings_0.PreferredTransparency;
            l_GameSettings_0.PreferredTransparency = v198;
            if v99() then
                v114("preferred_transparency", l_PreferredTransparency_0, l_GameSettings_0.PreferredTransparency);
            end;
            v118();
        end);
    end;
    local function v215() --[[ Line: 749 ]] --[[ Name: createPreferredTextSizeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_RobloxTranslator_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local l_EnumItems_0 = Enum.PreferredTextSize:GetEnumItems();
        local v202 = l_GameSettings_0.PreferredTextSize.Value - 1;
        local v203 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize");
        local v204 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.PreferredTextSize");
        local v205 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTextSize.Default");
        local v206 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest");
        local l_l_NewPage_0_12 = l_NewPage_0;
        local l_l_NewPage_0_13 = l_NewPage_0;
        local l_l_NewPage_0_14 = l_NewPage_0;
        local v210, v211, v212 = v66:AddNewRow(l_NewPage_0, v203, "Slider", 3, v202, nil, v204, v205, v206);
        l_l_NewPage_0_12.PreferredTextSizeFrame = v210;
        l_l_NewPage_0_13.PreferredTextSizeLabel = v211;
        l_l_NewPage_0_14.PreferredTextSizeSlider = v212;
        l_NewPage_0.PreferredTextSizeFrame.LayoutOrder = v54.PreferredTextSizeFrame;
        l_NewPage_0.PreferredTextSizeSlider.ValueChanged:connect(function(v213) --[[ Line: 774 ]]
            -- upvalues: l_GameSettings_0 (ref), l_EnumItems_0 (copy), v99 (ref), v114 (ref), v118 (ref)
            local l_PreferredTextSize_0 = l_GameSettings_0.PreferredTextSize;
            l_GameSettings_0.PreferredTextSize = l_EnumItems_0[v213 + 1];
            if v99() then
                v114("preferred_text_size", l_PreferredTextSize_0, l_GameSettings_0.PreferredTextSize);
            end;
            v118();
        end);
    end;
    local function v229() --[[ Line: 784 ]] --[[ Name: createUiNavigationKeyBindOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_RobloxTranslator_0 (ref), l_UserInputService_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v216 = 2;
        if l_GameSettings_0.UiNavigationKeyBindEnabled then
            v216 = 1;
        end;
        local v217 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind");
        local v218 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v219 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
        local v220 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_15 = l_NewPage_0;
        local l_l_NewPage_0_16 = l_NewPage_0;
        local l_l_NewPage_0_17 = l_NewPage_0;
        local v224, v225, v226 = v66:AddNewRow(l_NewPage_0, v217, "Selector", {
            v219, 
            v220
        }, v216, nil, v218);
        l_l_NewPage_0_15.UiNavigationKeyBindEnabledFrame = v224;
        l_l_NewPage_0_16.UiNavigationKeyBindEnabledLabel = v225;
        l_l_NewPage_0_17.UiNavigationKeyBindEnabledMode = v226;
        l_NewPage_0.UiNavigationKeyBindEnabledFrame.LayoutOrder = v54.UiNavigationKeyBindEnabledFrame;
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v227) --[[ Line: 811 ]]
            -- upvalues: l_GameSettings_0 (ref), v99 (ref), v114 (ref), v118 (ref)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v227 == 1;
            if v99() then
                v114("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v118();
        end);
    end;
    local function v241() --[[ Line: 826 ]] --[[ Name: createPerformanceStatsOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v66 (ref), v54 (ref), l_Create_0 (ref), v71 (ref), v99 (ref), v114 (ref), v118 (ref)
        local l_l_NewPage_0_18 = l_NewPage_0;
        local l_l_NewPage_0_19 = l_NewPage_0;
        local l_l_NewPage_0_20 = l_NewPage_0;
        local l_l_NewPage_0_21 = l_NewPage_0;
        local v234 = nil;
        local v235 = nil;
        local v236 = nil;
        local v237 = nil;
        l_l_NewPage_0_18.PerformanceStatsFrame = v234;
        l_l_NewPage_0_19.PerformanceStatsLabel = v235;
        l_l_NewPage_0_20.PerformanceStatsMode = v236;
        l_l_NewPage_0_21.PerformanceStatsOverrideText = v237;
        GetDesiredPerformanceStatsIndex = function() --[[ Line: 832 ]] --[[ Name: GetDesiredPerformanceStatsIndex ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.PerformanceStatsVisible then
                return 1;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_18 = GetDesiredPerformanceStatsIndex();
        l_l_NewPage_0_19 = l_NewPage_0;
        l_l_NewPage_0_20 = l_NewPage_0;
        l_l_NewPage_0_21 = l_NewPage_0;
        v234, v235, v236 = v66:AddNewRow(l_NewPage_0, "Performance Stats", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_18);
        l_l_NewPage_0_19.PerformanceStatsFrame = v234;
        l_l_NewPage_0_20.PerformanceStatsLabel = v235;
        l_l_NewPage_0_21.PerformanceStatsMode = v236;
        l_NewPage_0.PerformanceStatsFrame.LayoutOrder = v54.PerformanceStatsFrame;
        l_NewPage_0.PerformanceStatsOverrideText = l_Create_0("TextLabel")({
            Name = "PerformanceStatsLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v71.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v71.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 200, 1, 0), 
            Position = UDim2.new(1, -350, 0, 0), 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v238) --[[ Line: 860 ]]
            -- upvalues: v99 (ref), l_GameSettings_0 (ref), v114 (ref), v118 (ref)
            local v239 = nil;
            if v99() then
                v239 = l_GameSettings_0.PerformanceStatsVisible;
            end;
            if v238 == 1 then
                l_GameSettings_0.PerformanceStatsVisible = true;
            else
                l_GameSettings_0.PerformanceStatsVisible = false;
            end;
            if v99() then
                v114("show_performance_stats", v239, l_GameSettings_0.PerformanceStatsVisible);
            end;
            v118();
        end);
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function() --[[ Line: 882 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v240 = GetDesiredPerformanceStatsIndex();
            if v240 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v240);
            end;
        end);
    end;
    local function v248() --[[ Line: 892 ]] --[[ Name: createWebServerInformationRow ]]
        -- upvalues: l_NewPage_0 (copy), v66 (ref), v54 (ref), l_Create_0 (ref), v71 (ref)
        local l_l_NewPage_0_22 = l_NewPage_0;
        local l_l_NewPage_0_23 = l_NewPage_0;
        local l_l_NewPage_0_24 = l_NewPage_0;
        local v245, v246, v247 = v66:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5);
        l_l_NewPage_0_22.InformationFrame = v245;
        l_l_NewPage_0_23.InformationLabel = v246;
        l_l_NewPage_0_24.InformationTextBox = v247;
        l_NewPage_0.InformationFrame.LayoutOrder = v54.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        l_NewPage_0.InformationText = l_Create_0("TextLabel")({
            Name = "InformationLabel", 
            Text = "Information Loading", 
            Font = v71.font(Enum.Font.SourceSans), 
            FontSize = v71.fontSize(Enum.FontSize.Size14), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 800, 1, 0), 
            Position = UDim2.new(1, -650, 0, 20), 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_NewPage_0.InformationFrame
        });
        return l_NewPage_0.InformationFrame, l_NewPage_0.InformationText;
    end;
    local function v277() --[[ Line: 916 ]] --[[ Name: createMicroProfilerOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v248 (copy), v94 (ref), v99 (ref), v93 (ref), l_RbxAnalyticsService_0 (ref), v114 (ref), v118 (ref), l_RobloxTranslator_0 (ref), v66 (ref), v54 (ref)
        local l_l_NewPage_0_25 = l_NewPage_0;
        local l_l_NewPage_0_26 = l_NewPage_0;
        local l_l_NewPage_0_27 = l_NewPage_0;
        local l_l_NewPage_0_28 = l_NewPage_0;
        local v253 = nil;
        local v254 = nil;
        local v255 = nil;
        local v256 = nil;
        l_l_NewPage_0_25.MicroProfilerFrame = v253;
        l_l_NewPage_0_26.MicroProfilerLabel = v254;
        l_l_NewPage_0_27.MicroProfilerMode = v255;
        l_l_NewPage_0_28.MicroProfilerOverrideText = v256;
        l_l_NewPage_0_25 = function() --[[ Line: 921 ]] --[[ Name: tryContentLabel ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v248 (ref)
            local l_MicroProfilerWebServerPort_0 = l_GameSettings_0.MicroProfilerWebServerPort;
            if l_MicroProfilerWebServerPort_0 ~= 0 then
                local l_l_NewPage_0_29 = l_NewPage_0;
                local l_l_NewPage_0_30 = l_NewPage_0;
                local v260, v261 = v248();
                l_l_NewPage_0_29.InformationFrame = v260;
                l_l_NewPage_0_30.InformationText = v261;
                l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_0;
                return true;
            else
                return false;
            end;
        end;
        l_l_NewPage_0_26 = function(v262) --[[ Line: 933 ]] --[[ Name: setMicroProfilerIndex ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v94 (ref), v99 (ref), v248 (ref), v93 (ref), l_RbxAnalyticsService_0 (ref), v114 (ref), v118 (ref)
            local function __() --[[ Line: 934 ]] --[[ Name: hideContentLabel ]]
                -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
                l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                    l_NewPage_0.InformationFrame.Visible = false;
                    l_NewPage_0.InformationFrame.Parent = nil;
                    l_NewPage_0.InformationText.Parent = nil;
                    l_NewPage_0.InformationFrame = nil;
                    l_NewPage_0.InformationText = nil;
                end;
            end;
            local v264 = nil;
            local v265 = nil;
            local v266 = nil;
            if v94 then
                if v99() then
                    v264 = "webserver";
                    v265 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
                if v262 == 1 then
                    l_GameSettings_0.MicroProfilerWebServerEnabled = true;
                    local v267 = 30;
                    while v267 >= 1 do
                        local l_MicroProfilerWebServerPort_1 = l_GameSettings_0.MicroProfilerWebServerPort;
                        local v269;
                        if l_MicroProfilerWebServerPort_1 ~= 0 then
                            local l_l_NewPage_0_31 = l_NewPage_0;
                            local l_l_NewPage_0_32 = l_NewPage_0;
                            local v272, v273 = v248();
                            l_l_NewPage_0_31.InformationFrame = v272;
                            l_l_NewPage_0_32.InformationText = v273;
                            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_1;
                            v269 = true;
                        else
                            v269 = false;
                        end;
                        if not v269 then
                            v267 = v267 - 1;
                            wait(0.1);
                        else
                            break;
                        end;
                    end;
                    if v267 <= 0 then
                        l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                        l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                        if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                            l_NewPage_0.InformationFrame.Visible = false;
                            l_NewPage_0.InformationFrame.Parent = nil;
                            l_NewPage_0.InformationText.Parent = nil;
                            l_NewPage_0.InformationFrame = nil;
                            l_NewPage_0.InformationText = nil;
                        end;
                    end;
                else
                    l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                    if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                        l_NewPage_0.InformationFrame.Visible = false;
                        l_NewPage_0.InformationFrame.Parent = nil;
                        l_NewPage_0.InformationText.Parent = nil;
                        l_NewPage_0.InformationFrame = nil;
                        l_NewPage_0.InformationText = nil;
                    end;
                end;
                if v99() then
                    v266 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
            elseif v93 then
                if v99() then
                    v264 = "regular";
                    v265 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
                l_GameSettings_0.OnScreenProfilerEnabled = v262 == 1;
                if v99() then
                    v266 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
            end;
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerSettingsPressed");
            if v99() then
                v114("microprofiler_enabled", v265, v266, {
                    microprofiler_type = v264
                });
            end;
            v118();
        end;
        l_l_NewPage_0_27 = function() --[[ Line: 1007 ]] --[[ Name: GetDesiredWebServerIndex ]]
            -- upvalues: v94 (ref), l_GameSettings_0 (ref), v93 (ref)
            if v94 then
                if l_GameSettings_0.MicroProfilerWebServerEnabled then
                    return 1;
                else
                    return 2;
                end;
            elseif v93 then
                if l_GameSettings_0.OnScreenProfilerEnabled then
                    return 1;
                else
                    return 2;
                end;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_28 = if v94 then l_GameSettings_0.MicroProfilerWebServerEnabled and 1 or 2 else if v93 then l_GameSettings_0.OnScreenProfilerEnabled and 1 or 2 else 2;
        v253 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler");
        v254 = l_NewPage_0;
        v255 = l_NewPage_0;
        v256 = l_NewPage_0;
        local v274, v275, v276 = v66:AddNewRow(l_NewPage_0, v253, "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_28);
        v254.MicroProfilerFrame = v274;
        v255.MicroProfilerLabel = v275;
        v256.MicroProfilerMode = v276;
        l_NewPage_0.MicroProfilerFrame.LayoutOrder = v54.MicroProfilerFrame;
        v254 = l_GameSettings_0.MicroProfilerWebServerPort;
        if v254 ~= 0 then
            v255 = l_NewPage_0;
            v256 = l_NewPage_0;
            v274, v275 = v248();
            v255.InformationFrame = v274;
            v256.InformationText = v275;
            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. v254;
        end;
        v254 = false;
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 1036 ]]
            -- upvalues: v254 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            v254 = true;
            if l_GameSettings_0.OnScreenProfilerEnabled then
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(1);
                return;
            else
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                return;
            end;
        end);
        v255 = function(...) --[[ Line: 1046 ]] --[[ Name: onIndexChanged ]]
            -- upvalues: v254 (ref), l_l_NewPage_0_26 (copy)
            if v254 then
                v254 = false;
                return;
            else
                l_l_NewPage_0_26(...);
                return;
            end;
        end;
        l_NewPage_0.MicroProfilerMode.IndexChanged:connect(v255);
    end;
    local function v404(v278) --[[ Line: 1057 ]] --[[ Name: createCameraModeOptions ]]
        -- upvalues: l_UserInputService_0 (ref), v76 (ref), l_NewPage_0 (copy), l_GameSettings_0 (ref), v66 (ref), v54 (ref), v122 (copy), l_Create_0 (ref), v71 (ref), v99 (ref), v114 (ref), v118 (ref), l_LocalPlayer_0 (ref), v68 (ref), l_GetFFlagGameSettingsCameraModeFixEnabled_0 (ref), v50 (ref), v43 (ref), v34 (ref), l_VRService_0 (ref), v33 (ref), l_getAppFeaturePolicies_0 (ref), l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), v60 (ref), v55 (ref), v62 (ref), v56 (ref), v58 (ref), v59 (ref), v57 (ref), v61 (ref), v52 (ref), v53 (ref), v49 (ref), v48 (ref)
        if l_UserInputService_0.MouseEnabled and not v76 then
            local l_l_NewPage_0_33 = l_NewPage_0;
            local l_l_NewPage_0_34 = l_NewPage_0;
            local l_l_NewPage_0_35 = l_NewPage_0;
            local l_l_NewPage_0_36 = l_NewPage_0;
            local v283 = nil;
            local v284 = nil;
            local v285 = nil;
            local v286 = nil;
            l_l_NewPage_0_33.ShiftLockFrame = v283;
            l_l_NewPage_0_34.ShiftLockLabel = v284;
            l_l_NewPage_0_35.ShiftLockMode = v285;
            l_l_NewPage_0_36.ShiftLockOverrideText = v286;
            if l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled then
                l_l_NewPage_0_33 = 2;
                if l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch then
                    l_l_NewPage_0_33 = 1;
                end;
                l_l_NewPage_0_34 = l_NewPage_0;
                l_l_NewPage_0_35 = l_NewPage_0;
                l_l_NewPage_0_36 = l_NewPage_0;
                v283, v284, v285 = v66:AddNewRow(l_NewPage_0, "Shift Lock Switch", "Selector", {
                    "On", 
                    "Off"
                }, l_l_NewPage_0_33);
                l_l_NewPage_0_34.ShiftLockFrame = v283;
                l_l_NewPage_0_35.ShiftLockLabel = v284;
                l_l_NewPage_0_36.ShiftLockMode = v285;
                l_NewPage_0.ShiftLockFrame.LayoutOrder = v54.ShiftLockFrame;
                v122[l_NewPage_0.ShiftLockFrame] = true;
                l_NewPage_0.ShiftLockOverrideText = l_Create_0("TextLabel")({
                    Name = "ShiftLockOverrideLabel", 
                    Text = "Set by Developer", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    Font = v71.font(Enum.Font.SourceSans, "GameSettings"), 
                    FontSize = v71.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 200, 1, 0), 
                    Position = UDim2.new(1, -350, 0, 0), 
                    Visible = false, 
                    ZIndex = 2, 
                    Parent = l_NewPage_0.ShiftLockFrame
                });
                l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v287) --[[ Line: 1090 ]]
                    -- upvalues: v99 (ref), l_GameSettings_0 (ref), v114 (ref), v118 (ref)
                    local v288 = nil;
                    if v99() then
                        v288 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
                    end;
                    if v287 == 1 then
                        l_GameSettings_0.ControlMode = Enum.ControlMode.MouseLockSwitch;
                    else
                        l_GameSettings_0.ControlMode = Enum.ControlMode.Classic;
                    end;
                    if v99() then
                        v114("shift_lock_enabled", v288, l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
                    end;
                    v118();
                end);
            end;
        end;
        cameraModeIsUserChoice = function() --[[ Line: 1116 ]] --[[ Name: cameraModeIsUserChoice ]]
            -- upvalues: l_UserInputService_0 (ref), l_LocalPlayer_0 (ref)
            if l_UserInputService_0.TouchEnabled then
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v289) --[[ Line: 1124 ]] --[[ Name: setCameraModeVisible ]]
            -- upvalues: l_NewPage_0 (ref)
            if l_NewPage_0.CameraMode then
                l_NewPage_0.CameraMode.SelectorFrame.Visible = v289;
                l_NewPage_0.CameraMode:SetInteractable(v289);
                l_NewPage_0.CameraModeOverrideText.Visible = not v289;
            end;
        end;
        local v290 = v68.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
        local v291 = {};
        local v292 = {};
        do
            local l_v291_0, l_v292_0 = v291, v292;
            local function v299(v295) --[[ Line: 1138 ]] --[[ Name: updateCurrentCameraMovementIndex ]]
                -- upvalues: l_v292_0 (ref), l_v291_0 (ref), l_UserInputService_0 (ref), v99 (ref), l_GameSettings_0 (ref), v114 (ref)
                local v296 = nil;
                if not pcall(function() --[[ Line: 1140 ]]
                    -- upvalues: v296 (ref), l_v292_0 (ref), l_v291_0 (ref), v295 (copy)
                    v296 = l_v292_0[l_v291_0[v295]];
                end) or v296 == nil then
                    return false;
                else
                    local v297 = nil;
                    local v298 = nil;
                    if l_UserInputService_0.TouchEnabled then
                        if v99() then
                            v298 = l_GameSettings_0.TouchCameraMovementMode.Value;
                        end;
                        v297 = l_GameSettings_0.TouchCameraMovementMode.Value ~= v296;
                        l_GameSettings_0.TouchCameraMovementMode = v296;
                    else
                        if v99() then
                            v298 = l_GameSettings_0.ComputerCameraMovementMode.Value;
                        end;
                        v297 = l_GameSettings_0.ComputerCameraMovementMode.Value ~= v296;
                        l_GameSettings_0.ComputerCameraMovementMode = v296;
                    end;
                    if v99() and v297 then
                        v114("camera_mode", v298, v296);
                    end;
                    return v297;
                end;
            end;
            local l_v290_0 = v290 --[[ copy: 1 -> 18 ]];
            local l_v299_0 = v299 --[[ copy: 4 -> 19 ]];
            local function v309() --[[ Line: 1173 ]] --[[ Name: updateCameraMovementModes ]]
                -- upvalues: l_v290_0 (copy), l_UserInputService_0 (ref), l_v291_0 (ref), l_v292_0 (ref), l_GetFFlagGameSettingsCameraModeFixEnabled_0 (ref), v50 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v43 (ref), l_v299_0 (copy)
                local v302 = {};
                if l_v290_0 then
                    v302 = if l_UserInputService_0.TouchEnabled then l_v290_0:GetRegisteredTouchCameraMovementModes() else l_v290_0:GetRegisteredComputerCameraMovementModes();
                end;
                l_v291_0 = {};
                l_v292_0 = {};
                if #v302 <= 0 then
                    setCameraModeVisible(false);
                    return;
                else
                    if l_GetFFlagGameSettingsCameraModeFixEnabled_0() then
                        setCameraModeVisible(cameraModeIsUserChoice());
                    else
                        setCameraModeVisible(true);
                    end;
                    for v303 = 1, #v302 do
                        local v304 = v302[v303];
                        local l_Name_2 = v304.Name;
                        if l_Name_2 == "Default" then
                            l_Name_2 = v50;
                        end;
                        l_v291_0[#l_v291_0 + 1] = l_Name_2;
                        l_v292_0[l_Name_2] = v304.Value;
                    end;
                    if l_NewPage_0.CameraMode then
                        l_NewPage_0.CameraMode:UpdateOptions(l_v291_0);
                    end;
                    local v306 = -1;
                    v306 = if l_UserInputService_0.TouchEnabled then l_GameSettings_0.TouchCameraMovementMode.Value else l_GameSettings_0.ComputerCameraMovementMode.Value;
                    if v306 > -1 then
                        if v43 then
                            if l_UserInputService_0.TouchEnabled or l_GameSettings_0.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
                                v306 = v306 + 1;
                            end;
                            l_v299_0(v306);
                            l_NewPage_0.CameraMode:SetSelectionIndex(v306);
                        else
                            v306 = v306 + 1;
                            local v307 = nil;
                            do
                                local l_v307_0 = v307;
                                if pcall(function() --[[ Line: 1235 ]]
                                    -- upvalues: l_v307_0 (ref), v302 (ref), v306 (ref)
                                    l_v307_0 = v302[v306];
                                end) and l_v307_0 then
                                    l_v299_0(l_v307_0.Value + 1);
                                    l_NewPage_0.CameraMode:SetSelectionIndex(l_v307_0.Value + 1);
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            local l_l_NewPage_0_37 = l_NewPage_0;
            local l_l_NewPage_0_38 = l_NewPage_0;
            local l_l_NewPage_0_39 = l_NewPage_0;
            local v313, v314, v315 = v66:AddNewRow(l_NewPage_0, "Camera Mode", "Selector", l_v291_0, 1);
            l_l_NewPage_0_37.CameraModeFrame = v313;
            l_l_NewPage_0_38.CameraModeLabel = v314;
            l_l_NewPage_0_39.CameraMode = v315;
            l_NewPage_0.CameraModeFrame.LayoutOrder = v54.CameraModeFrame;
            v122[l_NewPage_0.CameraMode] = true;
            l_NewPage_0.CameraModeOverrideText = l_Create_0("TextLabel")({
                Name = "CameraDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v71.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v71.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.CameraModeFrame
            });
            if v290 then
                local l_v309_0 = v309 --[[ copy: 5 -> 22 ]];
                v290.TouchCameraMovementModeRegistered:connect(function(__) --[[ Line: 1270 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v309_0 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_v309_0();
                    end;
                end);
                v290.ComputerCameraMovementModeRegistered:connect(function(__) --[[ Line: 1276 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v309_0 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_v309_0();
                    end;
                end);
            end;
            l_l_NewPage_0_37 = false;
            local l_v299_1 = v299 --[[ copy: 4 -> 20 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v320) --[[ Line: 1284 ]]
                -- upvalues: l_v299_1 (copy), l_l_NewPage_0_37 (ref), v118 (ref)
                if l_v299_1(v320) then
                    if l_l_NewPage_0_37 then
                        v118();
                    end;
                    l_l_NewPage_0_37 = true;
                end;
            end);
            v309();
        end;
        v290 = false;
        v291 = function() --[[ Line: 1300 ]] --[[ Name: createVROption ]]
            -- upvalues: v290 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref), v66 (ref), v54 (ref), v34 (ref), v114 (ref)
            if not v290 then
                v290 = true;
                local v321 = nil;
                v321 = if l_GameSettings_0.VREnabled then {
                    "On", 
                    "Off (restart pending)"
                } else {
                    "On (restart pending)", 
                    "Off"
                };
                local l_l_NewPage_0_40 = l_NewPage_0;
                local l_l_NewPage_0_41 = l_NewPage_0;
                local l_l_NewPage_0_42 = l_NewPage_0;
                local v325, v326, v327 = v66:AddNewRow(l_NewPage_0, "VR", "Selector", v321, l_GameSettings_0.VREnabled and 1 or 2);
                l_l_NewPage_0_40.VREnabledFrame = v325;
                l_l_NewPage_0_41.VREnabledLabel = v326;
                l_l_NewPage_0_42.VREnabledSelector = v327;
                l_NewPage_0.VREnabledFrame.LayoutOrder = v54.VREnabledFrame;
                do
                    local l_v321_0 = v321;
                    l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v329) --[[ Line: 1315 ]]
                        -- upvalues: v34 (ref), l_GameSettings_0 (ref), l_v321_0 (ref), v114 (ref)
                        if v34 then
                            local v330 = {
                                On = {
                                    Name = "On", 
                                    Value = 1
                                }, 
                                Off = {
                                    Name = "Off", 
                                    Value = 2
                                }
                            };
                            local v331 = v329 == v330.On.Value;
                            if l_GameSettings_0.VREnabled ~= v331 then
                                l_GameSettings_0.VREnabled = v331;
                                local v332 = l_v321_0[v330.On.Value];
                                local v333 = l_v321_0[v329];
                                if v333 == l_v321_0[v330.On.Value] then
                                    v332 = l_v321_0[v330.Off.Value];
                                end;
                                v114("vr_mode", v332, v333);
                                return;
                            end;
                        else
                            local v334 = v329 == 1;
                            if l_GameSettings_0.VREnabled ~= v334 then
                                l_GameSettings_0.VREnabled = v334;
                            end;
                        end;
                    end);
                end;
            end;
        end;
        v292 = function() --[[ Line: 1341 ]] --[[ Name: onVREnabledChanged ]]
            -- upvalues: l_VRService_0 (ref), l_GameSettings_0 (ref), v291 (copy)
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v291();
                return;
            else
                if l_GameSettings_0.HasEverUsedVR then
                    v291();
                end;
                return;
            end;
        end;
        if v33() and l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
            v291();
        else
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v291();
            elseif l_GameSettings_0.HasEverUsedVR then
                v291();
            end;
            l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v292);
        end;
        local function v349() --[[ Line: 1363 ]] --[[ Name: createChatTranslationOption ]]
            -- upvalues: l_TextChatService_0 (ref), l_NewPage_0 (ref), v66 (ref), v54 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v114 (ref), l_LocalPlayer_0 (ref)
            local v335 = l_TextChatService_0.ChatTranslationEnabled and 1 or 2;
            local l_l_NewPage_0_43 = l_NewPage_0;
            local l_l_NewPage_0_44 = l_NewPage_0;
            local l_l_NewPage_0_45 = l_NewPage_0;
            local v339, v340, v341 = v66:AddNewRow(l_NewPage_0, "Automatic Chat Translation", "Selector", {
                "On", 
                "Off"
            }, v335);
            l_l_NewPage_0_43.ChatTranslationFrame = v339;
            l_l_NewPage_0_44.ChatTranslationLabel = v340;
            l_l_NewPage_0_45.ChatTranslationEnabler = v341;
            l_NewPage_0.ChatTranslationFrame.LayoutOrder = v54.ChatTranslationFrame;
            l_NewPage_0.ChatTranslationEnabler.IndexChanged:connect(function(v342) --[[ Line: 1375 ]]
                -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v114 (ref), l_LocalPlayer_0 (ref)
                local v343 = v342 == 1;
                local l_ChatTranslationEnabled_0 = l_TextChatService_0.ChatTranslationEnabled;
                if v343 ~= l_ChatTranslationEnabled_0 then
                    if l_game_EngineFeature_0 then
                        l_GameSettings_0.ChatTranslationEnabled = v343;
                    else
                        l_TextChatService_0.ChatTranslationEnabled = v343;
                    end;
                    v114("chat_translation", l_ChatTranslationEnabled_0, v343, {
                        locale_id = l_LocalPlayer_0.LocaleId
                    });
                end;
            end);
            l_l_NewPage_0_43 = l_TextChatService_0.ChatTranslationToggleEnabled and 1 or 2;
            l_l_NewPage_0_44 = l_NewPage_0;
            l_l_NewPage_0_45 = l_NewPage_0;
            v339 = l_NewPage_0;
            local v345;
            v340, v341, v345 = v66:AddNewRow(l_NewPage_0, "Option to View Untranslated Message", "Selector", {
                "On", 
                "Off"
            }, l_l_NewPage_0_43);
            l_l_NewPage_0_44.ChatTranslationToggleFrame = v340;
            l_l_NewPage_0_45.ChatTranslationToggleLabel = v341;
            v339.ChatTranslationToggleEnabler = v345;
            l_NewPage_0.ChatTranslationToggleFrame.LayoutOrder = v54.ChatTranslationToggleFrame;
            l_NewPage_0.ChatTranslationToggleEnabler.IndexChanged:connect(function(v346) --[[ Line: 1404 ]]
                -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v114 (ref), l_LocalPlayer_0 (ref)
                local v347 = v346 == 1;
                local l_ChatTranslationToggleEnabled_0 = l_TextChatService_0.ChatTranslationToggleEnabled;
                if v347 ~= l_ChatTranslationToggleEnabled_0 then
                    if l_game_EngineFeature_0 then
                        l_GameSettings_0.ChatTranslationToggleEnabled = v347;
                    else
                        l_TextChatService_0.ChatTranslationToggleEnabled = v347;
                    end;
                    v114("chat_translation_toggle", l_ChatTranslationToggleEnabled_0, v347, {
                        locale_id = l_LocalPlayer_0.LocaleId
                    });
                end;
            end);
        end;
        local function v354(v350) --[[ Line: 1422 ]] --[[ Name: getChatTranslationLayerData ]]
            -- upvalues: v60 (ref), v55 (ref), v62 (ref)
            local v351 = {
                ChatTranslationEnabled = false, 
                ChatTranslationToggleEnabled = false
            };
            if not v350 or v350 == "" then
                return v351;
            elseif v350 == "override" then
                v351.ChatTranslationEnabled = true;
                return v351;
            else
                if v60() then
                    v55:WaitForInitialization();
                end;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 1444 ]]
                    -- upvalues: v55 (ref), v350 (copy)
                    return v55:GetLayerData(v350);
                end);
                if l_status_1 then
                    if v62() then
                        v351.ChatTranslationEnabled = l_result_1.ChatTranslationEnabled or true;
                        v351.ChatTranslationToggleEnabled = l_result_1.ChatTranslationToggleEnabled or false;
                        return v351;
                    else
                        v351.ChatTranslationEnabled = l_result_1.chatTranslationEnabled or false;
                        v351.ChatTranslationToggleEnabled = l_result_1.chatTranslationToggleEnabled or false;
                    end;
                end;
                return v351;
            end;
        end;
        local __ = function(v355) --[[ Line: 1464 ]] --[[ Name: setUpChatTranslationIxpDefaults ]]
            -- upvalues: l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref)
            if l_game_EngineFeature_0 then
                l_GameSettings_0.ChatTranslationEnabled = v355.ChatTranslationEnabled;
                l_GameSettings_0.ChatTranslationToggleEnabled = v355.ChatTranslationToggleEnabled;
                return true;
            else
                local l_status_2, __ = pcall(function() --[[ Line: 1471 ]]
                    -- upvalues: l_TextChatService_0 (ref), v355 (copy)
                    l_TextChatService_0.ChatTranslationEnabled = v355.ChatTranslationEnabled;
                    l_TextChatService_0.ChatTranslationToggleEnabled = v355.ChatTranslationToggleEnabled;
                end);
                return l_status_2;
            end;
        end;
        if game:GetEngineFeature("EnableTCSChatTranslation") and not game:GetEngineFeature("EnableTCSChatTranslationLanguageSwitcher") and v56() then
            if v58() then
                if v59() then
                    if not v354((v57())).ChatTranslationEnabled then
                        if l_game_EngineFeature_0 then
                            if v62() then
                                if l_GameSettings_0.ChatTranslationLocale == "" then
                                    l_GameSettings_0.ChatTranslationEnabled = false;
                                    l_GameSettings_0.ChatTranslationLocale = "en_us";
                                end;
                            else
                                l_GameSettings_0.ChatTranslationEnabled = false;
                            end;
                        else
                            pcall(function() --[[ Line: 1502 ]]
                                -- upvalues: l_TextChatService_0 (ref)
                                l_TextChatService_0.ChatTranslationEnabled = false;
                            end);
                        end;
                    elseif v61() then
                        l_GameSettings_0.ChatTranslationEnabled = true;
                    end;
                end;
                v349();
            else
                local v359 = v354((v57()));
                local v360;
                if l_game_EngineFeature_0 then
                    l_GameSettings_0.ChatTranslationEnabled = v359.ChatTranslationEnabled;
                    l_GameSettings_0.ChatTranslationToggleEnabled = v359.ChatTranslationToggleEnabled;
                    v360 = true;
                else
                    local l_v359_0 = v359 --[[ copy: 8 -> 21 ]];
                    local l_status_3, __ = pcall(function() --[[ Line: 1471 ]]
                        -- upvalues: l_TextChatService_0 (ref), l_v359_0 (copy)
                        l_TextChatService_0.ChatTranslationEnabled = l_v359_0.ChatTranslationEnabled;
                        l_TextChatService_0.ChatTranslationToggleEnabled = l_v359_0.ChatTranslationToggleEnabled;
                    end);
                    v360 = l_status_3;
                end;
                if v360 and v359.ChatTranslationEnabled then
                    v349();
                end;
            end;
        end;
        local v364 = {};
        setMovementModeVisible = function(v365) --[[ Line: 1533 ]] --[[ Name: setMovementModeVisible ]]
            -- upvalues: l_NewPage_0 (ref), v364 (ref)
            if l_NewPage_0.MovementMode then
                local v366 = v365 and #v364 > 0;
                l_NewPage_0.MovementMode.SelectorFrame.Visible = v366;
                l_NewPage_0.MovementMode:SetInteractable(v366);
                l_NewPage_0.MovementModeOverrideText.Visible = not v366;
            end;
        end;
        if v278 then
            local v367 = {};
            local v368 = {};
            local v369 = v68.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
            local function __(v370) --[[ Line: 1548 ]] --[[ Name: getDisplayName ]]
                -- upvalues: v52 (ref), v53 (ref)
                local l_v370_0 = v370;
                if v370 == "Default" then
                    return v52;
                elseif v370 == "KeyboardMouse" then
                    return "Keyboard + Mouse";
                elseif v370 == "ClickToMove" then
                    return v53;
                elseif v370 == "DynamicThumbstick" then
                    return "Dynamic Thumbstick";
                else
                    if v370 == "Thumbstick" then
                        l_v370_0 = "Classic Thumbstick";
                    end;
                    return l_v370_0;
                end;
            end;
            local l_l_NewPage_0_46 = l_NewPage_0;
            local l_l_NewPage_0_47 = l_NewPage_0;
            local l_l_NewPage_0_48 = l_NewPage_0;
            local v376, v377, v378 = v66:AddNewRow(l_NewPage_0, "Movement Mode", "Selector", v367, 1);
            l_l_NewPage_0_46.MovementModeFrame = v376;
            l_l_NewPage_0_47.MovementModeLabel = v377;
            l_l_NewPage_0_48.MovementMode = v378;
            l_NewPage_0.MovementModeFrame.LayoutOrder = v54.MovementModeFrame;
            v122[l_NewPage_0.MovementMode] = true;
            l_NewPage_0.MovementModeOverrideText = l_Create_0("TextLabel")({
                Name = "MovementDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v71.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v71.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.MovementModeFrame
            });
            do
                local l_v367_0, l_v368_0 = v367, v368;
                l_l_NewPage_0_46 = function(v381) --[[ Line: 1589 ]] --[[ Name: setMovementModeToIndex ]]
                    -- upvalues: l_v368_0 (ref), l_v367_0 (ref), l_UserInputService_0 (ref), v99 (ref), l_GameSettings_0 (ref), v114 (ref)
                    local v382 = nil;
                    if not pcall(function() --[[ Line: 1591 ]]
                        -- upvalues: v382 (ref), l_v368_0 (ref), l_v367_0 (ref), v381 (copy)
                        v382 = l_v368_0[l_v367_0[v381]];
                    end) or v382 == nil then
                        return;
                    else
                        local v383 = nil;
                        if l_UserInputService_0.TouchEnabled then
                            if v99() then
                                v383 = l_GameSettings_0.TouchMovementMode;
                            end;
                            l_GameSettings_0.TouchMovementMode = v382;
                        else
                            if v99() then
                                v383 = l_GameSettings_0.ComputerMovementMode;
                            end;
                            l_GameSettings_0.ComputerMovementMode = v382;
                        end;
                        if v99() then
                            v114("movement_mode", v383, v382);
                        end;
                        return;
                    end;
                end;
                l_l_NewPage_0_47 = function() --[[ Line: 1617 ]] --[[ Name: updateMovementModes ]]
                    -- upvalues: v369 (copy), l_UserInputService_0 (ref), v364 (ref), l_v367_0 (ref), l_v368_0 (ref), v52 (ref), v53 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_46 (copy)
                    if v369 then
                        if l_UserInputService_0.TouchEnabled then
                            v364 = v369:GetRegisteredTouchMovementModes();
                        else
                            v364 = v369:GetRegisteredComputerMovementModes();
                        end;
                    end;
                    l_v367_0 = {};
                    l_v368_0 = {};
                    if #v364 <= 0 then
                        setMovementModeVisible(false);
                        return;
                    else
                        setMovementModeVisible(true);
                        for v384 = 1, #v364 do
                            local v385 = v364[v384];
                            local l_Name_3 = v385.Name;
                            local l_l_Name_3_0 = l_Name_3;
                            if l_Name_3 == "Default" then
                                l_l_Name_3_0 = v52;
                            elseif l_Name_3 == "KeyboardMouse" then
                                l_l_Name_3_0 = "Keyboard + Mouse";
                            elseif l_Name_3 == "ClickToMove" then
                                l_l_Name_3_0 = v53;
                            elseif l_Name_3 == "DynamicThumbstick" then
                                l_l_Name_3_0 = "Dynamic Thumbstick";
                            elseif l_Name_3 == "Thumbstick" then
                                l_l_Name_3_0 = "Classic Thumbstick";
                            end;
                            local l_l_l_Name_3_0_0 = l_l_Name_3_0;
                            l_v367_0[#l_v367_0 + 1] = l_l_l_Name_3_0_0;
                            l_v368_0[l_l_l_Name_3_0_0] = v385;
                        end;
                        if l_NewPage_0.MovementMode then
                            l_NewPage_0.MovementMode:UpdateOptions(l_v367_0);
                        end;
                        local v389 = -1;
                        v389 = if l_UserInputService_0.TouchEnabled then l_GameSettings_0.TouchMovementMode.Value else l_GameSettings_0.ComputerMovementMode.Value;
                        if v389 > -1 then
                            v389 = v389 + 1;
                            local v390 = nil;
                            do
                                local l_v390_0 = v390;
                                if pcall(function() --[[ Line: 1660 ]]
                                    -- upvalues: l_v390_0 (ref), l_v368_0 (ref), l_v367_0 (ref), v389 (ref)
                                    l_v390_0 = l_v368_0[l_v367_0[v389]];
                                end) and l_v390_0 then
                                    l_l_NewPage_0_46(l_v390_0.Value + 1);
                                    l_NewPage_0.MovementMode:SetSelectionIndex(l_v390_0.Value + 1);
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
                l_l_NewPage_0_47();
                if v369 then
                    v369.TouchMovementModeRegistered:connect(function(__) --[[ Line: 1673 ]]
                        -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                        if l_UserInputService_0.TouchEnabled then
                            l_l_NewPage_0_47();
                        end;
                    end);
                    v369.ComputerMovementModeRegistered:connect(function(__) --[[ Line: 1679 ]]
                        -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                        if l_UserInputService_0.MouseEnabled then
                            l_l_NewPage_0_47();
                        end;
                    end);
                end;
                l_NewPage_0.MovementMode.IndexChanged:connect(function(v394) --[[ Line: 1686 ]]
                    -- upvalues: l_l_NewPage_0_46 (copy), v118 (ref)
                    l_l_NewPage_0_46(v394);
                    v118();
                end);
            end;
        end;
        setShiftLockVisible = function(v395) --[[ Line: 1695 ]] --[[ Name: setShiftLockVisible ]]
            -- upvalues: l_NewPage_0 (ref)
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v395;
                l_NewPage_0.ShiftLockMode:SetInteractable(v395);
            end;
        end;
        local v396 = false;
        if not if l_UserInputService_0.TouchEnabled then l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            l_NewPage_0.CameraModeOverrideText.Visible = true;
            setCameraModeVisible(false);
        else
            l_NewPage_0.CameraModeOverrideText.Visible = false;
            setCameraModeVisible(true);
        end;
        local v397 = false;
        v397 = if l_UserInputService_0.TouchEnabled then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
        if l_NewPage_0.MovementModeOverrideText then
            if not v397 then
                l_NewPage_0.MovementModeOverrideText.Visible = true;
                setMovementModeVisible(false);
            else
                l_NewPage_0.MovementModeOverrideText.Visible = false;
                setMovementModeVisible(true);
            end;
        end;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = not l_LocalPlayer_0.DevEnableMouseLock;
            setShiftLockVisible(l_LocalPlayer_0.DevEnableMouseLock);
        end;
        v396 = function(v398) --[[ Line: 1741 ]] --[[ Name: updateUserSettingsMenu ]]
            -- upvalues: l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            if l_NewPage_0.ShiftLockOverrideText and v398 == "DevEnableMouseLock" then
                l_NewPage_0.ShiftLockOverrideText.Visible = not l_LocalPlayer_0.DevEnableMouseLock;
                setShiftLockVisible(l_LocalPlayer_0.DevEnableMouseLock);
                return;
            elseif v398 == "DevComputerCameraMode" then
                local v399 = l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
                setCameraModeVisible(v399);
                l_NewPage_0.CameraModeOverrideText.Visible = not v399;
                return;
            else
                if v398 == "DevComputerMovementMode" then
                    local v400 = l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                    setMovementModeVisible(v400);
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v400;
                        return;
                    end;
                elseif v398 == "DevTouchMovementMode" then
                    local v401 = l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
                    setMovementModeVisible(v401);
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v401;
                        return;
                    end;
                elseif v398 == "DevTouchCameraMode" then
                    local v402 = l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
                    setCameraModeVisible(v402);
                    l_NewPage_0.CameraModeOverrideText.Visible = not v402;
                end;
                return;
            end;
        end;
        l_LocalPlayer_0.Changed:connect(function(v403) --[[ Line: 1769 ]]
            -- upvalues: l_UserInputService_0 (ref), v49 (ref), v396 (copy), v48 (ref)
            if l_UserInputService_0.TouchEnabled and v49[v403] then
                v396(v403);
            end;
            if l_UserInputService_0.KeyboardEnabled and v48[v403] then
                v396(v403);
            end;
        end);
    end;
    local function v426() --[[ Line: 1786 ]] --[[ Name: createFeedbackModeOptions ]]
        -- upvalues: v16 (ref), l_HttpService_0 (ref), v107 (ref), l_NewPage_0 (copy), l_SafetyService_0 (ref), v20 (ref), v34 (ref), v114 (ref), v106 (ref), v66 (ref), v54 (ref), v102 (ref), v87 (ref)
        local v405 = v16.ROLES_URL .. "v1/users/authenticated/roles";
        local v406 = l_HttpService_0:RequestInternal({
            Url = v405, 
            Method = "GET"
        });
        local function v415(v407) --[[ Line: 1793 ]] --[[ Name: rolesCheckCallback ]]
            -- upvalues: v107 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v34 (ref), v114 (ref), v106 (ref), v66 (ref), v54 (ref)
            if v407 then
                if not v107 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                    return;
                else
                    local function v408() --[[ Line: 1805 ]] --[[ Name: onToggleFeedbackMode ]]
                        -- upvalues: v107 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v34 (ref), v114 (ref)
                        if v107 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                            return;
                        else
                            l_NewPage_0.HubRef:PopMenu(false, true);
                            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                                l_SafetyService_0.IsCaptureModeForReport = false;
                            end;
                            if v20 ~= nil then
                                v20:ToggleCaptureMode();
                            end;
                            if v34 then
                                v114("translation_feedback", "", "pressed");
                            end;
                            return;
                        end;
                    end;
                    local v409 = nil;
                    local v410 = nil;
                    if v106 then
                        local v411, v412 = v66:MakeStyledButton("toggleFeedbackModeButton", "Give Feedback", UDim2.new(1, 0, 1, -20), v408, l_NewPage_0);
                        v409 = v411;
                        v410 = v412;
                        v409.Size = UDim2.new(0.6, 0, 0, 40);
                        v409.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v409.AnchorPoint = Vector2.new(0, 0.5);
                    else
                        local v413, v414 = v66:MakeStyledButton("toggleFeedbackModeButton", "Give Feedback", UDim2.new(0, 300, 1, -20), v408, l_NewPage_0);
                        v409 = v413;
                        v410 = v414;
                        v409.Size = UDim2.new(0, 300, 0, 30);
                        v409.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v409.AnchorPoint = Vector2.new(0, 0.5);
                    end;
                    v409.ZIndex = 2;
                    v409.Selectable = true;
                    v410.ZIndex = 2;
                    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
                        l_NewPage_0.toggleFeedbackModeButton = v409;
                        l_NewPage_0.toggleFeedbackModeText = v410;
                    end;
                    if v106 then
                        v66:AddNewRowObject(l_NewPage_0, "Give Translation Feedback", v409, nil, true).LayoutOrder = v54.FeedbackModeButton;
                        return;
                    else
                        v66:AddNewRowObject(l_NewPage_0, "Give Translation Feedback", v409).LayoutOrder = v54.FeedbackModeButton;
                    end;
                end;
            end;
        end;
        if v102 then
            v415(true);
            return;
        else
            v406:Start(function(v416, v417) --[[ Line: 1881 ]]
                -- upvalues: l_HttpService_0 (ref), v87 (ref), v405 (copy), v415 (copy)
                local v418 = false;
                local v419 = false;
                local v420 = nil;
                if not v416 then
                    v420 = "Roles Api Request: Connection error";
                elseif v417.StatusCode == 401 then
                    v420 = "Roles Api Request: Unauthorized";
                elseif v417.StatusCode < 200 or v417.StatusCode >= 400 then
                    v420 = "Roles Api Status code: " .. v417.StatusCode;
                else
                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 1893 ]]
                        -- upvalues: l_HttpService_0 (ref), v417 (copy), v418 (ref)
                        local v421 = l_HttpService_0:JSONDecode(v417.Body);
                        for __, v423 in pairs(v421.roles) do
                            if v423 == "Soothsayer" then
                                v418 = true;
                            end;
                        end;
                    end);
                    v419 = l_status_4;
                    v420 = l_result_4;
                end;
                if not v419 then
                    v87:warning("Feedback Mode initialization api call failed with url: " .. v405 .. " and with error message: " .. v420);
                end;
                v415(v418);
            end);
            return;
        end;
    end;
    local function v584() --[[ Line: 1921 ]] --[[ Name: createTranslationOptions ]]
        -- upvalues: l_Players_0 (ref), v16 (ref), l_HttpService_0 (ref), v87 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), l_LocalPlayer_0 (ref), v34 (ref), v114 (ref), l_RunService_0 (ref)
        local v427 = 1;
        local v428 = 1;
        local v429 = false;
        local v430 = nil;
        local v431 = nil;
        local l_LocaleId_0 = l_Players_0.LocalPlayer.LocaleId;
        local v433 = nil;
        local v434 = nil;
        local v435 = {};
        local v436 = {};
        local v437 = {};
        local v438 = {};
        local v439 = {};
        local v440 = v16.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
        local v441 = l_HttpService_0:RequestInternal({
            Url = v440, 
            Method = "GET"
        });
        local v442 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
        local v443 = l_HttpService_0:RequestInternal({
            Url = v442, 
            Method = "GET"
        });
        local v444 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d", game.GameId);
        local v445 = l_HttpService_0:RequestInternal({
            Url = v444, 
            Method = "GET"
        });
        local v446 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
        local v447 = l_HttpService_0:RequestInternal({
            Url = v446, 
            Method = "GET"
        });
        local function v482(v448, v449) --[[ Line: 1986 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
            -- upvalues: v87 (ref), l_NewPage_0 (ref), v66 (ref), v54 (ref), v439 (copy), v437 (copy), v430 (ref), v435 (copy), v434 (ref), v436 (copy), v427 (ref), v428 (ref), l_LocalPlayer_0 (ref), v431 (ref), v34 (ref), v114 (ref), v16 (ref), l_HttpService_0 (ref), v429 (ref), l_RunService_0 (ref)
            if not v448 then
                if v449 == nil then
                    v449 = "Execution path did not set earliest error to non-nil value.";
                end;
                v87:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v449);
                local l_l_NewPage_0_49 = l_NewPage_0;
                local l_l_NewPage_0_50 = l_NewPage_0;
                local l_l_NewPage_0_51 = l_NewPage_0;
                local v453, v454, v455 = v66:AddNewRow(l_NewPage_0, "Experience Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_l_NewPage_0_49.LanguageSelectorFrame = v453;
                l_l_NewPage_0_50.LanguageSelectorLabel = v454;
                l_l_NewPage_0_51.LanguageSelectorMode = v455;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = v54.LanguageSelectorFrame;
                return;
            else
                local v456 = false;
                table.insert(v439, v437[v430].languageName .. " (Original)");
                for __, v458 in pairs(v435) do
                    if v458 == v434 then
                        v456 = true;
                    end;
                    if v458 ~= v430 then
                        table.insert(v439, v437[v458].languageName);
                    end;
                end;
                if v456 == true then
                    for v459, v460 in pairs(v439) do
                        if v459 ~= 1 and v436[v460] == v434 then
                            v427 = v459;
                            v428 = v459;
                        end;
                    end;
                end;
                local l_l_NewPage_0_52 = l_NewPage_0;
                local l_l_NewPage_0_53 = l_NewPage_0;
                local l_l_NewPage_0_54 = l_NewPage_0;
                local v464, v465, v466 = v66:AddNewRow(l_NewPage_0, "Experience Language", "DropDown", v439, v427);
                l_l_NewPage_0_52.LanguageSelectorFrame = v464;
                l_l_NewPage_0_53.LanguageSelectorLabel = v465;
                l_l_NewPage_0_54.LanguageSelectorMode = v466;
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = v54.LanguageSelectorFrame;
                if v427 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v431);
                else
                    l_l_NewPage_0_52 = v436[v439[v427]];
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v437[l_l_NewPage_0_52].localeCode);
                end;
                if v34 then
                    l_NewPage_0.LanguageSelectorMode.CurrentLanguage = l_NewPage_0.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                end;
                l_l_NewPage_0_52 = function(v467) --[[ Line: 2056 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: l_NewPage_0 (ref), v437 (ref), v430 (ref), v436 (ref), v439 (ref), v34 (ref), v114 (ref), v16 (ref), l_HttpService_0 (ref), v428 (ref), l_LocalPlayer_0 (ref), v431 (ref), v87 (ref), v429 (ref), l_RunService_0 (ref)
                    l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                    local v468 = nil;
                    v468 = if v467 == 1 then v437[v430].id else v437[v436[v439[v467]]].id;
                    if v34 then
                        local l_CurrentLanguage_0 = l_NewPage_0.LanguageSelectorMode.CurrentLanguage;
                        local v470 = v439[v467];
                        if l_CurrentLanguage_0 ~= v470 then
                            l_NewPage_0.LanguageSelectorMode.CurrentLanguage = v470;
                            v114("experience_language", l_CurrentLanguage_0, v470);
                        end;
                    end;
                    local v471 = {
                        settingValue = {
                            settingType = "LanguageFamily", 
                            settingTargetId = v468
                        }
                    };
                    local v472 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v473 = l_HttpService_0:RequestInternal({
                        Url = v472, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v471)
                    });
                    local function v477(v474, v475) --[[ Line: 2105 ]] --[[ Name: callback ]]
                        -- upvalues: v428 (ref), v467 (copy), l_LocalPlayer_0 (ref), v431 (ref), v436 (ref), v439 (ref), v437 (ref), v87 (ref), v429 (ref), l_NewPage_0 (ref)
                        if v474 then
                            v428 = v467;
                            if v467 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v431);
                            else
                                local v476 = v436[v439[v467]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v437[v476].localeCode);
                            end;
                        else
                            v87:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v475);
                            v429 = true;
                            l_NewPage_0.LanguageSelectorMode:SetSelectionIndex(v428);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v477(true, nil);
                        return;
                    elseif v429 then
                        v429 = false;
                        v477(true, nil);
                        return;
                    else
                        v473:Start(function(v478, v479) --[[ Line: 2148 ]]
                            -- upvalues: v87 (ref), v472 (copy), v477 (copy)
                            local v480 = false;
                            local v481 = nil;
                            if not v478 then
                                v481 = "User Experience Language Settings Update Request: Connection error";
                            elseif v479.StatusCode == 401 then
                                v481 = "User Experience Language Settings Update Request: Unauthorized";
                            elseif v479.StatusCode < 200 or v479.StatusCode >= 400 then
                                v481 = "User Experience Language Settings Update Request Status Code: " .. v479.StatusCode;
                            else
                                v87:info("User Experience Language Settings Update Request succeeded with code: " .. v479.StatusCode);
                                v480 = true;
                            end;
                            if not v480 then
                                v87:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v472 .. " with error message: " .. v481);
                            end;
                            v477(v480, v481);
                        end);
                        return;
                    end;
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(l_l_NewPage_0_52);
                return;
            end;
        end;
        local function __(v483, v484) --[[ Line: 2183 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
            -- upvalues: v447 (copy), l_HttpService_0 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (copy), v87 (ref), v446 (copy), v482 (copy)
            if v483 then
                v447:Start(function(v485, v486) --[[ Line: 2185 ]]
                    -- upvalues: l_HttpService_0 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v87 (ref), v446 (ref), v482 (ref)
                    local v487 = false;
                    local v488 = nil;
                    if not v485 then
                        v488 = "User Experience Language Setting Request: Connection error";
                    elseif v486.StatusCode == 401 then
                        v488 = "User Experience Language Setting Request: Unauthorized";
                    elseif v486.StatusCode < 200 or v486.StatusCode >= 400 then
                        v488 = "User Experience Language Setting Request Status code: " .. v486.StatusCode;
                    else
                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 2196 ]]
                            -- upvalues: l_HttpService_0 (ref), v486 (copy), v434 (ref), v433 (ref), v430 (ref), v438 (ref)
                            local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v486.Body).userUniverseLocalizationSettingValue;
                            if l_userUniverseLocalizationSettingValue_0 == nil then
                                v434 = v433;
                                return;
                            else
                                if l_userUniverseLocalizationSettingValue_0.settingType == "SourceOrTranslation" then
                                    if l_userUniverseLocalizationSettingValue_0.settingTargetId == 1 then
                                        v434 = v430;
                                    else
                                        v434 = v433;
                                    end;
                                end;
                                if l_userUniverseLocalizationSettingValue_0.settingType == "LanguageFamily" then
                                    if v438[l_userUniverseLocalizationSettingValue_0.settingTargetId] == nil then
                                        v434 = v433;
                                        return;
                                    else
                                        v434 = v438[l_userUniverseLocalizationSettingValue_0.settingTargetId];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v487 = l_status_5;
                        v488 = l_result_5;
                    end;
                    if not v487 then
                        v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v446 .. " with error message: " .. v488);
                    end;
                    v482(v487, v488);
                end);
                return;
            else
                v482(false, v484);
                return;
            end;
        end;
        local function __(v493, v494) --[[ Line: 2245 ]] --[[ Name: experienceSourceLanguageCallback ]]
            -- upvalues: v445 (copy), l_HttpService_0 (ref), v435 (copy), v87 (ref), v444 (copy), v447 (copy), v434 (ref), v433 (ref), v430 (ref), v438 (copy), v446 (copy), v482 (copy)
            if v493 then
                v445:Start(function(v495, v496) --[[ Line: 2247 ]]
                    -- upvalues: l_HttpService_0 (ref), v435 (ref), v87 (ref), v444 (ref), v494 (ref), v493 (copy), v447 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v446 (ref), v482 (ref)
                    local v497 = false;
                    local v498 = nil;
                    if not v495 then
                        v498 = "Experience Supported Language Request: Connection error";
                    elseif v496.StatusCode == 401 then
                        v498 = "Experience Supported Language Request: Unauthorized";
                    elseif v496.StatusCode < 200 or v496.StatusCode >= 400 then
                        v498 = "Experience Supported Language Request Status code: " .. v496.StatusCode;
                    else
                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2257 ]]
                            -- upvalues: l_HttpService_0 (ref), v496 (copy), v435 (ref)
                            local v499 = l_HttpService_0:JSONDecode(v496.Body);
                            for v500, v501 in pairs(v499.data) do
                                v435[v500] = v501.languageCode;
                            end;
                        end);
                        v497 = l_status_6;
                        v498 = l_result_6;
                    end;
                    if not v497 then
                        v87:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v444 .. " with error message: " .. v498);
                    end;
                    if v494 == nil then
                        v494 = v498;
                    end;
                    local v504 = v497 and v493;
                    local l_v494_0 = v494;
                    if v504 then
                        v447:Start(function(v506, v507) --[[ Line: 2185 ]]
                            -- upvalues: l_HttpService_0 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v87 (ref), v446 (ref), v482 (ref)
                            local v508 = false;
                            local v509 = nil;
                            if not v506 then
                                v509 = "User Experience Language Setting Request: Connection error";
                            elseif v507.StatusCode == 401 then
                                v509 = "User Experience Language Setting Request: Unauthorized";
                            elseif v507.StatusCode < 200 or v507.StatusCode >= 400 then
                                v509 = "User Experience Language Setting Request Status code: " .. v507.StatusCode;
                            else
                                local l_status_7, l_result_7 = pcall(function() --[[ Line: 2196 ]]
                                    -- upvalues: l_HttpService_0 (ref), v507 (copy), v434 (ref), v433 (ref), v430 (ref), v438 (ref)
                                    local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v507.Body).userUniverseLocalizationSettingValue;
                                    if l_userUniverseLocalizationSettingValue_1 == nil then
                                        v434 = v433;
                                        return;
                                    else
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "SourceOrTranslation" then
                                            if l_userUniverseLocalizationSettingValue_1.settingTargetId == 1 then
                                                v434 = v430;
                                            else
                                                v434 = v433;
                                            end;
                                        end;
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "LanguageFamily" then
                                            if v438[l_userUniverseLocalizationSettingValue_1.settingTargetId] == nil then
                                                v434 = v433;
                                                return;
                                            else
                                                v434 = v438[l_userUniverseLocalizationSettingValue_1.settingTargetId];
                                            end;
                                        end;
                                        return;
                                    end;
                                end);
                                v508 = l_status_7;
                                v509 = l_result_7;
                            end;
                            if not v508 then
                                v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v446 .. " with error message: " .. v509);
                            end;
                            v482(v508, v509);
                        end);
                        return;
                    else
                        v482(false, l_v494_0);
                        return;
                    end;
                end);
            else
                v482(false, v494);
            end;
        end;
        local function __(v514, v515) --[[ Line: 2286 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
            -- upvalues: v443 (copy), l_HttpService_0 (ref), v430 (ref), v431 (ref), v437 (copy), v87 (ref), v442 (copy), v445 (copy), v435 (copy), v444 (copy), v447 (copy), v434 (ref), v433 (ref), v438 (copy), v446 (copy), v482 (copy)
            if v514 then
                v443:Start(function(v516, v517) --[[ Line: 2288 ]]
                    -- upvalues: l_HttpService_0 (ref), v430 (ref), v431 (ref), v437 (ref), v87 (ref), v442 (ref), v515 (ref), v514 (copy), v445 (ref), v435 (ref), v444 (ref), v447 (ref), v434 (ref), v433 (ref), v438 (ref), v446 (ref), v482 (ref)
                    local v518 = false;
                    local v519 = nil;
                    if not v516 then
                        v519 = "Experience Source Language Request: Connection error";
                    elseif v517.StatusCode == 401 then
                        v519 = "Experience Source Language Request: Unauthorized";
                    elseif v517.StatusCode < 200 or v517.StatusCode >= 400 then
                        v519 = "Experience Source Language Status code: " .. v517.StatusCode;
                    else
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 2299 ]]
                            -- upvalues: l_HttpService_0 (ref), v517 (copy), v430 (ref), v431 (ref), v437 (ref)
                            v430 = l_HttpService_0:JSONDecode(v517.Body).languageCode;
                            v431 = v437[v430].localeCode;
                        end);
                        v518 = l_status_8;
                        v519 = l_result_8;
                    end;
                    if not v518 then
                        v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v442 .. " with error message: " .. v519);
                    end;
                    if v515 == nil then
                        v515 = v519;
                    end;
                    local v522 = v518 and v514;
                    local l_v515_0 = v515;
                    if v522 then
                        v445:Start(function(v524, v525) --[[ Line: 2247 ]]
                            -- upvalues: l_HttpService_0 (ref), v435 (ref), v87 (ref), v444 (ref), l_v515_0 (ref), v522 (copy), v447 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v446 (ref), v482 (ref)
                            local v526 = false;
                            local v527 = nil;
                            if not v524 then
                                v527 = "Experience Supported Language Request: Connection error";
                            elseif v525.StatusCode == 401 then
                                v527 = "Experience Supported Language Request: Unauthorized";
                            elseif v525.StatusCode < 200 or v525.StatusCode >= 400 then
                                v527 = "Experience Supported Language Request Status code: " .. v525.StatusCode;
                            else
                                local l_status_9, l_result_9 = pcall(function() --[[ Line: 2257 ]]
                                    -- upvalues: l_HttpService_0 (ref), v525 (copy), v435 (ref)
                                    local v528 = l_HttpService_0:JSONDecode(v525.Body);
                                    for v529, v530 in pairs(v528.data) do
                                        v435[v529] = v530.languageCode;
                                    end;
                                end);
                                v526 = l_status_9;
                                v527 = l_result_9;
                            end;
                            if not v526 then
                                v87:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v444 .. " with error message: " .. v527);
                            end;
                            if l_v515_0 == nil then
                                l_v515_0 = v527;
                            end;
                            local v533 = v526 and v522;
                            local l_l_v515_0_0 = l_v515_0;
                            if v533 then
                                v447:Start(function(v535, v536) --[[ Line: 2185 ]]
                                    -- upvalues: l_HttpService_0 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v87 (ref), v446 (ref), v482 (ref)
                                    local v537 = false;
                                    local v538 = nil;
                                    if not v535 then
                                        v538 = "User Experience Language Setting Request: Connection error";
                                    elseif v536.StatusCode == 401 then
                                        v538 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v536.StatusCode < 200 or v536.StatusCode >= 400 then
                                        v538 = "User Experience Language Setting Request Status code: " .. v536.StatusCode;
                                    else
                                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2196 ]]
                                            -- upvalues: l_HttpService_0 (ref), v536 (copy), v434 (ref), v433 (ref), v430 (ref), v438 (ref)
                                            local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v536.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_2 == nil then
                                                v434 = v433;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_2.settingTargetId == 1 then
                                                        v434 = v430;
                                                    else
                                                        v434 = v433;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "LanguageFamily" then
                                                    if v438[l_userUniverseLocalizationSettingValue_2.settingTargetId] == nil then
                                                        v434 = v433;
                                                        return;
                                                    else
                                                        v434 = v438[l_userUniverseLocalizationSettingValue_2.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v537 = l_status_10;
                                        v538 = l_result_10;
                                    end;
                                    if not v537 then
                                        v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v446 .. " with error message: " .. v538);
                                    end;
                                    v482(v537, v538);
                                end);
                                return;
                            else
                                v482(false, l_l_v515_0_0);
                                return;
                            end;
                        end);
                    else
                        v482(false, l_v515_0);
                    end;
                end);
            else
                v482(false, v515);
                --[[ close >= 2 ]]
            end;
        end;
        v441:Start(function(v543, v544) --[[ Line: 2330 ]]
            -- upvalues: l_HttpService_0 (ref), v437 (copy), v438 (copy), v436 (copy), l_LocaleId_0 (copy), v433 (ref), v87 (ref), v440 (copy), v443 (copy), v430 (ref), v431 (ref), v442 (copy), v445 (copy), v435 (copy), v444 (copy), v447 (copy), v434 (ref), v446 (copy), v482 (copy)
            local v545 = false;
            local v546 = nil;
            if not v543 then
                v546 = "Locale Code to Language Code Mapping Request: Connection error";
            elseif v544.StatusCode == 401 then
                v546 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif v544.StatusCode < 200 or v544.StatusCode >= 400 then
                v546 = "Locale Code to Language Code Mapping Request Status code: " .. v544.StatusCode;
            else
                local l_status_11, l_result_11 = pcall(function() --[[ Line: 2341 ]]
                    -- upvalues: l_HttpService_0 (ref), v544 (copy), v437 (ref), v438 (ref), v436 (ref), l_LocaleId_0 (ref), v433 (ref)
                    local v547 = l_HttpService_0:JSONDecode(v544.Body);
                    for __, v549 in pairs(v547.data) do
                        local l_languageCode_0 = v549.locale.language.languageCode;
                        local l_locale_0 = v549.locale.locale;
                        local l_name_0 = v549.locale.language.name;
                        local l_id_0 = v549.locale.language.id;
                        v437[l_languageCode_0] = {
                            localeCode = l_locale_0, 
                            languageName = l_name_0, 
                            id = l_id_0
                        };
                        v438[l_id_0] = l_languageCode_0;
                        v436[l_name_0] = l_languageCode_0;
                        if v549.locale.locale == l_LocaleId_0:gsub("-", "_") then
                            v433 = v549.locale.language.languageCode;
                        end;
                    end;
                end);
                v545 = l_status_11;
                v546 = l_result_11;
            end;
            if not v545 then
                v87:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v440 .. " with error message: " .. v546);
            end;
            local l_v545_0 = v545;
            local l_v546_0 = v546;
            if l_v545_0 then
                v443:Start(function(v558, v559) --[[ Line: 2288 ]]
                    -- upvalues: l_HttpService_0 (ref), v430 (ref), v431 (ref), v437 (ref), v87 (ref), v442 (ref), l_v546_0 (ref), l_v545_0 (copy), v445 (ref), v435 (ref), v444 (ref), v447 (ref), v434 (ref), v433 (ref), v438 (ref), v446 (ref), v482 (ref)
                    local v560 = false;
                    local v561 = nil;
                    if not v558 then
                        v561 = "Experience Source Language Request: Connection error";
                    elseif v559.StatusCode == 401 then
                        v561 = "Experience Source Language Request: Unauthorized";
                    elseif v559.StatusCode < 200 or v559.StatusCode >= 400 then
                        v561 = "Experience Source Language Status code: " .. v559.StatusCode;
                    else
                        local l_status_12, l_result_12 = pcall(function() --[[ Line: 2299 ]]
                            -- upvalues: l_HttpService_0 (ref), v559 (copy), v430 (ref), v431 (ref), v437 (ref)
                            v430 = l_HttpService_0:JSONDecode(v559.Body).languageCode;
                            v431 = v437[v430].localeCode;
                        end);
                        v560 = l_status_12;
                        v561 = l_result_12;
                    end;
                    if not v560 then
                        v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v442 .. " with error message: " .. v561);
                    end;
                    if l_v546_0 == nil then
                        l_v546_0 = v561;
                    end;
                    local v564 = v560 and l_v545_0;
                    local l_l_v546_0_0 = l_v546_0;
                    if v564 then
                        v445:Start(function(v566, v567) --[[ Line: 2247 ]]
                            -- upvalues: l_HttpService_0 (ref), v435 (ref), v87 (ref), v444 (ref), l_l_v546_0_0 (ref), v564 (copy), v447 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v446 (ref), v482 (ref)
                            local v568 = false;
                            local v569 = nil;
                            if not v566 then
                                v569 = "Experience Supported Language Request: Connection error";
                            elseif v567.StatusCode == 401 then
                                v569 = "Experience Supported Language Request: Unauthorized";
                            elseif v567.StatusCode < 200 or v567.StatusCode >= 400 then
                                v569 = "Experience Supported Language Request Status code: " .. v567.StatusCode;
                            else
                                local l_status_13, l_result_13 = pcall(function() --[[ Line: 2257 ]]
                                    -- upvalues: l_HttpService_0 (ref), v567 (copy), v435 (ref)
                                    local v570 = l_HttpService_0:JSONDecode(v567.Body);
                                    for v571, v572 in pairs(v570.data) do
                                        v435[v571] = v572.languageCode;
                                    end;
                                end);
                                v568 = l_status_13;
                                v569 = l_result_13;
                            end;
                            if not v568 then
                                v87:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v444 .. " with error message: " .. v569);
                            end;
                            if l_l_v546_0_0 == nil then
                                l_l_v546_0_0 = v569;
                            end;
                            local v575 = v568 and v564;
                            local l_l_l_v546_0_0_0 = l_l_v546_0_0;
                            if v575 then
                                v447:Start(function(v577, v578) --[[ Line: 2185 ]]
                                    -- upvalues: l_HttpService_0 (ref), v434 (ref), v433 (ref), v430 (ref), v438 (ref), v87 (ref), v446 (ref), v482 (ref)
                                    local v579 = false;
                                    local v580 = nil;
                                    if not v577 then
                                        v580 = "User Experience Language Setting Request: Connection error";
                                    elseif v578.StatusCode == 401 then
                                        v580 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v578.StatusCode < 200 or v578.StatusCode >= 400 then
                                        v580 = "User Experience Language Setting Request Status code: " .. v578.StatusCode;
                                    else
                                        local l_status_14, l_result_14 = pcall(function() --[[ Line: 2196 ]]
                                            -- upvalues: l_HttpService_0 (ref), v578 (copy), v434 (ref), v433 (ref), v430 (ref), v438 (ref)
                                            local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v578.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_3 == nil then
                                                v434 = v433;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_3.settingTargetId == 1 then
                                                        v434 = v430;
                                                    else
                                                        v434 = v433;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "LanguageFamily" then
                                                    if v438[l_userUniverseLocalizationSettingValue_3.settingTargetId] == nil then
                                                        v434 = v433;
                                                        return;
                                                    else
                                                        v434 = v438[l_userUniverseLocalizationSettingValue_3.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v579 = l_status_14;
                                        v580 = l_result_14;
                                    end;
                                    if not v579 then
                                        v87:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v446 .. " with error message: " .. v580);
                                    end;
                                    v482(v579, v580);
                                end);
                                return;
                            else
                                v482(false, l_l_l_v546_0_0_0);
                                return;
                            end;
                        end);
                    else
                        v482(false, l_l_v546_0_0);
                    end;
                end);
            else
                v482(false, l_v546_0);
                --[[ close >= 6 ]]
            end;
        end);
    end;
    local function v589(v585) --[[ Line: 2380 ]] --[[ Name: getChatTranslationLayerData ]]
        -- upvalues: v55 (ref)
        local v586 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v585 or v585 == "" then
            return v586;
        elseif v585 == "override" then
            v586.ChatTranslationEnabled = true;
            return v586;
        else
            local l_status_15, l_result_15 = pcall(function() --[[ Line: 2396 ]]
                -- upvalues: v55 (ref), v585 (copy)
                return v55:GetLayerData(v585);
            end);
            if l_status_15 then
                v586.ChatTranslationEnabled = l_result_15.chatTranslationEnabled or false;
                v586.ChatTranslationToggleEnabled = l_result_15.chatTranslationToggleEnabled or false;
            end;
            return v586;
        end;
    end;
    local __ = function(v590) --[[ Line: 2408 ]] --[[ Name: setUpChatTranslationIxpDefaults ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref)
        if l_game_EngineFeature_0 then
            l_GameSettings_0.ChatTranslationEnabled = v590.ChatTranslationEnabled;
            l_GameSettings_0.ChatTranslationToggleEnabled = v590.ChatTranslationToggleEnabled;
            return true;
        else
            local l_status_16, __ = pcall(function() --[[ Line: 2415 ]]
                -- upvalues: l_TextChatService_0 (ref), v590 (copy)
                l_TextChatService_0.ChatTranslationEnabled = v590.ChatTranslationEnabled;
                l_TextChatService_0.ChatTranslationToggleEnabled = v590.ChatTranslationToggleEnabled;
            end);
            return l_status_16;
        end;
    end;
    local function v604() --[[ Line: 2424 ]] --[[ Name: createVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v594 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_55 = l_NewPage_0;
        local l_l_NewPage_0_56 = l_NewPage_0;
        local l_l_NewPage_0_57 = l_NewPage_0;
        local v598, v599, v600 = v66:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v594);
        l_l_NewPage_0_55.VolumeFrame = v598;
        l_l_NewPage_0_56.VolumeLabel = v599;
        l_l_NewPage_0_57.VolumeSlider = v600;
        l_NewPage_0.VolumeFrame.LayoutOrder = v54.VolumeFrame;
        l_l_NewPage_0_55 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_55.Name = "VolumeChangeSound";
        l_l_NewPage_0_55.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v601) --[[ Line: 2435 ]]
            -- upvalues: v99 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_55 (copy), v114 (ref), v118 (ref)
            local v602 = nil;
            if v99() then
                v602 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v603 = v601 / 10;
            l_l_NewPage_0_55.Volume = v603;
            l_l_NewPage_0_55:Play();
            l_GameSettings_0.MasterVolume = v603;
            if v99() then
                v114("volume", v602, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v118();
        end);
    end;
    local function v614() --[[ Line: 2453 ]] --[[ Name: createPartyVoiceVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v605 = math.floor(l_GameSettings_0.PartyVoiceVolume * 10);
        local l_l_NewPage_0_58 = l_NewPage_0;
        local l_l_NewPage_0_59 = l_NewPage_0;
        local l_l_NewPage_0_60 = l_NewPage_0;
        local v609, v610, v611 = v66:AddNewRow(l_NewPage_0, "Party Voice Volume", "Slider", 10, v605);
        l_l_NewPage_0_58.PartyVoiceVolumeFrame = v609;
        l_l_NewPage_0_59.PartyVoiceVolumeLabel = v610;
        l_l_NewPage_0_60.PartyVoiceVolumeSlider = v611;
        l_NewPage_0.PartyVoiceVolumeFrame.LayoutOrder = v54.PartyVoiceVolumeFrame;
        l_NewPage_0.PartyVoiceVolumeSlider.ValueChanged:connect(function(v612) --[[ Line: 2460 ]]
            -- upvalues: v99 (ref), v605 (copy), l_GameSettings_0 (ref), v114 (ref), v118 (ref)
            local v613 = nil;
            if v99() then
                v613 = if v605 ~= nil then math.floor(v605 * 10 + 0.5) else 0;
            end;
            l_GameSettings_0.PartyVoiceVolume = v612 / 10;
            if v99() then
                v114("party_voice_volume", v613, (math.floor(v612 * 10 + 0.5)));
            end;
            v118();
        end);
    end;
    local function v623() --[[ Line: 2476 ]] --[[ Name: createHapticsToggle ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v615 = l_GameSettings_0.HapticStrength == 0 and 1 or 2;
        local l_l_NewPage_0_61 = l_NewPage_0;
        local l_l_NewPage_0_62 = l_NewPage_0;
        local v618, v619, v620 = v66:AddNewRow(l_NewPage_0, "Haptics", "Selector", {
            "Off", 
            "On"
        }, v615);
        l_l_NewPage_0_61.HapticsFrame = v618;
        _ = v619;
        l_l_NewPage_0_62.HapticsSelector = v620;
        l_NewPage_0.HapticsFrame.LayoutOrder = v54.HapticsFrame;
        l_NewPage_0.HapticsSelector.IndexChanged:connect(function(v621) --[[ Line: 2482 ]]
            -- upvalues: l_GameSettings_0 (ref), v99 (ref), v114 (ref), v118 (ref)
            local l_HapticStrength_0 = l_GameSettings_0.HapticStrength;
            if v621 == 2 then
                l_GameSettings_0.HapticStrength = 1;
            else
                l_GameSettings_0.HapticStrength = 0;
            end;
            if v99() then
                v114("haptics_toggle", l_HapticStrength_0, l_GameSettings_0.HapticStrength);
            end;
            v118();
        end);
    end;
    local function v632() --[[ Line: 2498 ]] --[[ Name: createCameraInvertedOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v122 (copy), v99 (ref), v114 (ref), v118 (ref)
        local v624 = 1;
        if pcall(function() --[[ Line: 2500 ]]
            -- upvalues: l_GameSettings_0 (ref), v624 (ref)
            if l_GameSettings_0.CameraYInverted == true then
                v624 = 2;
            end;
        end) == false then
            return;
        else
            local l_l_NewPage_0_63 = l_NewPage_0;
            local l_l_NewPage_0_64 = l_NewPage_0;
            local v627, v628, v629 = v66:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v624);
            l_l_NewPage_0_63.CameraInvertedFrame = v627;
            _ = v628;
            l_l_NewPage_0_64.CameraInvertedSelector = v629;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = v54.CameraInvertedFrame;
            v122[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v630) --[[ Line: 2515 ]]
                -- upvalues: v99 (ref), l_GameSettings_0 (ref), v114 (ref), v118 (ref)
                local v631 = nil;
                if v99() then
                    v631 = l_GameSettings_0.CameraYInverted;
                end;
                if v630 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v99() then
                    v114("camera_y_inverted", v631, l_GameSettings_0.CameraYInverted);
                end;
                v118();
            end);
            return;
        end;
    end;
    local function v637(v633) --[[ Line: 2534 ]] --[[ Name: setCameraSensitivity ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v99 (ref), v114 (ref), v118 (ref)
        local v634 = nil;
        local v635 = nil;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            if v99() then
                v634 = "gamepad";
                v635 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v633;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v99() then
                v634 = "mouse";
                v635 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v636 = Vector2.new(v633, v633);
            l_GameSettings_0.MouseSensitivityFirstPerson = v636;
            l_GameSettings_0.MouseSensitivityThirdPerson = v636;
        end;
        if v99() and typeof(v635) == "number" and typeof(v633) == "number" then
            v114("camera_sensitivity", tonumber(string.format("%.2f", v635)), tonumber(string.format("%.2f", v633)), {
                sensitivity_type = v634
            });
        end;
        v118();
    end;
    local function v665() --[[ Line: 2572 ]] --[[ Name: createMouseOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v122 (copy), v38 (ref), l_Create_0 (ref), v71 (ref), v637 (copy)
        local function __(v638) --[[ Line: 2577 ]] --[[ Name: translateEngineMouseSensitivityToGui ]]
            local v639 = v638 <= 1 and math.floor((v638 - 0.2) / 0.16 + 0.5) or math.floor((v638 + 2) / 0.6 + 0.5);
            if v638 <= 0.2 then
                return 0;
            else
                return v639;
            end;
        end;
        local function __(v641) --[[ Line: 2585 ]] --[[ Name: translateGuiMouseSensitivityToEngine ]]
            local v642 = v641 <= 5 and 0.16 * v641 + 0.2 or 0.6 * v641 - 2;
            if v642 <= 0.2 then
                return 0.2;
            else
                return v642;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v645 = l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5);
        local v646 = l_MouseSensitivity_0 <= 0.2 and 0 or v645;
        l_MouseSensitivity_0 = true;
        v645 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_65 = l_NewPage_0;
        local l_l_NewPage_0_66 = l_NewPage_0;
        local l_l_NewPage_0_67 = l_NewPage_0;
        local v650, v651, v652 = v66:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v646);
        l_l_NewPage_0_65.MouseAdvancedFrame = v650;
        l_l_NewPage_0_66.MouseAdvancedLabel = v651;
        l_l_NewPage_0_67.MouseAdvancedEntry = v652;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = v54.MouseAdvancedFrame;
        v122[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, if v38 then l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20 else l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, if v38 then l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20 else l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_65 = l_Create_0("TextBox")({
            Name = "CameraSensitivityTextBox", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(0.8, 0.8, 0.8), 
            BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
            Font = v71.font(Enum.Font.SourceSans), 
            TextSize = v71.textSize(18), 
            Size = UDim2.new(0, 60, 0.8, 0), 
            Position = UDim2.new(1, v38 and 10 or -2, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 3, 
            Selectable = false, 
            Parent = l_NewPage_0.MouseAdvancedEntry.SliderFrame, 
            BorderSizePixel = v71.UIBloxThemeEnabled and 0 or 1
        });
        if v71.UIBloxThemeEnabled then
            l_Create_0("UICorner")({
                CornerRadius = v71.DefaultCornerRadius, 
                Parent = l_l_NewPage_0_65
            });
        end;
        l_l_NewPage_0_66 = function(v653) --[[ Line: 2650 ]] --[[ Name: setMouseSensitivityText ]]
            -- upvalues: l_l_NewPage_0_65 (copy)
            v653 = math.floor(v653 * 1000 + 0.5) / 1000;
            l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", v653)))));
        end;
        l_l_NewPage_0_67 = math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000;
        l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", l_l_NewPage_0_67)))));
        l_l_NewPage_0_67 = l_NewPage_0.MouseAdvancedEntry;
        v652 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        local v654 = v652 <= 1 and math.floor((v652 - 0.2) / 0.16 + 0.5) or math.floor((v652 + 2) / 0.6 + 0.5);
        l_l_NewPage_0_67:SetValue(v652 <= 0.2 and 0 or v654);
        clampMouseSensitivity = function(v655) --[[ Line: 2665 ]] --[[ Name: clampMouseSensitivity ]]
            if v655 < 0 then
                v655 = -v655;
            end;
            if v655 > 100 then
                return 100;
            else
                if v655 < 0.001 then
                    v655 = 0.001;
                end;
                return v655;
            end;
        end;
        setMouseSensitivity = function(v656, v657) --[[ Line: 2683 ]] --[[ Name: setMouseSensitivity ]]
            -- upvalues: l_MouseSensitivity_0 (ref), v637 (ref), l_NewPage_0 (ref), l_l_NewPage_0_65 (copy)
            if not l_MouseSensitivity_0 then
                return;
            else
                v637(v656);
                l_MouseSensitivity_0 = false;
                if v657 ~= l_NewPage_0.MouseAdvancedEntry then
                    local l_MouseAdvancedEntry_0 = l_NewPage_0.MouseAdvancedEntry;
                    local v659 = v656 <= 1 and math.floor((v656 - 0.2) / 0.16 + 0.5) or math.floor((v656 + 2) / 0.6 + 0.5);
                    l_MouseAdvancedEntry_0:SetValue(v656 <= 0.2 and 0 or v659);
                end;
                local v660 = math.floor(v656 * 1000 + 0.5) / 1000;
                l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", v660)))));
                l_MouseSensitivity_0 = true;
                return;
            end;
        end;
        l_l_NewPage_0_65.FocusLost:connect(function() --[[ Line: 2701 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_65 (copy), l_GameSettings_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v661 = tonumber((string.match(l_l_NewPage_0_65.Text, "([%d%.]+)")));
            if v661 then
                setMouseSensitivity(clampMouseSensitivity(v661), l_l_NewPage_0_65);
                return;
            else
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_65);
                return;
            end;
        end);
        l_l_NewPage_0_65.Focused:connect(function() --[[ Line: 2713 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v662) --[[ Line: 2717 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v663 = clampMouseSensitivity(v662);
            local v664 = v663 <= 5 and 0.16 * v663 + 0.2 or 0.6 * v663 - 2;
            v662 = v664 <= 0.2 and 0.2 or v664;
            setMouseSensitivity(v662, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v682() --[[ Line: 2724 ]] --[[ Name: createGamepadOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), v637 (copy)
        local function __(v666) --[[ Line: 2729 ]] --[[ Name: translateEngineGamepadSensitivityToGui ]]
            local v667 = v666 <= 1 and math.floor((v666 - 0.2) / 0.16 + 0.5) or math.floor((v666 + 2) / 0.6 + 0.5);
            if v666 <= 0.2 then
                return 0;
            else
                return v667;
            end;
        end;
        local function __(v669) --[[ Line: 2736 ]] --[[ Name: translateGuiGamepadSensitivityToEngine ]]
            local v670 = v669 <= 5 and 0.16 * v669 + 0.2 or 0.6 * v669 - 2;
            if v670 <= 0.2 then
                return 0.2;
            else
                return v670;
            end;
        end;
        local l_GamepadCameraSensitivity_1 = l_GameSettings_0.GamepadCameraSensitivity;
        local v673 = l_GamepadCameraSensitivity_1 <= 1 and math.floor((l_GamepadCameraSensitivity_1 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_1 + 2) / 0.6 + 0.5);
        local v674 = l_GamepadCameraSensitivity_1 <= 0.2 and 0 or v673;
        l_GamepadCameraSensitivity_1 = l_NewPage_0;
        v673 = l_NewPage_0;
        local l_l_NewPage_0_68 = l_NewPage_0;
        local v676, v677, v678 = v66:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v674);
        l_GamepadCameraSensitivity_1.GamepadSensitivityFrame = v676;
        v673.GamepadSensitivityLabel = v677;
        l_l_NewPage_0_68.GamepadSensitivitySlider = v678;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = v54.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v679) --[[ Line: 2751 ]]
            -- upvalues: v637 (ref)
            local l_v637_0 = v637;
            local v681 = v679 <= 5 and 0.16 * v679 + 0.2 or 0.6 * v679 - 2;
            l_v637_0(v681 <= 0.2 and 0.2 or v681);
        end);
    end;
    local function v694() --[[ Line: 2756 ]] --[[ Name: createOverscanOption ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref), v66 (ref), l_NewPage_0 (copy), v71 (ref), l_RunService_0 (ref), v54 (ref)
        local function v689() --[[ Line: 2757 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref)
            local v683 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v684 = nil;
            v684 = require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan);
            v684 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)(v684);
            local v685 = require(l_CorePackages_0.Packages.Roact);
            local v686 = nil;
            local v687 = {
                onUnmount = function() --[[ Line: 2768 ]]
                    -- upvalues: v686 (ref), v685 (copy), l_ContextActionService_0 (ref), v683 (copy)
                    if v686 then
                        v685.unmount(v686);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v683:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v683:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function() --[[ Line: 2784 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local v688 = nil;
            v688 = v685.createElement(v684, v687);
            v686 = v685.mount(v688, l_RobloxGui_0, (tostring(v684)));
        end;
        local v690, v691, v692 = v66:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v689, l_NewPage_0);
        v691.Font = v71.font(Enum.Font.SourceSans);
        v690.Position = UDim2.new(1, -400, 0, 12);
        v690.Size = UDim2.new(0, 300, 0, 40);
        v690.Position = UDim2.new(1, -400, 0.5, 0);
        v690.AnchorPoint = Vector2.new(0, 0.5);
        if l_RunService_0:IsStudio() then
            v690.Selectable = false;
            v690.Active = false;
            v690.Enabled.Value = false;
            v691.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v693 = v66:AddNewRowObject(l_NewPage_0, "Safe Zone", v690);
        v693.LayoutOrder = v54.OverscanAdjustButton;
        v692(v693);
    end;
    local function v707() --[[ Line: 2823 ]] --[[ Name: createDeveloperConsoleOption ]]
        -- upvalues: v34 (ref), v114 (ref), v104 (ref), v66 (ref), l_NewPage_0 (copy), v71 (ref), v54 (ref), l_RunService_0 (ref), v69 (ref), l_Players_0 (ref)
        local function v706() --[[ Line: 2825 ]] --[[ Name: makeDevConsoleOption ]]
            -- upvalues: v34 (ref), v114 (ref), v104 (ref), v66 (ref), l_NewPage_0 (ref), v71 (ref), v54 (ref)
            local function v697() --[[ Line: 2826 ]] --[[ Name: onOpenDevConsole ]]
                -- upvalues: v34 (ref), v114 (ref)
                local v695 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v695 then
                    v695:SetVisibility(true);
                    local v696 = require(script.Parent.Parent.SettingsHub);
                    if v696 then
                        v696:SetVisibility(false);
                    end;
                    if v34 then
                        v114("dev_console", "", "pressed");
                    end;
                end;
            end;
            if v104 then
                local v698, v699, v700 = v66:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v697, l_NewPage_0);
                v699.Font = v71.font(Enum.Font.SourceSans);
                v698.Size = UDim2.new(0.6, -10, 0, 35);
                v698.Position = UDim2.new(0.4, 10, 0.5, 0);
                v698.AnchorPoint = Vector2.new(0, 0.5);
                local v701 = v66:AddNewRowObject(l_NewPage_0, "Developer Console", v698, nil, true);
                v701.LayoutOrder = v54.DeveloperConsoleButton;
                v700(v701);
                return;
            else
                local v702, v703, v704 = v66:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v697, l_NewPage_0);
                v703.Font = v71.font(Enum.Font.SourceSans);
                v702.Size = UDim2.new(0.6, -10, 0, 35);
                v702.Position = UDim2.new(1, -400, 0.5, 0);
                v702.AnchorPoint = Vector2.new(0, 0.5);
                local v705 = v66:AddNewRowObject(l_NewPage_0, "Developer Console", v702);
                v705.LayoutOrder = v54.DeveloperConsoleButton;
                v704(v705);
                return;
            end;
        end;
        if l_RunService_0:IsStudio() then
            v706();
            return;
        else
            spawn(function() --[[ Line: 2880 ]]
                -- upvalues: v69 (ref), l_Players_0 (ref), v706 (copy)
                if v69.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v706();
                end;
            end);
            return;
        end;
    end;
    local function v736() --[[ Line: 2889 ]] --[[ Name: createUiToggleOptions ]]
        -- upvalues: v103 (ref), l_RobloxTranslator_0 (ref), l_NewPage_0 (copy), v66 (ref), v54 (ref), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v103 then
            local v708 = {
                {
                    label = "Custom", 
                    type = Enum.GuiType.Custom, 
                    layoutOrderKey = "UiToggleRowCustom"
                }, 
                {
                    label = "CustomBillboards", 
                    type = Enum.GuiType.CustomBillboards, 
                    layoutOrderKey = "UiToggleRowBillboards"
                }, 
                {
                    label = "PlayerNameplates", 
                    type = Enum.GuiType.PlayerNameplates, 
                    layoutOrderKey = "UiToggleRowNameplates"
                }
            };
            local v709 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
            local v710 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v712 in v708 do
                local v713 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v712.label
                });
                local v714, v715, v716 = v66:AddNewRow(l_NewPage_0, v713, "Selector", {
                    v709, 
                    v710
                }, 1);
                v714.LayoutOrder = v54[v712.layoutOrderKey];
                v716.IndexChanged:Connect(function(v717) --[[ Line: 2917 ]]
                    -- upvalues: l_GuiService_0 (ref), v712 (copy)
                    if (l_GuiService_0:GetGuiIsVisible(v712.type) and 1 or 2) ~= v717 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v712.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v712.label] = {
                    label = v713, 
                    type = v712.type, 
                    row = v714, 
                    frame = v715, 
                    selector = v716
                };
            end;
            local v718 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_69 = l_NewPage_0;
            local l_l_NewPage_0_70 = l_NewPage_0;
            local l_l_NewPage_0_71 = l_NewPage_0;
            local v722, v723, v724 = v66:AddNewRow(l_NewPage_0, v718, "Selector", {
                v710, 
                v709
            }, 1);
            l_l_NewPage_0_69.freecamRow = v722;
            l_l_NewPage_0_70.freecamFrame = v723;
            l_l_NewPage_0_71.freecamSelector = v724;
            l_NewPage_0.freecamRow.LayoutOrder = v54.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v725) --[[ Line: 2939 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v726 = v725 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if not l_l_LocalPlayer_0_FirstChild_0 then
                    warn("Freecam not present");
                    return;
                else
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v726);
                    return;
                end;
            end);
            return;
        else
            local v728 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_72 = l_NewPage_0;
            local l_l_NewPage_0_73 = l_NewPage_0;
            local l_l_NewPage_0_74 = l_NewPage_0;
            local v732, v733, v734 = v66:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v728, 1);
            l_l_NewPage_0_72.uiToggleRow = v732;
            l_l_NewPage_0_73.uiToggleFrame = v733;
            l_l_NewPage_0_74.uiToggleSelector = v734;
            l_NewPage_0.uiToggleRow.LayoutOrder = v54.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__) --[[ Line: 2958 ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return;
        end;
    end;
    local function v743() --[[ Line: 2964 ]] --[[ Name: updateUiToggleSelection ]]
        -- upvalues: v103 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v103 then
            if not l_NewPage_0.uiToggleSelectors then
                return;
            else
                for __, v738 in l_NewPage_0.uiToggleSelectors do
                    local v739 = l_GuiService_0:GetGuiIsVisible(v738.type) and 1 or 2;
                    if v739 ~= v738.selector:GetSelectedIndex() then
                        v738.selector:SetSelectionIndex(v739);
                    end;
                end;
                local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_1 then
                    local v741 = l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 2 or 1;
                    l_NewPage_0.freecamSelector:SetSelectionIndex(v741);
                    return;
                end;
            end;
        elseif not l_NewPage_0.uiToggleSelector then
            return;
        else
            local v742 = nil;
            v742 = l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2;
            if v742 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                return;
            else
                l_NewPage_0.uiToggleSelector:SetSelectionIndex(v742);
            end;
        end;
    end;
    local function __(v744, v745, v746) --[[ Line: 3006 ]] --[[ Name: isValidDeviceList ]]
        return v744 and v745 and v746 and #v744 > 0 and v746 > 0 and v746 <= #v744 and #v744 == #v745;
    end;
    local function v756(v748) --[[ Line: 3016 ]] --[[ Name: setVCSOutput ]]
        -- upvalues: v17 (ref), v97 (ref), v87 (ref)
        local v749, v750, v751, v752 = pcall(function() --[[ Line: 3017 ]]
            -- upvalues: v17 (ref)
            return v17:GetSpeakerDevices();
        end);
        if v749 and v750 and v751 and v752 and #v750 > 0 and v752 > 0 and v752 <= #v750 and #v750 == #v751 then
            local v753 = 0;
            for v754, v755 in ipairs(v750) do
                if v755 == v748 then
                    v753 = v754;
                end;
            end;
            if v753 > 0 then
                if v97() then
                    v87:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v750[v753], v751[v753]);
                end;
                v17:SetSpeakerDevice(v750[v753], v751[v753]);
                return;
            elseif v97() then
                v87:warning("Could not find equivalent VoiceChatService Device");
                return;
            end;
        elseif v97() then
            v87:warning("Could not connect to Voice Chat Service to change Output Device");
        end;
    end;
    local function v761() --[[ Line: 3052 ]] --[[ Name: syncSoundOutputs ]]
        -- upvalues: l_SoundService_0 (ref), v756 (copy), v97 (ref), v87 (ref)
        local v757, v758, v759, v760 = pcall(function() --[[ Line: 3053 ]]
            -- upvalues: l_SoundService_0 (ref)
            return l_SoundService_0:GetOutputDevices();
        end);
        if v757 and v758 and v759 and v760 and #v758 > 0 and v760 > 0 and v760 <= #v758 and #v758 == #v759 then
            v756(v758[v760]);
            return;
        else
            if v97() then
                v87:warning("Could not connect to Voice Chat Service to change Output Device");
            end;
            return;
        end;
    end;
    local function __(v762, v763) --[[ Line: 3068 ]] --[[ Name: SwitchOutputDevice ]]
        -- upvalues: l_SoundService_0 (ref), v87 (ref)
        l_SoundService_0:SetOutputDevice(v762, v763);
        v87:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v762, v763);
    end;
    local function v781(v765) --[[ Line: 3073 ]] --[[ Name: createDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v51 (ref), l_RobloxTranslator_0 (ref), v66 (ref), v54 (ref), v34 (ref), v96 (ref), l_default_2 (ref), l_SoundService_0 (ref), v87 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v114 (ref)
        local v766 = l_NewPage_0[v765 .. "DeviceIndex"] or 0;
        local v767 = l_NewPage_0[v765 .. "DeviceNames"] or {};
        local v768 = l_NewPage_0[v765 .. "DeviceGuids"] or {};
        local v769 = v765 == v51.Input and l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_75 = l_NewPage_0;
        local v771 = v765 .. "DeviceFrame";
        local l_l_NewPage_0_76 = l_NewPage_0;
        local v773 = v765 .. "DeviceSelector";
        local v774, v775, v776 = v66:AddNewRow(l_NewPage_0, v769, "Selector", v767, v766);
        l_l_NewPage_0_75[v771] = v774;
        _ = v775;
        l_l_NewPage_0_76[v773] = v776;
        l_NewPage_0[v765 .. "DeviceFrame"].LayoutOrder = v765 == v51.Input and v54.DeviceFrameInput or v54.DeviceFrameOutput;
        l_NewPage_0[v765 .. "DeviceInfo"] = {
            Name = v766 > 0 and v767[v766] or nil, 
            Guid = v766 > 0 and v768[v766] or nil
        };
        if v34 then
            l_NewPage_0[v765 .. "PrevDeviceName"] = l_NewPage_0[v765 .. "DeviceInfo"].Name;
        end;
        l_l_NewPage_0_75 = 0;
        v771 = v96();
        l_NewPage_0[v765 .. "DeviceSelector"].IndexChanged:connect(function(v777) --[[ Line: 3098 ]]
            -- upvalues: l_NewPage_0 (ref), v765 (copy), l_l_NewPage_0_75 (ref), v771 (copy), l_default_2 (ref), l_SoundService_0 (ref), v87 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v51 (ref), l_default_3 (ref), v34 (ref), v114 (ref)
            if l_NewPage_0[v765 .. "DeviceInfo"].Name == l_NewPage_0[v765 .. "DeviceNames"][v777] and l_NewPage_0[v765 .. "DeviceInfo"].Guid == l_NewPage_0[v765 .. "DeviceGuids"][v777] then
                return;
            else
                local v778 = l_l_NewPage_0_75 + 1;
                l_l_NewPage_0_75 = v778;
                wait(v771);
                if v778 == l_l_NewPage_0_75 then
                    l_l_NewPage_0_75 = 0;
                    l_NewPage_0[v765 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v765 .. "DeviceNames"][v777], 
                        Guid = l_NewPage_0[v765 .. "DeviceGuids"][v777]
                    };
                    local l_Name_4 = l_NewPage_0[v765 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v765 .. "DeviceInfo"].Guid;
                    if l_NewPage_0.VoiceChatOptionsEnabled then
                        l_default_2:SwitchDevice(v765, l_Name_4, l_Guid_0);
                    else
                        l_SoundService_0:SetOutputDevice(l_Name_4, l_Guid_0);
                        v87:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_4, l_Guid_0);
                    end;
                    if l_GetFFlagEnableCrossExpVoice_0() then
                        v87:debug("[GameSettings] Changing {} device to {} {} ", v765, l_Name_4, l_Guid_0);
                        if v765 == v51.Input then
                            l_default_3:changeInputDevice(l_Name_4, l_Guid_0);
                        else
                            l_default_3:changeOutputDevice(l_Name_4, l_Guid_0);
                        end;
                    end;
                    if v34 then
                        v114(v765, l_NewPage_0[v765 .. "PrevDeviceName"], l_Name_4);
                        l_NewPage_0[v765 .. "PrevDeviceName"] = l_Name_4;
                    end;
                end;
                return;
            end;
        end);
    end;
    local function v793() --[[ Line: 3145 ]] --[[ Name: createCameraDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v86 (ref), v66 (ref), v54 (ref), v34 (ref), v87 (ref), l_UserGameSettings_0 (ref), v114 (ref)
        local v782 = l_NewPage_0.CameraDeviceIndex or 1;
        local v783 = l_NewPage_0.CameraDeviceNames or {};
        local v784 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v86_0 = v86;
        local l_l_NewPage_0_77 = l_NewPage_0;
        local l_l_NewPage_0_78 = l_NewPage_0;
        local v788, v789, v790 = v66:AddNewRow(l_NewPage_0, l_v86_0, "Selector", v783, v782);
        l_l_NewPage_0_77.CameraDeviceFrame = v788;
        _ = v789;
        l_l_NewPage_0_78.CameraDeviceSelector = v790;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = v54.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v782 > 0 and v783[v782] or nil, 
            Guid = v782 > 0 and v784[v782] or nil
        };
        if v34 then
            l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
        end;
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v791) --[[ Line: 3164 ]]
            -- upvalues: l_NewPage_0 (ref), v87 (ref), l_UserGameSettings_0 (ref), v34 (ref), v114 (ref)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v791] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v791] then
                return;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v791], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v791]
                };
                local l_Guid_1 = l_NewPage_0.CameraDeviceInfo.Guid;
                v87:info("Changed webcam to: {}", l_Guid_1);
                l_UserGameSettings_0.DefaultCameraID = l_Guid_1;
                if v34 then
                    v114("video_camera", l_NewPage_0.prevCameraDeviceName or "None", l_NewPage_0.CameraDeviceInfo.Name);
                    l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
                end;
                return;
            end;
        end);
    end;
    local function v799(v794) --[[ Line: 3191 ]] --[[ Name: updateAudioDevices ]]
        -- upvalues: v51 (ref), l_SoundService_0 (ref), l_NewPage_0 (copy), v97 (ref), v87 (ref), v781 (copy)
        local v795, v796, v797, v798 = pcall(function() --[[ Line: 3192 ]]
            -- upvalues: v794 (copy), v51 (ref), l_SoundService_0 (ref)
            if v794 == v51.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if v795 and v796 and v797 and v798 and #v796 > 0 and v798 > 0 and v798 <= #v796 and #v796 == #v797 then
            l_NewPage_0[v794 .. "DeviceNames"] = v796;
            l_NewPage_0[v794 .. "VCSDeviceNames"] = v796;
            l_NewPage_0[v794 .. "VCSDeviceGuids"] = v797;
            l_NewPage_0[v794 .. "DeviceGuids"] = v797;
            l_NewPage_0[v794 .. "DeviceIndex"] = v798;
        else
            if v97() then
                v87:warning("Errors in get {} device info", v794);
            end;
            l_NewPage_0[v794 .. "DeviceNames"] = {};
            l_NewPage_0[v794 .. "DeviceGuids"] = {};
            l_NewPage_0[v794 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v794 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v794 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v794 .. "DeviceSelector"] then
            v781(v794);
            return;
        else
            l_NewPage_0[v794 .. "DeviceSelector"]:UpdateOptions(v796);
            l_NewPage_0[v794 .. "DeviceSelector"]:SetSelectionIndex(v798);
            return;
        end;
    end;
    local function v809(v800) --[[ Line: 3224 ]] --[[ Name: updateVoiceChatDevices ]]
        -- upvalues: v51 (ref), v97 (ref), v87 (ref), l_SoundService_0 (ref), v17 (ref), l_NewPage_0 (copy), v781 (copy)
        if v800 ~= v51.Input and v800 ~= v51.Output and v97() then
            v87:warning("{} is not supported in VoiceChat devices", v800);
        end;
        local v801, v802, v803, v804 = pcall(function() --[[ Line: 3231 ]]
            -- upvalues: v800 (copy), v51 (ref), l_SoundService_0 (ref)
            if v800 == v51.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        local v805, v806, v807, v808 = pcall(function() --[[ Line: 3239 ]]
            -- upvalues: v17 (ref)
            return v17:GetSpeakerDevices();
        end);
        if v801 and v805 and v802 and v803 and v804 and #v802 > 0 and v804 > 0 and v804 <= #v802 and #v802 == #v803 and v806 and v807 and v808 and #v806 > 0 and v808 > 0 and v808 <= #v806 and #v806 == #v807 then
            l_NewPage_0[v800 .. "DeviceNames"] = v802;
            l_NewPage_0[v800 .. "VCSDeviceNames"] = v806;
            l_NewPage_0[v800 .. "VCSDeviceGuids"] = v807;
            l_NewPage_0[v800 .. "DeviceGuids"] = v803;
            l_NewPage_0[v800 .. "DeviceIndex"] = v804;
        else
            if v97() then
                if #v802 > 0 then
                    v87:warning("Errors in get {} device info success: {} VCSSuccess: {}", v800, v801, v805);
                else
                    v87:warning("Empty deviceNames list for {}", v800);
                end;
            end;
            l_NewPage_0[v800 .. "DeviceNames"] = {};
            l_NewPage_0[v800 .. "DeviceGuids"] = {};
            l_NewPage_0[v800 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v800 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v800 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v800 .. "DeviceSelector"] then
            v781(v800);
        else
            l_NewPage_0[v800 .. "DeviceSelector"]:UpdateOptions(v802);
            l_NewPage_0[v800 .. "DeviceSelector"]:SetSelectionIndex(v804);
        end;
        if l_NewPage_0[v800 .. "DeviceFrame"] then
            if #v802 > 0 then
                l_NewPage_0[v800 .. "DeviceFrame"].Visible = true;
                return;
            else
                l_NewPage_0[v800 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v816() --[[ Line: 3290 ]] --[[ Name: updateCameraDevices ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v85 (ref), l_UserGameSettings_0 (ref), l_NewPage_0 (copy), v793 (copy)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v811 = {};
        local v812 = {};
        local v813 = 1;
        table.insert(v811, v85);
        table.insert(v812, "{DefaultDeviceGuid}");
        for v814, v815 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v814 == l_UserGameSettings_0.DefaultCameraID then
                v813 = #v811 + 1;
            end;
            table.insert(v811, v815);
            table.insert(v812, v814);
        end;
        l_NewPage_0.CameraDeviceNames = v811;
        l_NewPage_0.CameraDeviceGuids = v812;
        l_NewPage_0.CameraDeviceIndex = 0;
        if not l_NewPage_0.CameraDeviceSelector then
            v793();
        else
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v811);
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v813);
    end;
    local v817 = nil;
    local v818 = nil;
    local function v819() --[[ Line: 3320 ]] --[[ Name: updateAudioOptions ]]
        -- upvalues: l_NewPage_0 (copy), v809 (copy), v51 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v799 (copy)
        if l_NewPage_0.VoiceChatOptionsEnabled then
            v809(v51.Input);
            v809(v51.Output);
            return;
        else
            if l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected() then
                v799(v51.Input);
            end;
            v799(v51.Output);
            return;
        end;
    end;
    local function __() --[[ Line: 3332 ]] --[[ Name: setupDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v817 (ref), l_NewPage_0 (copy), v819 (copy)
        if l_SoundService_0.DeviceListChanged then
            v817 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3334 ]]
                -- upvalues: l_NewPage_0 (ref), v819 (ref)
                if l_NewPage_0.PageOpen then
                    v819();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3342 ]] --[[ Name: setupVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v818 (ref), l_NewPage_0 (copy), v816 (copy)
        if l_VideoCaptureService_0.DevicesChanged then
            v818 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3344 ]]
                -- upvalues: l_NewPage_0 (ref), v816 (ref)
                if l_NewPage_0.PageOpen then
                    v816();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3352 ]] --[[ Name: teardownDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v817 (ref)
        if l_SoundService_0.DeviceListChanged and v817 then
            v817:Disconnect();
        end;
    end;
    local function __() --[[ Line: 3358 ]] --[[ Name: teardownVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v818 (ref)
        if l_VideoCaptureService_0.DevicesChanged and v818 then
            v818:Disconnect();
            v818 = nil;
        end;
    end;
    local function __() --[[ Line: 3366 ]] --[[ Name: checkVoiceChatOptions ]]
        -- upvalues: l_default_2 (ref), l_NewPage_0 (copy), v761 (copy)
        if l_default_2:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            v761();
        end;
    end;
    local function __() --[[ Line: 3373 ]] --[[ Name: updateInputDeviceVisibility ]]
        -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref)
        local v825 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
        if l_NewPage_0[v51.Input .. "DeviceFrame"] then
            l_NewPage_0[v51.Input .. "DeviceFrame"].Visible = v825;
        end;
    end;
    local function v845() --[[ Line: 3381 ]] --[[ Name: createVoiceConnectDisconnect ]]
        -- upvalues: l_default_2 (ref), v22 (ref), v40 (ref), v39 (ref), v66 (ref), v75 (ref), l_NewPage_0 (copy), v54 (ref)
        if l_default_2:IsSeamlessVoice() and not l_default_2.isShowingFTUX then
            local v827 = nil;
            local v828 = nil;
            local v829 = nil;
            local v830 = nil;
            local v831 = v22:Format("Feature.GameDetails.Label.VoiceChat");
            local v832 = v22:Format("Feature.SettingsHub.Label.Connect");
            local v833 = v22:Format("Feature.SettingsHub.Label.Disconnect");
            local v834 = v40();
            local v835 = v39() and v834 > 0;
            local function v840() --[[ Line: 3391 ]]
                -- upvalues: l_default_2 (ref)
                if l_default_2:getService() then
                    local v836 = nil;
                    do
                        local l_v836_0 = v836;
                        l_v836_0 = l_default_2:getService().StateChanged:Connect(function(__, v839) --[[ Line: 3395 ]]
                            -- upvalues: l_default_2 (ref), l_v836_0 (ref)
                            if v839 == Enum.VoiceChatState.Joined then
                                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                                l_v836_0:Disconnect();
                            end;
                        end);
                    end;
                else
                    l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(false));
                end;
                l_default_2:JoinVoice();
            end;
            local function v841() --[[ Line: 3413 ]]
                -- upvalues: l_default_2 (ref)
                l_default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                l_default_2:Leave();
            end;
            local v842, v843, v844 = v66:MakeStyledButton("VoiceConnectButton", v832, UDim2.new(1, 0, 1, -20), if v835 then v75(v834, v840) else v840, l_NewPage_0);
            voiceConnectSetRowRef = v844;
            v827 = v842;
            v828 = v843;
            v842, v843, v844 = v66:MakeStyledButton("VoiceDisconnectButton", v833, UDim2.new(1, 0, 1, -20), if v835 then v75(v834, v841) else v841, l_NewPage_0);
            voiceDisconnectSetRowRef = v844;
            v829 = v842;
            v830 = v843;
            v827.Size = UDim2.new(0.6, 0, 0, 40);
            v827.Position = UDim2.new(0.4, 0, 0.5, 0);
            v827.AnchorPoint = Vector2.new(0, 0.5);
            v827.ZIndex = 2;
            v827.Selectable = true;
            v828.ZIndex = 2;
            v829.Size = UDim2.new(0.6, 0, 0, 40);
            v829.Position = UDim2.new(0.4, 0, 0.5, 0);
            v829.AnchorPoint = Vector2.new(0, 0.5);
            v829.ZIndex = 2;
            v829.Selectable = true;
            v830.ZIndex = 2;
            v842 = v66:AddNewRowObject(l_NewPage_0, v831, v827, nil, true);
            v843 = v66:AddNewRowObject(l_NewPage_0, v831, v829, nil, true);
            l_NewPage_0.VoiceConnectFrame = v842;
            l_NewPage_0.VoiceDisconnectFrame = v843;
            v842.LayoutOrder = v54.VoiceConnectFrame;
            v843.LayoutOrder = v54.VoiceDisconnectFrame;
            voiceConnectSetRowRef(v842);
            voiceDisconnectSetRowRef(v843);
            if l_default_2:ShouldShowJoinVoice() then
                v842.Visible = true;
                v843.Visible = false;
                return;
            else
                v842.Visible = false;
                v843.Visible = true;
            end;
        end;
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    local v846 = nil;
    local v847 = nil;
    local v848 = nil;
    if game:GetEngineFeature("VoiceChatSupported") then
        spawn(function() --[[ Line: 3477 ]]
            -- upvalues: l_default_2 (ref), v17 (ref), l_NewPage_0 (copy), v761 (copy), v21 (ref), v845 (copy), v98 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref), v97 (ref), v87 (ref)
            l_default_2:asyncInit():andThen(function() --[[ Line: 3479 ]]
                -- upvalues: v17 (ref), l_default_2 (ref), l_NewPage_0 (ref), v761 (ref), v21 (ref), v845 (ref), v98 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref)
                v17 = l_default_2:getService();
                if l_default_2:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    v761();
                end;
                if v21() then
                    v845();
                end;
                if not v98() then
                    l_default_2:CheckAndShowNotAudiblePrompt();
                end;
                if v21() and l_NewPage_0.VoiceConnectFrame then
                    l_NewPage_0.VoiceConnectFrame.Visible = false;
                end;
                if v21() and l_NewPage_0.VoiceDisconnectFrame then
                    l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                end;
                if l_GetFFlagEnableShowVoiceUI_0() then
                    l_default_2.showVoiceUI.Event:Connect(function() --[[ Line: 3499 ]]
                        -- upvalues: l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref), v21 (ref)
                        l_NewPage_0.VoiceChatOptionsEnabled = true;
                        local v849 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                        if l_NewPage_0[v51.Input .. "DeviceFrame"] then
                            l_NewPage_0[v51.Input .. "DeviceFrame"].Visible = v849;
                        end;
                        if v21() and l_NewPage_0.VoiceConnectFrame then
                            l_NewPage_0.VoiceConnectFrame.Visible = false;
                        end;
                        if v21() and l_NewPage_0.VoiceDisconnectFrame then
                            l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                        end;
                    end);
                    l_default_2.hideVoiceUI.Event:Connect(function() --[[ Line: 3514 ]]
                        -- upvalues: l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref), v21 (ref)
                        l_NewPage_0.VoiceChatOptionsEnabled = false;
                        local v850 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                        if l_NewPage_0[v51.Input .. "DeviceFrame"] then
                            l_NewPage_0[v51.Input .. "DeviceFrame"].Visible = v850;
                        end;
                        if v21() and l_NewPage_0.VoiceConnectFrame then
                            l_NewPage_0.VoiceConnectFrame.Visible = true;
                        end;
                        if v21() and l_NewPage_0.VoiceDisconnectFrame then
                            l_NewPage_0.VoiceDisconnectFrame.Visible = false;
                        end;
                    end);
                end;
            end):catch(function() --[[ Line: 3531 ]]
                -- upvalues: v97 (ref), v87 (ref), v98 (ref), l_default_2 (ref)
                if v97() then
                    v87:warning("Failed to init VoiceChatServiceManager");
                end;
                if not v98() then
                    l_default_2:CheckAndShowPermissionPrompt();
                end;
            end);
        end);
    end;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v846 = l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 3544 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref)
            local v851 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v51.Input .. "DeviceFrame"] then
                l_NewPage_0[v51.Input .. "DeviceFrame"].Visible = v851;
            end;
        end);
        v847 = l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 3547 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v51 (ref)
            local v852 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v51.Input .. "DeviceFrame"] then
                l_NewPage_0[v51.Input .. "DeviceFrame"].Visible = v852;
            end;
        end);
        v848 = function() --[[ Line: 3550 ]]
            -- upvalues: v846 (ref), v847 (ref)
            if v846 then
                v846:Disconnect();
                v846 = nil;
            end;
            if v847 then
                v847:Disconnect();
                v847 = nil;
            end;
        end;
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v853 = nil;
    local function __() --[[ Line: 3564 ]]
        -- upvalues: v853 (ref)
        if v853 then
            v853:disconnect();
            v853 = nil;
        end;
    end;
    if v30 or l_GetFFlagSelfViewCameraSettings_0() then
        local function v856(v855) --[[ Line: 3572 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.VideoOptionsEnabled = v855.hasCameraPermissions;
        end;
        if v28() then
            if v25() then
                v24(v856, {
                    l_default_0.Permissions.CAMERA_ACCESS
                }, true);
                if v853 then
                    v853:disconnect();
                end;
                v853 = v27:connect(function() --[[ Line: 3589 ]]
                    -- upvalues: l_NewPage_0 (copy), v816 (copy), l_VideoCaptureService_0 (ref), v818 (ref)
                    l_NewPage_0.VideoOptionsEnabled = true;
                    v816();
                    if l_VideoCaptureService_0.DevicesChanged then
                        v818 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3344 ]]
                            -- upvalues: l_NewPage_0 (ref), v816 (ref)
                            if l_NewPage_0.PageOpen then
                                v816();
                            end;
                        end);
                    end;
                end);
            end;
        else
            v24(v856, nil, nil, "GameSettings.createDeviceOptions");
        end;
    end;
    v404(not v76 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
    local function __() --[[ Line: 3606 ]]
        -- upvalues: l_GameSettings_0 (ref), v682 (copy)
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v682();
            return;
        else
            local v857 = nil;
            v857 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 3612 ]]
                -- upvalues: l_GameSettings_0 (ref), v857 (ref), v682 (ref)
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v857 then
                        v857:disconnect();
                    end;
                    v682();
                end;
            end);
            return;
        end;
    end;
    if l_UserInputService_0.MouseEnabled then
        v665();
    elseif l_UserInputService_0.GamepadEnabled then
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v682();
        else
            local v859 = nil;
            do
                local l_v859_0 = v859;
                l_v859_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 3612 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v859_0 (ref), v682 (copy)
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v859_0 then
                            l_v859_0:disconnect();
                        end;
                        v682();
                    end;
                end);
            end;
        end;
    else
        local v861 = nil;
        do
            local l_v861_0 = v861;
            l_v861_0 = l_UserInputService_0.GamepadConnected:connect(function() --[[ Line: 3630 ]]
                -- upvalues: l_v861_0 (ref), l_GameSettings_0 (ref), v682 (copy)
                if l_v861_0 then
                    l_v861_0:disconnect();
                end;
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    v682();
                    return;
                else
                    local v863 = nil;
                    v863 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 3612 ]]
                        -- upvalues: l_GameSettings_0 (ref), v863 (ref), v682 (ref)
                        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                            if v863 then
                                v863:disconnect();
                            end;
                            v682();
                        end;
                    end);
                    return;
                end;
            end);
        end;
    end;
    if l_GameSettings_0.IsUsingCameraYInverted then
        v632();
    else
        local v864 = nil;
        do
            local l_v864_0 = v864;
            l_v864_0 = l_GameSettings_0.Changed:connect(function(v866) --[[ Line: 3643 ]]
                -- upvalues: l_GameSettings_0 (ref), l_v864_0 (ref), v632 (copy)
                if v866 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                    l_v864_0:disconnect();
                    v632();
                end;
            end);
        end;
    end;
    v604();
    if v46 then
        v614();
    end;
    if l_GetFFlagAddHapticsToggle_0() then
        v623();
    end;
    v172();
    v186();
    v200();
    if l_GetFFlagEnablePreferredTextSizeSettingInMenus_0() then
        v215();
    end;
    if l_UserInputService_0.KeyboardEnabled then
        v229();
    end;
    if not v80:IsSubjectToChinaPolicies() then
        v241();
    end;
    if v95 then
        v277();
    end;
    if v76 and l_getAppFeaturePolicies_0().getSupportsOverscan() then
        v694();
    end;
    v707();
    v70(l_RunService_0:IsStudio(), l_LocalPlayer_0, v69):andThen(function(v867) --[[ Line: 3692 ]]
        -- upvalues: v736 (copy)
        if v867 then
            v736();
        end;
    end):catch(function(v868) --[[ Line: 3697 ]]
        warn(v868);
    end);
    v121 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v870, __ in pairs(v122) do
            v870.Visible = not l_VREnabled_3;
        end;
    end;
    l_NewPage_0.TabHeader.Name = "GameSettingsTab";
    if v71.UIBloxThemeEnabled then
        local v872 = v71.Images["icons/common/settings"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v872.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v872.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v872.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    else
        l_NewPage_0.TabHeader.Icon.Image = v76 and "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab@2x.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab.png";
        if v90 then
            l_NewPage_0.TabHeader.Title.Text = "Settings";
        else
            l_NewPage_0.TabHeader.Icon.Title.Text = "Settings";
        end;
    end;
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __() --[[ Line: 3744 ]] --[[ Name: staticFeedbackEntryPointChecksPassed ]]
        -- upvalues: l_RunService_0 (ref), v105 (ref), v76 (ref)
        if l_RunService_0:IsStudio() then
            return false;
        elseif game:GetEngineFeature("CaptureModeEnabled") == false then
            return false;
        elseif v105 and v76 then
            return false;
        else
            return true;
        end;
    end;
    l_NewPage_0.OpenSettingsPage = function() --[[ Line: 3760 ]]
        -- upvalues: l_NewPage_0 (copy), v819 (copy), l_SoundService_0 (ref), v817 (ref), l_GameSettings_0 (ref), v30 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), v816 (copy), l_VideoCaptureService_0 (ref), v818 (ref), v743 (copy), v20 (ref), v71 (ref)
        l_NewPage_0.PageOpen = true;
        v819();
        if l_SoundService_0.DeviceListChanged then
            v817 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3334 ]]
                -- upvalues: l_NewPage_0 (ref), v819 (ref)
                if l_NewPage_0.PageOpen then
                    v819();
                end;
            end);
        end;
        l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
        if (v30 or l_GetFFlagSelfViewCameraSettings_0()) and l_NewPage_0.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
            v816();
            if l_VideoCaptureService_0.DevicesChanged then
                v818 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3344 ]]
                    -- upvalues: l_NewPage_0 (ref), v816 (ref)
                    if l_NewPage_0.PageOpen then
                        v816();
                    end;
                end);
            end;
        end;
        v743();
        if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and l_NewPage_0.toggleFeedbackModeButton and l_NewPage_0.toggleFeedbackModeText then
            local l_l_NewPage_0_79 = l_NewPage_0;
            local v875 = false;
            if v20 ~= nil then
                v875 = v20:CanEnterCaptureMode();
            end;
            l_l_NewPage_0_79.FeedbackEntryPointEnabled = v875;
            if l_NewPage_0.FeedbackEntryPointEnabled then
                l_NewPage_0.toggleFeedbackModeButton.Active = true;
                l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = true;
                l_NewPage_0.toggleFeedbackModeText.Text = "Give Feedback";
                return;
            else
                l_NewPage_0.toggleFeedbackModeButton.Active = false;
                l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = false;
                l_NewPage_0.toggleFeedbackModeText.TextColor3 = v71.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100));
                l_NewPage_0.toggleFeedbackModeText.Text = "Unavailable";
            end;
        end;
    end;
    l_NewPage_0.CloseSettingsPage = function() --[[ Line: 3802 ]]
        -- upvalues: l_NewPage_0 (copy), l_SoundService_0 (ref), v817 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v848 (ref), v30 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), l_VideoCaptureService_0 (ref), v818 (ref), v28 (ref), v853 (ref), l_default_2 (ref)
        l_NewPage_0.PageOpen = false;
        if l_SoundService_0.DeviceListChanged and v817 then
            v817:Disconnect();
        end;
        if l_GetFFlagEnableCrossExpVoice_0() and v848 then
            v848();
        end;
        if v30 or l_GetFFlagSelfViewCameraSettings_0() then
            if game:GetEngineFeature("VideoCaptureService") and l_VideoCaptureService_0.DevicesChanged and v818 then
                v818:Disconnect();
                v818 = nil;
            end;
            if v28() and v853 then
                v853:disconnect();
                v853 = nil;
            end;
        end;
        if game:GetEngineFeature("VoiceChatSupported") and l_NewPage_0.VoiceChatOptionsEnabled and l_NewPage_0.startVolume ~= nil and l_NewPage_0.startVolume > 0 then
            l_default_2:CheckAndShowNotAudiblePrompt();
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function() --[[ Line: 3830 ]] --[[ Name: isLangaugeSelectionDropdownEnabled ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v876 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v876) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v878) --[[ Line: 3853 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), v584 (copy), v56 (ref), v58 (ref), v59 (ref), v57 (ref), v589 (copy), l_game_EngineFeature_0 (ref), v62 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref), v61 (ref), v64 (ref), v54 (ref), v114 (ref), l_RunService_0 (ref), v105 (ref), v76 (ref), v426 (copy)
        l_NewPage_0.HubRef = v878;
        if isLangaugeSelectionDropdownEnabled() then
            v584();
        end;
        if game:GetEngineFeature("EnableTCSChatTranslation") and game:GetEngineFeature("EnableTCSChatTranslationLanguageSwitcher") and v56() then
            if v58() then
                if v59() then
                    local v879 = v57();
                    if not v589(v879).ChatTranslationEnabled then
                        if l_game_EngineFeature_0 then
                            if v62() then
                                if l_GameSettings_0.ChatTranslationLocale == "" then
                                    l_GameSettings_0.ChatTranslationEnabled = false;
                                    l_GameSettings_0.ChatTranslationLocale = "en_us";
                                end;
                            else
                                l_GameSettings_0.ChatTranslationEnabled = false;
                            end;
                        else
                            pcall(function() --[[ Line: 3883 ]]
                                -- upvalues: l_TextChatService_0 (ref)
                                l_TextChatService_0.ChatTranslationEnabled = false;
                            end);
                        end;
                    elseif v61() then
                        l_GameSettings_0.ChatTranslationEnabled = true;
                    end;
                end;
                v64(l_NewPage_0, v54, v114);
            else
                local v880 = v57();
                local v881 = v589(v880);
                local v882;
                if l_game_EngineFeature_0 then
                    l_GameSettings_0.ChatTranslationEnabled = v881.ChatTranslationEnabled;
                    l_GameSettings_0.ChatTranslationToggleEnabled = v881.ChatTranslationToggleEnabled;
                    v882 = true;
                else
                    local l_status_17, __ = pcall(function() --[[ Line: 2415 ]]
                        -- upvalues: l_TextChatService_0 (ref), v881 (copy)
                        l_TextChatService_0.ChatTranslationEnabled = v881.ChatTranslationEnabled;
                        l_TextChatService_0.ChatTranslationToggleEnabled = v881.ChatTranslationToggleEnabled;
                    end);
                    v882 = l_status_17;
                end;
                if v882 and v881.ChatTranslationEnabled then
                    v64(l_NewPage_0, v54, v114);
                end;
            end;
        end;
        if not l_RunService_0:IsStudio() and not (game:GetEngineFeature("CaptureModeEnabled") == false) and (not v105 or not v76 or false) then
            v426();
        end;
    end;
    return l_NewPage_0;
end)());