local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RunService_0 = game:GetService("RunService");
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_Parent_0.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local v11 = require(l_Parent_0.RoactRodux);
local v12 = require(script.Parent.PeekViewState);
local v13 = require(script.Parent.Scrim);
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v17 = require(l_Parent_0.ArgCheck);
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_Parent_0.AppCommonLib).Utils.GamepadUtils;
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
local v21 = require(l_Parent_0.RoactAppExperiment);
local v22 = require(script.Parent.analytics.peekViewDismissedEvent);
local v23 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_switchAccountScrimError_0 = require(l_Parent_0.UiShellEvents).switchAccountScrimError;
local v25 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v25.FocusNavigableSurfaceWrapper;
local l_GetFFlagEnablePeekViewStateOnMountParam_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePeekViewStateOnMountParam;
local l_GetFFlagPeekViewScrimEnabledIXP_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimEnabledIXP;
local l_GetFFlagPeekViewScrimEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimEnabled;
local l_GetFFlagHideDraggerFullPeekView_0 = require(l_Parent_0.SharedFlags).GetFFlagHideDraggerFullPeekView;
local l_FFlagEDPContextRedesign_0 = require(l_Parent_0.SharedFlags).FFlagEDPContextRedesign;
local v32 = game:DefineFastFlag("FixPeekViewScrimAssert", false);
local l_FFlagEDPContextReduceIXPVariableUsage_0 = require(l_Parent_0.SharedFlags).FFlagEDPContextReduceIXPVariableUsage;
local l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP;
local l_GetFFlagFixPeekViewJitter_0 = require(l_Parent_0.SharedFlags).GetFFlagFixPeekViewJitter;
local l_GetFIntPeekViewTransitionDelayTiming_0 = require(l_Parent_0.SharedFlags).GetFIntPeekViewTransitionDelayTiming;
local v37 = game:DefineFastFlag("EnableFastScrollingFixTest", false);
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local l_GetFFlagAccountSwitchScrim_0 = require(l_Parent_0.SharedFlags).GetFFlagAccountSwitchScrim;
local l_GetFFlagPeekViewNilRefLogging_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewNilRefLogging;
local l_FFlagEnablePeekViewFocusNav_0 = require(l_Parent_0.SharedFlags).FFlagEnablePeekViewFocusNav;
local v42 = Rect.new(9, 9, 9, 9);
local v43 = l_Images_0["icons/navigation/swipe"];
local v44 = 0.1 * l_GetFIntPeekViewTransitionDelayTiming_0();
local v45 = UDim.new(1, 0);
local l_Hidden_0 = v12.Hidden;
local l_Closed_0 = v12.Closed;
local l_SuperBrief_0 = v12.SuperBrief;
local l_Brief_0 = v12.Brief;
local l_Full_0 = v12.Full;
local l_Extended_0 = v12.Extended;
local v52 = v6.PureComponent:extend("PeekView");
v52.defaultProps = {
    superBriefViewContentHeight = nil, 
    briefViewContentHeight = UDim.new(0.5, 0), 
    fullViewContentHeight = if not not l_GetFFlagPeekViewScrimEnabled_0() or l_GetFFlagPeekViewScrimEnabledIXP_0() then UDim.new(1, 0) else nil, 
    bottomDockedContainerHeight = 0, 
    bottomDockedContainerContent = nil, 
    elasticBehavior = Enum.ElasticBehavior.Always, 
    hidden = false, 
    showDraggerInClosedState = true, 
    showDropShadow = true, 
    stateOnMount = nil, 
    mountAsFullView = false, 
    mountAnimation = true, 
    canDragFullViewToBrief = false, 
    withNewThemeProvider = true, 
    viewStateChanged = nil, 
    briefToFullTransitionPercent = nil, 
    peekHeaderClose = true, 
    peekHeaderPositionYChange = nil, 
    isScrollingEnabled = true, 
    closeSignal = nil, 
    hideDraggerInSuperBrief = false, 
    hideDraggerInFullView = not l_GetFFlagHideDraggerFullPeekView_0() and nil, 
    peekHeaderDeactivated = not l_GetFFlagHideDraggerFullPeekView_0() and nil, 
    minimizeToSuperBrief = false, 
    overlayDragger = not l_FFlagEDPContextRedesign_0 and nil
};
v52.init = function(v53) --[[ Line: 146 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Hidden_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy), v6 (copy), l_FFlagEDPContextRedesign_0 (copy), l_FFlagEDPContextReduceIXPVariableUsage_0 (copy), v7 (copy), l_Closed_0 (copy), l_GetFFlagFixPeekViewJitter_0 (copy), l_SuperBrief_0 (copy), l_Brief_0 (copy), l_Full_0 (copy), l_GetFFlagPeekViewScrimEnabled_0 (copy), v45 (copy), l_GetFFlagAccountSwitchScrim_0 (copy), l_GetFFlagPeekViewNilRefLogging_0 (copy), l_switchAccountScrimError_0 (copy), v23 (copy), v37 (copy), l_InputTypeConstants_0 (copy), v12 (copy), l_GetFFlagHideDraggerFullPeekView_0 (copy), v22 (copy), l_Extended_0 (copy), v17 (copy), l_RunService_0 (copy), v44 (copy), l_GuiService_0 (copy)
    v53.isMounted = false;
    v53.isTouched = false;
    v53.isInGoToState = false;
    v53.useReducedMotion = l_UserGameSettings_0.ReducedMotion;
    v53.viewType = l_Hidden_0;
    v53:setState({
        scrollableViewType = false, 
        absoluteWindowSizeX = 0, 
        absoluteWindowSizeY = 0, 
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType()), 
        canvasGroupTransparency = 0
    });
    v53.containerFrameRef = v6.createRef();
    v53.clipFrameRef = v6.createRef();
    v53.shadowRef = v6.createRef();
    v53.fillingAreaRef = v6.createRef();
    v53.swipeScrollingFrameRef = v6.createRef();
    v53.bottomContainerRef = v6.createRef();
    if l_FFlagEDPContextRedesign_0 and (v53.props.isDetailsPageContextRedesignEnabled or l_FFlagEDPContextReduceIXPVariableUsage_0) then
        local v54, v55 = v6.createBinding(0);
        v53.transitionPercent = v54;
        v53.setTransitionPercent = v55;
    end;
    v53.onAbsoluteWindowSizeChanged = function(v56) --[[ Line: 177 ]]
        -- upvalues: v53 (copy)
        if v56.AbsoluteWindowSize.X ~= v53.state.absoluteWindowSizeX or v56.AbsoluteWindowSize.Y ~= v53.state.absoluteWindowSizeY then
            v53:setState({
                absoluteWindowSizeX = v56.AbsoluteWindowSize.X, 
                absoluteWindowSizeY = v56.AbsoluteWindowSize.Y
            });
        end;
    end;
    v53.withStyle = function(v57) --[[ Line: 189 ]]
        -- upvalues: v53 (copy), v7 (ref)
        if v53.props.withNewThemeProvider then
            return v7.Style.withStyle(v57);
        else
            return v57({
                Theme = {
                    BackgroundDefault = {
                        Color = Color3.fromRGB(35, 37, 39), 
                        Transparency = 0
                    }, 
                    UIEmphasis = {
                        Color = Color3.fromRGB(255, 255, 255), 
                        Transparency = 0.7
                    }, 
                    DropShadow = {
                        Color = Color3.fromRGB(0, 0, 0), 
                        Transparency = 0
                    }
                }, 
                Settings = {
                    ReducedMotion = false
                }
            });
        end;
    end;
    v53.inputBeganCallback = function(v58) --[[ Line: 215 ]]
        -- upvalues: v53 (copy)
        if not v53.isMounted then
            return;
        elseif v58.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v53.isTouched = true;
            return;
        end;
    end;
    v53.inputEndedCallback = function(v59) --[[ Line: 227 ]]
        -- upvalues: v53 (copy)
        if not v53.isMounted then
            return;
        elseif v59.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v53.isTouched = false;
            v53.checkGoTo();
            return;
        end;
    end;
    v53.getViewSize = function(v60) --[[ Line: 240 ]]
        -- upvalues: l_Hidden_0 (ref), l_Closed_0 (ref), l_GetFFlagFixPeekViewJitter_0 (ref), v53 (copy), l_SuperBrief_0 (ref), l_Brief_0 (ref), l_Full_0 (ref), l_GetFFlagPeekViewScrimEnabled_0 (ref), v45 (ref)
        if v60 == l_Hidden_0 then
            return UDim.new(0, 0);
        elseif v60 == l_Closed_0 then
            if l_GetFFlagFixPeekViewJitter_0() or v53.props.peekViewJitterFixEnabled then
                return UDim.new(0, 0);
            elseif v53.props.showDraggerInClosedState then
                return UDim.new(0, 25);
            else
                return UDim.new(0, 0);
            end;
        elseif v60 == l_SuperBrief_0 then
            if v53.props.superBriefViewContentHeight then
                local l_superBriefViewContentHeight_0 = v53.props.superBriefViewContentHeight;
                return UDim.new(l_superBriefViewContentHeight_0.Scale, l_superBriefViewContentHeight_0.Offset + 25);
            else
                return UDim.new(0, 0);
            end;
        elseif v60 == l_Brief_0 then
            local l_briefViewContentHeight_0 = v53.props.briefViewContentHeight;
            return UDim.new(l_briefViewContentHeight_0.Scale, l_briefViewContentHeight_0.Offset + 25);
        elseif v60 == l_Full_0 then
            if l_GetFFlagPeekViewScrimEnabled_0() or v53.props.scrimEnabled then
                return v53.props.fullViewContentHeight;
            else
                return v45;
            end;
        else
            return nil;
        end;
    end;
    if l_GetFFlagAccountSwitchScrim_0() then
        v53.hasNilRefs = function() --[[ Line: 274 ]]
            -- upvalues: v53 (copy)
            local l_current_0 = v53.swipeScrollingFrameRef.current;
            local l_current_1 = v53.containerFrameRef.current;
            local l_current_2 = v53.clipFrameRef.current;
            local l_current_3 = v53.shadowRef.current;
            local l_current_4 = v53.fillingAreaRef.current;
            return not (l_current_0 and l_current_1 and l_current_2 and l_current_3 and l_current_4);
        end;
    end;
    if l_GetFFlagPeekViewNilRefLogging_0() then
        v53.reportRefStatus = function(v68, v69, v70, v71, v72, v73) --[[ Line: 286 ]]
            -- upvalues: l_switchAccountScrimError_0 (ref), v23 (ref)
            l_switchAccountScrimError_0(v23, "switchAccountScrimError", {
                callSite = v68, 
                swipeScrollingFrame = v69 and "true" or "nil", 
                containerFrame = v70 and "true" or "nil", 
                clipFrame = v71 and "true" or "nil", 
                shadow = v72 and "true" or "nil", 
                fillingArea = v73 and "true" or "nil"
            });
        end;
    end;
    v53.reconcileRbxInstances = function(v74) --[[ Line: 299 ]]
        -- upvalues: v53 (copy), l_GetFFlagAccountSwitchScrim_0 (ref), l_GetFFlagPeekViewNilRefLogging_0 (ref), l_FFlagEDPContextRedesign_0 (ref)
        local l_current_5 = v53.swipeScrollingFrameRef.current;
        local v76 = l_current_5 and l_current_5.CanvasPosition.Y or 0;
        local l_current_6 = v53.containerFrameRef.current;
        local l_current_7 = v53.clipFrameRef.current;
        local l_current_8 = v53.shadowRef.current;
        local l_current_9 = v53.fillingAreaRef.current;
        if l_GetFFlagAccountSwitchScrim_0() and v53.hasNilRefs() then
            if l_GetFFlagPeekViewNilRefLogging_0() then
                v53.reportRefStatus(v74, l_current_5, l_current_6, l_current_7, l_current_8, l_current_9);
            end;
            return;
        else
            local l_X_0 = l_current_6.AbsoluteSize.X;
            local l_Y_0 = l_current_6.AbsoluteSize.Y;
            l_current_7.Size = UDim2.new(0, l_X_0, 0, v76);
            l_current_8.Size = UDim2.new(0, l_X_0, 0, 36);
            l_current_7.Position = UDim2.new(0, 0, 1, -v76);
            l_current_8.Position = UDim2.new(0, 0, 1, -v76 - 30);
            l_current_5.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            l_current_5.Position = UDim2.new(0, 0, 0, -(l_Y_0 - v76));
            l_current_9.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            local l_current_10 = v53.bottomContainerRef.current;
            if l_current_10 then
                local l_bottomDockedContainerHeight_0 = v53.props.bottomDockedContainerHeight;
                if l_current_7.AbsoluteSize.Y > 25 + l_bottomDockedContainerHeight_0 then
                    l_current_10.Active = true;
                    l_current_10.Position = UDim2.new(0, 0, 1, -l_bottomDockedContainerHeight_0);
                else
                    l_current_10.Active = false;
                    l_current_10.Position = UDim2.new(0, 0, 1, -l_current_7.AbsoluteSize.Y + 25);
                end;
            end;
            v53.transitionCallbacks();
            if l_FFlagEDPContextRedesign_0 and v53.props.isDetailsPageContextRedesignEnabled and v53.props.peekHeaderPositionYChange then
                v53.props.peekHeaderPositionYChange(v76);
            end;
            return;
        end;
    end;
    v53.updateSwipeScrollingFrame = function() --[[ Line: 351 ]]
        -- upvalues: v53 (copy)
        local v85 = v53.getViewSize(v53.viewType);
        local v86 = v53.containerFrameRef.current and v53.swipeScrollingFrameRef.current;
        if v85 and v86 then
            local l_Y_1 = v53.containerFrameRef.current.AbsoluteSize.Y;
            local l_current_11 = v53.swipeScrollingFrameRef.current;
            local v89 = l_Y_1 * v85.Scale + v85.Offset;
            if l_current_11.CanvasPosition.Y ~= v89 then
                l_current_11.CanvasPosition = Vector2.new(0, v89);
                if v53.props.peekHeaderPositionYChange then
                    v53.props.peekHeaderPositionYChange(v89);
                end;
            end;
        end;
    end;
    v53.onContainerFrameAbsoluteSizeChanged = function() --[[ Line: 371 ]]
        -- upvalues: v53 (copy), l_GetFFlagPeekViewNilRefLogging_0 (ref)
        if not v53.isMounted then
            return;
        else
            if l_GetFFlagPeekViewNilRefLogging_0() then
                v53.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged");
            else
                v53.reconcileRbxInstances();
            end;
            v53.updateSwipeScrollingFrame();
            return;
        end;
    end;
    v53.onSwipeScrollingFrameCanvasPositionChanged = function() --[[ Line: 384 ]]
        -- upvalues: v53 (copy), v37 (ref), l_GetFFlagPeekViewNilRefLogging_0 (ref), l_InputTypeConstants_0 (ref)
        if not v53.isMounted then
            return;
        else
            local l_current_12 = v53.swipeScrollingFrameRef.current;
            local l_Y_2 = l_current_12.CanvasPosition.Y;
            if l_Y_2 ~= math.floor(l_Y_2) then
                if not v37 then
                    l_current_12.CanvasPosition = Vector2.new(0, (math.floor(l_Y_2 + 0.5)));
                end;
                if v53.props.peekHeaderPositionYChange then
                    v53.props.peekHeaderPositionYChange(l_Y_2);
                end;
                if not v37 then
                    return;
                end;
            end;
            if l_GetFFlagPeekViewNilRefLogging_0() then
                v53.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged");
            else
                v53.reconcileRbxInstances();
            end;
            if v53.state.lastInputGroup ~= l_InputTypeConstants_0.Gamepad then
                v53.checkGoTo();
            end;
            return;
        end;
    end;
    v53.getBriefViewY = function() --[[ Line: 423 ]]
        -- upvalues: v53 (copy)
        local l_Y_3 = v53.containerFrameRef.current.AbsoluteSize.Y;
        local l_briefViewContentHeight_1 = v53.props.briefViewContentHeight;
        return l_Y_3 * l_briefViewContentHeight_1.Scale + l_briefViewContentHeight_1.Offset + 25;
    end;
    v53.getSuperBriefViewY = function() --[[ Line: 429 ]]
        -- upvalues: v53 (copy)
        if not v53.props.superBriefViewContentHeight or not v53.containerFrameRef:getValue() then
            return nil;
        else
            local l_Y_4 = v53.containerFrameRef:getValue().AbsoluteSize.Y;
            local l_superBriefViewContentHeight_1 = v53.props.superBriefViewContentHeight;
            return l_Y_4 * l_superBriefViewContentHeight_1.Scale + l_superBriefViewContentHeight_1.Offset + 25;
        end;
    end;
    v53.getFullViewY = function() --[[ Line: 439 ]]
        -- upvalues: v53 (copy), l_GetFFlagPeekViewScrimEnabled_0 (ref), v45 (ref)
        local l_Y_5 = v53.containerFrameRef.current.AbsoluteSize.Y;
        if l_GetFFlagPeekViewScrimEnabled_0() or v53.props.scrimEnabled then
            return l_Y_5 * v53.props.fullViewContentHeight.Scale + v53.props.fullViewContentHeight.Offset;
        else
            return l_Y_5 * v45.Scale + v45.Offset;
        end;
    end;
    v53.transitionCallbacks = function() --[[ Line: 446 ]]
        -- upvalues: v53 (copy), l_FFlagEDPContextRedesign_0 (ref)
        local l_briefToFullTransitionPercent_0 = v53.props.briefToFullTransitionPercent;
        if l_FFlagEDPContextRedesign_0 and v53.props.isDetailsPageContextRedesignEnabled or l_briefToFullTransitionPercent_0 then
            local l_Y_6 = v53.swipeScrollingFrameRef.current.CanvasPosition.Y;
            local v99 = v53.getBriefViewY();
            local v100 = v53.getFullViewY();
            local v101 = v100 - v99;
            local v102 = 0;
            if v99 < l_Y_6 and l_Y_6 <= v100 then
                v102 = (l_Y_6 - v99) / v101;
            elseif v100 < l_Y_6 then
                v102 = 1;
            end;
            if l_FFlagEDPContextRedesign_0 and v53.props.isDetailsPageContextRedesignEnabled then
                v53.setTransitionPercent(v102);
            end;
            if l_FFlagEDPContextRedesign_0 and v53.props.isDetailsPageContextRedesignEnabled and l_briefToFullTransitionPercent_0 or not l_FFlagEDPContextRedesign_0 or not v53.props.isDetailsPageContextRedesignEnabled then
                l_briefToFullTransitionPercent_0(v102);
            end;
        end;
    end;
    v53.checkGoTo = function() --[[ Line: 491 ]]
        -- upvalues: v53 (copy), v12 (ref)
        if v53.isInGoToState then
            return;
        elseif v53.isTouched then
            return;
        else
            local l_current_13 = v53.swipeScrollingFrameRef.current;
            if l_current_13 and v53.state.absoluteWindowSizeX == 0 and v53.state.absoluteWindowSizeY == 0 then
                return;
            else
                local v104 = v53.getBriefViewY();
                local v105 = v53.getSuperBriefViewY();
                local v106 = v53.getFullViewY();
                if v106 < v104 then
                    return;
                elseif v105 and v104 < v105 then
                    return;
                elseif l_current_13.AbsoluteWindowSize.Y + 25 + v53.props.bottomDockedContainerHeight > (l_current_13.AbsoluteCanvasSize.Y or l_current_13.CanvasSize.Y.Offset) then
                    return;
                else
                    local l_Y_7 = l_current_13.ScrollVelocity.Y;
                    local v108 = l_Y_7 < 0;
                    local v109 = l_Y_7 > 0;
                    local l_Y_8 = l_current_13.CanvasPosition.Y;
                    local v111 = false;
                    if v53.viewType == v12.Brief then
                        v111 = l_Y_8 == v104;
                    end;
                    local v112 = false;
                    if v53.viewType == v12.Full then
                        v112 = l_Y_8 == v106;
                    end;
                    if (v111 or v112) and l_Y_7 == 0 then
                        return;
                    elseif v106 < l_Y_8 then
                        v53:handleCurYAboveFullViewY(v108);
                        return;
                    elseif v104 < l_Y_8 and l_Y_8 <= v106 then
                        v53:handleCurYFromBriefToFull(l_Y_8, l_Y_7, v108, v109);
                        return;
                    else
                        if v105 then
                            if v105 < l_Y_8 and l_Y_8 <= v104 then
                                v53:handleCurYFromSuperBriefToBrief(l_Y_8, v105, l_Y_7, v108, v109);
                                return;
                            elseif l_Y_8 <= v105 then
                                v53:handleCurYFromClosedToSuperBrief(l_Y_8, v105, l_Y_7, v109, v108);
                                return;
                            end;
                        elseif l_Y_8 <= v104 then
                            v53:handleCurYFromClosedToBrief(l_Y_8, v109, v108);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v53.onPeekHeaderActivated = function() --[[ Line: 574 ]]
        -- upvalues: l_GetFFlagHideDraggerFullPeekView_0 (ref), v53 (copy), l_Closed_0 (ref), l_Brief_0 (ref), l_Full_0 (ref), l_SuperBrief_0 (ref), v22 (ref)
        if l_GetFFlagHideDraggerFullPeekView_0() and v53.props.peekHeaderDeactivated then
            return;
        elseif v53.viewType == l_Closed_0 then
            v53.goTo(l_Brief_0);
            return;
        elseif v53.viewType == l_Brief_0 then
            v53.goTo(l_Full_0);
            return;
        elseif v53.viewType == l_SuperBrief_0 then
            v53.goTo(l_Brief_0);
            return;
        else
            if v53.viewType == l_Full_0 then
                if v53.props.peekHeaderClose then
                    v53.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.handleTap
                    });
                    return;
                else
                    v53.goTo(l_Brief_0);
                end;
            end;
            return;
        end;
    end;
    v53.setViewType = function(v113, v114) --[[ Line: 595 ]]
        -- upvalues: v53 (copy), l_Extended_0 (ref), l_Full_0 (ref)
        if v53.goToAnimationConnection then
            v53.goToAnimationConnection:disconnect();
            v53.goToAnimationConnection = nil;
        end;
        v53.isInGoToState = false;
        v53.clipFrameRef.current.Active = false;
        local l_viewType_0 = v53.viewType;
        if l_viewType_0 ~= v113 then
            v53.viewType = v113;
            local v116 = true;
            if v53.viewType ~= l_Extended_0 then
                v116 = v53.viewType == l_Full_0;
            end;
            v53:setState({
                scrollableViewType = v116
            });
            local l_viewStateChanged_0 = v53.props.viewStateChanged;
            if l_viewStateChanged_0 then
                l_viewStateChanged_0(v113, l_viewType_0, v114 or {});
            end;
        end;
        v53.updateSwipeScrollingFrame();
    end;
    v53.goTo = function(v118, v119, v120, v121) --[[ Line: 623 ]]
        -- upvalues: v53 (copy), v17 (ref), l_Full_0 (ref), l_Closed_0 (ref), l_RunService_0 (ref), l_GetFFlagFixPeekViewJitter_0 (ref), l_Brief_0 (ref), v44 (ref)
        if v53.viewType == v118 then
            return;
        elseif v17.isEqual(v53.isInGoToState, false, "self.isInGoToState") then
            return;
        elseif v17.isEqual(v53.goToAnimationConnection, nil, "self.goToAnimationConnection") then
            return;
        else
            v53.isInGoToState = true;
            v53.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
            v53.clipFrameRef.current.Active = true;
            if v119 == false then
                v53.setViewType(v118, v121);
                if v118 == l_Full_0 then
                    v53:adjustScrollingFramePosition();
                    return;
                end;
            else
                local v122 = tick();
                if not v120 then
                    v53:setState({
                        canvasGroupTransparency = v118 == l_Closed_0 and 1 or 0
                    });
                    v53.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 654 ]]
                        -- upvalues: v53 (ref), v122 (copy), l_GetFFlagFixPeekViewJitter_0 (ref), v118 (copy), l_Brief_0 (ref), v44 (ref), v17 (ref), v121 (copy), l_Full_0 (ref)
                        if not v53.isMounted then
                            return;
                        else
                            local v123 = tick() - v122;
                            if not l_GetFFlagFixPeekViewJitter_0() and not v53.props.peekViewJitterFixEnabled or v118 ~= l_Brief_0 or v44 <= v123 then
                                v53.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                local l_current_14 = v53.swipeScrollingFrameRef.current;
                                local l_Y_9 = v53.containerFrameRef.current.AbsoluteSize.Y;
                                local v126 = v17.isNotNil(v53.getViewSize(v118), "self.goTo.viewSize");
                                local v127 = l_Y_9 * v126.Scale + v126.Offset;
                                if (l_GetFFlagFixPeekViewJitter_0() or v53.props.peekViewJitterFixEnabled) and v118 == l_Brief_0 then
                                    v123 = v123 - v44;
                                end;
                                if v123 >= 0.35 then
                                    v53.setViewType(v118, v121);
                                    if v118 == l_Full_0 then
                                        v53:adjustScrollingFramePosition();
                                    end;
                                    return;
                                else
                                    local l_Y_10 = l_current_14.CanvasPosition.Y;
                                    local v129 = v127 - l_Y_10;
                                    l_current_14.CanvasPosition = Vector2.new(0, l_Y_10 + v129 * math.sin(v123 * 2.468394227820552));
                                end;
                            end;
                            return;
                        end;
                    end);
                    return;
                else
                    if v118 ~= l_Closed_0 then
                        v53.setViewType(v118, v121);
                        if v118 == l_Full_0 then
                            v53:adjustScrollingFramePosition();
                        end;
                    end;
                    v53:setState({
                        canvasGroupTransparency = v118 == l_Closed_0 and 0 or 1
                    });
                    v53.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 705 ]]
                        -- upvalues: v53 (ref), v118 (copy), l_Full_0 (ref), v122 (copy), l_Closed_0 (ref), v121 (copy)
                        if not v53.isMounted then
                            return;
                        else
                            if v118 == l_Full_0 then
                                v53.updateSwipeScrollingFrame();
                            end;
                            local v130 = tick() - v122;
                            if v130 >= 0.35 then
                                v53:setState({
                                    canvasGroupTransparency = v118 == l_Closed_0 and 1 or 0
                                });
                                v53.setViewType(v118, v121);
                                if v118 == l_Full_0 then
                                    v53:adjustScrollingFramePosition();
                                end;
                                return;
                            else
                                v53:setState({
                                    canvasGroupTransparency = if v118 == l_Closed_0 then v130 / 0.35 else 1 - v130 / 0.35
                                });
                                return;
                            end;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end;
    v53.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ Line: 739 ]]
        -- upvalues: v53 (copy), l_InputTypeConstants_0 (ref)
        if v53.swipeScrollingFrameRef.current and v53.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
            v53:adjustScrollingFramePosition();
        end;
    end);
