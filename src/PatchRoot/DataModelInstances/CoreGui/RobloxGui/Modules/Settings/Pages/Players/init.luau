local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_ShareGame_0 = l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v12 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_formatUsername_0 = v12.Formatters.formatUsername;
local l_getInExperienceCombinedNameFromId_0 = v12.Selectors.getInExperienceCombinedNameFromId;
local v15 = require(l_CorePackages_0.Packages.Cryo);
local v16 = require(l_CorePackages_0.Packages.Roact);
local v17 = require(l_CorePackages_0.Packages.UIBlox);
local l_OpenTypeSupport_0 = v17.Utility.OpenTypeSupport;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v21 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v23 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
local l_SocialUtil_0 = require(l_RobloxGui_0.Modules:WaitForChild("SocialUtil"));
local l_Diag_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v27 = require(l_ShareGame_0.Spritesheets.ShareGameIcons);
local v28 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v29 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v31 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated);
local v32 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics);
local v33 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v34 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics);
local v35 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v36 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v37 = require(l_RobloxGui_0.Modules.Settings.Components.MuteToggles);
local v38 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local l_InExperienceAppChatExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatExperimentation;
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v41 = nil;
if v40() then
    v41 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalyticsManager;
end;
local v42 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = v42.GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagUpdateSquadInDefaultAppChatContainer_0 = v42.FFlagUpdateSquadInDefaultAppChatContainer;
local _, l_result_0 = pcall(function() --[[ Line: 68 ]]
    return game:GetService("PlatformFriendsService");
end);
local v47 = require(script.Parent.Parent.Theme);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v49 = v28 and "rbxasset://textures/ui/Settings/Players/ReportFlagIcon@2x.png" or "rbxasset://textures/ui/Settings/Players/ReportFlagIcon.png";
local v50 = v28 and "rbxasset://textures/ui/Settings/Players/AddFriendIcon@2x.png" or "rbxasset://textures/ui/Settings/Players/AddFriendIcon.png";
local v51 = v28 and "rbxasset://textures/ui/Settings/Players/FriendIcon@2x.png" or "rbxasset://textures/ui/Settings/Players/FriendIcon.png";
local v52 = "rbxasset://textures/ui/InspectMenu/ico_inspect.png";
local v53 = v28 and "rbxasset://textures/ui/Settings/Players/BlockIcon@2x.png" or "rbxasset://textures/ui/Settings/Players/BlockIcon.png";
if v47.UIBloxThemeEnabled then
    v49 = v47.Images["icons/actions/feedback"];
    v52 = v47.Images["icons/actions/zoomIn"];
    v53 = v47.Images["icons/actions/block"];
    v50 = v47.Images["icons/actions/friends/friendAdd"];
    v51 = v47.Images["icons/menu/friends"];
end;
local v54 = 62;
local v55 = -4;
if v47.UIBloxThemeEnabled then
    v55 = -12;
    v54 = 52;
