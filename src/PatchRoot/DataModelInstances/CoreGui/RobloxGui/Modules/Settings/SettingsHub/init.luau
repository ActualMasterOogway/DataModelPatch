local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Packages.Otter);
local v13 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v14 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v15 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v16 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v17 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_isSubjectToDesktopPolicies_0 = require(l_SharedFlags_0).isSubjectToDesktopPolicies;
local v20 = require(l_RobloxGui_0.Modules.Settings.Components.MenuBackButton);
local v21 = require(l_RobloxGui_0.Modules.Settings.Components.MenuFrontButton);
local v22 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v23 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CapturesPolicy_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).CapturesPolicy;
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v27 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v29 = require(script.Parent.Theme);
local v30 = v29.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902));
local v31 = v29.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2);
local l_SHIELD_INACTIVE_POSITION_0 = v29.SHIELD_INACTIVE_POSITION;
local v33 = l_Symbol_0.named("SettingsHubCursorOverride");
local v34 = v9 and 32 or v13:IsSmallTouchScreen() and 24 or 26;
local v35 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300);
local v36 = game:DefineFastInt("GetServerChannelRetries", 10);
local l_FFlag_0 = settings():GetFFlag("UseNotificationsLocalization");
local l_FFlag_1 = settings():GetFFlag("LocalizeVersionLabels");
local v39 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)();
local v40 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAbuseReportEnableReportSentPage);
local v42 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v43 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local v44 = require(l_RobloxGui_0.Modules.Flags.GetFFlagMuteButtonRaceConditionFix);
local v45 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint);
local v46 = require(l_RobloxGui_0.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions);
local v47 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics);
local v48 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v49 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
local v50 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v51 = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false);
local v52 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local l_GetFStringGameInviteMenuLayer_0 = require(l_SharedFlags_0).GetFStringGameInviteMenuLayer;
local v54 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagRightAlignMicText);
local v55 = game:DefineFastFlag("PreventHiddenSwitchPage", false);
local v56 = game:DefineFastFlag("IGMThemeResizeFix", false);
local v57 = game:DefineFastFlag("FixReducedMotionStuckIGM2", false);
local v58 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpJoinVoiceAnalytics);
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectButtonAnalytics);
local l_GetFFlagEnableShowVoiceUI_0 = require(l_SharedFlags_0).GetFFlagEnableShowVoiceUI;
local l_GetFFlagUseMicPermForEnrollment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseMicPermForEnrollment;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_SharedFlags_0).GetFFlagEnableAppChatInExperience;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local v65 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint);
local v66 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixIGMBottomBarVisibility);
local l_GetFFlagDisplayServerChannel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisplayServerChannel;
local v68 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreGuiFinalStateAnalytic);
local v69 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableExperienceMenuSessionTracking);
local v70 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagSettingsHubIndependentBackgroundVisibility();
local v71 = game:DefineFastFlag("AppChatReappearIfClosedByTiltMenu", true);
local v72 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagInExperienceMenuResetButtonTextToRespawn);
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local l_game_EngineFeature_1 = game:GetEngineFeature("TeleportHistoryButtons");
local v75 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagInExperienceMenuCanvasGroupsInvisible);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_ExperienceMenuSessionManagerInstance_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance;
local v89 = nil;
pcall(function() --[[ Line: 130 ]]
    -- upvalues: v89 (ref)
    v89 = game:GetService("PlatformService");
end);
local v90 = nil;
pcall(function() --[[ Line: 133 ]]
    -- upvalues: v90 (ref)
    v90 = game:GetService("PlatformFriendsService");
end);
local v91 = nil;
spawn(function() --[[ Line: 137 ]]
    -- upvalues: v91 (ref), l_RobloxReplicatedStorage_0 (copy)
    v91 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999);
end);
local v92 = nil;
if l_GetFFlagDisplayServerChannel_0() then
    spawn(function() --[[ Line: 143 ]]
        -- upvalues: v92 (ref), l_RobloxReplicatedStorage_0 (copy)
        v92 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerChannel", 1e999);
    end);
end;
local v93 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v97 = not string.find(l_BaseUrl_0, "www.roblox.com");
local v98 = require(l_RobloxGui_0.Modules.DevConsoleMaster);
local v99 = nil;
local v100 = false;
local v101 = false;
local v102 = nil;
local v103 = nil;
local v104 = require(l_RobloxGui_0.Modules.Settings.Components.SettingsFullScreenTitleBar);
local v105 = require(l_RobloxGui_0.Modules.Settings.Components.PermissionsButtons);
local v106 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v107 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v108 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v110 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics);
local v111 = nil;
local v112 = nil;
local v113 = nil;
local v114 = nil;
if v52() then
    v111 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v112 = v111.GameInviteModalManager;
    v113 = v111.GameInviteInviteExperimentVariant;
    v114 = v111.GameInviteConstants;
end;
local v115 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v117 = v15:IsSubjectToChinaPolicies();
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v119 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_GetFFlagPlayerListAnimateMic_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPlayerListAnimateMic;
local v121 = game:DefineFastFlag("SettingsHubRaceConditionFix", false);
local v122 = game:DefineFastFlag("FixReportButtonCutOff", false);
local l_MuteStatusIcons_0 = l_default_0.MuteStatusIcons;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v126 = {};
if v49() then
    v126 = {
        frequency = 4, 
        dampingRatio = 1
    };
end;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v128 = l_FFlag_1 or v117;
local v129 = nil;
if v128 or v49() then
    v129 = require(l_RobloxGui_0.Modules:WaitForChild("RobloxTranslator"));
end;
local function _(v130, v131) --[[ Line: 215 ]] --[[ Name: tryTranslate ]]
    -- upvalues: v129 (ref)
    if not v129 then
        return v131;
    else
        local l_status_0, l_result_0 = pcall(v129.FormatByKey, v129, v130);
        if l_status_0 then
            return l_result_0;
        else
            return v131;
        end;
    end;
end;
local v135 = require(l_RobloxGui_0.Modules.ChatSelector);
local v136 = nil;
local v137 = nil;
if not v29.UIBloxThemeEnabled and v9 then
    v136 = UDim2.new(0, 0, 0, 0);
    v137 = UDim2.new(1, 0, 1, 0);
else
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    v136 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
    v137 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
end;
local function v144(v140) --[[ Line: 240 ]] --[[ Name: GetCorePackagesLoaded ]]
    local l_CorePackages_1 = game:GetService("CorePackages");
    for _, v143 in pairs(v140) do
        if not l_CorePackages_1:FindFirstChild(v143) then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 250 ]] --[[ Name: GetServerVersionBlocking ]]
    -- upvalues: v102 (ref), v91 (ref)
    if v102 then
        return v102;
    else
        if not v91 then
            repeat
                wait();
            until v91;
        end;
        v102 = v91:InvokeServer();
        return v102;
    end;
end;
local function v147() --[[ Line: 263 ]] --[[ Name: GetServerChannelBlocking ]]
    -- upvalues: v103 (ref), v36 (copy), v92 (ref)
    if v103 then
        return v103;
    else
        local l_v36_0 = v36;
        if not v92 then
            repeat
                task.wait();
                l_v36_0 = l_v36_0 - 1;
            until v92 or l_v36_0 == 0;
        end;
        if v92 then
            v103 = v92:InvokeServer();
        else
            warn("GetServerChannelRemote not available");
            v103 = "Unknown";
        end;
        return v103;
    end;