end;
v52.handleCurYAboveFullViewY = function(v131, v132) --[[ Line: 756 ]] --[[ Name: handleCurYAboveFullViewY ]]
    -- upvalues: l_Full_0 (copy), l_Extended_0 (copy)
    if v131.viewType ~= l_Full_0 and v131.viewType ~= l_Extended_0 then
        if v132 then
            v131.goTo(l_Full_0);
            return;
        else
            v131.setViewType(l_Extended_0);
            return;
        end;
    else
        if v131.viewType == l_Full_0 then
            v131.setViewType(l_Extended_0);
        end;
        return;
    end;
end;
v52.handleCurYFromBriefToFull = function(v133, v134, v135, v136, v137) --[[ Line: 768 ]] --[[ Name: handleCurYFromBriefToFull ]]
    -- upvalues: l_Full_0 (copy), l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_0 = v133.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_0 = v133.props.minimizeToSuperBrief;
    local v140 = v133.swipeScrollingFrameRef:getValue();
    local v141 = v133.getBriefViewY();
    local v142 = v133.getFullViewY() - v141;
    if v133.viewType == l_Full_0 then
        if v140.AbsoluteCanvasSize.Y - v140.AbsoluteWindowSize.Y - 1 < v134 then
            return;
        elseif v137 or v134 < v141 + v142 * 0.8 then
            local v143 = v137 and v135 > 500;
            if l_canDragFullViewToBrief_0 and (not v143 or l_minimizeToSuperBrief_0) then
                v133.goTo(l_Brief_0);
                return;
            else
                v133.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        end;
    elseif v133.viewType == l_Extended_0 then
        if not v137 or v134 < v141 + v142 * 0.8 or v135 > -1 then
            v133.goTo(l_Full_0);
            return;
        end;
    elseif v136 or v141 + v142 * 0.2 < v134 then
        v133.goTo(l_Full_0);
        return;
    else
        v133.goTo(l_Brief_0);
    end;
