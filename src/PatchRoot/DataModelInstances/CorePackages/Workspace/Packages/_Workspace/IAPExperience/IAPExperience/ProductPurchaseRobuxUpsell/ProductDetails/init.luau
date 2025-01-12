local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v6 = require(l_Parent_1.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v11 = require(l_Parent_0.Generic.HumanoidViewport);
local v12 = require(l_Parent_0.Generic.Constants);
local v13 = require(l_Parent_0.Flags.getEnableCondenseRobuxUpsell);
local v14 = require(l_Parent_0.Flags.getEnableHumanoidViewportItemIcon);
local v15 = l_Images_0["icons/common/robux"];
local v16 = l_Images_0["icons/status/imageunavailable"];
local v17 = v2.Component:extend(script.Name);
v17.init = function(v18) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v18.contentRef = v2.createRef();
    v18.state = {
        contentSize = Vector2.new(0, 0)
    };
    v18.changeContentSize = function(v19) --[[ Line: 46 ]]
        -- upvalues: v18 (copy)
        if v18.state.contentSize ~= v19.AbsoluteSize then
            v18:setState({
                contentSize = v19.AbsoluteSize
            });
        end;
    end;
end;
v17.render = function(v20) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), l_IconSize_0 (copy), v14 (copy), v13 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v11 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), v15 (copy)
    local l_props_0 = v20.props;
    return l_withStyle_0(function(v22) --[[ Line: 58 ]]
        -- upvalues: l_props_0 (copy), v12 (ref), l_IconSize_0 (ref), v14 (ref), v13 (ref), v2 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v11 (ref), l_FitFrameVertical_0 (ref), v20 (copy), l_FitTextLabel_0 (ref), v15 (ref)
        local l_Theme_0 = v22.Theme;
        local l_Font_0 = v22.Font;
        local v25 = l_props_0.itemIcon ~= nil and v12.NORMAL_ICON_SIZE or l_IconSize_0.Large;
        if v14() and l_props_0.model ~= nil then
            v25 = v12.NORMAL_ICON_SIZE;
        end;
        local l_v25_0 = v25;
        local l_v25_1 = v25;
        if v13() then
            l_v25_0 = l_props_0.itemIconWidth == nil and v25 or l_props_0.itemIconWidth;
            l_v25_1 = l_props_0.itemIconHeight == nil and v25 or l_props_0.itemIconHeight;
        end;
        local v28 = if l_props_0.itemIcon then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_v25_0, 0, l_v25_1), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = l_props_0.itemIcon, 
            ImageTransparency = 0
        }) else v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_v25_0, 0, l_v25_1), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v16, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency
        });
        if v14() and l_props_0.model ~= nil then
            v28 = v2.createElement(v11, {
                model = l_props_0.model, 
                Position = UDim2.fromOffset(5, 5), 
                Size = UDim2.fromOffset(l_v25_0, l_v25_1)
            });
        end;
        return v2.createElement(l_FitFrameVertical_0, {
            LayoutOrder = l_props_0.layoutOrder, 
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = UDim.new(0, 6), 
            [v2.Ref] = v20.contentRef, 
            [v2.Change.AbsoluteSize] = v20.changeContentSize
        }, {
            ItemIconFrame = v2.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                width = UDim.new(0.45, 0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                margin = {
                    top = 0, 
                    bottom = 0, 
                    left = 0, 
                    right = 20
                }
            }, {
                ItemIcon = v28
            }), 
            ItemDetailsFrame = v2.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                width = UDim.new(0.55, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 5)
            }, {
                ItemName = v2.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    width = l_FitTextLabel_0.Width.FitToText, 
                    maximumWidth = v20.state.contentSize.X * 0.55, 
                    Font = l_Font_0.Header2.Font, 
                    Text = l_props_0.itemName, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                ItemCostFrame = v2.createElement(l_FitFrameVertical_0, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    width = UDim.new(0.5, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    contentPadding = UDim.new(0, 2)
                }, {
                    RobuxIcon = v2.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.new(0, 24, 0, 24), 
                        ScaleType = Enum.ScaleType.Stretch, 
                        Image = v15, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                    }), 
                    ItemCost = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v20.state.contentSize.X, 
                        Font = l_Font_0.Header2.Font, 
                        Text = tostring(l_props_0.itemRobuxCost), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color
                    })
                })
            })
        });
    end);
end;
return v17;