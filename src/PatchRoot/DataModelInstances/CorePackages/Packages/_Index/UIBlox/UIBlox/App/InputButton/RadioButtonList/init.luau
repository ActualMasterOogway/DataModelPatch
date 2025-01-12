local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_UIBlox_0 = l_Parent_0.UIBlox;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactGamepad);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.RadioButton);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider);
local v8 = require(l_UIBlox_0.App.SelectionImage.CursorKind);
local v9 = require(l_UIBlox_0.App.SelectionCursor.withCursor);
local v10 = require(l_UIBlox_0.App.SelectionCursor.CursorType);
local v11 = require(l_UIBlox_0.UIBloxConfig);
local v12 = v2.PureComponent:extend("RadioButtonList");
local v13 = v4.strictInterface({
    label = v4.string, 
    isDisabled = v4.optional(v4.boolean)
});
v12.validateProps = v4.strictInterface({
    radioButtons = v4.array(v4.union(v4.string, v13)), 
    onActivated = v4.callback, 
    elementSize = v4.UDim2, 
    initialValue = v4.optional(v4.number), 
    currentValue = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    padding = v4.optional(v4.UDim), 
    automaticSize = v4.optional(v4.boolean), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table)
});
v12.init = function(v14) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v14.state = {
        currentValue = v14.props.initialValue or 0
    };
    local v15 = {};
    for v16, v17 in ipairs(v14.props.radioButtons) do
        v15[v16] = type(v17) == "table" and (v17.isDisabled or false);
    end;
    v14.state.disabledIndices = v15;
    v14.doLogic = function(v18) --[[ Line: 61 ]]
        -- upvalues: v14 (copy)
        if v14.state.disabledIndices[v18] then
            return;
        else
            v14:setState({
                currentValue = v18
            });
            v14.props.onActivated(v18);
            return;
        end;
    end;
    v14.gamepadRefs = v3.createRefCache();
end;
v12.renderWithProviders = function(v19, v20, v21) --[[ Line: 74 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v11 (copy), v8 (copy)
    local v22 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v19.props.padding
        })
    };
    for v23, v24 in ipairs(v19.props.radioButtons) do
        v22["RadioButton" .. v23] = v2.createElement(v3.Focusable[v5], {
            text = type(v24) == "table" and v24.label or v24, 
            isSelected = if v19.props.currentValue ~= nil then v23 == v19.props.currentValue else v23 == v19.state.currentValue, 
            isDisabled = v19.state.disabledIndices[v23], 
            onActivated = v19.doLogic, 
            size = v19.props.elementSize, 
            layoutOrder = v23, 
            id = v23, 
            [v2.Ref] = v19.gamepadRefs[v23], 
            NextSelectionUp = v23 > 1 and v19.gamepadRefs[v23 - 1] or nil, 
            NextSelectionDown = v23 < #v19.props.radioButtons and v19.gamepadRefs[v23 + 1] or nil, 
            SelectionImageObject = if v11.migrateToNewSelectionCursor then v21 else v20(v8.RoundedRect), 
            inputBindings = {
                OnActivatedButton = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 99 ]]
                    -- upvalues: v19 (copy), v23 (copy)
                    v19.doLogic(v23);
                end)
            }
        });
    end;
    return v2.createElement(v3.Focusable.Frame, {
        Size = if v19.props.automaticSize then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1), 
        AutomaticSize = if v19.props.automaticSize then Enum.AutomaticSize.Y else nil, 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.props.layoutOrder, 
        NextSelectionLeft = v19.props.NextSelectionLeft, 
        NextSelectionRight = v19.props.NextSelectionRight, 
        NextSelectionDown = v19.props.NextSelectionDown, 
        NextSelectionUp = v19.props.NextSelectionUp, 
        [v2.Ref] = v19.props.forwardRef
    }, v22);
end;
v12.render = function(v25) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v11 (copy), v9 (copy), v10 (copy)
    return v7(function(v26) --[[ Line: 120 ]]
        -- upvalues: v11 (ref), v9 (ref), v10 (ref), v25 (copy)
        if v11.migrateToNewSelectionCursor then
            return v9(function(v27) --[[ Line: 122 ]]
                -- upvalues: v10 (ref), v25 (ref), v26 (copy)
                local v28 = v27.getCursorByType(v10.RoundedRect);
                return v25:renderWithProviders(v26, v28);
            end);
        else
            return v25:renderWithProviders(v26);
        end;
    end);
end;
return v2.forwardRef(function(v29, v30) --[[ Line: 132 ]]
    -- upvalues: v2 (copy), v12 (copy), v6 (copy)
    return v2.createElement(v12, v6.Dictionary.join(v29, {
        forwardRef = v30
    }));
end);