end;
v52.handleCurYFromSuperBriefToBrief = function(v144, v145, v146, v147, v148, v149) --[[ Line: 807 ]] --[[ Name: handleCurYFromSuperBriefToBrief ]]
    -- upvalues: l_Full_0 (copy), l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_1 = v144.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_1 = v144.props.minimizeToSuperBrief;
    local v152 = v144.getFullViewY() - v146;
    if v144.viewType == l_Full_0 then
        if v149 or v145 < v146 + v152 * 0.8 then
            local v153 = v149 and v147 > 500;
            if l_canDragFullViewToBrief_1 and (not v153 or l_minimizeToSuperBrief_1) then
                v144.goTo(l_SuperBrief_0);
                return;
            else
                v144.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        else
            v144.goTo(l_Brief_0);
            return;
        end;
    else
        if v144.viewType == l_Extended_0 then
            if not v149 or v145 < v146 + v152 * 0.8 or v147 > -1 then
                v144.goTo(l_Brief_0);
                return;
            end;
        elseif v148 or v146 + v152 * 0.2 < v145 then
            v144.goTo(l_Brief_0);
            return;
        else
            local v154 = v149 and v147 > 500;
            if l_canDragFullViewToBrief_1 and (not v154 or l_minimizeToSuperBrief_1) then
                v144.goTo(l_SuperBrief_0);
                return;
            else
                v144.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
            end;
        end;
        return;
    end;
