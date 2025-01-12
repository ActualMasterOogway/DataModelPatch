local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.RoactGamepad);
local v8 = require(l_Parent_0.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_1.App.SelectionCursor.useCursorByType);
local v10 = require(l_Parent_1.App.SelectionCursor.CursorType);
local v11 = require(l_Parent_1.Utility.lerp);
local v12 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v13 = require(l_Parent_1.App.SelectionImage.withSelectionCursorProvider);
local v14 = require(l_Parent_2.UIBlox.UIBloxConfig);
local v15 = v4.PureComponent:extend("GenericSlider");
v15.validateProps = v6.strictInterface({
    lowerValue = v6.number, 
    upperValue = v6.optional(v6.number), 
    min = v6.number, 
    max = v6.number, 
    stepInterval = v6.numberPositive, 
    isDisabled = v6.optional(v6.boolean), 
    onValueChanged = v6.callback, 
    onDragStartLower = v6.optional(v6.callback), 
    onDragStartUpper = v6.optional(v6.callback), 
    onDragEnd = v6.optional(v6.callback), 
    trackImage = v6.union(v6.string, v6.table), 
    trackColor = v6.union(v6.Color3, v6.table), 
    trackTransparency = v6.union(v6.number, v6.table), 
    trackSliceCenter = v6.optional(v6.Rect), 
    trackFillImage = v6.union(v6.string, v6.table), 
    trackFillColor = v6.union(v6.Color3, v6.table), 
    trackFillTransparency = v6.union(v6.number, v6.table), 
    trackFillSliceCenter = v6.optional(v6.Rect), 
    knobImage = v6.union(v6.string, v6.table), 
    knobColorLower = v6.union(v6.Color3, v6.table), 
    knobColorUpper = v6.optional(v6.union(v6.Color3, v6.table)), 
    knobTransparency = v6.union(v6.number, v6.table), 
    knobImagePadding = v6.optional(v6.numberMin(0)), 
    knobShadowImage = v6.union(v6.string, v6.table), 
    knobShadowTransparencyLower = v6.union(v6.number, v6.table), 
    knobShadowTransparencyUpper = v6.optional(v6.union(v6.number, v6.table)), 
    width = v6.optional(v6.UDim), 
    position = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    layoutOrder = v6.optional(v6.integer), 
    imageButtonRef = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    containerRef = v6.optional(v6.table), 
    customTrack = v6.optional(v6.table), 
    customKnobHeight = v6.optional(v6.number), 
    customKnobBorderColor = v6.optional(v6.Color3), 
    customKnobBorderSize = v6.optional(v6.number), 
    selectedCursor = if v14.migrateToNewSelectionCursor then v6.optional(v6.any) else nil, 
    unselectedCursor = if v14.migrateToNewSelectionCursor then v6.optional(v6.any) else nil
});
v15.defaultProps = {
    width = UDim.new(1, 0), 
    knobImagePadding = 0, 
    customKnobBorderColor = Color3.new(0, 0, 0)
};
v15.init = function(v16) --[[ Line: 104 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v16.rootRef = v16.props.imageButtonRef or v4.createRef();
    v16.lowerKnobRef = v4.createRef();
    v16.upperKnobRef = v4.createRef();
    v16.moveDirection = 0;
    v16.lowerKnobDrag = false;
    v16.upperKnobDrag = false;
    v16.totalMoveTime = 0;
    v16.isFirstMove = true;
    v16.unhandledTime = 0;
    v16.state = {
        lowerKnobIsSelected = false, 
        upperKnobIsSelected = false
    };
end;
v15.getKnobVisibleHeight = function(v17) --[[ Line: 122 ]] --[[ Name: getKnobVisibleHeight ]]
    if v17.props.customKnobHeight then
        return (44 - v17.props.knobImagePadding * 2) / 44 * v17.props.customKnobHeight;
    else
        return 44 - v17.props.knobImagePadding * 2;
    end;
end;
v15.getKnobHeight = function(v18) --[[ Line: 131 ]] --[[ Name: getKnobHeight ]]
    if v18.props.customKnobHeight then
        return 44 / (44 - v18.props.knobImagePadding * 2) * v18.props.customKnobHeight;
    else
        return 44;
    end;
end;
v15.onMoveStep = function(v19, v20, v21) --[[ Line: 141 ]] --[[ Name: onMoveStep ]]
    if not v19.state.lowerKnobIsSelected and not v19.state.upperKnobIsSelected then
        return;
    else
        local l_Position_0 = v20[Enum.KeyCode.Thumbstick1].Position;
        local v23 = l_Position_0.Magnitude > 0.2;
        local v24 = 0;
        local v25 = nil;
        local v26 = nil;
        local v27 = nil;
        v19.totalMoveTime = v19.totalMoveTime + v21;
        if v23 then
            v26 = l_Position_0.x > 0 and 1 or -1;
            v25 = 0.2;
            v27 = 12;
        else
            v26 = (v20[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (v20[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0);
            v25 = 0.5;
            v27 = 8;
        end;
        if v26 ~= 0 then
            if v19.isFirstMove then
                v19.isFirstMove = false;
                v19.totalMoveTime = 0;
                v19.unhandledTime = 0;
                v24 = 1;
            elseif v25 < v19.totalMoveTime then
                local v28 = v21 - math.max(v25 - v19.totalMoveTime - v21, 0) + v19.unhandledTime;
                v24 = math.floor(v27 * v28);
                v19.unhandledTime = v28 - v24 / v27;
            else
                v24 = 0;
                v19.unhandledTime = 0;
            end;
        else
            v19.totalMoveTime = 0;
            v19.isFirstMove = true;
        end;
        if v24 > 0 then
            v19:processGamepadInput(v26, v24);
        end;
        return;
    end;
end;
v15.processGamepadInput = function(v29, v30, v31) --[[ Line: 195 ]] --[[ Name: processGamepadInput ]]
    if v29:hasTwoKnobs() then
        v29:processTwoKnobGamepadInput(v30, v31);
        return;
    else
        v29:processOneKnobGamepadInput(v30, v31);
        return;
    end;
end;
v15.processTwoKnobGamepadInput = function(v32, v33, v34) --[[ Line: 203 ]] --[[ Name: processTwoKnobGamepadInput ]]
    local v35 = v32.props.stepInterval * v33;
    local l_lowerValue_0 = v32.props.lowerValue;
    local l_upperValue_0 = v32.props.upperValue;
    if l_lowerValue_0 == l_upperValue_0 and not v32.state.processingGamepad then
        if v32.state.lowerKnobIsSelected and v33 == 1 and l_lowerValue_0 ~= v32.props.max then
            v32:setState({
                lowerKnobIsSelected = false, 
                upperKnobIsSelected = true, 
                processingGamepad = true
            });
            v32.props.focusController.moveFocusTo(v32.upperKnobRef);
        elseif v32.state.upperKnobIsSelected and v33 == -1 and l_upperValue_0 ~= v32.props.min then
            v32:setState({
                lowerKnobIsSelected = true, 
                upperKnobIsSelected = false, 
                processingGamepad = true
            });
            v32.props.focusController.moveFocusTo(v32.lowerKnobRef);
        end;
    elseif not v32.state.processingGamepad then
        v32:setState({
            processingGamepad = true
        });
    end;
    if v32.state.lowerKnobIsSelected then
        local v38 = math.max(math.min(l_lowerValue_0 + v35 * v34, v32.props.max), v32.props.min);
        l_lowerValue_0 = if v38 <= l_upperValue_0 then v38 else l_upperValue_0;
    elseif v32.state.upperKnobIsSelected then
        local v39 = math.max(math.min(l_upperValue_0 + v35 * v34, v32.props.max), v32.props.min);
        l_upperValue_0 = if l_lowerValue_0 <= v39 then v39 else l_lowerValue_0;
    end;
    if l_upperValue_0 ~= v32.props.upperValue or l_lowerValue_0 ~= v32.props.lowerValue then
        v32.props.onValueChanged(l_lowerValue_0, l_upperValue_0);
    end;
end;
v15.processOneKnobGamepadInput = function(v40, v41, v42) --[[ Line: 257 ]] --[[ Name: processOneKnobGamepadInput ]]
    local v43 = v40.props.stepInterval * v41;
    local l_lowerValue_1 = v40.props.lowerValue;
    if v40.state.lowerKnobIsSelected then
        l_lowerValue_1 = math.max(math.min(l_lowerValue_1 + v43 * v42, v40.props.max), v40.props.min);
    end;
    if l_lowerValue_1 ~= v40.props.lowerValue then
        v40.props.onValueChanged(l_lowerValue_1);
    end;
end;
v15.renderTrack = function(v45, v46, v47, v48) --[[ Line: 270 ]] --[[ Name: renderTrack ]]
    -- upvalues: v4 (copy), v8 (copy)
    if v45.props.customTrack then
        return v45.props.customTrack;
    else
        return v4.createElement(v8.Label, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v45.props.trackColor, 
            ImageTransparency = v45.props.trackTransparency, 
            Image = v45.props.trackImage, 
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v45.props.trackSliceCenter
        }, {
            TrackFill = v4.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                ImageColor3 = v45.props.trackFillColor, 
                ImageTransparency = v45.props.trackFillTransparency, 
                Image = v45.props.trackFillImage, 
                Size = v46, 
                Position = v47 and UDim2.new(v48, 0, 0, 0) or UDim2.new(0, 0, 0, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v45.props.trackFillSliceCenter
            })
        });
    end;
end;
v15.wrapKnobWithBorder = function(v49, v50, v51) --[[ Line: 299 ]] --[[ Name: wrapKnobWithBorder ]]
    -- upvalues: v4 (copy)
    local v52 = if v49.props.customKnobHeight then v49.props.customKnobHeight else v49:getKnobVisibleHeight();
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v52, v52), 
        Position = v51, 
        BackgroundColor3 = v49.props.customKnobBorderColor, 
        ZIndex = 3
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        KnobContent = v50
    });
