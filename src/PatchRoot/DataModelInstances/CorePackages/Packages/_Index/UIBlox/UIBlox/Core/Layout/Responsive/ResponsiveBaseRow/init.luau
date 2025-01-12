local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_1.UIBloxConfig);
local v7 = require(l_Parent_0.ResponsiveLayoutContext);
local v8 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v9 = v3.PureComponent:extend("ResponsiveBaseRow");
local function v11(v10) --[[ Line: 17 ]] --[[ Name: multilineScrollingValidator ]]
    if v10.multiLine and v10.scrollable then
        return false, "multiLine can't be scrollable";
    else
        return true;
    end;
end;
v9.validateProps = v4.strictInterface({
    kind = v4.optional(v4.string), 
    layoutOrder = v4.optional(v4.integer), 
    zIndex = v4.optional(v4.number), 
    scrollable = v4.optional(v4.boolean), 
    clipsDescendants = v4.optional(v4.boolean), 
    selectable = v4.optional(v4.boolean), 
    pages = v4.optional(v4.numberPositive), 
    multiLine = v4.optional(v4.boolean), 
    lines = v4.optional(v4.intersection(v4.integer, v4.numberMin(0))), 
    paddingTopLines = v4.optional(v4.intersection(v4.integer, v4.numberMin(0))), 
    relativeHeight = v4.optional(v4.UDim), 
    scrollingFrameRef = v4.optional(v4.table), 
    [v3.Children] = v4.optional(v4.table), 
    gridBasicRowRef = v4.optional(v4.union(v4.table, v4.callback))
});
v9.defaultProps = {
    kind = "default", 
    scrollable = false, 
    selectable = false, 
    clipsDescendants = true, 
    multiLine = false
};
v9.renderChildrenWithPadding = function(v12, v13, v14) --[[ Line: 65 ]] --[[ Name: renderChildrenWithPadding ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v15 = v12.props.lines or 1;
    local v16 = v12.props.paddingTopLines or 0;
    return l_Object_0.assign({
        _uiblox_grid_padding_ = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v13), 
            PaddingRight = UDim.new(0, v13), 
            PaddingTop = if v12.props.multiLine and v16 > 0 and v15 > 0 then UDim.new(v16 / v15, v16 / v15 * v14) else nil
        })
    }, v12.props[v3.Children]);
end;
v9.renderChildrenMultiline = function(v17, v18, v19, v20, v21) --[[ Line: 81 ]] --[[ Name: renderChildrenMultiline ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v22 = v17.props.lines or 1;
    if v17.props.paddingTopLines then
        v22 = v22 - v17.props.paddingTopLines;
    end;
    v22 = math.max(v22, 1);
    return l_Object_0.assign({
        _uiblox_grid_layout_ = v3.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirectionMaxCells = v18, 
            CellSize = UDim2.new(1 / v18, math.floor((1 - v18) / v18 * v20), 1 / v22, (math.floor((1 - v22) / v22 * v21))), 
            CellPadding = UDim2.fromOffset(v20, v21)
        })
    }, v17:renderChildrenWithPadding(v19, v21));
end;
v9.renderChildren = function(v23, v24, v25, v26, v27) --[[ Line: 103 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_Object_0 (copy), v3 (copy), v6 (copy)
    local v28 = l_Object_0.assign({
        _uiblox_grid_layout_ = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v26)
        })
    }, v23:renderChildrenWithPadding(v25, v27));
    if v24 then
        local v29 = v23.props.pages or 1;
        return {
            ResponsiveRowScroller = v3.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                CanvasSize = UDim2.new(v29, (v29 - 1) * (v26 - 2 * v25), 1, 0), 
                AutomaticCanvasSize = v23.props.pages and Enum.AutomaticSize.None or Enum.AutomaticSize.X, 
                Selectable = v23.props.selectable, 
                ClipsDescendants = v23.props.clipsDescendants, 
                [v3.Ref] = if v6.responsiveBaseRowScrollingFrameRef then v23.props.scrollingFrameRef else nil
            }, v28)
        };
    else
        return v28;
    end;
end;
local function _(v30, v31) --[[ Line: 139 ]] --[[ Name: applyUDim ]]
    return v30.Scale * v31 + v30.Offset;