end;
v52.handleCurYFromClosedToSuperBrief = function(v155, v156, v157, v158, v159, v160) --[[ Line: 845 ]] --[[ Name: handleCurYFromClosedToSuperBrief ]]
    -- upvalues: l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v161 = v157 - 0;
    local l_minimizeToSuperBrief_2 = v155.props.minimizeToSuperBrief;
    if v155.viewType == l_SuperBrief_0 then
        if (v159 or v156 < v161 * 0.8) and not l_minimizeToSuperBrief_2 then
            v155.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v155.goTo(l_SuperBrief_0);
            return;
        end;
    elseif (not v159 or v158 <= 500) and (v160 or v161 * 0.8 < v156) or l_minimizeToSuperBrief_2 then
        v155.goTo(l_SuperBrief_0);
        return;
    else
        v155.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v52.handleCurYFromClosedToBrief = function(v163, v164, v165, v166) --[[ Line: 868 ]] --[[ Name: handleCurYFromClosedToBrief ]]
    -- upvalues: l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v167 = v163.getBriefViewY() - 0;
    if v163.viewType == l_Brief_0 then
        if v165 or v164 < 0 + v167 * 0.8 then
            v163.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v163.goTo(l_Brief_0);
            return;
        end;
    elseif v166 or 0 + v167 * 0.2 < v164 then
        v163.goTo(l_Brief_0);
        return;
    else
        v163.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v52.adjustScrollingFramePosition = function(v168) --[[ Line: 891 ]] --[[ Name: adjustScrollingFramePosition ]]
    -- upvalues: l_GuiService_0 (copy), l_Extended_0 (copy), l_Full_0 (copy), v17 (copy)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not l_SelectedCoreObject_0 or not v168.props.contentFrameRef or not l_SelectedCoreObject_0:IsDescendantOf(v168.props.contentFrameRef.current) then
        return;
    else
        local l_current_15 = v168.swipeScrollingFrameRef.current;
        if v168.viewType ~= l_Extended_0 and v168.viewType ~= l_Full_0 then
            local v171 = v17.isNotNil(v168.getViewSize(v168.viewType), "self.adjustScrollingFramePosition.viewSize");
            l_current_15.CanvasPosition = Vector2.new(l_current_15.CanvasPosition.X, v171.Offset);
            return;
        else
            local v172 = l_SelectedCoreObject_0.AbsolutePosition.Y - v168.props.topBarHeight;
            local l_Y_11 = l_SelectedCoreObject_0.AbsoluteSize.Y;
            local l_Y_12 = l_current_15.AbsoluteWindowSize.Y;
            local v175 = l_Y_12 - (v172 + l_Y_11);
            local l_Y_13 = l_current_15.CanvasPosition.Y;
            if v175 < v168.props.bottomDockedContainerHeight then
                l_Y_13 = l_Y_13 + v168.props.bottomDockedContainerHeight - v175;
            elseif v172 + l_Y_11 + (l_Y_13 - l_Y_12) < l_Y_12 - v168.props.bottomDockedContainerHeight then
                l_Y_13 = l_Y_12;
            end;
            l_Y_13 = math.max(0, (math.min(l_Y_13, (l_current_15.AbsoluteCanvasSize.Y or l_current_15.CanvasSize.Y.Offset) - l_current_15.AbsoluteWindowSize.Y)));
            l_current_15.CanvasPosition = Vector2.new(l_current_15.CanvasPosition.X, l_Y_13);
            return;
        end;
    end;
