local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.Core.Animation.Enum.SlidingDirection);
local v7 = require(l_Parent_2.Core.Animation.SlidingContainer);
local v8 = require(l_Parent_2.Core.Style.Validator.validateColorInfo);
local v9 = require(l_Parent_2.StateTable.StateTable);
local v10 = require(l_Parent_1.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.Enum.AnimationState);
local v12 = require(l_Parent_0.InformativeToast);
local v13 = require(l_Parent_0.InteractiveToast);
local v14 = require(l_Parent_0.ToastContainer);
local v15 = v4.PureComponent:extend("Toast");
v15.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    duration = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    position = v5.optional(v5.UDim2), 
    show = v5.optional(v5.boolean), 
    size = v5.optional(v5.UDim2), 
    springOptions = v5.optional(v5.table), 
    toastContent = v5.strictInterface({
        buttonText = v5.optional(v5.string), 
        iconColorStyle = v5.optional(v8), 
        iconImage = v5.optional(v5.union(v5.table, v5.string, v5.callback)), 
        iconSize = v5.optional(v5.Vector2), 
        iconChildren = v5.optional(v5.table), 
        onActivated = v5.optional(v5.callback), 
        onAppeared = v5.optional(v5.callback), 
        onDismissed = v5.optional(v5.callback), 
        swipeUpDismiss = v5.optional(v5.boolean), 
        toastSubtitle = v5.optional(v5.string), 
        sequenceNumber = v5.optional(v5.integer), 
        toastTitle = v5.string, 
        buttonType = v5.optional(v10.isEnumValue), 
        onTouchSwipeUp = v5.optional(v5.callback)
    })
});
v15.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0), 
    position = UDim2.new(0.5, 0, 0, 20), 
    show = true
};
local function v18(v16, v17) --[[ Line: 90 ]] --[[ Name: toastContentEqual ]]
    if v16.iconColorStyle ~= v17.iconColorStyle or v16.iconImage ~= v17.iconImage or v16.iconSize ~= v17.iconSize or v16.iconChildren ~= v17.iconChildren or v16.onActivated ~= v17.onActivated or v16.onDismissed ~= v17.onDismissed or v16.sequenceNumber ~= v17.sequenceNumber or v16.swipeUpDismiss ~= v17.swipeUpDismiss or v16.toastSubtitle ~= v17.toastSubtitle or v16.toastTitle ~= v17.toastTitle then
        return false;
    else
        return true;
    end;
