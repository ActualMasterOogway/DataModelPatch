local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_1.Otter);
local v8 = require(l_Parent_0.App.ImageSet.Images);
local v9 = require(l_Parent_1.RoactGamepad);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(script.Parent.SegmentedControlTabName);
local v12 = require(l_Core_0.ImageSet.ImageSetComponent);
local v13 = require(l_Core_0.Button.getContentStyle);
local v14 = require(l_Parent_0.App.ImageSet.getIconSize);
local v15 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v16 = require(l_Parent_0.Core.Text.GetTextSize);
local v17 = require(l_Parent_0.UIBloxConfig);
local v18 = v14(v15.Medium);
local v19 = {
    frequency = 10, 
    dampingRatio = 1
};
local v20 = v8["component_assets/circle_17"];
local v21 = v8["component_assets/dropshadow_16_20"];
local v22 = {
    [v10.Default] = "BackgroundUIDefault"
};
local v23 = {
    [v10.Default] = "Divider"
};
local v24 = {
    [v10.Default] = v17.useFoundationColors and "UIEmphasis" or "UIDefault"
};
local v25 = {
    [v10.Default] = "DropShadow"
};
local v26 = {
    [v10.Default] = "SecondaryDefault", 
    [v10.Hover] = "SecondaryOnHover"
};
local function v34(v27) --[[ Line: 54 ]]
    -- upvalues: v4 (copy)
    local v28, v29 = v4.array(v4.strictInterface({
        tabName = v4.string, 
        isDisabled = v4.optional(v4.boolean), 
        icon = v4.optional(v4.table)
    }))(v27);
    if not v28 then
        return v28, v29;
    else
        local v30, v31 = v4.numberMin(2)(#v27);
        if not v30 then
            return v30, v31;
        else
            local v32, v33 = v4.numberMax(4)(#v27);
            if not v32 then
                return v32, v33;
            else
                return true;
            end;
        end;
    end;
end;
local v35 = v3.Component:extend("SegmentedControl");
v35.validateProps = v4.strictInterface({
    tabs = v34, 
    width = v4.UDim, 
    height = v4.optional(v4.number), 
    maxWidth = v4.optional(v4.number), 
    selectedTabIndex = v4.number, 
    onTabActivated = v4.callback, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.number)
});
v35.defaultProps = {
    height = 44
};
v35.init = function(v36) --[[ Line: 117 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v19 (copy)
    v36.rootRef = v3.createRef();
    v36.tabRefs = v9.createRefCache();
    local v37, v38 = v3.createBinding(0);
    v36.selectedBackgroundPositionX = v37;
    v36.setSelectedBackgroundPositionX = v38;
    v36.selectedBackgroundMotor = v7.createSingleMotor(4);
    v36.selectedBackgroundMotor:onStep(function(v39) --[[ Line: 123 ]]
        -- upvalues: v36 (copy)
        v36.setSelectedBackgroundPositionX(v39);
    end);
    v36:setState({
        tabWidth = 0, 
        computedMinFrameWidth = 0
    });
    v36.onTabActivated = function(v40) --[[ Line: 132 ]]
        -- upvalues: v36 (copy)
        v36.props.onTabActivated(v40);
    end;
    v36.setSize = function(v41) --[[ Line: 136 ]]
        -- upvalues: v36 (copy), v7 (ref), v19 (ref)
        local v42 = math.floor((math.max(v41.AbsoluteSize.X, v36.state.computedMinFrameWidth) - 8) / #v36.props.tabs);
        v36.selectedBackgroundMotor:setGoal(v7.spring(4 + v42 * (v36.props.selectedTabIndex - 1), v19));
        v36:setState({
            tabWidth = v42
        });
    end;
end;
v35.render = function(v43) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v10 (copy), v13 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v18 (copy), v16 (copy), v3 (copy), v9 (copy), v5 (copy), v11 (copy), v26 (copy), v12 (copy), v20 (copy), v17 (copy), v21 (copy)
    return v6(function(v44) --[[ Line: 150 ]]
        -- upvalues: v43 (copy), v10 (ref), v13 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v18 (ref), v16 (ref), v3 (ref), v9 (ref), v5 (ref), v11 (ref), v26 (ref), v12 (ref), v20 (ref), v17 (ref), v21 (ref)
        local l_controlState_0 = v43.state.controlState;
        local v46 = #v43.props.tabs;
        local l_isDisabled_0 = v43.props.tabs[v43.props.selectedTabIndex].isDisabled;
        local v48 = l_isDisabled_0 and v10.Disabled or l_controlState_0;
        local v49 = v13(v22, l_controlState_0, v44);
        local v50 = v13(v23, l_controlState_0, v44);
        local v51 = v13(v24, v48, v44);
        local v52 = v13(v25, l_controlState_0, v44);
        local l_tabWidth_0 = v43.state.tabWidth;
        local v54 = if v43.props.icon then v18 else 0;
        local l_height_0 = v43.props.height;
        local v56 = v43.props.height - 12;
        local v57 = v43.props.height - 16;
        local v58 = v44.Font.Header2.RelativeSize * v44.Font.BaseSize;
        if v43.state.computedMinFrameWidth == 0 then
            local v59 = 0;
            for v60 = 1, v46 do
                local l_tabName_0 = v43.props.tabs[v60].tabName;
                v59 = math.max(v59, v16(l_tabName_0, v58, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).X);
            end;
            local v62 = v59 + 8;
            local v63 = (v54 + 80) * v46 + 8;
            local v64 = (v54 + v62) * v46 + 8;
            v43:setState({
                computedMinFrameWidth = if v43.props.maxWidth then math.min(v64, v43.props.maxWidth) else math.max(v64, v63)
            });
        end;
        local v65 = {};
        for v66 = 1, v46 - 1 do
            if v66 ~= v43.props.selectedTabIndex and v66 ~= v43.props.selectedTabIndex - 1 then
                table.insert(v65, v66, v3.createElement("Frame", {
                    Size = UDim2.fromOffset(1, v57), 
                    BackgroundTransparency = v50.Transparency, 
                    BackgroundColor3 = v50.Color, 
                    Position = UDim2.fromOffset(4 + l_tabWidth_0 * v66, (l_height_0 - v57) / 2)
                }));
            end;
        end;
        return v9.withFocusController(function(v67) --[[ Line: 210 ]]
            -- upvalues: v43 (ref), v46 (copy), v5 (ref), v3 (ref), v9 (ref), l_tabWidth_0 (copy), l_height_0 (copy), v11 (ref), v26 (ref), v12 (ref), v56 (copy), v20 (ref), v49 (copy), v65 (copy), v57 (copy), v51 (copy), v17 (ref), l_isDisabled_0 (copy), v21 (ref), v52 (copy)
            local function _(v68) --[[ Line: 211 ]]
                -- upvalues: v67 (copy), v43 (ref)
                if v68 > 1 then
                    v67.moveFocusTo(v43.tabRefs[v68 - 1]);
                end;
            end;
            local function _(v70) --[[ Line: 216 ]]
                -- upvalues: v46 (ref), v67 (copy), v43 (ref)
                if v70 < v46 then
                    v67.moveFocusTo(v43.tabRefs[v70 + 1]);
                end;
            end;
            local function v72() --[[ Line: 221 ]]
                -- upvalues: v67 (copy), v43 (ref)
                v67.moveFocusTo(v43.rootRef);
            end;
            local v81 = v5.List.map(v43.props.tabs, function(v73, v74) --[[ Line: 226 ]]
                -- upvalues: v3 (ref), v9 (ref), l_tabWidth_0 (ref), l_height_0 (ref), v43 (ref), v46 (ref), v72 (copy), v67 (copy), v11 (ref), v26 (ref)
                return v3.createElement(v9.Focusable.Frame, {
                    key = v73.tabName, 
                    LayoutOrder = v74, 
                    Size = UDim2.fromOffset(l_tabWidth_0, l_height_0), 
                    BackgroundTransparency = 1, 
                    [v3.Ref] = v43.tabRefs[v74], 
                    NextSelectionLeft = v74 > 1 and v43.tabRefs[v74 - 1] or nil, 
                    NextSelectionRight = v74 < v46 and v43.tabRefs[v74 + 1] or nil, 
                    inputBindings = {
                        LeaveA = v9.Input.onBegin(Enum.KeyCode.ButtonA, v72), 
                        LeaveB = v9.Input.onBegin(Enum.KeyCode.ButtonB, v72), 
                        SelectNext1 = v9.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 238 ]]
                            -- upvalues: v74 (copy), v46 (ref), v67 (ref), v43 (ref)
                            local l_v74_0 = v74;
                            if l_v74_0 < v46 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_0 + 1]);
                            end;
                        end), 
                        SelectPre1 = v9.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 241 ]]
                            -- upvalues: v74 (copy), v67 (ref), v43 (ref)
                            local l_v74_1 = v74;
                            if l_v74_1 > 1 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_1 - 1]);
                            end;
                        end), 
                        SelectNext2 = v9.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 244 ]]
                            -- upvalues: v74 (copy), v46 (ref), v67 (ref), v43 (ref)
                            local l_v74_2 = v74;
                            if l_v74_2 < v46 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_2 + 1]);
                            end;
                        end), 
                        SelectPre2 = v9.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 247 ]]
                            -- upvalues: v74 (copy), v67 (ref), v43 (ref)
                            local l_v74_3 = v74;
                            if l_v74_3 > 1 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_3 - 1]);
                            end;
                        end), 
                        SelectNext3 = v9.Input.onBegin(Enum.KeyCode.ButtonR3, function() --[[ Line: 250 ]]
                            -- upvalues: v74 (copy), v46 (ref), v67 (ref), v43 (ref)
                            local l_v74_4 = v74;
                            if l_v74_4 < v46 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_4 + 1]);
                            end;
                        end), 
                        SelectPre3 = v9.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 253 ]]
                            -- upvalues: v74 (copy), v67 (ref), v43 (ref)
                            local l_v74_5 = v74;
                            if l_v74_5 > 1 then
                                v67.moveFocusTo(v43.tabRefs[l_v74_5 - 1]);
                            end;
                        end)
                    }
                }, {
                    Tab = v3.createElement(v11, {
                        text = v73.tabName, 
                        onActivated = function() --[[ Line: 260 ]] --[[ Name: onActivated ]]
                            -- upvalues: v43 (ref), v74 (copy)
                            v43.onTabActivated(v74);
                        end, 
                        Size = UDim2.fromScale(1, 1), 
                        isDisabled = v73.isDisabled, 
                        isSelectedStyle = v43.props.selectedTabIndex == v74, 
                        icon = v73.icon, 
                        iconStateColorMap = v26
                    })
                });
            end);
            return v3.createElement("Frame", {
                Size = UDim2.new(v43.props.width.Scale, v43.props.width.Offset, 0, l_height_0), 
                BackgroundTransparency = 1, 
                [v3.Change.AbsoluteSize] = v43.setSize, 
                LayoutOrder = v43.props.layoutOrder
            }, {
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(v43.state.computedMinFrameWidth, l_height_0), 
                    MaxSize = Vector2.new(640, l_height_0)
                }), 
                Background = v3.createElement(v12.Label, {
                    Size = UDim2.new(1, 0, 0, v56), 
                    Position = UDim2.fromOffset(0, (l_height_0 - v56) / 2), 
                    BackgroundTransparency = 1, 
                    Image = v20, 
                    ImageColor3 = v49.Color, 
                    ImageTransparency = v49.Transparency, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 1
                }), 
                Dividers = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.new(1, 0, 0, l_height_0), 
                    Position = UDim2.fromOffset(0, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    NextSelectionLeft = v43.props.NextSelectionLeft, 
                    NextSelectionRight = v43.props.NextSelectionRight, 
                    NextSelectionUp = v43.props.NextSelectionUp, 
                    NextSelectionDown = v43.props.NextSelectionDown, 
                    [v3.Ref] = v43.rootRef, 
                    inputBindings = {
                        Enter = v9.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 307 ]]
                            -- upvalues: v67 (copy), v43 (ref)
                            v67.moveFocusTo(v43.tabRefs[v43.props.selectedTabIndex]);
                        end)
                    }
                }, v65), 
                SelectedBackground = v3.createElement(v12.Label, {
                    Size = UDim2.fromOffset(l_tabWidth_0, v57), 
                    Position = v43.selectedBackgroundPositionX:map(function(v82) --[[ Line: 315 ]]
                        -- upvalues: l_height_0 (ref), v57 (ref)
                        return UDim2.fromOffset(v82, (l_height_0 - v57) / 2);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = v20, 
                    ImageColor3 = v51.Color, 
                    ImageTransparency = v51.Transparency, 
                    LayoutOrder = 2, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 4
                }), 
                SelectedBackgroundShadow = if v17.useFoundationColors then nil else not l_isDisabled_0 and v3.createElement(v12.Label, {
                    Size = UDim2.fromOffset(l_tabWidth_0 + 12, v57 + 12), 
                    Position = v43.selectedBackgroundPositionX:map(function(v83) --[[ Line: 332 ]]
                        -- upvalues: l_height_0 (ref), v57 (ref)
                        return UDim2.fromOffset(v83 - 6, (l_height_0 - v57) / 2 - 6 + 2);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = v21, 
                    ImageColor3 = v52.Color, 
                    ImageTransparency = 0.3, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(27, 27, 29, 29), 
                    ZIndex = 3
                }), 
                TabContainer = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromScale(0, 0), 
                    ZIndex = 5, 
                    defaultChild = v43.tabRefs[v43.props.selectedTabIndex]
                }, {
                    TabLayout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }); 
                    v3.createFragment(v81)
                })
            });
        end);
    end);
end;
v35.didUpdate = function(v84, v85) --[[ Line: 364 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v19 (copy)
    if v85.selectedTabIndex ~= v84.props.selectedTabIndex then
        v84.selectedBackgroundMotor:setGoal(v7.spring(4 + v84.state.tabWidth * (v84.props.selectedTabIndex - 1), v19));
    end;
end;
return v35;