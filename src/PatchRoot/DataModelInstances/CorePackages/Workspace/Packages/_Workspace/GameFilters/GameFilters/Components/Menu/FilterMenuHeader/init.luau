local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v1.IconButton;
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local v5 = require(l_Parent_0.React);
return function(v6) --[[ Line: 17 ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v7 = l_useTokens_0();
    local l_HeadingSmall_0 = v7.Typography.HeadingSmall;
    local l_Emphasis_0 = v7.Color.Content.Emphasis;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v6.LayoutOrder, 
        [v5.Change.AbsoluteSize] = function(v10) --[[ Line: 28 ]]
            -- upvalues: v6 (copy)
            v6.onHeightChanged(v10.AbsoluteSize.Y);
        end
    }, {
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v7.Padding.Medium), 
            PaddingBottom = UDim.new(0, v7.Padding.Medium), 
            PaddingLeft = UDim.new(0, v7.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v7.Padding.XXLarge)
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = v6.title, 
            Font = l_HeadingSmall_0.Font, 
            TextSize = l_HeadingSmall_0.FontSize, 
            TextColor3 = l_Emphasis_0.Color3, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        CloseButton = v5.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            icon = "icons/navigation/close", 
            size = l_IconSize_0.Small, 
            onActivated = v6.onCloseButtonActivated
        })
    });
end;