end;
v52.handleThumbstickInput = function(v177, v178, v179) --[[ Line: 936 ]] --[[ Name: handleThumbstickInput ]]
    -- upvalues: l_GamepadUtils_0 (copy)
    local l_Position_0 = v178.Position;
    local v181 = v177.swipeScrollingFrameRef:getValue();
    if v177.containerFrameRef:getValue() and v181 then
        local v182 = v181.CanvasPosition.Y + v179 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
        if v177.getFullViewY() < v182 then
            v181.CanvasPosition = Vector2.new(0, v182);
        end;
    end;
end;
v52.renderWithStyle = function(v183, v184) --[[ Line: 949 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v6 (copy), l_FFlagEDPContextRedesign_0 (copy), v8 (copy), l_GetFFlagHideDraggerFullPeekView_0 (copy), l_SuperBrief_0 (copy), l_Full_0 (copy), l_Focusable_0 (copy), v9 (copy), l_FFlagEnablePeekViewFocusNav_0 (copy), l_ImageSetLabel_0 (copy), v42 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v43 (copy), l_Brief_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v25 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v185 = v183.props[v6.Children];
    if l_FFlagEDPContextRedesign_0 and v183.props.isDetailsPageContextRedesignEnabled and v183.props.overlayDragger then
        v185 = v8.Dictionary.join({
            Padding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, -25)
            })
        }, v185);
    end;
    local l_bottomDockedContainerHeight_1 = v183.props.bottomDockedContainerHeight;
    local l_bottomDockedContainerContent_0 = v183.props.bottomDockedContainerContent;
    local v188 = v183.props.thumbstickScrollEnabled and v183.state.scrollableViewType;
    local v189 = false;
    if l_GetFFlagHideDraggerFullPeekView_0() then
        v189 = v183.props.hideDraggerInSuperBrief and v183.props.peekViewState == l_SuperBrief_0 or v183.props.hideDraggerInFullView and v183.props.peekViewState == l_Full_0;
    end;
    local l_createElement_0 = v6.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v194 = {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v6.Ref] = v183.clipFrameRef, 
        restorePreviousChildFocus = true, 
        inputBindings = v188 and {
            ScrollPeekView = v9.Input.onStep(Enum.KeyCode.Thumbstick2, function(v192, v193) --[[ Line: 976 ]]
                -- upvalues: v183 (copy)
                v183:handleThumbstickInput(v192, v193);
            end)
        } or nil
    };
    local v195 = {};
    local l_createElement_1 = v6.createElement;
    local v197 = "ScrollingFrame";
    local v198 = {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Selectable = not l_FFlagEnablePeekViewFocusNav_0 and nil, 
        CanvasSize = UDim2.fromScale(1, 0), 
        Active = true, 
        BackgroundTransparency = 1, 
        ZIndex = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0, 
        ClipsDescendants = false, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ElasticBehavior = v183.props.elasticBehavior, 
        ScrollingEnabled = v183.props.isScrollingEnabled, 
        [v6.Ref] = v183.swipeScrollingFrameRef, 
        [v6.Change.CanvasPosition] = v183.onSwipeScrollingFrameCanvasPositionChanged, 
        [v6.Change.AbsoluteWindowSize] = v183.onAbsoluteWindowSizeChanged, 
        [v6.Change.AbsoluteSize] = if l_FFlagEDPContextRedesign_0 and v183.props.isDetailsPageContextRedesignEnabled then v183.props.onScrollingFrameSizeChanged else nil
    };
    local v201 = {
        UIListLayout = v6.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        FillingArea = v6.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Active = false, 
            [v6.Ref] = v183.fillingAreaRef
        }), 
        BackgroundFrame = v6.createElement("Frame", {
            LayoutOrder = 2, 
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Active = false
        }, {
            BackgroundImage = v6.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, 9999), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v42, 
                BackgroundColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v184.Theme.BackgroundContrast.Color else v184.Theme.BackgroundDefault.Color, 
                Active = false
            })
        }), 
        PeekHeader = v6.createElement("TextButton", {
            Text = "", 
            LayoutOrder = 3, 
            ZIndex = l_FFlagEDPContextRedesign_0 and v183.props.isDetailsPageContextRedesignEnabled and 3 or 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 25), 
            [v6.Event.Activated] = v183.onPeekHeaderActivated, 
            Active = if l_FFlagEDPContextRedesign_0 and v183.props.isDetailsPageContextRedesignEnabled and v183.props.overlayDragger then v183.transitionPercent:map(function(v199) --[[ Line: 1043 ]]
                return v199 < 1;
            end) else nil
        }, {
            Dragger = if if l_GetFFlagHideDraggerFullPeekView_0() then v189 else v183.props.hideDraggerInSuperBrief and v183.props.peekViewState == l_SuperBrief_0 then nil else v6.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Image = v43, 
                ImageColor3 = v184.Theme.UIEmphasis.Color, 
                ImageTransparency = if l_FFlagEDPContextRedesign_0 and v183.props.isDetailsPageContextRedesignEnabled and v183.props.overlayDragger then v183.transitionPercent:map(function(v200) --[[ Line: 1065 ]]
                    if v200 >= 0.9 then
                        return (v200 - 0.9) * 10;
                    else
                        return 0;
                    end;
                end) else v184.Theme.UIEmphasis.Transparency, 
                Active = false
            })
        }), 
        ContentFrame = v6.createElement(l_Focusable_0.Frame, {
            LayoutOrder = 4, 
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v6.Ref] = v183.props.contentFrameRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = function() --[[ Line: 1087 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v183 (copy), l_Brief_0 (ref), l_Full_0 (ref)
                if v183.viewType == l_Brief_0 and v183.props.peekViewState ~= l_Full_0 then
                    v183.goTo(l_Full_0);
                end;
            end
        }, v185)
    };
    local v202 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        v202 = v6.createElement("Frame", {
            LayoutOrder = 5, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            Active = false
        });
    end;
    v201.BottomContainerPlaceHolder = v202;
    v195.SwipeScrollingFrame = l_createElement_1(v197, v198, v201);
    l_createElement_1 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        l_createElement_1 = v6.createElement("Frame", {
            Active = true, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            BackgroundTransparency = 1, 
            [v6.Ref] = v183.bottomContainerRef
        }, l_bottomDockedContainerContent_0);
    end;
    v195.BottomContainer = l_createElement_1;
    l_createElement_0 = l_createElement_0(l_Frame_0, v194, v195);
    l_Frame_0 = if l_FFlagEnablePeekViewFocusNav_0 then v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = v25.FocusNavigableSurfaceIdentifierEnum.PeekView, 
        isIsolated = true
    }, {
        ClipFrame = l_createElement_0
    }) else nil;
    return v6.createFragment({
        DropShadowBackground = v6.createElement("Frame", {
            ZIndex = 0, 
            Visible = v183.props.showDropShadow, 
            [v6.Ref] = v183.shadowRef
        }, {
            UIGradient = v6.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v184.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v184.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        }), 
        ClipFrameContainer = l_Frame_0, 
        ClipFrame = if l_FFlagEnablePeekViewFocusNav_0 then nil else l_createElement_0, 
        InputBegan = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v183.inputBeganCallback
        }), 
        InputEnded = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v183.inputEndedCallback
        })
    });
