local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.constants);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local l_ImageSetLabel_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).Core.ImageSet.ImageSetLabel;
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local l_GetFFlagFixSongbirdPeekUseFoundationIcons_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagFixSongbirdPeekUseFoundationIcons;
local v8 = {
    size = v1.ICON_SIZE, 
    includeView = false
};
return function(v9) --[[ Line: 29 ]] --[[ Name: MusicIcon ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v2 (copy), v6 (copy), l_GetFFlagFixSongbirdPeekUseFoundationIcons_0 (copy), l_ImageSetLabel_0 (copy), v1 (copy)
    local v10 = v3.Dictionary.join(v8, v9);
    local v11 = v4.createElement(v2.Icon, {
        name = "icons/common/music", 
        size = v2.Enums.IconSize.Medium
    });
    if v6() then
        if l_GetFFlagFixSongbirdPeekUseFoundationIcons_0() and v10.includeView then
            return (v4.createElement(v2.View, {
                tag = "size-full col align-x-center align-y-center"
            }, {
                Icon = v11
            }));
        else
            return v11;
        end;
    else
        return (v4.createElement(l_ImageSetLabel_0, {
            Image = v1.MUSIC_ICON, 
            BackgroundTransparency = 1, 
            Size = v10.size
        }));
    end;
end;