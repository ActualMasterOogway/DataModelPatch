local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local l_GetFFlagEnablePartyMicIconInChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePartyMicIconInChrome;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local v6 = require(l_script_FirstAncestor_0.Service);
local v7 = require(l_script_FirstAncestor_0.Integrations.Party.PartyMicIcon);
local v8 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_default_0 = v3.CrossExperienceVoiceManager.default;
local v11 = nil;
local v12 = false;
local v13 = l_Signal_0.new();
local v14 = l_Signal_0.new();
v13:connect(function(v15) --[[ Line: 24 ]]
    -- upvalues: v11 (ref)
    v11 = v15;
end);
v14:connect(function(v16) --[[ Line: 28 ]]
    -- upvalues: v12 (ref)
    v12 = v16;
end);
local v17 = nil;
if l_GetFFlagEnablePartyMicIconInChrome_0() and l_GetFFlagEnableCrossExpVoice_0() then
    v17 = v6:register({
        id = v8.TOGGLE_MIC_INTEGRATION_ID, 
        label = "CoreScripts.TopBar.ToggleMic", 
        activated = function() --[[ Line: 38 ]] --[[ Name: activated ]]
            -- upvalues: l_Players_0 (copy), v12 (ref), v11 (ref), l_default_0 (copy)
            local v18 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
            if v18 ~= -1 and v12 and v11 ~= nil then
                if v11 then
                    l_default_0:unmuteVoiceParticipant(v18);
                    return;
                else
                    l_default_0:muteVoiceParticipant(v18);
                end;
            end;
        end, 
        components = {
            Icon = function() --[[ Line: 49 ]] --[[ Name: Icon ]]
                -- upvalues: v7 (copy), v13 (copy), v14 (copy)
                return v7({
                    isLocalPlayerMutedSignal = v13, 
                    isVoiceConnectedSignal = v14
                });
            end
        }, 
        initialAvailability = v6.AvailabilitySignal.Unavailable
    });
end;
return v17;