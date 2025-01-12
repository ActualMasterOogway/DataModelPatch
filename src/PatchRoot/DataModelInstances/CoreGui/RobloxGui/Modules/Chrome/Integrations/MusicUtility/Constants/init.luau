local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Parent.TopBar.Constants);
local v3 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v4 = require(l_script_FirstAncestor_0.Parent.TopBar.Flags.GetFFlagChangeTopbarHeightCalculation);
local l_GetFFlagFixSongbirdPeekUseFoundationIcons_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSongbirdPeekUseFoundationIcons;
local v6 = if v4() then v2.TopBarTopMargin else 0;
return {
    getPeekContainerPosition = function(v7) --[[ Line: 18 ]] --[[ Name: getPeekContainerPosition ]]
        -- upvalues: v6 (copy)
        return UDim2.fromOffset(0, v6 + v7.Tokens.Global.Space_25);
    end, 
    PEEK_CONTAINER_HEIGHT = l_GetFFlagFixSongbirdPeekUseFoundationIcons_0() and 52 or 44, 
    MIN_TRACK_DETAILS_WIDTH = 48 / v3.ICON_CELL_WIDTH, 
    MAX_TRACK_DETAILS_WIDTH = 78 / v3.ICON_CELL_WIDTH, 
    MUSIC_WINDOW_MAX_SIZE = Vector2.new(400, 80), 
    AUDIO_REPORTING_WINDOW_MIN_HEIGHT = 420
};