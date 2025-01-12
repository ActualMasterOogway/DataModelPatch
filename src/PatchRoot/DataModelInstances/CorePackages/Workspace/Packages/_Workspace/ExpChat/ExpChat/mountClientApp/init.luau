local l_Chat_0 = game:GetService("Chat");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v10 = require(l_Parent_0.Promise);
local v11 = require(l_Parent_0.Roact);
local v12 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v14 = require(l_Parent_0.ExpChatShared);
local l_Analytics_0 = v14.Analytics;
local l_countParticipantsInTextChannel_0 = v14.countParticipantsInTextChannel;
local v17 = require(script.Parent.App);
local v18 = v14.Logger:new("ExpChat/" .. script.Name);
local v19 = require(script.Parent.createDispatchBindableEvent);
local v20 = require(l_script_FirstAncestor_0.Events.bindableEventQueue);
local v21 = require(script.Parent.createStore);
local v22 = require(script.Parent.GetNameColor);
local v23 = require(script.Parent.reportMessageReceived);
local l_watchForErrors_0 = v14.watchForErrors;
local l_Commands_0 = v14.Commands;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v27 = require(l_Actions_0.IncomingMessageReceived);
local v28 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v29 = require(l_Actions_0.OutgoingMessageSent);
local l_TextChannelCreated_0 = v14.Actions.TextChannelCreated;
local l_TextChannelRemoved_0 = v14.Actions.TextChannelRemoved;
local l_PlayerAdded_0 = v14.Actions.PlayerAdded;
local l_PlayerRemoved_0 = v14.Actions.PlayerRemoved;
local l_CharacterAdded_0 = v14.Actions.CharacterAdded;
local l_LocalCharacterLoaded_0 = v14.Actions.LocalCharacterLoaded;
local l_LocalTeamChanged_0 = v14.Actions.LocalTeamChanged;
local l_ClientAppLoaded_0 = v14.Actions.ClientAppLoaded;
local v38 = require(l_Actions_0.LastInputTypeChanged);
local v39 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v40 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local l_CommandAliasChanged_0 = v14.Actions.CommandAliasChanged;
local v42 = require(l_Actions_0.HumanoidDied);
local v43 = require(l_Actions_0.AdorneeAdded);
local v44 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v45 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v46 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v14.Actions.LocalTextChannelParticipantRemoved;
local v48 = require(l_script_FirstAncestor_0.displaySystemMessage);
local v49 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v50 = require(l_script_FirstAncestor_0.handleChannelWelcomeMessage);
local v51 = require(l_script_FirstAncestor_0.isPlayerVerified);
local v52 = require(l_script_FirstAncestor_0.GlobalFlags);
local v53 = require(l_Parent_0.SharedFlags);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v55 = require(l_Flags_0.FFlagShowVerifiedBadgeInNewChat);
local v56 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v57 = require(l_Flags_0.getEngineFeatureFlagEnableDisplayBubble);
local v58 = require(l_Flags_0.getFFlagEnablePerBubbleCustomization);
local v59 = game:DefineFastFlag("FixTextChatServiceNotShowingUpInVR", false);
local v60 = game:DefineFastFlag("FixDuplicateBubblesWithChatChat", false);
local v61 = game:DefineFastFlag("ExpChatCheckNilInstance", false);
local v62 = require(l_Flags_0.getFFlagChatTranslationUIEnabled);
local v63 = require(l_Flags_0.getFFlagChatTranslationEnableSystemMessage);
local v64 = require(l_Flags_0.getFFlagExpChatEnableChannelTabsUI);
local l_getFFlagExpChatEnableChannelTabsUIFix_0 = v14.Flags.getFFlagExpChatEnableChannelTabsUIFix;
local v66 = require(l_Flags_0.getFFlagExpChatMoveWhisperWelcome);
local v67 = require(l_Flags_0.getFFlagEnableGradientForChatWindowMessage);
local v68 = require(l_Flags_0.getFFlagExpChatOverridePrefixNameColor);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v53.GetFFlagReenableTextChatForTenFootInterfaces;
getChatTranslationEnabled = function() --[[ Line: 84 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 85 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local l_helpers_0 = script.helpers;
local v73 = require(l_helpers_0.setUpConfigurationObjects);
local v74 = require(l_helpers_0.setUpClientSettings);
local v75 = require(l_helpers_0.waitForFirst);
local l_context_0 = v14.context;
local v77 = require(script.reportVersionLoaded);
local l_Version_0 = v14.Version;
local v79 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v115(v80, v81) --[[ Line: 102 ]] --[[ Name: watchPlayersService ]]
    -- upvalues: v18 (copy), v55 (copy), v51 (copy), l_PlayerAdded_0 (copy), l_Players_0 (copy), l_LocalTeamChanged_0 (copy), v43 (copy), v42 (copy), v79 (copy), v75 (copy), l_LocalCharacterLoaded_0 (copy), l_CharacterAdded_0 (copy), v10 (copy), v48 (copy), l_PlayerRemoved_0 (copy)
    v18:trace("Watching Players service");
    local v82 = {};
    local function v104(v83) --[[ Line: 106 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v18 (ref), v55 (ref), v51 (ref), v81 (copy), l_PlayerAdded_0 (ref), l_Players_0 (ref), l_LocalTeamChanged_0 (ref), v43 (ref), v42 (ref), v79 (ref), v75 (ref), l_LocalCharacterLoaded_0 (ref), l_CharacterAdded_0 (ref), v82 (copy)
        v18:trace("Player added: {} {}", v83.Name, (tostring(v83.UserId)));
        local v84 = v55() and v51(v83) and true or nil;
        v81:dispatch(l_PlayerAdded_0(v83.UserId, v83.Name, v83.DisplayName, v84));
        if v83 == l_Players_0.LocalPlayer then
            v18:trace("Found local player");
            v83:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 115 ]]
                -- upvalues: v81 (ref), l_LocalTeamChanged_0 (ref), v83 (copy)
                v81:dispatch(l_LocalTeamChanged_0(v83.Team));
            end);
        end;
        local function _() --[[ Line: 120 ]] --[[ Name: getHumanoidBinding ]]
            -- upvalues: v83 (copy), v81 (ref), v43 (ref), v42 (ref), v79 (ref)
            local function v90(v85) --[[ Line: 123 ]] --[[ Name: dispatchBubbleChatAdornee ]]
                -- upvalues: v83 (ref), v81 (ref), v43 (ref), v42 (ref)
                local l_root_0 = v85.root;
                local l_humanoid_0 = v85.humanoid;
                local l_humanoidRootPart_0 = v85.humanoidRootPart;
                if l_humanoid_0:IsA("Humanoid") and l_humanoidRootPart_0:IsA("Part") then
                    if l_root_0 and l_humanoidRootPart_0 and v83.Character == l_root_0 then
                        v81:dispatch(v43(v83.UserId, l_root_0, l_humanoid_0));
                    end;
                    local v89 = l_humanoid_0.Died:Connect(function() --[[ Line: 133 ]]
                        -- upvalues: v81 (ref), v42 (ref), v83 (ref)
                        v81:dispatch(v42(v83.UserId));
                    end);
                    return function() --[[ Line: 137 ]] --[[ Name: disconnectHumanoidDied ]]
                        -- upvalues: v89 (copy)
                        if v89 then
                            v89:Disconnect();
                        end;
                    end;
                else
                    return function() --[[ Line: 148 ]]

                    end;
                end;
            end;
            return (v79.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, v90));
        end;
        local function v97(v92) --[[ Line: 123 ]] --[[ Name: dispatchBubbleChatAdornee ]]
            -- upvalues: v83 (copy), v81 (ref), v43 (ref), v42 (ref)
            local l_root_1 = v92.root;
            local l_humanoid_1 = v92.humanoid;
            local l_humanoidRootPart_1 = v92.humanoidRootPart;
            if l_humanoid_1:IsA("Humanoid") and l_humanoidRootPart_1:IsA("Part") then
                if l_root_1 and l_humanoidRootPart_1 and v83.Character == l_root_1 then
                    v81:dispatch(v43(v83.UserId, l_root_1, l_humanoid_1));
                end;
                local v96 = l_humanoid_1.Died:Connect(function() --[[ Line: 133 ]]
                    -- upvalues: v81 (ref), v42 (ref), v83 (ref)
                    v81:dispatch(v42(v83.UserId));
                end);
                return function() --[[ Line: 137 ]] --[[ Name: disconnectHumanoidDied ]]
                    -- upvalues: v96 (copy)
                    if v96 then
                        v96:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 148 ]]

                end;
            end;
        end;
        local v98 = v79.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, v97);
        v97 = function(v99) --[[ Line: 159 ]] --[[ Name: onCharacterAdded ]]
            -- upvalues: v75 (ref), v83 (copy), v18 (ref), l_Players_0 (ref), v81 (ref), l_LocalCharacterLoaded_0 (ref), l_CharacterAdded_0 (ref), v98 (copy)
            if not v99.Parent then
                v75(v99.AncestryChanged, v83.CharacterAdded);
            end;
            if v83.Character ~= v99 or not v99.Parent then
                v18:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v83.UserId)));
                return;
            else
                if v83 == l_Players_0.LocalPlayer then
                    v18:debug("Local character loaded: {}", v99.Name);
                    v81:dispatch(l_LocalCharacterLoaded_0(v99));
                end;
                v81:dispatch(l_CharacterAdded_0(v83.UserId, v99));
                v98:bindRoot(v99);
                return;
            end;
        end;
        local function v101(v100) --[[ Line: 178 ]] --[[ Name: onCharacterRemoving ]]
            -- upvalues: v98 (copy)
            v98:unbindRoot(v100);
        end;
        if v83.Character then
            v97(v83.Character);
        end;
        local v102 = v83.CharacterAdded:Connect(v97);
        local v103 = v83.CharacterRemoving:Connect(v101);
        if not v82[v83.UserId] then
            v82[v83.UserId] = {
                v102, 
                v103
            };
        end;
    end;
    local function v108(v105) --[[ Line: 196 ]] --[[ Name: onNewPlayerAdded ]]
        -- upvalues: v104 (copy), l_Players_0 (ref), v10 (ref), v48 (ref), v80 (copy), v18 (ref)
        v104(v105);
        if l_Players_0.LocalPlayer then
            v10.try(function() --[[ Line: 200 ]]
                -- upvalues: v105 (copy), l_Players_0 (ref)
                return v105:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
            end):andThen(function(v106) --[[ Line: 203 ]]
                -- upvalues: v48 (ref), v105 (copy), v80 (ref)
                if v106 then
                    v48("GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v105.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v80.translator, v80.defaultSystemTextChannel);
                end;
            end):catch(function(v107) --[[ Line: 214 ]]
                -- upvalues: v18 (ref)
                v18:error("Could not fetch friendship status. Error: {}", (tostring(v107)));
            end);
        end;
    end;
    for _, v110 in pairs(l_Players_0:GetPlayers()) do
        if v110:IsA("Player") then
            v104(v110);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v108);
    l_Players_0.PlayerRemoving:Connect(function(v111) --[[ Line: 229 ]]
        -- upvalues: v18 (ref), v81 (copy), l_PlayerRemoved_0 (ref), v82 (copy)
        v18:trace("Player removed: {} {}", v111.Name, (tostring(v111.UserId)));
        v81:dispatch(l_PlayerRemoved_0(v111.UserId));
        local v112 = v82[v111.UserId];
        if v112 then
            for _, v114 in ipairs(v112) do
                v114:Disconnect();
            end;
            v82[v111.UserId] = nil;
        end;
    end);
