local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v7) --[[ Line: 16 ]] --[[ Name: ProfilePlatformPage ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v4 (copy), v6 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v9 = v2.Dictionary.join({
        bottomPadding = v4.createElement("Frame", {
            Size = UDim2.fromOffset(0, 8), 
            BackgroundTransparency = 1, 
            LayoutOrder = 99999
        })
    }, v7.children);
    return v4.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v6.PEEK_VIEW_OPEN_HEIGHT), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
    }, v9);
end;