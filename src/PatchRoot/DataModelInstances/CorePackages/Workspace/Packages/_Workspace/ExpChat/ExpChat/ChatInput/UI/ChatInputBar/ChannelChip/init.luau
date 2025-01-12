local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Config);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextColor3 = v3.ChatInputBarTextColor3, 
        BackgroundTransparency = 1, 
        Font = v3.ChatInputBarFont, 
        Text = v4.targetTextChannelDisplayName or "", 
        TextSize = v3.ChatInputBarTextSize, 
        TextWrapped = true, 
        TextTransparency = v4.transparency or 1, 
        Size = UDim2.fromScale(0, 1), 
        Visible = not v4.isChannelBarVisible and v4.targetTextChannelDisplayName ~= "", 
        [v2.Change.AbsoluteSize] = v4.onAbsoluteSizeChanged, 
        [v2.Event.Activated] = v4.onChannelChipActivated
    });
end;