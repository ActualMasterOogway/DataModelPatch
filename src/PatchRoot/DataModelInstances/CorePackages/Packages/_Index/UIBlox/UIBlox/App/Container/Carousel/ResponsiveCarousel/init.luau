local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.UIBloxConfig);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_0.Core.Text.GetTextSize);
local v8 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_0.App.Button.Button);
local v10 = require(l_Parent_0.App.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.Core.Layout.Responsive.ResponsiveRow);
local v12 = require(l_Parent_0.Core.Layout.Grid.withGridConfig_DEPRECATED);
local v13 = Vector2.new(1e999, 1e999);
local v14 = v2.PureComponent:extend("ResponsiveCarousel");
v14.validateProps = v3.strictInterface({
    headerText = v3.union(v3.string, v3.callback), 
    headerHeight = v3.optional(v3.number), 
    headerPadding = v3.optional(v3.number), 
    buttonText = v3.optional(v3.string), 
    onButtonClick = v3.optional(v3.callback), 
    layoutOrder = v3.optional(v3.number), 
    kind = v3.optional(v3.string), 
    scrollable = v3.optional(v3.boolean), 
    clipsDescendants = v3.optional(v3.boolean), 
    selectable = v3.optional(v3.boolean), 
    relativeHeight = v3.optional(v3.UDim), 
    data = v3.optional(v3.any), 
    getItem = v3.optional(v3.callback), 
    getItemCount = v3.optional(v3.callback), 
    renderItem = v3.optional(v3.callback), 
    keyExtractor = v3.optional(v3.callback), 
    getCellColspan = v3.optional(v3.callback), 
    getCellOrder = v3.optional(v3.callback), 
    onSeeAll = v3.optional(v3.callback), 
    itemSize = v3.optional(v3.Vector2), 
    itemList = v3.optional(v3.array(v3.any)), 
    identifier = v3.optional(v3.callback), 
    itemPadding = v3.optional(v3.number), 
    carouselMargin = v3.optional(v3.number), 
    innerPadding = v3.optional(v3.number), 
    loadNext = v3.optional(v3.callback), 
    scrollingFrameRef = v3.optional(v3.table), 
    carouselRef = v3.optional(v3.table)
});
v14.defaultProps = {
    kind = "default", 
    headerHeight = 28, 
    headerPadding = 12
};
v14.init = function(v15) --[[ Line: 126 ]] --[[ Name: init ]]
    v15.itemListCount = function(v16, v17) --[[ Line: 127 ]]
        -- upvalues: v15 (copy)
        if v15.props.scrollable then
            return #v16;
        else
            return (math.min(#v16, v17.columns));
        end;
    end;
end;
v14.getButtonSize = function(v18, v19) --[[ Line: 136 ]] --[[ Name: getButtonSize ]]
    -- upvalues: v5 (copy), v7 (copy), v13 (copy)
    if v5.useFoundationButton then
        return UDim2.fromOffset(0, v18.props.headerHeight);
    else
        local l_CaptionHeader_0 = v19.Font.CaptionHeader;
        local v21 = l_CaptionHeader_0.RelativeSize * v19.Font.BaseSize;
        local v22 = v7(v18.props.buttonText, v21, l_CaptionHeader_0.Font, v13);
        return UDim2.fromOffset(v22.X + 16, v18.props.headerHeight);
    end;
end;
v14.renderHeader = function(v23, v24) --[[ Line: 146 ]] --[[ Name: renderHeader ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy), v8 (copy), v9 (copy), v10 (copy)
    return v6(function(v25) --[[ Line: 147 ]]
        -- upvalues: v23 (copy), v2 (ref), v24 (copy), v5 (ref), v8 (ref), v9 (ref), v10 (ref)
        local v26 = v23.props.onButtonClick or v23.props.onSeeAll;
        local v27 = v26 and v23.props.buttonText and true or false;
        local v28 = if v27 then v23:getButtonSize(v25) else UDim2.new();
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23.props.headerHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v24.layoutOrder
        }, {
            ResponsiveCarouselHeaderPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v24.margin), 
                PaddingRight = UDim.new(0, v24.margin), 
                PaddingTop = if v5.useFoundationButton then UDim.new(0, 2) else nil
            }), 
            ResponsiveCarouselHeaderMaxWidth = if v24.width > 0 then v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v24.width, v23.props.headerHeight)
            }) else nil, 
            ResponsiveCarouselTitle = v2.createElement(v8, {
                Size = UDim2.new(1, (v5.useFoundationButton and 0 or -v28.X.Offset) - v23.props.headerPadding, 1, 0), 
                Text = v23.props.headerText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v25.Font.Header1, 
                colorStyle = v25.Theme.TextEmphasis, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ResponsiveCarouselSeeAll = if v27 then v2.createElement(v9, {
                buttonType = v10.Secondary, 
                position = UDim2.new(1, v5.useFoundationButton and 0 or -v28.X.Offset, 0, 0), 
                anchorPoint = if v5.useFoundationButton then Vector2.new(1, 0) else nil, 
                size = v28, 
                text = v23.props.buttonText, 
                fontStyle = v25.Font.CaptionHeader, 
                onActivated = v26
            }) else nil
        });
    end);