end;
local function _() --[[ Line: 243 ]] --[[ Name: canShowDefaultChat ]]
    -- upvalues: l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v59 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        return true;
    elseif v59 then
        return not l_GuiService_0:IsTenFootInterface();
    else
        return not l_GuiService_0:IsTenFootInterface() and not l_VRService_0.VREnabled;
    end;
end;
local v118 = {
    canUserChatAsync = function(v117) --[[ Line: 285 ]] --[[ Name: canUserChatAsync ]]
        -- upvalues: l_Chat_0 (copy)
        return l_Chat_0:CanUserChatAsync(v117);
    end
};
return function(v119) --[[ Line: 290 ]]
    -- upvalues: v18 (copy), l_Dictionary_0 (copy), v118 (copy), v21 (copy), v19 (copy), v20 (copy), l_watchForErrors_0 (copy), l_context_0 (copy), v56 (copy), l_Analytics_0 (copy), l_UserInputService_0 (copy), v38 (copy), v12 (copy), v73 (copy), v74 (copy), l_Players_0 (copy), v48 (copy), l_TextChannelCreated_0 (copy), v64 (copy), l_TextChatService_0 (copy), v22 (copy), v67 (copy), v68 (copy), v49 (copy), v23 (copy), v50 (copy), v66 (copy), v27 (copy), l_TextChannelRemoved_0 (copy), v29 (copy), l_countParticipantsInTextChannel_0 (copy), v61 (copy), v46 (copy), l_getFFlagExpChatEnableChannelTabsUIFix_0 (copy), l_LocalTextChannelParticipantRemoved_0 (copy), l_HttpService_0 (copy), v62 (copy), v52 (copy), v28 (copy), l_Chat_0 (copy), v60 (copy), v44 (copy), v45 (copy), v57 (copy), v58 (copy), l_Commands_0 (copy), l_CommandAliasChanged_0 (copy), v10 (copy), v39 (copy), v40 (copy), v115 (copy), v11 (copy), v17 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v59 (copy), l_GuiService_0 (copy), l_VRService_0 (copy), l_ClientAppLoaded_0 (copy), l_StarterGui_0 (copy), v77 (copy), l_Version_0 (copy), v63 (copy)
    v18:trace("mountClientApp started");
    v119 = l_Dictionary_0.join(v118, v119);
    local v120 = v21();
    v19(v120);
    v20:flush();
    l_watchForErrors_0(game:GetService("ScriptContext"), v119.script, false);
    l_context_0.translator = v119.translator;
    l_context_0.store = v120;
    l_context_0.apolloClient = if v56() then v119.apolloClient else nil;
    if v119.analytics then
        l_Analytics_0.with(v119.analytics);
    end;
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v121) --[[ Line: 311 ]]
        -- upvalues: v120 (copy), v38 (ref)
        v120:dispatch(v38(v121));
    end);
    if v119.defaultSystemTextChannel then
        v119.defaultSystemTextChannel.OnIncomingMessage = function(v122) --[[ Line: 316 ]]
            -- upvalues: v18 (ref), v12 (ref)
            v18:trace("System OnIncomingMessage started: {} {}", v122.PrefixText, v122.Text);
            local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
            l_TextChatMessageProperties_0.Text = string.format("<font color=\"#%s\">%s</font>", if string.find(v122.Metadata, "Error") then v12.App.Style.Colors.Red:ToHex() else v12.App.Style.Colors.LightGrey:ToHex(), v122.Text);
            v18:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
            return l_TextChatMessageProperties_0;
        end;
    end;
    v73(v120, v119);
    v74(v120);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 338 ]]
            -- upvalues: l_LocalPlayer_0 (copy), v48 (ref), v119 (ref)
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v48("GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v119.translator, v119.defaultSystemTextChannel);
            end;
        end);
    end;
    local function v145(v126) --[[ Line: 352 ]] --[[ Name: handleMessageReceived ]]
        -- upvalues: v120 (copy), l_TextChannelCreated_0 (ref), v64 (ref), l_TextChatService_0 (ref), v22 (ref), v67 (ref), v68 (ref), v18 (ref), l_Players_0 (ref), l_LocalPlayer_0 (copy), v49 (ref), v119 (ref), v23 (ref), v50 (ref), v48 (ref), v66 (ref), v27 (ref), l_Analytics_0 (ref)
        v120:dispatch(l_TextChannelCreated_0(v126));
        local v127 = false;
        if v64() then
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            if l_ChannelTabsConfiguration_0 then
                v127 = l_ChannelTabsConfiguration_0.Enabled;
            end;
        end;
        if string.find(v126.Name, "RBXGeneral") then
            v126.OnIncomingMessage = function(v129) --[[ Line: 364 ]]
                -- upvalues: v22 (ref), v67 (ref), v68 (ref)
                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                if v129.TextSource then
                    local v131 = v22(v129.TextSource.UserId);
                    if not v67() or not v68() or not v129.ChatWindowMessageProperties then
                        l_TextChatMessageProperties_1.PrefixText = string.format("<font color=\"#%s\">%s</font>", v131:ToHex(), v129.PrefixText);
                    end;
                end;
                return l_TextChatMessageProperties_1;
            end;
        elseif string.find(v126.Name, "^RBXTeam") then
            v126.OnIncomingMessage = function(v132) --[[ Line: 384 ]]
                -- upvalues: v18 (ref), l_Players_0 (ref), v127 (ref)
                v18:trace("Team OnIncomingMessage started: {} {}", v132.PrefixText, v132.Text);
                local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                if l_Players_0.LocalPlayer then
                    local l_Color_0 = l_Players_0.LocalPlayer.TeamColor.Color;
                    local v135 = v127 and "" or "[Team] ";
                    l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", l_Color_0:ToHex(), v135, v132.PrefixText);
                end;
                v18:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                return l_TextChatMessageProperties_2;
            end;
        elseif string.find(v126.Name, "^RBXWhisper") and l_LocalPlayer_0 then
            v126.OnIncomingMessage = function(v136) --[[ Line: 405 ]]
                -- upvalues: v49 (ref), v126 (copy), l_LocalPlayer_0 (ref), v127 (ref), v119 (ref), v22 (ref)
                local l_TextSource_0 = v136.TextSource;
                if l_TextSource_0 then
                    local v138 = v49(v126, l_LocalPlayer_0);
                    if v138 then
                        local v139 = nil;
                        if not v127 then
                            v139 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v119.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                RBX_NAME = v138
                            }) else v119.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                RBX_NAME = v138
                            });
                        end;
                        local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                        local v141 = v22(l_TextSource_0.UserId);
                        l_TextChatMessageProperties_3.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if v139 then v139 .. " " else "", v141:ToHex(), v136.PrefixText);
                        return l_TextChatMessageProperties_3;
                    end;
                end;
                return nil;
            end;
        end;
        v126.MessageReceived:Connect(function(v142) --[[ Line: 442 ]]
            -- upvalues: v18 (ref), l_LocalPlayer_0 (ref), v23 (ref), v50 (ref), v48 (ref), v119 (ref), v66 (ref), v120 (ref), v27 (ref), l_Analytics_0 (ref)
            v18:debug("Incoming MessageReceived Status: {} Text: {}", v142.Status.Name, v142.Text);
            if l_LocalPlayer_0 then
                v23(l_LocalPlayer_0.UserId, v142);
            end;
            if l_LocalPlayer_0 and v142.TextSource and v142.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                local v143 = v50(v142, l_LocalPlayer_0);
                if v143 then
                    v48(v143.key, v143.args, v143.metadata, v119.translator, if v66() then v142.TextChannel else v119.defaultSystemTextChannel);
                end;
            end;
            local v144 = l_LocalPlayer_0 and v142.TextSource and v142.TextSource.UserId == l_LocalPlayer_0.UserId;
            v120:dispatch(v27(v142, v144));
            if v142.Status == Enum.TextChatMessageStatus.Floodchecked then
                v48("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v119.translator, v119.defaultSystemTextChannel);
            elseif v142.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                v48("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v119.translator, v119.defaultSystemTextChannel);
            elseif v142.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                v48("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v119.translator, v119.defaultSystemTextChannel);
            elseif v142.Status == Enum.TextChatMessageStatus.MessageTooLong then
                v48("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v119.translator, v119.defaultSystemTextChannel);
            elseif game:GetEngineFeature("ModerationTimeoutSystemMessage") and v142.Status == Enum.TextChatMessageStatus.ModerationTimeout then
                v48("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", v119.translator, v119.defaultSystemTextChannel);
            elseif v142.Status == Enum.TextChatMessageStatus.Unknown then
                v48("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v119.translator, v119.defaultSystemTextChannel);
            end;
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageResponse", {
                messageStatus = v142.Status.Name
            });
        end);
    end;
    local function _(v146) --[[ Line: 538 ]] --[[ Name: watchTextChatCommand ]]
        -- upvalues: l_Analytics_0 (ref)
        v146.Triggered:Connect(function() --[[ Line: 539 ]]
            -- upvalues: l_Analytics_0 (ref), v146 (copy)
            l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v146.Name
            });
        end);
    end;
    for _, v149 in pairs(l_TextChatService_0:GetDescendants()) do
        if v149:IsA("TextChannel") then
            v145(v149);
        elseif v149:IsA("TextChatCommand") then
            v149.Triggered:Connect(function() --[[ Line: 539 ]]
                -- upvalues: l_Analytics_0 (ref), v149 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v149.Name
                });
            end);
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v150) --[[ Line: 555 ]]
        -- upvalues: v145 (copy), l_Analytics_0 (ref)
        if v150:IsA("TextChannel") then
            v145(v150);
            return;
        else
            if v150:IsA("TextChatCommand") then
                v150.Triggered:Connect(function() --[[ Line: 539 ]]
                    -- upvalues: l_Analytics_0 (ref), v150 (copy)
                    l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v150.Name
                    });
                end);
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v151) --[[ Line: 563 ]]
        -- upvalues: v120 (copy), l_TextChannelRemoved_0 (ref)
        if v151:IsA("TextChannel") then
            v120:dispatch(l_TextChannelRemoved_0(v151));
        end;
    end);
    l_TextChatService_0.SendingMessage:Connect(function(v152) --[[ Line: 569 ]]
        -- upvalues: v18 (ref), l_LocalPlayer_0 (copy), v50 (ref), v48 (ref), v119 (ref), v66 (ref), v120 (copy), v29 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        v18:debug("Outgoing SendingMessage Status: {} Text: {}", v152.Status.Name, v152.Text);
        if l_LocalPlayer_0 then
            local v153 = v50(v152, l_LocalPlayer_0);
            if v153 and v153.key then
                v48(v153.key, v153.args, v153.metadata, v119.translator, if v66() then v152.TextChannel else v119.defaultSystemTextChannel);
            end;
        end;
        v120:dispatch(v29(v152));
        local l_TextChannel_0 = v152.TextChannel;
        if l_TextChannel_0 then
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_0)
            });
        end;
    end);
    local function _(v155) --[[ Line: 597 ]] --[[ Name: isInstanceALocalTextChannelParticipant ]]
        -- upvalues: v61 (ref), l_Players_0 (ref)
        local v156;
        if v61 then
            v156 = v155;
            if v156 then
                v156 = v155:IsA("TextSource");
                if v156 then
                    v156 = l_Players_0.LocalPlayer;
                    if v156 then
                        return l_Players_0.LocalPlayer.UserId == v155.UserId;
                    end;
                end;
            end;
        else
            v156 = v155:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v155.UserId;
        end;
        return v156;
    end;
    if v64() then
        for _, v159 in pairs(l_TextChatService_0:GetDescendants()) do
            if v159.Parent and v159.Parent:IsA("TextChannel") and if v61 then v159 and v159:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v159.UserId else v159:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v159.UserId then
                v120:dispatch(v46(v159.Parent));
            end;
            if v159:IsA("TextChannel") then
                v159.DescendantRemoving:Connect(function(v160) --[[ Line: 617 ]]
                    -- upvalues: v61 (ref), l_Players_0 (ref), l_getFFlagExpChatEnableChannelTabsUIFix_0 (ref), v120 (copy), l_LocalTextChannelParticipantRemoved_0 (ref), v159 (copy)
                    if (if v61 then v160 and v160:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v160.UserId else v160:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v160.UserId) and l_getFFlagExpChatEnableChannelTabsUIFix_0() then
                        v120:dispatch(l_LocalTextChannelParticipantRemoved_0(v159));
                    end;
                end);
            end;
        end;
        l_TextChatService_0.DescendantAdded:Connect(function(v161) --[[ Line: 625 ]]
            -- upvalues: v61 (ref), l_Players_0 (ref), v120 (copy), v46 (ref), l_getFFlagExpChatEnableChannelTabsUIFix_0 (ref), l_LocalTextChannelParticipantRemoved_0 (ref)
            if v161.Parent and v161.Parent:IsA("TextChannel") and if v61 then v161 and v161:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v161.UserId else v161:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v161.UserId then
                v120:dispatch(v46(v161.Parent));
            end;
            if v161:IsA("TextChannel") then
                v161.DescendantRemoving:Connect(function(v162) --[[ Line: 635 ]]
                    -- upvalues: v61 (ref), l_Players_0 (ref), l_getFFlagExpChatEnableChannelTabsUIFix_0 (ref), v120 (ref), l_LocalTextChannelParticipantRemoved_0 (ref), v161 (copy)
                    if (if v61 then v162 and v162:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v162.UserId else v162:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v162.UserId) and l_getFFlagExpChatEnableChannelTabsUIFix_0() then
                        v120:dispatch(l_LocalTextChannelParticipantRemoved_0(v161));
                    end;
                end);
            end;
        end);
    end;
    local function v172(v163, v164, v165) --[[ Line: 644 ]] --[[ Name: runOnBubbleDisplayed ]]
        -- upvalues: l_Players_0 (ref), l_HttpService_0 (ref), v62 (ref), v52 (ref), v120 (copy), v28 (ref)
        local v166 = nil;
        if v163:IsA("Model") then
            v166 = l_Players_0:GetPlayerFromCharacter(v163);
        end;
        local v167 = l_HttpService_0:GenerateGUID(false);
        local v168 = nil;
        local v169 = nil;
        if v165 then
            v167 = v165.MessageId;
            v168 = v165.BubbleChatMessageProperties;
            v169 = if v62() then v165.Translation else nil;
        end;
        local v170 = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000);
        local v171 = {
            message = v164, 
            translation = v169, 
            bubbleChatMessageId = v167, 
            bubbleChatMessageUserId = v166 and tostring(v166.UserId) or nil, 
            partOrModel = v163, 
            timestamp = if v52.ConsolidateBubbleChat then v170 else DateTime.now(), 
            bubbleChatMessageProperties = v168
        };
        v120:dispatch(v28(v171));
    end;
    l_Chat_0.Chatted:Connect(function(v173, v174) --[[ Line: 675 ]]
        -- upvalues: v60 (ref), l_TextChatService_0 (ref), l_Chat_0 (ref), v172 (copy)
        if not v60 or l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.LegacyChatService or l_Chat_0.BubbleChatEnabled then
            v172(v173, v174);
        end;
    end);
    if v52.ConsolidateBubbleChat then
        local function v176() --[[ Line: 686 ]]
            -- upvalues: l_Chat_0 (ref), v120 (copy), v44 (ref)
            local l_BubbleChatEnabled_0 = l_Chat_0.BubbleChatEnabled;
            v120:dispatch(v44("Enabled", l_BubbleChatEnabled_0));
        end;
        l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v176);
        local l_BubbleChatEnabled_1 = l_Chat_0.BubbleChatEnabled;
        v120:dispatch(v44("Enabled", l_BubbleChatEnabled_1));
        l_Chat_0.BubbleChatSettingsChanged:Connect(function(v178) --[[ Line: 695 ]]
            -- upvalues: v119 (ref), v120 (copy), v45 (ref)
            if v119.validateLegacyBubbleChatSettings then
                local v179, v180 = v119.validateLegacyBubbleChatSettings(v178);
                assert(v179, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v180 or ""));
                v120:dispatch(v45(v178));
            end;
        end);
    end;
    if v57() and v58() then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v181, v182) --[[ Line: 709 ]]
            -- upvalues: v172 (copy)
            v172(v181, v182 and v182.Text, v182);
        end);
    end;
    local function v186(v183) --[[ Line: 714 ]] --[[ Name: findCommandInstance ]]
        -- upvalues: l_TextChatService_0 (ref)
        for _, v185 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v185.Name == v183 and v185:IsA("TextChatCommand") then
                return v185;
            end;
        end;
        return nil;
    end;
    for _, v188 in ipairs(l_Commands_0.enabledCommands) do
        if v188.clientRun then
            local v189 = v186(v188.name);
            if v189 then
                v189.Triggered:Connect(function(v190, ...) --[[ Line: 728 ]]
                    -- upvalues: v188 (copy), v120 (copy), v48 (ref), v119 (ref)
                    if v190 then
                        local v191 = v188.clientRun(v120, v190.UserId, ...);
                        if v191 then
                            v48(v191.key, v191.args, v191.metadata, v119.translator, v119.defaultSystemTextChannel);
                        end;
                    end;
                end);
                if string.find(v189.Name, "RBXTeamCommand") or string.find(v189.Name, "RBXWhisperCommand") then
                    for _, v193 in {
                        "PrimaryAlias", 
                        "SecondaryAlias"
                    } do
                        v189:GetPropertyChangedSignal(v193):Connect(function() --[[ Line: 748 ]]
                            -- upvalues: v120 (copy), l_CommandAliasChanged_0 (ref), v189 (copy)
                            v120:dispatch(l_CommandAliasChanged_0(v189.Name, v189.PrimaryAlias, v189.SecondaryAlias));
                        end);
                    end;
                end;
            end;
        end;
    end;
    if v119.canUserChatAsync and l_Players_0.LocalPlayer then
        v10.try(function() --[[ Line: 764 ]]
            -- upvalues: v119 (ref), l_Players_0 (ref)
            return v119.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v194) --[[ Line: 767 ]]
            -- upvalues: v120 (copy), v39 (ref)
            v120:dispatch(v39(v194));
        end):catch(function() --[[ Line: 770 ]]
            -- upvalues: v120 (copy), v40 (ref)
            v120:dispatch(v40());
        end);
    end;
    v115(v119, v120);
    local l_AppStyleProvider_0 = v12.App.Style.AppStyleProvider;
    local l_Constants_0 = v12.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v199 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v200 = v11.createElement(l_AppStyleProvider_0, {
        style = v199.Dark
    }, {
        app = v11.createElement(v17, {
            store = v120, 
            translator = v119.translator, 
            gameTranslator = if v64() then v119.gameTranslator else nil, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isChannelBarVisible = false, 
            isDefaultChatEnabled = l_GetFFlagReenableTextChatForTenFootInterfaces_0() and true or if v59 then not l_GuiService_0:IsTenFootInterface() else not l_GuiService_0:IsTenFootInterface() and not l_VRService_0.VREnabled, 
            getIconVoiceIndicator = v119.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v119.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v119.onClickedCameraIndicator, 
            selfViewListenerChanged = v119.selfViewListenerChanged, 
            getPermissions = v119.getPermissions, 
            displayCameraDeniedToast = v119.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v119.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v119.isCameraOnlyUser, 
            isVoiceServiceInitialized = v119.isVoiceServiceInitialized, 
            onClickedLikelySpeakingBubble = v119.onClickedLikelySpeakingBubble, 
            isSpatialUIEnabled = v119.isSpatialUIEnabled
        })
    });
    v120:dispatch(l_ClientAppLoaded_0({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled, 
        isGamepadConnected = if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then l_UserInputService_0.GamepadConnected else nil
    }));
    v77(l_Analytics_0, l_Version_0[1]);
    v18:trace("Roact.mount to {}", (tostring(v119.parent)));
    local v201 = v11.mount(v200, v119.parent, "ExperienceChat");
    if v62() and v63() and getChatTranslationEnabled() then
        v48("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v119.translator, v119.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v201
    };
end;