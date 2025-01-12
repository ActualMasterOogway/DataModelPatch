local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Service.ContainerSlotSignal);
local l_GetFFlagFixSongbirdPeekUseFoundationIcons_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSongbirdPeekUseFoundationIcons;
return v2:register({
    initialAvailability = v2.AvailabilitySignal.Available, 
    id = "music_icon", 
    label = "CoreScripts.TopBar.NowPlaying", 
    containerWidthSlots = v5.new(1), 
    components = {
        Container = function(_) --[[ Line: 18 ]] --[[ Name: Container ]]
            -- upvalues: v3 (copy), v4 (copy), l_GetFFlagFixSongbirdPeekUseFoundationIcons_0 (copy)
            return v3.createElement(v4.MusicIcon, {
                includeView = l_GetFFlagFixSongbirdPeekUseFoundationIcons_0() and true or false
            });
        end
    }
});