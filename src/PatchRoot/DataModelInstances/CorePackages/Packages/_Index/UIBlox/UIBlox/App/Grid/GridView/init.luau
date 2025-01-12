local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.RoactGamepad);
local v3 = require(l_Parent_0.Utility.isCallable);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_0.Utility.isPositiveVector2);
local v8 = v4.PureComponent:extend("GridView");
v8.validateProps = v6.strictInterface({
    renderItem = v3, 
    itemSize = v7, 
    itemPadding = v6.Vector2, 
    items = v6.table, 
    maxHeight = v6.numberMin(0), 
    windowHeight = v6.optional(v6.numberMin(0)), 
    LayoutOrder = v6.optional(v6.integer), 
    onWidthChanged = v6.optional(v3), 
    onNumItemsPerRowChanged = v6.optional(v3), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    restorePreviousChildFocus = v6.optional(v6.boolean), 
    onFocusGained = v6.optional(v6.callback), 
    defaultChildIndex = v6.optional(v6.numberMin(1))
});
v8.itemsAreVisible = function(v9) --[[ Line: 56 ]] --[[ Name: itemsAreVisible ]]
    return v9.state.isInDataModel and v9.state.containerWidth ~= 0 and v9.props.itemSize.X ~= 0;
end;
v8.defaultProps = {
    maxHeight = 1e999, 
    restorePreviousChildFocus = true
};
v8.init = function(v10) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v2 (copy)
    v10.currentItemsPerRow = -1;
    v10.frameRef = v4.createRef();
    v10.isMounted = false;
    v10.state = {
        containerWidth = 0, 
        containerYPosition = 0, 
        isInDataModel = false
    };
    v10.focusableRefs = v2.createRefCache();
    v10.onAncestryChanged = function(v11) --[[ Line: 82 ]]
        -- upvalues: v10 (copy)
        if v11:IsDescendantOf(game) then
            v10:setState(function(v12) --[[ Line: 84 ]]
                -- upvalues: v11 (copy)
                if not v12.isInDataModel or v12.containerWidth ~= v11.AbsoluteSize.X then
                    return {
                        isInDataModel = true, 
                        containerWidth = v11.AbsoluteSize.X
                    };
                else
                    return nil;
                end;
            end);
        end;
    end;
