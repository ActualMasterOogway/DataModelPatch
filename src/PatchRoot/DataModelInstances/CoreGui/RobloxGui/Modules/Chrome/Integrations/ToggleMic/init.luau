local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v8 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixMicSelection);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagTweakedMicPinning);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local v13 = game:DefineFastFlag("EnableChromeAudioFocusManagement", false);
local l_FFlagFixTopBarSlowLoad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixTopBarSlowLoad;
local v15 = l_game_EngineFeature_0 and v13;
local v16 = require(l_script_FirstAncestor_0.Service);
local v17 = require(l_script_FirstAncestor_0.Integrations.RedVoiceDot);
local v18 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v19 = UDim2.new(0, v18.ICON_SIZE, 0, v18.ICON_SIZE);
local v20 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v21 = nil;
if v9() then
    v21 = v8.new(l_RbxAnalyticsService_0, "Chrome.Integrations.ToggleMic");
end;
local v22 = nil;
local function v24(_) --[[ Line: 37 ]]
    -- upvalues: l_default_0 (copy), v20 (copy), v21 (ref)
    l_default_0:ToggleMic("ChromeIntegrationsToggleMic");
    v20:setLastCtx("SelfView");
    if v21 then
        v21:onToggleMuteSelf(not l_default_0.localMuted);
    end;
end;
local function v26(_) --[[ Line: 45 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:RejoinPreviousChannel();
end;
local function v28(_) --[[ Line: 49 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:ShowVoiceChatLoadingMessage();
end;
v22 = v16:register({
    id = "toggle_mic_mute", 
    label = "CoreScripts.TopBar.ToggleMic", 
    activated = v24, 
    components = {
        Icon = function(_) --[[ Line: 59 ]] --[[ Name: Icon ]]
            -- upvalues: v5 (copy), v19 (copy), v7 (copy), l_Players_0 (copy), v10 (copy), v17 (copy)
            return v5.createElement("Frame", {
                Size = v19, 
                BackgroundTransparency = 1
            }, {
                v5.createElement(v7, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    hideOnError = false, 
                    iconStyle = "MicLight", 
                    selectable = not v10() and nil, 
                    size = v19, 
                    showConnectingShimmer = true
                }), 
                (v5.createElement(v17, {
                    position = UDim2.new(1, -7, 1, -7)
                }))
            });
        end
    }
});
local function v30() --[[ Line: 80 ]] --[[ Name: applyVoiceUIVisibility ]]
    -- upvalues: l_default_0 (copy), v11 (copy), v22 (ref)
    if l_default_0.voiceUIVisible then
        if v11() then
            v22.availability:pinned();
            return;
        else
            v22.availability:available();
            return;
        end;
    else
        v22.availability:unavailable();
        return;
    end;
end;
local function v35(_, v32) --[[ Line: 92 ]] --[[ Name: updateVoiceState ]]
    -- upvalues: v15 (copy), l_default_0 (copy), v11 (copy), v22 (ref), v26 (copy), v28 (copy), v24 (copy)
    if v32 ~= Enum.VoiceChatState.Ended then
        if v15 then
            if l_default_0.voiceUIVisible then
                if v11() then
                    v22.availability:pinned();
                else
                    v22.availability:available();
                end;
            else
                v22.availability:unavailable();
            end;
        elseif v11() then
            v22.availability:pinned();
        else
            v22.availability:available();
        end;
    else
        v22.availability:unavailable();
    end;
    local v33 = v32 == Enum.VoiceChatState.Failed;
    local v34 = true;
    if v32 ~= Enum.VoiceChatState.Joining then
        v34 = v32 == Enum.VoiceChatState.JoiningRetry;
    end;
    if v33 then
        v22.activated = v26;
        return;
    elseif v34 then
        v22.activated = v28;
        return;
    else
        v22.activated = v24;
        return;
    end;
end;
if game:GetEngineFeature("VoiceChatSupported") then
    if l_FFlagFixTopBarSlowLoad_0 then
        task.spawn(function() --[[ Line: 123 ]]
            -- upvalues: l_default_0 (copy), v35 (copy), v15 (copy), v30 (copy), v11 (copy), v22 (ref)
            l_default_0:asyncInit():andThen(function() --[[ Line: 125 ]]
                -- upvalues: l_default_0 (ref), v35 (ref), v15 (ref), v30 (ref), v11 (ref), v22 (ref)
                local v36 = l_default_0:getService();
                if v36 then
                    v36.StateChanged:Connect(v35);
                    l_default_0:SetupParticipantListeners();
                    if v15 then
                        l_default_0.showVoiceUI.Event:Connect(v30);
                        l_default_0.hideVoiceUI.Event:Connect(v30);
                        if l_default_0.voiceUIVisible then
                            if v11() then
                                v22.availability:pinned();
                                return;
                            else
                                v22.availability:available();
                                return;
                            end;
                        else
                            v22.availability:unavailable();
                            return;
                        end;
                    elseif v11() then
                        v22.availability:pinned();
                        return;
                    else
                        v22.availability:available();
                    end;
                end;
            end):catch(function() --[[ Line: 143 ]]

            end);
        end);
    else
        l_default_0:asyncInit():andThen(function() --[[ Line: 147 ]]
            -- upvalues: l_default_0 (copy), v35 (copy), v15 (copy), v30 (copy), v11 (copy), v22 (ref)
            local v37 = l_default_0:getService();
            if v37 then
                v37.StateChanged:Connect(v35);
                l_default_0:SetupParticipantListeners();
                if v15 then
                    l_default_0.showVoiceUI.Event:Connect(v30);
                    l_default_0.hideVoiceUI.Event:Connect(v30);
                    if l_default_0.voiceUIVisible then
                        if v11() then
                            v22.availability:pinned();
                            return;
                        else
                            v22.availability:available();
                            return;
                        end;
                    else
                        v22.availability:unavailable();
                        return;
                    end;
                elseif v11() then
                    v22.availability:pinned();
                    return;
                else
                    v22.availability:available();
                end;
            end;
        end):catch(function() --[[ Line: 165 ]]

        end);
    end;
end;
return v22;