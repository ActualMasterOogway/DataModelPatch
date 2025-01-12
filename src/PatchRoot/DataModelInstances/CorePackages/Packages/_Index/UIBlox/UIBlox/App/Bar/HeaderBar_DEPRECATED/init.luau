local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.ImageSet.Images);
local v6 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v7 = require(l_Parent_0.Container.getPageMargin);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.App.Button.IconButton);
local v10 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_1.Core.Text.GetTextSize);
local v12 = require(l_Parent_1.Core.Bar.ThreeSectionBar);
local v13 = v3.PureComponent:extend("HeaderBar");
v13.renderLeft = {
    backButton = function(v14) --[[ Line: 25 ]] --[[ Name: backButton ]]
        -- upvalues: v3 (copy), v9 (copy), v6 (copy), v5 (copy)
        return function(_) --[[ Line: 26 ]]
            -- upvalues: v3 (ref), v9 (ref), v6 (ref), v5 (ref), v14 (copy)
            return v3.createElement(v9, {
                size = UDim2.fromOffset(0, 0), 
                iconSize = v6.Medium, 
                icon = v5["icons/navigation/pushBack"], 
                onActivated = v14
            });
        end;
    end
};
v13.validateProps = v4.strictInterface({
    title = v4.optional(v4.string), 
    margin = v4.optional(v4.number), 
    contentPaddingRight = v4.optional(v4.UDim), 
    barHeight = v4.optional(v4.number), 
    renderRight = v4.optional(v4.callback), 
    renderLeft = v4.optional(v4.callback), 
    renderCenter = v4.optional(v4.callback), 
    backgroundTransparency = v4.optional(v4.number), 
    onHeaderActivated = v4.optional(v4.callback), 
    memoKey = v4.optional(v4.number), 
    isSecondary = v4.optional(v4.boolean), 
    shouldHideSecondaryLeftItem = v4.optional(v4.boolean)
});
v13.defaultProps = {
    barHeight = 48, 
    title = "", 
    isSecondary = false
};
v13.init = function(v16) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v3 (copy)
    v16.state = {
        margin = 0
    };
    v16.onResize = function(v17) --[[ Line: 87 ]]
        -- upvalues: v7 (ref), v16 (copy)
        local v18 = v7(v17.AbsoluteSize.X);
        v16:setState({
            margin = v18
        });
    end;
    v16.ref = v3.createRef();
end;
v13.render = function(v19) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v3 (copy), v10 (copy), v11 (copy), v12 (copy)
    return v8(function(v20) --[[ Line: 97 ]]
        -- upvalues: v19 (copy), v3 (ref), v10 (ref), v11 (ref), v12 (ref)
        local l_Theme_0 = v20.Theme;
        local l_Font_0 = v20.Font;
        local l_renderLeft_0 = v19.props.renderLeft;
        local v24 = true;
        if l_renderLeft_0 ~= nil then
            v24 = l_renderLeft_0 == v3.None;
        end;
        local l_renderCenter_0 = v19.props.renderCenter;
        local l_renderRight_0 = v19.props.renderRight;
        local v27 = 1e999;
        if v24 and string.len(v19.props.title) > 0 then
            l_renderLeft_0 = function(v28) --[[ Line: 108 ]]
                -- upvalues: v3 (ref), v10 (ref), v19 (ref), l_Font_0 (copy), l_Theme_0 (copy)
                return v3.createFragment({
                    Text = v3.createElement(v10, {
                        fluidSizing = true, 
                        Text = v19.props.title, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fontStyle = l_Font_0.Title, 
                        colorStyle = l_Theme_0.TextEmphasis
                    }, v28[v3.Children])
                });
            end;
        end;
        if v19.props.isSecondary and not v24 and not v19.props.shouldHideSecondaryLeftItem and string.len(v19.props.title) > 0 then
            local l_Header2_0 = l_Font_0.Header2;
            local v30 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
            local l_v30_0 = v30 --[[ copy: 9 -> 10 ]];
            local l_l_Header2_0_0 = l_Header2_0 --[[ copy: 8 -> 11 ]];
            l_renderLeft_0 = function() --[[ Line: 131 ]]
                -- upvalues: v3 (ref), l_v30_0 (copy), v19 (ref), l_Theme_0 (copy), v10 (ref), l_l_Header2_0_0 (copy)
                return v3.createFragment({
                    Text = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_v30_0), 
                        BackgroundTransparency = 1, 
                        Transparency = 1
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 12)
                        }), 
                        renderLeft = v19.props.renderLeft(v19.props), 
                        Divider = v3.createElement("Frame", {
                            BackgroundColor3 = l_Theme_0.Divider.Color, 
                            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                            BorderSizePixel = 0, 
                            Size = UDim2.new(0, 1, 1, 0), 
                            LayoutOrder = 1
                        }), 
                        TextLabel = v3.createElement(v10, {
                            ClipsDescendants = true, 
                            Text = v19.props.title, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextWrapped = false, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = l_l_Header2_0_0, 
                            colorStyle = l_Theme_0.TextEmphasis, 
                            LayoutOrder = 2
                        })
                    })
                });
            end;
        end;
        if l_renderLeft_0 and l_renderCenter_0 and l_renderRight_0 then
            v27 = 0;
        end;
        if not l_renderCenter_0 and not v24 and not v19.props.isSecondary then
            local l_Header1_0 = l_Font_0.Header1;
            local v34 = l_Header1_0.RelativeSize * l_Font_0.BaseSize;
            l_renderCenter_0 = function() --[[ Line: 176 ]]
                -- upvalues: v3 (ref), v10 (ref), v34 (copy), v19 (ref), l_Header1_0 (copy), l_Theme_0 (copy)
                return v3.createElement(v10, {
                    ClipsDescendants = true, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, v34), 
                    Text = v19.props.title, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = l_Header1_0, 
                    colorStyle = l_Theme_0.TextEmphasis
                });
            end;
            v27 = v11(v19.props.title, v34, l_Header1_0.Font, Vector2.new(1000, 1000)).X;
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v19.props.barHeight), 
            [v3.Change.AbsoluteSize] = v19.onResize
        }, {
            HeaderClickArea = v19.props.onHeaderActivated and v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Selectable = false, 
                [v3.Event.Activated] = v19.props.onHeaderActivated, 
                ZIndex = 0
            }) or nil, 
            ThreeSectionBar = v3.createElement(v12, {
                BackgroundTransparency = v19.props.backgroundTransparency or l_Theme_0.BackgroundDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                barHeight = v19.props.barHeight, 
                marginLeft = v19.props.margin or v19.state.margin, 
                marginRight = v19.props.margin or v19.state.margin, 
                renderLeft = l_renderLeft_0, 
                renderCenter = l_renderCenter_0, 
                estimatedCenterWidth = v27, 
                contentPaddingRight = v19.props.contentPaddingRight or UDim.new(0, v24 and 0 or 12), 
                renderRight = l_renderRight_0
            })
        });
    end);
end;
v13.didMount = function(v35) --[[ Line: 224 ]] --[[ Name: didMount ]]
    if v35.ref.current then
        v35.onResize(v35.ref.current);
    end;
end;
return v13;