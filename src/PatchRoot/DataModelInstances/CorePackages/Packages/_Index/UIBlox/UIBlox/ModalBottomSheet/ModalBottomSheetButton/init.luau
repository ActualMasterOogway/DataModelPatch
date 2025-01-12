local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v4 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.UIBlox.UIBloxConfig);
local v6 = require(l_Parent_0.UIBlox.Utility.lerp);
local v7 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v8 = require(l_Parent_0.UIBlox.App.Menu.RoundedFrame);
local v9 = v1.PureComponent:extend("ModalBottomSheetButton");
local l_ImageRectSize_0 = v3["component_assets/circle_17"].ImageRectSize;
local l_ImageRectOffset_0 = v3["component_assets/circle_17"].ImageRectOffset;
local v12 = 8 * v3.ImagesResolutionScale;
local v13 = 8 * v3.ImagesResolutionScale;
local v14 = Rect.new(v12, v13, l_ImageRectSize_0.x - v12, l_ImageRectSize_0.y - v13);
local v15 = 8 * v3.ImagesResolutionScale;
v9.validateProps = v2.strictInterface({
    icon = v2.optional(v2.union(v2.table, v2.string)), 
    text = v2.optional(v2.string), 
    onActivated = v2.optional(v2.callback), 
    renderRightElement = v2.optional(v2.callback), 
    showImage = v2.boolean, 
    isFixed = v2.boolean, 
    onActivatedAndDismissed = v2.callback, 
    elementHeight = v2.integer, 
    hasRoundBottom = v2.boolean, 
    hasRoundTop = v2.boolean, 
    LayoutOrder = v2.integer, 
    stayOnActivated = v2.optional(v2.boolean)
});
v9.defaultProps = {
    icon = {}, 
    text = "", 
    onActivated = function() --[[ Line: 47 ]] --[[ Name: onActivated ]]

    end
};
v9.init = function(v16) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v1 (copy)
    if v5.fixModalBottomSheetPressState then
        local v17, v18 = v1.createBinding(false);
        v16.pressed = v17;
        v16.updatePressed = v18;
    end;
    v16.ref = v1.createRef();
    v16.onColorChange = function(v19) --[[ Line: 56 ]]
        -- upvalues: v16 (copy)
        if not v16.ref.current then
            return;
        else
            v16.ref.current.ImageColor3 = v19;
            return;
        end;
    end;
    v16.onInputBegan = function(v20) --[[ Line: 63 ]]
        local v21 = true;
        if v20.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v21 = v20.UserInputType == Enum.UserInputType.Touch;
        end;
        return v21;
    end;
    v16.onInputEnd = function(v22) --[[ Line: 67 ]]
        local v23 = true;
        if v22.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v23 = v22.UserInputType == Enum.UserInputType.Touch;
        end;
        return v23;
    end;