end;
v15.init = function(v19) --[[ Line: 108 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v4 (copy), v13 (copy), v12 (copy), v9 (copy)
    v19.isMounted = false;
    v19.currentToastContent = v19.props.toastContent;
    v19.onActivated = function() --[[ Line: 113 ]]
        -- upvalues: v19 (copy)
        v19.stateTable.events.Activated({
            activated = true
        });
    end;
    v19.onAppeared = function() --[[ Line: 119 ]]
        -- upvalues: v19 (copy)
        if v19.currentToastContent.onAppeared then
            v19.currentToastContent.onAppeared();
        end;
        local l_duration_0 = v19.props.duration;
        if l_duration_0 and l_duration_0 > 0 then
            local l_currentToastContent_0 = v19.currentToastContent;
            delay(l_duration_0, function() --[[ Line: 126 ]]
                -- upvalues: l_currentToastContent_0 (copy), v19 (ref)
                if l_currentToastContent_0 == v19.currentToastContent then
                    v19.stateTable.events.AutoDismiss();
                end;
            end);
        end;
    end;
    v19.onComplete = function() --[[ Line: 134 ]]
        -- upvalues: v19 (copy), v11 (ref)
        local l_duration_1 = v19.props.duration;
        if v19.state.currentState == v11.Appearing and l_duration_1 and l_duration_1 <= 0 then
            v19.stateTable.events.AutoDismiss();
            return;
        else
            v19.stateTable.events.AnimationComplete();
            return;
        end;
    end;
    v19.onDisappeared = function() --[[ Line: 144 ]]
        -- upvalues: v19 (copy)
        if v19.state.context.activated then
            if v19.currentToastContent.onActivated then
                v19.currentToastContent.onActivated();
                return;
            end;
        elseif v19.currentToastContent.onDismissed then
            v19.currentToastContent.onDismissed();
        end;
    end;
    v19.onTouchSwipe = function(_, v24) --[[ Line: 156 ]]
        -- upvalues: v19 (copy)
        if v24 == Enum.SwipeDirection.Up then
            v19.stateTable.events.ForceDismiss();
            if v19.currentToastContent.onTouchSwipeUp then
                v19.currentToastContent.onTouchSwipeUp();
            end;
        end;
    end;
    v19.renderInteractiveToast = function(v25) --[[ Line: 165 ]]
        -- upvalues: v4 (ref), v13 (ref)
        return v4.createElement(v13, v25);
    end;
    v19.renderInformativeToast = function(v26) --[[ Line: 169 ]]
        -- upvalues: v4 (ref), v12 (ref)
        return v4.createElement(v12, v26);
    end;
    v19.setContext = function(_, _, v29) --[[ Line: 173 ]]
        return v29;
    end;
    v19.updateToastContent = function() --[[ Line: 177 ]]
        -- upvalues: v19 (copy)
        if v19.currentToastContent ~= v19.props.toastContent then
            v19.currentToastContent = v19.props.toastContent;
            if v19.props.show then
                v19.stateTable.events.ForceAppear({
                    activated = false
                });
            end;
        end;
    end;
    local l_Disappeared_0 = v11.Disappeared;
    v19.state = {
        currentState = l_Disappeared_0, 
        context = {
            activated = false
        }
    };
    local v31 = string.format("Animated(%s)", (tostring(v19)));
    v19.stateTable = v9.new(v31, l_Disappeared_0, {}, {
        [v11.Appearing] = {
            AnimationComplete = {
                nextState = v11.Appeared, 
                action = v19.onAppeared
            }, 
            AutoDismiss = {
                nextState = v11.Disappearing, 
                action = v19.onAppeared
            }, 
            ContentChanged = {
                nextState = v11.Disappearing
            }, 
            ForceDismiss = {
                nextState = v11.Disappearing
            }
        }, 
        [v11.Appeared] = {
            Activated = {
                nextState = v11.Disappearing, 
                action = v19.setContext
            }, 
            AutoDismiss = {
                nextState = v11.Disappearing
            }, 
            ContentChanged = {
                nextState = v11.Disappearing
            }, 
            ForceDismiss = {
                nextState = v11.Disappearing
            }
        }, 
        [v11.Disappearing] = {
            AnimationComplete = {
                nextState = v11.Disappeared, 
                action = v19.onDisappeared
            }
        }, 
        [v11.Disappeared] = {
            ContentChanged = {
                nextState = v11.Appearing, 
                action = v19.updateToastContent
            }, 
            ForceAppear = {
                nextState = v11.Appearing, 
                action = v19.setContext
            }
        }
    });
    v19.stateTable:onStateChange(function(v32, v33, v34) --[[ Line: 220 ]]
        -- upvalues: v19 (copy)
        if v19.isMounted and v32 ~= v33 then
            v19:setState({
                currentState = v33, 
                context = v34
            });
        end;
    end);
end;
v15.isShowing = function(v35) --[[ Line: 230 ]] --[[ Name: isShowing ]]
    -- upvalues: v11 (copy)
    local v36 = true;
    if v35.state.currentState ~= v11.Appearing then
        v36 = v35.state.currentState == v11.Appeared;
    end;
    return v36;
end;
v15.render = function(v37) --[[ Line: 234 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy), v14 (copy)
    local l_onActivated_0 = v37.currentToastContent.onActivated;
    local l_swipeUpDismiss_0 = v37.currentToastContent.swipeUpDismiss;
    if l_swipeUpDismiss_0 == nil then
        l_swipeUpDismiss_0 = true;
    end;
    return v4.createElement(v7, {
        show = v37:isShowing(), 
        layoutOrder = v37.props.layoutOrder, 
        onComplete = v37.onComplete, 
        slidingDirection = v6.Down, 
        springOptions = v37.props.springOptions
    }, {
        ToastContainer = v4.createElement(v14, {
            anchorPoint = v37.props.anchorPoint, 
            buttonText = v37.currentToastContent.buttonText, 
            position = v37.props.position, 
            size = v37.props.size, 
            iconColorStyle = v37.currentToastContent.iconColorStyle, 
            iconImage = v37.currentToastContent.iconImage, 
            iconSize = v37.currentToastContent.iconSize, 
            iconChildren = v37.currentToastContent.iconChildren, 
            onActivated = l_onActivated_0 and v37.onActivated, 
            onTouchSwipe = l_swipeUpDismiss_0 and v37.onTouchSwipe, 
            renderToast = l_onActivated_0 and v37.renderInteractiveToast or v37.renderInformativeToast, 
            toastSubtitle = v37.currentToastContent.toastSubtitle, 
            toastTitle = v37.currentToastContent.toastTitle, 
            buttonType = v37.currentToastContent.buttonType
        })
    });
end;
v15.didMount = function(v40) --[[ Line: 267 ]] --[[ Name: didMount ]]
    v40.isMounted = true;
    if v40.props.show then
        v40.stateTable.events.ForceAppear({
            activated = false
        });
    end;
end;
v15.willUnmount = function(v41) --[[ Line: 276 ]] --[[ Name: willUnmount ]]
    v41.isMounted = false;
end;
v15.didUpdate = function(v42, v43, v44) --[[ Line: 280 ]] --[[ Name: didUpdate ]]
    -- upvalues: v18 (copy), v11 (copy)
    if v43.show ~= v42.props.show then
        if v42.props.show then
            v42.stateTable.events.ForceAppear({
                activated = false
            });
        else
            v42.stateTable.events.ForceDismiss();
        end;
    end;
    if not v18(v43.toastContent, v42.props.toastContent) then
        v42.stateTable.events.ContentChanged({
            activated = false
        });
    end;
    if v44.currentState ~= v42.state.currentState and v42.state.currentState == v11.Disappeared then
        v42.updateToastContent();
    end;
end;
return v15;