end;
v52.render = function(v203) --[[ Line: 1150 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagPeekViewScrimEnabled_0 (copy), v6 (copy), v13 (copy), v32 (copy), l_Closed_0 (copy), v22 (copy)
    return v203.withStyle(function(v204) --[[ Line: 1151 ]]
        -- upvalues: l_GetFFlagPeekViewScrimEnabled_0 (ref), v203 (copy), v6 (ref), v13 (ref), v32 (ref), l_Closed_0 (ref), v22 (ref)
        if l_GetFFlagPeekViewScrimEnabled_0() or v203.props.scrimEnabled then
            local v205 = if v203.useReducedMotion then v6.createElement("CanvasGroup", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                GroupTransparency = v203.state.canvasGroupTransparency
            }, {
                v203:renderWithStyle(v204)
            }) else v203:renderWithStyle(v204);
            if v203.props.hasScrim then
                return v6.createElement(v13, {
                    [v6.Ref] = v203.containerFrameRef, 
                    onActivated = function() --[[ Line: 1166 ]] --[[ Name: onActivated ]]
                        -- upvalues: v32 (ref), v203 (ref), l_Closed_0 (ref), v22 (ref)
                        if v32 and v203.isInGoToState then
                            return;
                        else
                            v203.goTo(l_Closed_0, nil, nil, {
                                dismissMethod = v22.dismissMethodEnum.scrimTap
                            });
                            return;
                        end;
                    end, 
                    onSizeChanged = v203.onContainerFrameAbsoluteSizeChanged
                }, v205);
            else
                return v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    [v6.Ref] = v203.containerFrameRef, 
                    [v6.Change.AbsoluteSize] = v203.onContainerFrameAbsoluteSizeChanged
                }, v205);
            end;
        else
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [v6.Ref] = v203.containerFrameRef, 
                [v6.Change.AbsoluteSize] = v203.onContainerFrameAbsoluteSizeChanged
            }, {
                if v203.useReducedMotion then v6.createElement("CanvasGroup", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    GroupTransparency = v203.state.canvasGroupTransparency
                }, {
                    v203:renderWithStyle(v204)
                }) else v203:renderWithStyle(v204)
            });
        end;
    end);
