local l_CorePackages_0 = game:GetService("CorePackages");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptErrorReporter", l_RobloxGui_0);
local v9 = require(l_CorePackages_0.Packages.Roact);
local l_PolicyService_0 = require(l_Modules_0:WaitForChild("Common"):WaitForChild("PolicyService"));
local v11 = require(l_RobloxGui_0.Modules.Flags.FFlagUseRoactGlobalConfigInCoreScripts);
local v12 = game:DefineFastFlag("DebugAvatarChatVisualization", false);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi);
local v14 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceDefaultChannel);
local v15 = require(l_Modules_0.IsExperienceMenuABTestEnabled);
local v16 = require(l_Modules_0.ExperienceMenuABTestManager);
local v17 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local v18 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
local v19 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local l_GetFFlagReportAnythingAnnotationIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP;
local l_TrustAndSafetyIXPManager_0 = require(l_CorePackages_0.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager;
local v22 = require(l_Modules_0.Experiment.GetCoreScriptsLayers);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRtMessaging);
local v24 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagContactListClientEnabled);
local v25 = game:DefineFastFlag("AddPublishAssetPrompt6", false);
local l_isCharacterNameHandlerEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled;
local l_GetFFlagIrisAlwaysOnTopEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisAlwaysOnTopEnabled;
local l_GetFFlagEnableSocialContextToast_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSocialContextToast;
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_GetFFlagChromeCentralizedConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local v33 = game:DefineFastFlag("LuaAppEnableToastNotificationsCoreScripts4", false);
local v34 = game:DefineFastFlag("AdPortalTeleportPromptLua", false);
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceUserAgency3);
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v37 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
game:DefineFastFlag("MoodsEmoteFix3", false);
local v38 = game:DefineFastFlag("EnableSendCameraAccessAnalytics", false);
local v39 = game:DefineFastFlag("EnableExperienceNotificationPrompts2", false);
local v40 = game:DefineFastFlag("EnablePremiumSponsoredExperienceReporting", false);
local v41 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagMoveUGCValidationFunctionFeature);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableCancelSubscriptionApp");
local v43 = game:DefineFastFlag("EnableCancelSubscriptionAppLua", false);
local l_game_EngineFeature_1 = game:GetEngineFeature("AudioFocusManagement");
local v45 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableExperienceMenuSessionTracking);
local v46 = game:DefineFastFlag("CoreGuiEnableAnalytics", false);
local v47 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false);
local l_game_EngineFeature_2 = game:GetEngineFeature("EnableRobloxCommerce");
local v49 = require(l_CorePackages_0.Packages.UIBlox);
local l_UIBloxInGameConfig_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig;
v49.init(l_UIBloxInGameConfig_0);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
if game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/DefaultListenerLocation", script.Parent);
end;
if l_GetFFlagEnableAppChatInExperience_0() then
    require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize();
    local l_InExperienceAppChatExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatExperimentation;
    l_InExperienceAppChatExperimentation_0.default:initialize();
    if l_InExperienceAppChatExperimentation_0.getHasInExperienceAppChatEntryPoint() then
        l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AppChatMain", l_RobloxGui_0);
    end;
end;
if l_GetFFlagEnableCrossExpVoice_0() then
    require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize();
    require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize();
end;
if v45 then
    local _ = require(l_CorePackages_0.Workspace.Packages.InExperienceSessionization);
end;
local v54 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
if require(l_RobloxGui_0.Modules.Chrome.Enabled)() then
    local v55 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
    v55.GlobalFlags.AvatarChatEnabled = v54;
    v55.GlobalFlags.ChromeEnabled = true;