end;
v15.renderUpperKnob = function(v53, v54, v55, v56, v57) --[[ Line: 316 ]] --[[ Name: renderUpperKnob ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy), v14 (copy), v12 (copy)
    if not v56 then
        return nil;
    else
        local v58 = v53:getKnobHeight();
        local l_v54_0 = v54;
        if v53.props.customKnobBorderSize and v53.props.customKnobBorderSize > 0 then
            v58 = v58 - 2 * (v53.props.customKnobBorderSize + 2);
            l_v54_0 = UDim2.fromScale(0.5, 0.5);
        end;
        local v65 = v4.createElement(v7.Focusable[v8.Button], {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v53.props.knobColorUpper, 
            ImageTransparency = v53.props.knobTransparency, 
            Image = v53.props.knobImage, 
            Size = UDim2.fromOffset(v58, v58), 
            Position = l_v54_0, 
            ZIndex = 3, 
            NextSelectionLeft = not v55 and v53.props.upperValue ~= v53.props.lowerValue and v53.lowerKnobRef or nil, 
            NextSelectionRight = v55 and v53.upperKnobRef or nil, 
            NextSelectionUp = v55 and v53.upperKnobRef or nil, 
            NextSelectionDown = v55 and v53.upperKnobRef or nil, 
            SelectionImageObject = v55 and (if v14.migrateToNewSelectionCursor then v53.props.selectedCursor else v57(v12.SelectedKnob)) or if v14.migrateToNewSelectionCursor then v53.props.unselectedCursor else v57(v12.UnselectedKnob), 
            [v4.Ref] = v53.upperKnobRef, 
            [v4.Event.InputBegan] = function(_, v61) --[[ Line: 350 ]]
                -- upvalues: v53 (copy)
                if v53.props.isDisabled then
                    return;
                else
                    v53:onInputBegan(v61, true);
                    return;
                end;
            end, 
            inputBindings = {
                OnMoveStep = v7.Input.onMoveStep(function(v62, v63) --[[ Line: 358 ]]
                    -- upvalues: v53 (copy)
                    v53:onMoveStep(v62, v63);
                end), 
                SelectUpperKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 361 ]]
                    -- upvalues: v53 (copy)
                    v53:setState(function(v64) --[[ Line: 362 ]]
                        return {
                            upperKnobIsSelected = not v64.upperKnobIsSelected, 
                            processingGamepad = false
                        };
                    end);
                end), 
                UnselectUpperKnob = v55 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 369 ]]
                    -- upvalues: v53 (copy)
                    v53:setState({
                        upperKnobIsSelected = false, 
                        processingGamepad = false
                    });
                end) or nil
            }
        });
        if v53.props.customKnobBorderSize and v53.props.customKnobBorderSize > 0 then
            return v53:wrapKnobWithBorder(v65, v54);
        else
            return v65;
        end;
    end;
