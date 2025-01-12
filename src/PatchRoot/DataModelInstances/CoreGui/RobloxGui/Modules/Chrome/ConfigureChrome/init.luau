local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
if not require(l_script_FirstAncestor_0.Enabled)() then
    return;
else
    local v2 = require(l_script_FirstAncestor_0.ChromeShared.Analytics.ChromeAnalytics);
    local v3 = require(l_script_FirstAncestor_0.Service);
    local v4 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
    local v5 = require(l_script_FirstAncestor_0.Integrations.Connect.isConnectUnibarEnabled);
    local v6 = require(l_script_FirstAncestor_0.Integrations.Connect.isConnectDropdownEnabled);
    local v7 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSongbirdPeek);
    local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
    local l_GetFFlagEnableSaveUserPins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSaveUserPins;
    local l_GetFFlagEnableChromePinAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinAnalytics;
    local l_GetFFlagEnableChromePinIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinIntegrations;
    local l_GetFFlagEnablePartyMicIconInChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePartyMicIconInChrome;
    local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSongbirdInChrome);
    local l_GetFFlagEnableJoinVoiceOnUnibar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableJoinVoiceOnUnibar;
    local function _() --[[ Line: 30 ]] --[[ Name: initializeIntegrations ]]
        -- upvalues: l_script_FirstAncestor_0 (copy)
        require(l_script_FirstAncestor_0.Integrations);
    end;
    local function v20() --[[ Line: 34 ]] --[[ Name: configureUnibar ]]
        -- upvalues: l_GetFFlagEnablePartyMicIconInChrome_0 (copy), v4 (copy), v6 (copy), l_GetFFlagEnableChromePinIntegrations_0 (copy), v3 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), l_GetFFlagEnableChromePinAnalytics_0 (copy), v2 (copy), l_GetFFlagEnableJoinVoiceOnUnibar_0 (copy), l_GetFFlagDebugEnableUnibarDummyIntegrations_0 (copy), v5 (copy), v13 (copy)
        local v16 = {
            "leaderboard", 
            "emotes", 
            "backpack"
        };
        local v17 = if l_GetFFlagEnablePartyMicIconInChrome_0() then {
            v4.TOGGLE_MIC_INTEGRATION_ID
        } else {};
        table.insert(v16, "respawn");
        table.insert(v16, 1, "trust_and_safety");
        if v6() then
            table.insert(v16, 1, "connect_dropdown");
        end;
        if l_GetFFlagEnableChromePinIntegrations_0() and not v3:isUserPinned("trust_and_safety") and not l_GetFFlagEnableSaveUserPins_0() then
            v3:setUserPin("trust_and_safety", true);
            if l_GetFFlagEnableChromePinAnalytics_0() then
                v2.default:setPin("trust_and_safety", true, v3:userPins());
            end;
        end;
        local v18 = {
            "toggle_mic_mute", 
            "chat", 
            "nine_dot"
        };
        if l_GetFFlagEnableJoinVoiceOnUnibar_0() then
            table.insert(v18, 2, "join_voice");
        end;
        if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then
            table.insert(v18, 1, "dummy_window");
            table.insert(v18, 1, "dummy_window_2");
            table.insert(v18, 1, "dummy_container");
        end;
        if v5() then
            local v19 = table.find(v18, "chat");
            if v19 then
                table.insert(v18, v19 + 1, "connect_unibar");
            end;
        end;
        v3:configureMenu({
            v17, 
            v18
        });
        table.insert(v16, 2, "camera_entrypoint");
        table.insert(v16, 2, "selfie_view");
        if v13() then
            table.insert(v16, 4, "music_entrypoint");
        end;
        v3:configureSubMenu("nine_dot", v16);
    end;
    local function v21() --[[ Line: 97 ]] --[[ Name: configurePeek ]]
        -- upvalues: v7 (copy), v3 (copy)
        if v7() then
            v3:configurePeek("music_peek", {
                integrations = {
                    "music_icon", 
                    "peek_track_details", 
                    "peek_close"
                }
            });
            v3:configurePeek("music_peek_portrait", {
                integrations = {
                    "music_icon", 
                    "peek_track_details", 
                    "peek_close"
                }
            });
        end;
    end;
    require(l_script_FirstAncestor_0.Integrations);
    v20();
    v21();
    return nil;
end;