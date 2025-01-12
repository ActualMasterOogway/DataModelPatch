local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v4 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v5 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_VOICE_JOIN_PROGRESS_0 = v4.VOICE_JOIN_PROGRESS;
local v7 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_observeCurrentContextId_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId;
local l_CONTEXT_ID_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
local l_GetFFlagEnableJoinVoiceOnUnibar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableJoinVoiceOnUnibar;
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local v13 = game:DefineFastFlag("JoinVoiceHideWhenPartyVoiceFocused", false);
local v14 = require(l_script_FirstAncestor_0.Service);
local v15 = false;
local l_Unavailable_0 = v14.AvailabilitySignal.Unavailable;
local v17 = nil;
v17 = v14:register({
    initialAvailability = v14.AvailabilitySignal.Unavailable, 
    id = "join_voice", 
    label = "CoreScripts.TopBar.JoinVoice", 
    activated = function() --[[ Line: 35 ]] --[[ Name: activated ]]
        -- upvalues: l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_RobloxGui_0 (copy), l_default_0 (copy)
        local v18 = if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then require(l_RobloxGui_0.Modules.Settings.SettingsHub) else nil;
        l_default_0:JoinVoice(v18);
    end, 
    components = {
        Icon = function() --[[ Line: 42 ]] --[[ Name: Icon ]]
            -- upvalues: v5 (copy)
            return v5("icons/controls/publicAudioJoin");
        end
    }
});
local function _(v19) --[[ Line: 48 ]] --[[ Name: setAvailability ]]
    -- upvalues: l_Unavailable_0 (ref), v15 (ref), v14 (copy), v17 (ref)
    l_Unavailable_0 = v19;
    if not v15 then
        if v19 == v14.AvailabilitySignal.Available then
            v17.availability:available();
            return;
        elseif v19 == v14.AvailabilitySignal.Unavailable then
            v17.availability:unavailable();
        end;
    end;
end;
local function v24(v21) --[[ Line: 59 ]] --[[ Name: HideOrShowJoinVoiceButton ]]
    -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy), v13 (copy), v14 (copy), l_Unavailable_0 (ref), v15 (ref), v17 (ref), l_default_0 (copy), v4 (copy), v7 (copy)
    if v21 == l_VOICE_JOIN_PROGRESS_0.Suspended then
        if v13 then
            local l_Available_0 = v14.AvailabilitySignal.Available;
            l_Unavailable_0 = l_Available_0;
            if not v15 then
                if l_Available_0 == v14.AvailabilitySignal.Available then
                    v17.availability:available();
                    return;
                elseif l_Available_0 == v14.AvailabilitySignal.Unavailable then
                    v17.availability:unavailable();
                    return;
                end;
            end;
        else
            v17.availability:available();
            return;
        end;
    elseif v21 == l_VOICE_JOIN_PROGRESS_0.Joined then
        if v13 then
            local l_Unavailable_1 = v14.AvailabilitySignal.Unavailable;
            l_Unavailable_0 = l_Unavailable_1;
            if not v15 then
                if l_Unavailable_1 == v14.AvailabilitySignal.Available then
                    v17.availability:available();
                elseif l_Unavailable_1 == v14.AvailabilitySignal.Unavailable then
                    v17.availability:unavailable();
                end;
            end;
        else
            v17.availability:unavailable();
        end;
        if l_default_0.inExpUpsellEntrypoint == v4.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
            l_default_0:ToggleMic();
            l_default_0:showPrompt(v7.VoiceConsentAcceptedToast);
        end;
    end;
end;
if v13 then
    l_observeCurrentContextId_0(function(v25) --[[ Line: 81 ]]
        -- upvalues: l_CONTEXT_ID_0 (copy), v15 (ref), l_Unavailable_0 (ref), v17 (ref), v14 (copy)
        local v26 = v25 == l_CONTEXT_ID_0;
        if v15 ~= v26 then
            v15 = v26;
            if v15 then
                l_Unavailable_0 = v17.availability:get();
                v17.availability:unavailable();
                return;
            else
                local l_l_Unavailable_0_0 = l_Unavailable_0;
                l_Unavailable_0 = l_l_Unavailable_0_0;
                if not v15 then
                    if l_l_Unavailable_0_0 == v14.AvailabilitySignal.Available then
                        v17.availability:available();
                        return;
                    elseif l_l_Unavailable_0_0 == v14.AvailabilitySignal.Unavailable then
                        v17.availability:unavailable();
                    end;
                end;
            end;
        end;
    end);
end;
if l_GetFFlagEnableJoinVoiceOnUnibar_0() and game:GetEngineFeature("VoiceChatSupported") then
    if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then
        task.spawn(function() --[[ Line: 97 ]]
            -- upvalues: l_default_0 (copy), v13 (copy), v14 (copy), l_Unavailable_0 (ref), v15 (ref), v17 (ref), v24 (copy)
            if l_default_0:ShouldShowJoinVoice() then
                if v13 then
                    local l_Available_1 = v14.AvailabilitySignal.Available;
                    l_Unavailable_0 = l_Available_1;
                    if not v15 then
                        if l_Available_1 == v14.AvailabilitySignal.Available then
                            v17.availability:available();
                        elseif l_Available_1 == v14.AvailabilitySignal.Unavailable then
                            v17.availability:unavailable();
                        end;
                    end;
                else
                    v17.availability:available();
                end;
            end;
            l_default_0.VoiceJoinProgressChanged.Event:Connect(v24);
        end);
    else
        if l_default_0:ShouldShowJoinVoice() then
            if v13 then
                local l_Available_2 = v14.AvailabilitySignal.Available;
                l_Unavailable_0 = l_Available_2;
                if not v15 then
                    if l_Available_2 == v14.AvailabilitySignal.Available then
                        v17.availability:available();
                    elseif l_Available_2 == v14.AvailabilitySignal.Unavailable then
                        v17.availability:unavailable();
                    end;
                end;
            else
                v17.availability:available();
            end;
        end;
        l_default_0.VoiceJoinProgressChanged.Event:Connect(v24);
    end;
    if v11() then
        l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 122 ]]
            -- upvalues: v13 (copy), v14 (copy), l_Unavailable_0 (ref), v15 (ref), v17 (ref)
            if v13 then
                local l_Unavailable_2 = v14.AvailabilitySignal.Unavailable;
                l_Unavailable_0 = l_Unavailable_2;
                if not v15 then
                    if l_Unavailable_2 == v14.AvailabilitySignal.Available then
                        v17.availability:available();
                        return;
                    elseif l_Unavailable_2 == v14.AvailabilitySignal.Unavailable then
                        v17.availability:unavailable();
                        return;
                    end;
                end;
            else
                v17.availability:unavailable();
            end;
        end);
        l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 129 ]]
            -- upvalues: v13 (copy), v14 (copy), l_Unavailable_0 (ref), v15 (ref), v17 (ref)
            if v13 then
                local l_Available_3 = v14.AvailabilitySignal.Available;
                l_Unavailable_0 = l_Available_3;
                if not v15 then
                    if l_Available_3 == v14.AvailabilitySignal.Available then
                        v17.availability:available();
                        return;
                    elseif l_Available_3 == v14.AvailabilitySignal.Unavailable then
                        v17.availability:unavailable();
                        return;
                    end;
                end;
            else
                v17.availability:available();
            end;
        end);
    else
        l_default_0.VoiceJoinProgressChanged.Event:Connect(v24);
    end;
end;
return v17;