elseif v54 then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.AvatarChatEnabled = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.DoNotPromptCameraPermissionsOnMount = true;
end;
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.JoinWithoutMicPermissions = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.EnableAlwaysAvailableCamera = true;
end;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.ConsolidateBubbleChat = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.RenderVoiceBubbleAfterAsyncInit = true;
end;
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.ShowLikelySpeakingBubbles = true;
end;
local v56 = game:DefineFastFlag("InExperienceInterventionApp", false);
if v11 and l_RunService_0:IsStudio() then
    v9.setGlobalConfig({
        propValidation = true, 
        elementTracing = true
    });
end;
local l_UIBlox_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox;
if l_UIBlox_0 ~= v49 then
    l_UIBlox_0.init(l_UIBloxInGameConfig_0);
end;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "Sounds";
l_Folder_0.Parent = l_RobloxGui_0;
local function v62(v59) --[[ Line: 205 ]] --[[ Name: safeRequire ]]
    local l_status_0, l_result_0 = pcall(require, v59);
    if l_status_0 then
        return l_result_0;
    else
        warn("Failure to Start CoreScript module " .. v59.Name .. ".\n" .. l_result_0);
        return;
    end;
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NotificationScript2", l_RobloxGui_0);
if l_GetFFlagChromeCentralizedConfiguration_0() then
    coroutine.wrap(v62)(l_Modules_0.Chrome.ConfigureChrome);
end;
coroutine.wrap(v62)(l_Modules_0.SelfieView);
coroutine.wrap(v62)(l_Modules_0.TopBar);
if game:GetEngineFeature("LuobuModerationStatus") then
    coroutine.wrap(function() --[[ Line: 229 ]]
        -- upvalues: l_Modules_0 (copy)
        local l_Watermark_0 = l_Modules_0.Watermark;
        local l_status_1, l_result_1 = pcall(require, l_Watermark_0);
        if l_status_1 then
            return;
        else
            warn("Failure to Start CoreScript module " .. l_Watermark_0.Name .. ".\n" .. l_result_1);
            return;
        end;
    end)();
end;
if v56 then
    coroutine.wrap(v62)(l_CorePackages_0.Workspace.Packages.InExperienceIntervention);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MainBotChatScript2", l_RobloxGui_0);
if game:GetEngineFeature("ProximityPrompts") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ProximityPrompt", l_RobloxGui_0);
end;
if v41 and game:GetEngineFeature("ValidateUGCBodyAPIFeature") then
    require(l_Modules_0.Server.UGCValidation.UGCValidationFunctionInstaller)();
