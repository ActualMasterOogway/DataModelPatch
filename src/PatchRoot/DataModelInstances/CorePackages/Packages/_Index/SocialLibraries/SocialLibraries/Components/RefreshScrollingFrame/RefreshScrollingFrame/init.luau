local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_Otter_0 = v3.Otter;
local l_t_0 = v3.t;
local l_Cryo_0 = v3.Cryo;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v11 = require(script.Parent.ExternalEventConnection);
local v12 = require(script.Parent.Spinner);
local v13 = l_getIconSize_0(l_UIBlox_0.App.ImageSet.Enum.IconSize.Medium);
local v14 = {
    Start = -240, 
    End = 0
};
local v15 = {
    Start = 1, 
    End = 0
};
local v16 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function _(v17, v18, v19) --[[ Line: 37 ]] --[[ Name: lerp ]]
    v19 = math.min(1, (math.max(0, v19)));
    return v17 * (1 - v19) + v18 * v19;
end;
local v21 = l_Roact_0.PureComponent:extend("RefreshScrollingFrameNew");
v21.defaultProps = {
    ScrollingElement = "ScrollingFrame", 
    refreshThreshold = 52, 
    scrollingElementProps = {}
};
v21.validateProps = l_t_0.interface({
    ScrollingElement = l_t_0.union(l_t_0.string, l_t_0.callback, l_t_0.table), 
    scrollingElementProps = l_t_0.optional(l_t_0.table), 
    refreshThreshold = l_t_0.number, 
    forwardRef = l_t_0.optional(l_t_0.table), 
    onCanvasPositionChangedCallback = l_t_0.optional(l_t_0.callback), 
    onStatusBarTapped = l_t_0.optional(l_t_0.callback), 
    refresh = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.any)
});
v21.init = function(v22) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v21 (copy), l_Roact_0 (copy), v15 (copy), v14 (copy), l_Otter_0 (copy), v16 (copy), l_UserGameSettings_0 (copy)
    v22.state = {
        isRefreshing = false
    };
    v22.startHeight = 0;
    v22.isUserInteracting = false;
    local l_forwardRef_0 = v22.props.forwardRef;
    assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v21))));
    v22.scrollingFrameRef = l_forwardRef_0 or l_Roact_0.createRef();
    v22.spinnerFrameRef = l_Roact_0.createRef();
    v22.spinnerRef = l_Roact_0.createRef();
    v22.updateSpinner = function(v24) --[[ Line: 87 ]]
        -- upvalues: v22 (copy), v15 (ref), v14 (ref)
        if v22.spinnerFrameRef.current then
            v22.spinnerFrameRef.current.Size = UDim2.new(1, 0, 0, v24);
            local v25 = v24 / v22.props.refreshThreshold;
            local l_current_0 = v22.spinnerRef.current;
            local l_Start_0 = v15.Start;
            local l_End_0 = v15.End;
            local v29 = math.min(1, (math.max(0, v25)));
            l_current_0.ImageTransparency = l_Start_0 * (1 - v29) + l_End_0 * v29;
            if not v22.state.isRefreshing then
                local l_current_1 = v22.spinnerRef.current;
                l_End_0 = v14.Start;
                v29 = v14.End;
                local v31 = math.min(1, (math.max(0, v25)));
                l_current_1.Rotation = l_End_0 * (1 - v31) + v29 * v31;
            end;
        end;
    end;
    v22.motor = l_Otter_0.createSingleMotor(0);
    v22.motor:onStep(v22.updateSpinner);
    v22.resetSpinner = function() --[[ Line: 110 ]]
        -- upvalues: v22 (copy), l_Otter_0 (ref), v16 (ref)
        v22.motor:setGoal(l_Otter_0.spring(0, v16));
    end;
    v22.scrollBack = function() --[[ Line: 114 ]]
        -- upvalues: v22 (copy), l_UserGameSettings_0 (ref)
        if v22.scrollingFrameRef.current then
            if l_UserGameSettings_0.ReducedMotion then
                v22.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return;
            else
                v22.scrollingFrameRef.current:ScrollToTop();
            end;
        end;
    end;
    v22.dispatchRefresh = function() --[[ Line: 124 ]]
        -- upvalues: v22 (copy), l_Otter_0 (ref), v16 (ref)
        local l_refresh_0 = v22.props.refresh;
        local l_refreshThreshold_0 = v22.props.refreshThreshold;
        local l_isRefreshing_0 = v22.state.isRefreshing;
        if l_refresh_0 == nil then
            return;
        else
            if not l_isRefreshing_0 then
                v22:setState({
                    isRefreshing = true
                });
                v22.motor:setGoal(l_Otter_0.spring(l_refreshThreshold_0, v16));
                local function v35() --[[ Line: 140 ]] --[[ Name: onRefreshComplete ]]
                    -- upvalues: v22 (ref)
                    if v22.isMounted then
                        v22:setState({
                            isRefreshing = false
                        });
                        v22.resetSpinner();
                    end;
                end;
                l_refresh_0():andThen(v35, v35);
            end;
            return;
        end;
    end;
    v22.onInputBegan = function(_) --[[ Line: 153 ]]
        -- upvalues: v22 (copy)
        if not v22.isUserInteracting then
            v22.startHeight = v22.scrollingFrameRef.current.CanvasPosition.Y;
        end;
        v22.isUserInteracting = true;
    end;
    v22.onInputEnded = function(_) --[[ Line: 162 ]]
        -- upvalues: v22 (copy)
        v22.isUserInteracting = false;
        local l_startHeight_0 = v22.startHeight;
        v22.startHeight = 0;
        if v22.props.refresh ~= nil and v22.scrollingFrameRef.current then
            local v39 = -v22.scrollingFrameRef.current.CanvasPosition.Y;
            if v22.props.refreshThreshold < v39 and l_startHeight_0 < v39 then
                v22.dispatchRefresh();
                return;
            elseif v39 > 0 then
                v22.resetSpinner();
            end;
        end;
    end;
    v22.statusBarTapCallback = function() --[[ Line: 182 ]]
        -- upvalues: v22 (copy)
        if v22.props.onStatusBarTapped then
            v22.props.onStatusBarTapped();
        end;
        v22.scrollBack();
    end;
    v22.onCanvasPositionChanged = function(v40) --[[ Line: 189 ]]
        -- upvalues: v22 (copy), l_Otter_0 (ref)
        if v22.props.onCanvasPositionChangedCallback ~= nil then
            v22.props.onCanvasPositionChangedCallback(v40);
        end;
        if v22.props.refresh ~= nil and v22.isUserInteracting and not v22.state.isRefreshing then
            local v41 = -v40.CanvasPosition.Y;
            local l_refreshThreshold_1 = v22.props.refreshThreshold;
            if v41 >= 0 and v41 <= l_refreshThreshold_1 then
                v22.motor:setGoal(l_Otter_0.instant(v41));
            end;
        end;
    end;
    v22.onCanvasSizeChanged = function(v43) --[[ Line: 204 ]]
        -- upvalues: v22 (copy)
        if v22.props.onCanvasSizeChangedCallback ~= nil then
            v22.props.onCanvasSizeChangedCallback(v43);
        end;
    end;