end;
v52.didMount = function(v206) --[[ Line: 1208 ]] --[[ Name: didMount ]]
    -- upvalues: l_Closed_0 (copy), l_GetFFlagEnablePeekViewStateOnMountParam_0 (copy), l_Full_0 (copy), l_Brief_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy)
    v206.isMounted = true;
    if v206.props.closeSignal then
        v206.closeSignalConnection = v206.props.closeSignal:connect(function() --[[ Line: 1212 ]]
            -- upvalues: v206 (copy), l_Closed_0 (ref)
            if not v206.isInGoToState then
                v206.goTo(l_Closed_0, true, v206.useReducedMotion);
            end;
        end);
    end;
    local l_hidden_0 = v206.props.hidden;
    local l_mountAsFullView_0 = v206.props.mountAsFullView;
    local l_mountAnimation_0 = v206.props.mountAnimation;
    local v210 = if l_GetFFlagEnablePeekViewStateOnMountParam_0() then v206.props.stateOnMount else nil;
    if not l_hidden_0 then
        if l_mountAsFullView_0 then
            v206.goTo(l_Full_0, l_mountAnimation_0, v206.useReducedMotion);
        elseif v210 ~= nil then
            v206.goTo(v210, l_mountAnimation_0, v206.useReducedMotion);
        else
            v206.goTo(l_Brief_0, l_mountAnimation_0, v206.useReducedMotion);
        end;
    end;
    v206:setState({
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType())
    });
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v211) --[[ Line: 1240 ]]
        -- upvalues: v206 (copy), l_getInputGroup_0 (ref)
        v206:setState({
            lastInputGroup = l_getInputGroup_0(v211)
        });
    end);