end;
local function _(v29, v30, v31, v32) --[[ Line: 197 ]] --[[ Name: getCellHeight ]]
    return UDim.new(v32.Scale / v29, ((v30 - 2 * v31) / v29 - v30) * v32.Scale + v32.Offset);
end;
v14.render = function(v34) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v2 (copy), v11 (copy), v5 (copy)
    return v12({
        columns = 1, 
        gutter = 0, 
        margin = 0, 
        width = -1, 
        relativeHeight = false
    }, v34.props.kind)(function(v35) --[[ Line: 211 ]]
        -- upvalues: v34 (copy), v2 (ref), v11 (ref), v5 (ref)
        local v36 = v34.props.relativeHeight or v34.props.itemSize and UDim.new(0, v34.props.itemSize.Y) or v35.relativeHeight and v35.relativeHeight;
        local v37;
        if v36 then
            local l_columns_0 = v35.columns;
            local l_gutter_0 = v35.gutter;
            local l_margin_0 = v35.margin;
            local v41 = v36 + UDim.new(0, v34.props.headerHeight + v34.props.headerPadding);
            v37 = UDim.new(v41.Scale / l_columns_0, ((l_gutter_0 - 2 * l_margin_0) / l_columns_0 - l_gutter_0) * v41.Scale + v41.Offset);
        else
            v37 = UDim.new(0, 0);
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(UDim.new(1, 0), v37), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            AutomaticSize = if v36 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v34.props.layoutOrder, 
            [v2.Ref] = v34.props.carouselRef
        }, {
            v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v34.props.headerPadding)
            }); 
            ResponsiveCarouselHeader = if type(v34.props.headerText) == "function" then v34.props.headerText(v35) else v34:renderHeader({
                layoutOrder = 1, 
                margin = v35.margin, 
                width = v35.width
            }), 
            ResponsiveCarouselRow = v2.createElement(v11, {
                layoutOrder = 2, 
                zIndex = 2, 
                kind = v34.props.kind, 
                scrollable = v34.props.scrollable, 
                clipsDescendants = v34.props.clipsDescendants, 
                selectable = v34.props.selectable, 
                relativeHeight = v36, 
                data = if v34.props.data ~= nil then v34.props.data else v34.props.itemList, 
                getItem = v34.props.getItem, 
                getItemCount = v34.props.getItemCount or if v34.props.data == nil and v34.props.itemList then v34.itemListCount else nil, 
                renderItem = v34.props.renderItem, 
                keyExtractor = v34.props.keyExtractor or v34.props.identifier, 
                getCellColspan = v34.props.getCellColspan, 
                getCellOrder = v34.props.getCellOrder, 
                scrollingFrameRef = if v5.responsiveBaseRowScrollingFrameRef then v34.props.scrollingFrameRef else nil
            })
        });
    end);
end;
local v44 = v2.forwardRef(function(v42, v43) --[[ Line: 274 ]]
    -- upvalues: v2 (copy), v14 (copy), l_Object_0 (copy)
    return v2.createElement(v14, l_Object_0.assign({}, v42, {
        carouselRef = v43
    }));
end);
v44.validateProps = v14.validateProps;
return v44;