end;
v9.getSize = function(v33, v34, v35, v36, v37, v38) --[[ Line: 144 ]] --[[ Name: getSize ]]
    if v34 == nil then
        return UDim2.fromScale(1, 0);
    else
        local v39 = v34.Scale / v38;
        local v40 = (v35 - 2 * v37) / v38 - v35;
        local v41 = v34.Scale * v40 + v34.Offset;
        if v33.props.multiLine and v33.props.lines then
            if v33.props.lines == 0 then
                return UDim2.fromScale(1, 0);
            else
                v39 = v39 * v33.props.lines;
                v41 = v41 * v33.props.lines + (v33.props.lines - 1) * v36;
            end;
        end;
        return UDim2.new(1, 0, v39, v41);
    end;
end;
v9.render = function(v42) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v3 (copy), v7 (copy), l_Object_0 (copy), v8 (copy)
    assert(v11(v42.props));
    local l_relativeHeight_0 = v42.props.relativeHeight;
    local l_scrollable_0 = v42.props.scrollable;
    local l_multiLine_0 = v42.props.multiLine;
    local v46 = if v42.props.layoutOrder then string.format("ResponsiveRow%02d", v42.props.layoutOrder) else "ResponsiveRow";
    return v3.createElement(v7.Consumer, {
        render = function(v47) --[[ Line: 177 ]] --[[ Name: render ]]
            -- upvalues: l_Object_0 (ref), v42 (copy), l_scrollable_0 (copy), l_multiLine_0 (copy), l_relativeHeight_0 (ref), v8 (ref), v3 (ref), v7 (ref), v46 (copy)
            local v48 = l_Object_0.assign({}, v47, {
                kind = v42.props.kind or l_Object_0.None, 
                scrollable = l_scrollable_0, 
                pages = v42.props.pages or 1, 
                multiLine = l_multiLine_0, 
                relativeHeight = l_relativeHeight_0, 
                subPixelOffset = 0
            });
            if not l_relativeHeight_0 then
                l_relativeHeight_0 = v8.getValue(v48, "relativeHeight");
                v48.relativeHeight = l_relativeHeight_0;
            end;
            local v49 = v8.getValue(v48, "width");
            local v50 = v8.getValue(v48, "gutter") or 0;
            local v51 = v8.getValue(v48, "verticalGutter") or v50;
            local v52 = v8.getValue(v48, "margin") or 0;
            local v53 = v8.getValue(v48, "columns") or 1;
            local v54 = l_relativeHeight_0 and (not l_multiLine_0 or v42.props.lines);
            local v55 = v42:getSize(l_relativeHeight_0, v50, v51, v52, v53);
            local l_createElement_0 = v3.createElement;
            local l_Provider_0 = v7.Provider;
            local v58 = {
                value = v48
            };
            local v59 = {};
            local l_v46_0 = v46;
            local l_createElement_1 = v3.createElement;
            local v62 = "Frame";
            local v63 = {
                Size = v55, 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                AutomaticSize = if v54 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v42.props.layoutOrder, 
                ZIndex = v42.props.zIndex, 
                [v3.Ref] = v42.props.gridBasicRowRef
            };
            local l_assign_0 = l_Object_0.assign;
            local v65 = {};
            local v66;
            if v49 then
                v66 = v3.createElement;
                local v67 = "UISizeConstraint";
                local v68 = {};
                local l_new_0 = Vector2.new;
                local l_v49_0 = v49;
                local v71;
                if l_relativeHeight_0 then
                    local l_Y_0 = v55.Y;
                    v71 = l_Y_0.Scale * v49 + l_Y_0.Offset;
                else
                    v71 = 1e999;
                end;
                v68.MaxSize = l_new_0(l_v49_0, v71);
                v66 = v66(v67, v68);
            else
                v66 = nil;
            end;
            v65._uiblox_grid_maxwidth_ = v66;
            v59[l_v46_0] = l_createElement_1(v62, v63, l_assign_0(v65, if l_multiLine_0 then v42:renderChildrenMultiline(v53, v52, v50, v51) else v42:renderChildren(l_scrollable_0, v52, v50, v51)));
            return l_createElement_0(l_Provider_0, v58, v59);
        end
    });
end;
return v3.forwardRef(function(v73, v74) --[[ Line: 233 ]]
    -- upvalues: v3 (copy), v9 (copy), l_Object_0 (copy)
    return v3.createElement(v9, l_Object_0.assign({}, v73, {
        gridBasicRowRef = v74
    }));
end);