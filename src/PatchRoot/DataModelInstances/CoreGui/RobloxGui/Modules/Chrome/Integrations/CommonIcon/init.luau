local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
local l_GetFFlagAnimateSubMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAnimateSubMenu;
local v11 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v12 = UDim2.new(0, v7.ICON_SIZE, 0, v7.ICON_SIZE);
CommonIconComponent = function(v13) --[[ Line: 23 ]] --[[ Name: CommonIconComponent ]]
    -- upvalues: v11 (copy), l_Images_0 (copy), l_useStyle_0 (copy), v2 (copy), v9 (copy), l_ImageSetLabel_0 (copy), v12 (copy), l_GetFFlagAnimateSubMenu_0 (copy)
    local v14 = v13.activeSignalValue and v11(v13.activeSignalValue) or false;
    local l_icon_0 = v13.icon;
    if v14 and v13.iconOn then
        l_icon_0 = v13.iconOn;
    end;
    if typeof(l_icon_0) == "string" and l_icon_0:sub(1, 11) ~= "rbxasset://" then
        l_icon_0 = l_Images_0[l_icon_0];
    end;
    local v16 = l_useStyle_0();
    local v17 = v2.useContext(v9);
    return v2.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = l_icon_0, 
        Size = v12, 
        ImageColor3 = v16.Theme.IconEmphasis.Color, 
        ImageTransparency = if l_GetFFlagAnimateSubMenu_0() and v17 then v17:map(function(v18) --[[ Line: 46 ]]
            -- upvalues: v16 (copy)
            return v16.Theme.IconEmphasis.Transparency + (1 - v16.Theme.IconEmphasis.Transparency) * (1 - v18);
        end) else v16.Theme.IconEmphasis.Transparency
    });
end;
CommonIcon = function(v19, v20, v21) --[[ Line: 53 ]] --[[ Name: CommonIcon ]]
    -- upvalues: v2 (copy)
    return v2.createElement(CommonIconComponent, {
        icon = v19, 
        iconOn = v20, 
        activeSignalValue = v21
    });
end;
return CommonIcon;