end;
v9.render = function(v24) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: l_ImageRectSize_0 (copy), l_ImageRectOffset_0 (copy), v14 (copy), v7 (copy), v5 (copy), v6 (copy), v1 (copy), v3 (copy), v4 (copy), v8 (copy), v15 (copy)
    local l_hasRoundTop_0 = v24.props.hasRoundTop;
    local l_hasRoundBottom_0 = v24.props.hasRoundBottom;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local l_X_0 = l_ImageRectSize_0.X;
    local v31 = l_X_0 / 2;
    if l_hasRoundTop_0 and l_hasRoundBottom_0 then
        v27 = l_ImageRectSize_0;
        v28 = l_ImageRectOffset_0;
        v29 = v14;
    elseif l_hasRoundTop_0 then
        v27 = Vector2.new(l_X_0, v31);
        v28 = l_ImageRectOffset_0;
        v29 = Rect.new(v31 - 1, v31 - 1, v31 + 1, v31);
    elseif l_hasRoundBottom_0 then
        v27 = Vector2.new(l_X_0, v31);
        v28 = l_ImageRectOffset_0 + Vector2.new(0, v31);
        v29 = Rect.new(v31 - 1, 0, v31 + 1, 1);
    else
        v27 = Vector2.new(1, 1);
        v28 = l_ImageRectOffset_0 + Vector2.new(v31, v31);
    end;
    local l_elementHeight_0 = v24.props.elementHeight;
    local v33 = nil;
    v33 = if v24.props.isFixed then UDim2.new(0, 300, 0, l_elementHeight_0) else UDim2.new(1, -32, 0, l_elementHeight_0);
    local v34 = 24;
    if v24.props.showImage or v24.props.renderRightElement then
        v34 = 12;
    end;
    local l_v34_0 = v34;
    local v36 = l_elementHeight_0 * 0.8;
    if v24.props.showImage then
        l_v34_0 = l_v34_0 + v36 + v34;
    end;
    if v24.props.renderRightElement then
        l_v34_0 = l_v34_0 + v36 + v34;
    end;
    return v7(function(v37) --[[ Line: 125 ]]
        -- upvalues: v5 (ref), v24 (copy), v6 (ref), v1 (ref), v29 (ref), v3 (ref), v27 (ref), v28 (ref), v33 (ref), v34 (ref), v4 (ref), v36 (copy), l_v34_0 (ref), l_hasRoundBottom_0 (copy), v8 (ref), l_hasRoundTop_0 (copy), v15 (ref)
        local l_Theme_0 = v37.Theme;
        local l_Font_0 = v37.Font;
        local l_Transparency_0 = l_Theme_0.BackgroundUIDefault.Transparency;
        local l_Color_0 = l_Theme_0.TextEmphasis.Color;
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local v45 = nil;
        if v5.fixModalBottomSheetPressState then
            v42 = if v5.useFoundationColors then v24.pressed:map(function(v46) --[[ Line: 137 ]]
                -- upvalues: l_Theme_0 (copy)
                if v46 then
                    return l_Theme_0.BackgroundOnPress.Color;
                else
                    return l_Theme_0.BackgroundUIDefault.Color;
                end;
            end) else l_Theme_0.BackgroundUIDefault.Color;
            v43 = v24.pressed:map(function(v47) --[[ Line: 141 ]]
                -- upvalues: v5 (ref), l_Theme_0 (copy), v6 (ref)
                if v47 then
                    if v5.useFoundationColors then
                        return l_Theme_0.BackgroundOnPress.Transparency;
                    else
                        return (v6(l_Theme_0.BackgroundUIDefault.Transparency, 1, 0.5));
                    end;
                else
                    return l_Theme_0.BackgroundUIDefault.Transparency;
                end;
            end);
            v44 = l_Theme_0.TextEmphasis.Color;
            v45 = if v5.useFoundationColors then l_Theme_0.TextEmphasis.Transparency else v24.pressed:map(function(v48) --[[ Line: 151 ]]
                -- upvalues: v6 (ref), l_Theme_0 (copy)
                if v48 then
                    return (v6(l_Theme_0.TextEmphasis.Transparency, 1, 0.5));
                else
                    return l_Theme_0.TextEmphasis.Transparency;
                end;
            end);
        end;
        local v53 = v1.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v29, 
            Image = v3["component_assets/circle_17"].Image, 
            ImageColor3 = if v5.fixModalBottomSheetPressState then v42 else l_Theme_0.BackgroundUIDefault.Color, 
            ImageRectSize = v27, 
            ImageRectOffset = v28, 
            ImageTransparency = if v5.fixModalBottomSheetPressState then v43 else l_Transparency_0, 
            Size = if v5.useFoundationColors then UDim2.fromScale(1, 1) else v33, 
            LayoutOrder = v24.props.LayoutOrder, 
            [v1.Ref] = v24.ref, 
            [v1.Event.Activated] = v24.props.onActivatedAndDismissed, 
            [v1.Event.InputBegan] = function(_, v50) --[[ Line: 177 ]]
                -- upvalues: v24 (ref), v5 (ref), l_Theme_0 (copy)
                if v24.onInputBegan(v50) then
                    if v5.fixModalBottomSheetPressState then
                        v24.updatePressed(true);
                        return;
                    else
                        v24.onColorChange(l_Theme_0.BackgroundOnPress.Color);
                    end;
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v52) --[[ Line: 186 ]]
                -- upvalues: v24 (ref), v5 (ref), l_Theme_0 (copy)
                if v24.onInputEnd(v52) then
                    if v5.fixModalBottomSheetPressState then
                        v24.updatePressed(false);
                        return;
                    else
                        v24.onColorChange(l_Theme_0.BackgroundUIDefault.Color);
                    end;
                end;
            end
        }, {
            buttonContents = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                horizontalLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v34)
                }), 
                padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v34), 
                    PaddingTop = UDim.new(0.1, 0), 
                    PaddingBottom = UDim.new(0.1, 0)
                }), 
                icon = v24.props.showImage and v1.createElement(v4.Label, {
                    Image = v24.props.icon, 
                    ImageColor3 = if v5.fixModalBottomSheetPressState then v44 else l_Color_0, 
                    ImageTransparency = if v5.fixModalBottomSheetPressState then v45 else l_Transparency_0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v36, 0, v36), 
                    LayoutOrder = 1
                }) or nil, 
                textLabel = v1.createElement("TextLabel", {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -l_v34_0, 1, 0), 
                    Text = v24.props.text, 
                    TextTransparency = if v5.fixModalBottomSheetPressState then v45 else l_Transparency_0, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = if v5.fixModalBottomSheetPressState then v44 else l_Color_0, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                }), 
                rightContainer = v24.props.renderRightElement and v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v36, 0, v36), 
                    LayoutOrder = 3
                }, {
                    hint = v24.props.renderRightElement()
                })
            }), 
            bottomBorder = not l_hasRoundBottom_0 and v1.createElement("Frame", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
        if v5.useFoundationColors then
            return v1.createElement("Frame", {
                LayoutOrder = v24.props.LayoutOrder, 
                Size = v33, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Background = v1.createElement(v8, {
                    zIndex = -1, 
                    background = l_Theme_0.BackgroundUIDefault, 
                    topCornerRadius = if l_hasRoundTop_0 then UDim.new(0, v15) else nil, 
                    bottomCornerRadius = if l_hasRoundBottom_0 then UDim.new(0, v15) else nil
                }), 
                Button = v53
            });
        else
            return v53;
        end;
    end);
end;
return v9;