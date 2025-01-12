local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_script_FirstAncestor_0.Service.LocalStore);
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Badge_0 = v5.App.Indicator.Badge;
local l_VerticalScrollView_0 = v5.App.Container.VerticalScrollView;
local l_ScrollBarType_0 = v5.App.Container.Enum.ScrollBarType;
local v18 = require(l_CorePackages_0.Packages.ReactOtter);
local v19 = require(l_script_FirstAncestor_0.Service);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v21 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local v22 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v23 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v24 = game:DefineFastFlag("RemoveSubMenuTopBarConstants", false);
local v25 = nil;
if not v24 then
    v25 = require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Constants);
end;
local v26 = require(l_script_FirstAncestor_0.Unibar.SubMenuContext);
local l_UserInputService_0 = game:GetService("UserInputService");
local v28 = require(l_script_FirstAncestor_0.Hooks.useChromeMenuItems);
local v29 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v30 = require(l_script_FirstAncestor_0.Hooks.useTopbarInsetHeight);
local l_GetFFlagEnableChromePinIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinIntegrations;
local l_GetFFlagUseNewPinIcon_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseNewPinIcon;
local l_GetFFlagKeepSubmenuOpenOnPin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagKeepSubmenuOpenOnPin;
local l_GetFFlagNewSubmenuTouchTargets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNewSubmenuTouchTargets;
local l_GetFFlagFixSubmenuCloseIOS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSubmenuCloseIOS;
local l_GetFFlagEnableCaptureBadge_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCaptureBadge;
local l_GetFIntNumTimesNewBadgeIsDisplayed_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntNumTimesNewBadgeIsDisplayed;
local l_GetFStringNewFeatureList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringNewFeatureList;
local l_GetFFlagAnimateSubMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAnimateSubMenu;
local l_GetFFlagEnableChromePinAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinAnalytics;
local v41 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local l_GetFFlagChromeUsePreferredTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeUsePreferredTransparency;
local l_GetFFlagPostLaunchUnibarDesignTweaks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPostLaunchUnibarDesignTweaks;
local v44 = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false);
local v45 = game:DefineFastFlag("SubmenuV4Layout2", false);
local v46 = game:DefineFastFlag("SubmenuFixInvisibleButtons", false);
local v47 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local l_SUB_MENU_ROW_HEIGHT_0 = v23.SUB_MENU_ROW_HEIGHT;
local v49 = l_SUB_MENU_ROW_HEIGHT_0 * 0.5;
local v50 = nil;
local v51 = nil;
if l_GetFFlagUseNewPinIcon_0() then
    v50 = l_Images_0["icons/controls/pinned_small"];
    v51 = l_Images_0["icons/controls/unpinned_small"];
else
    v50 = l_Images_0["icons/actions/edit/remove"];
    v51 = l_Images_0["icons/actions/edit/add"];
end;
local v52 = false;
local v53 = {};
local v54 = false;
local v55 = Vector2.new(0, 0);
local v56 = {
    Closed = 0, 
    Open = 1
};
local v57 = {};
local v58 = nil;
for v59 in string.gmatch(l_GetFStringNewFeatureList_0(), "([^, ]+)") do
    v53[v59] = true;
end;
ClearBadge = function(v60) --[[ Line: 101 ]] --[[ Name: ClearBadge ]]
    -- upvalues: v53 (copy), v6 (copy), l_GetFIntNumTimesNewBadgeIsDisplayed_0 (copy)
    if v53[v60] then
        v53[v60] = false;
        if v6.isEnabled() then
            local v61 = v6.loadForLocalPlayer("TimesSeenNewFeatures") or {};
            v61[v60] = l_GetFIntNumTimesNewBadgeIsDisplayed_0();
            v6.storeForLocalPlayer("TimesSeenNewFeatures", v61);
        end;
    end;
