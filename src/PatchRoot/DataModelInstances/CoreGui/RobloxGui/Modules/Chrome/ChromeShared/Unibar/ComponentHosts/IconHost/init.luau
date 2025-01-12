local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Badge_0 = v5.App.Indicator.Badge;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local l_Badge_1 = v7.Badge;
local l_BadgeVariant_0 = v7.Enums.BadgeVariant;
local l_BadgeSize_0 = v7.Enums.BadgeSize;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_withTooltip_0 = v5.App.Dialog.TooltipV2.withTooltip;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v17 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v18 = require(l_script_FirstAncestor_0.Service);
local v19 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v21 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromeAnalytics();
local v22 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagWindowFixes();
local v23 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v24 = require(l_script_FirstAncestor_0.Hooks.useNotificationCount);
local v25 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v26 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValueBinding);
local v27 = require(l_script_FirstAncestor_0.Hooks.useTimeHysteresis);
local v28 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_GetFFlagFixUnibarVirtualCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixUnibarVirtualCursor;
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local l_FFlagReplaceChromeNotificationBadge_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReplaceChromeNotificationBadge;
local v32 = 20;
local v33 = 0;
if l_FFlagReplaceChromeNotificationBadge_0 then
    v32 = 24;
    v33 = 5;
end;
local v34 = {};
areTooltipsDisplaying = function() --[[ Line: 63 ]] --[[ Name: areTooltipsDisplaying ]]
    -- upvalues: v34 (copy)
    local v35 = tick();
    for _, v37 in v34 do
        if v37.displaying or v35 - v37.time < 0.15 then
            return true;
        end;
    end;
    return false;
end;
logTooltipState = function(v38, v39) --[[ Line: 74 ]] --[[ Name: logTooltipState ]]
    -- upvalues: v34 (copy)
    if not v34[v38] or v34[v38].displaying ~= v39 then
        v34[v38] = {
            displaying = v39, 
            time = tick()
        };
    end;
end;
NotificationBadge = function(v40) --[[ Line: 92 ]] --[[ Name: NotificationBadge ]]
    -- upvalues: v24 (copy), v25 (copy), v18 (copy), l_FFlagReplaceChromeNotificationBadge_0 (copy), v4 (copy), l_Badge_0 (copy), v32 (ref), v33 (ref), l_Badge_1 (copy), l_BadgeVariant_0 (copy), l_BadgeSize_0 (copy)
    if not v40.integration then
        return nil;
    else
        local v41 = v24(v40.integration.integration);
        if v25(v18:currentSubMenu(), function(v42) --[[ Line: 99 ]]
            -- upvalues: v40 (copy)
            return v42 == v40.integration.id;
        end) then
            v41 = 0;
        end;
        local v43 = false;
        if v40.integration and v40.integration.integration then
            v43 = v40.integration.integration.hideNotificationCountWhileOpen or false;
        end;
        local v44 = nil;
        if l_FFlagReplaceChromeNotificationBadge_0 and v41 > 0 then
            v44 = v41 > 99 and "99" or tostring(v41);
        end;
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = not v40.toggleTransition or v40.toggleTransition:map(function(v45) --[[ Line: 126 ]]
                -- upvalues: v43 (ref)
                if v43 then
                    return v45 < 0.5;
                else
                    return true;
                end;
            end) or true, 
            ZIndex = 2
        }, {
            Badge = if v41 > 0 then if l_FFlagReplaceChromeNotificationBadge_0 then if v44 then v4.createElement(l_Badge_1, {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, v32, 0, v33), 
                variant = l_BadgeVariant_0.Primary, 
                size = l_BadgeSize_0.Small, 
                text = v44
            }) else nil else v4.createElement(l_Badge_0, {
                position = UDim2.fromOffset(v32, v33), 
                anchorPoint = Vector2.new(0, 0), 
                hasShadow = false, 
                value = v41
            }) else nil
        });
    end;