end;
v52.isAnimating = function(v212) --[[ Line: 1245 ]] --[[ Name: isAnimating ]]
    return v212.goToAnimationConnection ~= nil;
end;
v52.didUpdate = function(v213, v214, v215) --[[ Line: 1249 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagPeekViewNilRefLogging_0 (copy), l_Hidden_0 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    if v215.absoluteWindowSizeX ~= v213.state.absoluteWindowSizeX or v215.absoluteWindowSizeY ~= v213.state.absoluteWindowSizeY then
        if l_GetFFlagPeekViewNilRefLogging_0() then
            v213.reconcileRbxInstances("didUpdate");
        else
            v213.reconcileRbxInstances();
        end;
        if not v213:isAnimating() then
            v213.updateSwipeScrollingFrame();
        end;
    end;
    if v214.bottomDockedContainerHeight ~= v213.props.bottomDockedContainerHeight then
        v213.onContainerFrameAbsoluteSizeChanged();
    end;
    if v214.hidden == false and v213.props.hidden == true then
        v213.goTo(l_Hidden_0);
    elseif v214.hidden == true and v213.props.hidden == false then
        v213.goTo(l_Brief_0);
    end;
    local l_peekViewState_0 = v213.props.peekViewState;
    local l_isInGoToState_0 = v213.isInGoToState;
    if l_peekViewState_0 ~= v214.peekViewState and v213.viewType == v214.peekViewState and l_peekViewState_0 ~= l_Extended_0 and not l_isInGoToState_0 then
        v213.goTo(v213.props.peekViewState);
    end;
end;
v52.willUnmount = function(v218) --[[ Line: 1295 ]] --[[ Name: willUnmount ]]
    v218.isMounted = false;
    if v218.closeSignalConnection then
        v218.closeSignalConnection:disconnect();
        v218.closeSignalConnection = nil;
    end;
    if v218.goToAnimationConnection then
        v218.goToAnimationConnection:disconnect();
        v218.goToAnimationConnection = nil;
    end;
    if v218.selectedCoreObjectConnection then
        v218.selectedCoreObjectConnection:disconnect();
        v218.selectedCoreObjectConnection = nil;
    end;
end;
if l_GetFFlagPeekViewScrimEnabledIXP_0() or l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0() then
    v52 = v21.connectUserLayer({
        "PlatformExcellence.QualityImprovement.App"
    }, function(v219, _) --[[ Line: 1317 ]]
        -- upvalues: l_GetFFlagPeekViewScrimEnabledIXP_0 (copy), l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0 (copy)
        local v221 = v219["PlatformExcellence.QualityImprovement.App"];
        local v222 = v219["PlatformExcellence.QualityImprovement.App"] or {};
        return {
            scrimEnabled = if l_GetFFlagPeekViewScrimEnabledIXP_0() then v221 and v221.peekViewScrimEnabled else nil, 
            peekViewJitterFixEnabled = if l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0() then v222.peekViewJitterFixEnabled else nil
        };
    end)(v52);
end;
return v11.connect(function(v223, _) --[[ Line: 1331 ]] --[[ Name: mapStateToProps ]]
    return {
        topBarHeight = v223.TopBar and v223.TopBar.topBarHeight or 0
    };
end, nil)(v52);