end;
coroutine.wrap(function() --[[ Line: 250 ]]
    -- upvalues: l_ScriptContext_0 (copy), l_RobloxGui_0 (copy)
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenTimeInGame", l_RobloxGui_0);
end)();
coroutine.wrap(function() --[[ Line: 254 ]]
    -- upvalues: l_PolicyService_0 (copy), l_Modules_0 (copy)
    if l_PolicyService_0:IsSubjectToChinaPolicies() then
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local l_LuobuWarningToast_0 = l_Modules_0.LuobuWarningToast;
        local l_status_2, l_result_2 = pcall(require, l_LuobuWarningToast_0);
        if l_status_2 then
            return;
        else
            warn("Failure to Start CoreScript module " .. l_LuobuWarningToast_0.Name .. ".\n" .. l_result_2);
        end;
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PerformanceStatsManagerScript", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerRagdoll", l_RobloxGui_0);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.ChatSelector);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v69 = nil;
local l_status_3, l_result_3 = pcall(function() --[[ Line: 275 ]]
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
v69 = l_status_3 and l_result_3;
if game:GetEngineFeature("EnableBubbleChatFromChatService") or v69 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerBillboards", l_RobloxGui_0);
end;
if l_GetFFlagIrisAlwaysOnTopEnabled_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/IrisUpdateBubbleChat", l_RobloxGui_0);
end;
coroutine.wrap(function() --[[ Line: 290 ]]
    -- upvalues: l_Modules_0 (copy)
    local l_PurchasePrompt_0 = l_Modules_0.PurchasePrompt;
    local l_status_4, l_result_4 = pcall(require, l_PurchasePrompt_0);
    local v75;
    if l_status_4 then
        v75 = l_result_4;
    else
        warn("Failure to Start CoreScript module " .. l_PurchasePrompt_0.Name .. ".\n" .. l_result_4);
        v75 = nil;
    end;
    if v75 then
        v75.mountPurchasePrompt();
    end;
end)();
if v25 then
    coroutine.wrap(v62)(l_Modules_0.PublishAssetPrompt);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BlockPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FriendPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarContextMenu", l_RobloxGui_0);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.BackpackScript);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.KeyboardUINavigation);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.Captures.CapturesApp);
coroutine.wrap(v62)(l_Modules_0.AvatarEditorPrompts);
coroutine.wrap(v62)(l_RobloxGui_0.Modules.VirtualCursor.VirtualCursorMain);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VehicleHud", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InviteToGamePrompt", l_RobloxGui_0);
if l_UserInputService_0.TouchEnabled then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ContextActionTouch", l_RobloxGui_0);
    l_RobloxGui_0:WaitForChild("ControlFrame");
    l_RobloxGui_0.ControlFrame:WaitForChild("BottomLeftControl");
    l_RobloxGui_0.ControlFrame.BottomLeftControl.Visible = false;
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InspectAndBuy", l_RobloxGui_0);
coroutine.wrap(function() --[[ Line: 341 ]]
    -- upvalues: l_VRService_0 (copy), l_RobloxGui_0 (copy)
    if not l_VRService_0.VREnabled then
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Wait();
    end;
    local l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VRAvatarHeightScaling;
    local l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VirtualKeyboard;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.UserGui;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if l_status_5 then
        return;
    else
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
        return;
    end;
end)();
coroutine.wrap(v62)(l_RobloxGui_0.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NetworkPause", l_RobloxGui_0);
if v13() and not l_PolicyService_0:IsSubjectToChinaPolicies() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenshotHud", l_RobloxGui_0);
end;
if v37() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MicrophoneDevicePermissionsLoggingInitializer", l_RobloxGui_0);
end;
if game:GetEngineFeature("VoiceChatSupported") and v14() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceDefaultChannel", l_RobloxGui_0);
end;
coroutine.wrap(function() --[[ Line: 366 ]]
    -- upvalues: l_Modules_0 (copy), l_LocalPlayer_0 (ref), v22 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), l_GetFFlagReportAnythingAnnotationIXP_0 (copy), l_TrustAndSafetyIXPManager_0 (copy)
    require(l_Modules_0.Common.IXPServiceWrapper):InitializeAsync(l_LocalPlayer_0.UserId, v22());
    if v15() then
        v16.default:initialize();
    end;
    if v17() then
        v18.default:initialize();
    end;
    if l_GetFFlagReportAnythingAnnotationIXP_0() then
        l_TrustAndSafetyIXPManager_0.default:initialize();
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceChatMain", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ChatEmoteUsage", script.Parent);
if v33 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ToastNotificationGUI", script.Parent);
end;
if v23() then
    game:GetService("RtMessagingService");
end;
if game:GetEngineFeature("FacialAnimationStreaming2") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FacialAnimationStreaming", script.Parent);
end;
if v54 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FaceChatSelfieView", l_RobloxGui_0);
    if v12 then
        l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarChatDebugVisualization", script.Parent);
    end;
    if game:GetEngineFeature("TrackerLodControllerDebugUI") then
        l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/TrackerLodControllerDebugUI", script.Parent);
    end;