end;
v15.renderLowerKnob = function(v66, v67, v68, v69, v70) --[[ Line: 385 ]] --[[ Name: renderLowerKnob ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy), v14 (copy), v12 (copy)
    local v71 = v66:getKnobHeight();
    local l_v67_0 = v67;
    if v66.props.customKnobBorderSize and v66.props.customKnobBorderSize > 0 then
        v71 = v71 - 2 * (v66.props.customKnobBorderSize + 2);
        l_v67_0 = UDim2.fromScale(0.5, 0.5);
    end;
    local v78 = v4.createElement(v7.Focusable[v8.Button], {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageColor3 = v66.props.knobColorLower, 
        ImageTransparency = v66.props.knobTransparency, 
        Image = v66.props.knobImage, 
        Size = UDim2.fromOffset(v71, v71), 
        Position = l_v67_0, 
        ZIndex = 3, 
        inputBindings = {
            OnMoveStep = v7.Input.onMoveStep(function(v73, v74) --[[ Line: 403 ]]
                -- upvalues: v66 (copy)
                v66:onMoveStep(v73, v74);
            end), 
            SelectLowerKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 406 ]]
                -- upvalues: v66 (copy)
                v66:setState(function(v75) --[[ Line: 407 ]]
                    return {
                        lowerKnobIsSelected = not v75.lowerKnobIsSelected, 
                        processingGamepad = false
                    };
                end);
            end), 
            UnselectLowerKnob = v68 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 414 ]]
                -- upvalues: v66 (copy)
                v66:setState({
                    lowerKnobIsSelected = false, 
                    processingGamepad = false
                });
            end) or nil
        }, 
        NextSelectionLeft = v68 and v66.lowerKnobRef or nil, 
        NextSelectionRight = not (not v69 or v68) and v66.props.upperValue ~= v66.props.lowerValue and v66.upperKnobRef or nil, 
        NextSelectionUp = v68 and v66.lowerKnobRef or nil, 
        NextSelectionDown = v68 and v66.lowerKnobRef or nil, 
        SelectionImageObject = v68 and (if v14.migrateToNewSelectionCursor then v66.props.selectedCursor else v70(v12.SelectedKnob)) or if v14.migrateToNewSelectionCursor then v66.props.unselectedCursor else v70(v12.UnselectedKnob), 
        [v4.Ref] = v66.lowerKnobRef, 
        [v4.Event.InputBegan] = function(_, v77) --[[ Line: 433 ]]
            -- upvalues: v66 (copy)
            if v66.props.isDisabled then
                return;
            else
                v66:onInputBegan(v77, true);
                return;
            end;
        end
    });
    if v66.props.customKnobBorderSize and v66.props.customKnobBorderSize > 0 then
        return v66:wrapKnobWithBorder(v78, v67);
    else
        return v78;
    end;