end;
local function _() --[[ Line: 284 ]] --[[ Name: GetPlaceVersionText ]]
    -- upvalues: v45 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    if v45() then
        return game.PlaceVersion;
    else
        local l_PlaceVersion_0 = game.PlaceVersion;
        pcall(function() --[[ Line: 291 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_PlaceVersion_0 (ref)
            local l_l_HttpRbxApiService_0_Async_0 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
            local l_VersionNumber_0 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_0)[1].VersionNumber;
            l_PlaceVersion_0 = string.format("%s (Latest: %d)", l_PlaceVersion_0, l_VersionNumber_0);
        end);
        return l_PlaceVersion_0;
    end;
end;
local function v655() --[[ Line: 301 ]] --[[ Name: CreateSettingsHub ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_RobloxGui_0 (copy), v65 (copy), v13 (copy), v119 (copy), v110 (copy), l_RbxAnalyticsService_0 (copy), v49 (copy), v48 (copy), l_StarterGui_0 (copy), v106 (copy), v107 (copy), v108 (copy), v66 (copy), v29 (copy), l_ContextActionService_0 (copy), l_default_0 (copy), v43 (copy), l_PlayerMuteStatusIcons_0 (copy), l_MuteStatusIcons_0 (copy), l_GetFFlagPlayerListAnimateMic_0 (copy), v72 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), l_CorePackages_0 (copy), v50 (copy), v9 (copy), l_TouchEnabled_0 (copy), l_FFlag_0 (copy), l_UserInputService_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_Create_0 (copy), v44 (copy), l_RunService_0 (copy), v12 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v58 (copy), v27 (copy), v129 (ref), v42 (copy), v93 (copy), v121 (copy), v68 (copy), v10 (copy), v105 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v137 (ref), v136 (ref), v75 (copy), l_SHIELD_INACTIVE_POSITION_0 (copy), v31 (copy), v30 (copy), v34 (copy), l_GetFFlagDisplayServerChannel_0 (copy), v128 (copy), v147 (copy), v102 (ref), v91 (ref), v45 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v15 (copy), l_BaseUrl_0 (copy), v97 (copy), l_StarterPlayer_0 (copy), l_Players_0 (copy), l_Constants_0 (copy), v46 (copy), v70 (copy), l_GuiService_0 (copy), l_GetFFlagUseMicPermForEnrollment_0 (copy), v59 (copy), l_game_EngineFeature_0 (copy), v22 (copy), l_IXPService_0 (copy), v20 (copy), v21 (copy), v54 (copy), l_AppFonts_0 (copy), v126 (ref), v55 (copy), l_InExperienceAppChatModal_0 (copy), l_InExperienceCapabilities_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v104 (copy), v56 (copy), l_GameSettings_0 (copy), v98 (copy), v122 (copy), v47 (copy), v11 (copy), v69 (copy), l_ExperienceMenuSessionManagerInstance_0 (copy), l_VRService_0 (copy), v17 (copy), v33 (copy), v35 (copy), l_TweenService_0 (copy), v39 (copy), v16 (copy), v57 (copy), v99 (ref), l_getFFlagAppChatCoreUIConflictFix_0 (copy), v135 (copy), v100 (ref), l_GetFFlagEnableAppChatInExperience_0 (copy), v101 (ref), v71 (copy), v52 (copy), v51 (copy), l_GetFStringGameInviteMenuLayer_0 (copy), v23 (copy), v113 (ref), v90 (ref), v89 (ref), v112 (ref), v114 (ref), v40 (copy), v41 (copy), v144 (copy), l_GameInviteAnalytics_0 (copy), l_CapturesPolicy_0 (copy), v115 (copy)
    local v152 = {
        Visible = false, 
        Active = true, 
        Pages = {
            CurrentPage = nil, 
            PageTable = {}
        }, 
        MenuStack = {}, 
        TabHeaders = {}, 
        BottomBarButtons = {}, 
        BottomBarButtonsComponents = {}, 
        ResizedConnection = nil, 
        BackBarVisibleConnection = nil
    };
    if l_game_EngineFeature_1 then
        v152.FrontBarVisibleConnection = nil;
    end;
    v152.PreferredTransparencyChangedConnection = nil;
    v152.TabConnection = nil;
    v152.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGame);
    v152.LeaveGameUpsellPage = if v65() then require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil;
    v152.ResetCharacterPage = require(l_RobloxGui_0.Modules.Settings.Pages.ResetCharacter);
    v152.SettingsShowSignal = v13:CreateSignal();
    v152.CurrentPageSignal = v13:CreateSignal();
    v152.OpenStateChangedCount = 0;
    v152.BottomButtonFrame = nil;
    v152.hasMicPermissions = false;
    if v65() then
        v152.checkedUpsell = false;
        v152.leaveGameUpsellProp = v119.PHONE_UPSELL_VALUE_PROP.None;
        v152.sessionStartTime = os.time();
    end;
    v152.isFetchingMicPermissions = true;
    local v153 = v110.new(l_RbxAnalyticsService_0, "SettingsHub");
    if v49() then
        v152.isMuted = nil;
        v152.lastVoiceRecordingIndicatorTextUpdated = nil;
    end;
    if v48 then
        v152.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        v152.toggleSelfViewSignal = v106:connect(function() --[[ Line: 345 ]]
            -- upvalues: v152 (copy)
            v152.selfViewOpen = not v152.selfViewOpen;
        end);
        v152.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and v107.getSelfViewIsOpenAndVisible();
        v152.selfViewVisibilitySignal = v108:connect(function() --[[ Line: 350 ]]
            -- upvalues: v152 (copy), v107 (ref)
            v152.selfViewOpen = v107.getSelfViewIsOpenAndVisible();
        end);
    end;
    local v154 = nil;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "PoppedMenu";
    v152.PoppedMenu = l_BindableEvent_0.Event;
    local function _(v156) --[[ Line: 361 ]] --[[ Name: shouldShowHubBar ]]
        -- upvalues: v152 (copy)
        return (v156 or v152.Pages.CurrentPage).ShouldShowBottomBar == true;
    end;
    local function v160(v158) --[[ Line: 366 ]] --[[ Name: shouldShowBottomBar ]]
        -- upvalues: v152 (copy), v13 (ref), v66 (ref), v29 (ref)
        v158 = v158 or v152.Pages.CurrentPage;
        if v13:IsPortrait() or v13:IsSmallTouchScreen() then
            if v66() then
                if not v29.AlwaysShowBottomBar() then
                    return false;
                end;
            else
                return v29.AlwaysShowBottomBar();
            end;
        end;
        local v159 = false;
        if v158 ~= nil then
            v159 = v158.ShouldShowBottomBar == true;
        end;
        return v159;
    end;
    local function v165() --[[ Line: 383 ]] --[[ Name: setBottomBarBindings ]]
        -- upvalues: v152 (copy), l_ContextActionService_0 (ref)
        if not v152.Visible then
            return;
        else
            for v161 = 1, #v152.BottomBarButtons do
                local v162 = v152.BottomBarButtons[v161];
                local v163 = v162[1];
                local v164 = v162[2];
                l_ContextActionService_0:BindCoreAction(v163, v164[1], false, unpack(v164[2]));
            end;
            if v152.BottomButtonFrame then
                v152.BottomButtonFrame.Visible = true;
            end;
            return;
        end;
    end;
    local function v171(v166) --[[ Line: 399 ]] --[[ Name: removeBottomBarBindings ]]
        -- upvalues: v152 (copy), l_ContextActionService_0 (ref)
        for _, v168 in pairs(v152.BottomBarButtons) do
            l_ContextActionService_0:UnbindCoreAction(v168[1]);
        end;
        local l_OpenStateChangedCount_0 = v152.OpenStateChangedCount;
        local function v170() --[[ Line: 405 ]]
            -- upvalues: v152 (ref), l_OpenStateChangedCount_0 (copy)
            if v152.OpenStateChangedCount == l_OpenStateChangedCount_0 and v152.BottomButtonFrame then
                v152.BottomButtonFrame.Visible = false;
            end;
        end;
        if v166 then
            delay(v166, v170);
            return;
        else
            if v152.OpenStateChangedCount == l_OpenStateChangedCount_0 and v152.BottomButtonFrame then
                v152.BottomButtonFrame.Visible = false;
            end;
            return;
        end;
    end;
    local function _(v172, v173, v174) --[[ Line: 418 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v152 (copy)
        local l_FirstChild_0 = v152.BottomButtonFrame:FindFirstChild(v172 .. "ButtonButton", true);
        if not l_FirstChild_0 then
            return;
        else
            l_FirstChild_0.Position = v173;
            l_FirstChild_0.Size = v174;
            return;
        end;
    end;
    local function _(v177) --[[ Line: 429 ]] --[[ Name: fnOrValue ]]
        return type(v177) == "function" and v177() or v177;
    end;
    local function v182() --[[ Line: 433 ]] --[[ Name: pollImage ]]
        -- upvalues: l_default_0 (ref), v43 (ref), l_PlayerMuteStatusIcons_0 (ref), l_MuteStatusIcons_0 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref)
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            if v43() then
                return l_PlayerMuteStatusIcons_0.Loading;
            else
                return l_MuteStatusIcons_0.Loading;
            end;
        elseif l_localMuted_0 then
            if v43() then
                return l_PlayerMuteStatusIcons_0.MicOff;
            else
                return l_MuteStatusIcons_0.MicOff;
            end;
        elseif l_default_0.isTalking and l_GetFFlagPlayerListAnimateMic_0() then
            local v181 = 20 * math.floor(0.5 + 5 * math.random());
            return (l_default_0:GetIcon("Unmuted" .. tostring(v181), "MicLight"));
        elseif v43() then
            return l_PlayerMuteStatusIcons_0.MicOn;
        else
            return l_MuteStatusIcons_0.MicOn;
        end;
    end;
    local v183 = {};
    local v184 = {
        Loading = "", 
        MicOff = "", 
        MicOn = ""
    };
    local v185 = nil;
    local v186 = nil;
    if v72 then
        v185 = l_LocalizationService_0.RobloxLocaleId;
        v186 = l_Localization_0.new(v185);
    end;
    local function v191() --[[ Line: 464 ]] --[[ Name: pollVoiceTextLabel ]]
        -- upvalues: l_LocalizationService_0 (ref), v183 (copy), l_CorePackages_0 (ref), v184 (copy), l_default_0 (ref)
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        if not v183[l_RobloxLocaleId_0] then
            v183[l_RobloxLocaleId_0] = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_RobloxLocaleId_0);
            local v188 = v183[l_RobloxLocaleId_0];
            v184.Loading = v188:Format("CoreScripts.InGameMenu.QuickActions.Connecting");
            v184.MicOff = v188:Format("CoreScripts.InGameMenu.QuickActions.UnmuteSelf");
            v184.MicOn = v188:Format("CoreScripts.InGameMenu.QuickActions.MuteSelf");
        end;
        local l_localMuted_1 = l_default_0.localMuted;
        local _ = "";
        if l_localMuted_1 == nil then
            return v184.Loading;
        elseif l_localMuted_1 then
            return v184.MicOff;
        elseif l_default_0.isTalking then
            return v184.MicOn;
        else
            return v184.MicOn;
        end;
    end;
    local v192 = nil;
    local v193 = nil;
    local function v196() --[[ Line: 497 ]] --[[ Name: updateIcon ]]
        -- upvalues: v50 (ref), v29 (ref), v192 (ref), v152 (copy), v193 (ref), v182 (copy), v191 (copy)
        if v50 then
            return;
        else
            local v194 = nil;
            local v195 = nil;
            if v29.UseIconButtons then
                if not v192 then
                    v192 = v152.BottomButtonFrame:FindFirstChild("MuteButtonButtonIcon", true);
                    v193 = v152.BottomButtonFrame:FindFirstChild("MuteButtonButtonTextLabel", true);
                end;
                v194 = v192;
                v195 = v193;
            else
                v194 = v152.BottomButtonFrame:FindFirstChild("MuteButtonHint", true);
            end;
            if v194 then
                v194.Image = v182();
            end;
            if v195 then
                v195.Text = v191();
            end;
            return;
        end;
    end;
    local function v202() --[[ Line: 520 ]] --[[ Name: hideVoiceUx ]]
        -- upvalues: v152 (copy), v29 (ref), v9 (ref)
        local l_MuteButtonButton_0 = v152.MuteButtonButton;
        if l_MuteButtonButton_0 then
            l_MuteButtonButton_0.Visible = false;
            l_MuteButtonButton_0:Destroy();
        end;
        local v198 = v29.UIBloxThemeEnabled and 72 or 120;
        local v199 = if v9 then UDim2.new(0, 320, 0, v198) else UDim2.new(0, 260, 0, v29.LargeButtonHeight);
        local v200 = UDim2.new(0.5, v9 and -160 or -130, 0.5, -25);
        local l_FirstChild_1 = v152.BottomButtonFrame:FindFirstChild("LeaveGame" .. "ButtonButton", true);
        if l_FirstChild_1 then
            l_FirstChild_1.Position = v200;
            l_FirstChild_1.Size = v199;
        end;
        v200 = UDim2.new(0.5, v9 and -550 or -400, 0.5, -25);
        l_FirstChild_1 = v152.BottomButtonFrame:FindFirstChild("ResetCharacter" .. "ButtonButton", true);
        if l_FirstChild_1 then
            l_FirstChild_1.Position = v200;
            l_FirstChild_1.Size = v199;
        end;
        v200 = UDim2.new(0.5, v9 and 200 or 140, 0.5, -25);
        l_FirstChild_1 = v152.BottomButtonFrame:FindFirstChild("Resume" .. "ButtonButton", true);
        if not l_FirstChild_1 then
            return;
        else
            l_FirstChild_1.Position = v200;
            l_FirstChild_1.Size = v199;
            return;
        end;
    end;
    local v203 = 0;
    local function v217(v204, v205, v206, _, _, v209, v210, v211) --[[ Line: 536 ]] --[[ Name: addBottomBarIconButton ]]
        -- upvalues: v13 (ref), v29 (ref), v152 (copy), v203 (ref)
        local v212 = v204 .. "Button";
        local v213 = v13:MakeIconButton(v212, v205 and v29.Images[v205] or nil, v206, nil, v210, nil, v152);
        v213.Parent = v152.BottomButtonFrame;
        v213.Position = v209;
        v213.LayoutOrder = v203;
        v203 = v203 + 1;
        v152.BottomBarButtons[#v152.BottomBarButtons + 1] = {
            v212, 
            {
                function(_, v215, _) --[[ Line: 544 ]]
                    -- upvalues: v210 (copy)
                    if v215 == Enum.UserInputState.Begin then
                        v210();
                    end;
                end, 
                v211
            }
        };
        v152.BottomBarButtonsComponents[#v152.BottomBarButtonsComponents + 1] = v213;
    end;
    local function v237(v218, v219, v220, v221, v222, v223, v224, v225) --[[ Line: 555 ]] --[[ Name: addBottomBarButtonOld ]]
        -- upvalues: v29 (ref), v9 (ref), v152 (copy), v13 (ref), l_TouchEnabled_0 (ref), l_FFlag_0 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref), l_Create_0 (ref)
        local v226 = v218 .. "Button";
        local v227 = v218 .. "Text";
        local v228 = UDim2.new(0, 260, 0, v29.LargeButtonHeight);
        if v9 then
            v228 = if v29.UIBloxThemeEnabled then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 320, 0, 120);
        end;
        local l_v152_0 = v152;
        local l_v152_1 = v152;
        local v231, v232 = v13:MakeStyledButton(v218 .. "Button", v219, v228, v223, nil, v152);
        l_v152_0[v226] = v231;
        l_v152_1[v227] = v232;
        v152[v226].Position = v222;
        v152[v226].Parent = v152.BottomButtonFrame;
        if v9 then
            v152[v226].ImageTransparency = 1;
        end;
        v152[v227].FontSize = Enum.FontSize.Size24;
        l_v152_0 = nil;
        if not l_TouchEnabled_0 then
            if v29.UIBloxThemeEnabled then
                v152[v227].Size = UDim2.new(1, -51, 1, 0);
                v152[v227].Position = UDim2.new(1, -9, 0, 0);
                v152[v227].AnchorPoint = Vector2.new(1, 0);
            elseif l_FFlag_0 then
                v152[v227].Size = UDim2.new(0.675, 0, 0.67, 0);
                v152[v227].Position = UDim2.new(0.275, 0, 0.125, 0);
            else
                v152[v227].Size = UDim2.new(0.75, 0, 0.9, 0);
                v152[v227].Position = UDim2.new(0.25, 0, 0, 0);
            end;
            l_v152_1 = v218 .. "Hint";
            v231 = "";
            v231 = if not not l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then v220 else v221;
            l_v152_0 = l_Create_0("ImageLabel")({
                Name = l_v152_1, 
                ZIndex = v152.Shield.ZIndex + 2, 
                BackgroundTransparency = 1, 
                Image = v231, 
                Parent = v152[v226]
            });
            if v29.UIBloxThemeEnabled then
                if v231 == v221 then
                    l_v152_0.ImageColor3 = v29.color("WhiteButtonText", Color3.new(1, 1, 1));
                    l_v152_0.ImageTransparency = v29.transparency("WhiteButtonText", 1);
                end;
                l_v152_0.Position = UDim2.new(0, 9, 0.5, 0);
                l_v152_0.Size = UDim2.new(0, 33, 0, 33);
                l_v152_0.AnchorPoint = Vector2.new(0, 0.5);
            else
                l_v152_0.AnchorPoint = Vector2.new(0.5, 0.5);
                l_v152_0.Size = UDim2.new(0, 50, 0, 50);
                l_v152_0.Position = UDim2.new(0.15, 0, 0.475, 0);
            end;
        end;
        if v9 then
            v152[v227].FontSize = Enum.FontSize.Size36;
        end;
        l_UserInputService_0.InputBegan:connect(function(v233) --[[ Line: 629 ]]
            -- upvalues: l_v152_0 (ref), v220 (copy), v221 (copy)
            if v233.UserInputType == Enum.UserInputType.Gamepad1 or v233.UserInputType == Enum.UserInputType.Gamepad2 or v233.UserInputType == Enum.UserInputType.Gamepad3 or v233.UserInputType == Enum.UserInputType.Gamepad4 then
                if l_v152_0 then
                    l_v152_0.Image = v220;
                    return;
                end;
            elseif v233.UserInputType == Enum.UserInputType.Keyboard and l_v152_0 then
                l_v152_0.Image = v221;
            end;
        end);
        v152.BottomBarButtons[#v152.BottomBarButtons + 1] = {
            v226, 
            {
                function(_, v235, _) --[[ Line: 652 ]]
                    -- upvalues: v225 (copy)
                    if v235 == Enum.UserInputState.Begin then
                        v225();
                    end;
                end, 
                v224
            }
        };
    end;
    local function v262(v238, v239, v240, v241, v242, v243, v244, v245, v246) --[[ Line: 662 ]] --[[ Name: addBottomBarButton ]]
        -- upvalues: v9 (ref), v29 (ref), v152 (copy), v13 (ref), l_TouchEnabled_0 (ref), l_FFlag_0 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref), l_Create_0 (ref)
        local v247 = v238 .. "Button";
        local v248 = v238 .. "Text";
        local v249 = v245 or UDim2.new(0, 260, 0, 70);
        if v9 then
            v249 = if v29.UIBloxThemeEnabled then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 320, 0, 120);
        end;
        local l_v152_2 = v152;
        local l_v152_3 = v152;
        local v252, v253 = v13:MakeStyledButton(v238 .. "Button", v239, v249, v243, nil, v152);
        l_v152_2[v247] = v252;
        l_v152_3[v248] = v253;
        v152[v247].Position = v242;
        v152[v247].Parent = v152.BottomButtonFrame;
        if v9 then
            v152[v247].ImageTransparency = 1;
        end;
        v152[v248].FontSize = Enum.FontSize.Size24;
        l_v152_2 = nil;
        if not l_TouchEnabled_0 or v246 then
            if l_FFlag_0 then
                v152[v248].Size = UDim2.new(0.675, 0, 0.67, 0);
                v152[v248].Position = UDim2.new(0.275, 0, 0.125, 0);
            else
                v152[v248].Size = UDim2.new(0.75, 0, 0.9, 0);
                v152[v248].Position = UDim2.new(0.25, 0, 0, 0);
            end;
            l_v152_3 = v238 .. "Hint";
            v252 = "";
            v252 = if not not l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then type(v240) == "function" and v240() or v240 else type(v241) == "function" and v241() or v241;
            l_v152_2 = l_Create_0("ImageLabel")({
                Name = l_v152_3, 
                ZIndex = v152.Shield.ZIndex + 2, 
                BackgroundTransparency = 1, 
                Image = v252, 
                Parent = v152[v247]
            });
            l_v152_2.AnchorPoint = Vector2.new(0.5, 0.5);
            v253 = UDim2.fromOffset(50, 50);
            l_v152_2.Size = v239 == "" and v253 or UDim2.new(0, 50, 0, 50);
            l_v152_2.Position = v239 == "" and UDim2.new(0.5, 0, 0.475, 0) or UDim2.new(0.15, 0, 0.475, 0);
        end;
        if v9 then
            v152[v248].FontSize = Enum.FontSize.Size36;
        end;
        l_UserInputService_0.InputBegan:connect(function(v254) --[[ Line: 718 ]]
            -- upvalues: l_v152_2 (ref), v240 (copy), v241 (copy)
            if v254.UserInputType == Enum.UserInputType.Gamepad1 or v254.UserInputType == Enum.UserInputType.Gamepad2 or v254.UserInputType == Enum.UserInputType.Gamepad3 or v254.UserInputType == Enum.UserInputType.Gamepad4 then
                if l_v152_2 then
                    local l_l_v152_2_0 = l_v152_2;
                    local l_v240_0 = v240;
                    l_l_v152_2_0.Image = type(l_v240_0) == "function" and l_v240_0() or l_v240_0;
                    return;
                end;
            elseif v254.UserInputType == Enum.UserInputType.Keyboard and l_v152_2 then
                local l_l_v152_2_1 = l_v152_2;
                local l_v241_0 = v241;
                l_l_v152_2_1.Image = type(l_v241_0) == "function" and l_v241_0() or l_v241_0;
            end;
        end);
        v152.BottomBarButtons[#v152.BottomBarButtons + 1] = {
            v247, 
            {
                function(_, v260, _) --[[ Line: 735 ]]
                    -- upvalues: v243 (copy)
                    if v260 == Enum.UserInputState.Begin then
                        v243();
                    end;
                end, 
                v244
            }
        };
    end;
    local v263 = "";
    if v9 then
        v263 = "@2x";
    end;
    local v264 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v263 .. ".png";
    local v265 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v263 .. ".png";
    local v266 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v263 .. ".png";
    local function v271() --[[ Line: 755 ]] --[[ Name: appendMicButton ]]
        -- upvalues: v29 (ref), v44 (ref), v152 (copy), v217 (copy), v264 (copy), v182 (copy), v9 (ref), l_default_0 (ref), v153 (copy), v196 (copy), v262 (copy), l_GetFFlagPlayerListAnimateMic_0 (ref), l_RunService_0 (ref), v49 (ref), v12 (ref)
        if v29.UseIconButtons then
            if v44() and v152.BottomButtonFrame:FindFirstChild("MuteButtonButtonIcon", true) then
                return;
            end;
        elseif v44() and v152.BottomButtonFrame:FindFirstChild("MuteButtonHint", true) then
            return;
        end;
        if v29.UseIconButtons then
            v217("MuteButton", nil, "", v264, v182, UDim2.new(0.5, v9 and 300 or 330, 0.5, -25), function() --[[ Line: 769 ]]
                -- upvalues: l_default_0 (ref), v153 (ref), v152 (ref)
                l_default_0:ToggleMic("InGameMenu");
                if v153 then
                    v153:onToggleMuteSelf(v152.isMuted);
                end;
            end, {});
            v196();
        else
            v262("MuteButton", "", v264, v182, UDim2.new(0.5, v9 and 300 or 330, 0.5, -25), function() --[[ Line: 778 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:ToggleMic("InGameMenu");
            end, {}, UDim2.new(0, v29.LargeButtonHeight, 0, v29.LargeButtonHeight), true);
        end;
        if not v44() then
            l_default_0.muteChanged.Event:Connect(function(_) --[[ Line: 786 ]]
                -- upvalues: v196 (ref)
                v196();
            end);
            if l_GetFFlagPlayerListAnimateMic_0() then
                v152.SettingsShowSignal:connect(function(v268) --[[ Line: 792 ]]
                    -- upvalues: l_RunService_0 (ref), v196 (ref), v49 (ref), v152 (ref), v12 (ref)
                    local v269 = 0;
                    local v270 = false;
                    if v268 and not v270 then
                        v270 = true;
                        l_RunService_0:BindToRenderStep("settings-hub-renderstep", Enum.RenderPriority.Last.Value, function() --[[ Line: 797 ]]
                            -- upvalues: v269 (ref), v196 (ref)
                            v269 = v269 + 1;
                            if v269 % 3 == 0 then
                                v196();
                            end;
                        end);
                    elseif v270 then
                        v270 = false;
                        l_RunService_0:UnbindFromRenderStep("settings-hub-renderstep");
                    end;
                    if v49() and v268 then
                        v152.lastVoiceRecordingIndicatorTextUpdated = tick();
                        v152.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                    end;
                end);
            end;
        end;
    end;
    local function v275() --[[ Line: 820 ]] --[[ Name: addMuteButtonToBar ]]
        -- upvalues: v50 (ref), v29 (ref), v271 (copy), v9 (ref), v152 (copy)
        if v50 then
            return;
        else
            local v272 = UDim2.new(0, 235, 0, v29.LargeButtonHeight);
            v271();
            local v273 = UDim2.new(0.5, (v9 and -160 or -130) + -27.5, 0.5, -25);
            local l_FirstChild_2 = v152.BottomButtonFrame:FindFirstChild("LeaveGame" .. "ButtonButton", true);
            if l_FirstChild_2 then
                l_FirstChild_2.Position = v273;
                l_FirstChild_2.Size = v272;
            end;
            v273 = UDim2.new(0.5, v9 and -550 or -400, 0.5, -25);
            l_FirstChild_2 = v152.BottomButtonFrame:FindFirstChild("ResetCharacter" .. "ButtonButton", true);
            if l_FirstChild_2 then
                l_FirstChild_2.Position = v273;
                l_FirstChild_2.Size = v272;
            end;
            v273 = UDim2.new(0.5, (v9 and 200 or 140) + -55, 0.5, -25);
            l_FirstChild_2 = v152.BottomButtonFrame:FindFirstChild("Resume" .. "ButtonButton", true);
            if not l_FirstChild_2 then
                return;
            else
                l_FirstChild_2.Position = v273;
                l_FirstChild_2.Size = v272;
                return;
            end;
        end;
    end;
    local v276 = false;
    local v277 = false;
    local v278 = nil;
    local v279 = nil;
    local function v313() --[[ Line: 836 ]] --[[ Name: setupVoiceListeners ]]
        -- upvalues: v276 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v277 (ref), v49 (ref), v152 (copy), l_default_0 (ref), v275 (copy), v58 (ref), v27 (ref), v44 (ref), v278 (ref), v196 (copy), v12 (ref), v129 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), v279 (ref), l_RunService_0 (ref), v202 (copy), v42 (ref), v93 (ref)
        if game:GetEngineFeature("VoiceChatSupported") and not v276 then
            v276 = true;
            if l_GetFFlagEnableShowVoiceUI_0() then
                local function v295() --[[ Line: 842 ]] --[[ Name: showUI ]]
                    -- upvalues: v277 (ref), v49 (ref), v152 (ref), l_default_0 (ref), v275 (ref), v58 (ref), v27 (ref), v44 (ref), v278 (ref), v196 (ref), v12 (ref), v129 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), v279 (ref), l_RunService_0 (ref)
                    v277 = true;
                    if v49() then
                        v152.VoiceRecordingText.Visible = true;
                        l_default_0:getService().StateChanged:Connect(function(_, v281) --[[ Line: 847 ]]
                            -- upvalues: v277 (ref), v275 (ref), v152 (ref)
                            if v281 == Enum.VoiceChatState.Joined then
                                if v277 == false then
                                    v275();
                                end;
                                v152.VoiceRecordingText.Visible = true;
                            end;
                        end);
                    end;
                    l_default_0:SetupParticipantListeners();
                    if v58() then
                        v27(function(v282) --[[ Line: 859 ]]
                            -- upvalues: v152 (ref)
                            v152.hasMicPermissions = v282.hasMicPermissions;
                        end, nil, true, "PermissionsButtons.getPermissions");
                    end;
                    v275();
                    if v44() then
                        v278 = l_default_0.muteChanged.Event:Connect(function(v283) --[[ Line: 866 ]]
                            -- upvalues: v196 (ref), v49 (ref), v152 (ref), v12 (ref), v129 (ref)
                            v196();
                            if v49() then
                                v152.isMuted = v283;
                                v152.lastVoiceRecordingIndicatorTextUpdated = tick();
                                v152.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                                if v152.isMuted then
                                    local l_VoiceRecordingText_0 = v152.VoiceRecordingText;
                                    local v285;
                                    if not v129 then
                                        v285 = "Mic Off";
                                    else
                                        local l_status_1, l_result_1 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.MicOff");
                                        v285 = if l_status_1 then l_result_1 else "Mic Off";
                                    end;
                                    l_VoiceRecordingText_0.Text = v285;
                                    return;
                                else
                                    local l_VoiceRecordingText_1 = v152.VoiceRecordingText;
                                    local v289;
                                    if not v129 then
                                        v289 = "Mic On (recording audio)";
                                    else
                                        local l_status_2, l_result_2 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.MicOnRecording");
                                        v289 = if l_status_2 then l_result_2 else "Mic On (recording audio)";
                                    end;
                                    l_VoiceRecordingText_1.Text = v289;
                                end;
                            end;
                        end);
                        if l_GetFFlagPlayerListAnimateMic_0() then
                            v279 = v152.SettingsShowSignal:connect(function(v292) --[[ Line: 882 ]]
                                -- upvalues: l_RunService_0 (ref), v196 (ref), v49 (ref), v152 (ref), v12 (ref)
                                local v293 = 0;
                                local v294 = false;
                                if v292 and not v294 then
                                    v294 = true;
                                    l_RunService_0:BindToRenderStep("settings-hub-renderstep", Enum.RenderPriority.Last.Value, function() --[[ Line: 887 ]]
                                        -- upvalues: v293 (ref), v196 (ref)
                                        v293 = v293 + 1;
                                        if v293 % 3 == 0 then
                                            v196();
                                        end;
                                    end);
                                elseif v294 then
                                    v294 = false;
                                    l_RunService_0:UnbindFromRenderStep("settings-hub-renderstep");
                                end;
                                if v49() and v292 then
                                    v152.lastVoiceRecordingIndicatorTextUpdated = tick();
                                    v152.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                                end;
                            end);
                        end;
                    end;
                end;
                local function v296() --[[ Line: 909 ]] --[[ Name: hideUI ]]
                    -- upvalues: v152 (ref), v277 (ref), v202 (ref), v278 (ref), v279 (ref)
                    v152.VoiceRecordingText.Visible = false;
                    v277 = false;
                    v202();
                    if v278 then
                        v278:Disconnect();
                    end;
                    if v279 then
                        v279:Disconnect();
                    end;
                end;
                if l_default_0.voiceUIVisible then
                    v295();
                end;
                l_default_0.showVoiceUI.Event:Connect(v295);
                l_default_0.hideVoiceUI.Event:Connect(v296);
                return;
            else
                l_default_0:asyncInit():andThen(function() --[[ Line: 927 ]]
                    -- upvalues: v277 (ref), v49 (ref), v152 (ref), l_default_0 (ref), v202 (ref), v275 (ref), v58 (ref), v27 (ref), v44 (ref), v196 (ref), v12 (ref), v129 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), l_RunService_0 (ref)
                    v277 = true;
                    if v49() then
                        v152.VoiceRecordingText.Visible = true;
                        l_default_0:getService().StateChanged:Connect(function(_, v298) --[[ Line: 932 ]]
                            -- upvalues: v152 (ref), v277 (ref), v202 (ref), v275 (ref)
                            if v298 == Enum.VoiceChatState.Ended then
                                v152.VoiceRecordingText.Visible = false;
                                v277 = false;
                                v202();
                                return;
                            else
                                if v298 == Enum.VoiceChatState.Joined then
                                    if v277 == false then
                                        v275();
                                    end;
                                    v152.VoiceRecordingText.Visible = true;
                                end;
                                return;
                            end;
                        end);
                    end;
                    l_default_0:SetupParticipantListeners();
                    if v58() then
                        v27(function(v299) --[[ Line: 948 ]]
                            -- upvalues: v152 (ref)
                            v152.hasMicPermissions = v299.hasMicPermissions;
                        end, nil, true, "PermissionsButtons.getPermissions");
                    end;
                    v275();
                    if v44() then
                        l_default_0.muteChanged.Event:Connect(function(v300) --[[ Line: 955 ]]
                            -- upvalues: v196 (ref), v49 (ref), v152 (ref), v12 (ref), v129 (ref)
                            v196();
                            if v49() then
                                v152.isMuted = v300;
                                v152.lastVoiceRecordingIndicatorTextUpdated = tick();
                                v152.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                                if v152.isMuted then
                                    local l_VoiceRecordingText_2 = v152.VoiceRecordingText;
                                    local v302;
                                    if not v129 then
                                        v302 = "Mic Off";
                                    else
                                        local l_status_3, l_result_3 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.MicOff");
                                        v302 = if l_status_3 then l_result_3 else "Mic Off";
                                    end;
                                    l_VoiceRecordingText_2.Text = v302;
                                    return;
                                else
                                    local l_VoiceRecordingText_3 = v152.VoiceRecordingText;
                                    local v306;
                                    if not v129 then
                                        v306 = "Mic On (recording audio)";
                                    else
                                        local l_status_4, l_result_4 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.MicOnRecording");
                                        v306 = if l_status_4 then l_result_4 else "Mic On (recording audio)";
                                    end;
                                    l_VoiceRecordingText_3.Text = v306;
                                end;
                            end;
                        end);
                        if l_GetFFlagPlayerListAnimateMic_0() then
                            v152.SettingsShowSignal:connect(function(v309) --[[ Line: 971 ]]
                                -- upvalues: l_RunService_0 (ref), v196 (ref), v49 (ref), v152 (ref), v12 (ref)
                                local v310 = 0;
                                local v311 = false;
                                if v309 and not v311 then
                                    v311 = true;
                                    l_RunService_0:BindToRenderStep("settings-hub-renderstep", Enum.RenderPriority.Last.Value, function() --[[ Line: 976 ]]
                                        -- upvalues: v310 (ref), v196 (ref)
                                        v310 = v310 + 1;
                                        if v310 % 3 == 0 then
                                            v196();
                                        end;
                                    end);
                                elseif v311 then
                                    v311 = false;
                                    l_RunService_0:UnbindFromRenderStep("settings-hub-renderstep");
                                end;
                                if v49() and v309 then
                                    v152.lastVoiceRecordingIndicatorTextUpdated = tick();
                                    v152.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                                end;
                            end);
                        end;
                    end;
                end):catch(function(v312) --[[ Line: 997 ]]
                    -- upvalues: v42 (ref), v93 (ref)
                    if v42() then
                        v93:warning("Failed to init VoiceChatServiceManager {}", v312);
                    end;
                end);
            end;
        end;
    end;
    if not v121 then
        v313();
    end;
    local v314 = true;
    local function v318(v315) --[[ Line: 1011 ]] --[[ Name: setResetEnabled ]]
        -- upvalues: v314 (ref), v152 (copy)
        v314 = v315;
        if v152.ResetCharacterButton then
            v152.ResetCharacterButton.Selectable = v315;
            v152.ResetCharacterButton.Active = v315;
            v152.ResetCharacterButton.Enabled.Value = v315;
            local l_ResetCharacterHint_0 = v152.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
            if l_ResetCharacterHint_0 then
                l_ResetCharacterHint_0.ImageColor3 = v315 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
            local l_ResetCharacterButtonTextLabel_0 = v152.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
            if l_ResetCharacterButtonTextLabel_0 then
                l_ResetCharacterButtonTextLabel_0.TextColor3 = v315 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
        end;
    end;
    local v319 = nil;
    v152.GetRespawnBehaviour = function(_) --[[ Line: 1029 ]] --[[ Name: GetRespawnBehaviour ]]
        -- upvalues: v314 (ref), v319 (ref)
        return v314, v319;
    end;
    v152.RespawnBehaviourChangedEvent = Instance.new("BindableEvent");
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v321) --[[ Line: 1035 ]]
        -- upvalues: v152 (copy), v318 (copy), v314 (ref), v319 (ref)
        local v322 = false;
        if typeof(v321) == "Instance" then
            v322 = v321:IsA("BindableEvent");
        end;
        if v322 or type(v321) == "boolean" then
            v152.ResetCharacterPage:SetResetCallback(v321);
        else
            warn("ResetButtonCallback must be set to a BindableEvent or a boolean");
        end;
        if v321 == false then
            v318(false);
        elseif not v314 and (v322 or v321 == true) then
            v318(true);
        end;
        if v322 then
            v319 = v321;
        end;
        v152.RespawnBehaviourChangedEvent:Fire(v314, v319);
    end);
    if v68 then
        l_StarterGui_0:RegisterGetCore("ResetButtonCallback", function() --[[ Line: 1054 ]]
            -- upvalues: v152 (copy)
            local l_v152_RespawnBehaviour_0, _ = v152:GetRespawnBehaviour();
            return l_v152_RespawnBehaviour_0;
        end);
    end;
    local v325 = nil;
    local function v327(v326) --[[ Line: 1062 ]] --[[ Name: createPermissionsButtons ]]
        -- upvalues: v10 (ref), v105 (ref), v9 (ref), v13 (ref), v152 (copy), v29 (ref), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (ref)
        return v10.createElement(v105, {
            isTenFootInterface = v9, 
            isPortrait = v13:IsPortrait(), 
            isSmallTouchScreen = v13:IsSmallTouchScreen(), 
            ZIndex = v152.Shield.ZIndex, 
            LayoutOrder = -1, 
            shouldFillScreen = v326, 
            selfViewOpen = v152.selfViewOpen, 
            useNewMenuTheme = v29.UIBloxThemeEnabled, 
            hubRef = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then v152 else nil
        });
    end;
    local function v430() --[[ Line: 1076 ]] --[[ Name: createGui ]]
        -- upvalues: v13 (ref), v152 (copy), l_Create_0 (ref), v137 (ref), v136 (ref), l_RobloxGui_0 (ref), v29 (ref), v75 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), v31 (ref), v30 (ref), v34 (ref), l_GetFFlagDisplayServerChannel_0 (ref), v9 (ref), v128 (ref), v129 (ref), v147 (ref), v102 (ref), v91 (ref), l_RunService_0 (ref), v45 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v15 (ref), l_BaseUrl_0 (ref), v97 (ref), l_StarterPlayer_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v46 (ref), v70 (ref), l_GuiService_0 (ref), v48 (ref), v49 (ref), v10 (ref), v327 (copy), l_GetFFlagUseMicPermForEnrollment_0 (ref), v27 (ref), v58 (ref), v59 (ref), l_default_0 (ref), l_game_EngineFeature_0 (ref), l_game_EngineFeature_1 (ref), v22 (ref), l_IXPService_0 (ref), v20 (ref), v21 (ref), v54 (ref), v50 (ref), l_AppFonts_0 (ref), v12 (ref), v126 (ref), l_UserInputService_0 (ref), v55 (ref), v171 (copy), v65 (ref), v119 (ref), v325 (ref), l_InExperienceAppChatModal_0 (ref), l_InExperienceCapabilities_0 (ref), v217 (copy), v265 (copy), v237 (copy), v314 (ref), v72 (ref), v186 (ref), v266 (copy), v264 (copy), l_isSubjectToDesktopPolicies_0 (ref), v104 (ref), v56 (ref), v44 (ref), v277 (ref), v275 (copy)
        local v328 = 0;
        if v13:IsSmallTouchScreen() then
            v328 = 5;
        end;
        v152.ClippingShield = l_Create_0("Frame")({
            Name = "SettingsClippingShield", 
            Size = v137, 
            Position = v136, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_RobloxGui_0
        });
        local v329 = "Frame";
        if v29.UIBloxThemeEnabled then
            v329 = "ImageButton";
        end;
        v152.CanvasGroup = l_Create_0("CanvasGroup")({
            Name = "CanvasGroup", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = not v75 or false, 
            Parent = v152.ClippingShield
        });
        v152.Shield = l_Create_0(v329)({
            Name = "SettingsShield", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = l_SHIELD_INACTIVE_POSITION_0, 
            BackgroundTransparency = v31, 
            BackgroundColor3 = v30, 
            BorderSizePixel = 0, 
            Visible = false, 
            Active = true, 
            ZIndex = 2, 
            Parent = v152.ClippingShield
        });
        v152.VRShield = l_Create_0("Frame")({
            Name = "VRBackground", 
            Parent = v152.Shield, 
            BackgroundColor3 = v30, 
            BackgroundTransparency = v31, 
            Position = UDim2.new(0, -4, 0, 24), 
            Size = UDim2.new(1, 8, 1, -40), 
            BorderSizePixel = 0, 
            Visible = false
        });
        local l_game_EngineFeature_2 = game:GetEngineFeature("CoreScriptVersionEnabled");
        if l_game_EngineFeature_2 then
            v152.VersionContainer = l_Create_0("ScrollingFrame")({
                Name = "VersionContainer", 
                Parent = v152.Shield, 
                CanvasSize = UDim2.new(0, 0, 0, v34), 
                BackgroundColor3 = v30, 
                BackgroundTransparency = v31, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v34), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                ZIndex = 5, 
                Visible = false
            });
        else
            v152.VersionContainer = l_Create_0("Frame")({
                Name = "VersionContainer", 
                Parent = v152.Shield, 
                BackgroundColor3 = v30, 
                BackgroundTransparency = v31, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v34), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ZIndex = 5, 
                Visible = false
            });
        end;
        local v331 = l_Create_0("UIListLayout")({
            Name = "VersionContainer", 
            Parent = v152.VersionContainer, 
            Padding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local function _(v332) --[[ Line: 1189 ]] --[[ Name: addSizeToLabel ]]
            -- upvalues: l_game_EngineFeature_2 (copy), v34 (ref)
            local v333 = UDim2.new(0.2, -6, 1, 0);
            v332.Size = l_game_EngineFeature_2 and UDim2.new(0, v332.TextBounds.X + 6, 0, v34) or v333;
        end;
        if l_GetFFlagDisplayServerChannel_0() then
            v152.ServerChannelLabel = l_Create_0("TextLabel")({
                Name = "ServerChannelLabel", 
                Parent = v152.VersionContainer, 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
                Text = "Server Channel: ...", 
                Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            spawn(function() --[[ Line: 1208 ]]
                -- upvalues: v128 (ref), v129 (ref), v152 (ref), v147 (ref), l_game_EngineFeature_2 (copy), v34 (ref)
                local v335 = "Server Channel: ";
                if v128 then
                    if not v129 then
                        v335 = "Server Channel: ";
                    else
                        local l_status_5, l_result_5 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.ServerChannel");
                        v335 = if l_status_5 then l_result_5 else "Server Channel: ";
                    end;
                end;
                v152.ServerChannelLabel.Text = v335 .. v147();
                local l_ServerChannelLabel_0 = v152.ServerChannelLabel;
                local v339 = UDim2.new(0.2, -6, 1, 0);
                l_ServerChannelLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_ServerChannelLabel_0.TextBounds.X + 6, 0, v34) or v339;
                v152.ServerChannelLabel.TextScaled = not (l_game_EngineFeature_2 or v152.ServerChannelLabel.TextFits);
            end);
        end;
        v152.ServerVersionLabel = l_Create_0("TextLabel")({
            Name = "ServerVersionLabel", 
            Parent = v152.VersionContainer, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
            Text = "Server Version: ...", 
            Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        spawn(function() --[[ Line: 1232 ]]
            -- upvalues: v128 (ref), v129 (ref), v152 (ref), v102 (ref), v91 (ref), l_game_EngineFeature_2 (copy), v34 (ref)
            local v340 = "Server Version: ";
            if v128 then
                if not v129 then
                    v340 = "Server Version: ";
                else
                    local l_status_6, l_result_6 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.ServerVersion");
                    v340 = if l_status_6 then l_result_6 else "Server Version: ";
                end;
            end;
            local l_ServerVersionLabel_0 = v152.ServerVersionLabel;
            local l_v340_0 = v340;
            local v345;
            if v102 then
                v345 = v102;
            else
                if not v91 then
                    repeat
                        wait();
                    until v91;
                end;
                v102 = v91:InvokeServer();
                v345 = v102;
            end;
            l_ServerVersionLabel_0.Text = l_v340_0 .. v345;
            l_ServerVersionLabel_0 = v152.ServerVersionLabel;
            local v346 = UDim2.new(0.2, -6, 1, 0);
            l_ServerVersionLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_ServerVersionLabel_0.TextBounds.X + 6, 0, v34) or v346;
            v152.ServerVersionLabel.TextScaled = not (l_game_EngineFeature_2 or v152.ServerVersionLabel.TextFits);
        end);
        local v347 = "Client Version: ";
        if v128 then
            if not v129 then
                v347 = "Client Version: ";
            else
                local l_status_7, l_result_7 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.ClientVersion");
                v347 = if l_status_7 then l_result_7 else "Client Version: ";
            end;
        end;
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 1248 ]]
            -- upvalues: l_RunService_0 (ref)
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_8 then
            l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_result_8);
        end;
        v152.ClientVersionLabel = l_Create_0("TextLabel")({
            Name = "ClientVersionLabel", 
            Parent = v152.VersionContainer, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
            Text = v347 .. l_l_RunService_0_RobloxVersion_0, 
            Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        local l_ClientVersionLabel_0 = v152.ClientVersionLabel;
        local v354 = UDim2.new(0.2, -6, 1, 0);
        l_ClientVersionLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_ClientVersionLabel_0.TextBounds.X + 6, 0, v34) or v354;
        v152.ClientVersionLabel.TextScaled = not (l_game_EngineFeature_2 or v152.ClientVersionLabel.TextFits);
        v152.PlaceVersionLabel = l_Create_0("TextLabel")({
            Name = "PlaceVersionLabel", 
            Parent = v152.VersionContainer, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
            Text = "Place Version: ...", 
            Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        l_ClientVersionLabel_0 = function() --[[ Line: 1285 ]] --[[ Name: setPlaceVersionText ]]
            -- upvalues: v128 (ref), v129 (ref), v152 (ref), v45 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_game_EngineFeature_2 (copy), v34 (ref)
            local v355 = "Place Version: ";
            if v128 then
                if not v129 then
                    v355 = "Place Version: ";
                else
                    local l_status_9, l_result_9 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.PlaceVersion");
                    v355 = if l_status_9 then l_result_9 else "Place Version: ";
                end;
            end;
            local l_PlaceVersionLabel_0 = v152.PlaceVersionLabel;
            local l_v355_0 = v355;
            local v360;
            if v45() then
                v360 = game.PlaceVersion;
            else
                local l_PlaceVersion_1 = game.PlaceVersion;
                do
                    local l_l_PlaceVersion_1_0 = l_PlaceVersion_1;
                    pcall(function() --[[ Line: 291 ]]
                        -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_l_PlaceVersion_1_0 (ref)
                        local l_l_HttpRbxApiService_0_Async_1 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
                        local l_VersionNumber_1 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_1)[1].VersionNumber;
                        l_l_PlaceVersion_1_0 = string.format("%s (Latest: %d)", l_l_PlaceVersion_1_0, l_VersionNumber_1);
                    end);
                    v360 = l_l_PlaceVersion_1_0;
                end;
            end;
            l_PlaceVersionLabel_0.Text = l_v355_0 .. v360;
            l_PlaceVersionLabel_0 = v152.PlaceVersionLabel;
            local v365 = UDim2.new(0.2, -6, 1, 0);
            l_PlaceVersionLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_PlaceVersionLabel_0.TextBounds.X + 6, 0, v34) or v365;
            v152.PlaceVersionLabel.TextScaled = not (l_game_EngineFeature_2 or v152.PlaceVersionLabel.TextFits);
        end;
        game:GetPropertyChangedSignal("PlaceVersion"):Connect(l_ClientVersionLabel_0);
        spawn(l_ClientVersionLabel_0);
        if not v15:IsSubjectToChinaPolicies() then
            v152.EnvironmentLabel = l_Create_0("TextLabel")({
                Name = "EnvironmentLabel", 
                Parent = v152.VersionContainer, 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                LayoutOrder = 4, 
                TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
                Text = l_BaseUrl_0, 
                Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5, 
                Visible = v97
            });
            local l_EnvironmentLabel_0 = v152.EnvironmentLabel;
            local v367 = UDim2.new(0.2, -6, 1, 0);
            l_EnvironmentLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_EnvironmentLabel_0.TextBounds.X + 6, 0, v34) or v367;
            v152.EnvironmentLabel.TextScaled = not (l_game_EngineFeature_2 or v152.EnvironmentLabel.TextFits);
        end;
        if game:GetEngineFeature("GetPlaySessionIdEnabled") then
            local l_game_PlaySessionId_0 = game:GetPlaySessionId();
            if l_game_PlaySessionId_0 ~= "" then
                local v369 = "PlaySessionId: " .. l_game_PlaySessionId_0;
                if v129 then
                    v369 = v129:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
                        RBX_STR = l_game_PlaySessionId_0
                    });
                end;
                v152.PlaySessionIdLabel = l_Create_0("TextLabel")({
                    Name = "PlaySessionIdLabel", 
                    Parent = v152.VersionContainer, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
                    Text = v369, 
                    Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 5
                });
                local l_PlaySessionIdLabel_0 = v152.PlaySessionIdLabel;
                local v371 = UDim2.new(0.2, -6, 1, 0);
                l_PlaySessionIdLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_PlaySessionIdLabel_0.TextBounds.X + 6, 0, v34) or v371;
                v152.PlaySessionIdLabel.TextScaled = not v152.PlaySessionIdLabel.TextFits;
            end;
        end;
        local function v385() --[[ Line: 1347 ]] --[[ Name: getOverridesPlayerScripts ]]
            -- upvalues: l_StarterPlayer_0 (ref), v128 (ref), v129 (ref)
            local l_StarterPlayerScripts_0 = l_StarterPlayer_0:WaitForChild("StarterPlayerScripts");
            local l_PlayerScriptsLoader_0 = l_StarterPlayerScripts_0:FindFirstChild("PlayerScriptsLoader");
            local l_PlayerModule_0 = l_StarterPlayerScripts_0:FindFirstChild("PlayerModule");
            if l_PlayerModule_0 and l_PlayerScriptsLoader_0 and not l_PlayerModule_0.Archivable then
                if l_PlayerScriptsLoader_0.Archivable then
                    if v128 then
                        if not v129 then
                            return "Possibly Custom";
                        else
                            local l_status_10, l_result_10 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.PossiblyCustom");
                            if l_status_10 then
                                return l_result_10;
                            else
                                return "Possibly Custom";
                            end;
                        end;
                    else
                        return "Possibly Custom";
                    end;
                elseif v128 then
                    if not v129 then
                        return "Default";
                    else
                        local l_status_11, l_result_11 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.Default");
                        if l_status_11 then
                            return l_result_11;
                        else
                            return "Default";
                        end;
                    end;
                else
                    return "Default";
                end;
            else
                local l_CameraScript_0 = l_StarterPlayerScripts_0:FindFirstChild("CameraScript");
                local l_ControlScript_0 = l_StarterPlayerScripts_0:FindFirstChild("ControlScript");
                if l_CameraScript_0 or l_ControlScript_0 then
                    if v128 then
                        if not v129 then
                            return "Custom Old";
                        else
                            local l_status_12, l_result_12 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.CustomOld");
                            if l_status_12 then
                                return l_result_12;
                            else
                                return "Custom Old";
                            end;
                        end;
                    else
                        return "Custom Old";
                    end;
                elseif v128 then
                    if not v129 then
                        return "Custom";
                    else
                        local l_status_13, l_result_13 = pcall(v129.FormatByKey, v129, "InGame.CommonUI.Label.Custom");
                        if l_status_13 then
                            return l_result_13;
                        else
                            return "Custom";
                        end;
                    end;
                else
                    return "Custom";
                end;
            end;
        end;
        v152.OverridesPlayerScriptsLabel = l_Create_0("TextLabel")({
            Name = "OverridesPlayerScriptsLabel", 
            Parent = v152.VersionContainer, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            LayoutOrder = 5, 
            TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
            Text = "PlayerScripts: ", 
            Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5, 
            Visible = false
        });
        spawn(function() --[[ Line: 1400 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_Players_0 (ref), v128 (ref), v129 (ref), v385 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v46 (ref), v152 (ref), v97 (ref), l_game_EngineFeature_2 (copy), v34 (ref)
            local v386 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
            if not l_Players_0.LocalPlayer then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local v387 = "PlayerScripts: ";
            if v128 then
                if not v129 then
                    v387 = "PlayerScripts: ";
                else
                    local l_status_14, l_result_14 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.PlayerScripts");
                    v387 = if l_status_14 then l_result_14 else "PlayerScripts: ";
                end;
            end;
            local v390 = v385();
            l_RbxAnalyticsService_0:setRBXEventStream(l_Constants_0.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
                defaultPlayerScripts = v390 == "Default", 
                placeID = tostring(game.PlaceId), 
                rawValue = if v46() then v390 else nil, 
                context = v46() and "IGMv1" or nil
            });
            v152.OverridesPlayerScriptsLabel.Text = v387 .. v390;
            v152.OverridesPlayerScriptsLabel.Visible = v97 or v386.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
            local l_OverridesPlayerScriptsLabel_0 = v152.OverridesPlayerScriptsLabel;
            local v392 = UDim2.new(0.2, -6, 1, 0);
            l_OverridesPlayerScriptsLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_OverridesPlayerScriptsLabel_0.TextBounds.X + 6, 0, v34) or v392;
            v152.OverridesPlayerScriptsLabel.TextScaled = not (l_game_EngineFeature_2 or v152.OverridesPlayerScriptsLabel.TextFits);
        end);
        if l_game_EngineFeature_2 then
            local v393 = "Client CoreScript Version: ";
            if v128 then
                if not v129 then
                    v393 = "Client CoreScript Version: ";
                else
                    local l_status_15, l_result_15 = pcall(v129.FormatByKey, v129, "InGame.HelpMenu.Label.ClientCoreScriptVersion");
                    v393 = if l_status_15 then l_result_15 else "Client CoreScript Version: ";
                end;
            end;
            v152.CoreScriptVersionLabel = l_Create_0("TextLabel")({
                Name = "CoreScriptVersionLabel", 
                Parent = v152.VersionContainer, 
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v29.textSize(v9 and 28 or v13:IsSmallTouchScreen() and 14 or 20), 
                Text = v393 .. l_RunService_0:GetCoreScriptVersion(), 
                Font = v29.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            local l_CoreScriptVersionLabel_0 = v152.CoreScriptVersionLabel;
            local v397 = UDim2.new(0.2, -6, 1, 0);
            l_CoreScriptVersionLabel_0.Size = l_game_EngineFeature_2 and UDim2.new(0, l_CoreScriptVersionLabel_0.TextBounds.X + 6, 0, v34) or v397;
            l_CoreScriptVersionLabel_0 = v152.VersionContainer;
            local l_l_CoreScriptVersionLabel_0_0 = l_CoreScriptVersionLabel_0 --[[ copy: 13 -> 23 ]];
            v331:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1447 ]]
                -- upvalues: l_l_CoreScriptVersionLabel_0_0 (copy), v331 (copy), v34 (ref)
                l_l_CoreScriptVersionLabel_0_0.CanvasSize = UDim2.new(0, v331.AbsoluteContentSize.X, 0, v34);
            end);
        end;
        v152.Modal = l_Create_0("TextButton")({
            Name = "Modal", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Text = "", 
            Parent = v152.Shield, 
            Selectable = false
        });
        if v29.EnableDarkenBackground then
            if v70 then
                v152.DarkenBackground = l_Create_0("ImageButton")({
                    Name = "DarkenBackground", 
                    ZIndex = v152.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = v29.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v152.ClippingShield, 
                    AutoButtonColor = false, 
                    Visible = false
                });
            else
                v152.DarkenBackground = l_Create_0("Frame")({
                    Name = "DarkenBackground", 
                    ZIndex = v152.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = v29.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v152.ClippingShield
                });
            end;
        end;
        local v399 = v29.MenuContainerPosition();
        v152.MenuContainer = l_Create_0(v329)({
            Name = "MenuContainer", 
            ZIndex = v152.Shield.ZIndex, 
            BackgroundTransparency = v29.transparency("MenuContainer", 1), 
            BackgroundColor3 = v29.color("MenuContainer"), 
            Position = v399.Position, 
            Size = v399.Size, 
            AnchorPoint = v399.AnchorPoint, 
            AutomaticSize = v399.AutomaticSize, 
            Parent = v152.Shield
        });
        v152.MenuContainerPadding = l_Create_0("UIPadding")({
            Parent = v152.MenuContainer
        });
        if not v9 then
            local l_Y_0 = l_GuiService_0:GetGuiInset().Y;
            if v48 or v49() then
                l_Y_0 = 0;
            end;
            v152.MenuContainerPadding.PaddingTop = UDim.new(0, l_Y_0);
        end;
        local l_MenuContainer_0 = v152.MenuContainer;
        if v29.UIBloxThemeEnabled then
            local v402 = v29.HubPadding();
            v152.MenuContainer.AutoButtonColor = false;
            v152.MenuContainerPadding.PaddingLeft = v402.PaddingLeft;
            v152.MenuContainerPadding.PaddingRight = v402.PaddingRight;
            v152.MenuContainerPadding.PaddingBottom = v402.PaddingBottom;
            v152.MenuContainerPadding.PaddingTop = v402.PaddingTop;
            l_Create_0("UICorner")({
                CornerRadius = v29.MenuContainerCornerRadius, 
                Parent = v152.MenuContainer
            });
            if v29.EnableVerticalBottomBar then
                v152.MainColumn = l_Create_0("Frame")({
                    Name = "MainColumn", 
                    BackgroundTransparency = 1, 
                    Position = v399.Position, 
                    Size = v399.Size, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Parent = v152.MenuContainer
                });
                l_MenuContainer_0 = v152.MainColumn;
                v152.VerticalMenuDivider = l_Create_0("Frame")({
                    Name = "VerticalMenuDivider", 
                    BackgroundTransparency = v29.transparency("Divider"), 
                    BackgroundColor3 = v29.color("Divider"), 
                    Size = UDim2.new(0, 1, 1, -100), 
                    Visible = true, 
                    Parent = v152.MenuContainer
                });
                v152.VerticalMenu = l_Create_0("Frame")({
                    Name = "VerticalMenu", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v29.VerticalMenuWidth, 0, 100), 
                    Visible = false, 
                    Parent = v152.MenuContainer
                });
                l_Create_0("UIListLayout")({
                    Name = "MenuListLayout", 
                    Padding = UDim.new(0, 10), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Parent = v152.VerticalMenu
                });
                v152.MenuListLayout = l_Create_0("UIListLayout")({
                    Name = "MenuListLayout", 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Parent = v152.MenuContainer
                });
            end;
        end;
        if v48 then
            if v29.UIBloxThemeEnabled then
                v152.permissionsButtonsRoot = v10.mount(v327(true), v152.Shield, "PermissionsButtons");
            else
                v152.permissionsButtonsRoot = v10.mount(v327(true), v152.MenuContainer, "PermissionsButtons");
            end;
        end;
        if l_GetFFlagUseMicPermForEnrollment_0() then
            v27(function(v403) --[[ Line: 1597 ]]
                -- upvalues: v152 (ref)
                v152.hasMicPermissions = v403.hasMicPermissions;
                v152.isFetchingMicPermissions = false;
            end, nil, true);
        end;
        if v58() then
            v152.SettingsShowSignal:connect(function(v404) --[[ Line: 1605 ]]
                -- upvalues: l_GetFFlagUseMicPermForEnrollment_0 (ref), v59 (ref), l_default_0 (ref), v152 (ref), l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref)
                if l_GetFFlagUseMicPermForEnrollment_0() then
                    if v404 then
                        if v59() and l_default_0:IsSeamlessVoice() and not l_default_0.voiceUIVisible then
                            l_default_0.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                        elseif v59() and l_default_0:IsSeamlessVoice() and l_default_0.voiceUIVisible then
                            l_default_0.Analytics:reportLeaveVoiceButtonEvent("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                        end;
                        if l_default_0:UserVoiceEnabled() and v152.isFetchingMicPermissions then
                            return;
                        elseif not (l_default_0:UserOnlyEligibleForVoice() or l_default_0:UserVoiceEnabled() and not v152.hasMicPermissions) then
                            return;
                        elseif not v59() and l_default_0:UserInInExperienceUpsellTreatment() then
                            local v405 = "";
                            if l_game_EngineFeature_0 then
                                v405 = l_RbxAnalyticsService_0:GetPlaySessionId();
                            end;
                            l_default_0.Analytics:reportJoinVoiceButtonEvent("shown", game.GameId, game.PlaceId, v405);
                            return;
                        end;
                    end;
                else
                    local v406 = l_default_0:UserInInExperienceUpsellTreatment();
                    local v407 = l_default_0:UserOnlyEligibleForVoice() or l_default_0:UserVoiceEnabled() and not v152.hasMicPermissions;
                    if v404 and v59() and l_default_0:IsSeamlessVoice() and not l_default_0.voiceUIVisible then
                        l_default_0.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                        return;
                    elseif v404 and v59() and l_default_0:IsSeamlessVoice() and l_default_0.voiceUIVisible then
                        l_default_0.Analytics:reportLeaveVoiceButtonEvent("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                        return;
                    elseif v404 and v406 and v407 then
                        local v408 = "";
                        if l_game_EngineFeature_0 then
                            v408 = l_RbxAnalyticsService_0:GetPlaySessionId();
                        end;
                        l_default_0.Analytics:reportJoinVoiceButtonEvent("shown", game.GameId, game.PlaceId, v408);
                    end;
                end;
            end);
        end;
        v152.MenuListLayout = l_Create_0("UIListLayout")({
            Name = "MenuListLayout", 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = if v29.UIBloxThemeEnabled then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = l_MenuContainer_0
        });
        v152.MenuAspectRatio = l_Create_0("UIAspectRatioConstraint")({
            Name = "MenuAspectRatio", 
            AspectRatio = 1.3333333333333333, 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            Parent = if v29.UIBloxThemeEnabled then nil else l_MenuContainer_0
        });
        if v29.UIBloxThemeEnabled then
            v152.HubBar = l_Create_0("ImageLabel")({
                Name = "HubBar", 
                BackgroundColor3 = v29.color("HubBarContainer"), 
                BackgroundTransparency = v29.transparency("HubBarContainerTransparency"), 
                ZIndex = v152.Shield.ZIndex + 1, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0), 
                LayoutOrder = 0, 
                Parent = l_MenuContainer_0
            });
            l_Create_0("Frame")({
                BackgroundColor3 = v29.color("Divider"), 
                BackgroundTransparency = v29.transparency("Divider"), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                Parent = v152.HubBar
            });
        else
            v152.HubBar = l_Create_0("ImageLabel")({
                Name = "HubBar", 
                ZIndex = v152.Shield.ZIndex + 1, 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 6, 6), 
                AnchorPoint = Vector2.new(0.5, 0), 
                LayoutOrder = 0, 
                Parent = l_MenuContainer_0
            });
        end;
        v152.HubBarListLayout = l_Create_0("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v152.HubBar
        });
        if l_game_EngineFeature_1 then
            v152.BackBarRef = v10.createRef();
            v152.FrontBarRef = v10.createRef();
            v152.BackBar = v10.createElement(v22.Provider, {
                value = l_IXPService_0
            }, {
                ButtonsFrame = v10.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = -1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    BackButton = v10.createElement(v20, {
                        BackBarRef = v152.BackBarRef, 
                        HubBar = v152.HubBar, 
                        LayoutOrder = 1
                    }), 
                    FrontButton = v10.createElement(v21, {
                        FrontBarRef = v152.FrontBarRef, 
                        HubBar = v152.HubBar, 
                        LayoutOrder = 2
                    })
                })
            });
            v10.mount(v152.BackBar, l_MenuContainer_0, "BackBar");
        else
            v152.BackBarRef = v10.createRef();
            v152.BackBar = v10.createElement(v22.Provider, {
                value = l_IXPService_0
            }, {
                BackButton = v10.createElement(v20, {
                    BackBarRef = v152.BackBarRef, 
                    HubBar = v152.HubBar
                })
            });
            v10.mount(v152.BackBar, l_MenuContainer_0, "BackBar");
        end;
        if v13:IsSmallTouchScreen() then
            if v29.UIBloxThemeEnabled then
                v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 100, 0, 50);
            else
                v152.HubBar.Size = UDim2.new(1, -10, 0, 40);
            end;
            v152.HubBar.Position = UDim2.new(0.5, 0, 0, 6);
        elseif v9 then
            v152.HubBar.Size = UDim2.new(0, 1200, 0, 100);
            v152.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        else
            v152.HubBar.Size = UDim2.new(0, 800, 0, 60);
            v152.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        end;
        v152.VoiceRecordingIndicatorFrame = if not v49() or v48 then nil else l_Create_0("Frame")({
            Size = if v54() and v50 then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100), 
            Position = UDim2.new(0, 0, 0, 0), 
            Parent = v152.HubBar, 
            BackgroundTransparency = 1
        });
        v152.VoiceRecordingText = if v49() then l_Create_0("TextLabel")({
            Parent = v152.VoiceRecordingIndicatorFrame, 
            Text = "", 
            Visible = false, 
            Position = UDim2.new(0, 60, 0, 0), 
            TextSize = 12, 
            Font = l_AppFonts_0.default:getMedium(), 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1
        }) else nil;
        if v49() then
            if v13:IsSmallTouchScreen() then
                v152.VoiceRecordingText.Size = UDim2.fromScale(1, 1);
                v152.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0);
                if v54() and v50 then
                    v152.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                    v152.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60);
                else
                    v152.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60);
                end;
            elseif v9 then
                v152.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
                if v54() and v50 then
                    v152.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                    v152.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100);
                    v152.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
                else
                    v152.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100);
                    v152.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
                end;
            else
                v152.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
                if v54() and v50 then
                    v152.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                    v152.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60);
                    v152.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
                else
                    v152.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60);
                    v152.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
                end;
            end;
            v152.voiceRecordingIndicatorTextMotor = v12.createSingleMotor(0);
            v152.voiceRecordingIndicatorTextMotor:onStep(function(v409) --[[ Line: 1830 ]]
                -- upvalues: v152 (ref)
                v152.VoiceRecordingText.TextTransparency = v409;
            end);
            spawn(function() --[[ Line: 1834 ]]
                -- upvalues: l_RunService_0 (ref), v152 (ref), v12 (ref), v126 (ref)
                l_RunService_0:BindToRenderStep("VoiceRecordingIndicator", 1, function() --[[ Line: 1835 ]]
                    -- upvalues: v152 (ref), v12 (ref), v126 (ref)
                    if v152.isMuted ~= nil and v152.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - v152.lastVoiceRecordingIndicatorTextUpdated >= 5 and v152.isMuted then
                        v152.voiceRecordingIndicatorTextMotor:setGoal(v12.spring(1, v126));
                        v152.voiceRecordingIndicatorTextMotor:start();
                    end;
                end);
            end);
        end;
        v152.PageViewClipper = l_Create_0("Frame")({
            Name = "PageViewClipper", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(v152.HubBar.Size.X.Scale, v152.HubBar.Size.X.Offset, 1, -v152.HubBar.Size.Y.Offset - v152.HubBar.Position.Y.Offset - v328), 
            Position = UDim2.new(v152.HubBar.Position.X.Scale, v152.HubBar.Position.X.Offset, v152.HubBar.Position.Y.Scale, v152.HubBar.Position.Y.Offset + v152.HubBar.Size.Y.Offset + 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ClipsDescendants = true, 
            LayoutOrder = 1, 
            Parent = l_MenuContainer_0; 
            l_Create_0("ImageButton")({
                Name = "InputCapture", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = ""
            })
        });
        v152.PageView = l_Create_0("ScrollingFrame")({
            Name = "PageView", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = if v29.UIBloxThemeEnabled then UDim2.new(0.5, 0, 0.5, 2) else UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 1, -20), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ZIndex = v152.Shield.ZIndex, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ScrollBarThickness = v29.DefaultScrollBarThickness, 
            Parent = v152.PageViewClipper
        });
        v152.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
        v152.lastPageViewCanvasPosition = v152.PageView.CanvasPosition;
        v152.handelPageViewScroll = function() --[[ Line: 1886 ]]
            -- upvalues: v152 (ref)
            local v410 = math.clamp(v152.lastPageViewCanvasPosition.Y, 0, v152.PageView.MaxCanvasPosition.Y);
            local v411 = math.clamp(v152.PageView.CanvasPosition.Y, 0, v152.PageView.MaxCanvasPosition.Y);
            local v412 = v410 - v411;
            if math.abs(v412) > 5 then
                if v412 < 0 then
                    v152:animateOutBottomBar();
                else
                    v152:animateInBottomBar();
                end;
                v152.lastPageViewCanvasPosition = Vector2.new(v152.PageView.CanvasPosition.x, v411);
            end;
        end;
        v152.pageViewScrollChangeCon = nil;
        if v29.UseStickyBar() then
            v152.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            if v13:IsPortrait() == false then
                v152.defaultPageViewClipperSize = nil;
                v152.showStickyBottomBar = true;
                v152.pageViewScrollChangeCon = v152.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v152.handelPageViewScroll);
            end;
        end;
        v152.PageViewInnerFrame = l_Create_0("Frame")({
            Name = "PageViewInnerFrame", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = v152.Shield.ZIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            Parent = v152.PageView, 
            LayoutOrder = 1
        });
        if v29.UIBloxThemeEnabled then
            l_Create_0("UIPadding")({
                PaddingTop = UDim.new(0, 5), 
                Parent = v152.PageViewInnerFrame
            });
        end;
        v152.InnerCanvasGroupShow = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupShow", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = not v75 or false, 
            Parent = v152.PageViewInnerFrame
        });
        v152.InnerCanvasGroupHide = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupHide", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = not v75 or false, 
            Parent = v152.PageViewInnerFrame
        });
        if v29.UseStickyBar() then
            v152.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v152.PageView
            });
            v152.PageViewInnerFrame.AutomaticSize = Enum.AutomaticSize.Y;
            v152.PageViewInnerFrame.ClipsDescendants = false;
        end;
        if l_UserInputService_0.MouseEnabled then
            v152.PageViewClipper.Size = UDim2.new(v152.HubBar.Size.X.Scale, v152.HubBar.Size.X.Offset, 0.5, -(v152.HubBar.Position.Y.Offset - v152.HubBar.Size.Y.Offset));
        end;
        v152.BottomButtonFrame = l_Create_0("Frame")({
            Name = "BottomButtonFrame", 
            Size = v152.HubBar.Size, 
            Position = UDim2.new(0.5, -v152.HubBar.Size.X.Offset / 2, 1 - v152.HubBar.Position.Y.Scale - v152.HubBar.Size.Y.Scale, -v152.HubBar.Position.Y.Offset - v152.HubBar.Size.Y.Offset), 
            ZIndex = v152.Shield.ZIndex + 1, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Parent = l_MenuContainer_0
        });
        if v29.UIBloxThemeEnabled then
            v152.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80);
            v152.MenuListLayout = l_Create_0("UIListLayout")({
                Padding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v152.BottomButtonFrame
            });
        end;
        local function v413() --[[ Line: 1996 ]]
            -- upvalues: v55 (ref), v152 (ref), v171 (ref), v65 (ref), v119 (ref)
            if v55 and v152:GetVisibility() == false then
                return;
            else
                v152:AddToMenuStack(v152.Pages.CurrentPage);
                v152.HubBar.Visible = false;
                v171();
                if v65() and v152.leaveGameUpsellProp ~= v119.PHONE_UPSELL_VALUE_PROP.None then
                    v152:SwitchToPage(v152.LeaveGameUpsellPage, nil, 1, true);
                    return;
                else
                    v152:SwitchToPage(v152.LeaveGamePage, nil, 1, true);
                    return;
                end;
            end;
        end;
        local function _(v414) --[[ Line: 2011 ]]
            -- upvalues: v325 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v29 (ref)
            v325(false);
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = if v29.UIBloxThemeEnabled then v414 else l_Constants_0.AnalyticsResumeButtonSource
            });
        end;
        if v29.UIBloxThemeEnabled then
            v152.Shield.Activated:Connect(function() --[[ Line: 2022 ]]
                -- upvalues: l_Constants_0 (ref), v325 (ref), l_RbxAnalyticsService_0 (ref), v29 (ref)
                local l_AnalyticsResumeShieldSource_0 = l_Constants_0.AnalyticsResumeShieldSource;
                v325(false);
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                    source = if v29.UIBloxThemeEnabled then l_AnalyticsResumeShieldSource_0 else l_Constants_0.AnalyticsResumeButtonSource
                });
            end);
        end;
        if v70 then
            v152.DarkenBackground.Activated:Connect(function() --[[ Line: 2029 ]]
                -- upvalues: v29 (ref), l_Constants_0 (ref), v325 (ref), l_RbxAnalyticsService_0 (ref), l_InExperienceAppChatModal_0 (ref)
                if v29.UIBloxThemeEnabled then
                    local l_AnalyticsResumeShieldSource_1 = l_Constants_0.AnalyticsResumeShieldSource;
                    v325(false);
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                        source = if v29.UIBloxThemeEnabled then l_AnalyticsResumeShieldSource_1 else l_Constants_0.AnalyticsResumeButtonSource
                    });
                end;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end);
        end;
        if l_InExperienceCapabilities_0.canNavigateHome then
            if v29.UseIconButtons then
                v217("LeaveGame", "icons/actions/leave", "Leave", v265, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, v9 and -160 or -130, 0.5, -25), v413, {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                });
            else
                v237("LeaveGame", "Leave", v265, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, v9 and -160 or -130, 0.5, -25), v413, {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                }, v413);
            end;
        end;
        local function v418() --[[ Line: 2054 ]]
            -- upvalues: v314 (ref), v152 (ref), v171 (ref)
            if v314 then
                v152:AddToMenuStack(v152.Pages.CurrentPage);
                v152.HubBar.Visible = false;
                v171();
                v152:SwitchToPage(v152.ResetCharacterPage, nil, 1, true);
            end;
        end;
        local v419 = if v72 then v186:Format(l_Constants_0.RespawnLocalizedKey) else "Reset Character";
        if v29.UseIconButtons then
            v217("ResetCharacter", "icons/actions/respawn", v419, v266, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, v9 and -550 or -400, 0.5, -25), v418, {
                Enum.KeyCode.R, 
                Enum.KeyCode.ButtonY
            });
        else
            v237("ResetCharacter", v419, v266, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, v9 and -550 or -400, 0.5, -25), v418, {
                Enum.KeyCode.R, 
                Enum.KeyCode.ButtonY
            }, v418);
        end;
        local function v421() --[[ Line: 2077 ]]
            -- upvalues: l_Constants_0 (ref), v325 (ref), l_RbxAnalyticsService_0 (ref), v29 (ref)
            local l_AnalyticsResumeButtonSource_0 = l_Constants_0.AnalyticsResumeButtonSource;
            v325(false);
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = if v29.UIBloxThemeEnabled then l_AnalyticsResumeButtonSource_0 else l_Constants_0.AnalyticsResumeButtonSource
            });
        end;
        local function v423() --[[ Line: 2080 ]]
            -- upvalues: l_Constants_0 (ref), v325 (ref), l_RbxAnalyticsService_0 (ref), v29 (ref)
            local l_AnalyticsResumeGamepadSource_0 = l_Constants_0.AnalyticsResumeGamepadSource;
            v325(false);
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = if v29.UIBloxThemeEnabled then l_AnalyticsResumeGamepadSource_0 else l_Constants_0.AnalyticsResumeButtonSource
            });
        end;
        v237("Resume", "Resume", v264, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, v9 and 200 or 140, 0.5, -25), v421, {
            Enum.KeyCode.ButtonB, 
            Enum.KeyCode.ButtonStart
        }, v423);
        if v29.UIBloxThemeEnabled or l_isSubjectToDesktopPolicies_0() then
            if v29.UIBloxThemeEnabled then
                v152.HubBarContainer = l_Create_0("ImageLabel")({
                    Name = "HubBarContainer", 
                    ZIndex = v152.Shield.ZIndex + 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v29.color("HubBarContainer"), 
                    BackgroundTransparency = v29.transparency("HubBarContainerTransparency"), 
                    Size = if v29.ShowHomeButton then UDim2.new(1, -70, 1, 0) else UDim2.new(1, 0, 1, 0), 
                    Position = if v29.ShowHomeButton then UDim2.new(0, 70, 0, 0) else UDim2.new(0, 0, 0, 0), 
                    Parent = v152.HubBar
                });
            else
                v152.HubBarContainer = l_Create_0("ImageLabel")({
                    Name = "HubBarContainer", 
                    ZIndex = v152.Shield.ZIndex + 2, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(4, 4, 6, 6), 
                    Size = UDim2.new(1, -70, 1, 0), 
                    Position = UDim2.new(0, 70, 0, 0), 
                    Parent = v152.HubBar
                });
            end;
            v152.HubBar.ImageTransparency = 1;
            v152.HubBarListLayout.Parent = v152.HubBarContainer;
            if v29.ShowHomeButton then
                if v29.UIBloxThemeEnabled then
                    v152.HubBarHomeButton = l_Create_0("ImageButton")({
                        Name = "HubBarHomeButton", 
                        ZIndex = v152.Shield.ZIndex + 2, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        BackgroundColor3 = v29.color("HubBarHomeButton"), 
                        BackgroundTransparency = v29.transparency("HubBarHomeButtonTransparency"), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Parent = v152.HubBar
                    });
                    l_Create_0("UICorner")({
                        CornerRadius = v29.DefaultCornerRadius, 
                        Parent = v152.HubBarHomeButton
                    });
                else
                    v152.HubBarHomeButton = l_Create_0("ImageButton")({
                        Name = "HubBarHomeButton", 
                        ZIndex = v152.Shield.ZIndex + 2, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(4, 4, 6, 6), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Parent = v152.HubBar
                    });
                end;
                v152.HubBarHomeButtonAspectRatio = l_Create_0("UIAspectRatioConstraint")({
                    AspectRatio = 1, 
                    DominantAxis = Enum.DominantAxis.Height, 
                    Parent = v152.HubBarHomeButton
                });
                v152.HubBarHomeButtonIcon = l_Create_0("ImageLabel")({
                    Name = "HubBarHomeButtonIcon", 
                    ZIndex = v152.Shield.ZIndex + 3, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png", 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Position = UDim2.new(0.16, 0, 0.18, 0), 
                    Parent = v152.HubBarHomeButton
                });
                v152.HubBarHomeButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2171 ]]
                    -- upvalues: v152 (ref)
                    local v424 = v152.HubBarHomeButton.AbsoluteSize.X + 10;
                    v152.HubBarContainer.Size = UDim2.new(1, -v424, 1, 0);
                    v152.HubBarContainer.Position = UDim2.new(0, v424, 0, 0);
                end);
                v152.HubBarHomeButton.MouseEnter:Connect(function() --[[ Line: 2176 ]]
                    -- upvalues: v29 (ref), v152 (ref)
                    if v29.UIBloxThemeEnabled then
                        v152.HubBarHomeButton.BackgroundColor3 = v29.color("HubBarHomeButtonHover");
                        v152.HubBarHomeButton.BackgroundTransparency = v29.transparency("HubBarHomeButtonTransparencyHover");
                        return;
                    else
                        v152.HubBarHomeButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection@2x.png";
                        return;
                    end;
                end);
                v152.HubBarHomeButton.MouseLeave:Connect(function() --[[ Line: 2184 ]]
                    -- upvalues: v29 (ref), v152 (ref)
                    if v29.UIBloxThemeEnabled then
                        v152.HubBarHomeButton.BackgroundColor3 = v29.color("HubBarHomeButton");
                        v152.HubBarHomeButton.BackgroundTransparency = v29.transparency("HubBarHomeButtonTransparency");
                        return;
                    else
                        v152.HubBarHomeButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png";
                        return;
                    end;
                end);
                local function v425() --[[ Line: 2193 ]]
                    -- upvalues: v152 (ref), v171 (ref)
                    v152:AddToMenuStack(v152.Pages.CurrentPage);
                    v152.HubBar.Visible = false;
                    v171();
                    v152:SwitchToPage(v152.LeaveGameToHomePage, nil, 1, true);
                end;
                v152.HubBarHomeButton.Activated:Connect(v425);
            end;
        end;
        if l_isSubjectToDesktopPolicies_0() then
            v152.FullScreenTitleBar = v104.mount({}, v152.Shield, "FullScreenTitleBar");
        end;
        local function v426() --[[ Line: 2209 ]] --[[ Name: cameraViewportChanged ]]
            -- upvalues: v56 (ref), v29 (ref), v13 (ref)
            if v56 then
                v29.viewportResized();
            end;
            v13:FireOnResized();
        end;
        local v427 = nil;
        local function v429(v428) --[[ Line: 2217 ]] --[[ Name: onWorkspaceChanged ]]
            -- upvalues: v56 (ref), v29 (ref), v13 (ref), v427 (ref), v426 (copy)
            if v428 == "CurrentCamera" then
                if v56 then
                    v29.viewportResized();
                end;
                v13:FireOnResized();
                if v427 then
                    v427:disconnect();
                end;
                v427 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v426);
            end;
        end;
        if v56 then
            v29.viewportResized();
        end;
        v13:FireOnResized();
        if v427 then
            v427:disconnect();
        end;
        v427 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v426);
        if v44() and v277 then
            v275();
        end;
        workspace.Changed:Connect(v429);
    end;
    local function v437() --[[ Line: 2232 ]] --[[ Name: resizeBottomBarButtons ]]
        -- upvalues: v152 (copy)
        local l_X_0 = v152.BottomButtonFrame.AbsoluteSize.X;
        local v432 = #v152.BottomBarButtons;
        if v432 == 4 then
            l_X_0 = l_X_0 - 48 - 12;
            v432 = v432 - 1;
        end;
        local v433 = (l_X_0 - (v432 - 1) * 12 - 12) / v432;
        for v434 = 1, #v152.BottomBarButtons do
            local v435 = v152.BottomBarButtons[v434];
            local v436 = v435[1];
            if v436 ~= "MuteButtonButton" then
                v152[v436].Size = UDim2.fromOffset(v433, v152[v435[1]].Size.Y.Offset);
            end;
        end;
    end;
    local function v456() --[[ Line: 2252 ]] --[[ Name: onScreenSizeChanged ]]
        -- upvalues: v152 (copy), v29 (ref), l_RobloxGui_0 (ref), v13 (ref), v9 (ref), l_game_EngineFeature_1 (ref), v48 (ref), v10 (ref), v327 (copy), l_RunService_0 (ref), v160 (copy), v165 (copy), v171 (copy), v437 (copy)
        local function _() --[[ Line: 2253 ]] --[[ Name: getBackBarVisible ]]
            -- upvalues: v152 (ref)
            if not v152.BackBarRef:getValue() then
                return false;
            else
                return v152.BackBarRef:getValue().Visible;
            end;
        end;
        local function _() --[[ Line: 2260 ]] --[[ Name: getFrontBarVisible ]]
            -- upvalues: v152 (ref)
            if not v152.FrontBarRef:getValue() then
                return false;
            else
                return v152.FrontBarRef:getValue().Visible;
            end;
        end;
        local v440 = v29.MenuContainerPosition();
        local v441 = 600;
        local l_y_0 = l_RobloxGui_0.AbsoluteSize.y;
        local v443 = 0.050000000000000044 * l_y_0;
        local v444 = v13:IsPortrait();
        if v9 then
            v441 = 800;
            v443 = 0.07 * l_y_0;
        elseif v13:IsSmallTouchScreen() then
            v443 = math.min(10, 0.010000000000000009 * l_y_0);
        end;
        v152.MenuContainer.Size = v440.Size;
        if v29.UIBloxThemeEnabled then
            v152.MenuContainer.Position = v440.Position;
            v152.MenuContainer.AnchorPoint = v440.AnchorPoint;
        end;
        local l_Offset_0 = v152.HubBar.Size.Y.Offset;
        local v446 = v443 * 2 + l_Offset_0 * 2;
        local v447 = 0;
        if not not v152.BackBarRef:getValue() and v152.BackBarRef:getValue().Visible and v152.BackBarRef:getValue() then
            v447 = v152.BackBarRef:getValue().Size.Y.Offset;
        end;
        if l_game_EngineFeature_1 and not not v152.FrontBarRef:getValue() and v152.FrontBarRef:getValue().Visible and v152.FrontBarRef:getValue() then
            v447 = v447 + v152.FrontBarRef:getValue().Size.Y.Offset;
        end;
        local l_MenuContainer_1 = v152.MenuContainer;
        if v29.UIBloxThemeEnabled then
            l_MenuContainer_1 = nil;
            if v29.EnableVerticalBottomBar then
                v152.VerticalMenu.Visible = false;
                v152.VerticalMenuDivider.Visible = false;
                for v449 = 1, #v152.BottomBarButtonsComponents do
                    v152.BottomBarButtonsComponents[v449].Parent = v152.BottomButtonFrame;
                end;
            end;
        end;
        if v444 then
            v152.MenuAspectRatio.Parent = nil;
            v152.HubBar.Position = UDim2.new(0.5, 0, 0, 10);
            if v29.UIBloxThemeEnabled then
                v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 40, 0, 54);
            else
                v152.MenuContainer.Size = UDim2.new(1, 0, 1, 0);
                v152.HubBar.Size = UDim2.new(1, -20, 0, 40);
            end;
        elseif v9 then
            v152.HubBar.Size = UDim2.new(0, 1200, 0, 100);
            v152.MenuAspectRatio.Parent = l_MenuContainer_1;
        elseif v13:IsSmallTouchScreen() then
            if v29.UIBloxThemeEnabled then
                if v29.EnableVerticalBottomBar then
                    v152.VerticalMenu.Visible = true;
                    v152.VerticalMenuDivider.Visible = true;
                    for v450 = 1, #v152.BottomBarButtonsComponents do
                        v152.BottomBarButtonsComponents[v450].Parent = v152.VerticalMenu;
                    end;
                    v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v29.VerticalMenuWidth, 0, 52);
                else
                    v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                end;
            else
                v152.HubBar.Size = UDim2.new(1, -10, 0, 40);
            end;
            v152.MenuAspectRatio.Parent = nil;
        else
            v152.HubBar.Size = UDim2.new(0, 800, 0, 60);
            v152.MenuAspectRatio.Parent = l_MenuContainer_1;
            if v48 then
                if v152.permissionsButtonsRoot then
                    v10.unmount(v152.permissionsButtonsRoot);
                end;
                v152.permissionsButtonsRoot = v10.mount(v327(false), v152.Shield, "PermissionsButtons");
            end;
        end;
        if v29.UIBloxThemeEnabled then
            l_Offset_0 = if not v29.AlwaysShowBottomBar() then v152.HubBar.Size.Y.Offset else v152.HubBar.Size.Y.Offset + v152.BottomButtonFrame.Size.Y.Offset;
            v446 = v443 * 2 + (v152.Pages.CurrentPage.DisableTopPadding and 0 or l_Offset_0);
            v447 = if not not v152.BackBarRef:getValue() and v152.BackBarRef:getValue().Visible and v152.BackBarRef:getValue() then v152.BackBarRef:getValue().Size.Y.Offset else 0;
            if l_game_EngineFeature_1 and not not v152.FrontBarRef:getValue() and v152.FrontBarRef:getValue().Visible and v152.FrontBarRef:getValue() then
                v447 = v447 + v152.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        l_RunService_0.Heartbeat:wait();
        if v160() then
            v165();
        else
            v171();
        end;
        local v451 = l_y_0 - v446 - v447;
        local v452 = nil;
        if not v444 then
            if v441 < v451 then
                v452 = v441;
                v152.HubBar.Position = UDim2.new(v152.HubBar.Position.X.Scale, v152.HubBar.Position.X.Offset, 0.5, -v441 / 2 - v152.HubBar.Size.Y.Offset);
                if v152.BottomButtonFrame then
                    v152.BottomButtonFrame.Position = UDim2.new(v152.BottomButtonFrame.Position.X.Scale, v152.BottomButtonFrame.Position.X.Offset, 0.5, v441 / 2);
                end;
            elseif v451 < 150 then
                v452 = 150;
                v152.HubBar.Position = UDim2.new(v152.HubBar.Position.X.Scale, v152.HubBar.Position.X.Offset, 0.5, -75 - v152.HubBar.Size.Y.Offset);
                if v152.BottomButtonFrame then
                    v152.BottomButtonFrame.Position = UDim2.new(v152.BottomButtonFrame.Position.X.Scale, v152.BottomButtonFrame.Position.X.Offset, 0.5, 75);
                end;
            else
                v452 = v451;
                v152.HubBar.Position = UDim2.new(v152.HubBar.Position.X.Scale, v152.HubBar.Position.X.Offset, 0, v443);
                if v152.BottomButtonFrame then
                    v152.BottomButtonFrame.Position = UDim2.new(v152.BottomButtonFrame.Position.X.Scale, v152.BottomButtonFrame.Position.X.Offset, 1, -(v443 + l_Offset_0));
                end;
            end;
        else
            v452 = v451;
        end;
        local v453 = nil;
        if not v9 then
            if v13:IsSmallTouchScreen() then
                local v454 = (not not v29.UIBloxThemeEnabled or not not v152.BackBarRef:getValue() and v152.BackBarRef:getValue().Visible) and 0 or 44;
                local v455 = 0;
                v455 = v29.UIBloxThemeEnabled and 0 or l_game_EngineFeature_1 and not not v152.FrontBarRef:getValue() and v152.FrontBarRef:getValue().Visible and 0 or 44;
                v453 = UDim2.new(0, v152.HubBar.AbsoluteSize.X, 0, v452 + v454 + v455);
            else
                v453 = UDim2.new(0, v152.HubBar.AbsoluteSize.X, 0, v452);
            end;
        else
            v453 = UDim2.new(0, v152.HubBar.AbsoluteSize.X, 0, v452);
        end;
        v152.PageViewClipper.Size = v453;
        v152.defaultPageViewClipperSize = v453;
        if not v444 then
            v152.PageViewClipper.Position = UDim2.new(v152.PageViewClipper.Position.X.Scale, v152.PageViewClipper.Position.X.Offset, 0.5, -v452 / 2);
        else
            v152.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v152.HubBar.Position.Y.Offset + v152.HubBar.AbsoluteSize.Y);
        end;
        if v152.VerticalMenu then
            v152.VerticalMenuDivider.Size = UDim2.new(0, 1, 0, v452 + v152.HubBar.Size.Y.Offset);
            v152.VerticalMenu.Size = UDim2.new(0, v29.VerticalMenuWidth, 0, v452 + v152.HubBar.Size.Y.Offset);
        end;
        if v29.UseStickyBar() then
            v152.resetPageViewClipperSize = true;
            v152.showStickyBottomBar = true;
            if v152.pageViewScrollChangeCon then
                v152.pageViewScrollChangeCon:disconnect();
                v152.pageViewScrollChangeCon = nil;
            end;
            if not v444 then
                v152.pageViewScrollChangeCon = v152.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v152.handelPageViewScroll);
            end;
            v437();
        end;
    end;
    local function _() --[[ Line: 2507 ]] --[[ Name: onPreferredTransparencyChanged ]]
        -- upvalues: v152 (copy), v29 (ref), l_GuiService_0 (ref)
        v152.MenuContainer.BackgroundTransparency = v29.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
    end;
    local function v461(v458, v459, _) --[[ Line: 2511 ]] --[[ Name: toggleQuickProfilerFromHotkey ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            return;
        else
            if v458 == "Show Quick Profiler" and v459 and v459 == Enum.UserInputState.Begin then
                l_GameSettings_0.PerformanceStatsVisible = not l_GameSettings_0.PerformanceStatsVisible;
            end;
            return;
        end;
    end;
    local function v465(v462, v463, _) --[[ Line: 2527 ]] --[[ Name: toggleDevConsole ]]
        -- upvalues: v98 (ref)
        if v462 == "Open Dev Console" and v463 and v463 == Enum.UserInputState.Begin then
            v98:ToggleVisibility();
        end;
    end;
    local l_v9_0 = v9;
    local v467 = {
        [Enum.UserInputType.Gamepad1] = true, 
        [Enum.UserInputType.Gamepad2] = true, 
        [Enum.UserInputType.Gamepad3] = true, 
        [Enum.UserInputType.Gamepad4] = true, 
        [Enum.KeyCode.Left] = true, 
        [Enum.KeyCode.Right] = true, 
        [Enum.KeyCode.Up] = true, 
        [Enum.KeyCode.Down] = true, 
        [Enum.KeyCode.Tab] = true, 
        [Enum.UserInputType.Touch] = false, 
        [Enum.UserInputType.MouseButton1] = false, 
        [Enum.UserInputType.MouseButton2] = false
    };
    l_UserInputService_0.InputBegan:connect(function(v468) --[[ Line: 2553 ]]
        -- upvalues: v467 (copy), l_v9_0 (ref)
        if v468.UserInputType and v467[v468.UserInputType] ~= nil then
            l_v9_0 = v467[v468.UserInputType];
            return;
        else
            if v468.KeyCode and v467[v468.KeyCode] then
                l_v9_0 = v467[v468.KeyCode];
            end;
            return;
        end;
    end);
    l_UserInputService_0.InputChanged:connect(function(v469) --[[ Line: 2560 ]]
        -- upvalues: l_v9_0 (ref)
        if v469.KeyCode == Enum.KeyCode.Thumbstick1 or v469.KeyCode == Enum.KeyCode.Thumbstick2 then
            if v469.Position.magnitude >= 0.25 then
                l_v9_0 = true;
                return;
            end;
        elseif v469.UserInputType == Enum.UserInputType.Touch or v469.UserInputType == Enum.UserInputType.MouseMovement then
            l_v9_0 = false;
        end;
    end);
    local v470 = nil;
    local function v478(v471, v472) --[[ Line: 2572 ]]
        -- upvalues: v470 (ref), v152 (copy)
        local v473 = v470(v152.Pages.CurrentPage);
        if v473 < 0 then
            return;
        else
            local v474 = v473 + v471;
            if v472 then
                if #v152.TabHeaders < v474 then
                    v474 = 1;
                elseif v474 < 1 then
                    v474 = #v152.TabHeaders;
                end;
            end;
            local v475 = v152.TabHeaders[v474];
            if v475 then
                for v476, _ in pairs(v152.Pages.PageTable) do
                    if v476:GetTabHeader() == v475 then
                        v152:SwitchToPage(v476, true, v471);
                        return;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v483(_, v480, v481) --[[ Line: 2596 ]]
        -- upvalues: v478 (copy)
        if v480 ~= Enum.UserInputState.Begin then
            return;
        else
            local v482 = 0;
            if v481.KeyCode == Enum.KeyCode.ButtonR1 then
                v482 = 1;
            elseif v481.KeyCode == Enum.KeyCode.ButtonL1 then
                v482 = -1;
            end;
            v478(v482, true);
            return;
        end;
    end;
    local function v486(v484) --[[ Line: 2609 ]]
        -- upvalues: l_UserInputService_0 (ref), v478 (copy)
        if v484.KeyCode == Enum.KeyCode.Tab then
            local v485 = 0;
            v485 = (not not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1;
            v478(v485, true);
        end;
    end;
    local function v491(_, v488, v489) --[[ Line: 2622 ]]
        -- upvalues: v152 (copy)
        if v488 ~= Enum.UserInputState.Begin then
            return;
        else
            local v490 = 0;
            if v489.KeyCode == Enum.KeyCode.PageUp then
                v490 = -100;
            elseif v489.KeyCode == Enum.KeyCode.PageDown then
                v490 = 100;
            end;
            v152:ScrollPixels(v490);
            return;
        end;
    end;
    v430();
    if v121 then
        v313();
    end;
    v470 = function(v492) --[[ Line: 2642 ]] --[[ Name: GetHeaderPosition ]]
        -- upvalues: v152 (copy)
        local l_v492_TabHeader_0 = v492:GetTabHeader();
        if not l_v492_TabHeader_0 then
            return -1;
        else
            for v494, v495 in pairs(v152.TabHeaders) do
                if v495 == l_v492_TabHeader_0 then
                    return v494;
                end;
            end;
            return -1;
        end;
    end;
    local v496 = nil;
    v496 = function(v497, v498) --[[ Line: 2656 ]]
        -- upvalues: v496 (ref)
        if v498:IsA("GuiObject") then
            v498.ZIndex = v497;
            local l_v498_Children_0 = v498:GetChildren();
            for v500 = 1, #l_v498_Children_0 do
                v496(v497, l_v498_Children_0[v500]);
            end;
        end;
    end;
    local function v505(v501, v502) --[[ Line: 2666 ]] --[[ Name: AddHeader ]]
        -- upvalues: v152 (copy), v496 (ref), v29 (ref), l_isSubjectToDesktopPolicies_0 (ref)
        if not v501 then
            return;
        else
            table.insert(v152.TabHeaders, v501);
            v502.TabPosition = #v152.TabHeaders;
            local v503 = 1 / #v152.TabHeaders;
            for v504 = 1, #v152.TabHeaders do
                v152.TabHeaders[v504].Size = UDim2.new(v503, 0, 1, 0);
            end;
            v496(3, v501);
            if v29.UIBloxThemeEnabled or l_isSubjectToDesktopPolicies_0() then
                v501.Parent = v152.HubBarContainer;
                return;
            else
                v501.Parent = v152.HubBar;
                return;
            end;
        end;
    end;
    local function v511(v506) --[[ Line: 2686 ]] --[[ Name: RemoveHeader ]]
        -- upvalues: v152 (copy)
        local v507 = nil;
        for v508 = 1, #v152.TabHeaders do
            if v152.TabHeaders[v508] == v506 then
                v507 = v508;
                table.remove(v152.TabHeaders, v508);
                break;
            end;
        end;
        if v507 then
            for v509 = v507, #v152.TabHeaders do
                local v510 = v152.TabHeaders[v509];
                v510.Position = UDim2.new(v510.Position.X.Scale, v510.Position.X.Offset - v506.AbsoluteSize.X, v510.Position.Y.Scale, v510.Position.Y.Offset);
            end;
        end;
        v506.Parent = nil;
    end;
    v152.AddPage = function(_, v513) --[[ Line: 2709 ]] --[[ Name: AddPage ]]
        -- upvalues: v152 (copy), v505 (copy)
        v152.Pages.PageTable[v513] = true;
        v505(v513:GetTabHeader(), v513);
        v513.Page.Position = UDim2.new(v513.TabPosition - 1, 0, 0, 0);
    end;
    v152.RemovePage = function(_, v515) --[[ Line: 2715 ]] --[[ Name: RemovePage ]]
        -- upvalues: v152 (copy), v511 (copy)
        v152.Pages.PageTable[v515] = nil;
        v511(v515:GetTabHeader());
    end;
    v152.bottomBarAnimating = false;
    v152.defaultPageViewClipperSize = v152.PageViewClipper.Size;
    v152.showStickyBottomBar = true;
    v152.resetPageViewClipperSize = false;
    animateBottomBarComplete = function() --[[ Line: 2725 ]] --[[ Name: animateBottomBarComplete ]]
        -- upvalues: v152 (copy)
        if v152.resetPageViewClipperSize then
            v152.PageViewClipper.Size = v152.defaultPageViewClipperSize;
            v152.resetPageViewClipperSize = false;
        end;
        v152.bottomBarAnimating = false;
    end;
    v152.animateInBottomBar = function(_) --[[ Line: 2734 ]] --[[ Name: animateInBottomBar ]]
        -- upvalues: v152 (copy)
        if v152.bottomBarAnimating or v152.showStickyBottomBar == true then
            return;
        else
            v152.bottomBarAnimating = true;
            v152.showStickyBottomBar = true;
            v152.resetPageViewClipperSize = false;
            local v517 = UDim2.new(v152.defaultPageViewClipperSize.X.Scale, v152.defaultPageViewClipperSize.X.Offset, v152.defaultPageViewClipperSize.Y.Scale, v152.defaultPageViewClipperSize.Y.Offset);
            v152.PageViewClipper:TweenSize(v517, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return;
        end;
    end;
    v152.animateOutBottomBar = function(_) --[[ Line: 2762 ]] --[[ Name: animateOutBottomBar ]]
        -- upvalues: v152 (copy)
        if v152.bottomBarAnimating or v152.showStickyBottomBar == false then
            return;
        else
            v152.bottomBarAnimating = true;
            v152.showStickyBottomBar = false;
            v152.resetPageViewClipperSize = false;
            local v519 = UDim2.new(v152.defaultPageViewClipperSize.X.Scale, v152.defaultPageViewClipperSize.X.Offset, v152.defaultPageViewClipperSize.Y.Scale, v152.defaultPageViewClipperSize.Y.Offset + 80);
            v152.PageViewClipper:TweenSize(v519, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return;
        end;
    end;
    v152.HideBar = function(_) --[[ Line: 2790 ]] --[[ Name: HideBar ]]
        -- upvalues: v152 (copy), v171 (copy)
        v152.HubBar.Visible = false;
        v152.PageViewClipper.Visible = false;
        if v152.BottomButtonFrame then
            v171();
        end;
    end;
    v152.ShowBar = function(_) --[[ Line: 2798 ]] --[[ Name: ShowBar ]]
        -- upvalues: v152 (copy), v160 (copy), v165 (copy)
        v152.HubBar.Visible = true;
        v152.PageViewClipper.Visible = true;
        if v152.BottomButtonFrame and v160() then
            v165();
        end;
    end;
    v152.ScrollPixels = function(_, v523) --[[ Line: 2806 ]] --[[ Name: ScrollPixels ]]
        -- upvalues: v152 (copy)
        local l_Y_1 = v152.PageView.CanvasPosition.Y;
        local v525 = v152.PageView.CanvasSize.Y.Offset - v152.PageViewClipper.AbsoluteSize.y;
        local v526 = math.max(0, (math.min(l_Y_1 + v523, v525)));
        v152.PageView.CanvasPosition = Vector2.new(0, v526);
    end;
    v152.ScrollToFrame = function(_, v528, v529) --[[ Line: 2814 ]] --[[ Name: ScrollToFrame ]]
        -- upvalues: l_v9_0 (ref), v152 (copy)
        if l_v9_0 or v529 then
            local v530 = v528.AbsolutePosition.y - v152.Pages.CurrentPage.Page.AbsolutePosition.y;
            local v531 = v530 + v528.AbsoluteSize.y;
            if v530 < v152.PageView.CanvasPosition.y then
                v152.PageView.CanvasPosition = Vector2.new(0, v530);
                return;
            elseif v531 - v152.PageView.CanvasPosition.y > v152.PageViewClipper.Size.Y.Offset then
                v152.PageView.CanvasPosition = Vector2.new(0, v531 - v152.PageViewClipper.Size.Y.Offset);
            end;
        end;
    end;
    v152.GetFirstPageWithTabHeader = function(_) --[[ Line: 2827 ]] --[[ Name: GetFirstPageWithTabHeader ]]
        -- upvalues: v152 (copy)
        local v533 = nil;
        for v534, _ in pairs(v152.Pages.PageTable) do
            if v534:GetTabHeader() ~= nil and v534.TabPosition == 1 then
                v533 = v534;
                break;
            end;
        end;
        if v533 == nil then
            error("No page with tab header found");
            return nil;
        else
            return v533;
        end;
    end;
    v152.InitInPage = function(_, v537) --[[ Line: 2846 ]] --[[ Name: InitInPage ]]
        -- upvalues: v152 (copy), v160 (copy), v165 (copy), v29 (ref), v154 (ref)
        local l_TabPosition_0 = v537.TabPosition;
        for v539, _ in pairs(v152.Pages.PageTable) do
            if v539 ~= v537 then
                v539:Hide(-1, l_TabPosition_0, true, nil, v152.PageViewInnerFrame);
            end;
        end;
        if v152.BottomButtonFrame then
            if v160(v537) then
                v165();
            else
                v152.BottomButtonFrame.Visible = false;
            end;
            v152.HubBar.Visible = (v537 or v152.Pages.CurrentPage).ShouldShowBottomBar == true;
        end;
        local v541 = v537.IsPageClipped == true;
        v152.PageViewClipper.ClipsDescendants = v541;
        v152.PageView.ClipsDescendants = v541;
        if v29.UseStickyBar() == false then
            v152.PageViewInnerFrame.ClipsDescendants = v541;
        end;
        v152.Pages.CurrentPage = v537;
        v152.Pages.CurrentPage.Active = true;
        v152.CurrentPageSignal:fire(v152.Pages.CurrentPage and v152.Pages.CurrentPage.Page.Name or nil);
        if v29.UseStickyBar() == false then
            local l_Size_0 = v152.Pages.CurrentPage:GetSize();
            v152.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_0.Y);
            v154 = v152.Pages.CurrentPage.Page.Changed:connect(function(v543) --[[ Line: 2883 ]]
                -- upvalues: v152 (ref)
                if v543 == "AbsoluteSize" then
                    local l_Size_1 = v152.Pages.CurrentPage:GetSize();
                    v152.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_1.Y);
                end;
            end);
        end;
    end;
    v152.SwitchToPage = function(_, v546, v547, v548, v549, _, v551) --[[ Line: 2892 ]] --[[ Name: SwitchToPage ]]
        -- upvalues: v152 (copy), v55 (ref), v122 (ref), v29 (ref), v13 (ref), v160 (copy), l_RobloxGui_0 (ref), v154 (ref), v165 (copy), v456 (copy), v47 (ref), v11 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v69 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref)
        if v152.Pages.PageTable[v546] == nil then
            return;
        elseif v55 and v152:GetVisibility() == false then
            return;
        else
            if v122 then
                if v546.Page.Name == "ReportAbuseMenuNewContainerPage" then
                    v152.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0);
                else
                    v152.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5);
                end;
            end;
            if v29.UIBloxThemeEnabled then
                local v552 = UDim.new(0, 0);
                local v553 = UDim.new(0, 0);
                local v554 = not (v13:IsPortrait() or v13:IsSmallTouchScreen()) or v29.AlwaysShowBottomBar();
                if v152.HubBar and not ((v546 or v152.Pages.CurrentPage).ShouldShowBottomBar == true) and not v546.DisableTopPadding then
                    v552 = UDim.new(0, v152.HubBar.AbsoluteSize.Y);
                end;
                if v152.BottomButtonFrame and v554 and not v160(v546) then
                    v553 = UDim.new(0, v152.BottomButtonFrame.AbsoluteSize.Y);
                end;
                local v555 = v29.HubPadding();
                v152.MenuContainerPadding.PaddingLeft = v555.PaddingLeft;
                v152.MenuContainerPadding.PaddingRight = v555.PaddingRight;
                v152.MenuContainerPadding.PaddingBottom = v555.PaddingBottom + v553;
                v152.MenuContainerPadding.PaddingTop = v555.PaddingTop + v552;
                local v556 = v29.MenuContainerPosition();
                v152.MenuContainer.Position = v556.Position;
                v152.MenuContainer.Size = v556.Size;
                v152.MenuContainer.AnchorPoint = v556.AnchorPoint;
                if v152.VerticalMenu and not v13:IsPortrait() and v13:IsSmallTouchScreen() then
                    local v557 = (v546 or v152.Pages.CurrentPage).ShouldShowBottomBar == true;
                    v152.VerticalMenu.Visible = v557;
                    v152.VerticalMenuDivider.Visible = v557;
                    if v557 then
                        v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v29.VerticalMenuWidth, 0, 52);
                    else
                        v152.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                    end;
                    local l_Size_2 = v152.PageViewClipper.Size;
                    v152.PageViewClipper.Size = UDim2.new(l_Size_2.X.Scale, v152.HubBar.Size.X.Offset, l_Size_2.Y.Scale, l_Size_2.Y.Offset);
                end;
            end;
            if v548 == nil and v152.Pages.CurrentPage and v152.Pages.CurrentPage.TabHeader and v546 and v546.TabHeader then
                v548 = v152.Pages.CurrentPage.TabHeader.AbsolutePosition.x < v546.TabHeader.AbsolutePosition.x and 1 or -1;
            end;
            if v548 == nil then
                v548 = 1;
            end;
            if v152.Pages.CurrentPage and v154 ~= nil then
                v154:disconnect();
                v152.Pages.CurrentPage.Active = false;
            end;
            local l_TabPosition_1 = v546.TabPosition;
            for v560, _ in pairs(v152.Pages.PageTable) do
                if v560 ~= v546 then
                    v560:Hide(-v548, l_TabPosition_1, v549, nil, v152.PageViewInnerFrame, v560 == v152.Pages.CurrentPage);
                end;
            end;
            if v152.BottomButtonFrame then
                if v160(v546) then
                    v165();
                else
                    v152.BottomButtonFrame.Visible = false;
                end;
                v152.HubBar.Visible = (v546 or v152.Pages.CurrentPage).ShouldShowBottomBar == true;
            end;
            local v562 = v546.IsPageClipped == true;
            v152.PageViewClipper.ClipsDescendants = v562;
            v152.PageView.ClipsDescendants = v562;
            v152.PageViewInnerFrame.ClipsDescendants = v562;
            v152.Pages.CurrentPage = v546;
            v152.Pages.CurrentPage:Display(v152.PageViewInnerFrame, v549);
            v152.Pages.CurrentPage.Active = true;
            v152.CurrentPageSignal:fire(v152.Pages.CurrentPage and v152.Pages.CurrentPage.Page.Name or nil);
            if v29.UseStickyBar() == false then
                local l_Size_3 = v152.Pages.CurrentPage:GetSize();
                v152.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_3.Y);
                v154 = v152.Pages.CurrentPage.Page.Changed:connect(function(v564) --[[ Line: 2996 ]]
                    -- upvalues: v152 (ref)
                    if v564 == "AbsoluteSize" then
                        local l_Size_4 = v152.Pages.CurrentPage:GetSize();
                        v152.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_4.Y);
                    end;
                end);
                if v152.MenuStack[#v152.MenuStack] ~= v152.Pages.CurrentPage and not v547 then
                    v152.MenuStack[#v152.MenuStack + 1] = v152.Pages.CurrentPage;
                end;
            end;
            if v546.DisableTopPadding then
                v456();
            end;
            local v566 = {
                universeid = tostring(game.GameId)
            };
            if v47() and v551 then
                v566 = v11.Dictionary.join(v566, v551);
            end;
            if v546 then
                if v152.GameSettingsPage == v546 then
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_GameSettings_tab", l_Constants_0.AnalyticsMenuActionName, v566);
                else
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_" .. v546.Page.Name .. "_tab", l_Constants_0.AnalyticsMenuActionName, v566);
                end;
                if v69 then
                    l_ExperienceMenuSessionManagerInstance_0:MenuSwitchToPage(v546.Page);
                    return;
                end;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_unknown_tab", l_Constants_0.AnalyticsMenuActionName, v566);
                if v69 then
                    l_ExperienceMenuSessionManagerInstance_0:CloseOpenedMenuTab();
                end;
            end;
            return;
        end;
    end;
    v152.SetActive = function(_, v568) --[[ Line: 3039 ]] --[[ Name: SetActive ]]
        -- upvalues: v152 (copy)
        v152.Active = v568;
        if v152.Pages.CurrentPage then
            v152.Pages.CurrentPage.Active = v568;
        end;
    end;
    clearMenuStack = function() --[[ Line: 3047 ]] --[[ Name: clearMenuStack ]]
        -- upvalues: v152 (copy)
        while v152.MenuStack and #v152.MenuStack > 0 do
            v152:PopMenu();
        end;
    end;
    setOverrideMouseIconBehavior = function() --[[ Line: 3053 ]] --[[ Name: setOverrideMouseIconBehavior ]]
        -- upvalues: v152 (copy), l_UserInputService_0 (ref), l_VRService_0 (ref), v17 (ref), v33 (ref)
        if not v152.Visible then
            return;
        elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 or l_VRService_0.VREnabled then
            v17.push(v33, Enum.OverrideMouseIconBehavior.ForceHide);
            return;
        else
            v17.push(v33, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    end;
    checkLeaveGameUpsell = function() --[[ Line: 3065 ]] --[[ Name: checkLeaveGameUpsell ]]
        -- upvalues: v65 (ref), v152 (copy), v119 (ref), l_default_0 (ref), v35 (ref)
        if not v65() then
            return;
        else
            if not v152.sessionStartTime then
                v152.sessionStartTime = os.time();
            end;
            if not v152.sessionStartTime then
                return;
            elseif not v152.checkedUpsell and v152.leaveGameUpsellProp == v119.PHONE_UPSELL_VALUE_PROP.None then
                v152.checkedUpsell = true;
                v152.leaveGameUpsellProp = l_default_0:FetchPhoneVerificationUpsell(v119.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v152.sessionStartTime, true);
                v152.LeaveGameUpsellPage:SetUpsellProp(v152.leaveGameUpsellProp);
                task.delay(v35, function() --[[ Line: 3086 ]]
                    -- upvalues: v152 (ref)
                    v152.checkedUpsell = false;
                end);
                return;
            else
                if v152.checkedUpsell then
                    local v569 = l_default_0:FetchPhoneVerificationUpsell(v119.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v152.sessionStartTime, false);
                    if v152.leaveGameUpsellProp ~= v569 then
                        v152.leaveGameUpsellProp = v569;
                        v152.LeaveGameUpsellPage:SetUpsellProp(v152.leaveGameUpsellProp);
                    end;
                end;
                return;
            end;
        end;
    end;
    local v570 = nil;
    if v70 then
        v570 = function(v571, v572) --[[ Line: 3101 ]]
            -- upvalues: v152 (copy), l_InExperienceAppChatModal_0 (ref), l_Constants_0 (ref), v29 (ref), l_TweenService_0 (ref)
            if not v152.DarkenBackground then
                return;
            elseif not v571 and v152.DarkenBackground.Visible and (l_InExperienceAppChatModal_0:getVisible() or v152.Visible) then
                return;
            else
                local v573 = 1;
                local l_Quart_0 = Enum.EasingStyle.Quart;
                local v575 = 0;
                v575 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                if v571 then
                    v573 = v29.transparency("DarkenBackground");
                    l_Quart_0 = Enum.EasingStyle.Quad;
                    v575 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                end;
                if v572 then
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                        v152.DarkenBackgroundTween = nil;
                    end;
                    v152.DarkenBackground.BackgroundTransparency = v573;
                else
                    local v576 = TweenInfo.new(v575, l_Quart_0, Enum.EasingDirection.Out);
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                    end;
                    v152.DarkenBackgroundTween = l_TweenService_0:Create(v152.DarkenBackground, v576, {
                        BackgroundTransparency = v573
                    });
                    v152.DarkenBackgroundTween:Play();
                end;
                v152.DarkenBackground.Visible = v571;
                return;
            end;
        end;
    end;
    v325 = function(v577, v578, v579, _, v581) --[[ Line: 3146 ]] --[[ Name: setVisibilityInternal ]]
        -- upvalues: v152 (copy), v39 (ref), v16 (ref), l_game_EngineFeature_1 (ref), l_RobloxGui_0 (ref), v70 (ref), v570 (ref), v456 (copy), l_GuiService_0 (ref), v29 (ref), v69 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), l_Constants_0 (ref), l_GameSettings_0 (ref), v57 (ref), v75 (ref), l_TweenService_0 (ref), l_ContextActionService_0 (ref), v483 (copy), v491 (copy), v160 (copy), v165 (copy), l_UserInputService_0 (ref), v486 (copy), v99 (ref), l_VRService_0 (ref), v17 (ref), v33 (ref), v171 (copy), l_getFFlagAppChatCoreUIConflictFix_0 (ref), v135 (ref), v100 (ref), l_GetFFlagEnableAppChatInExperience_0 (ref), l_InExperienceAppChatModal_0 (ref), v101 (ref), v71 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), l_RbxAnalyticsService_0 (ref), v65 (ref)
        v152.OpenStateChangedCount = v152.OpenStateChangedCount + 1;
        local v582 = v577 ~= v152.Visible;
        v152.Visible = v577;
        if v39 and v582 and not v577 then
            v16.menuClose();
        end;
        if v152.ResizedConnection then
            v152.ResizedConnection:disconnect();
            v152.ResizedConnection = nil;
        end;
        if v152.BackBarVisibleConnection then
            v152.BackBarVisibleConnection:disconnect();
            v152.BackBarVisibleConnection = nil;
        end;
        if l_game_EngineFeature_1 and v152.FrontBarVisibleConnection then
            v152.FrontBarVisibleConnection:disconnect();
            v152.FrontBarVisibleConnection = nil;
        end;
        if v152.PreferredTransparencyChangedConnection then
            v152.PreferredTransparencyChangedConnection:disconnect();
            v152.PreferredTransparencyChangedConnection = nil;
        end;
        v152.Modal.Visible = v152.Visible;
        if v152.TabConnection then
            v152.TabConnection:disconnect();
            v152.TabConnection = nil;
        end;
        local v583 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
        if v70 then
            v570(v152.Visible, v578);
        end;
        if v152.Visible then
            v152.ResizedConnection = l_RobloxGui_0.Changed:connect(function(v584) --[[ Line: 3190 ]]
                -- upvalues: v456 (ref)
                if v584 == "AbsoluteSize" then
                    v456();
                end;
            end);
            if v152.BackBarRef:getValue() then
                v152.BackBarVisibleConnection = v152.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3196 ]]
                    -- upvalues: v456 (ref)
                    v456();
                end);
            end;
            if l_game_EngineFeature_1 and v152.FrontBarRef:getValue() then
                v152.FrontBarVisibleConnection = v152.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3201 ]]
                    -- upvalues: v456 (ref)
                    v456();
                end);
            end;
            v456();
            v152.PreferredTransparencyChangedConnection = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ Line: 3207 ]]
                -- upvalues: v152 (ref), v29 (ref), l_GuiService_0 (ref)
                v152.MenuContainer.BackgroundTransparency = v29.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            end);
            v152.MenuContainer.BackgroundTransparency = v29.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            v152.SettingsShowSignal:fire(v152.Visible);
            l_GuiService_0:SetMenuIsOpen(true, "SettingsHub");
            if v69 then
                l_ExperienceMenuSessionManagerInstance_0:OpenExperienceMenu();
            end;
            v152.Shield.Visible = v152.Visible;
            if v29.UIBloxThemeEnabled then
                l_GuiService_0:CloseInspectMenu();
            end;
            if v578 or not v152.Shield:IsDescendantOf(game) then
                v152.Shield.Position = UDim2.new(0, 0, 0, 0);
                if not v70 and v152.DarkenBackground then
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                        v152.DarkenBackgroundTween = nil;
                    end;
                    v152.DarkenBackground.BackgroundTransparency = v29.transparency("DarkenBackground");
                end;
            else
                local v585 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                if l_GameSettings_0.ReducedMotion then
                    if v57 then
                        if v152.ReducedMotionOpenTween then
                            v152.ReducedMotionOpenTween:Cancel();
                            v152.ReducedMotionOpenTween = nil;
                        end;
                        if v152.ReducedMotionCloseTween then
                            v152.ReducedMotionCloseTween:Cancel();
                            v152.ReducedMotionCloseTween = nil;
                        end;
                    end;
                    v152.Shield.Parent = v152.CanvasGroup;
                    v152.CanvasGroup.GroupTransparency = 1;
                    if v75 then
                        v152.CanvasGroup.Visible = true;
                    end;
                    v152.Shield.Position = UDim2.new(0, 0, 0, 0);
                    local v586 = TweenInfo.new(0.25);
                    local v587 = {
                        GroupTransparency = 0
                    };
                    v152.ReducedMotionOpenTween = l_TweenService_0:Create(v152.CanvasGroup, v586, v587);
                    v152.ReducedMotionOpenTween:Play();
                    v152.ReducedMotionOpenTween.Completed:Connect(function(v588) --[[ Line: 3265 ]]
                        -- upvalues: v57 (ref), v152 (ref), v75 (ref)
                        if v57 then
                            if v588 == Enum.PlaybackState.Completed then
                                v152.Shield.Parent = v152.ClippingShield;
                                v152.ReducedMotionOpenTween = nil;
                            end;
                        else
                            v152.Shield.Parent = v152.ClippingShield;
                        end;
                        if v75 then
                            v152.CanvasGroup.Visible = false;
                        end;
                    end);
                    if v39 then
                        v16.menuOpenComplete();
                    end;
                else
                    v152.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v585, true, function() --[[ Line: 3290 ]]
                        -- upvalues: v39 (ref), v16 (ref)
                        if v39 then
                            v16.menuOpenComplete();
                        end;
                    end);
                end;
                if not v70 and v152.DarkenBackground then
                    local v589 = TweenInfo.new(v585, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                    end;
                    v152.DarkenBackgroundTween = l_TweenService_0:Create(v152.DarkenBackground, v589, {
                        BackgroundTransparency = v29.transparency("DarkenBackground")
                    });
                    v152.DarkenBackgroundTween:Play();
                end;
            end;
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubStopCharacter", function() --[[ Line: 3314 ]]

            end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubSwitchTab", v483, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
            l_ContextActionService_0:BindCoreAction("RbxSettingsScrollHotkey", v491, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown);
            if v160() then
                v165();
            end;
            v152.TabConnection = l_UserInputService_0.InputBegan:connect(v486);
            setOverrideMouseIconBehavior();
            v99 = l_UserInputService_0.LastInputTypeChanged:connect(setOverrideMouseIconBehavior);
            if l_UserInputService_0.MouseEnabled and not l_VRService_0.VREnabled then
                v17.push(v33, Enum.OverrideMouseIconBehavior.ForceShow);
            end;
            if v579 then
                v171();
                v152:SwitchToPage(v579, nil, 1, true);
            else
                v152:SwitchToPage(v152:GetFirstPageWithTabHeader(), nil, 1, true);
            end;
            v583:HideTemp("SettingsMenu", true);
            if l_getFFlagAppChatCoreUIConflictFix_0() then
                v135:HideTemp("SettingsMenu", true);
            elseif v135:GetVisibility() then
                v100 = true;
                v135:ToggleVisibility();
            end;
            if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatModal_0:getVisible() then
                v101 = true;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end;
            local v590 = require(l_RobloxGui_0.Modules.BackpackScript);
            if v590.IsOpen then
                v590:OpenClose();
            end;
            v152.GameSettingsPage:OpenSettingsPage();
        else
            v152.CurrentPageSignal:fire("");
            local v591 = if l_GetFFlagEnableAppChatInExperience_0() then v71 and v101 else false;
            if l_GetFFlagEnableAppChatInExperience_0() and v101 then
                v101 = false;
                if v71 then
                    l_InExperienceAppChatModal_0.default:setVisible(true);
                end;
            end;
            if v578 or v591 then
                v152.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                v152.Shield.Visible = v152.Visible;
                v152.SettingsShowSignal:fire(v152.Visible);
                l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                if v69 then
                    l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                end;
                if v39 then
                    v16.menuCloseComplete();
                end;
                if not v70 and v152.DarkenBackground then
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                        v152.DarkenBackgroundTween = nil;
                    end;
                    v152.DarkenBackground.BackgroundTransparency = 1;
                end;
            else
                local v592 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                local function _() --[[ Line: 3406 ]] --[[ Name: handleShieldClose ]]
                    -- upvalues: v152 (ref), l_GuiService_0 (ref), v69 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), v39 (ref), v16 (ref)
                    v152.SettingsShowSignal:fire(v152.Visible);
                    if not v152.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                        if v69 then
                            l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                        end;
                    end;
                    if v39 then
                        v16.menuCloseComplete();
                    end;
                end;
                if l_GameSettings_0.ReducedMotion then
                    if v57 then
                        if v152.ReducedMotionOpenTween then
                            v152.ReducedMotionOpenTween:Cancel();
                            v152.ReducedMotionOpenTween = nil;
                        end;
                        if v152.ReducedMotionCloseTween then
                            v152.ReducedMotionCloseTween:Cancel();
                            v152.ReducedMotionCloseTween = nil;
                        end;
                    end;
                    v152.Shield.Parent = v152.CanvasGroup;
                    if v75 then
                        v152.CanvasGroup.Visible = true;
                    end;
                    local v594 = TweenInfo.new(0.25);
                    local v595 = {
                        GroupTransparency = 1
                    };
                    v152.ReducedMotionCloseTween = l_TweenService_0:Create(v152.CanvasGroup, v594, v595);
                    v152.ReducedMotionCloseTween:Play();
                    v152.ReducedMotionCloseTween.Completed:Connect(function(v596) --[[ Line: 3442 ]]
                        -- upvalues: v57 (ref), v152 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), v75 (ref)
                        if v57 then
                            if v596 == Enum.PlaybackState.Completed then
                                v152.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                                v152.Shield.Visible = v152.Visible;
                                v152.Shield.Parent = v152.ClippingShield;
                                v152.ReducedMotionCloseTween = nil;
                            end;
                        else
                            v152.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                            v152.Shield.Visible = v152.Visible;
                            v152.Shield.Parent = v152.ClippingShield;
                        end;
                        if v75 then
                            v152.CanvasGroup.Visible = false;
                        end;
                    end);
                    v152.SettingsShowSignal:fire(v152.Visible);
                    if not v152.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                        if v69 then
                            l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                        end;
                    end;
                    if v39 then
                        v16.menuCloseComplete();
                    end;
                else
                    v152.Shield:TweenPosition(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v592, true, function() --[[ Line: 3470 ]]
                        -- upvalues: v152 (ref), l_GuiService_0 (ref), v69 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), v39 (ref), v16 (ref)
                        v152.Shield.Visible = v152.Visible;
                        v152.SettingsShowSignal:fire(v152.Visible);
                        if not v152.Visible then
                            l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                            if v69 then
                                l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                            end;
                        end;
                        if v39 then
                            v16.menuCloseComplete();
                        end;
                    end);
                end;
                if not v70 and v152.DarkenBackground then
                    local v597 = TweenInfo.new(v592, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                    if v152.DarkenBackgroundTween then
                        v152.DarkenBackgroundTween:Cancel();
                    end;
                    v152.DarkenBackgroundTween = l_TweenService_0:Create(v152.DarkenBackground, v597, {
                        BackgroundTransparency = 1
                    });
                    v152.DarkenBackgroundTween:Play();
                end;
            end;
            if v99 then
                v99:disconnect();
            end;
            if v29.UseStickyBar() and v152.pageViewScrollChangeCon then
                v152.pageViewScrollChangeCon:disconnect();
                v152.pageViewScrollChangeCon = nil;
            end;
            v583:HideTemp("SettingsMenu", false);
            if l_getFFlagAppChatCoreUIConflictFix_0() then
                v135:HideTemp("SettingsMenu", false);
            elseif v100 then
                v135:ToggleVisibility();
                v100 = false;
            end;
            if not l_VRService_0.VREnabled then
                v17.pop(v33);
            end;
            clearMenuStack();
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubSwitchTab");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubStopCharacter");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsScrollHotkey");
            v171(0.4);
            l_GuiService_0.SelectedCoreObject = nil;
            v152.GameSettingsPage:CloseSettingsPage();
            if v152.ShareGamePage then
                v152.ShareGamePage:ClearShareInviteLink(v152.ShareGameApp);
            end;
        end;
        if v582 then
            if v577 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuOpenName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v581
                });
                if v65() then
                    task.spawn(checkLeaveGameUpsell);
                    return;
                end;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuCloseName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v581
                });
            end;
        end;
    end;
    v152.SetVisibility = function(_, v599, v600, v601, v602, v603) --[[ Line: 3552 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v152 (copy), v325 (ref)
        if v152.Visible == v599 then
            return;
        else
            v325(v599, v600, v601, v602, v603);
            return;
        end;
    end;
    v152.SetBackgroundVisibility = function(_, v605, v606) --[[ Line: 3558 ]] --[[ Name: SetBackgroundVisibility ]]
        -- upvalues: v152 (copy), v570 (ref)
        if v152.DarkenBackground.Visible == v605 then
            return;
        else
            v570(v605, v606);
            return;
        end;
    end;
    v152.GetVisibility = function(_) --[[ Line: 3564 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v152 (copy)
        return v152.Visible;
    end;
    v152.ToggleVisibility = function(_, v609, v610) --[[ Line: 3568 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v325 (ref), v152 (copy)
        v325(not v152.Visible, nil, nil, v609, v610);
    end;
    v152.AddToMenuStack = function(_, v612) --[[ Line: 3572 ]] --[[ Name: AddToMenuStack ]]
        -- upvalues: v152 (copy)
        if v152.MenuStack[#v152.MenuStack] ~= v612 then
            v152.MenuStack[#v152.MenuStack + 1] = v612;
        end;
    end;
    v152.InviteToGame = function(_) --[[ Line: 3578 ]] --[[ Name: InviteToGame ]]
        -- upvalues: v52 (ref), v51 (ref), l_GetFStringGameInviteMenuLayer_0 (ref), v23 (ref), v113 (ref), v90 (ref), l_UserInputService_0 (ref), v89 (ref), v152 (copy), v112 (ref), v114 (ref)
        local v614 = false;
        if v52() and v51 then
            local v615 = l_GetFStringGameInviteMenuLayer_0();
            local l_v23_LayerData_0 = v23:GetLayerData(v615);
            v23:LogUserLayerExposure(v615);
            v614 = if l_v23_LayerData_0 then l_v23_LayerData_0.inExperienceGameInviteUXRefresh2023 == v113.UxRefresh or l_v23_LayerData_0.inExperienceGameInviteUXRefresh2023 == v113.InviteLimit else false;
        end;
        if game:GetEngineFeature("PlatformFriendsService") and v90 and v90:IsInviteFriendsEnabled() then
            v90:ShowInviteFriendsUI();
            return;
        else
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                if v89 then
                    v89:PopupGameInviteUI();
                    return;
                end;
            elseif v614 then
                v152:ToggleVisibility();
                v112:openModal({
                    trigger = v114.Triggers.GameMenu
                });
                return;
            else
                v152:AddToMenuStack(v152.Pages.CurrentPage);
                v152:SwitchToPage(v152.ShareGamePage, nil, 1, true);
            end;
            return;
        end;
    end;
    v152.PopMenu = function(_, _, v619) --[[ Line: 3605 ]] --[[ Name: PopMenu ]]
        -- upvalues: v152 (copy), l_BindableEvent_0 (copy)
        if v152.MenuStack and #v152.MenuStack > 0 then
            local v620 = v152.MenuStack[#v152.MenuStack];
            if type(v620) ~= "table" then
                l_BindableEvent_0:Fire(v620);
            end;
            table.remove(v152.MenuStack, #v152.MenuStack);
            v152:SwitchToPage(v152.MenuStack[#v152.MenuStack], true, 1, v619);
            if #v152.MenuStack == 0 then
                v152:SetVisibility(false);
                v152.Pages.CurrentPage:Hide(0, 0, nil, nil, v152.PageViewInnerFrame);
                return;
            end;
        else
            v152.MenuStack = {};
            l_BindableEvent_0:Fire();
            v152:ToggleVisibility();
        end;
    end;
    v152.ShowShield = function(_) --[[ Line: 3627 ]] --[[ Name: ShowShield ]]
        -- upvalues: l_UserInputService_0 (ref), v31 (ref), v152 (copy)
        local v622 = 0;
        v622 = l_UserInputService_0.VREnabled and 1 or v31;
        v152.Shield.BackgroundTransparency = v622;
    end;
    v152.HideShield = function(_) --[[ Line: 3636 ]] --[[ Name: HideShield ]]
        -- upvalues: v152 (copy)
        v152.Shield.BackgroundTransparency = 1;
    end;
    local v624 = nil;
    local v625 = nil;
    local function v631() --[[ Line: 3642 ]] --[[ Name: enableVR ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), v152 (copy), v624 (ref)
        local v626 = require(l_RobloxGui_0.Modules.VR.VRHub);
        local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
        local v628 = l_Panel3D_0.Get("SettingsMenu");
        v628:ResizeStuds(4, 4, 250);
        v628:SetType(l_Panel3D_0.Type.Standard);
        v628:SetVisible(false);
        v628:SetCanFade(false);
        v152.ClippingShield.Parent = v628:GetGUI();
        v152.Shield.Parent.ClipsDescendants = false;
        v152.VRShield.Visible = true;
        v152:HideShield();
        v624 = v152.SettingsShowSignal:connect(function(v629) --[[ Line: 3656 ]]
            -- upvalues: v628 (copy), v626 (copy)
            if v629 then
                v628:SetVisible(true);
                v626:FireModuleOpened("SettingsMenu");
                return;
            else
                v628:SetVisible(false);
                v626:FireModuleClosed("SettingsMenu");
                return;
            end;
        end);
        v626.ModuleOpened.Event:connect(function(v630) --[[ Line: 3668 ]]
            -- upvalues: v152 (ref)
            if v630 ~= "SettingsMenu" then
                v152:SetVisibility(false);
            end;
        end);
    end;
    local function v632() --[[ Line: 3674 ]] --[[ Name: disableVR ]]
        -- upvalues: v152 (copy), l_RobloxGui_0 (ref), v624 (ref), v625 (ref), l_CorePackages_0 (ref)
        v152.ClippingShield.Parent = l_RobloxGui_0;
        v152.Shield.Parent.ClipsDescendants = true;
        v152.VRShield.Visible = false;
        v152:ShowShield();
        if v624 then
            v624:disconnect();
            v624 = nil;
        end;
        if v625 then
            v625:disconnect();
            v625 = nil;
        end;
        require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false);
    end;
    local function v634(v633) --[[ Line: 3694 ]] --[[ Name: OnVREnabled ]]
        -- upvalues: l_UserInputService_0 (ref), v631 (copy), v632 (copy)
        if v633 == "VREnabled" then
            if l_UserInputService_0.VREnabled then
                v631();
                return;
            else
                v632();
            end;
        end;
    end;
    l_UserInputService_0.Changed:connect(v634);
    if l_UserInputService_0.VREnabled then
        v631();
    else
        v632();
    end;
    if not v40() then
        l_ContextActionService_0:BindCoreAction("RBXEscapeMainMenu", function(_, v636, _) --[[ Line: 3710 ]]
            -- upvalues: v152 (copy)
            if v636 ~= Enum.UserInputState.Begin then
                return;
            else
                v152:PopMenu(false, true);
                return;
            end;
        end, false, Enum.KeyCode.Escape);
    end;
    v152.ResetCharacterPage:SetHub(v152);
    if l_InExperienceCapabilities_0.canNavigateHome then
        v152.LeaveGamePage:SetHub(v152);
    end;
    if v65() then
        v152.LeaveGameUpsellPage:SetHub(v152);
    end;
    v152.GameSettingsPage = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsWrapper);
    v152.GameSettingsPage:SetHub(v152);
    v152.ReportAbusePage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
    v152.ReportAbusePage:SetHub(v152);
    if v41() then
        v152.ReportSentPage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPage);
        v152.ReportSentPage:SetHub(v152);
    end;
    v152.ReportSentPageV2 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPageV2);
    v152.ReportSentPageV2:SetHub(v152);
    v152.HelpPage = require(l_RobloxGui_0.Modules.Settings.Pages.Help);
    v152.HelpPage:SetHub(v152);
    local v638 = not v15:IsSubjectToChinaPolicies();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows and v638 then
        v152.RecordPage = require(l_RobloxGui_0.Modules.Settings.Pages.Record);
        v152.RecordPage:SetHub(v152);
    end;
    if l_InExperienceCapabilities_0.canListPeopleInSameServer then
        v152.PlayersPage = require(l_RobloxGui_0.Modules.Settings.Pages.Players);
        v152.PlayersPage:SetHub(v152);
    end;
    if l_isSubjectToDesktopPolicies_0() then
        v152.ExitModalPage = require(l_RobloxGui_0.Modules.Settings.Pages.ExitModal);
        v152.ExitModalPage:SetHub(v152);
    end;
    if l_isSubjectToDesktopPolicies_0() and l_InExperienceCapabilities_0.canNavigateHome then
        v152.LeaveGameToHomePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameToHome);
        v152.LeaveGameToHomePage:SetHub(v152);
    end;
    if l_GetFFlagEnableAppChatInExperience_0() then
        v152.AppChatPage = require(l_RobloxGui_0.Modules.Settings.Pages.AppChat);
        v152.AppChatPage:SetHub(v152);
    end;
    if not v9 and v144({
        "Roact", 
        "Rodux", 
        "RoactRodux"
    }) then
        local l_CorePackages_2 = game:GetService("CorePackages");
        local l_EventStream_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
        local l_Diag_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
        local v642 = l_EventStream_0.new(l_RbxAnalyticsService_0);
        local v643 = l_GameInviteAnalytics_0.new():withEventStream(v642):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
        v152.ShareGameApp = require(l_RobloxGui_0.Modules.Settings.ShareGameMaster).createApp(v152.PageViewClipper, v643);
        v152.ShareGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGamePlaceholderPage);
        v152.ShareGamePage:ConnectHubToApp(v152, v152.ShareGameApp);
        v152:AddPage(v152.ShareGamePage);
    end;
    local v644 = l_CapturesPolicy_0.PolicyImplementation.read();
    if if v644 then l_CapturesPolicy_0.Mapper(v644).eligibleForCapturesFeature() else false then
        local v645 = require(l_RobloxGui_0.Modules.Settings.Pages.CapturesPageWrapper);
        local function v646() --[[ Line: 3808 ]] --[[ Name: closeSettingsMenu ]]
            -- upvalues: v152 (copy)
            v152:SetVisibility(false, true);
        end;
        v152.CapturesApp = v115;
        v152.CapturesApp.mountMenuPage(v645.Page, v646, v50);
        v152.CapturesPage = v645;
        v152.CapturesPage:ConnectHubToApp(v152, v152.PageViewClipper, v152.CapturesApp);
    end;
    if v152.PlayersPage then
        v152:AddPage(v152.PlayersPage);
    end;
    v152:AddPage(v152.ResetCharacterPage);
    if v152.LeaveGamePage then
        v152:AddPage(v152.LeaveGamePage);
    end;
    if v65() and v152.LeaveGameUpsellPage then
        v152:AddPage(v152.LeaveGameUpsellPage);
    end;
    v152:AddPage(v152.GameSettingsPage);
    if v152.CapturesPage then
        v152:AddPage(v152.CapturesPage);
    end;
    if v152.ReportAbusePage then
        v152:AddPage(v152.ReportAbusePage);
    end;
    if v152.ReportSentPage then
        v152:AddPage(v152.ReportSentPage);
    end;
    if v152.ReportSentPageV2 then
        v152:AddPage(v152.ReportSentPageV2);
    end;
    v152:AddPage(v152.HelpPage);
    if v152.RecordPage and not v152.CapturesPage then
        v152:AddPage(v152.RecordPage);
    end;
    if v152.ExitModalPage then
        v152:AddPage(v152.ExitModalPage);
    end;
    if v152.LeaveGameToHomePage then
        v152:AddPage(v152.LeaveGameToHomePage);
    end;
    v152:InitInPage(v152:GetFirstPageWithTabHeader());
    if l_GetFFlagEnableAppChatInExperience_0() and v152.AppChatPage then
        v152:AddPage(v152.AppChatPage);
    end;
    l_GuiService_0.ShowLeaveConfirmation:connect(function() --[[ Line: 3873 ]]
        -- upvalues: v152 (copy), l_Constants_0 (ref)
        if #v152.MenuStack == 0 then
            v152:SetVisibility(true, nil, nil, nil, l_Constants_0.AnalyticsMenuOpenTypes.GamepadLeaveGame);
            v152:SwitchToPage(v152:GetFirstPageWithTabHeader(), nil, 1);
            return;
        else
            v152:PopMenu(false, true);
            return;
        end;
    end);
    l_ContextActionService_0:BindCoreAction("Open Dev Console", v465, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("Show Quick Profiler", v461, false, Enum.KeyCode.F7);
    l_UserInputService_0.InputBegan:connect(function(v647) --[[ Line: 3899 ]]
        -- upvalues: v152 (copy), l_GuiService_0 (ref)
        if (v647.KeyCode == Enum.KeyCode.Left or v647.KeyCode == Enum.KeyCode.Right or v647.KeyCode == Enum.KeyCode.Up or v647.KeyCode == Enum.KeyCode.Down) and v152.Visible and v152.Active and v152.Pages.CurrentPage and l_GuiService_0.SelectedCoreObject == nil then
            v152.Pages.CurrentPage:SelectARow();
        end;
    end);
    if v152.ExitModalPage then
        local function v648() --[[ Line: 3913 ]] --[[ Name: showExitModal ]]
            -- upvalues: v152 (copy), v171 (copy)
            v152.HubBar.Visible = false;
            v171();
            if v152:GetVisibility() then
                v152:AddToMenuStack(v152.Pages.CurrentPage);
                v152:SwitchToPage(v152.ExitModalPage, nil, 1, true);
                return;
            else
                v152:SetVisibility(true, nil, v152.ExitModalPage, false);
                return;
            end;
        end;
        local l_v648_0 = v648 --[[ copy: 65 -> 69 ]];
        local function v650() --[[ Line: 3923 ]] --[[ Name: handleNativeExit ]]
            -- upvalues: v152 (copy), v39 (ref), v16 (ref), l_v648_0 (copy)
            if v152:GetVisibility() and v152.Pages.CurrentPage == v152.ExitModalPage then
                if v39 then
                    v16.leavingGame();
                end;
                v152.ExitModalPage.LeaveAppFunc(true);
                return;
            else
                l_v648_0();
                return;
            end;
        end;
        game:GetService("GuiService").NativeClose:Connect(v650);
        if v152.FullScreenTitleBar then
            v152.FullScreenTitleBar = v104.update(v152.FullScreenTitleBar, {
                onClose = v650
            });
        end;
    end;
    if l_GetFFlagEnableAppChatInExperience_0() then
        local v651 = nil;
        do
            local l_v651_0 = v651;
            v152.SettingsShowSignal:connect(function(v653) --[[ Line: 3946 ]]
                -- upvalues: l_v651_0 (ref), l_InExperienceAppChatModal_0 (ref), v152 (copy)
                if v653 then
                    l_v651_0 = l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v654) --[[ Line: 3948 ]]
                        -- upvalues: v152 (ref)
                        if v654 and v152.Visible then
                            v152:SetVisibility(false, true);
                        end;
                    end);
                    return;
                else
                    if l_v651_0 then
                        l_v651_0:Disconnect();
                        l_v651_0 = nil;
                    end;
                    return;
                end;
            end);
        end;
    end;
    return v152;
end;
local v656 = {
    ModuleName = "SettingsMenu", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    SetVisibility = nil
};
v14:RegisterModule(v656);
v14.ModuleOpened.Event:connect(function(v657) --[[ Line: 3977 ]]
    -- upvalues: v656 (copy), v14 (copy)
    if v657 ~= v656.ModuleName and v14:GetModule(v657).VRIsExclusive then
        v656:SetVisibility(false);
    end;
end);
local v658 = v655();
v656.SetVisibility = function(_, v660, v661, v662, v663, v664) --[[ Line: 3988 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v658 (copy)
    v658:SetVisibility(v660, v661, v662, v663, v664);
end;
v656.SetBackgroundVisibility = function(_, v666, v667) --[[ Line: 3992 ]] --[[ Name: SetBackgroundVisibility ]]
    -- upvalues: v658 (copy)
    v658:SetBackgroundVisibility(v666, v667);
end;
v656.ToggleVisibility = function(_, v669, v670) --[[ Line: 3996 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v658 (copy)
    v658:ToggleVisibility(v669, v670);
end;
v656.SwitchToPage = function(_, v672, v673) --[[ Line: 4000 ]] --[[ Name: SwitchToPage ]]
    -- upvalues: v658 (copy)
    v658:SwitchToPage(v672, v673, 1);
end;
v656.GetVisibility = function(_) --[[ Line: 4004 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v658 (copy)
    return v658.Visible;
end;
v656.ShowShield = function(_) --[[ Line: 4008 ]] --[[ Name: ShowShield ]]
    -- upvalues: v658 (copy)
    v658:ShowShield();
end;
v656.HideShield = function(_) --[[ Line: 4012 ]] --[[ Name: HideShield ]]
    -- upvalues: v658 (copy)
    v658:HideShield();
end;
v656.GetRespawnBehaviour = function(_) --[[ Line: 4016 ]] --[[ Name: GetRespawnBehaviour ]]
    -- upvalues: v658 (copy)
    return v658:GetRespawnBehaviour();
end;
v656.RespawnBehaviourChangedEvent = v658.RespawnBehaviourChangedEvent;
v656.SettingsShowSignal = v658.SettingsShowSignal;
v656.CurrentPageSignal = v658.CurrentPageSignal;
v656.SettingsShowEvent = Instance.new("BindableEvent");
v658.SettingsShowSignal:connect(function(v678) --[[ Line: 4028 ]]
    -- upvalues: v656 (copy)
    v656.SettingsShowEvent:Fire(v678);
end);
v656.Instance = v658;
return v656;