end;
if game:GetEngineFeature("NewMoodAnimationTypeApiEnabled") and game:GetFastFlag("MoodsEmoteFix3") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarMood", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PortalTeleportGUI", l_RobloxGui_0);
if game:GetEngineFeature("PortalAdPrompt") and v34 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AdTeleportPrompt", l_RobloxGui_0);
end;
coroutine.wrap(function() --[[ Line: 422 ]]
    -- upvalues: l_CorePackages_0 (copy)
    local l_AdsEudsa_0 = l_CorePackages_0.Workspace.Packages.AdsEudsa;
    local l_status_6, l_result_6 = pcall(require, l_AdsEudsa_0);
    local v82;
    if l_status_6 then
        v82 = l_result_6;
    else
        warn("Failure to Start CoreScript module " .. l_AdsEudsa_0.Name .. ".\n" .. l_result_6);
        v82 = nil;
    end;
    if v82 and v82.starterScript then
        v82.starterScript();
    end;
end)();
if v40 then
    coroutine.wrap(function() --[[ Line: 432 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_PremiumSponsoredExperienceReporting_0 = l_CorePackages_0.Workspace.Packages.PremiumSponsoredExperienceReporting;
        local l_status_7, l_result_7 = pcall(require, l_PremiumSponsoredExperienceReporting_0);
        local v86;
        if l_status_7 then
            v86 = l_result_7;
        else
            warn("Failure to Start CoreScript module " .. l_PremiumSponsoredExperienceReporting_0.Name .. ".\n" .. l_result_7);
            v86 = nil;
        end;
        if v86 and v86.starterScript then
            v86.starterScript();
        end;
    end)();
end;
if game:GetEngineFeature("EnableAdGuiInteractivityControlRefactor") then
    coroutine.wrap(function() --[[ Line: 442 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_AdGuiInteractivity_0 = l_CorePackages_0.Workspace.Packages.AdGuiInteractivity;
        local l_status_8, l_result_8 = pcall(require, l_AdGuiInteractivity_0);
        local v90;
        if l_status_8 then
            v90 = l_result_8;
        else
            warn("Failure to Start CoreScript module " .. l_AdGuiInteractivity_0.Name .. ".\n" .. l_result_8);
            v90 = nil;
        end;
        if v90 and v90.starterScript then
            v90.starterScript();
        end;
    end)();
end;
if game:GetEngineFeature("EnableVoiceAttention") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceAttention", script.Parent);
end;
if v19() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SoundTelemetry", script.Parent);
end;
coroutine.wrap(v62)(l_Modules_0.ApolloClient);
if v24() then
    coroutine.wrap(v62)(l_Modules_0.ContactList);
end;
if l_isCharacterNameHandlerEnabled_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CharacterNameHandler", script.Parent);
end;
if v35() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceUserAgency", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptsGlobalEffects", script.Parent);
require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager.init();
if l_GetFFlagEnableSocialContextToast_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SocialContextToast", l_RobloxGui_0);
end;
if v36() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/GameInviteModalGUI", script.Parent);
end;
if v39 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceNotifications", script.Parent);
end;
require(l_CorePackages_0.Workspace.Packages.Achievements).InExpAchievementManager.new():startUp();
if require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerView", l_RobloxGui_0);
end;
if v38 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SendCameraAccessAnalytics", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BulkPurchaseApp", l_RobloxGui_0);
if l_game_EngineFeature_1 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceAudioFocusBinder", l_RobloxGui_0);
end;
if l_game_EngineFeature_0 and v43 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CancelSubscriptionApp", l_RobloxGui_0);
end;
if l_game_EngineFeature_2 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CommercePurchaseApp", l_RobloxGui_0);
end;
if v46 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreGuiEnableAnalytics", l_RobloxGui_0);
end;
if not v47 then
    coroutine.wrap(function() --[[ Line: 525 ]]
        -- upvalues: l_CorePackages_0 (copy)
        require(l_CorePackages_0.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor();
    end)();
end;
local v91 = require(l_Modules_0.Common.ReactPerfTracker);
if v91 then
    local v92 = v91.new();
    task.delay(5, function() --[[ Line: 536 ]]
        -- upvalues: v92 (copy)
        v92:start();
    end);
end;