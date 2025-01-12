local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Roact);
local v8 = require(l_Parent_2.t);
local l_Focusable_0 = require(l_Parent_2.RoactGamepad).Focusable;
local v10 = require(l_Parent_2.UIBlox.Core.Style.withStyle);
local v11 = require(l_Parent_0.SelectionImage.CursorKind);
local v12 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v13 = require(l_Parent_0.SelectionCursor.withCursor);
local v14 = require(l_Parent_0.SelectionCursor.CursorType);
local v15 = require(l_Parent_1.UIBloxConfig);
local v16 = require(l_Parent_1.App.Container.getPageMargin);
local v17 = UDim.new(0, 0);
local v18 = {
    frequency = 3, 
    dampingRatio = 1.5
};
local v19 = v7.Component:extend("VerticalScrollView");
v19.validateProps = v8.strictInterface({
    size = v8.optional(v8.UDim2), 
    position = v8.optional(v8.UDim2), 
    elasticBehavior = v8.optional(v8.EnumItem), 
    canvasSizeY = v8.optional(v8.UDim), 
    useAutomaticCanvasSize = v8.optional(v8.boolean), 
    paddingHorizontal = v8.optional(v8.number), 
    isGamepadFocusable = v8.optional(v8.boolean), 
    Selectable = v8.optional(v8.boolean), 
    [v7.Change.CanvasPosition] = v8.optional(v8.callback), 
    [v7.Change.CanvasSize] = v8.optional(v8.callback), 
    scrollingFrameRef = v8.optional(v8.table), 
    onSelectionChanged = v8.optional(v8.callback), 
    CanvasPosition = v8.optional(v8.union(v8.table, v8.Vector2)), 
    ScrollingEnabled = v8.optional(v8.boolean), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    [v7.Children] = v8.optional(v8.table)
});
v19.defaultProps = {
    size = UDim2.new(1, 0, 1, 0), 
    canvasSizeY = UDim.new(2, 0), 
    useAutomaticCanvasSize = false, 
    isGamepadFocusable = false, 
    Selectable = true
};
v19.init = function(v20) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v6 (copy), v18 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v16 (copy)
    v20:setState({
        scrollBarThickness = 0, 
        scrollingWithTouch = false
    });
    local v21, v22 = v7.createBinding(0);
    v20.scrollBarImageTransparency = v21;
    v20.updateScrollBarImageTransparency = v22;
    v20.scrollBarImageTransparencyMotor = v6.createSingleMotor(0);
    v20.scrollBarImageTransparencyMotor:onStep(v20.updateScrollBarImageTransparency);
    v20.lastTimeCanvasPositionChanged = tick();
    v20.waitToHideSidebarConnection = nil;
    v20.waitToHideSidebar = function() --[[ Line: 103 ]]
        -- upvalues: v20 (copy), v6 (ref), v18 (ref)
        if tick() - v20.lastTimeCanvasPositionChanged > 0.7 then
            v20.scrollBarImageTransparencyMotor:setGoal(v6.spring(1, v18));
            v20.disconnectWaitToHideSidebar();
        end;
    end;
    v20.disconnectWaitToHideSidebar = function() --[[ Line: 111 ]]
        -- upvalues: v20 (copy)
        if v20.waitToHideSidebarConnection then
            v20.waitToHideSidebarConnection:Disconnect();
            v20.waitToHideSidebarConnection = nil;
        end;
    end;
    v20.inputBegan = function(_, v24) --[[ Line: 117 ]]
        -- upvalues: v20 (copy), v6 (ref)
        if v24.UserInputType == Enum.UserInputType.MouseMovement then
            v20.disconnectWaitToHideSidebar();
            v20:setState({
                scrollBarThickness = 8
            });
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        end;
    end;
    v20.inputEnded = function(_, v26) --[[ Line: 126 ]]
        -- upvalues: v20 (copy), v6 (ref)
        if v26.UserInputType == Enum.UserInputType.MouseMovement then
            v20.disconnectWaitToHideSidebar();
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
        end;
    end;
    v20.canvasPosition = function(v27) --[[ Line: 132 ]]
        -- upvalues: v20 (copy), l_UserInputService_0 (ref), v6 (ref), l_RunService_0 (ref), v7 (ref)
        v20.lastTimeCanvasPositionChanged = tick();
        if not v20.waitToHideSidebarConnection and l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
            v20:setState({
                scrollBarThickness = 2
            });
            v20.waitToHideSidebarConnection = l_RunService_0.Heartbeat:Connect(v20.waitToHideSidebar);
        end;
        if v20.props[v7.Change.CanvasPosition] then
            v20.props[v7.Change.CanvasPosition](v27);
        end;
    end;
    v20.onGamepadFocused = function() --[[ Line: 147 ]]
        -- upvalues: v20 (copy), v6 (ref)
        v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        v20:setState({
            scrollBarThickness = 2
        });
    end;
    v20.onGamepadFocusLost = function() --[[ Line: 154 ]]
        -- upvalues: v20 (copy), v6 (ref)
        v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
    end;
    v20.parentFrameRef = v7.createRef();
    v21, v22 = v7.createBinding(0);
    v20.paddingBinding = v21;
    v20.updatePaddingBinding = v22;
    v20.getPadding = function(v28) --[[ Line: 161 ]]
        -- upvalues: v20 (copy), v16 (ref)
        v28 = v28 or 0;
        if v20.props.paddingHorizontal then
            local v29 = math.max(0, v20.props.paddingHorizontal - v28);
            return UDim.new(0, v29);
        else
            return v20.paddingBinding:map(function(v30) --[[ Line: 167 ]]
                -- upvalues: v16 (ref), v28 (ref)
                return UDim.new(0, v16(v30) - v28);
            end);
        end;
    end;