end;
MenuRow = function(v62) --[[ Line: 112 ]] --[[ Name: MenuRow ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v26 (copy), l_GetFFlagNewSubmenuTouchTargets_0 (copy), l_GetFFlagEnableChromePinIntegrations_0 (copy), v19 (copy), l_ControlState_0 (copy), v45 (copy), v23 (copy), v47 (copy), l_StyledTextLabel_0 (copy), l_GetFFlagAnimateSubMenu_0 (copy), l_Interactable_0 (copy), l_SUB_MENU_ROW_HEIGHT_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_GetFFlagKeepSubmenuOpenOnPin_0 (copy), l_GetFFlagEnableCaptureBadge_0 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), v44 (copy), v53 (copy), v54 (ref), l_ImageSetLabel_0 (copy), v50 (ref), v51 (ref), l_Badge_0 (copy)
    local v63 = l_useStyle_0();
    local l_Theme_0 = v63.Theme;
    local l_Font_0 = v63.Font;
    local v66 = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 1
    };
    local v67 = v4.useContext(v26);
    local v68 = l_GetFFlagNewSubmenuTouchTargets_0();
    local v69 = if l_GetFFlagEnableChromePinIntegrations_0() then v19:isUserPinned(v62.id) else nil;
    local v70 = if l_GetFFlagEnableChromePinIntegrations_0() then v19:areUserPinsFull() and not v69 else nil;
    local v71, v72 = v4.useBinding(v66);
    local v73, v74 = v4.useBinding(v66);
    local v77 = v4.useCallback(function(_, v76) --[[ Line: 132 ]]
        -- upvalues: l_ControlState_0 (ref), v72 (copy), l_Theme_0 (copy), v66 (copy)
        if v76 == l_ControlState_0.Pressed then
            v72(l_Theme_0.BackgroundOnPress);
            return;
        elseif v76 == l_ControlState_0.Hover then
            v72(l_Theme_0.BackgroundOnHover);
            return;
        else
            v72(v66);
            return;
        end;
    end);
    local v80 = v4.useCallback(function(_, v79) --[[ Line: 142 ]]
        -- upvalues: l_ControlState_0 (ref), v74 (copy), l_Theme_0 (copy), v66 (copy)
        if v79 == l_ControlState_0.Pressed then
            v74(l_Theme_0.BackgroundOnPress);
            return;
        elseif v79 == l_ControlState_0.Hover then
            v74(l_Theme_0.BackgroundOnHover);
            return;
        else
            v74(v66);
            return;
        end;
    end);
    local v81 = v4.useCallback(function() --[[ Line: 152 ]]
        -- upvalues: v62 (copy)
        ClearBadge(v62.id);
        v62.activated();
    end);
    local v83 = v4.createElement(v4.Fragment, nil, {
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = if v45 then UDim.new(0, v23.SUBMENU_PADDING) else if l_GetFFlagEnableChromePinIntegrations_0() then UDim.new(0, 12) else UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 8)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 8)
        }), 
        IconHost = v4.createElement(v47, {
            integration = v62, 
            disableButtonBehaviors = true
        }), 
        StyledTextLabel = v4.createElement(l_StyledTextLabel_0, {
            size = if v45 then UDim2.new(1, -v23.ICON_SIZE - v23.SUBMENU_PADDING * 2, 1, 0) else nil, 
            lineHeight = v45 and 1 or nil, 
            fontStyle = l_Font_0.Header2, 
            colorStyle = if l_GetFFlagAnimateSubMenu_0() and v67 then {
                Color = l_Theme_0.TextEmphasis.Color, 
                Transparency = v67:map(function(v82) --[[ Line: 190 ]]
                    return 1 - v82;
                end)
            } else l_Theme_0.TextEmphasis, 
            text = v62.integration.label, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            fluidSizing = not l_GetFFlagEnableChromePinIntegrations_0() or false, 
            richText = not l_GetFFlagEnableChromePinIntegrations_0() or false
        })
    });
    return v4.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 0, l_SUB_MENU_ROW_HEIGHT_0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = v71:map(function(v84) --[[ Line: 206 ]]
            return v84.Transparency;
        end), 
        BackgroundColor3 = v71:map(function(v85) --[[ Line: 209 ]]
            return v85.Color;
        end), 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
        AutoButtonColor = not l_GetFFlagKeepSubmenuOpenOnPin_0() and not v68 and nil, 
        [v4.Event.Activated] = if l_GetFFlagEnableCaptureBadge_0() then v81 else v62.activated, 
        LayoutOrder = v62.order, 
        onStateChanged = if v68 then nil else v77
    }, {
        UICorner = if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }) else nil, 
        ButtonTouchTarget = if v68 then v4.createElement(l_Interactable_0, {
            Size = UDim2.new(1, -v23.PIN_BUTTON_SIZE - v23.PIN_RIGHT_PADDING * 2, 0, l_SUB_MENU_ROW_HEIGHT_0), 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v4.Event.Activated] = if l_GetFFlagEnableCaptureBadge_0() then v81 else v62.activated, 
            Selectable = false, 
            onStateChanged = v77
        }) else nil, 
        RowLabel = if not not v44 or l_GetFFlagEnableChromePinIntegrations_0() then v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v62.order
        }, {
            v83
        }) else v83, 
        UserPin = if l_GetFFlagEnableChromePinIntegrations_0() then v4.createElement(l_Interactable_0, {
            Size = if l_GetFFlagEnableCaptureBadge_0() and v53[v62.id] then UDim2.new(0, v23.NEW_BADGE_SIZE, 0, v23.PIN_BUTTON_SIZE) else UDim2.new(0, v23.PIN_BUTTON_SIZE, 0, v23.PIN_BUTTON_SIZE), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = if l_GetFFlagEnableCaptureBadge_0() and v53[v62.id] then UDim2.new(1, -v23.NEW_BADGE_SIZE - v23.PIN_RIGHT_PADDING, 0.5, 0) else UDim2.new(1, -v23.PIN_BUTTON_SIZE - v23.PIN_RIGHT_PADDING, 0.5, 0), 
            BorderSizePixel = 0, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
            isDisabled = if l_GetFFlagKeepSubmenuOpenOnPin_0() then nil else v70, 
            Selectable = if l_GetFFlagKeepSubmenuOpenOnPin_0() then not v70 else nil, 
            [v4.Event.Activated] = function() --[[ Line: 256 ]]
                -- upvalues: l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v54 (ref), v70 (copy), v62 (copy)
                if l_GetFFlagKeepSubmenuOpenOnPin_0() then
                    v54 = true;
                    if not v70 then
                        ClearBadge(v62.id);
                        pinActivated(v62.id);
                        return;
                    end;
                else
                    ClearBadge(v62.id);
                    pinActivated(v62.id);
                end;
            end, 
            BackgroundTransparency = v73:map(function(v86) --[[ Line: 268 ]]
                -- upvalues: l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v70 (copy)
                if l_GetFFlagKeepSubmenuOpenOnPin_0() and v70 then
                    return 1;
                else
                    return v86.Transparency;
                end;
            end), 
            BackgroundColor3 = v73:map(function(v87) --[[ Line: 271 ]]
                return v87.Color;
            end), 
            LayoutOrder = 2, 
            AutoButtonColor = not l_GetFFlagNewSubmenuTouchTargets_0() and nil, 
            onStateChanged = if l_GetFFlagNewSubmenuTouchTargets_0() then nil else v80
        }, {
            PinTouchTarget = if l_GetFFlagNewSubmenuTouchTargets_0() then v4.createElement(l_Interactable_0, {
                Size = UDim2.new(0, v23.PIN_BUTTON_SIZE + v23.PIN_RIGHT_PADDING * 2, 0, l_SUB_MENU_ROW_HEIGHT_0), 
                Position = UDim2.new(0, 1 - v23.PIN_RIGHT_PADDING, 0, -(v23.SUB_MENU_ROW_HEIGHT - v23.PIN_BUTTON_SIZE) / 2), 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                Selectable = false, 
                [v4.Event.Activated] = function() --[[ Line: 290 ]]
                    -- upvalues: l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v54 (ref), v70 (copy), v62 (copy)
                    if l_GetFFlagKeepSubmenuOpenOnPin_0() then
                        v54 = true;
                        if not v70 then
                            ClearBadge(v62.id);
                            pinActivated(v62.id);
                            return;
                        end;
                    else
                        ClearBadge(v62.id);
                        pinActivated(v62.id);
                    end;
                end, 
                onStateChanged = v80
            }) else nil, 
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UserPinIcon = if l_GetFFlagEnableCaptureBadge_0() and v53[v62.id] then nil else v4.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundTransparency = 1, 
                Image = if v69 then v50 else v51, 
                Size = v23.PIN_ICON_SIZE, 
                ImageColor3 = v63.Theme.IconEmphasis.Color, 
                ImageTransparency = if l_GetFFlagAnimateSubMenu_0() and v67 then v67:map(function(v88) --[[ Line: 318 ]]
                    -- upvalues: v70 (copy), v63 (copy)
                    local v89 = if v70 then v63.Theme.UIEmphasis.Transparency else v63.Theme.IconEmphasis.Transparency;
                    return v89 + (1 - v89) * (1 - v88);
                end) else if v70 then v63.Theme.UIEmphasis.Transparency else v63.Theme.IconEmphasis.Transparency
            }), 
            NewBadge = if l_GetFFlagEnableCaptureBadge_0() and v53[v62.id] then v4.createElement(l_Badge_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                value = "NEW"
            }) else nil
        }) else nil
    });
