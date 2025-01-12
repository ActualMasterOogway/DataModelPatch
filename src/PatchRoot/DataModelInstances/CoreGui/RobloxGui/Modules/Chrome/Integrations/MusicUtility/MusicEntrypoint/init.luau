local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v5 = require(l_script_FirstAncestor_0.Service);
local v6 = require(l_script_FirstAncestor_0.Integrations.MusicUtility.Constants);
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v8 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local l_GetFFlagChromeSongbirdWindow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSongbirdWindow;
local l_GetFFlagSongbirdWindowResponsiveSizing_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSongbirdWindowResponsiveSizing;
if l_GetFFlagChromeSongbirdWindow_0() then
    local l_MUSIC_WINDOW_MAX_SIZE_0 = v6.MUSIC_WINDOW_MAX_SIZE;
    local v12 = v8.new(l_MUSIC_WINDOW_MAX_SIZE_0.X, l_MUSIC_WINDOW_MAX_SIZE_0.Y);
    return v5:register({
        initialAvailability = v5.AvailabilitySignal.Available, 
        id = "music_entrypoint", 
        draggable = true, 
        cachePosition = true, 
        windowSize = v12, 
        label = "CoreScripts.TopBar.Music", 
        activated = function() --[[ Line: 29 ]] --[[ Name: activated ]]
            -- upvalues: v5 (copy)
            v5:toggleWindow("music_entrypoint");
        end, 
        components = {
            Icon = function(_) --[[ Line: 33 ]] --[[ Name: Icon ]]
                -- upvalues: v7 (copy)
                return v7("icons/common/music");
            end, 
            Window = function() --[[ Line: 36 ]] --[[ Name: Window ]]
                -- upvalues: l_GetFFlagSongbirdWindowResponsiveSizing_0 (copy), v3 (copy), v2 (copy), v12 (copy), v4 (copy), v5 (copy)
                if l_GetFFlagSongbirdWindowResponsiveSizing_0() then
                    return v3.createElement(v2.View, {
                        tag = "auto-xy", 
                        onAbsoluteSizeChanged = function(v14) --[[ Line: 40 ]] --[[ Name: onAbsoluteSizeChanged ]]
                            -- upvalues: v12 (ref)
                            v12:requestSize(v14.AbsoluteSize.X, v14.AbsoluteSize.Y);
                        end
                    }, {
                        ChromeWindowWrapper = v3.createElement(v4.ChromeWindowWrapper, {
                            onClose = function() --[[ Line: 45 ]] --[[ Name: onClose ]]
                                -- upvalues: v5 (ref)
                                v5:toggleWindow("music_entrypoint");
                            end
                        })
                    });
                else
                    return (v3.createElement(v4.ChromeWindowWrapper, {
                        onClose = function() --[[ Line: 52 ]] --[[ Name: onClose ]]
                            -- upvalues: v5 (ref)
                            v5:toggleWindow("music_entrypoint");
                        end
                    }));
                end;
            end
        }
    });
else
    return v5:register({
        initialAvailability = v5.AvailabilitySignal.Available, 
        id = "music_entrypoint", 
        label = "CoreScripts.TopBar.Music", 
        activated = function(_) --[[ Line: 65 ]] --[[ Name: activated ]]

        end, 
        components = {
            Icon = function(_) --[[ Line: 67 ]] --[[ Name: Icon ]]
                -- upvalues: v7 (copy)
                return v7("icons/controls/emoteOff");
            end
        }
    });
end;