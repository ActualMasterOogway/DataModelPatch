local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v10 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v11 = v2.PureComponent:extend("PlayerNameTag");
v11.validateProps = v3.strictInterface({
    player = v6, 
    isTitleEntry = v3.boolean, 
    isHovered = v3.boolean, 
    name = v3.string, 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    textFont = v3.strictInterface({
        Size = v3.number, 
        MinSize = v3.number, 
        Font = v3.enum(Enum.Font)
    })
});
v11.render = function(v12) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v2 (copy)
    return l_WithLayoutValues_0(function(v13) --[[ Line: 57 ]]
        -- upvalues: v12 (copy), v2 (ref)
        local l_Font_0 = v12.props.textFont.Font;
        local l_Size_0 = v12.props.textFont.Size;
        return v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(1, -v13.PlayerIconSizeMobile.X.Offset - v13.PlayerNamePaddingXMobile * 2, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Font_0, 
            TextSize = l_Size_0, 
            TextColor3 = v12.props.textStyle.Color, 
            TextTransparency = v12.props.textStyle.Transparency, 
            TextStrokeColor3 = v12.props.textStyle.StrokeColor, 
            TextStrokeTransparency = v12.props.textStyle.StrokeTransparency, 
            BackgroundTransparency = 1, 
            Text = v12.props.name, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
    end);
end;
return function(v16) --[[ Line: 79 ]] --[[ Name: PlayerNameTagContainer ]]
    -- upvalues: v10 (copy), v2 (copy), v11 (copy), v4 (copy)
    local v17 = v10(tostring(v16.player.UserId), v16.player.DisplayName);
    return v2.createElement(v11, v4.Dictionary.join(v16, {
        name = v17
    }));
end;