end;
v21.didMount = function(v44) --[[ Line: 211 ]] --[[ Name: didMount ]]
    v44.isMounted = true;
    v44.resetSpinner();
end;
v21.willUnmount = function(v45) --[[ Line: 216 ]] --[[ Name: willUnmount ]]
    v45.isMounted = false;
    v45.motor:destroy();
    v45.motor = nil;
end;
v21.render = function(v46) --[[ Line: 223 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_withStyle_0 (copy), l_Cryo_0 (copy), v12 (copy), v13 (copy), v11 (copy), l_UserInputService_0 (copy)
    local v47 = v46.props[l_Roact_0.Children];
    local l_isRefreshing_1 = v46.state.isRefreshing;
    return l_withStyle_0(function(_) --[[ Line: 227 ]]
        -- upvalues: l_Roact_0 (ref), v46 (copy), l_Cryo_0 (ref), v12 (ref), v13 (ref), l_isRefreshing_1 (copy), v47 (copy), v11 (ref), l_UserInputService_0 (ref)
        return l_Roact_0.createElement(v46.props.ScrollingElement, l_Cryo_0.Dictionary.join({
            [l_Roact_0.Change.CanvasPosition] = v46.onCanvasPositionChanged, 
            [l_Roact_0.Change.CanvasSize] = v46.onCanvasSizeChanged, 
            [l_Roact_0.Ref] = v46.scrollingFrameRef
        }, v46.props.scrollingElementProps), {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SpinnerFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [l_Roact_0.Ref] = v46.spinnerFrameRef
            }, {
                Spinner = l_Roact_0.createElement(v12, {
                    Size = UDim2.new(0, v13, 0, v13), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    isSpinning = l_isRefreshing_1, 
                    [l_Roact_0.Ref] = v46.spinnerRef
                })
            }), 
            Content = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0)
            }, v47), 
            inputBegan = l_Roact_0.createElement(v11, {
                event = l_UserInputService_0.InputBegan, 
                callback = v46.onInputBegan
            }), 
            inputEnded = l_Roact_0.createElement(v11, {
                event = l_UserInputService_0.InputEnded, 
                callback = v46.onInputEnded
            }), 
            statusBarTapped = l_Roact_0.createElement(v11, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v46.statusBarTapCallback
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v50, v51) --[[ Line: 280 ]]
    -- upvalues: l_Roact_0 (copy), v21 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v21, l_Cryo_0.Dictionary.join(v50, {
        forwardRef = v51
    }));
end);