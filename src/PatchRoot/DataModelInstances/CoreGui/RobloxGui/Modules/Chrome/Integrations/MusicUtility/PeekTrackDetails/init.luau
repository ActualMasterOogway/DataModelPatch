local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Service.ContainerSlotSignal);
local v6 = require(l_script_FirstAncestor_0.Integrations.MusicUtility.Constants);
local v7 = require(l_script_FirstAncestor_0.Integrations.MusicUtility.shouldUseSmallPeek);
return v2:register({
    id = "peek_track_details", 
    label = "CoreScripts.TopBar.NowPlaying", 
    initialAvailability = v2.AvailabilitySignal.Available, 
    containerWidthSlots = v5.new(if v7() then v6.MIN_TRACK_DETAILS_WIDTH else v6.MAX_TRACK_DETAILS_WIDTH), 
    components = {
        Container = function() --[[ Line: 22 ]] --[[ Name: Container ]]
            -- upvalues: v3 (copy), v4 (copy)
            return v3.createElement(v4.PeekTrackDetailsWrapper);
        end
    }
});