end;
v15.renderKnobShadow = function(v79, v80, v81) --[[ Line: 449 ]] --[[ Name: renderKnobShadow ]]
    -- upvalues: v4 (copy), v8 (copy)
    return v4.createElement(v8.Label, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageTransparency = v80, 
        Image = v79.props.knobShadowImage, 
        Size = UDim2.fromOffset(v79:getKnobHeight(), v79:getKnobHeight()), 
        Position = v81, 
        ZIndex = 2
    });
end;
v15.render = function(v82) --[[ Line: 461 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v13 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v83 = v82.state.lowerKnobIsSelected or v82.state.upperKnobIsSelected;
    local v84 = v82:hasTwoKnobs();
    local v85 = (v82.props.lowerValue - v82.props.min) / (v82.props.max - v82.props.min);
    local v86 = v84 and (v82.props.upperValue - v82.props.min) / (v82.props.max - v82.props.min) or nil;
    local v87 = v82:getKnobVisibleHeight();
    local v88 = v11(v87 / 2, -v87 / 2, v85);
    local v89 = v84 and v11(v87 / 2, -v87 / 2, v86) or nil;
    local v90 = UDim2.new(v85, v88, 0.5, 0);
    local v91 = v84 and UDim2.new(v86, v89, 0.5, 0) or nil;
    local v92 = v84 and UDim2.fromScale(v86 - v85, 1) or UDim2.fromScale(v85, 1);
    local v93 = v82.state.lowerKnobIsSelected or v82.state.upperKnobIsSelected;
    return v13(function(v94) --[[ Line: 476 ]]
        -- upvalues: v4 (ref), v7 (ref), v8 (ref), v82 (copy), v93 (copy), v92 (copy), v84 (copy), v85 (copy), v90 (copy), v83 (copy), v91 (copy)
        return v4.createElement(v7.Focusable[v8.Button], {
            BackgroundTransparency = 1, 
            AnchorPoint = v82.props.anchorPoint, 
            Size = UDim2.new(v82.props.width.Scale, v82.props.width.Offset, 0, 36), 
            LayoutOrder = v82.props.layoutOrder, 
            Position = v82.props.position, 
            [v4.Event.InputBegan] = function(_, v96) --[[ Line: 483 ]]
                -- upvalues: v82 (ref)
                if v82.props.isDisabled then
                    return;
                else
                    v82:onInputBegan(v96, false);
                    return;
                end;
            end, 
            [v4.Ref] = v82.rootRef, 
            NextSelectionLeft = v93 and v82.rootRef or nil, 
            NextSelectionRight = v93 and v82.rootRef or nil, 
            NextSelectionUp = not v93 and v82.props.NextSelectionUp or v82.rootRef, 
            NextSelectionDown = not v93 and v82.props.NextSelectionDown or v82.rootRef, 
            defaultChild = v82.props.upperValue ~= v82.props.min and v82.lowerKnobRef or v82.upperKnobRef or nil, 
            onFocusLost = function() --[[ Line: 500 ]] --[[ Name: onFocusLost ]]
                -- upvalues: v82 (ref)
                if v82.state.lowerKnobIsSelected or v82.state.upperKnobIsSelected then
                    v82:setState({
                        lowerKnobIsSelected = false, 
                        upperKnobIsSelected = false
                    });
                end;
            end
        }, {
            Track = v82:renderTrack(v92, v84, v85), 
            LowerKnob = v82:renderLowerKnob(v90, v83, v84, v94), 
            LowerKnobShadow = v82:renderKnobShadow(v82.props.knobShadowTransparencyLower, v90), 
            UpperKnob = v82:renderUpperKnob(v91, v83, v84, v94), 
            UpperKnobShadow = v84 and v82:renderKnobShadow(v82.props.knobShadowTransparencyUpper, v91) or nil
        });
    end);
end;
v15.didMount = function(v97) --[[ Line: 520 ]] --[[ Name: didMount ]]
    local l_current_0 = v97.rootRef.current;
    local v99 = nil;
    local function v100() --[[ Line: 528 ]] --[[ Name: checkAncestry ]]
        -- upvalues: l_current_0 (copy), v99 (ref), v97 (copy)
        if not l_current_0:IsDescendantOf(game) then
            return;
        else
            v99:Disconnect();
            v97.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
            return;
        end;
    end;
    v99 = l_current_0.AncestryChanged:Connect(v100);
    if l_current_0:IsDescendantOf(game) then
        v99:Disconnect();
        v97.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
    end;
end;
v15.didUpdate = function(v101, _, v103) --[[ Line: 546 ]] --[[ Name: didUpdate ]]
    if v101.props.disabled then
        v101:stopListeningForDrag();
    end;
    local v104 = v103.lowerKnobIsSelected and not v101.state.lowerKnobIsSelected;
    local v105 = v103.upperKnobIsSelected and not v101.state.upperKnobIsSelected;
    if v101.props.onDragEnd ~= nil and (v104 or v105) then
        v101.props.onDragEnd();
        return;
    elseif v101.props.onDragStartLower ~= nil and not v103.lowerKnobIsSelected and v101.state.lowerKnobIsSelected then
        v101.props.onDragStartLower();
        return;
    else
        if v101.props.onDragStartUpper ~= nil and not v103.upperKnobIsSelected and v101.state.upperKnobIsSelected then
            v101.props.onDragStartUpper();
        end;
        return;
    end;
end;
v15.willUnmount = function(v106) --[[ Line: 569 ]] --[[ Name: willUnmount ]]
    v106:stopListeningForDrag();
end;
v15.onInputBegan = function(v107, v108, v109) --[[ Line: 573 ]] --[[ Name: onInputBegan ]]
    if v107.props.disabled then
        return;
    elseif v108.UserInputState ~= Enum.UserInputState.Begin then
        return;
    else
        local l_UserInputType_0 = v108.UserInputType;
        if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
            return;
        elseif l_UserInputType_0 == Enum.UserInputType.Touch and not v109 then
            return;
        else
            v107:processDrag(v108.Position.X);
            v107:startListeningForDrag();
            return;
        end;
    end;
end;
v15.startListeningForDrag = function(v111) --[[ Line: 597 ]] --[[ Name: startListeningForDrag ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_current_1 = v111.rootRef.current;
    if l_current_1 == nil then
        return;
    elseif v111.dragging then
        return;
    else
        if v111.canUseUserInputService then
            local function v115(v113) --[[ Line: 612 ]]
                -- upvalues: v111 (copy)
                if not v111.dragging then
                    return;
                else
                    local l_UserInputType_1 = v113.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return;
                    elseif v113.UserInputState ~= Enum.UserInputState.Change then
                        return;
                    else
                        v111:processDrag(v113.Position.X);
                        return;
                    end;
                end;
            end;
            if v111.props.containerRef then
                v111.moveConnection = v111.props.containerRef.current.InputChanged:Connect(v115);
            else
                v111.moveConnection = l_UserInputService_0.InputChanged:Connect(v115);
            end;
            v111.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v116) --[[ Line: 641 ]]
                -- upvalues: v111 (copy)
                local l_UserInputType_2 = v116.UserInputType;
                if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                    return;
                else
                    v111:stopListeningForDrag();
                    if not v111.props.containerRef then
                        v111:processOneKnobDrag(v116.Position.X);
                    end;
                    return;
                end;
            end);
            v111.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 664 ]]
                -- upvalues: v111 (copy)
                v111:stopListeningForDrag();
            end);
        else
            local l_l_current_1_FirstAncestorWhichIsA_0 = l_current_1:FindFirstAncestorWhichIsA("PluginGui");
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.Name = "SliderPluginGuiInputCapturer";
            l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageButton_0.ZIndex = 100000;
            v111.moveConnection = l_ImageButton_0.MouseMoved:Connect(function(v120) --[[ Line: 684 ]]
                -- upvalues: v111 (copy)
                v111:processDrag(v120);
            end);
            v111.releaseConnection = l_ImageButton_0.MouseButton1Up:Connect(function(v121) --[[ Line: 688 ]]
                -- upvalues: v111 (copy)
                v111:stopListeningForDrag();
                v111:processOneKnobDrag(v121);
            end);
            v111.focusLostConnection = l_ImageButton_0.MouseLeave:Connect(function(v122) --[[ Line: 693 ]]
                -- upvalues: v111 (copy)
                v111:stopListeningForDrag();
                v111:processOneKnobDrag(v122);
            end);
            l_ImageButton_0.Parent = l_l_current_1_FirstAncestorWhichIsA_0;
            v111.inputCapturerButton = l_ImageButton_0;
        end;
        v111.dragging = true;
        if v111.lowerKnobDrag and v111.props.onDragStartLower ~= nil then
            v111.props.onDragStartLower();
        end;
        if v111.upperKnobDrag and v111.props.onDragStartUpper ~= nil then
            v111.props.onDragStartUpper();
        end;
        return;
    end;
