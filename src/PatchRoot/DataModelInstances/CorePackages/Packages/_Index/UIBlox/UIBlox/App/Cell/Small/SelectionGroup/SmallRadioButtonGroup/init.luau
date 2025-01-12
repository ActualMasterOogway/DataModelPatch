local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.App.SelectionImage.withSelectionCursorProvider);
local v8 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v9 = require(l_Parent_0.SelectionCursor.withCursor);
local v10 = require(l_Parent_0.SelectionCursor.CursorType);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = require(l_Parent_1.App.Cell.Small.SelectionGroup.SmallRadioButtonCell);
local v13 = v3.PureComponent:extend("SmallRadioButtonGroup");
local v14 = v6.strictInterface({
    text = v6.string, 
    id = v6.string, 
    isDisabled = v6.optional(v6.boolean)
});
v13.validateProps = v6.strictInterface({
    items = v6.optional(v6.array(v6.tuple(v14))), 
    selectedValue = v6.optional(v6.string), 
    onActivated = v6.callback, 
    layoutOrder = v6.optional(v6.number), 
    useDefaultControlState = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table)
});
v13.defaultProps = {
    selectedValue = nil
};
v13.init = function(v15) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v15.gamepadRefs = v5.createRefCache();
end;
v13.render = function(v16) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v11 (copy), v9 (copy), v5 (copy), v12 (copy), v10 (copy), v7 (copy), v8 (copy)
    assert(v16.validateProps(v16.props));
    local v17 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        })
    };
    for v18, v19 in ipairs(v16.props.items) do
        if v11.migrateToNewSelectionCursor then
            v17["smallRadioButtonCell" .. v19.id] = v9(function(v20) --[[ Line: 75 ]]
                -- upvalues: v3 (ref), v5 (ref), v12 (ref), v19 (copy), v16 (copy), v18 (copy), v10 (ref)
                return v3.createElement(v5.Focusable[v12], {
                    id = v19.id, 
                    text = v19.text, 
                    onActivated = v16.props.onActivated, 
                    isSelected = v16.props.selectedValue == v19.id, 
                    isDisabled = v19.isDisabled, 
                    layoutOrder = v18, 
                    useDefaultControlState = v16.props.useDefaultControlState, 
                    [v3.Ref] = v16.gamepadRefs[v18], 
                    NextSelectionUp = v18 > 1 and v16.gamepadRefs[v18 - 1] or nil, 
                    NextSelectionDown = v18 < #v16.props.items and v16.gamepadRefs[v18 + 1] or nil, 
                    SelectionImageObject = v20.getCursorByType(v10.SelectionCell)
                });
            end);
        else
            v17["smallRadioButtonCell" .. v19.id] = v7(function(v21) --[[ Line: 93 ]]
                -- upvalues: v3 (ref), v5 (ref), v12 (ref), v19 (copy), v16 (copy), v18 (copy), v8 (ref)
                return v3.createElement(v5.Focusable[v12], {
                    id = v19.id, 
                    text = v19.text, 
                    onActivated = v16.props.onActivated, 
                    isSelected = v16.props.selectedValue == v19.id, 
                    isDisabled = v19.isDisabled, 
                    layoutOrder = v18, 
                    useDefaultControlState = v16.props.useDefaultControlState, 
                    [v3.Ref] = v16.gamepadRefs[v18], 
                    NextSelectionUp = v18 > 1 and v16.gamepadRefs[v18 - 1] or nil, 
                    NextSelectionDown = v18 < #v16.props.items and v16.gamepadRefs[v18 + 1] or nil, 
                    SelectionImageObject = v21(v8.SelectionCell)
                });
            end);
        end;
    end;
    local v22 = v16.props.items and #v16.props.items > 0;
    return v3.createElement(v22 and v5.Focusable.Frame or "Frame", {
        defaultChild = v22 and v16.gamepadRefs[1] or nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.props.layoutOrder, 
        NextSelectionLeft = v16.props.NextSelectionLeft, 
        NextSelectionRight = v16.props.NextSelectionRight, 
        NextSelectionDown = v16.props.NextSelectionDown, 
        NextSelectionUp = v16.props.NextSelectionUp, 
        [v3.Ref] = v16.props.frameRef
    }, v17);
end;
return v3.forwardRef(function(v23, v24) --[[ Line: 128 ]]
    -- upvalues: v3 (copy), v13 (copy), v4 (copy)
    return v3.createElement(v13, v4.Dictionary.join(v23, {
        frameRef = v24
    }));
end);