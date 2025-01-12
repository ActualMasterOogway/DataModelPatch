local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v2 = require(l_Parent_0.Roact);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v4 = require(l_Parent_0.SharedFlags);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_GetFFlagLuaAppEnableFoundationColors_0 = v4.GetFFlagLuaAppEnableFoundationColors;
local v7 = v2.PureComponent:extend("SystemMessage");
v7.defaultProps = {
    LayoutOrder = nil, 
    Text = "PLACEHOLDER This message could not be displayed", 
    maxWidth = 250
};
v7.init = function(v8) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_Text_0 (copy)
    v8.calculateSize = l_memoize_0(function(v9, v10, v11, v12) --[[ Line: 29 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextBounds(v9, v11, v12, Vector2.new(v10, 1000));
    end);
end;
v7.render = function(v13) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy)
    return l_withStyle_0(function(v14) --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v2 (ref), l_GetFFlagLuaAppEnableFoundationColors_0 (ref)
        local l_CaptionBody_0 = v14.Font.CaptionBody;
        local v16 = v14.Font.BaseSize * l_CaptionBody_0.RelativeSize;
        local v17 = v13.calculateSize(v13.props.Text, v13.props.maxWidth, l_CaptionBody_0.Font, v16);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v13.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 30 + v17.Y + 8)
        }, {
            UiListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 20)
            }), 
            GreyBox = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                Image = "rbxasset://textures/ui/LuaChat/9-slice/system-message.png", 
                ImageColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then nil else v14.Theme.BackgroundContrast.Color, 
                ImageTransparency = l_GetFFlagLuaAppEnableFoundationColors_0() and 1 or v14.Theme.BackgroundContrast.Transparency, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(0, math.min(v13.props.maxWidth, v17.X) + 12, 0, v17.Y + 8), 
                SliceCenter = Rect.new(3, 3, 4, 4)
            }, {
                SystemText = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_CaptionBody_0.Font, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v13.props.Text, 
                    TextColor3 = v14.Theme.TextDefault.Color, 
                    TextSize = v16, 
                    TextTransparency = v14.Theme.TextDefault.Transparency, 
                    TextWrapped = true
                })
            })
        });
    end);
end;
return v7;