end;
v15.getSteppedValue = function(v123, v124) --[[ Line: 713 ]] --[[ Name: getSteppedValue ]]
    local l_current_2 = v123.rootRef.current;
    if l_current_2 == nil then
        return 0;
    else
        local l_min_0 = v123.props.min;
        local l_max_0 = v123.props.max;
        local l_stepInterval_0 = v123.props.stepInterval;
        local l_X_0 = l_current_2.AbsoluteSize.X;
        return math.floor((math.clamp(v124 - l_current_2.AbsolutePosition.X, 0, l_X_0) / l_X_0 * (l_max_0 - l_min_0) + l_min_0) / l_stepInterval_0 + 0.5) * l_stepInterval_0;
    end;
end;
v15.processDrag = function(v130, v131) --[[ Line: 731 ]] --[[ Name: processDrag ]]
    if v130:hasTwoKnobs() then
        v130:processTwoKnobDrag(v131);
        return;
    else
        v130:processOneKnobDrag(v131);
        return;
    end;
end;
v15.processOneKnobDrag = function(v132, v133) --[[ Line: 739 ]] --[[ Name: processOneKnobDrag ]]
    if v132:hasTwoKnobs() then
        return;
    else
        local v134 = v132:getSteppedValue(v133);
        v132.lowerKnobDrag = true;
        if v134 ~= v132.props.lowerValue then
            v132.props.onValueChanged(v134);
        end;
        return;
    end;
