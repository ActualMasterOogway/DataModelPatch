local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v7 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_0.ImageSet.Images);
local v10 = require(l_Core_0.ImageSet.ImageSetComponent);
local v11 = v4.PureComponent:extend("AlertTitle");
v11.validateProps = v5.strictInterface({
    layoutOrder = v5.optional(v5.number), 
    margin = v5.optional(v5.table), 
    maxWidth = v5.optional(v5.number), 
    minWidth = v5.optional(v5.number), 
    screenSize = v5.Vector2, 
    title = v5.string, 
    titlePadding = v5.optional(v5.number), 
    titleContent = v5.optional(v5.callback), 
    onCloseClicked = v5.optional(v5.callback)
});
v11.defaultProps = {
    margin = {
        top = 0, 
        bottom = 24, 
        left = 24, 
        right = 24
    }, 
    maxWidth = 400, 
    minWidth = 272, 
    titlePadding = 12
};
v11.render = function(v12) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), l_FitFrameOnAxis_0 (copy), v10 (copy), v9 (copy), v7 (copy)
    local v13 = math.clamp(v12.props.screenSize.X - v12.props.margin.left - v12.props.margin.right, v12.props.minWidth, v12.props.maxWidth) - v12.props.margin.left - v12.props.margin.right;
    return v8(function(v14) --[[ Line: 58 ]]
        -- upvalues: v4 (ref), l_FitFrameOnAxis_0 (ref), v12 (copy), v10 (ref), v9 (ref), v7 (ref), v13 (copy)
        local l_Theme_0 = v14.Theme;
        local l_Header_0 = v14.Tokens.Semantic.Typography.Header;
        local l_FontSize_0 = l_Header_0.FontSize;
        return v4.createElement(l_FitFrameOnAxis_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = v12.props.layoutOrder, 
            margin = {
                top = 12, 
                bottom = 0, 
                left = 0, 
                right = 0
            }, 
            minimumSize = UDim2.new(1, 0, 0, 0)
        }, {
            TitleContent = v12.props.titleContent and v4.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Content = v12.props.titleContent()
            }), 
            TitleArea = v4.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                contentPadding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = 1, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Title = if v12.props.onCloseClicked then v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, l_FontSize_0)
                }, {
                    CloseButton = v4.createElement(v10.Button, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v9["icons/navigation/close"], 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        [v4.Event.Activated] = v12.props.onCloseClicked
                    }), 
                    TitleText = v4.createElement(v7, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        fontStyle = l_Header_0, 
                        Size = UDim2.new(1, -(2 * (36 + v12.props.titlePadding)), 0, l_FontSize_0 * 2), 
                        LayoutOrder = 1, 
                        Text = v12.props.title, 
                        TextSize = l_FontSize_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    })
                }) else v4.createElement(v7, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Header_0, 
                    maxSize = Vector2.new(v13, l_FontSize_0 * 2), 
                    LayoutOrder = 1, 
                    Text = v12.props.title, 
                    TextSize = l_FontSize_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                Underline = v4.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
return v11;