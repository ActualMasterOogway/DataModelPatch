local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
return function(v6) --[[ Line: 21 ]] --[[ Name: ProfileMoreButton ]]
    -- upvalues: l_Images_0 (copy), v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v7 = if v6.isSelected then l_Images_0["icons/menu/more_on"] else l_Images_0["icons/menu/more_off"];
    return v1.createElement(l_IconButton_0, {
        icon = v7, 
        iconSize = l_IconSize_0.Medium, 
        isDisabled = v6.isDisabled, 
        layoutOrder = v6.layoutOrder, 
        onActivated = v6.onActivated, 
        buttonRef = v6.buttonRef
    });
end;