end;
v15.processTwoKnobDrag = function(v135, v136) --[[ Line: 752 ]] --[[ Name: processTwoKnobDrag ]]
    local v137 = v135:getSteppedValue(v136);
    local l_lowerValue_2 = v135.props.lowerValue;
    local l_upperValue_1 = v135.props.upperValue;
    if not v135.lowerKnobDrag and not v135.upperKnobDrag then
        if v137 == l_lowerValue_2 then
            v135.lowerKnobDrag = true;
        end;
        if v137 == l_upperValue_1 then
            v135.upperKnobDrag = true;
        end;
    elseif v135.lowerKnobDrag and v135.upperKnobDrag then
        if l_upperValue_1 <= v137 - v135.props.stepInterval then
            v135.upperKnobDrag = true;
            v135.lowerKnobDrag = false;
            l_upperValue_1 = v137;
        elseif v137 + v135.props.stepInterval <= l_lowerValue_2 then
            v135.upperKnobDrag = false;
            v135.lowerKnobDrag = true;
            l_lowerValue_2 = v137;
        end;
    elseif v135.lowerKnobDrag then
        if v137 <= l_upperValue_1 then
            l_lowerValue_2 = v137;
        end;
    elseif v135.upperKnobDrag and l_lowerValue_2 <= v137 then
        l_upperValue_1 = v137;
    end;
    if l_upperValue_1 ~= v135.props.upperValue or l_lowerValue_2 ~= v135.props.lowerValue then
        v135.props.onValueChanged(l_lowerValue_2, l_upperValue_1);
    end;