end;
v8.render = function(v13) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l_items_0 = v13.props.items;
    local v15 = #l_items_0;
    local l_itemSize_0 = v13.props.itemSize;
    local l_itemPadding_0 = v13.props.itemPadding;
    local l_maxHeight_0 = v13.props.maxHeight;
    local l_containerWidth_0 = v13.state.containerWidth;
    local l_containerYPosition_0 = v13.state.containerYPosition;
    local l_defaultChildIndex_0 = v13.props.defaultChildIndex;
    local l_onNumItemsPerRowChanged_0 = v13.props.onNumItemsPerRowChanged;
    local v23 = 1;
    local l_v15_0 = v15;
    local v25 = {};
    local v26 = 0;
    local v27 = 0;
    local v28 = nil;
    local v29 = nil;
    local v30 = math.max(1, l_itemSize_0.X + l_itemPadding_0.X);
    local v31 = math.max(1, l_itemSize_0.Y + l_itemPadding_0.Y);
    v28 = math.floor((l_containerWidth_0 + l_itemPadding_0.X) / v30);
    v29 = math.floor((l_maxHeight_0 + l_itemPadding_0.Y) / v31);
    if v28 ~= v13.currentItemsPerRow then
        v13.currentItemsPerRow = v28;
        if l_onNumItemsPerRowChanged_0 then
            l_onNumItemsPerRowChanged_0(v28);
        end;
    end;
    local v32 = math.min(v29, (math.ceil(v15 / v28)));
    local v33 = v32 * l_itemSize_0.Y + math.max(v32 - 1, 0) * l_itemPadding_0.Y;
    if v13.props.windowHeight ~= nil then
        local v34 = math.floor((v13.props.windowHeight + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y)) + 2;
        local v35 = math.floor((l_containerYPosition_0 + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y));
        local v36 = math.min(v32, v35 + v34) + 1;
        v23 = math.max(1, v35 * v28 + 1);
        l_v15_0 = math.min(v15, v36 * v28);
        v27 = v35 * l_itemSize_0.Y + v35 * l_itemPadding_0.Y;
    end;
    local function _(v37, v38) --[[ Line: 147 ]] --[[ Name: getItemIndexRef ]]
        -- upvalues: v28 (ref), v23 (ref), l_v15_0 (ref), v13 (copy)
        local v39 = false;
        if v37 > 0 then
            v39 = false;
            if v38 > 0 then
                v39 = v38 <= v28;
            end;
        end;
        local v40 = 1 + ((v37 - 1) * v28 + (v38 - 1));
        local v41 = false;
        if v23 <= v40 then
            v41 = v40 <= l_v15_0;
        end;
        return v41 and v39 and v13.focusableRefs[v40] or nil;
    end;
    local function v54(v43) --[[ Line: 156 ]] --[[ Name: renderItem ]]
        -- upvalues: v28 (ref), v13 (copy), v4 (ref), v2 (ref), v26 (ref), v27 (ref), l_itemSize_0 (copy), v23 (ref), l_v15_0 (ref), l_items_0 (copy)
        local v44 = 1 + math.floor((v43 - 1) / v28);
        local v45 = 1 + (v43 - 1) % v28;
        local v46 = v13:itemsAreVisible();
        local l_createElement_0 = v4.createElement;
        local l_Frame_0 = v2.Focusable.Frame;
        local v49 = {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v26, 0, v27), 
            Size = UDim2.new(0, l_itemSize_0.X, 0, l_itemSize_0.Y)
        };
        local v50 = v45 - 1;
        local v51 = false;
        if v44 > 0 then
            v51 = false;
            if v50 > 0 then
                v51 = v50 <= v28;
            end;
        end;
        local v52 = 1 + ((v44 - 1) * v28 + (v50 - 1));
        local v53 = false;
        if v23 <= v52 then
            v53 = v52 <= l_v15_0;
        end;
        v49.NextSelectionLeft = v53 and v51 and v13.focusableRefs[v52] or nil;
        v50 = v45 + 1;
        v51 = false;
        if v44 > 0 then
            v51 = false;
            if v50 > 0 then
                v51 = v50 <= v28;
            end;
        end;
        v52 = 1 + ((v44 - 1) * v28 + (v50 - 1));
        v53 = false;
        if v23 <= v52 then
            v53 = v52 <= l_v15_0;
        end;
        v49.NextSelectionRight = v53 and v51 and v13.focusableRefs[v52] or nil;
        v50 = v44 - 1;
        v51 = false;
        if v50 > 0 then
            v51 = false;
            if v45 > 0 then
                v51 = v45 <= v28;
            end;
        end;
        v52 = 1 + ((v50 - 1) * v28 + (v45 - 1));
        v53 = false;
        if v23 <= v52 then
            v53 = v52 <= l_v15_0;
        end;
        v49.NextSelectionUp = v53 and v51 and v13.focusableRefs[v52] or nil;
        v50 = v44 + 1;
        v51 = false;
        if v50 > 0 then
            v51 = false;
            if v45 > 0 then
                v51 = v45 <= v28;
            end;
        end;
        v52 = 1 + ((v50 - 1) * v28 + (v45 - 1));
        v53 = false;
        if v23 <= v52 then
            v53 = v52 <= l_v15_0;
        end;
        v49.NextSelectionDown = v53 and v51 and v13.focusableRefs[v52] or nil;
        v49[v4.Ref] = v13.focusableRefs[v43];
        v49.onFocusGained = v13.props.onFocusGained;
        return l_createElement_0(l_Frame_0, v49, {
            Content = v46 and v13.props.renderItem(l_items_0[v43], v43)
        });
    end;
    if v33 < l_maxHeight_0 then
        local v55 = false;
        local v56 = l_defaultChildIndex_0 and l_defaultChildIndex_0 <= v15;
        for v57 = v23, l_v15_0 do
            if v57 == l_defaultChildIndex_0 then
                v55 = true;
            end;
            v25[tostring(v57)] = v54(v57);
            local l_X_0 = l_itemSize_0.X;
            v26 = math.floor(v26 + l_X_0 + l_itemPadding_0.X);
            if l_containerWidth_0 < v26 + l_itemSize_0.X and v57 < l_v15_0 then
                v26 = 0;
                local l_Y_0 = l_itemPadding_0.Y;
                v27 = v27 + l_Y_0 + l_itemSize_0.Y;
            end;
        end;
        if v56 and not v55 then
            v26 = (l_defaultChildIndex_0 - 1) % v28 * (l_itemSize_0.X + l_itemPadding_0.X);
            v27 = math.floor((l_defaultChildIndex_0 - 1) / v28) * (l_itemPadding_0.Y + l_itemSize_0.Y);
            v25[tostring(l_defaultChildIndex_0)] = v54(l_defaultChildIndex_0);
        end;
    end;
    return v4.createElement(v2.Focusable.Frame, {
        BackgroundTransparency = 1, 
        LayoutOrder = v13.props.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v33), 
        [v4.Change.AbsolutePosition] = v13.props.windowHeight ~= nil and function(v60) --[[ Line: 224 ]]
            -- upvalues: v13 (copy)
            if v13.isMounted then
                v13:setState({
                    containerYPosition = -math.min(0, v60.AbsolutePosition.Y)
                });
            end;
        end or nil, 
        [v4.Change.AbsoluteSize] = function(v61) --[[ Line: 231 ]]
            -- upvalues: v13 (copy)
            if v13.isMounted then
                if v13.state.isInDataModel then
                    v13:setState({
                        containerWidth = v61.AbsoluteSize.X
                    });
                end;
                if v13.props.onWidthChanged ~= nil then
                    v13.props.onWidthChanged(v61.AbsoluteSize.X);
                end;
            end;
        end, 
        [v4.Event.AncestryChanged] = v13.onAncestryChanged, 
        NextSelectionLeft = v13.props.NextSelectionLeft, 
        NextSelectionRight = v13.props.NextSelectionRight, 
        NextSelectionUp = v13.props.NextSelectionUp, 
        NextSelectionDown = v13.props.NextSelectionDown, 
        [v4.Ref] = v13.props.frameRef or v13.frameRef, 
        defaultChild = l_defaultChildIndex_0 and v13.focusableRefs[l_defaultChildIndex_0] or nil, 
        restorePreviousChildFocus = v13.props.restorePreviousChildFocus
    }, v25);