end;
local v56 = UDim2.new(1, -10, 0, v54);
local v57 = UDim2.new(0.5, -10, 0, v54);
local _ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 127 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v62 = l_status_1 and l_result_1;
local v63 = require(l_RobloxGui_0.Modules.Flags.FFlagExtendedExpMenuPortraitLayout);
local v64 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v65 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPauseMuteFix);
local l_GetFFlagPlayerListAnimateMic_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPlayerListAnimateMic;
local v67 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local v68 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v69 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
local v70 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShowMuteToggles);
local v71 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v72 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagMuteTogglesEnableIXP);
local v73 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFStringMuteTogglesIXPLayerName);
local v74 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagUseFriendsPropsInMuteToggles);
local v75 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty);
local v76 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint);
local l_GetFFlagEnableShowVoiceUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShowVoiceUI;
local v78 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagInExperienceMenuResetButtonTextToRespawn);
local v79 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDisableMuteAllCheckForIsMuted);
local v80 = require(l_RobloxGui_0.Modules.Flags.isEngineTruncationEnabledForIngameSettings);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v82 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local v83 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local v84 = game:DefineFastFlag("CorrectlyPositionMuteButton", false);
local l_GetFFlagEnableAppChatInExperience_0 = v42.GetFFlagEnableAppChatInExperience;
local v86 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200);
local v87 = game:DefineFastFlag("AppChatTiltMenuConnectIcon", false);
local l_FFlagAppChatRebrandInNonChrome_0 = v42.FFlagAppChatRebrandInNonChrome;
local v89 = game:DefineFastFlag("EnablePlatformName", false);
local v90 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false);
local v91 = game:DefineFastFlag("EnablePlatformChatCanSeeChatTab", false);
local v92 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v93 = require(l_RobloxGui_0.Modules.Chrome.Flags.GetShouldShowPlatformChatBasedOnPolicy);
local l_MuteStatusIcons_0 = l_default_0.MuteStatusIcons;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
return ((function() --[[ Line: 182 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v47 (copy), v78 (copy), l_FFlagAppChatRebrandInNonChrome_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), v28 (copy), v62 (copy), l_LocalPlayer_0 (ref), l_GetFFlagEnableAppChatInExperience_0 (copy), l_InExperienceAppChatExperimentation_0 (copy), l_FFlagUpdateSquadInDefaultAppChatContainer_0 (copy), v91 (copy), v93 (copy), v63 (copy), v21 (copy), v35 (copy), v75 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), v51 (ref), v50 (ref), v70 (copy), v32 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v86 (copy), v54 (ref), v74 (copy), l_GuiService_0 (copy), v34 (copy), v71 (copy), v31 (copy), v29 (copy), v53 (ref), l_MuteStatusIcons_0 (copy), v82 (copy), l_game_EngineFeature_0 (copy), l_GetFFlagPlayerListAnimateMic_0 (copy), l_default_0 (copy), v67 (copy), v33 (copy), l_Create_0 (copy), v76 (copy), l_PlayerMuteStatusIcons_0 (copy), v65 (copy), v92 (copy), v23 (copy), v49 (ref), v16 (copy), v56 (copy), v57 (copy), v27 (copy), v87 (copy), v17 (copy), l_LocalizationProvider_0 (copy), v37 (copy), l_Players_0 (copy), v52 (ref), l_result_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v55 (ref), v90 (copy), v11 (copy), v12 (copy), l_getInExperienceCombinedNameFromId_0 (copy), v80 (copy), v83 (copy), l_formatUsername_0 (copy), v68 (copy), v79 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v40 (copy), v41 (ref), l_GameInviteAnalytics_0 (copy), l_EventStream_0 (copy), l_Diag_0 (copy), l_SocialUtil_0 (copy), v64 (copy), v36 (copy), v84 (copy), v15 (copy), v89 (copy), v72 (copy), v38 (copy), v73 (copy), v69 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    if v47.UIBloxThemeEnabled then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 16);
    else
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 18);
    end;
    local v97 = nil;
    local v98 = nil;
    if v78 or l_FFlagAppChatRebrandInNonChrome_0 then
        v97 = {};
        v98 = l_LocalizationService_0.RobloxLocaleId;
        if not v97[v98] then
            v97[v98] = l_Localization_0.new(v98);
        end;
    end;
    l_NewPage_0.TabHeader.Name = "PlayersTab";
    if v47.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v28 and "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon@2x.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png";
        local v99 = v47.Images["icons/menu/friends"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v99.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v99.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v99.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "People";
    else
        l_NewPage_0.TabHeader.Icon.Image = v28 and "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon@2x.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png";
        if v62 then
            l_NewPage_0.TabHeader.Title.Text = "People";
        else
            l_NewPage_0.TabHeader.Icon.Title.Text = "People";
        end;
    end;
    local function _(v100) --[[ Line: 229 ]] --[[ Name: getFriendStatus ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 230 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v100 (copy)
            return l_LocalPlayer_0:GetFriendStatus(v100);
        end);
        if l_status_2 then
            return l_result_2;
        else
            return Enum.FriendStatus.NotFriend;
        end;
    end;
    l_NewPage_0.Page.Name = "Players";
    local function _() --[[ Line: 244 ]] --[[ Name: getShowAppChatTreatment ]]
        -- upvalues: l_GetFFlagEnableAppChatInExperience_0 (ref), l_InExperienceAppChatExperimentation_0 (ref), l_FFlagUpdateSquadInDefaultAppChatContainer_0 (ref), v91 (ref), v93 (ref)
        return l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93());
    end;
    local function _(v105) --[[ Line: 252 ]] --[[ Name: showRightSideButtons ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return v105 and v105 ~= l_LocalPlayer_0 and v105.UserId > 0 and l_LocalPlayer_0.UserId > 0;
    end;
    local function _() --[[ Line: 256 ]] --[[ Name: useOptimizedPortraitLayout ]]
        -- upvalues: v63 (ref), v21 (ref)
        return v63 and v21:IsSmallTouchScreen() and v21:IsPortrait();
    end;
    local function _(v108) --[[ Line: 260 ]] --[[ Name: getIsBlocked ]]
        -- upvalues: v35 (ref)
        return v35:IsPlayerBlockedByUserId(v108.UserId);
    end;
    local function v120(v110, v111) --[[ Line: 264 ]] --[[ Name: createFriendStatusTextLabel ]]
        -- upvalues: v47 (ref), v75 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v21 (ref)
        if v110 == nil then
            return nil;
        else
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            local v113 = nil;
            local v114 = nil;
            if v110 == Enum.FriendStatus.Friend or v110 == Enum.FriendStatus.FriendRequestSent then
                v113 = Instance.new("TextButton");
                v113.BackgroundTransparency = 1;
                v113.FontSize = v47.fontSize(Enum.FontSize.Size24);
                v113.Font = v47.font(Enum.Font.SourceSans);
                v113.TextColor3 = Color3.new(1, 1, 1);
                v113.SelectionImageObject = l_Frame_0;
                if v110 == Enum.FriendStatus.Friend then
                    v113.Text = "Friend";
                else
                    v113.Text = "Request Sent";
                end;
            elseif v110 == Enum.FriendStatus.Unknown or v110 == Enum.FriendStatus.NotFriend or v110 == Enum.FriendStatus.FriendRequestReceived then
                local function v115() --[[ Line: 291 ]]
                    -- upvalues: v113 (ref), v114 (ref), v75 (ref), l_LocalPlayer_0 (ref), v111 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
                    if v113 and v114 and v114.Text ~= "" then
                        v113.ImageTransparency = 1;
                        v114.Text = "";
                        if v75() then
                            v114.Text = "Add Friend";
                        end;
                        if l_LocalPlayer_0 and v111 then
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                                category = "Game"
                            });
                            l_LocalPlayer_0:RequestFriendship(v111);
                        end;
                    end;
                end;
                local v116, v117 = v21:MakeStyledButton("FriendStatus", "Add Friend", UDim2.new(0, 182, 0, v47.ButtonHeight), v115);
                v113 = v116;
                v114 = v117;
                v114.ZIndex = 3;
                v114.Position = v114.Position + UDim2.new(0, 0, 0, 1);
            end;
            if v113 then
                v113.Name = "FriendStatus";
                v113.ZIndex = 3;
                if v47.UIBloxThemeEnabled then
                    local v118 = UDim2.new(0, 150, 0, v47.ButtonHeight);
                    v113.Size = v118;
                    v118 = UDim2.new(1, -198, 0, 7);
                    v113.Position = v118;
                    if v114 then
                        v118 = UDim2.new(0, 0, 0, 0);
                        v114.Position = v118;
                    end;
                else
                    local v119 = UDim2.new(0, 150, 0, 46);
                    v113.Size = v119;
                    v119 = UDim2.new(1, -198, 0, 7);
                    v113.Position = v119;
                end;
            end;
            return v113;
        end;
    end;
    local function v134(v121, v122) --[[ Line: 340 ]] --[[ Name: createFriendStatusImageLabel ]]
        -- upvalues: v47 (ref), v51 (ref), v50 (ref), v21 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if v121 == Enum.FriendStatus.Friend or v121 == Enum.FriendStatus.FriendRequestSent then
            if v47.UIBloxThemeEnabled then
                local l_v51_0 = v51;
                local v124 = 0;
                if v121 ~= Enum.FriendStatus.Friend then
                    l_v51_0 = v50;
                    v124 = 0.5;
                end;
                local v125, _ = v21:MakeStyledImageButton("FriendStatus", l_v51_0, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28));
                v125.Name = "FriendStatus";
                v125.Selectable = false;
                v125.FriendStatusImageLabel.ImageTransparency = v124;
                return v125;
            else
                local l_ImageButton_0 = Instance.new("ImageButton");
                l_ImageButton_0.Name = "FriendStatus";
                l_ImageButton_0.Size = UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight);
                l_ImageButton_0.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                l_ImageButton_0.ScaleType = Enum.ScaleType.Slice;
                l_ImageButton_0.SliceCenter = Rect.new(8, 6, 46, 44);
                l_ImageButton_0.AutoButtonColor = false;
                l_ImageButton_0.BackgroundTransparency = 1;
                l_ImageButton_0.ZIndex = 2;
                local l_ImageLabel_0 = Instance.new("ImageLabel");
                l_ImageLabel_0.BackgroundTransparency = 1;
                l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
                l_ImageLabel_0.Size = UDim2.new(0, 28, 0, 28);
                l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
                l_ImageLabel_0.ZIndex = 3;
                l_ImageLabel_0.Image = v51;
                if v121 == Enum.FriendStatus.Friend then
                    l_ImageLabel_0.ImageTransparency = 0;
                else
                    l_ImageLabel_0.Image = v50;
                    l_ImageLabel_0.ImageTransparency = 0.5;
                end;
                l_ImageLabel_0.Parent = l_ImageButton_0;
                return l_ImageButton_0;
            end;
        elseif v121 == Enum.FriendStatus.Unknown or v121 == Enum.FriendStatus.NotFriend or v121 == Enum.FriendStatus.FriendRequestReceived then
            local v129 = nil;
            local v130 = nil;
            local function v131() --[[ Line: 394 ]]
                -- upvalues: v129 (ref), v130 (ref), l_LocalPlayer_0 (ref), v122 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
                if v129 and v130 and v129.ImageTransparency ~= 1 then
                    v129.ImageTransparency = 1;
                    v130.ImageTransparency = 1;
                    if l_LocalPlayer_0 and v122 then
                        l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                            category = "Game"
                        });
                        l_LocalPlayer_0:RequestFriendship(v122);
                    end;
                end;
            end;
            local v132, v133 = v21:MakeStyledImageButton("FriendStatus", v50, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v131);
            v129 = v132;
            v130 = v133;
            v129.Name = "FriendStatus";
            v129.Selectable = true;
            return v129;
        else
            return nil;
        end;
    end;
    local v135 = nil;
    local v136 = nil;
    local v137 = nil;
    local v138 = nil;
    local v139 = {};
    local v140 = v70();
    local v141 = false;
    local v142 = {};
    local v143 = v32.new(l_RbxAnalyticsService_0, "Players");
    local v144 = nil;
    local v145 = false;
    local v146 = nil;
    local v147 = {};
    local v148 = nil;
    local v149 = nil;
    if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) or l_GetFFlagEnableShowVoiceUI_0() then
        v146 = function() --[[ Line: 443 ]]
            -- upvalues: l_NewPage_0 (copy), v86 (ref), v147 (ref)
            return l_NewPage_0.Page.AbsoluteSize.X < v86 * #v147;
        end;
        v144 = function() --[[ Line: 447 ]]
            -- upvalues: v147 (ref), v135 (ref), v136 (ref), v137 (ref), v145 (ref), v146 (ref), v54 (ref), v148 (ref), v149 (ref)
            v147 = {};
            if v135 then
                table.insert(v147, v135);
            end;
            if v136 then
                table.insert(v147, v136);
            end;
            if v137 then
                table.insert(v147, v137);
            end;
            v145 = v146();
            if #v147 > 0 then
                local v150 = UDim2.new(1 / #v147, 0, 0, v54);
                local v151 = {
                    Size = UDim2.new(1, -20 * (#v147 - 1), 0, v54), 
                    AutomaticSize = Enum.AutomaticSize.None
                };
                local v152 = {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                };
                if v145 then
                    v150 = UDim2.new(1, 0, 0, v54);
                    v151 = {
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    };
                    v152 = {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 16)
                    };
                end;
                for _, v154 in v147 do
                    v154.Size = v150;
                    v154.Parent = v148;
                end;
                for v155, v156 in v152 do
                    v149[v155] = v156;
                end;
                for v157, v158 in v151 do
                    v148[v157] = v158;
                end;
                return;
            else
                v148:Destroy();
                v148 = nil;
                return;
            end;
        end;
    end;
    local function v168(v159, v160, v161, v162) --[[ Line: 512 ]] --[[ Name: resizeFriendButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v74 (ref), v142 (copy), v35 (ref), v134 (copy), v120 (copy), v47 (ref), v21 (ref)
        local l_FriendStatus_0 = v159:FindFirstChild("FriendStatus");
        if l_FriendStatus_0 and v161 == v162 then
            return;
        else
            if l_FriendStatus_0 then
                l_FriendStatus_0:Destroy();
                l_FriendStatus_0 = nil;
            end;
            local v164 = nil;
            if v160 and v160 ~= l_LocalPlayer_0 and v160.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 230 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v160 (copy)
                    return l_LocalPlayer_0:GetFriendStatus(v160);
                end);
                v164 = if l_status_3 then l_result_3 else Enum.FriendStatus.NotFriend;
                if v74() then
                    v142[v160.UserId] = v164 == Enum.FriendStatus.Friend;
                end;
            end;
            if v35:IsPlayerBlockedByUserId(v160.UserId) == false then
                l_FriendStatus_0 = if v161 then v134(v164, v160) else v120(v164, v160);
            end;
            if l_FriendStatus_0 then
                l_FriendStatus_0.Name = "FriendStatus";
                l_FriendStatus_0.LayoutOrder = 5;
                l_FriendStatus_0.Selectable = true;
                if v47.UIBloxThemeEnabled then
                    local v167 = "utility-focus-state" .. "-friendstatuslabel-" .. v160.Name;
                    v21:MakeFocusState(l_FriendStatus_0, v167);
                end;
                l_FriendStatus_0.Parent = v159;
            end;
            return;
        end;
    end;
    local function v174(v169, v170) --[[ Line: 551 ]] --[[ Name: friendStatusCreate ]]
        -- upvalues: l_GuiService_0 (ref), v135 (ref), v168 (copy), v21 (ref)
        local v171 = nil;
        if v169 then
            v171 = v169:FindFirstChild("RightSideButtons");
        end;
        if v171 then
            for _, v173 in pairs(v171:GetChildren()) do
                if v173 and v173.Name == "FriendStatus" then
                    if l_GuiService_0.SelectedCoreObject == v173 then
                        l_GuiService_0.SelectedCoreObject = v135;
                    end;
                    v173:Destroy();
                end;
            end;
            v168(v171, v170, v21:IsPortrait(), nil);
        end;
    end;
    l_LocalPlayer_0.FriendStatusChanged:connect(function(v175, v176) --[[ Line: 573 ]]
        -- upvalues: l_NewPage_0 (copy), v174 (copy), v74 (ref), v142 (copy)
        if v175 then
            local l_FirstChild_0 = l_NewPage_0.Page:FindFirstChild("PlayerLabel" .. v175.Name);
            if l_FirstChild_0 then
                v174(l_FirstChild_0, v175);
            end;
            if v74() then
                v142[v175.UserId] = v176 == Enum.FriendStatus.Friend;
            end;
        end;
    end);
    local v178 = nil;
    local v179 = nil;
    local v180 = v34.new(l_LocalPlayer_0.UserId, {
        EventStream = l_RbxAnalyticsService_0
    });
    local function v196(v181, v182, v183, _) --[[ Line: 589 ]] --[[ Name: createBlockButton ]]
        -- upvalues: v35 (ref), v178 (ref), v168 (copy), v71 (ref), v179 (ref), l_GuiService_0 (ref), v31 (ref), v180 (copy), l_Constants_0 (ref), v21 (ref), v29 (ref), v47 (ref), v53 (ref)
        local v185 = v35:IsPlayerBlockedByUserId(v182.UserId);
        local function _(v186) --[[ Line: 592 ]] --[[ Name: updateBlockButton ]]
            -- upvalues: v178 (ref), v181 (copy), v182 (copy), v183 (copy), v168 (ref), v71 (ref), v179 (ref)
            local v187 = v178(v181, v182, v183, not v183);
            v168(v181, v182, v183, not v183);
            if v71() and v186 then
                v179(v187);
            end;
        end;
        local function v192() --[[ Line: 600 ]] --[[ Name: blockUser ]]
            -- upvalues: l_GuiService_0 (ref), v31 (ref), v182 (copy), v180 (ref), l_Constants_0 (ref), v178 (ref), v181 (copy), v183 (copy), v168 (ref), v71 (ref), v179 (ref)
            local v189 = true;
            if l_GuiService_0.SelectedCoreObject == nil then
                v189 = l_GuiService_0.SelectedObject ~= nil;
            end;
            v31(v182, v180, l_Constants_0.AnalyticsInGameMenuName):andThen(function() --[[ Line: 602 ]]
                -- upvalues: v189 (copy), v178 (ref), v181 (ref), v182 (ref), v183 (ref), v168 (ref), v71 (ref), v179 (ref)
                local l_v189_0 = v189;
                local v191 = v178(v181, v182, v183, not v183);
                v168(v181, v182, v183, not v183);
                if v71() and l_v189_0 then
                    v179(v191);
                end;
            end);
        end;
        local function v195() --[[ Line: 607 ]] --[[ Name: unBlockUser ]]
            -- upvalues: v35 (ref), v182 (copy), v180 (ref), v178 (ref), v181 (copy), v183 (copy), v168 (ref), v71 (ref)
            if v35:UnblockPlayerAsync(v182) then
                v180:action("SettingsHub", "unblockUser", {
                    blockeeUserId = v182.UserId
                });
                local _ = v178(v181, v182, v183, not v183);
                v168(v181, v182, v183, not v183);
                local _ = v71();
            end;
        end;
        if v185 then
            return v21:MakeStyledButton("BlockButton", v29:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v47.ButtonHeight), v195);
        else
            return v21:MakeStyledImageButton("BlockButton", v53, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v192);
        end;
    end;
    v179 = function(v197) --[[ Line: 636 ]] --[[ Name: trySelection ]]
        -- upvalues: l_GuiService_0 (ref)
        if v197 and not v197.Selectable then
            l_GuiService_0:Select(v197);
            return;
        else
            l_GuiService_0.SelectedCoreObject = v197;
            return;
        end;
    end;
    v178 = function(v198, v199, v200, v201) --[[ Line: 644 ]] --[[ Name: resizeBlockButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v196 (copy), v47 (ref), v21 (ref)
        local l_BlockButton_0 = v198:FindFirstChild("BlockButton");
        if l_BlockButton_0 and v200 == v201 then
            return l_BlockButton_0;
        else
            if l_BlockButton_0 then
                l_BlockButton_0:Destroy();
                l_BlockButton_0 = nil;
            end;
            if v199 and v199 ~= l_LocalPlayer_0 and v199.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                l_BlockButton_0 = v196(v198, v199, v200, v201);
            end;
            if l_BlockButton_0 then
                l_BlockButton_0.Name = "BlockButton";
                l_BlockButton_0.LayoutOrder = 4;
                l_BlockButton_0.Selectable = true;
                if v47.UIBloxThemeEnabled then
                    local v203 = "utility-focus-state" .. "-blockbutton-" .. v199.Name;
                    v21:MakeFocusState(l_BlockButton_0, v203);
                end;
                l_BlockButton_0.Parent = v198;
            end;
            return l_BlockButton_0;
        end;
    end;
    local v204 = false;
    local v205 = false;
    local function v220(v206, v207) --[[ Line: 675 ]] --[[ Name: muteButtonUpdate ]]
        -- upvalues: l_MuteStatusIcons_0 (ref), v82 (ref), l_game_EngineFeature_0 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), l_default_0 (ref), v67 (ref), v139 (copy), l_GetFFlagEnableShowVoiceUI_0 (ref), v21 (ref), v47 (ref), v143 (copy), v33 (ref)
        local v208 = nil;
        if v206 then
            v208 = v206:FindFirstChild("RightSideButtons");
        end;
        if not v208 then
            return;
        else
            local l_MuteStatusButton_0 = v208:FindFirstChild("MuteStatusButton");
            if v207 == nil then
                if l_MuteStatusButton_0 then
                    l_MuteStatusButton_0:Destroy();
                end;
                return;
            else
                local v210 = UDim2.fromOffset(36, 36);
                local v211 = UDim2.fromOffset(0, 0);
                local v212 = 0;
                local v213 = v207.isMuted and l_MuteStatusIcons_0.MicOff or l_MuteStatusIcons_0.MicOn;
                if v207.subscriptionFailed then
                    v213 = l_MuteStatusIcons_0.Error;
                    v210 = UDim2.fromOffset(36, 36);
                    v211 = UDim2.fromOffset(2, -2);
                    if v82 and l_game_EngineFeature_0 then
                        v212 = 0.5;
                    end;
                elseif v207.isMutedLocally then
                    v213 = l_MuteStatusIcons_0.MicDisabled;
                    v212 = 0.5;
                elseif not v207.subscriptionCompleted then
                    v213 = l_MuteStatusIcons_0.Loading;
                elseif l_GetFFlagPlayerListAnimateMic_0() and v207.isSignalActive then
                    local v214 = 20 * math.floor(0.5 + 5 * math.random());
                    v213 = l_default_0:GetIcon("Unmuted" .. tostring(v214), v67() and "SpeakerLight" or "MicLight");
                end;
                if l_MuteStatusButton_0 then
                    local v215 = nil;
                    v215 = if l_GetFFlagPlayerListAnimateMic_0() then v139[v207.userId] or v208:FindFirstChild("MuteStatusImageLabel", true) else v208:FindFirstChild("MuteStatusImageLabel", true);
                    v215.Image = v213;
                    v215.Size = v210;
                    v215.ImageTransparency = v212;
                    return;
                else
                    if not l_GetFFlagEnableShowVoiceUI_0() or l_default_0.voiceUIVisible then
                        local v217, v218 = v21:MakeStyledImageButton("MuteStatus", v213, UDim2.fromOffset(v47.ButtonHeight, v47.ButtonHeight), v210, function() --[[ Line: 740 ]]
                            -- upvalues: l_default_0 (ref), v207 (copy), v143 (ref), v33 (ref), v82 (ref), l_game_EngineFeature_0 (ref)
                            local v216 = l_default_0.participants[tostring(v207.userId)];
                            if v216.subscriptionCompleted then
                                if v143 then
                                    v143:onToggleMutePlayer(v207.userId, not v216.isMutedLocally);
                                end;
                                l_default_0:ToggleMutePlayer(v207.userId, v33.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                                return;
                            else
                                if v216.subscriptionFailed then
                                    if v82 then
                                        if not l_game_EngineFeature_0 then
                                            l_default_0:SubscribeRetry(v207.userId);
                                            return;
                                        end;
                                    else
                                        l_default_0:SubscribeRetry(v207.userId);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        if l_GetFFlagPlayerListAnimateMic_0() then
                            v139[v207.userId] = v218;
                        end;
                        v218.ZIndex = 3;
                        v218.Position = v218.Position + v211;
                        v218.ImageTransparency = v212;
                        if v47.UIBloxThemeEnabled then
                            local v219 = "utility-focus-state" .. "-mutestatusbutton-" .. v207.userId;
                            v21:MakeFocusState(v217, v219);
                        end;
                        v217.Parent = v208;
                    end;
                    return;
                end;
            end;
        end;
    end;
    local v221 = l_Create_0("Frame")({
        Name = "ButtonsContainer", 
        Size = UDim2.new(1, 0, 0, 62), 
        BackgroundTransparency = 1, 
        Parent = l_NewPage_0.Page, 
        Visible = false
    });
    local v222 = 5;
    if v47.UIBloxThemeEnabled then
        l_Create_0("UIPadding")({
            PaddingBottom = UDim.new(0, 1), 
            PaddingTop = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 1), 
            Parent = v221
        });
        v222 = 12;
        v221.Size = UDim2.new(1, 0, 0, v47.ButtonHeight);
    end;
    local function v223() --[[ Line: 800 ]]
        -- upvalues: v76 (ref), l_NewPage_0 (copy), v33 (ref)
        if v76() and l_NewPage_0.HubRef.leaveGameUpsellProp ~= v33.PHONE_UPSELL_VALUE_PROP.None then
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, nil, 1, true);
            return;
        else
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
            return;
        end;
    end;
    local v224, v225 = v21:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -v222, 1, 0), v223);
    v224.AnchorPoint = Vector2.new(0, 0);
    v224.Position = UDim2.new(0, 0, 0, 0);
    if v47.UIBloxThemeEnabled then
        v225.Size = UDim2.new(1, -4, 1, 0);
        v225.Position = UDim2.new(0, 2, 0, 0);
    else
        v225.Size = UDim2.new(1, 0, 1, -6);
    end;
    v224.Parent = v221;
    local function v226() --[[ Line: 826 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end;
    local v227 = if v78 then v97[v98]:Format(l_Constants_0.RespawnLocalizedKey) else "Reset Character";
    local v228, v229 = v21:MakeStyledButton("ResetButton", v227, UDim2.new(0.3333333333333333, -v222, 1, 0), v226);
    v228.AnchorPoint = Vector2.new(0.5, 0);
    v228.Position = UDim2.new(0.5, 0, 0, 0);
    if v47.UIBloxThemeEnabled then
        v229.Size = UDim2.new(1, -4, 1, 0);
        v229.Position = UDim2.new(0, 2, 0, 0);
    else
        v229.Size = UDim2.new(1, 0, 1, -6);
    end;
    v228.Parent = v221;
    local function v230() --[[ Line: 847 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource
        });
    end;
    local v231, v232 = v21:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -v222, 1, 0), v230);
    v231.AnchorPoint = Vector2.new(1, 0);
    v231.Position = UDim2.new(1, 0, 0, 0);
    if v47.UIBloxThemeEnabled then
        v232.Size = UDim2.new(1, -4, 1, 0);
        v232.Position = UDim2.new(0, 2, 0, 0);
    else
        v232.Size = UDim2.new(1, 0, 1, -6);
    end;
    v231.Parent = v221;
    local function v236() --[[ Line: 873 ]] --[[ Name: pollImage ]]
        -- upvalues: l_default_0 (ref), v67 (ref), l_PlayerMuteStatusIcons_0 (ref), l_MuteStatusIcons_0 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref)
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            if v67() then
                return l_PlayerMuteStatusIcons_0.Loading;
            else
                return l_MuteStatusIcons_0.Loading;
            end;
        elseif l_localMuted_0 then
            if v67() then
                return l_PlayerMuteStatusIcons_0.MicOff;
            else
                return l_MuteStatusIcons_0.MicOff;
            end;
        elseif l_default_0.isTalking and l_GetFFlagPlayerListAnimateMic_0() then
            local v235 = 20 * math.floor(0.5 + 5 * math.random());
            return (l_default_0:GetIcon("Unmuted" .. tostring(v235), "MicLight"));
        elseif v67() then
            return l_PlayerMuteStatusIcons_0.MicOn;
        else
            return l_MuteStatusIcons_0.MicOn;
        end;
    end;
    local function _(v237, v238, v239, v240) --[[ Line: 890 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v221 (copy)
        local l_v221_FirstChild_0 = v221:FindFirstChild(v237 .. "Button", true);
        if not l_v221_FirstChild_0 then
            return;
        else
            l_v221_FirstChild_0.Position = v238;
            l_v221_FirstChild_0.Size = v239;
            l_v221_FirstChild_0.AnchorPoint = v240;
            return;
        end;
    end;
    local function v249() --[[ Line: 902 ]] --[[ Name: updateButtonRow ]]
        -- upvalues: v47 (ref), v221 (copy)
        local v243 = 6;
        local v244 = 0;
        if v47.UIBloxThemeEnabled then
            v243 = 0;
            v244 = 12;
        end;
        local v245 = UDim2.new(0.8571428571428571, 0, 0, 0);
        local v246 = UDim2.new(0.2857142857142857, -v244, 1, -v243);
        local v247 = Vector2.new(1, 0);
        local l_v221_FirstChild_1 = v221:FindFirstChild("ResumeButton" .. "Button", true);
        if l_v221_FirstChild_1 then
            l_v221_FirstChild_1.Position = v245;
            l_v221_FirstChild_1.Size = v246;
            l_v221_FirstChild_1.AnchorPoint = v247;
        end;
        v245 = UDim2.new(0.42857142857142855, 0, 0, 0);
        v246 = UDim2.new(0.2857142857142857, -v244, 1, -v243);
        v247 = Vector2.new(0.5, 0);
        l_v221_FirstChild_1 = v221:FindFirstChild("ResetButton" .. "Button", true);
        if l_v221_FirstChild_1 then
            l_v221_FirstChild_1.Position = v245;
            l_v221_FirstChild_1.Size = v246;
            l_v221_FirstChild_1.AnchorPoint = v247;
        end;
        v245 = UDim2.new(0, 0, 0, 0);
        v246 = UDim2.new(0.2857142857142857, -v244, 1, -v243);
        v247 = Vector2.new(0, 0);
        l_v221_FirstChild_1 = v221:FindFirstChild("LeaveButton" .. "Button", true);
        if not l_v221_FirstChild_1 then
            return;
        else
            l_v221_FirstChild_1.Position = v245;
            l_v221_FirstChild_1.Size = v246;
            l_v221_FirstChild_1.AnchorPoint = v247;
            return;
        end;
    end;
    local function _() --[[ Line: 932 ]] --[[ Name: muteButtonReset ]]
        -- upvalues: v221 (copy)
        local l_v221_FirstChild_2 = v221:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v221_FirstChild_2 then
            l_v221_FirstChild_2:Destroy();
        end;
    end;
    local function v256() --[[ Line: 939 ]] --[[ Name: resetButtonRow ]]
        -- upvalues: v222 (ref), v221 (copy)
        local v252 = UDim2.new(1, 0, 0, 0);
        local v253 = UDim2.new(0.3333333333333333, -v222, 1, 0);
        local v254 = Vector2.new(1, 0);
        local l_v221_FirstChild_3 = v221:FindFirstChild("ResumeButton" .. "Button", true);
        if l_v221_FirstChild_3 then
            l_v221_FirstChild_3.Position = v252;
            l_v221_FirstChild_3.Size = v253;
            l_v221_FirstChild_3.AnchorPoint = v254;
        end;
        v252 = UDim2.new(0.5, 0, 0, 0);
        v253 = UDim2.new(0.3333333333333333, -v222, 1, 0);
        v254 = Vector2.new(0.5, 0);
        l_v221_FirstChild_3 = v221:FindFirstChild("ResetButton" .. "Button", true);
        if l_v221_FirstChild_3 then
            l_v221_FirstChild_3.Position = v252;
            l_v221_FirstChild_3.Size = v253;
            l_v221_FirstChild_3.AnchorPoint = v254;
        end;
        v252 = UDim2.new(0, 0, 0, 0);
        v253 = UDim2.new(0.3333333333333333, -v222, 1, 0);
        v254 = Vector2.new(0, 0);
        l_v221_FirstChild_3 = v221:FindFirstChild("LeaveButton" .. "Button", true);
        if l_v221_FirstChild_3 then
            l_v221_FirstChild_3.Position = v252;
            l_v221_FirstChild_3.Size = v253;
            l_v221_FirstChild_3.AnchorPoint = v254;
        end;
        v252 = v221:FindFirstChild("PlayerMuteButtonButton", true);
        if v252 then
            v252:Destroy();
        end;
    end;
    local function _() --[[ Line: 961 ]] --[[ Name: updateIcon ]]
        -- upvalues: v221 (copy), v236 (copy)
        local l_v221_FirstChild_4 = v221:FindFirstChild("PlayerMuteButtonImageLabel", true);
        if not l_v221_FirstChild_4 then
            return;
        else
            l_v221_FirstChild_4.Image = v236();
            return;
        end;
    end;
    local function v263() --[[ Line: 969 ]] --[[ Name: appendMuteButton ]]
        -- upvalues: v21 (ref), v236 (copy), v65 (ref), l_default_0 (ref), v143 (copy), v204 (ref), v47 (ref), l_Create_0 (ref), v221 (copy)
        local v259, v260 = v21:MakeStyledImageButton("PlayerMuteButton", v236(), v65() and UDim2.new(1, 0, 1, 0) or UDim2.new(0.2, -5, 0.8, 0), v65() and UDim2.new(1, -6, 1, -4) or UDim2.new(0.5, -6, 0.65, -4), function() --[[ Line: 975 ]]
            -- upvalues: l_default_0 (ref), v143 (ref), v204 (ref)
            l_default_0:ToggleMic("InGameMenuPlayers");
            if v143 then
                v143:onToggleMuteSelf(v204);
            end;
        end, nil, nil, "DefaultButton");
        if v47.UIBloxThemeEnabled then
            v259.Position = UDim2.new(1, 0, 0, 0);
            v259.Size = UDim2.new(0.14285714285714285, -12, 1, 0);
            v260.Size = UDim2.new(1, -6, 1, -4);
            l_Create_0("UIAspectRatioConstraint")({
                AspectRatio = 1, 
                Parent = v260
            });
        else
            v259.Position = UDim2.new(1, 0, 0, 0);
            v259.Size = UDim2.new(0.14285714285714285, 0, 1, -6);
        end;
        v259.AnchorPoint = Vector2.new(1, 0);
        if v65() then
            v260.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        end;
        v259.Parent = v221;
        l_default_0.muteChanged.Event:Connect(function(v261) --[[ Line: 1005 ]]
            -- upvalues: v204 (ref), v221 (ref), v236 (ref)
            v204 = v261;
            local l_v221_FirstChild_5 = v221:FindFirstChild("PlayerMuteButtonImageLabel", true);
            if not l_v221_FirstChild_5 then
                return;
            else
                l_v221_FirstChild_5.Image = v236();
                return;
            end;
        end);
    end;
    local function _() --[[ Line: 1011 ]] --[[ Name: addMuteButtonExperience ]]
        -- upvalues: v92 (ref), v249 (copy), v263 (copy)
        if v92 then
            return;
        else
            v249();
            v263();
            return;
        end;
    end;
    v21:OnResized(v221, function(_, v266) --[[ Line: 1019 ]]
        -- upvalues: v21 (ref), v47 (ref), v221 (copy), v229 (copy), v225 (copy), v232 (copy)
        if (v266 or v21:IsSmallTouchScreen()) and not v47.AlwaysShowBottomBar() then
            local v267 = v266 and v47.textSize(18) or v47.textSize(24);
            if v47.UIBloxThemeEnabled and v47.UseBiggerText then
                v267 = v47.textSize(20);
            end;
            v221.Visible = not v47.UIBloxThemeEnabled or not v47.EnableVerticalBottomBar;
            if v47.UIBloxThemeEnabled then
                v221.Size = UDim2.new(1, 0, 0, v47.ButtonHeight);
            else
                v221.Size = UDim2.new(1, 0, 0, v266 and 50 or 62);
            end;
            v229.TextSize = v267;
            v225.TextSize = v267;
            v232.TextSize = v267;
            return;
        else
            v221.Visible = false;
            v221.Size = UDim2.new(1, 0, 0, 0);
            return;
        end;
    end);
    if v62 then
        local function v269(v268) --[[ Line: 1041 ]] --[[ Name: ApplyLocalizeTextSettingsToLabel ]]
            v268.AnchorPoint = Vector2.new(0.5, 0.5);
            v268.Position = UDim2.new(0.5, 0, 0.5, -3);
            v268.Size = UDim2.new(0.75, 0, 0.5, 0);
        end;
        v269(v225);
        v269(v229);
        v269(v229);
    end;
    local function v277(v270, v271) --[[ Line: 1051 ]] --[[ Name: reportAbuseButtonCreate ]]
        -- upvalues: l_LocalPlayer_0 (ref), v23 (ref), v21 (ref), v49 (ref), v47 (ref)
        local l_RightSideButtons_0 = v270:FindFirstChild("RightSideButtons");
        if l_RightSideButtons_0 then
            local l_ReportPlayer_0 = l_RightSideButtons_0:FindFirstChild("ReportPlayer");
            if l_ReportPlayer_0 then
                l_ReportPlayer_0:Destroy();
            end;
            if v271 and v271 ~= l_LocalPlayer_0 and v271.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local function v274() --[[ Line: 1060 ]]
                    -- upvalues: v23 (ref), v271 (copy)
                    v23:ReportPlayer(v271, "MenuPlayerList");
                end;
                local v275 = v21:MakeStyledImageButton("ReportPlayer", v49, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v274);
                v275.Name = "ReportPlayer";
                v275.Position = UDim2.new(1, -260, 0, 7);
                v275.LayoutOrder = 3;
                v275.Selectable = true;
                if v47.UIBloxThemeEnabled then
                    local v276 = "utility-focus-state" .. "-reportplayer-" .. v271.Name;
                    v21:MakeFocusState(v275, v276);
                end;
                v275.Parent = l_RightSideButtons_0;
            end;
        end;
    end;
    local v278 = nil;
    local v279 = nil;
    local v280 = nil;
    local v281 = nil;
    local v282 = false;
    local function v283() --[[ Line: 1091 ]] --[[ Name: muteAllButtonRemove ]]
        -- upvalues: v140 (ref), v138 (ref), v16 (ref), v136 (ref), l_GetFFlagEnableAppChatInExperience_0 (ref), l_InExperienceAppChatExperimentation_0 (ref), l_FFlagUpdateSquadInDefaultAppChatContainer_0 (ref), v91 (ref), v93 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v144 (ref), v135 (ref), v56 (ref)
        if v140 then
            if v138 then
                v16.unmount(v138);
                return;
            end;
        else
            if v136 then
                v136.Visible = false;
                v136:Destroy();
                if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) or l_GetFFlagEnableShowVoiceUI_0() then
                    v136 = nil;
                end;
            end;
            if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) or l_GetFFlagEnableShowVoiceUI_0() then
                v144();
                return;
            elseif v135 then
                v135.Size = v56;
            end;
        end;
    end;
    local function v290(v284, v285) --[[ Line: 1114 ]] --[[ Name: createRow ]]
        -- upvalues: v47 (ref), l_Create_0 (ref)
        local v286 = Instance.new(v284);
        v286.Size = UDim2.new(1, 0, 0, 62);
        v286.Position = UDim2.new(0, 0, 0, 0);
        v286.ZIndex = 2;
        if v47.UIBloxThemeEnabled then
            v286.BackgroundColor3 = v47.color("PlayerRowFrame");
            v286.BackgroundTransparency = v47.transparency("PlayerRowFrame");
            l_Create_0("UICorner")({
                CornerRadius = v47.DefaultCornerRadius, 
                Parent = v286
            });
        else
            v286.Image = "rbxasset://textures/ui/dialog_white.png";
            v286.ScaleType = "Slice";
            v286.SliceCenter = Rect.new(10, 10, 10, 10);
            v286.BackgroundTransparency = 1;
            v286.ImageTransparency = 0.85;
        end;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "Icon";
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.Size = UDim2.new(0, 36, 0, 36);
        l_ImageLabel_1.Position = UDim2.new(0, 12, 0, 12);
        l_ImageLabel_1.ZIndex = 3;
        l_ImageLabel_1.Parent = v286;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.Font = v47.font(Enum.Font.SourceSans, "DisplayName");
        l_TextLabel_0.FontSize = v285 and v47.fontSize(Enum.FontSize.Size36, "DisplayName") or v47.fontSize(Enum.FontSize.Size24, "DisplayName");
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.Position = v285 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.ZIndex = 3;
        l_TextLabel_0.Parent = v286;
        if v285 then
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Text = "";
            l_TextLabel_1.Name = "SecondRow";
            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
            l_TextLabel_1.Font = v47.font(Enum.Font.SourceSans);
            l_TextLabel_1.FontSize = v47.fontSize(Enum.FontSize.Size24, "Username");
            l_TextLabel_1.TextColor3 = Color3.fromRGB(162, 162, 162);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.Position = UDim2.new(0, 60, 0.5, 12);
            l_TextLabel_1.Size = UDim2.new(0, 0, 0, 0);
            l_TextLabel_1.ZIndex = 3;
            l_TextLabel_1.Parent = v286;
        end;
        return v286;
    end;
    v278 = function() --[[ Line: 1175 ]]
        -- upvalues: v290 (copy), v47 (ref), v54 (ref), v282 (ref), v140 (ref), v57 (ref), v29 (ref), v27 (ref), v21 (ref)
        local v291 = v290("ImageButton");
        if v47.UIBloxThemeEnabled then
            v291.Size = UDim2.new(1, 0, 0, v54);
        end;
        local l_TextLabel_2 = v291.TextLabel;
        local l_Icon_0 = v291.Icon;
        if v282 then
            if not v140 then
                v291.Size = v57;
            end;
            l_TextLabel_2.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
            v291.AnchorPoint = Vector2.new(0, 0);
        end;
        l_TextLabel_2.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_2.AutoLocalize = false;
        l_TextLabel_2.Text = v29:FormatByKey("Feature.SettingsHub.Action.InviteFriendsToPlay");
        if v47.UIBloxThemeEnabled then
            l_Icon_0.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_0.Position = UDim2.new(0, 18, 0.5, 0);
            local v294 = v47.Images["icons/actions/friends/friendInvite"];
            if v294 then
                l_Icon_0.Image = v294.Image;
                l_Icon_0.ImageRectOffset = v294.ImageRectOffset;
                l_Icon_0.ImageRectSize = v294.ImageRectSize;
            end;
        else
            l_Icon_0.Size = UDim2.new(0, 24, 0, 24);
            l_Icon_0.Position = UDim2.new(0, 18, 0, 18);
            v27:ApplyImage(l_Icon_0, "invite");
        end;
        local function _(v295) --[[ Line: 1210 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v291 (copy)
            if v295 then
                v291.ImageTransparency = 0.65;
                return;
            else
                v291.ImageTransparency = 0.85;
                return;
            end;
        end;
        v291.InputBegan:Connect(function() --[[ Line: 1218 ]]
            -- upvalues: v291 (copy)
            v291.ImageTransparency = 0.65;
        end);
        v291.InputEnded:Connect(function() --[[ Line: 1221 ]]
            -- upvalues: v291 (copy)
            v291.ImageTransparency = 0.85;
        end);
        v291.Activated:Connect(function() --[[ Line: 1224 ]]
            -- upvalues: v291 (copy)
            v291.ImageTransparency = 0.85;
        end);
        v291.TouchPan:Connect(function(_, v298) --[[ Line: 1227 ]]
            -- upvalues: v291 (copy)
            if math.abs(v298.Y) > 20 then
                v291.ImageTransparency = 0.85;
            end;
        end);
        v291.SelectionGained:connect(function() --[[ Line: 1233 ]]
            -- upvalues: v291 (copy)
            v291.ImageTransparency = 0.65;
        end);
        v291.SelectionLost:connect(function() --[[ Line: 1236 ]]
            -- upvalues: v291 (copy)
            v291.ImageTransparency = 0.85;
        end);
        v291.SelectionImageObject = v291:Clone();
        if v47.UIBloxThemeEnabled then
            local v299 = "utility-focus-state" .. "-sharegame";
            v21:MakeFocusState(v291, v299);
        end;
        return v291;
    end;
    v279 = function() --[[ Line: 1249 ]]
        -- upvalues: v290 (copy), v135 (ref), v54 (ref), v47 (ref), v29 (ref), l_default_0 (ref), v21 (ref)
        local v300 = v290("ImageButton");
        v300.Size = UDim2.new(v135 and 0.5 or 1, -10, 0, v54);
        v300.Position = UDim2.new(1, 0, 0, 0);
        v300.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_3 = v300.TextLabel;
        local l_Icon_1 = v300.Icon;
        l_TextLabel_3.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_3.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_3.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_3.AutoLocalize = false;
        l_TextLabel_3.Text = v29:FormatByKey("Feature.SettingsHub.Action.MuteAll");
        l_Icon_1.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_1.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_1.Image = l_default_0:GetIcon("UnmuteAll", "Misc");
        if v47.UIBloxThemeEnabled then
            l_Icon_1.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_1.Position = UDim2.new(0, 18, 0.5, 0);
        end;
        local function _(v303) --[[ Line: 1272 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v300 (copy)
            if v303 then
                v300.ImageTransparency = 0.65;
                return;
            else
                v300.ImageTransparency = 0.85;
                return;
            end;
        end;
        v300.InputBegan:Connect(function() --[[ Line: 1280 ]]
            -- upvalues: v300 (copy)
            v300.ImageTransparency = 0.65;
        end);
        v300.InputEnded:Connect(function() --[[ Line: 1283 ]]
            -- upvalues: v300 (copy)
            v300.ImageTransparency = 0.85;
        end);
        v300.Activated:Connect(function() --[[ Line: 1286 ]]
            -- upvalues: v300 (copy)
            v300.ImageTransparency = 0.85;
        end);
        v300.TouchPan:Connect(function(_, v306) --[[ Line: 1289 ]]
            -- upvalues: v300 (copy)
            if math.abs(v306.Y) > 20 then
                v300.ImageTransparency = 0.85;
            end;
        end);
        v300.SelectionGained:connect(function() --[[ Line: 1295 ]]
            -- upvalues: v300 (copy)
            v300.ImageTransparency = 0.65;
        end);
        v300.SelectionLost:connect(function() --[[ Line: 1298 ]]
            -- upvalues: v300 (copy)
            v300.ImageTransparency = 0.85;
        end);
        v300.SelectionImageObject = v300:Clone();
        if v47.UIBloxThemeEnabled then
            local v307 = "utility-focus-state" .. "-muteall";
            v21:MakeFocusState(v300, v307);
        end;
        return v300;
    end;
    if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) then
        local v308 = nil;
        local v309 = false;
        do
            local l_v308_0, l_v309_0 = v308, v309;
            l_NewPage_0.UpdateAppChatUnreadMessagesCount = function(v312) --[[ Line: 1315 ]]
                -- upvalues: l_v309_0 (ref), l_v308_0 (ref)
                l_v309_0 = v312 > 0;
                if l_v308_0 then
                    l_v308_0.Visible = l_v309_0;
                end;
            end;
            v280 = function() --[[ Line: 1323 ]]
                -- upvalues: v290 (copy), v47 (ref), l_FFlagAppChatRebrandInNonChrome_0 (ref), v97 (ref), v98 (ref), l_Constants_0 (ref), v29 (ref), v87 (ref), v21 (ref), l_v308_0 (ref), l_Create_0 (ref), l_v309_0 (ref)
                local v313 = v290("ImageButton");
                local l_TextLabel_4 = v313.TextLabel;
                local l_Icon_2 = v313.Icon;
                l_TextLabel_4.Size = UDim2.new(1, -60, 0, 0);
                l_TextLabel_4.TextTruncate = Enum.TextTruncate.AtEnd;
                l_TextLabel_4.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
                l_TextLabel_4.AutoLocalize = false;
                if l_FFlagAppChatRebrandInNonChrome_0 then
                    if v97[v98] then
                        l_TextLabel_4.Text = v97[v98]:Format(l_Constants_0.PartyLocalizedKey);
                    end;
                else
                    l_TextLabel_4.Text = v29:FormatByKey("Feature.Chat.Label.RobloxConnect");
                end;
                l_Icon_2.Size = UDim2.new(0, 32, 0, 32);
                l_Icon_2.Position = UDim2.new(0, 18, 0, 16);
                if v47.UIBloxThemeEnabled then
                    l_Icon_2.AnchorPoint = Vector2.new(0, 0.5);
                    l_Icon_2.Position = UDim2.new(0, 18, 0.5, 0);
                    local v316 = nil;
                    v316 = if l_FFlagAppChatRebrandInNonChrome_0 then v47.Images["icons/menu/2-person-with-bubble"] else if v87 then v47.Images["icons/menu/platformChatOff"] else v47.Images["icons/menu/chat_off"];
                    l_Icon_2.Image = v316.Image;
                    l_Icon_2.ImageRectOffset = v316.ImageRectOffset;
                    l_Icon_2.ImageRectSize = v316.ImageRectSize;
                end;
                local function v318(_) --[[ Line: 1361 ]]
                    -- upvalues: v313 (copy)
                    v313.ImageTransparency = 0.65;
                end;
                local function v320(_) --[[ Line: 1365 ]]
                    -- upvalues: v313 (copy)
                    v313.ImageTransparency = 0.85;
                end;
                v313.InputBegan:Connect(v318);
                v313.InputEnded:Connect(v320);
                v313.Activated:Connect(v320);
                v313.TouchPan:Connect(function(_, v322) --[[ Line: 1372 ]]
                    -- upvalues: v313 (copy)
                    if math.abs(v322.Y) > 20 then
                        v313.ImageTransparency = 0.85;
                    end;
                end);
                v313.SelectionGained:connect(v318);
                v313.SelectionLost:connect(v320);
                v313.SelectionImageObject = v313:Clone();
                if v47.UIBloxThemeEnabled then
                    local v323 = "utility-focus-state" .. "-chat";
                    v21:MakeFocusState(v313, v323);
                end;
                l_v308_0 = l_Create_0("Frame")({
                    Name = "UnreadIndicator", 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = v47.transparency("White"), 
                    BackgroundColor3 = v47.color("White"), 
                    Size = UDim2.new(0, 8, 0, 8), 
                    Position = UDim2.new(1, -15, 0.5, 0), 
                    Visible = l_v309_0, 
                    Parent = v313
                });
                l_Create_0("UICorner")({
                    CornerRadius = UDim.new(1, 0), 
                    Parent = l_v308_0
                });
                return v313;
            end;
        end;
    end;
    local function v326(v324, v325) --[[ Line: 1406 ]] --[[ Name: createMuteToggles ]]
        -- upvalues: v16 (ref), v17 (ref), v47 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref), v37 (ref), l_Players_0 (ref)
        return v16.createElement(v17.Core.Style.Provider, {
            style = v47
        }, {
            LocalizationProvider = v16.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                MuteToggles = v16.createElement(v37, {
                    Players = l_Players_0, 
                    initialTogglesState = v324, 
                    playersFriends = v325
                })
            })
        });
    end;
    local function _(v327) --[[ Line: 1422 ]] --[[ Name: createInspectButtonImage ]]
        -- upvalues: v21 (ref), v52 (ref), v47 (ref)
        return (v21:MakeStyledImageButton("InspectButton", v52, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v327));
    end;
    local function v336(v329, v330, v331, v332) --[[ Line: 1433 ]] --[[ Name: resizeInspectButton ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_GuiService_0 (ref), l_NewPage_0 (copy), v21 (ref), v52 (ref), v47 (ref)
        local l_Inspect_0 = v329:FindFirstChild("Inspect");
        if l_Inspect_0 and v331 == v332 then
            return;
        else
            if l_Inspect_0 then
                l_Inspect_0:Destroy();
            end;
            local function v334() --[[ Line: 1443 ]]
                -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_GuiService_0 (ref), v330 (copy), l_NewPage_0 (ref)
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsExamineAvatarName, l_Constants_0.AnalyticsMenuActionName, {});
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v330.UserId, "escapeMenu");
                l_NewPage_0.HubRef:SetVisibility(false);
            end;
            l_Inspect_0 = v21:MakeStyledImageButton("InspectButton", v52, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v334);
            l_Inspect_0.Name = "Inspect";
            l_Inspect_0.LayoutOrder = 2;
            l_Inspect_0.Selectable = true;
            l_Inspect_0.Parent = v329;
            if v47.UIBloxThemeEnabled then
                local v335 = "utility-focus-state" .. "-inspect-" .. v330.Name;
                v21:MakeFocusState(l_Inspect_0, v335);
            end;
            return;
        end;
    end;
    local function v345(v337, v338, v339) --[[ Line: 1465 ]] --[[ Name: resizePlatformName ]]
        -- upvalues: l_result_0 (ref), v21 (ref), v47 (ref), l_Create_0 (ref)
        local l_PlatformNameContainer_0 = v337:FindFirstChild("PlatformNameContainer");
        if l_PlatformNameContainer_0 then
            l_PlatformNameContainer_0:Destroy();
            l_PlatformNameContainer_0 = nil;
        end;
        if v338 == nil then
            return;
        else
            l_PlatformNameContainer_0 = Instance.new("Frame");
            l_PlatformNameContainer_0.Name = "PlatformNameContainer";
            l_PlatformNameContainer_0.BackgroundTransparency = 1;
            l_PlatformNameContainer_0.ZIndex = 3;
            l_PlatformNameContainer_0.Position = UDim2.new(0, 0, 0, 0);
            l_PlatformNameContainer_0.Size = UDim2.new(0, 0, 1, 0);
            l_PlatformNameContainer_0.AutomaticSize = Enum.AutomaticSize.X;
            l_PlatformNameContainer_0.Selectable = false;
            l_PlatformNameContainer_0.LayoutOrder = -1;
            l_PlatformNameContainer_0.Parent = v337;
            local v341 = nil;
            if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v339 and v339 ~= "" then
                v341 = function() --[[ Line: 1498 ]]
                    -- upvalues: l_result_0 (ref), v339 (copy)
                    l_result_0:ShowProfile(v339);
                end;
            end;
            local v342, v343 = v21:MakeStyledButton("consoleNameContainer", v338, UDim2.new(0, 0, 0, v47.ButtonHeight), v341);
            v342.AnchorPoint = Vector2.new(0, 0.5);
            v342.Position = UDim2.fromScale(0, 0.5);
            v342.AutomaticSize = Enum.AutomaticSize.X;
            v342.Parent = l_PlatformNameContainer_0;
            v343.Size = UDim2.fromScale(0, 1);
            v343.AutoLocalize = false;
            v343.TextSize = v47.platformNameTextSize;
            v343.TextScaled = false;
            v343.TextWrapped = false;
            v343.AutomaticSize = Enum.AutomaticSize.X;
            local v344 = l_Create_0("ImageLabel")({
                Name = "iconLabel", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v47.platformNameIconSize, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                ImageColor3 = Color3.new(1, 1, 1)
            });
            v344.Parent = v342;
            l_Create_0("UIListLayout")({
                Name = "PLatformNameUIListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }).Parent = v342;
            v344.LayoutOrder = 1;
            v343.LayoutOrder = 2;
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                Parent = v342
            });
            return l_PlatformNameContainer_0;
        end;
    end;
    v281 = function() --[[ Line: 1560 ]]
        -- upvalues: v290 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), v55 (ref), l_GuiService_0 (ref)
        local v346 = v290("ImageLabel", true);
        v346.TextLabel.Name = "DisplayNameLabel";
        v346.SecondRow.Name = "NameLabel";
        if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then
            v346.NameLabel.OpenTypeFeatures = l_OpenTypeSupport_0:getUserNameStylisticAlternative();
        end;
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "RightSideButtons";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.ZIndex = 2;
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_1.Size = UDim2.new(1, v55, 1, 0);
        l_Frame_1.Parent = v346;
        local function _(v348) --[[ Line: 1577 ]]
            -- upvalues: v346 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v346 then
                if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= v348 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                    v346.ImageTransparency = 0.65;
                    return;
                else
                    v346.ImageTransparency = 0.85;
                end;
            end;
        end;
        local v350 = nil;
        l_Frame_1.ChildAdded:connect(function(v351) --[[ Line: 1592 ]]
            -- upvalues: v350 (ref), v346 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v351:IsA("GuiObject") then
                if v350 and v351 ~= v350 then
                    v350:Destroy();
                    v350 = nil;
                end;
                v351.SelectionGained:connect(function() --[[ Line: 1598 ]]
                    -- upvalues: v346 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    if v346 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= nil and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v346.ImageTransparency = 0.65;
                            return;
                        else
                            v346.ImageTransparency = 0.85;
                        end;
                    end;
                end);
                v351.SelectionLost:connect(function() --[[ Line: 1601 ]]
                    -- upvalues: v351 (copy), v346 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    local l_v351_0 = v351;
                    if v346 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= l_v351_0 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v346.ImageTransparency = 0.65;
                            return;
                        else
                            v346.ImageTransparency = 0.85;
                        end;
                    end;
                end);
            end;
        end);
        v350 = Instance.new("Frame");
        v350.Selectable = true;
        v350.Size = UDim2.new(1, 0, 1, 0);
        v350.BackgroundTransparency = 1;
        v350.SelectionImageObject = v350:Clone();
        v350.Parent = l_Frame_1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Name = "RightSideListLayout";
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 12);
        l_UIListLayout_0.Parent = l_Frame_1;
        pcall(function() --[[ Line: 1623 ]]
            -- upvalues: v346 (copy)
            v346.NameLabel.Localize = false;
            v346.DisplayNameLabel.Localize = false;
        end);
        return v346;
    end;
    local function v390(v354, v355) --[[ Line: 1635 ]] --[[ Name: managePlayerNameCutoff ]]
        -- upvalues: v90 (ref), v11 (ref), v12 (ref), l_getInExperienceCombinedNameFromId_0 (ref), v80 (ref), v21 (ref), v63 (ref), v83 (ref), l_formatUsername_0 (ref)
        local v356 = nil;
        local v357 = nil;
        local function v367(v358, v359, v360) --[[ Line: 1638 ]] --[[ Name: reportFlagChanged ]]
            -- upvalues: v356 (ref), v354 (copy), v355 (copy)
            if v359 == "AbsolutePosition" and v356 then
                local v361 = v358.AbsolutePosition.X - 20 - v354.NameLabel.AbsolutePosition.X;
                v354.NameLabel.Text = "@" .. v355.Name;
                v354.DisplayNameLabel.Text = v355.DisplayName;
                if v360 then
                    v354.DisplayNameLabel.Text = v360;
                end;
                local v362 = utf8.len(v355.DisplayName);
                if v360 then
                    v362 = utf8.len(v360);
                end;
                while v361 < v354.NameLabel.TextBounds.X and v362 > 0 do
                    if v360 then
                        local v363 = utf8.offset(v360, v362);
                        v354.NameLabel.Text = string.sub(v360, 1, v363) .. "...";
                    else
                        local v364 = utf8.offset(v355.DisplayName, v362);
                        v354.NameLabel.Text = string.sub(v355.DisplayName, 1, v364) .. "...";
                    end;
                    v362 = v362 - 1;
                end;
                local v365 = "@" .. v355.Name;
                local v366 = string.len(v365);
                while v361 < v354.NameLabel.TextBounds.X and v366 > 0 do
                    v354.NameLabel.Text = string.sub(v365, 1, v366) .. "...";
                    v366 = v366 - 1;
                end;
            end;
        end;
        local function v372(v368, _, _) --[[ Line: 1672 ]] --[[ Name: reportFlagChangedWithCombinedName ]]
            -- upvalues: v90 (ref), v355 (copy), v367 (copy), v11 (ref), v12 (ref), l_getInExperienceCombinedNameFromId_0 (ref)
            if v90 and not v355.UserId then
                v367(v368, "AbsolutePosition");
                return;
            else
                v11:query({
                    query = v12.Queries.userProfilesInExperienceNamesByUserIds, 
                    variables = {
                        userIds = {
                            (tostring(v355.UserId))
                        }
                    }
                }):andThen(function(v371) --[[ Line: 1682 ]]
                    -- upvalues: v367 (ref), v368 (copy), l_getInExperienceCombinedNameFromId_0 (ref), v355 (ref)
                    v367(v368, "AbsolutePosition", l_getInExperienceCombinedNameFromId_0(v371.data, v355.UserId));
                end):catch(function() --[[ Line: 1689 ]]
                    -- upvalues: v367 (ref), v368 (copy)
                    v367(v368, "AbsolutePosition");
                end);
                return;
            end;
        end;
        if not v80() then
            v21:OnResized(v354.NameLabel, function(_, v374) --[[ Line: 1696 ]]
                -- upvalues: v356 (ref), v63 (ref), v21 (ref), v357 (ref), v354 (copy), v372 (copy), v355 (copy), v90 (ref), v11 (ref), v12 (ref), l_getInExperienceCombinedNameFromId_0 (ref)
                if v356 ~= nil and v356 == v374 then
                    return;
                else
                    v374 = v374 and not (v63 and v21:IsSmallTouchScreen() and v21:IsPortrait());
                    v356 = v374;
                    if v374 then
                        if v357 == nil then
                            v357 = v354.RightSideButtons.ChildAdded:connect(function(v375) --[[ Line: 1705 ]]
                                -- upvalues: v372 (ref)
                                if v375.Name == "Inspect" then
                                    v375.Changed:connect(function(_) --[[ Line: 1707 ]]
                                        -- upvalues: v372 (ref), v375 (copy)
                                        v372(v375, "AbsolutePosition");
                                    end);
                                    v372(v375, "AbsolutePosition");
                                end;
                            end);
                        end;
                        local l_Inspect_1 = v354.RightSideButtons:FindFirstChild("Inspect");
                        if l_Inspect_1 then
                            l_Inspect_1.Changed:connect(function(v378) --[[ Line: 1716 ]]
                                -- upvalues: v372 (ref), l_Inspect_1 (copy)
                                v372(l_Inspect_1, v378);
                            end);
                            v372(l_Inspect_1, "AbsolutePosition");
                            return;
                        end;
                    else
                        v354.NameLabel.Text = "@" .. v355.Name;
                        if v90 and not v355.UserId then
                            v354.DisplayNameLabel.Text = v355.DisplayName;
                            return;
                        else
                            v11:query({
                                query = v12.Queries.userProfilesInExperienceNamesByUserIds, 
                                variables = {
                                    userIds = {
                                        (tostring(v355.UserId))
                                    }
                                }
                            }):andThen(function(v379) --[[ Line: 1733 ]]
                                -- upvalues: v354 (ref), l_getInExperienceCombinedNameFromId_0 (ref), v355 (ref)
                                v354.DisplayNameLabel.Text = l_getInExperienceCombinedNameFromId_0(v379.data, v355.UserId);
                            end):catch(function() --[[ Line: 1736 ]]
                                -- upvalues: v354 (ref), v355 (ref)
                                v354.DisplayNameLabel.Text = v355.DisplayName;
                            end);
                        end;
                    end;
                    return;
                end;
            end);
        end;
        local function v383() --[[ Line: 1744 ]] --[[ Name: getNearestRightSideButtonXPosition ]]
            -- upvalues: v354 (copy)
            local v380 = nil;
            for _, v382 in pairs(v354.RightSideButtons:GetChildren()) do
                if v382:IsA("ImageButton") and (not v380 or v382.AbsolutePosition.X < v380) then
                    v380 = v382.AbsolutePosition.X;
                end;
            end;
            return v380;
        end;
        local v384 = nil;
        local function v388() --[[ Line: 1759 ]] --[[ Name: rightSideButtonsChanged ]]
            -- upvalues: v383 (copy), v384 (ref), v354 (copy), v83 (ref), l_formatUsername_0 (ref), v355 (copy), v90 (ref), v11 (ref), v12 (ref), l_getInExperienceCombinedNameFromId_0 (ref)
            local v385 = v383();
            if v385 == v384 then
                return;
            else
                v384 = v385;
                local v386 = nil;
                v386 = if v385 then UDim2.new(0, v385 - v354.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0);
                v354.NameLabel.Size = v386;
                v354.DisplayNameLabel.Size = v386;
                v354.NameLabel.Text = if v83 then l_formatUsername_0(v355.Name) else "@" .. v355.Name;
                if v90 and not v355.UserId then
                    v354.DisplayNameLabel.Text = v355.DisplayName;
                    return;
                else
                    v11:query({
                        query = v12.Queries.userProfilesInExperienceNamesByUserIds, 
                        variables = {
                            userIds = {
                                (tostring(v355.UserId))
                            }
                        }
                    }):andThen(function(v387) --[[ Line: 1795 ]]
                        -- upvalues: v354 (ref), l_getInExperienceCombinedNameFromId_0 (ref), v355 (ref)
                        v354.DisplayNameLabel.Text = l_getInExperienceCombinedNameFromId_0(v387.data, v355.UserId);
                    end):catch(function() --[[ Line: 1798 ]]
                        -- upvalues: v354 (ref), v355 (ref)
                        v354.DisplayNameLabel.Text = v355.DisplayName;
                    end);
                    return;
                end;
            end;
        end;
        if v80() then
            v357 = v354.RightSideButtons.ChildAdded:connect(function(v389) --[[ Line: 1805 ]]
                -- upvalues: v388 (copy)
                v388();
                v389:GetPropertyChangedSignal("AbsolutePosition"):Connect(v388);
            end);
            v388();
        end;
    end;
    local function _() --[[ Line: 1814 ]] --[[ Name: canShareCurrentGame ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return l_LocalPlayer_0.UserId > 0;
    end;
    local v392 = nil;
    local v393 = {};
    local v394 = {};
    local v395 = false;
    local function v403() --[[ Line: 1824 ]] --[[ Name: updateAllMuteButtons ]]
        -- upvalues: v140 (ref), v138 (ref), v136 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), l_default_0 (ref), l_Players_0 (ref), v393 (copy), v68 (ref), v79 (ref), v220 (copy), v205 (ref), v29 (ref)
        if v140 then
            if not v138 then
                return;
            end;
        elseif not v136 then
            return;
        elseif l_GetFFlagEnableShowVoiceUI_0() and not l_default_0.voiceUIVisible then
            return;
        end;
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        local v397 = true;
        for _, v399 in ipairs(l_l_Players_0_Players_0) do
            local v400 = v393[v399.Name];
            if v399 and v400 then
                local v401 = l_default_0.participants[tostring(v399.UserId)];
                if (v68 or l_GetFFlagEnableShowVoiceUI_0()) and v401 then
                    if v79() then
                        if not v401.isMutedLocally then
                            v397 = false;
                        end;
                    elseif not v401.isMutedLocally and not v401.isMuted then
                        v397 = false;
                    end;
                end;
                v220(v400, v401);
            end;
        end;
        if (v68 or l_GetFFlagEnableShowVoiceUI_0()) and not v140 then
            if v397 then
                v205 = true;
            else
                v205 = false;
            end;
            local v402 = v205 and v29:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v29:FormatByKey("Feature.SettingsHub.Action.MuteAll");
            if (v68 or l_GetFFlagEnableShowVoiceUI_0()) and (not v136 or not v136:FindFirstChild("TextLabel")) then
                return;
            else
                v136.TextLabel.Text = v402;
                v136.Icon.Image = l_default_0:GetIcon(v205 and "MuteAll" or "UnmuteAll", "Misc");
            end;
        end;
    end;
    local function v409() --[[ Line: 1881 ]] --[[ Name: destroyAllUserMuteButtons ]]
        -- upvalues: l_Players_0 (ref), v393 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v135 (ref)
        for _, v405 in (l_Players_0:GetPlayers()) do
            local v406 = v393[v405.Name];
            if v406 then
                local l_RightSideButtons_1 = v406:FindFirstChild("RightSideButtons");
                if l_RightSideButtons_1 then
                    local l_MuteStatusButton_1 = l_RightSideButtons_1:FindFirstChild("MuteStatusButton");
                    if l_MuteStatusButton_1 then
                        if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_1 then
                            if l_UserInputService_0.GamepadEnabled then
                                l_GuiService_0.SelectedCoreObject = v135;
                            else
                                l_GuiService_0.SelectedCoreObject = nil;
                            end;
                        end;
                        l_MuteStatusButton_1:Destroy();
                    end;
                end;
            end;
        end;
    end;
    local function v459(_) --[[ Line: 1904 ]]
        -- upvalues: v392 (ref), l_Players_0 (ref), v92 (ref), l_LocalPlayer_0 (ref), v140 (ref), v21 (ref), v282 (ref), v136 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), l_default_0 (ref), v138 (ref), l_GetFFlagEnableAppChatInExperience_0 (ref), l_InExperienceAppChatExperimentation_0 (ref), l_FFlagUpdateSquadInDefaultAppChatContainer_0 (ref), v91 (ref), v93 (ref), v135 (ref), l_RunService_0 (ref), v137 (ref), v148 (ref), l_Create_0 (ref), l_NewPage_0 (copy), v149 (ref), v54 (ref), v57 (ref), v40 (ref), v41 (ref), l_GameInviteAnalytics_0 (ref), l_EventStream_0 (ref), l_RbxAnalyticsService_0 (ref), l_Diag_0 (ref), v278 (ref), v144 (ref), v280 (ref), v146 (ref), v145 (ref), l_GuiService_0 (ref), v393 (copy), v394 (copy), v281 (ref), v220 (copy), l_SocialUtil_0 (ref), v83 (ref), l_formatUsername_0 (ref), v80 (ref), v390 (copy), v174 (copy), v63 (ref), v47 (ref), v55 (ref), v168 (copy), v178 (ref), v336 (copy), v277 (copy), v16 (ref), v326 (copy), v141 (ref), v142 (copy), v279 (ref), v205 (ref), v29 (ref), v64 (ref), v36 (ref), v143 (copy), v33 (ref), v403 (copy), v84 (ref), v90 (ref), v15 (ref), v11 (ref), v12 (ref), v89 (ref), v345 (copy), v395 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), v221 (copy), v236 (copy), l_UserInputService_0 (ref)
        v392 = l_Players_0:GetPlayers();
        if v92 then
            table.sort(v392, function(v411, v412) --[[ Line: 1908 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v413 = v411.Name:lower();
                local v414 = v412.Name:lower();
                if v411 == l_LocalPlayer_0 then
                    v413 = " ";
                end;
                if v412 == l_LocalPlayer_0 then
                    v414 = " ";
                end;
                return v413 < v414;
            end);
        else
            table.sort(v392, function(v415, v416) --[[ Line: 1921 ]]
                return v415.Name:lower() < v416.Name:lower();
            end);
        end;
        local v417 = v140 and 60 or 20;
        if v21:IsSmallTouchScreen() or v21:IsPortrait() then
            v417 = v140 and 125 or 85;
        end;
        local v418 = v282 and not v136;
        if l_GetFFlagEnableShowVoiceUI_0() then
            v418 = v282 and not v136 and l_default_0.voiceUIVisible;
        end;
        local v419 = v282 and not v138;
        if l_GetFFlagEnableShowVoiceUI_0() then
            v419 = l_default_0.voiceUIVisible;
        end;
        local v420 = nil;
        local v421 = nil;
        if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) or l_GetFFlagEnableShowVoiceUI_0() then
            v421 = l_LocalPlayer_0.UserId > 0 and not v135 and not l_RunService_0:IsStudio();
            v420 = not v137;
            if (v421 or v418 or v420) and not v148 then
                v148 = l_Create_0("Frame")({
                    Name = "Holder", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = l_NewPage_0.Page, 
                    LayoutOrder = 1
                });
                v149 = l_Create_0("UIListLayout")({
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20), 
                    Parent = v148
                });
            end;
        elseif not v140 and v418 then
            v148 = l_Create_0("Frame")({
                Name = "Holder", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v54), 
                Parent = l_NewPage_0.Page, 
                LayoutOrder = 1
            });
        end;
        local function v422() --[[ Line: 1981 ]] --[[ Name: layoutMuteAll ]]
            -- upvalues: v148 (ref), l_Create_0 (ref), v54 (ref), l_NewPage_0 (ref), v135 (ref), v57 (ref), v136 (ref)
            if not v148 then
                v148 = l_Create_0("Frame")({
                    Name = "Holder", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v54), 
                    Parent = l_NewPage_0.Page, 
                    LayoutOrder = 1
                });
            end;
            v135.Parent = v148;
            v135.Size = v57;
            v136.Parent = v148;
        end;
        local v423 = not l_RunService_0:IsStudio();
        if l_LocalPlayer_0.UserId > 0 and not v135 and v423 then
            local v424 = nil;
            v424 = if v40() then v41:withButtonName(v41.ButtonName.SettingsHub) else l_GameInviteAnalytics_0.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
            v135 = v278();
            do
                local l_v424_0 = v424;
                v135.Activated:connect(function() --[[ Line: 2013 ]]
                    -- upvalues: l_v424_0 (ref), l_NewPage_0 (ref)
                    l_v424_0:inputShareGameEntryPoint();
                    l_NewPage_0.HubRef:InviteToGame();
                end);
                v135.LayoutOrder = 1;
                if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) then
                    v135.Parent = v148;
                    v144();
                elseif not v140 and v418 then
                    v135.Parent = v148;
                else
                    v135.Parent = l_NewPage_0.Page;
                end;
            end;
        end;
        if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) then
            if v420 then
                v137 = v280();
                v137.Activated:connect(function() --[[ Line: 2036 ]]
                    -- upvalues: l_NewPage_0 (ref)
                    l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.AppChatPage, false);
                end);
                v137.LayoutOrder = l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) and 2 or 3;
                v137.Parent = v148;
                v144();
            end;
            l_NewPage_0.Page:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2044 ]]
                -- upvalues: v146 (ref), v145 (ref), v144 (ref)
                if v146() ~= v145 then
                    v144();
                end;
            end);
        end;
        local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
        for v427 = 1, #v392 do
            local v428 = v392[v427];
            local v429 = nil;
            v429 = v393[v428.Name];
            do
                local l_v429_0 = v429;
                if v428 then
                    v394[v428.Name] = true;
                    if not l_v429_0 or not l_v429_0.Parent then
                        l_v429_0 = v281((v427 - 1) * 80 + v417);
                        l_v429_0.Parent = l_NewPage_0.Page;
                        v393[v428.Name] = l_v429_0;
                    end;
                    l_v429_0.Name = "PlayerLabel" .. v428.Name;
                    if v282 then
                        local v431 = l_default_0.participants[tostring(v428.UserId)];
                        v220(l_v429_0, v431);
                    end;
                    local v432 = l_SocialUtil_0.GetPlayerImage(math.max(1, v428.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail);
                    l_v429_0.Icon.Image = v432;
                    l_v429_0.NameLabel.Text = if v83 then l_formatUsername_0(v428.Name) else "@" .. v428.Name;
                    l_v429_0.ImageTransparency = 0.85;
                    l_v429_0.LayoutOrder = v427 + 1;
                    if v80() then
                        l_v429_0.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_v429_0.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                    end;
                    v390(l_v429_0, v428);
                    v174(l_v429_0, v428);
                    local v433 = nil;
                    do
                        local l_v433_0 = v433;
                        v21:OnResized(l_v429_0, function(_, v436) --[[ Line: 2099 ]]
                            -- upvalues: l_v429_0 (ref), v63 (ref), v21 (ref), v47 (ref), v55 (ref), v168 (ref), v428 (copy), l_v433_0 (ref), v178 (ref), l_l_GuiService_0_InspectMenuEnabled_0 (copy), v336 (ref)
                            local l_RightSideButtons_2 = l_v429_0:FindFirstChild("RightSideButtons");
                            if v63 then
                                local l_DisplayNameLabel_0 = l_v429_0:FindFirstChild("DisplayNameLabel");
                                local l_NameLabel_0 = l_v429_0:FindFirstChild("NameLabel");
                                local v440 = l_RightSideButtons_2 and l_RightSideButtons_2:FindFirstChild("RightSideListLayout");
                                if v63 and v21:IsSmallTouchScreen() and v21:IsPortrait() then
                                    l_v429_0.Size = UDim2.new(1, 0, 0, 105);
                                    if l_DisplayNameLabel_0 then
                                        if l_NameLabel_0 then
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, -10);
                                            l_NameLabel_0.Position = UDim2.new(0, 60, 0.275, 12);
                                        else
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, 0);
                                        end;
                                    end;
                                    if l_RightSideButtons_2 then
                                        l_RightSideButtons_2.Position = UDim2.new(0, 57, 0, -2);
                                        if v47.UIBloxThemeEnabled then
                                            l_RightSideButtons_2.Size = UDim2.new(1, v55, 0.99, -8);
                                        else
                                            l_RightSideButtons_2.Size = UDim2.new(1, v55, 0.99, 0);
                                        end;
                                    end;
                                    if v440 then
                                        v440.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                                        v440.VerticalAlignment = Enum.VerticalAlignment.Bottom;
                                    end;
                                else
                                    l_v429_0.Size = UDim2.new(1, 0, 0, 62);
                                    if l_DisplayNameLabel_0 then
                                        if l_NameLabel_0 then
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, -10);
                                            l_NameLabel_0.Position = UDim2.new(0, 60, 0.5, 12);
                                        else
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, 0);
                                        end;
                                    end;
                                    if l_RightSideButtons_2 then
                                        l_RightSideButtons_2.Position = UDim2.new(0, 0, 0, 0);
                                        l_RightSideButtons_2.Size = UDim2.new(1, v55, 1, 0);
                                    end;
                                    if v440 then
                                        v440.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                                        v440.VerticalAlignment = Enum.VerticalAlignment.Center;
                                    end;
                                end;
                            end;
                            if l_RightSideButtons_2 then
                                v168(l_RightSideButtons_2, v428, v436, l_v433_0);
                                v178(l_RightSideButtons_2, v428, v436, l_v433_0);
                                if l_l_GuiService_0_InspectMenuEnabled_0 then
                                    v336(l_RightSideButtons_2, v428, v436, l_v433_0);
                                end;
                                l_v433_0 = v436;
                            end;
                        end);
                        v277(l_v429_0, v428);
                    end;
                end;
            end;
        end;
        if v140 then
            if v419 then
                v138 = v16.mount(v326(v141, v142), l_NewPage_0.Page, "MuteToggles");
            end;
        elseif v418 then
            v136 = v279();
            v136.Activated:connect(function() --[[ Line: 2187 ]]
                -- upvalues: v205 (ref), v29 (ref), v136 (ref), l_default_0 (ref), v64 (ref), v36 (ref), v143 (ref), v33 (ref), v403 (ref)
                v205 = not v205;
                local v441 = v205 and v29:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v29:FormatByKey("Feature.SettingsHub.Action.MuteAll");
                v136.TextLabel.Text = v441;
                v136.Icon.Image = l_default_0:GetIcon(v205 and "MuteAll" or "UnmuteAll", "Misc");
                if v64() then
                    v36:debug("{} all players", v205 and "Muting" or "Unmuting");
                end;
                if v143 then
                    v143:onToggleMuteAll(v205);
                end;
                l_default_0:MuteAll(v205, v33.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v403();
            end);
            v136.LayoutOrder = l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) and 3 or 1;
            if v84 then
                v422();
            else
                v136.Parent = v148;
            end;
            if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) or l_GetFFlagEnableShowVoiceUI_0() then
                v144();
            end;
        end;
        local v442 = nil;
        v442 = if v90 then v15.List.filterMap(v392, function(v443) --[[ Line: 2220 ]]
            if not v443.UserId then
                return nil;
            else
                return (tostring(v443.UserId));
            end;
        end) else v15.List.filter(v392, function(v444) --[[ Line: 2228 ]]
            return (tostring(v444.UserId));
        end);
        v11:query({
            query = v12.Queries.userProfilesInExperienceNamesByUserIds, 
            variables = {
                userIds = v442
            }
        }):andThen(function(v445) --[[ Line: 2239 ]]
            -- upvalues: v15 (ref), v393 (ref), v89 (ref), v345 (ref)
            v15.List.map(v445.data.userProfiles, function(v446) --[[ Line: 2240 ]]
                -- upvalues: v393 (ref), v89 (ref), v345 (ref)
                local v447 = v393[v446.names.username];
                if v447 then
                    v447.DisplayNameLabel.Text = v446.names.inExperienceCombinedName;
                    if v89 then
                        local l_RightSideButtons_3 = v447:FindFirstChild("RightSideButtons");
                        local v449 = nil;
                        if v446.names.platformName ~= "" then
                            v449 = v446.names.platformName;
                        end;
                        if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
                            v345(l_RightSideButtons_3, v449, v446.platformProfileId);
                            return;
                        else
                            v345(l_RightSideButtons_3, v449);
                        end;
                    end;
                end;
            end);
        end):catch(function() --[[ Line: 2266 ]]
            -- upvalues: v15 (ref), v392 (ref), v393 (ref)
            v15.List.map(v392, function(v450) --[[ Line: 2267 ]]
                -- upvalues: v393 (ref)
                v393[v450.Name].DisplayNameLabel.Text = v450.DisplayName;
            end);
        end);
        local v451 = 0;
        if v282 and not v395 and l_GetFFlagPlayerListAnimateMic_0() then
            v36:debug("Setting Up Playerlist Mic Update Renderstep Hook");
            l_RunService_0:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function() --[[ Line: 2276 ]]
                -- upvalues: v451 (ref), v403 (ref), v221 (ref), v236 (ref)
                v451 = v451 + 1;
                if v451 % 3 == 0 then
                    v403();
                    local l_v221_FirstChild_6 = v221:FindFirstChild("PlayerMuteButtonImageLabel", true);
                    if not l_v221_FirstChild_6 then
                        return;
                    else
                        l_v221_FirstChild_6.Image = v236();
                    end;
                end;
            end);
            v395 = true;
        end;
        for v453, v454 in pairs(v393) do
            if not v394[v453] then
                v454:Destroy();
                v393[v453] = nil;
            end;
        end;
        if l_UserInputService_0.GamepadEnabled then
            l_GuiService_0.SelectedCoreObject = v135;
        end;
        v21:OnResized("MenuPlayerListExtraPageSize", function(_, _) --[[ Line: 2298 ]]
            -- upvalues: v140 (ref), v21 (ref), v392 (ref), v63 (ref), l_NewPage_0 (ref)
            local v457 = v140 and 60 or 20;
            if v21:IsSmallTouchScreen() or v21:IsPortrait() then
                v457 = v140 and 125 or 85;
            end;
            local v458 = #v392 + 1;
            if v63 and v21:IsSmallTouchScreen() and v21:IsPortrait() then
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v457 + 123 * v458 - 5);
                return;
            else
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v457 + 80 * v458 - 5);
                return;
            end;
        end);
    end;
    local function v460() --[[ Line: 2314 ]]
        -- upvalues: v395 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), v36 (ref), l_RunService_0 (ref)
        if v395 and l_GetFFlagPlayerListAnimateMic_0() then
            v36:debug("Unbinding Playerlist Mic Update Renderstep Hook");
            v395 = false;
            l_RunService_0:UnbindFromRenderStep("player-list-mute-update");
        end;
    end;
    if game:GetEngineFeature("VoiceChatSupported") and not v282 then
        l_default_0:asyncInit():andThen(function() --[[ Line: 2324 ]]
            -- upvalues: v70 (ref), v72 (ref), v38 (ref), v73 (ref), v140 (ref), v282 (ref), l_default_0 (ref), v92 (ref), v249 (copy), v263 (copy), v403 (copy), l_GetFFlagPlayerListAnimateMic_0 (ref), v139 (copy), v74 (ref), v142 (copy), v69 (ref), v283 (copy), l_GetFFlagEnableShowVoiceUI_0 (ref), v459 (copy), v141 (ref), v84 (ref), v221 (copy), v136 (ref), v409 (copy), v256 (copy)
            if v70() and v72() then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 2328 ]]
                    -- upvalues: v38 (ref), v73 (ref)
                    return v38:GetLayerData(v73());
                end);
                if not l_status_4 then
                    v140 = false;
                elseif not l_result_4 then
                    v140 = false;
                elseif not l_result_4.ShowMuteToggles then
                    v140 = false;
                else
                    v140 = true;
                end;
            end;
            v282 = true;
            l_default_0:SetupParticipantListeners();
            if not v92 then
                v249();
                v263();
            end;
            l_default_0.participantsUpdate.Event:Connect(function() --[[ Line: 2350 ]]
                -- upvalues: v403 (ref)
                v403();
            end);
            l_default_0.participantLeft.Event:Connect(function(_, v464) --[[ Line: 2353 ]]
                -- upvalues: v403 (ref), l_GetFFlagPlayerListAnimateMic_0 (ref), v139 (ref), v74 (ref), v142 (ref)
                v403();
                if l_GetFFlagPlayerListAnimateMic_0() then
                    v139[v464] = nil;
                end;
                if v74() then
                    v142[v464] = nil;
                end;
            end);
            if v69() then
                l_default_0:getService().StateChanged:Connect(function(_, v466) --[[ Line: 2364 ]]
                    -- upvalues: v283 (ref), v282 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v459 (ref)
                    if v466 == Enum.VoiceChatState.Ended then
                        v283();
                        v282 = false;
                        return;
                    else
                        if v466 == Enum.VoiceChatState.Joined and v282 == false and l_GetFFlagEnableShowVoiceUI_0() then
                            v282 = true;
                            v459();
                        end;
                        return;
                    end;
                end);
            end;
            if v70() then
                l_default_0.userAgencySelected.Event:Connect(function(v467) --[[ Line: 2380 ]]
                    -- upvalues: v141 (ref)
                    v141 = v467;
                end);
            end;
            if v84 then
                v459();
            end;
            if l_GetFFlagEnableShowVoiceUI_0() then
                l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 2388 ]]
                    -- upvalues: v221 (ref), v92 (ref), v249 (ref), v263 (ref), v459 (ref)
                    if not v221:FindFirstChild("PlayerMuteButtonButton", true) and not v92 then
                        v249();
                        v263();
                    end;
                    v459();
                end);
                l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 2394 ]]
                    -- upvalues: v136 (ref), v283 (ref), v409 (ref), v459 (ref), v256 (ref)
                    if v136 then
                        v283();
                    end;
                    v409();
                    v459();
                    v256();
                end);
                l_default_0.muteAllChanged.Event:Connect(function() --[[ Line: 2402 ]]
                    -- upvalues: v403 (ref)
                    v403();
                end);
            end;
        end):catch(function(_) --[[ Line: 2407 ]]
            -- upvalues: v64 (ref), v36 (ref)
            if v64() then
                v36:warning("Failed to init VoiceChatServiceManager");
            end;
        end);
    end;
    if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatTiltMenuEntryPoint2 and (not l_FFlagUpdateSquadInDefaultAppChatContainer_0 or not l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer()) and (not v91 or v93()) then
        l_NewPage_0.Displayed.Event:connect(function() --[[ Line: 2415 ]]
            -- upvalues: v459 (copy)
            v459();
        end);
    else
        l_NewPage_0.Displayed.Event:connect(v459);
    end;
    l_NewPage_0.Hidden.Event:connect(v460);
    l_Players_0.PlayerRemoving:Connect(function(v469) --[[ Line: 2423 ]]
        -- upvalues: v394 (copy), v74 (ref), v142 (copy), v393 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v135 (ref)
        v394[v469.Name] = nil;
        if v74() then
            v142[v469.UserId] = nil;
        end;
        local v470 = v393[v469.Name];
        if not v470 then
            return;
        else
            local l_RightSideButtons_4 = v470:FindFirstChild("RightSideButtons");
            if not l_RightSideButtons_4 then
                return;
            else
                local l_FriendStatus_1 = l_RightSideButtons_4:FindFirstChild("FriendStatus");
                if l_FriendStatus_1 then
                    if l_GuiService_0.SelectedCoreObject == l_FriendStatus_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v135;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_FriendStatus_1:Destroy();
                end;
                local l_ReportPlayer_1 = l_RightSideButtons_4:FindFirstChild("ReportPlayer");
                if l_ReportPlayer_1 then
                    if l_GuiService_0.SelectedCoreObject == l_ReportPlayer_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v135;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_ReportPlayer_1:Destroy();
                end;
                local l_MuteStatusButton_2 = l_RightSideButtons_4:FindFirstChild("MuteStatusButton");
                if l_MuteStatusButton_2 then
                    if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_2 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v135;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_MuteStatusButton_2:Destroy();
                end;
                local l_BlockButton_1 = l_RightSideButtons_4:FindFirstChild("BlockButton");
                if l_BlockButton_1 then
                    if l_GuiService_0.SelectedCoreObject == l_BlockButton_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v135;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_BlockButton_1:Destroy();
                end;
                local l_Inspect_2 = l_RightSideButtons_4:FindFirstChild("Inspect");
                if l_Inspect_2 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_2 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_2:Destroy();
                end;
                return;
            end;
        end;
    end);
    local function v481() --[[ Line: 2497 ]] --[[ Name: removeInspectButtons ]]
        -- upvalues: v393 (copy), l_GuiService_0 (ref)
        for _, v478 in pairs(v393) do
            local l_RightSideButtons_5 = v478:FindFirstChild("RightSideButtons");
            if l_RightSideButtons_5 then
                local l_Inspect_3 = l_RightSideButtons_5:FindFirstChild("Inspect");
                if l_Inspect_3 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_3 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_3:Destroy();
                end;
            end;
        end;
    end;
    l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v482) --[[ Line: 2514 ]]
        -- upvalues: v481 (copy)
        if not v482 then
            v481();
        end;
    end);
    return l_NewPage_0;
end)());