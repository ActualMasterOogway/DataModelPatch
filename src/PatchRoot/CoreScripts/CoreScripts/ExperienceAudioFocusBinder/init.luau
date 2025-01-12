local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Constants;
l_default_0:asyncInit():andThen(function() --[[ Line: 12 ]]
    -- upvalues: l_Constants_0 (copy), l_default_0 (copy), v3 (copy), v2 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
        return game:GetService("AudioFocusService");
    end);
    if l_status_0 and l_result_0 then
        local l_CONTEXT_ID_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID;
        local l_FOCUS_PRIORITY_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY;
        l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
        local function _() --[[ Line: 22 ]]
            -- upvalues: l_default_0 (ref)
            l_default_0:MuteAll(true, "AudioFocusManagement UGC");
            if not l_default_0.localMuted then
                l_default_0:ToggleMic();
            end;
            l_default_0:HideVoiceUI();
        end;
        local function _() --[[ Line: 32 ]]
            -- upvalues: l_default_0 (ref)
            l_default_0:MuteAll(false, "AudioFocusManagement UGC");
            if not l_default_0.localMuted then
                l_default_0:ToggleMic();
            end;
            l_default_0:ShowVoiceUI();
        end;
        l_result_0.OnDeafenVoiceAudio:Connect(function(v12) --[[ Line: 42 ]]
            -- upvalues: l_CONTEXT_ID_0 (copy), v3 (ref), l_default_0 (ref)
            if v12 == l_CONTEXT_ID_0 then
                v3:info("UGC OnDeafenVoiceAudio fired" .. v12);
                l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    l_default_0:ToggleMic();
                end;
                l_default_0:HideVoiceUI();
            end;
        end);
        l_result_0.OnUndeafenVoiceAudio:Connect(function(v13) --[[ Line: 49 ]]
            -- upvalues: l_CONTEXT_ID_0 (copy), v3 (ref), l_default_0 (ref)
            if v13 == l_CONTEXT_ID_0 then
                v3:info("UGC OnUndeafenVoiceAudio fired" .. v13);
                l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    l_default_0:ToggleMic();
                end;
                l_default_0:ShowVoiceUI();
            end;
        end);
        local function _(v14, v15) --[[ Line: 56 ]]
            -- upvalues: v2 (ref), l_result_0 (copy)
            return v2.new(function(v16, v17) --[[ Line: 57 ]]
                -- upvalues: l_result_0 (ref), v14 (copy), v15 (copy)
                local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v14, v15);
                if l_status_1 then
                    v16(l_result_1);
                    return;
                else
                    v17("Failed to call RequestFocus due to an error");
                    return;
                end;
            end);
        end;
        v2.new(function(v21, v22) --[[ Line: 57 ]]
            -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy)
            local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
            if l_status_2 then
                v21(l_result_2);
                return;
            else
                v22("Failed to call RequestFocus due to an error");
                return;
            end;
        end):andThen(function(v25) --[[ Line: 69 ]]
            -- upvalues: v3 (ref), l_default_0 (ref)
            if v25 then
                v3:info("UGC audio focus request granted, preparing to undeafen.");
                l_default_0.muteChanged.Event:Once(function(v26) --[[ Line: 72 ]]
                    -- upvalues: l_default_0 (ref)
                    if v26 ~= nil then
                        l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                    end;
                end);
                l_default_0:ShowVoiceUI();
                return;
            else
                v3:info("UGC audio focus requested denied, preparing to deafen.");
                l_default_0.muteChanged.Event:Once(function(v27) --[[ Line: 80 ]]
                    -- upvalues: l_default_0 (ref)
                    if v27 ~= nil then
                        l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                    end;
                end);
                l_default_0:HideVoiceUI();
                return;
            end;
        end):catch(function() --[[ Line: 88 ]]
            -- upvalues: v3 (ref)
            v3:info("[UGC] Error requesting focus inside UGCdatamodel");
        end);
    end;
end):catch(function() --[[ Line: 93 ]]
    -- upvalues: v3 (copy)
    v3:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]");
end);