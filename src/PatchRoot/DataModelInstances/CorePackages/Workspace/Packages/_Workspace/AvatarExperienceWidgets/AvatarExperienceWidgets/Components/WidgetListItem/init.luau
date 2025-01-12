local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceWidgets").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.RoactGamepad);
return (v1.forwardRef(function(v4, v5) --[[ Line: 17 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v3 (copy)
    local v6 = l_useDesignTokens_0();
    return v1.createElement(v3.Focusable.Frame, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ref = v5, 
        NextSelectionUp = v4.NextSelectionUp, 
        NextSelectionDown = v4.NextSelectionDown
    }, {
        GradientBackground = if v4.hasBackground then v1.createElement("Frame", {
            Size = UDim2.new(1, v4.horizontalMargin * 2, 1, 0), 
            Position = UDim2.new(0, -v4.horizontalMargin, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            ZIndex = -1
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v6.Semantic.Color.Background.Muted.Color3), 
                    ColorSequenceKeypoint.new(1, v6.Semantic.Color.Background.Default.Color3)
                })
            })
        }) else nil, 
        WidgetListItemPadding = if not not v4.hasSpaceBelow or v4.hasSpaceAbove then v1.createElement("UIPadding", {
            PaddingBottom = if v4.hasSpaceBelow then UDim.new(0, v6.Global.Space_200) else nil, 
            PaddingTop = if v4.hasSpaceAbove then UDim.new(0, v6.Global.Space_200) else nil
        }) else nil, 
        Widget = v1.createElement(v1.Fragment, nil, v4.children)
    });
end));