end;
isLeft = function(v90) --[[ Line: 339 ]] --[[ Name: isLeft ]]
    return v90 == Enum.HorizontalAlignment.Left;
end;
pinActivated = function(v91) --[[ Line: 343 ]] --[[ Name: pinActivated ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy), v19 (copy), l_GetFFlagEnableChromePinAnalytics_0 (copy), v21 (copy)
    if not l_GetFFlagEnableChromePinIntegrations_0() then
        return;
    else
        if v19:isUserPinned(v91) then
            v19:removeUserPin(v91);
            if l_GetFFlagEnableChromePinAnalytics_0() then
                v21.default:setPin(v91, false, v19:userPins());
                return;
            end;
        else
            v19:setUserPin(v91);
            if l_GetFFlagEnableChromePinAnalytics_0() then
                v21.default:setPin(v91, true, v19:userPins());
            end;
        end;
        return;
    end;
end;
SubMenu = function(v92) --[[ Line: 361 ]] --[[ Name: SubMenu ]]
    -- upvalues: l_GetFFlagEnableCaptureBadge_0 (copy), v52 (ref), v6 (copy), v53 (copy), l_GetFIntNumTimesNewBadgeIsDisplayed_0 (copy), l_useStyle_0 (copy), v4 (copy), v29 (copy), v22 (copy), v24 (copy), v30 (copy), v23 (copy), v25 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy), v19 (copy), l_SUB_MENU_ROW_HEIGHT_0 (copy), v49 (copy), l_GetFFlagAnimateSubMenu_0 (copy), l_UserGameSettings_0 (copy), v41 (copy), l_GetFFlagChromeUsePreferredTransparency_0 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), v45 (copy), l_VerticalScrollView_0 (copy), l_ScrollBarType_0 (copy)
    if l_GetFFlagEnableCaptureBadge_0() and not v52 then
        v52 = true;
        if v6.isEnabled() then
            local v93 = v6.loadForLocalPlayer("TimesSeenNewFeatures") or {};
            for v94, v95 in pairs(v53) do
                if v95 then
                    v93[v94] = (v93[v94] or 0) + 1;
                    if v93[v94] > l_GetFIntNumTimesNewBadgeIsDisplayed_0() then
                        v53[v94] = false;
                    end;
                end;
            end;
            v6.storeForLocalPlayer("TimesSeenNewFeatures", v93);
        end;
    end;
    local v96 = l_useStyle_0();
    local l_Theme_1 = v96.Theme;
    local v98 = v4.useRef(nil);
    local v99 = v29(v22.screenSize);
    local v100 = nil;
    local v101 = nil;
    if v24 then
        v100 = v30();
        v101 = v23.UNIBAR_LEFT_MARGIN;
    else
        v100 = v25.TopBarHeight;
        v101 = v25.Padding;
    end;
    v4.useEffect(function() --[[ Line: 398 ]]
        -- upvalues: l_UserInputService_0 (ref), v98 (copy), l_GuiService_0 (ref), v19 (ref)
        local v104 = l_UserInputService_0.InputBegan:Connect(function(v102) --[[ Line: 400 ]]
            -- upvalues: v98 (ref), l_GuiService_0 (ref), v19 (ref)
            local l_KeyCode_0 = v102.KeyCode;
            if l_KeyCode_0 == Enum.KeyCode.Left or l_KeyCode_0 == Enum.KeyCode.DPadLeft then
                if v98.current and v98.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                    v19:setSelectedByOffset(-1);
                    return;
                end;
            elseif (l_KeyCode_0 == Enum.KeyCode.Right or l_KeyCode_0 == Enum.KeyCode.DPadRight) and v98.current and v98.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                v19:setSelectedByOffset(1);
            end;
        end);
        return function() --[[ Line: 416 ]]
            -- upvalues: v104 (copy)
            v104:Disconnect();
        end;
    end, {});
    local v105 = v100 + v23.ICON_CELL_WIDTH;
    local v106 = if v92 and v92.items then l_SUB_MENU_ROW_HEIGHT_0 * #v92.items else 0;
    local v107 = math.min(v99.Y - v105, v106);
    if v99.Y - v105 < v106 then
        local v108 = math.floor((v99.Y - v105) / l_SUB_MENU_ROW_HEIGHT_0);
        v107 = if l_SUB_MENU_ROW_HEIGHT_0 * v108 + v49 <= v99.Y - v105 then l_SUB_MENU_ROW_HEIGHT_0 * v108 + v49 else l_SUB_MENU_ROW_HEIGHT_0 * v108 - v49;
    end;
    local v110 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UISizeConstraint = v4.createElement("UISizeConstraint", {
            MinSize = if not (not l_GetFFlagAnimateSubMenu_0() or l_UserGameSettings_0.ReducedMotion) and v92.menuTransition then v92.menuTransition:map(function(v109) --[[ Line: 446 ]]
                -- upvalues: v107 (ref)
                return Vector2.new(0, v107 * v109);
            end) else Vector2.new(0, v107)
        }), 
        BottomPadding = v4.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10000
        })
    };
    for _, v112 in v92.items do
        v110[v112.id] = v4.createElement(MenuRow, v112);
    end;
    local v113 = v41(v19:orderAlignment(), isLeft);
    local v114 = if l_GetFFlagChromeUsePreferredTransparency_0() then v96.Theme.BackgroundUIContrast.Transparency * v96.Settings.PreferredTransparency else v96.Theme.BackgroundUIContrast.Transparency;
    return v4.createElement("Frame", {
        Size = if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then UDim2.new(0, v23.ICON_CELL_WIDTH * 4 + v101 + v23.UNIBAR_END_PADDING * 2, 0, 0) else if v45 then UDim2.new(0, v100 + v23.ICON_CELL_WIDTH * 3, 0, 0) else UDim2.new(0, 240, 0, 0), 
        AnchorPoint = if v113 then Vector2.zero else Vector2.new(1, 0), 
        Position = if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then UDim2.new(0, -v100 - 2 + v101, 0, 0) else if v45 then UDim2.new(0, -v100 + 2, 0, 0) else if v113 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Theme_1.BackgroundUIContrast.Color, 
        BackgroundTransparency = if l_GetFFlagAnimateSubMenu_0() and v92.menuTransition then v92.menuTransition:map(function(v115) --[[ Line: 481 ]]
            -- upvalues: v114 (copy)
            return v114 + (1 - v114) * (1 - v115);
        end) else v114, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v98
    }, {
        UIPadding = if not l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8)
        }) else nil, 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        ScrollingFrame = v4.createElement(l_VerticalScrollView_0, {
            size = UDim2.new(1, 0, 1, 0), 
            canvasSizeY = UDim.new(0, v106), 
            selectable = false, 
            scrollBarType = l_ScrollBarType_0.Compact
        }, v110)
    });
