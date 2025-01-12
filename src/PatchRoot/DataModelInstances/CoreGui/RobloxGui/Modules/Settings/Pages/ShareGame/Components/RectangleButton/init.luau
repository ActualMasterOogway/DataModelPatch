local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = Rect.new(8, 6, 46, 44);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Settings.Theme);
local v5 = {
    Left = 4, 
    Right = 4, 
    Top = 2, 
    Bottom = 6
};
local v6 = v1.PureComponent:extend("RectangleButton");
v6.defaultProps = {
    visible = true
};
v6.init = function(v7) --[[ Line: 24 ]] --[[ Name: init ]]
    v7.state = {
        isHovering = false
    };
end;
v6.render = function(v8) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy), v2 (copy)
    local l_size_0 = v8.props.size;
    local l_position_0 = v8.props.position;
    local l_anchorPoint_0 = v8.props.anchorPoint;
    local l_layoutOrder_0 = v8.props.layoutOrder;
    local l_zIndex_0 = v8.props.zIndex;
    local l_onClick_0 = v8.props.onClick;
    local l_visible_0 = v8.props.visible;
    local v16 = v8.props[v1.Children] or {};
    local v17 = v8.state.isHovering and "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png" or "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
    if not v4.UIBloxThemeEnabled then
        v16.UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v5.Left), 
            PaddingRight = UDim.new(0, v5.Right), 
            PaddingTop = UDim.new(0, v5.Top), 
            PaddingBottom = UDim.new(0, v5.Bottom)
        });
    end;
    if v4.UIBloxThemeEnabled then
        v16.Border = v1.createElement("UIStroke", {
            Color = v4.color("DefaultButtonStroke"), 
            Transparency = v4.transparency("DefaultButtonStroke"), 
            Thickness = v4.DefaultStokeThickness
        });
        v16.UICorner = v1.createElement("UICorner", {
            CornerRadius = v4.DefaultCornerRadius
        });
    end;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = "", 
        Selectable = false, 
        Size = l_size_0, 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        Visible = l_visible_0, 
        [v1.Event.InputBegan] = function() --[[ Line: 82 ]]
            -- upvalues: v8 (copy)
            v8:setState({
                isHovering = true
            });
        end, 
        [v1.Event.InputEnded] = function() --[[ Line: 85 ]]
            -- upvalues: v8 (copy)
            v8:setState({
                isHovering = false
            });
        end, 
        [v1.Event.Activated] = function() --[[ Line: 89 ]]
            -- upvalues: l_onClick_0 (copy), v8 (copy)
            if l_onClick_0 then
                v8:setState({
                    isHovering = false
                });
                l_onClick_0();
            end;
        end
    }, {
        ButtonBackground = not v4.UIBloxThemeEnabled and v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, -v5.Left, 0, -v5.Top), 
            Size = UDim2.new(1, v5.Left + v5.Right, 1, v5.Top + v5.Bottom), 
            Image = v17, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v2, 
            ZIndex = l_zIndex_0
        }, v16), 
        ButtonBackgroundUIBlox = v4.UIBloxThemeEnabled and v1.createElement("ImageLabel", {
            BackgroundColor3 = v4.color(v8.state.isHovering and "DefaultButtonHover" or "DefaultButton"), 
            BackgroundTransparency = v4.transparency(v8.state.isHovering and "DefaultButtonHover" or "DefaultButton"), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = l_zIndex_0
        }, v16)
    });
end;
return v6;