end;
v19.renderWithProviders = function(v31, v32, v33, v34) --[[ Line: 174 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v7 (copy), v5 (copy), l_Focusable_0 (copy), v17 (copy), v15 (copy), v11 (copy)
    local l_Theme_0 = v32.Theme;
    local l_canvasSizeY_0 = v31.props.canvasSizeY;
    local v37 = v31.props[v7.Children] or {};
    local l_position_0 = v31.props.position;
    local l_size_0 = v31.props.size;
    local l_isGamepadFocusable_0 = v31.props.isGamepadFocusable;
    local l_scrollBarThickness_0 = v31.state.scrollBarThickness;
    local v42 = v5.Dictionary.join({
        scrollingFrameInnerMargin = v7.createElement("UIPadding", {
            PaddingLeft = v31.getPadding(), 
            PaddingRight = v31.getPadding(4)
        })
    }, v37);
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_position_0, 
        Size = l_size_0, 
        [v7.Change.AbsoluteSize] = function(v43) --[[ Line: 197 ]]
            -- upvalues: v31 (copy)
            v31.updatePaddingBinding(v43.AbsoluteSize.X);
        end, 
        [v7.Ref] = v31.parentFrameRef
    }, {
        scrollingFrameOuterMargins = v7.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 4)
        }), 
        scrollingFrame = v7.createElement(l_isGamepadFocusable_0 and l_Focusable_0.ScrollingFrame or "ScrollingFrame", {
            Active = true, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ElasticBehavior = v31.props.elasticBehavior, 
            CanvasSize = UDim2.new(v17, l_canvasSizeY_0), 
            AutomaticCanvasSize = v31.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v31.scrollBarImageTransparency, 
            ScrollBarThickness = l_scrollBarThickness_0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = v31.props.ScrollingEnabled, 
            CanvasPosition = v31.props.CanvasPosition, 
            SelectionImageObject = if v15.migrateToNewSelectionCursor then v34 else v33(v11.RoundedRect), 
            onFocusGained = l_isGamepadFocusable_0 and v31.onGamepadFocused or nil, 
            onFocusLost = l_isGamepadFocusable_0 and v31.onGamepadFocusLost or nil, 
            Selectable = v31.props.Selectable, 
            NextSelectionLeft = v31.props.NextSelectionLeft, 
            NextSelectionRight = v31.props.NextSelectionRight, 
            NextSelectionUp = v31.props.NextSelectionUp, 
            NextSelectionDown = v31.props.NextSelectionDown, 
            [v7.Event.InputBegan] = v31.inputBegan, 
            [v7.Event.InputEnded] = v31.inputEnded, 
            [v7.Change.CanvasPosition] = v31.canvasPosition, 
            [v7.Change.CanvasSize] = v31.props[v7.Change.CanvasSize], 
            [v7.Event.SelectionChanged] = v31.props.onSelectionChanged, 
            [v7.Ref] = v31.props.scrollingFrameRef
        }, v42)
    });
end;
v19.render = function(v44) --[[ Line: 250 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v15 (copy), v13 (copy), v14 (copy), v12 (copy)
    return v10(function(v45) --[[ Line: 251 ]]
        -- upvalues: v15 (ref), v13 (ref), v14 (ref), v44 (copy), v12 (ref)
        if v15.migrateToNewSelectionCursor then
            return (v13(function(v46) --[[ Line: 253 ]]
                -- upvalues: v14 (ref), v44 (ref), v45 (copy)
                local v47 = v46.getCursorByType(v14.RoundedRect);
                return v44:renderWithProviders(v45, nil, v47);
            end));
        else
            return (v12(function(v48) --[[ Line: 258 ]]
                -- upvalues: v44 (ref), v45 (copy)
                return v44:renderWithProviders(v45, v48);
            end));
        end;
    end);
end;
v19.didMount = function(v49) --[[ Line: 265 ]] --[[ Name: didMount ]]
    local v50 = v49.parentFrameRef:getValue();
    if v50 then
        v49.updatePaddingBinding(v50.AbsoluteSize.X);
    end;
end;
v19.willUnmount = function(v51) --[[ Line: 272 ]] --[[ Name: willUnmount ]]
    v51.disconnectWaitToHideSidebar();
end;
return v7.forwardRef(function(v52, v53) --[[ Line: 276 ]]
    -- upvalues: v7 (copy), v19 (copy), v5 (copy)
    return v7.createElement(v19, v5.Dictionary.join(v52, {
        scrollingFrameRef = v53
    }));
end);