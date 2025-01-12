local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.Core.Style.withStyle);
local v4 = require(l_Parent_0.Text.StyledTextLabel);
local v5 = require(l_Parent_1.Core.Text.GetTextSize);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_2.t);
local v8 = v6.PureComponent:extend("DetailsPageTitleContent");
v8.validateProps = v7.strictInterface({
    titleText = v7.optional(v7.string), 
    subTitleText = v7.optional(v7.string), 
    renderInfoContent = v7.optional(v7.callback), 
    layoutOrder = v7.optional(v7.number), 
    verticalAlignment = v7.optional(v7.enum(Enum.VerticalAlignment))
});
v8.init = function(v9) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v9.state = {
        containerWidth = nil
    };
    v9.onContainerSizeChange = function(v10) --[[ Line: 33 ]]
        -- upvalues: v9 (copy)
        v9:setState(function(_, _) --[[ Line: 34 ]]
            -- upvalues: v10 (copy)
            return {
                containerWidth = v10.AbsoluteSize.X
            };
        end);
    end;
    v9.getTextSize = function(v13, v14, v15) --[[ Line: 40 ]]
        -- upvalues: v5 (ref)
        local l_BaseSize_0 = v15.Font.BaseSize;
        local v17 = v14.RelativeSize * l_BaseSize_0;
        local v18 = Vector2.new(10000, 10000);
        return v5(v13, v17, v14.Font, v18);
    end;
end;
v8.render = function(v19) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy), v4 (copy)
    return v3(function(v20) --[[ Line: 49 ]]
        -- upvalues: v19 (copy), v6 (ref), v4 (ref)
        local l_Theme_0 = v20.Theme;
        local l_Font_0 = v20.Font;
        local v23 = UDim2.new(0, 0, 1, 0);
        if v19.props.titleText then
            local v24 = v19.getTextSize(v19.props.titleText, l_Font_0.Title, v20);
            local v25 = v24.Y * 1;
            v23 = if v19.state.containerWidth ~= nil and v24.X >= v19.state.containerWidth then UDim2.new(0, 0, 0, v25 * 2) else UDim2.new(0, 0, 0, v25);
        end;
        return v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v19.onContainerSizeChange, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v19.props.layoutOrder
        }, {
            ListLayout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = v19.props.verticalAlignment
            }), 
            Title = v19.props.titleText and v6.createElement(v4, {
                text = v19.props.titleText, 
                size = v23, 
                automaticSize = Enum.AutomaticSize.X, 
                fontStyle = l_Font_0.Title, 
                colorStyle = l_Theme_0.TextEmphasis, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                lineHeight = 1, 
                fluidSizing = false, 
                layoutOrder = 1, 
                richText = false
            }) or nil, 
            SubTitle = v19.props.subTitleText and v6.createElement(v4, {
                text = v19.props.subTitleText, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextMuted, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2, 
                richText = false
            }) or nil, 
            CustomContentComponentFrame = v19.props.renderInfoContent and v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                CustomContent = v19.props.renderInfoContent()
            }) or nil
        });
    end);
end;
return v8;