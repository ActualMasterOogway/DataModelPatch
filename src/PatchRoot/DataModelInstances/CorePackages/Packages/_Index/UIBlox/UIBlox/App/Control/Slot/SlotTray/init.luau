local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_2.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(script.Parent.TileSlot);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v14 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v15 = require(l_Parent_0.SelectionCursor.CursorType);
local v16 = require(l_Parent_1.UIBloxConfig);
local v17 = {
    dampingRatio = 1, 
    frequency = 10
};
local v18 = v5.strictInterface({
    displayText = v5.optional(v5.string), 
    thumbnail = v5.optional(v5.string), 
    isDisabled = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean)
});
local v19 = v5.strictInterface({
    slots = v5.array(v18), 
    defaultSelectedSlotIndex = v5.optional(v5.integer), 
    onChange = v5.callback, 
    width = v5.optional(v5.integer), 
    darken = v5.optional(v5.boolean), 
    onInputBegan = v5.optional(v5.callback), 
    onInputEnded = v5.optional(v5.callback), 
    scrollingFrameRef = v5.optional(v5.table), 
    onFocusChanged = v5.optional(v5.callback), 
    inputBindings = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table)
});
local function v25(v20, v21) --[[ Line: 114 ]] --[[ Name: useScrollingFrameMotor ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v22 = v4.useRef(nil);
    if v22.current == nil then
        v22.current = v6.createSingleMotor(v21 or 0);
    end;
    local l_current_0 = v22.current;
    v4.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: l_current_0 (copy), v20 (copy)
        l_current_0:onStep(function(v24) --[[ Line: 121 ]]
            -- upvalues: v20 (ref)
            if v20.current ~= nil then
                v20.current.CanvasPosition = Vector2.new(v24, 0);
            end;
        end);
        return function() --[[ Line: 127 ]]
            -- upvalues: l_current_0 (ref)
            l_current_0:destroy();
        end;
    end, {});
    return l_current_0;
end;
return function(v26) --[[ Line: 135 ]] --[[ Name: SlotTray ]]
    -- upvalues: v8 (copy), v4 (copy), v25 (copy), v6 (copy), v17 (copy), v11 (copy), v16 (copy), v14 (copy), v15 (copy), v13 (copy), v12 (copy), v19 (copy), v7 (copy), l_Focusable_0 (copy), v10 (copy)
    local v27 = v8.useRefCache();
    local v28 = v4.useRef(nil);
    if v26.scrollingFrameRef then
        v28 = v26.scrollingFrameRef;
    end;
    local v29 = v26.width or 360;
    local v30 = v25(v28, 0);
    local v31, v32 = v4.useState(v26.defaultSelectedSlotIndex or 1);
    v4.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: v28 (ref), v31 (copy), v27 (copy), v29 (copy), v30 (copy), v6 (ref), v17 (ref)
        local l_current_1 = v28.current;
        if v31 == 0 or not l_current_1 then
            return;
        else
            local v34 = v27[v31] and v27[v31].current;
            if not v34 then
                return;
            else
                local l_X_0 = l_current_1.CanvasPosition.X;
                local l_X_1 = l_current_1.AbsolutePosition.X;
                local v37 = l_X_1 + v29;
                local l_X_2 = v34.AbsolutePosition.X;
                local v39 = l_X_2 + 48 + 24 - v37;
                local v40 = l_X_2 - 24 - l_X_1;
                local v41 = l_X_0 + v39;
                local v42 = l_X_0 + v40;
                if l_X_0 < v41 then
                    v30:setGoal(v6.spring(v41, v17));
                    return;
                else
                    if v42 < l_X_0 then
                        v30:setGoal(v6.spring(v42, v17));
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v31, 
        v29, 
        v27, 
        v28, 
        v30
    });
    local v44 = v4.useCallback(function(v43) --[[ Line: 182 ]]
        -- upvalues: v32 (copy), v26 (copy)
        v32(v43);
        v26.onChange(v43);
    end, {
        v26.onChange
    });
    local v45 = #v26.slots * 48 + (#v26.slots - 1) * 12 + 48;
    local v46 = v11();
    local v47 = if v16.migrateToNewSelectionCursor then v14(v15.RoundedSlot) else v13(v12.RoundedSlot);
    assert(v19(v26));
    local l_Theme_0 = v46.Theme;
    local v51 = v7.List.map(v26.slots, function(v49, v50) --[[ Line: 197 ]]
        -- upvalues: v4 (ref), l_Focusable_0 (ref), v27 (copy), v26 (copy), v44 (copy), v47 (copy), v10 (ref), v31 (copy)
        return v4.createElement(l_Focusable_0.Frame, {
            key = "Slot" .. tostring(v50), 
            LayoutOrder = v50, 
            Size = UDim2.fromOffset(48, 48), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 2, 
            ref = v27[v50], 
            NextSelectionRight = v50 < #v26.slots and v27[v50 + 1] or nil, 
            NextSelectionLeft = v50 > 1 and v27[v50 - 1] or nil, 
            onFocusGained = function() --[[ Line: 207 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v44 (ref), v50 (copy)
                v44(v50);
            end, 
            SelectionImageObject = v47
        }, {
            Slot = v4.createElement(v10, {
                isSelected = v31 == v50, 
                displayText = v49.displayText, 
                thumbnail = v49.thumbnail, 
                isLoading = v49.isLoading, 
                isDisabled = v49.isDisabled, 
                index = v50, 
                onActivated = v44
            })
        });
    end);
    table.insert(v51, (v4.createElement("UIListLayout", {
        key = "Layout", 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 12)
    })));
    return v4.createElement(l_Focusable_0.ScrollingFrame, {
        Size = UDim2.fromOffset(v29, 72), 
        CanvasSize = UDim2.new(0, v45, 0, 72), 
        BackgroundTransparency = 1, 
        ScrollBarImageColor3 = l_Theme_0.PlaceHolder.Color, 
        ScrollBarImageTransparency = l_Theme_0.PlaceHolder.Transparency, 
        ScrollBarThickness = 0, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ref = v28, 
        [v4.Event.InputBegan] = v26.onInputBegan, 
        [v4.Event.InputEnded] = v26.onInputEnded, 
        onFocusChanged = v26.onFocusChanged, 
        inputBindings = v26.inputBindings, 
        NextSelectionDown = v26.NextSelectionDown, 
        NextSelectionUp = v26.NextSelectionUp, 
        NextSelectionLeft = v26.NextSelectionLeft, 
        NextSelectionRight = v26.NextSelectionRight, 
        defaultChild = v27[1], 
        restorePreviousChildFocus = true
    }, {
        SlotContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if v26.darken then l_Theme_0.Overlay.Color else l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = if v26.darken then l_Theme_0.Overlay.Transparency else l_Theme_0.PlaceHolder.Transparency
        }, v51)
    });
end;