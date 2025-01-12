local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local v8 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v9 = game:DefineFastFlag("DebugDefaultChannelStartMuted", true);
local v10 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v11 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v12 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v13 = game:DefineFastFlag("DefaultChannelDontWaitOnCharacterWithAudioApi", false);
local v14 = require(v8.Flags.GetFFlagEnableLuaVoiceChatAnalytics);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local _ = game:GetEngineFeature("VoiceServiceGenerateDefaultChannelAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local v20 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
if v15() then
    v20 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
end;
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.Analytics).new();
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local function v26(v23) --[[ Line: 38 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_0 (copy), v20 (ref), v14 (copy), v21 (copy)
    local v24 = l_default_0:getService();
    if not v24 then
        return nil;
    else
        v20:info("Joining default channel");
        local v25 = v24:JoinByGroupIdToken("default", v23);
        if v14() then
            if v25 then
                v21:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v25;
            else
                v21:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v25;
    end;
end;
if l_game_EngineFeature_2 and v10 then
    if not l_NotificationService_0.IsConnected then
        v20:debug("NotificationService is not yet connected");
        l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
    end;
    v20:debug("NotificationService connected");
end;
if not v13 or not l_VoiceChatService_0.UseNewAudioApi then
    if not l_Players_0.LocalPlayer.Character then
        l_Players_0.LocalPlayer.CharacterAdded:Wait();
        v20:debug("Player character loaded");
    else
        v20:debug("Player character already loaded");
    end;
end;
if l_game_EngineFeature_1 and v11 then
    local l_game_Service_0 = game:FindService("VoiceChatService");
    if v12 then
        if not l_game_Service_0 then
            v20:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
            v20:debug("Default channel is disabled.");
            if v14() then
                v21:reportVoiceChatJoinResult(false, "defaultDisabled");
            end;
            return;
        end;
    elseif not l_game_Service_0 then
        v20:info("VoiceChatService not found. Assuming default values.");
    elseif not l_game_Service_0.EnableDefaultVoice then
        v20:debug("Default channel is disabled.");
        if v14() then
            v21:reportVoiceChatJoinResult(false, "defaultDisabled");
        end;
        return;
    end;
end;
l_default_1:getCallState():andThen(function(v28) --[[ Line: 103 ]]
    -- upvalues: l_Enums_0 (copy), v9 (copy), l_default_0 (copy), v26 (copy), v20 (ref)
    local v29 = if v28.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v28.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then v28.muted else v9;
    l_default_0:asyncInit():andThen(function() --[[ Line: 110 ]]
        -- upvalues: v26 (ref), v29 (copy), l_default_0 (ref)
        if v26(v29) == false then
            l_default_0:InitialJoinFailedPrompt();
        end;
    end):catch(function() --[[ Line: 116 ]]
        -- upvalues: v20 (ref)
        v20:info("VoiceChatServiceManager did not initialize");
    end);
end);
if l_GetFFlagSeamlessVoiceFTUX_0() then
    task.spawn(function() --[[ Line: 125 ]]
        -- upvalues: l_default_0 (copy)
        l_default_0:VoiceChatFirstTimeUX(game:GetService("AppStorageService"));
    end);
end;