end;
return function(_) --[[ Line: 508 ]]
    -- upvalues: v4 (copy), v29 (copy), v19 (copy), v56 (copy), v28 (copy), v18 (copy), l_GetFFlagAnimateSubMenu_0 (copy), v57 (ref), v58 (ref), v46 (copy), v23 (copy), l_GetFFlagFixSubmenuCloseIOS_0 (copy), l_UserInputService_0 (copy), v55 (ref), l_GetFFlagKeepSubmenuOpenOnPin_0 (copy), v54 (ref), v26 (copy)
    local v117 = {};
    local v118 = v4.useRef(nil);
    local v119 = v4.useRef(nil);
    local v120 = v4.useRef(nil);
    local v121 = v29(v19:currentSubMenu());
    local _, v123 = v4.useState(v56.Closed);
    local v124 = v28();
    local v125 = {};
    local v127, v128 = v18.useAnimatedBinding(v56.Closed, function(v126) --[[ Line: 521 ]]
        -- upvalues: v123 (copy)
        v123(v126);
    end);
    v4.useEffect(function() --[[ Line: 526 ]]
        -- upvalues: l_GetFFlagAnimateSubMenu_0 (ref), v57 (ref), v125 (ref), v58 (ref), v121 (copy), v46 (ref), v123 (copy), v56 (ref), v128 (copy), v18 (ref), v23 (ref), l_GetFFlagFixSubmenuCloseIOS_0 (ref), v120 (copy), l_UserInputService_0 (ref), v55 (ref), v119 (copy), v19 (ref), l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v54 (ref), v118 (copy)
        if l_GetFFlagAnimateSubMenu_0() then
            v57 = v125;
            v58 = v121;
        end;
        if v121 then
            if l_GetFFlagAnimateSubMenu_0() then
                if v46 then
                    v123(v56.Closed);
                end;
                v128(v18.spring(v56.Open, v23.MENU_ANIMATION_SPRING));
            end;
            if l_GetFFlagFixSubmenuCloseIOS_0() then
                v120.current = l_UserInputService_0.TouchStarted:Connect(function(v129) --[[ Line: 541 ]]
                    -- upvalues: v55 (ref)
                    v55 = Vector2.new(v129.Position.X, v129.Position.Y);
                end);
            end;
            v119.current = l_UserInputService_0.TouchTap:Connect(function(v130) --[[ Line: 546 ]]
                -- upvalues: l_GetFFlagFixSubmenuCloseIOS_0 (ref), v55 (ref), v19 (ref), l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v54 (ref)
                if l_GetFFlagFixSubmenuCloseIOS_0() and v130[1] - v55 ~= Vector2.zero then
                    return;
                else
                    local v131 = v19:currentSubMenu():get();
                    if v131 then
                        if l_GetFFlagKeepSubmenuOpenOnPin_0() and v54 then
                            v54 = false;
                            return;
                        else
                            v19:toggleSubMenu(v131);
                        end;
                    end;
                    return;
                end;
            end);
            v118.current = l_UserInputService_0.InputEnded:Connect(function(v132, _) --[[ Line: 562 ]]
                -- upvalues: v19 (ref), l_GetFFlagKeepSubmenuOpenOnPin_0 (ref), v54 (ref)
                local v134 = v132.UserInputType == Enum.UserInputType.MouseButton1;
                local v135 = v19:currentSubMenu():get();
                if v135 and v134 then
                    if l_GetFFlagKeepSubmenuOpenOnPin_0() and v54 then
                        v54 = false;
                        return;
                    else
                        v19:toggleSubMenu(v135);
                    end;
                end;
            end);
        elseif l_GetFFlagAnimateSubMenu_0() then
            if v46 then
                v123(v56.Open);
            end;
            v128(v18.spring(v56.Closed, v23.MENU_ANIMATION_SPRING));
        end;
        return function() --[[ Line: 583 ]]
            -- upvalues: v118 (ref), v119 (ref), v120 (ref)
            if v118.current then
                v118.current:Disconnect();
                v118.current = nil;
            end;
            if v119.current then
                v119.current:Disconnect();
                v119.current = nil;
            end;
            if v120.current then
                v120.current:Disconnect();
                v120.current = nil;
            end;
        end;
    end, {
        v121
    });
    if v121 and v124 then
        for _, v137 in v124 do
            if v121 == v137.id then
                v125 = v137.children;
                break;
            end;
        end;
    end;
    if #v125 > 0 then
        v117[v121] = v4.createElement(SubMenu, {
            items = v125, 
            menuTransition = if l_GetFFlagAnimateSubMenu_0() then v127 else nil
        });
    elseif l_GetFFlagAnimateSubMenu_0() and #v57 > 0 then
        v117[v58] = v4.createElement(SubMenu, {
            items = v57, 
            menuTransition = v127
        });
    end;
    return v4.createElement("Frame", {
        Name = "SubMenuHost", 
        Size = UDim2.new(0, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, if l_GetFFlagAnimateSubMenu_0() then v4.createElement(v26.Provider, {
        value = v127
    }, v117) else v117);
end;