local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_0.Core.Control.StateLayer);
local v5 = require(l_Parent_0.Core.Style.useStyle);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v7 = require(l_Parent_0.App.Indicator.Badge);
local v8 = require(l_Parent_0.App.Indicator.Enum.BadgeVariant);
local v9 = require(l_Parent_0.App.Navigation.Enum.NavigationTabLayout);
local _ = require(l_Parent_0.App.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local v12 = {
    hasLabel = false, 
    isChecked = false, 
    badgeValue = nil, 
    layout = v9.Stacked
};
return (v2.forwardRef(function(v13, v14) --[[ Line: 58 ]]
    -- upvalues: v3 (copy), v12 (copy), v5 (copy), v2 (copy), l_Label_0 (copy), v9 (copy), v7 (copy), v8 (copy), v4 (copy)
    local v15 = v3.Dictionary.join(v12, v13);
    local l_Tokens_0 = v5().Tokens;
    local v17, v18 = v2.useBinding(UDim2.new());
    local v20 = v2.useCallback(function(v19) --[[ Line: 62 ]]
        -- upvalues: v18 (copy)
        v18(UDim2.fromOffset(v19.AbsoluteSize.X, v19.AbsoluteSize.Y));
    end, {});
    local v21 = nil;
    local v22 = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350);
    if v15.renderIcon then
        v21 = v15.renderIcon(v15.isChecked);
    else
        local v23 = if v15.isChecked and v15.iconCheckedImage then v15.iconCheckedImage else v15.iconImage;
        local v24 = if v15.isChecked then l_Tokens_0.Semantic.Color.Icon.Emphasis else l_Tokens_0.Semantic.Color.Icon.Default;
        v21 = v2.createElement(l_Label_0, {
            BackgroundTransparency = 1, 
            Size = v22, 
            Image = v23, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = v24.Color3, 
            ImageTransparency = v24.Transparency
        });
    end;
    if v15.layout == v9.Stacked and v15.badgeValue ~= nil then
        v21 = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v22, 
            LayoutOrder = 1
        }, {
            Icon = v21, 
            Badge = v2.createElement(v7, {
                position = UDim2.fromScale(1, 0), 
                anchorPoint = Vector2.new(0.6, 0.35), 
                value = v15.badgeValue, 
                badgeVariant = v8.Alert
            })
        });
    end;
    local v25 = nil;
    if v15.hasLabel and v15.labelText then
        local v26 = if v15.isChecked then l_Tokens_0.Semantic.Color.Text.Emphasis else l_Tokens_0.Semantic.Color.Text.Default;
        v25 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Text = v15.labelText, 
            Font = if v15.labelTypography then v15.labelTypography.Font else nil, 
            TextSize = if v15.labelTypography then v15.labelTypography.FontSize else nil, 
            LineHeight = if v15.labelTypography then v15.labelTypography.LineHeight else nil, 
            TextColor3 = v26.Color3, 
            TextTransparency = v26.Transparency
        });
    end;
    local v27 = nil;
    local v28 = nil;
    if v15.layout == v9.Stacked then
        v28 = UDim.new(0, l_Tokens_0.Semantic.Radius.Medium);
        v27 = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_600), 
            [v2.Change.AbsoluteSize] = v20
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_100), 
                PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_100)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Tokens_0.Global.Space_50)
            }), 
            Icon = v21, 
            Label = v25
        });
    elseif v15.layout == v9.Inline then
        v28 = UDim.new(0, l_Tokens_0.Semantic.Radius.Large);
        local v29 = if v15.isChecked then l_Tokens_0.Semantic.Color.State.Standard.Pressed else {
            Transparency = 1, 
            Color3 = nil
        };
        v27 = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = v29.Transparency, 
            BackgroundColor3 = v29.Color3, 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_500), 
            [v2.Change.AbsoluteSize] = v20
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_50), 
                PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_50), 
                PaddingLeft = UDim.new(0, l_Tokens_0.Global.Space_150), 
                PaddingRight = UDim.new(0, l_Tokens_0.Global.Space_150)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Tokens_0.Global.Space_150)
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v28
            }), 
            Icon = v21, 
            Label = v25, 
            Badge = if v15.badgeValue ~= nil then v2.createElement(v7, {
                layoutOrder = 3, 
                value = v15.badgeValue, 
                badgeVariant = v8.Alert
            }) else nil
        });
    end;
    return v2.createElement("Frame", {
        ref = v14, 
        Size = v17, 
        BackgroundTransparency = 1, 
        AnchorPoint = v15.anchorPoint, 
        Position = v15.position, 
        LayoutOrder = v15.layoutOrder
    }, {
        Contents = v27, 
        StateLayer = v2.createElement(v4, {
            affordance = "Background", 
            cornerRadius = v28, 
            zIndex = 10, 
            onActivated = v15.onActivated, 
            onStateChanged = v15.onStateChanged
        })
    });
end));