end;
NotificationIndicator = function(v46) --[[ Line: 160 ]] --[[ Name: NotificationIndicator ]]
    -- upvalues: v23 (copy), v18 (copy), v4 (copy)
    local v47 = v23(v18:notificationIndicator());
    v46.setIconVisible(not v47 or false);
    return (v4.createElement("Frame", {
        Name = "NotificationIndicatorFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        IntegrationIcon = v47 and v47.component(v46) or nil, 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }));
end;
HighlightCircle = function(v48) --[[ Line: 179 ]] --[[ Name: HighlightCircle ]]
    -- upvalues: v4 (copy)
    return v4.createElement("Frame", {
        Name = v48.name or "Highlighter", 
        Size = UDim2.new(0, 36, 0, 36), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = v48.color.Color, 
        BackgroundTransparency = v48.color.Transparency, 
        BorderSizePixel = 0, 
        Visible = v48.visible
    }, {
        corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
TooltipButton = function(v49) --[[ Line: 201 ]] --[[ Name: TooltipButton ]]
    -- upvalues: v4 (copy), v27 (copy), l_GetFFlagFixUnibarVirtualCursor_0 (copy), l_ControlState_0 (copy), v18 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v21 (copy), v19 (copy), l_UserInputService_0 (copy), v28 (copy), v22 (copy), v17 (copy), l_Interactable_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_withTooltip_0 (copy), l_CoreGui_0 (copy)
    local v50 = v4.useRef(nil);
    local l_secondaryAction_0 = v49.integration.integration.secondaryAction;
    local v52 = v49.integration.integration.draggable or false;
    local v53 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 209 ]]
        -- upvalues: v53 (copy)
        return function() --[[ Line: 210 ]]
            -- upvalues: v53 (ref)
            if v53.current then
                v53.current:Disconnect();
                v53.current = nil;
            end;
        end;
    end, {});
    local v54 = nil;
    local v55 = nil;
    if l_secondaryAction_0 then
        local v56, v57 = v27(0.05, 0.15, 0.35);
        v54 = v56;
        v55 = v57;
    else
        local v58, v59 = v27(0.6, 0.65, 0.7);
        v54 = v58;
        v55 = v59;
    end;
    local v60, v61 = v27(0, 0, 0.65);
    local v62, v63 = v4.useState(false);
    local v64, v65 = v27(0, 1);
    local v70 = v4.useCallback(function(v66, v67) --[[ Line: 233 ]]
        -- upvalues: l_GetFFlagFixUnibarVirtualCursor_0 (ref), l_ControlState_0 (ref), v18 (ref), v49 (copy), v55 (ref), v60 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v65 (copy)
        if l_GetFFlagFixUnibarVirtualCursor_0() and v67 == l_ControlState_0.Selected and (v66 == l_ControlState_0.Default or v66 == l_ControlState_0.Hover) then
            v18:setSelected(v49.integration.id);
        elseif v67 == l_ControlState_0.Selected and v66 == l_ControlState_0.Default then
            v18:setSelected(v49.integration.id);
        end;
        local v68 = v67 ~= l_ControlState_0.Default;
        v49.setHovered(v68);
        local v69 = v67 == l_ControlState_0.Hover;
        v55(v69, v69 and v60 or areTooltipsDisplaying());
        if l_FFlagEnableUnibarFtuxTooltips_0 and v69 then
            v18:onIntegrationHovered():fire(v49.integration.id);
        end;
        if not v68 then
            v65(false);
        end;
    end, {
        v49.setHovered, 
        v55, 
        v65, 
        v60
    });
    local v77 = v4.useCallback(function(_, v72) --[[ Line: 256 ]]
        -- upvalues: v52 (copy), v65 (copy), v21 (ref), v19 (ref), v49 (copy), v53 (copy), l_UserInputService_0 (ref), v28 (ref), v22 (ref), v18 (ref), v17 (ref)
        if not v52 then
            return;
        else
            if v72.UserInputType == Enum.UserInputType.MouseButton1 or v72.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v72.Position;
                v65(true, true);
                if v21 then
                    v19.default:onIconTouchBegan(v49.integration.id);
                end;
                if not v53.current then
                    v53.current = l_UserInputService_0.InputChanged:Connect(function(v74, _) --[[ Line: 271 ]]
                        -- upvalues: v28 (ref), v72 (copy), v22 (ref), v18 (ref), v49 (ref), v53 (ref), l_Position_0 (copy), v17 (ref), v21 (ref), v19 (ref)
                        if v28(v72, v74) then
                            return;
                        elseif v22 and (v18:isWindowOpen(v49.integration.id) or not v53.current) then
                            return;
                        else
                            local l_Position_1 = v74.Position;
                            if math.abs((l_Position_0 - l_Position_1).Magnitude) > v17.DRAG_MAGNITUDE_THRESHOLD then
                                if v21 then
                                    v19.default:onIconDrag(v49.integration.id);
                                end;
                                v18:storeChromeInteracted();
                                v18:toggleWindow(v49.integration.id);
                                v18:gesture(v49.integration.id, v53, v72);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end, {
        v52
    });
    local v80 = v4.useCallback(function(_, v79) --[[ Line: 302 ]]
        -- upvalues: v52 (copy), v65 (copy), v53 (copy), v18 (ref), v49 (copy)
        if not v52 then
            return;
        else
            if v79.UserInputType == Enum.UserInputType.MouseButton1 or v79.UserInputType == Enum.UserInputType.Touch then
                v65(false);
                if v53.current then
                    v53.current:Disconnect();
                    v53.current = nil;
                    v18:gesture(v49.integration.id, nil);
                end;
            end;
            return;
        end;
    end, {
        v52
    });
    local v81 = (not not v54 or v60 or v62) and not v64;
    logTooltipState(v49.integration.id, v81);
    local v85 = v4.useCallback(function(v82) --[[ Line: 322 ]]
        -- upvalues: v4 (ref), l_Interactable_0 (ref), v49 (copy), v70 (copy), v50 (copy), l_useSelectionCursor_0 (ref), l_CursorKind_0 (ref), v81 (copy), l_secondaryAction_0 (copy), v77 (copy), v80 (copy), v65 (copy), v53 (copy), v18 (ref)
        return v4.createElement(l_Interactable_0, {
            Name = "IconHitArea_" .. v49.integration.id, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            onStateChanged = v70, 
            ref = v50, 
            SelectionOrder = 100 - v49.integration.order, 
            Position = v49.isCurrentlyOpenSubMenu:map(function(v83) --[[ Line: 331 ]]
                return UDim2.new(0, 0, 0, v83 and 1 or 0);
            end), 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.SelectedKnob), 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = v49.isCurrentlyOpenSubMenu:map(function(v84) --[[ Line: 337 ]]
                -- upvalues: v81 (ref), l_secondaryAction_0 (ref)
                if v81 and l_secondaryAction_0 or v84 then
                    return Enum.SelectionBehavior.Escape;
                else
                    return Enum.SelectionBehavior.Stop;
                end;
            end), 
            [v4.Change.AbsolutePosition] = v82, 
            [v4.Change.AbsoluteSize] = v82, 
            [v4.Event.InputBegan] = v77, 
            [v4.Event.InputEnded] = v80, 
            [v4.Event.Activated] = function() --[[ Line: 348 ]]
                -- upvalues: v65 (ref), v49 (ref), v53 (ref), v18 (ref)
                v65(true, true);
                v49.integration.activated();
                if v53.current then
                    v53.current:Disconnect();
                    v53.current = nil;
                    v18:gesture(v49.integration.id, nil);
                end;
            end
        });
    end, {
        v70, 
        v55, 
        v65, 
        v77, 
        v80, 
        v49.isCurrentlyOpenSubMenu, 
        v81, 
        l_secondaryAction_0
    });
    local v86 = v4.useRef(nil);
    local v92 = v4.useCallback(function(v87) --[[ Line: 372 ]]
        -- upvalues: v86 (copy), v61 (copy)
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local function v91() --[[ Line: 379 ]]
            -- upvalues: v88 (ref), v89 (ref), v90 (ref)
            if v88 then
                v88:disconnect();
                v88 = nil;
            end;
            if v89 then
                v89:disconnect();
                v89 = nil;
            end;
            if v90 then
                v90:disconnect();
                v90 = nil;
            end;
        end;
        if v87 ~= v86.current then
            pcall(v91);
            if v87 then
                v88 = v87.MouseEnter:Connect(function() --[[ Line: 397 ]]
                    -- upvalues: v61 (ref)
                    v61(true, true);
                end);
                v89 = v87.MouseLeave:Connect(function() --[[ Line: 400 ]]
                    -- upvalues: v61 (ref)
                    v61(false);
                end);
                v90 = v87.Destroying:Connect(function() --[[ Line: 403 ]]
                    -- upvalues: v61 (ref)
                    v61(false);
                end);
            end;
            v86.current = v87;
        end;
    end, {
        v61
    });
    return l_withTooltip_0({
        headerText = v49.integration.integration.label, 
        hotkeyCodes = v49.integration.integration.hotkeyCodes, 
        textAlignment = Enum.TextXAlignment.Left, 
        buttonProps = if l_secondaryAction_0 then {
            text = l_secondaryAction_0.label, 
            onStateChanged = function(_, v94) --[[ Line: 418 ]] --[[ Name: onStateChanged ]]
                -- upvalues: l_ControlState_0 (ref), v63 (copy)
                if v94 == l_ControlState_0.Selected then
                    v63(true);
                    return;
                else
                    v63(false);
                    return;
                end;
            end, 
            onActivated = function() --[[ Line: 425 ]] --[[ Name: onActivated ]]
                -- upvalues: l_secondaryAction_0 (copy), v49 (copy)
                l_secondaryAction_0.activated(v49.integration);
            end, 
            NextSelectionUp = v50, 
            NextSelectionLeft = v50, 
            NextSelectionRight = v50, 
            NextSelectionDown = v50
        } else nil, 
        ref = if l_secondaryAction_0 then v92 else nil
    }, {
        active = v81, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 10
    }, v85);
end;
IconHost = function(v95) --[[ Line: 444 ]] --[[ Name: IconHost ]]
    -- upvalues: v4 (copy), l_useStyle_0 (copy), v26 (copy), v18 (copy), v17 (copy)
    if not v95.integration or not v95.integration.component then
        warn("IconHost has no component to render");
    end;
    local v96, v97 = v4.useBinding(false);
    local v98, v99 = v4.useBinding(true);
    local l_BackgroundOnHover_0 = l_useStyle_0().Theme.BackgroundOnHover;
    local v102 = v26(v18:currentSubMenu(), function(v101) --[[ Line: 458 ]]
        -- upvalues: v95 (copy)
        return v101 == v95.integration.id;
    end);
    return v4.createElement("Frame", {
        Size = UDim2.new(0, v17.ICON_CELL_WIDTH, 0, v17.ICON_CELL_WIDTH), 
        LayoutOrder = v95.integration.order, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v95.position, 
        Visible = v95.visible, 
        ZIndex = v95.integration.order
    }, {
        v4.createElement("Frame", {
            Name = "IntegrationIconFrame", 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Visible = v98
        }, {
            IntegrationIcon = v95.integration and v95.integration.component and v95.integration.component(v95) or nil, 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        }), 
        if v95.integration.integration.flashNotificationSource then v4.createElement(NotificationIndicator, {
            integration = v95.integration, 
            setIconVisible = v99
        }) else nil, 
        v4.createElement(HighlightCircle, {
            name = "SelectedHighlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v102
        }), 
        v4.createElement(HighlightCircle, {
            name = "Highlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v96
        }), 
        v4.createElement(NotificationBadge, v95), 
        if v95.disableButtonBehaviors then nil else v4.createElement(TooltipButton, {
            integration = v95.integration, 
            setHovered = v97, 
            isCurrentlyOpenSubMenu = v102
        })
    });
end;
return IconHost;