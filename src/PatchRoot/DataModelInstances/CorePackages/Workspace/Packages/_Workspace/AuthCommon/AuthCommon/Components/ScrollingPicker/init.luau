local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local v6 = require(l_script_FirstAncestor_0.Enums.ScrollingPickerDirection);
local v7 = require(l_Parent_0.Otter);
local v8 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v9 = {
    [v6.Horizontal] = "X", 
    [v6.Vertical] = "Y"
};
local v10 = {
    [v6.Horizontal] = "Y", 
    [v6.Vertical] = "X"
};
local v11 = game:DefineFastFlag("UseAccumulationStepperForMouseWheelScrollPicker", false);
local v12 = game:DefineFastInt("ScrollingPickerSlowScrollStepWaitMs", 100);
local v13 = game:DefineFastInt("ScrollingPickerMaximumPickerChangePerInput", 1);
local v14 = game:DefineFastInt("ScrollingPickerSmallInputDecayFactor", 3);
local v15 = {
    spring = "spring", 
    instant = "instant"
};
local v16 = v2.PureComponent:extend("ScrollingPicker");
v16.MOUSE_WHEEL_STEP_THRESHOLD = 0.1;
v16.defaultProps = {
    layoutOrder = 0, 
    parentSpecifiedTarget = 1, 
    entries = {}, 
    entrySizeOnScrollingAxis = 10, 
    scrollDirection = v6.Vertical, 
    clipsDescendants = true
};
local v19 = setmetatable({
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.Touch] = true
}, {
    __index = function(_, _) --[[ Line: 81 ]] --[[ Name: __index ]]
        return false;
    end
});
v16.init = function(v20) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v10 (copy), v2 (copy), v15 (copy), v7 (copy), v19 (copy), v13 (copy), v16 (copy), v14 (copy), v11 (copy), v12 (copy)
    local l_parentSpecifiedTarget_0 = v20.props.parentSpecifiedTarget;
    local l_scrollDirection_0 = v20.props.scrollDirection;
    v20.state = {
        scrollDirection = l_scrollDirection_0, 
        scrollingAxis = v9[l_scrollDirection_0], 
        subAxis = v10[l_scrollDirection_0]
    };
    v20.isMounted = false;
    v20.currentIndex = 1;
    v20.targetEntryRef = v2.createRef();
    v20.targetIndex = l_parentSpecifiedTarget_0;
    v20.isEntrySelected = false;
    v20.isTargetIndexSetByUserInput = false;
    v20.timeInputBegan = tick();
    v20.recognizedInputBegan = false;
    v20.inputChanged = false;
    v20.inputPositionAtInputBegan = 0;
    v20.inputPreviousPositionScrollingAxis = 0;
    v20.scrollRef = v2.createRef();
    v20.scrollDeltaAccumulator = 0;
    v20.getCenterIndexByPosition = function(v23) --[[ Line: 132 ]]
        -- upvalues: v20 (copy)
        local l_entrySizeOnScrollingAxis_0 = v20.props.entrySizeOnScrollingAxis;
        return math.floor(-v23 / l_entrySizeOnScrollingAxis_0) + 1;
    end;
    v20.getCenterIndexByScrollPosition = function(v25) --[[ Line: 138 ]]
        -- upvalues: v20 (copy)
        v25 = v25 - v20.props.entrySizeOnScrollingAxis / 2;
        return v20.getCenterIndexByPosition(v25);
    end;
    v20.updateParent = function() --[[ Line: 149 ]]
        -- upvalues: v20 (copy)
        local l_onCurrentIndexChanged_0 = v20.props.onCurrentIndexChanged;
        local l_onSelectedIndexChanged_0 = v20.props.onSelectedIndexChanged;
        if l_onCurrentIndexChanged_0 then
            l_onCurrentIndexChanged_0(v20.currentIndex);
        end;
        if l_onSelectedIndexChanged_0 and v20.currentIndex == v20.targetIndex then
            l_onSelectedIndexChanged_0(v20.currentIndex, v20.isTargetIndexSetByUserInput);
        end;
    end;
    v20.onScrollPositionChanged = function() --[[ Line: 162 ]]
        -- upvalues: v20 (copy)
        if v20.scrollRef.current then
            local l_scrollingAxis_0 = v20.state.scrollingAxis;
            local l_Offset_0 = v20.scrollRef.current.Position[l_scrollingAxis_0].Offset;
            local v30 = v20.getCenterIndexByScrollPosition(l_Offset_0);
            if v30 ~= v20.currentIndex then
                v20.currentIndex = v30;
                v20.updateParent();
            end;
        end;
    end;
    v20.updateTargetIndex = function(v31) --[[ Line: 177 ]]
        -- upvalues: v15 (ref), v20 (copy), v7 (ref)
        local l_newTargetIndex_0 = v31.newTargetIndex;
        local l_isSetByUserInput_0 = v31.isSetByUserInput;
        local l_otterAnimationType_0 = v31.otterAnimationType;
        if l_otterAnimationType_0 == nil then
            l_otterAnimationType_0 = v15.spring;
        end;
        local l_entries_0 = v20.props.entries;
        local l_entrySizeOnScrollingAxis_1 = v20.props.entrySizeOnScrollingAxis;
        v20.targetIndex = #l_entries_0 < 1 and 0 or math.clamp(l_newTargetIndex_0, 1, #l_entries_0);
        v20.isTargetIndexSetByUserInput = l_isSetByUserInput_0;
        v20.motor:setGoal(v7[l_otterAnimationType_0](-(l_entrySizeOnScrollingAxis_1 * (v20.targetIndex - 1)), {
            frequency = 2
        }));
        if v20.currentIndex == v20.targetIndex then
            v20.updateParent();
        end;
    end;
    v20.updateIndexByInputPosition = function(v37) --[[ Line: 211 ]]
        -- upvalues: v20 (copy)
        if v20.scrollRef.current then
            local l_scrollingAxis_1 = v20.state.scrollingAxis;
            local l_AbsolutePosition_0 = v20.scrollRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v20.scrollRef.current.AbsoluteSize;
            if v37.X > l_AbsolutePosition_0.X and v37.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and v37.Y > l_AbsolutePosition_0.Y and v37.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                local v41 = l_AbsolutePosition_0[l_scrollingAxis_1] - v37[l_scrollingAxis_1];
                local v42 = v20.getCenterIndexByPosition(v41);
                v20.updateTargetIndex({
                    newTargetIndex = v42, 
                    isSetByUserInput = true
                });
            end;
        end;
    end;
    v20.updateIndexByScrollPositionAndOffset = function(v43) --[[ Line: 236 ]]
        -- upvalues: v20 (copy)
        v43 = v43 or 0;
        if v20.scrollRef.current then
            local l_scrollingAxis_2 = v20.state.scrollingAxis;
            local v45 = v20.scrollRef.current.Position[l_scrollingAxis_2].Offset + v43;
            local v46 = v20.getCenterIndexByScrollPosition(v45);
            v20.updateTargetIndex({
                newTargetIndex = v46, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onInputBegan = function(_, v48) --[[ Line: 255 ]]
        -- upvalues: v20 (copy), v19 (ref)
        local l_entries_1 = v20.props.entries;
        local l_scrollingAxis_3 = v20.state.scrollingAxis;
        if v20.isMounted and v19[v48.UserInputType] and #l_entries_1 > 0 and v48.UserInputState == Enum.UserInputState.Begin then
            v20.recognizedInputBegan = true;
            v20.timeInputBegan = tick();
            v20.inputPositionAtInputBegan = v48.Position[l_scrollingAxis_3];
            v20.inputPreviousPositionScrollingAxis = v48.Position[l_scrollingAxis_3];
            v20.motor:stop();
        end;
    end;
    v16.restrictInputChangeDelta = function(_, v52) --[[ Line: 281 ]] --[[ Name: restrictInputChangeDelta ]]
        -- upvalues: v13 (ref), v16 (ref), v14 (ref)
        local v53 = v52 > 0 and 1 or -1;
        local v54 = math.min(math.abs(v52), v13 * v16.MOUSE_WHEEL_STEP_THRESHOLD);
        if v54 < v16.MOUSE_WHEEL_STEP_THRESHOLD then
            return math.pow(v54 / v16.MOUSE_WHEEL_STEP_THRESHOLD, v14) * v16.MOUSE_WHEEL_STEP_THRESHOLD;
        else
            return v54 * v53;
        end;
    end;
    v20.onInputChanged = function(_, v56) --[[ Line: 302 ]]
        -- upvalues: v20 (copy), v11 (ref), v16 (ref), v15 (ref), v12 (ref), v7 (ref)
        local l_entries_2 = v20.props.entries;
        local l_entrySizeOnScrollingAxis_2 = v20.props.entrySizeOnScrollingAxis;
        local l_scrollingAxis_4 = v20.state.scrollingAxis;
        if v11 and v56.UserInputType == Enum.UserInputType.MouseWheel then
            local l_Z_0 = v56.Position.Z;
            local v61 = v16:restrictInputChangeDelta(l_Z_0);
            if l_Z_0 < 0 ~= (v20.scrollDeltaAccumulator < 0) then
                v20.scrollDeltaAccumulator = 0;
            end;
            v20.scrollDeltaAccumulator = v20.scrollDeltaAccumulator + v61;
            local v62 = math.abs(v20.scrollDeltaAccumulator) <= 4 * v16.MOUSE_WHEEL_STEP_THRESHOLD;
            while math.abs(v20.scrollDeltaAccumulator) >= v16.MOUSE_WHEEL_STEP_THRESHOLD do
                local v63 = v20.scrollDeltaAccumulator > 0 and 1 or -1;
                v20.updateTargetIndex({
                    newTargetIndex = v20.targetIndex - v63, 
                    isSetByUserInput = true, 
                    OtterAnimationType = v15.spring
                });
                v20.scrollDeltaAccumulator = v20.scrollDeltaAccumulator - v16.MOUSE_WHEEL_STEP_THRESHOLD * v63;
                if v62 then
                    task.wait(v12);
                end;
            end;
            return;
        else
            if v20.recognizedInputBegan then
                local v64 = v56.Position[l_scrollingAxis_4] - v20.inputPreviousPositionScrollingAxis;
                if v20.scrollRef.current then
                    local v65 = math.max(math.min(0, v20.scrollRef.current.Position[l_scrollingAxis_4].Offset + v64), -(l_entrySizeOnScrollingAxis_2 * (#l_entries_2 - 1)));
                    v20.motor:setGoal(v7.instant(v65));
                end;
                v20.inputChanged = true;
                v20.inputPreviousPositionScrollingAxis = v56.Position[l_scrollingAxis_4];
            end;
            return;
        end;
    end;
    v20.onInputEnded = function(_, v67) --[[ Line: 360 ]]
        -- upvalues: v20 (copy)
        local l_scrollingAxis_5 = v20.state.scrollingAxis;
        if v20.recognizedInputBegan then
            local v69 = v67.Position[l_scrollingAxis_5] - v20.inputPositionAtInputBegan;
            if v20.inputChanged and math.abs(v69) > 1.5 then
                local v70 = tick() - v20.timeInputBegan;
                if v70 < 0.3 then
                    local v71 = v67.Delta[l_scrollingAxis_5] / v70;
                    v20.updateIndexByScrollPositionAndOffset(v71);
                else
                    v20.updateIndexByScrollPositionAndOffset(0);
                end;
            else
                v20.updateIndexByInputPosition(v67.Position);
            end;
        end;
        v20.recognizedInputBegan = false;
        v20.inputChanged = false;
    end;
    v20.onMouseWheelForward = function() --[[ Line: 386 ]]
        -- upvalues: v11 (ref), v20 (copy)
        if not v11 then
            v20.updateTargetIndex({
                newTargetIndex = v20.targetIndex - 1, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onMouseWheelBackward = function() --[[ Line: 395 ]]
        -- upvalues: v11 (ref), v20 (copy)
        if not v11 then
            v20.updateTargetIndex({
                newTargetIndex = v20.targetIndex + 1, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onSelectionGained = function(v72) --[[ Line: 404 ]]
        -- upvalues: v20 (copy), v15 (ref)
        v20.isEntrySelected = true;
        v20.updateTargetIndex({
            newTargetIndex = v72, 
            isSetByUserInput = true, 
            otterAnimationType = v15.instant
        });
    end;
    v20.onSelectionLost = function() --[[ Line: 413 ]]
        -- upvalues: v20 (copy)
        v20.isEntrySelected = false;
    end;
end;
v16.didMount = function(v73) --[[ Line: 418 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v6 (copy), v15 (copy)
    v73.updateParent();
    v73.motor = v7.createSingleMotor(0);
    v73.motor:onStep(function(v74) --[[ Line: 422 ]]
        -- upvalues: v73 (copy), v6 (ref)
        if v73.scrollRef.current then
            local l_scrollingAxis_6 = v73.state.scrollingAxis;
            local l_subAxis_0 = v73.state.subAxis;
            local l_scrollDirection_1 = v73.state.scrollDirection;
            local l_Position_0 = v73.scrollRef.current.Position;
            l_Position_0 = if l_scrollDirection_1 == v6.Horizontal then UDim2.new(UDim.new(l_Position_0[l_scrollingAxis_6].Scale, v74), l_Position_0[l_subAxis_0]) else UDim2.new(l_Position_0[l_subAxis_0], UDim.new(l_Position_0[l_scrollingAxis_6].Scale, v74));
            v73.scrollRef.current.Position = l_Position_0;
        end;
    end);
    v73.motor:onComplete(function() --[[ Line: 440 ]]
        -- upvalues: v73 (copy)
        if v73.props.onAnimationComplete then
            v73.props.onAnimationComplete();
        end;
    end);
    v73.updateTargetIndex({
        newTargetIndex = v73.targetIndex, 
        isSetByUserInput = false, 
        otterAnimationType = v15.instant
    });
    v73.isMounted = true;
end;
v16.willUnmount = function(v79) --[[ Line: 455 ]] --[[ Name: willUnmount ]]
    v79.isMounted = false;
    v79.motor:destroy();
end;
v16.didUpdate = function(v80, v81) --[[ Line: 460 ]] --[[ Name: didUpdate ]]
    local l_parentSpecifiedTarget_1 = v80.props.parentSpecifiedTarget;
    local l_entrySizeOnScrollingAxis_3 = v80.props.entrySizeOnScrollingAxis;
    local v84 = true;
    if l_entrySizeOnScrollingAxis_3 == v81.entrySizeOnScrollingAxis then
        v84 = false;
        if l_parentSpecifiedTarget_1 ~= v80.targetIndex then
            v84 = l_parentSpecifiedTarget_1 ~= v81.parentSpecifiedTarget;
        end;
    end;
    if v84 then
        local v85 = nil;
        v85 = l_parentSpecifiedTarget_1 or v80.targetIndex;
        v80.updateTargetIndex({
            newTargetIndex = v85, 
            isSetByUserInput = false
        });
    end;
end;
v16.render = function(v86) --[[ Line: 482 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v8 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), v2 (copy), v3 (copy)
    return l_withStyle_0(function(_) --[[ Line: 483 ]]
        -- upvalues: v86 (copy), v6 (ref), v8 (ref), l_FFlagEnableUniversalFocusNavigation_0 (ref), v2 (ref), v3 (ref)
        local l_layoutOrder_0 = v86.props.layoutOrder;
        local l_size_0 = v86.props.size;
        local l_entries_3 = v86.props.entries;
        local l_entrySizeOnScrollingAxis_4 = v86.props.entrySizeOnScrollingAxis;
        local l_clipsDescendants_0 = v86.props.clipsDescendants;
        local l_scrollDirection_2 = v86.state.scrollDirection;
        local l_getEntryWrapperProps_0 = v86.props.getEntryWrapperProps;
        local v95 = nil;
        local v96 = nil;
        local v97 = nil;
        local v98 = nil;
        local v99 = nil;
        if l_scrollDirection_2 == v6.Horizontal then
            v95 = v8.FitAxis.Width;
            v96 = Enum.FillDirection.Horizontal;
            v97 = UDim2.new(0, l_entrySizeOnScrollingAxis_4, 1, 0);
            v98 = UDim2.new(0, 0, 1, 0);
            v99 = UDim2.new(0.5, -l_entrySizeOnScrollingAxis_4 / 2, 0, 0);
        else
            v95 = v8.FitAxis.Height;
            v96 = Enum.FillDirection.Vertical;
            v97 = UDim2.new(1, 0, 0, l_entrySizeOnScrollingAxis_4);
            v98 = UDim2.new(1, 0, 0, 0);
            v99 = UDim2.new(0, 0, 0.5, -l_entrySizeOnScrollingAxis_4 / 2);
        end;
        local v100 = nil;
        v100 = {};
        for v101, v102 in ipairs(l_entries_3) do
            local v103 = {
                Interactable = if l_FFlagEnableUniversalFocusNavigation_0 then v101 == v86.targetIndex and v86.isEntrySelected else false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_FFlagEnableUniversalFocusNavigation_0 and "" or nil, 
                Selectable = if l_FFlagEnableUniversalFocusNavigation_0 then math.abs(v86.targetIndex - v101) < 2 else false, 
                [v2.Ref] = if l_FFlagEnableUniversalFocusNavigation_0 and v101 == v86.targetIndex then v86.targetEntryRef else nil, 
                [v2.Event.SelectionGained] = l_FFlagEnableUniversalFocusNavigation_0 and function() --[[ Line: 530 ]]
                    -- upvalues: v86 (ref), v101 (copy)
                    v86.onSelectionGained(v101);
                end or nil, 
                [v2.Event.SelectionLost] = if l_FFlagEnableUniversalFocusNavigation_0 then v86.onSelectionLost else nil, 
                [v2.Event.Activated] = if l_FFlagEnableUniversalFocusNavigation_0 then v86.props.onEntryActivated else nil
            };
            if l_getEntryWrapperProps_0 then
                v103 = v3.Dictionary.join(v103, l_getEntryWrapperProps_0(v102));
            end;
            v103 = v3.Dictionary.join(v103, {
                Size = v97, 
                LayoutOrder = v101
            });
            table.insert(v100, v2.createElement(l_FFlagEnableUniversalFocusNavigation_0 and "TextButton" or "Frame", v103, {
                v86.props.renderEntry(v102)
            }));
        end;
        table.insert(v100, v2.createElement("UIListLayout", {
            FillDirection = v96, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }));
        return v2.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = l_clipsDescendants_0, 
            SelectionGroup = l_FFlagEnableUniversalFocusNavigation_0 and true or nil, 
            SelectionBehaviorUp = if l_FFlagEnableUniversalFocusNavigation_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if l_FFlagEnableUniversalFocusNavigation_0 then Enum.SelectionBehavior.Stop else nil, 
            [v2.Event.InputBegan] = v86.onInputBegan, 
            [v2.Event.InputChanged] = v86.onInputChanged, 
            [v2.Event.InputEnded] = v86.onInputEnded, 
            [v2.Event.MouseWheelForward] = v86.onMouseWheelForward, 
            [v2.Event.MouseWheelBackward] = v86.onMouseWheelBackward
        }, {
            CenterPosition = v2.createElement("Frame", {
                Size = v98, 
                Position = v99, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                AnimatedSlidingList = v2.createElement(v8.FitFrame, {
                    Size = v98, 
                    fitAxis = v95, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Ref] = v86.scrollRef, 
                    [v2.Change.AbsolutePosition] = v86.onScrollPositionChanged
                }, v100)
            })
        });
    end);
end;
return v16;