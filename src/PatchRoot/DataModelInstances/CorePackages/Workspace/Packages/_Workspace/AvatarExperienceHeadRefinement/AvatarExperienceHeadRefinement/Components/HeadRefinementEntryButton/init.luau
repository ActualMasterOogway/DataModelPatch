local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v3.App.Button.IconButton;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXHeadRefinementVisualFixes);
local v8 = l_Images_0["icons/menu/clothing/classicHead_on"];
local v9 = l_Images_0["icons/menu/clothing/classicHead_off"];
return function(v10) --[[ Line: 27 ]] --[[ Name: HeadRefinementEntryButton ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_IconButton_0 (copy), v8 (copy), v9 (copy), v3 (copy), v7 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    return v2.createElement(l_IconButton_0, {
        icon = if v10.isSelected then v8 else v9, 
        iconSize = v3.App.Constant.IconSize.Medium, 
        iconColor3 = if v10.isSelected then l_Theme_0.IconEmphasis.Color else l_Theme_0.IconDefault.Color, 
        iconTransparency = if v10.isSelected then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.IconDefault.Transparency, 
        showBackground = v7() and true or nil, 
        onActivated = function() --[[ Line: 37 ]] --[[ Name: onActivated ]]
            -- upvalues: v10 (copy)
            if v10.onActivated then
                v10.onActivated();
            end;
        end, 
        buttonRef = v10.buttonRef, 
        NextSelectionUp = v10.nextSelectionUp, 
        NextSelectionDown = v10.nextSelectionDown
    });
end;