end;
v8.didMount = function(v62) --[[ Line: 260 ]] --[[ Name: didMount ]]
    v62.isMounted = true;
    local v63 = v62.props.frameRef or v62.frameRef;
    if v63:getValue() and v63:getValue().AbsoluteSize.X ~= 0 then
        if v63:getValue():IsDescendantOf(game) then
            v62:setState(function(_) --[[ Line: 270 ]]
                -- upvalues: v63 (copy)
                if v63:getValue() then
                    return {
                        isInDataModel = true, 
                        containerWidth = v63:getValue().AbsoluteSize.X
                    };
                else
                    return nil;
                end;
            end);
        end;
        if v62.props.onWidthChanged ~= nil then
            delay(0, function() --[[ Line: 283 ]]
                -- upvalues: v63 (copy), v62 (copy)
                if v63:getValue() then
                    v62.props.onWidthChanged(v63:getValue().AbsoluteSize.X);
                end;
            end);
        end;
    end;
end;
v8.willUnmount = function(v65) --[[ Line: 292 ]] --[[ Name: willUnmount ]]
    v65.isMounted = false;
end;
return v4.forwardRef(function(v66, v67) --[[ Line: 296 ]]
    -- upvalues: v4 (copy), v8 (copy), v5 (copy)
    return v4.createElement(v8, v5.Dictionary.join(v66, {
        frameRef = v67
    }));
end);