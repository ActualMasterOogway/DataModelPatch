local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSubscriptionFailureUX);
local l_GetFFlagLocalMutedNilFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix;
local v6 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v7 = require(script.Parent.Actions.VoiceEnabledChanged);
local v8 = require(script.Parent.Actions.VoiceStateChanged);
local v9 = require(script.Parent.Actions.ParticipantAdded);
local v10 = require(script.Parent.Actions.ParticipantRemoved);
local v11 = require(script.Parent.Actions.PlayerRemoved);
local l_default_0 = require(script.Parent.VoiceChatServiceManager).default;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants;
local v14 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v15 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
if v6() then
    v15 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
end;
local v16 = nil;
v16 = if v3() then l_Constants_0.VOICE_STATE else l_default_0.VOICE_STATE;
local function _(v17) --[[ Line: 33 ]] --[[ Name: shorten ]]
    return "..." .. string.sub(tostring(v17), -4);
end;
local v19 = nil;
local function v27(v20, v21) --[[ Line: 39 ]] --[[ Name: setVoiceEnabled ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v19 (ref), v15 (ref), v8 (copy), v16 (ref), l_GetFFlagLocalMutedNilFix_0 (copy), l_default_0 (copy)
    local v22 = tostring(l_Players_0.LocalPlayer.UserId);
    local v23 = v20 ~= Enum.VoiceChatState.Ended;
    v21:dispatch(v7(v23));
    if not v19[v20] then
        v15:warning("LOCAL_STATE_MAP does not exist for {} state", v20);
        v21:dispatch(v8(v22, v16.MUTED));
    else
        v21:dispatch(v8(v22, v19[v20]));
    end;
    if v20 == Enum.VoiceChatState.Failed then
        for _, v25 in pairs(l_Players_0:GetPlayers()) do
            local v26 = tostring(v25.UserId);
            if v25 ~= l_Players_0.LocalPlayer then
                v21:dispatch(v8(v26, v16.HIDDEN));
            end;
        end;
        return;
    else
        if v20 == Enum.VoiceChatState.Joined and if l_GetFFlagLocalMutedNilFix_0 then l_default_0.localMuted == false else not l_default_0.localMuted then
            v21:dispatch(v8(v22, v16.INACTIVE));
        end;
        return;
    end;
end;
local function v46(v28) --[[ Line: 69 ]]
    -- upvalues: v19 (ref), v16 (ref), l_default_0 (copy), v15 (ref), l_Players_0 (copy), v9 (copy), v11 (copy), v10 (copy), v8 (copy), v4 (copy), v14 (copy), v27 (copy)
    v19 = {
        [Enum.VoiceChatState.Idle] = v16.HIDDEN, 
        [Enum.VoiceChatState.Joining] = v16.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = v16.CONNECTING, 
        [Enum.VoiceChatState.Joined] = v16.MUTED, 
        [Enum.VoiceChatState.Leaving] = v16.MUTED, 
        [Enum.VoiceChatState.Ended] = v16.HIDDEN, 
        [Enum.VoiceChatState.Failed] = v16.ERROR
    };
    local v29 = l_default_0:getService();
    if not v29 then
        v15:debug("VoiceChatService is not available");
        return;
    else
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        for _, v32 in pairs(l_Players_0:GetPlayers()) do
            v15:trace("Adding existing player {}", "..." .. string.sub(tostring(v32.UserId), -4));
            v28:dispatch(v9((tostring(v32.UserId))));
        end;
        l_Players_0.PlayerAdded:Connect(function(v33) --[[ Line: 93 ]]
            -- upvalues: v15 (ref), v28 (copy), v9 (ref)
            v15:trace("Adding joining player {}", "..." .. string.sub(tostring(v33.UserId), -4));
            v28:dispatch(v9((tostring(v33.userId))));
        end);
        l_Players_0.PlayerRemoving:Connect(function(v34) --[[ Line: 98 ]]
            -- upvalues: v15 (ref), v28 (copy), v11 (ref), v10 (ref)
            v15:trace("Removing player {}", "..." .. string.sub(tostring(v34.UserId), -4));
            v28:dispatch(v11((tostring(v34.userId))));
            v28:dispatch(v10((tostring(v34.userId))));
        end);
        v28:dispatch(v8(l_UserId_0, v16.HIDDEN));
        l_default_0.muteChanged.Event:Connect(function(v35) --[[ Line: 106 ]]
            -- upvalues: v15 (ref), v16 (ref), v28 (copy), v8 (ref), l_UserId_0 (copy)
            v15:debug("Mute changed to {}", v35);
            local v36 = v35 and v16.MUTED or v16.INACTIVE;
            v28:dispatch(v8(l_UserId_0, v36));
        end);
        l_default_0.participantsUpdate.Event:Connect(function(v37) --[[ Line: 112 ]]
            -- upvalues: v16 (ref), v4 (ref), v15 (ref), v28 (copy), v8 (ref)
            for v38, v39 in pairs(v37) do
                local l_INACTIVE_0 = v16.INACTIVE;
                if v39.subscriptionFailed and v4() then
                    l_INACTIVE_0 = v16.ERROR;
                elseif not v39.subscriptionCompleted then
                    l_INACTIVE_0 = v16.CONNECTING;
                elseif v39.isMutedLocally then
                    l_INACTIVE_0 = v16.LOCAL_MUTED;
                elseif v39.isMuted then
                    l_INACTIVE_0 = v16.MUTED;
                elseif v39.isSignalActive then
                    l_INACTIVE_0 = v16.TALKING;
                end;
                v15:trace("Participant update for {}, voice state {}", v38, l_INACTIVE_0);
                v28:dispatch(v8(v38, l_INACTIVE_0));
            end;
        end);
        l_default_0.talkingChanged.Event:Connect(function(v41) --[[ Line: 133 ]]
            -- upvalues: v28 (copy), v8 (ref), l_UserId_0 (copy), v16 (ref)
            if v41 then
                v28:dispatch(v8(l_UserId_0, v16.TALKING));
                return;
            else
                v28:dispatch(v8(l_UserId_0, v16.INACTIVE));
                return;
            end;
        end);
        v14:GetBlockedStatusChangedEvent():Connect(function(v42, v43) --[[ Line: 144 ]]
            -- upvalues: v28 (copy), v10 (ref), v9 (ref)
            if v43 then
                v28:dispatch(v10((tostring(v42))));
                return;
            else
                v28:dispatch(v9((tostring(v42))));
                return;
            end;
        end);
        v15:debug("Initial voice state is {}", v29.VoiceChatState);
        v27(v29.VoiceChatState, v28);
        v29.StateChanged:Connect(function(_, v45) --[[ Line: 154 ]]
            -- upvalues: v15 (ref), v27 (ref), v28 (copy)
            v15:debug("Voice state changed to {}", v45);
            v27(v45, v28);
        end);
        return;
    end;
end;
return function(v47) --[[ Line: 160 ]]
    -- upvalues: l_default_0 (copy), v46 (copy), v15 (ref)
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function() --[[ Line: 163 ]]
            -- upvalues: l_default_0 (ref), v46 (ref), v47 (copy)
            l_default_0:SetupParticipantListeners();
            v46(v47);
        end):catch(function() --[[ Line: 167 ]]
            -- upvalues: v15 (ref)
            v15:warning("Failed to init VoiceChatServiceManager");
        end);
    end;
end;