end;
v15.stopListeningForDrag = function(v140) --[[ Line: 793 ]] --[[ Name: stopListeningForDrag ]]
    if v140.moveConnection ~= nil then
        v140.moveConnection:Disconnect();
        v140.moveConnection = nil;
    end;
    if v140.releaseConnection ~= nil then
        v140.releaseConnection:Disconnect();
        v140.releaseConnection = nil;
    end;
    if v140.focusLostConnection ~= nil then
        v140.focusLostConnection:Disconnect();
        v140.focusLostConnection = nil;
    end;
    if v140.inputCapturerButton ~= nil then
        v140.inputCapturerButton:Destroy();
        v140.inputCapturerButton = nil;
    end;
    v140.dragging = false;
    v140.lowerKnobDrag = false;
    v140.upperKnobDrag = false;
    if v140.props.onDragEnd ~= nil then
        v140.props.onDragEnd();
    end;
end;
v15.hasTwoKnobs = function(v141) --[[ Line: 823 ]] --[[ Name: hasTwoKnobs ]]
    return v141.props.upperValue ~= nil;
end;
return v4.forwardRef(function(v142, v143) --[[ Line: 827 ]]
    -- upvalues: v9 (copy), v10 (copy), v14 (copy), v5 (copy), v4 (copy), v15 (copy)
    local v144 = v9(v10.SelectedKnob);
    local v145 = v9(v10.UnselectedKnob);
    if v14.migrateToNewSelectionCursor then
        v142 = v5.Dictionary.join({
            selectedCursor = v144, 
            unselectedCursor = v145
        }, v142);
    end;
    return v4.createElement(v15, v5.Dictionary.join(v142, {
        imageButtonRef = v143
    }));
end);