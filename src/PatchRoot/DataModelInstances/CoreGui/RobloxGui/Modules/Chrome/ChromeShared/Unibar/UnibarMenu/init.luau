local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v4 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.Service);
local v7 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local l_GetFFlagChromeCentralizedConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration;
local _ = if l_GetFFlagChromeCentralizedConfiguration_0() then nil else require(l_script_FirstAncestor_0.Parent.Integrations);
local v10 = require(l_script_FirstAncestor_0.Unibar.SubMenu);
local v11 = require(l_script_FirstAncestor_0.Unibar.WindowManager);
local v12 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v13 = require(l_script_FirstAncestor_0.Hooks.useChromeMenuItems);
local v14 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v15 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v16 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local v17 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.ContainerHost);
local v18 = require(l_CorePackages_0.Packages.ReactOtter);
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
local l_GetFFlagEnableSaveUserPins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSaveUserPins;
local l_GetFFlagEnableChromePinAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinAnalytics;
local l_GetFFlagEnableChromePinIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinIntegrations;
local l_GetFFlagEnablePartyMicIconInChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePartyMicIconInChrome;
local l_GetFFlagUsePolishedAnimations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUsePolishedAnimations;
local l_GetFFlagAnimateSubMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAnimateSubMenu;
local l_GetFIntIconSelectionTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntIconSelectionTimeout;
local v27 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagEnableSongbirdInChrome);
local l_GetFFlagEnableJoinVoiceOnUnibar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableJoinVoiceOnUnibar;
local l_GetFFlagChromeUsePreferredTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeUsePreferredTransparency;
local l_GetFFlagPostLaunchUnibarDesignTweaks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPostLaunchUnibarDesignTweaks;
local v31 = game:DefineFastFlag("ReshufflePartyIconsInUnibar", false);
local v32 = game:DefineFastFlag("FixUnibarResizing", false);
local v33 = require(l_script_FirstAncestor_0.Parent.Integrations.Party.Constants);
local v34 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectUnibarEnabled);
local v35 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectDropdownEnabled);
if not l_GetFFlagChromeCentralizedConfiguration_0() then
    configureUnibar = function() --[[ Line: 63 ]] --[[ Name: configureUnibar ]]
        -- upvalues: l_GetFFlagEnablePartyMicIconInChrome_0 (copy), v31 (copy), v33 (copy), v35 (copy), l_GetFFlagEnableChromePinIntegrations_0 (copy), v6 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), l_GetFFlagEnableChromePinAnalytics_0 (copy), v7 (copy), l_GetFFlagEnableJoinVoiceOnUnibar_0 (copy), l_GetFFlagDebugEnableUnibarDummyIntegrations_0 (copy), v34 (copy), v27 (copy)
        local v36 = {
            "leaderboard", 
            "emotes", 
            "backpack"
        };
        local v37 = if not l_GetFFlagEnablePartyMicIconInChrome_0() or v31 then {} else {
            v33.TOGGLE_MIC_INTEGRATION_ID
        };
        table.insert(v36, "respawn");
        table.insert(v36, 1, "trust_and_safety");
        if v35() then
            table.insert(v36, 1, "connect_dropdown");
        end;
        if l_GetFFlagEnableChromePinIntegrations_0() and not v6:isUserPinned("trust_and_safety") and not l_GetFFlagEnableSaveUserPins_0() then
            v6:setUserPin("trust_and_safety", true);
            if l_GetFFlagEnableChromePinAnalytics_0() then
                v7.default:setPin("trust_and_safety", true, v6:userPins());
            end;
        end;
        local v38 = {
            "toggle_mic_mute", 
            "chat", 
            "nine_dot"
        };
        if l_GetFFlagEnableJoinVoiceOnUnibar_0() then
            table.insert(v38, 2, "join_voice");
        end;
        if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then
            table.insert(v38, 1, "dummy_window");
            table.insert(v38, 1, "dummy_window_2");
            table.insert(v38, 1, "dummy_container");
        end;
        if v34() then
            if v31 then
                table.insert(v38, 1, "connect_unibar");
            else
                local v39 = table.find(v38, "chat");
                if v39 then
                    table.insert(v38, v39 + 1, "connect_unibar");
                end;
            end;
        end;
        if v31 then
            local v40 = table.find(v38, "toggle_mic_mute");
            if v40 then
                table.insert(v38, v40 + 1, v33.TOGGLE_MIC_INTEGRATION_ID);
            end;
        end;
        v6:configureMenu({
            v37, 
            v38
        });
        table.insert(v36, 2, "camera_entrypoint");
        table.insert(v36, 2, "selfie_view");
        if v27() then
            table.insert(v36, 4, "music_entrypoint");
        end;
        v6:configureSubMenu("nine_dot", v36);
    end;
    configureUnibar();
end;
IconDivider = function(v41) --[[ Line: 150 ]] --[[ Name: IconDivider ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v12 (copy), l_GetFFlagUsePolishedAnimations_0 (copy)
    local v42 = l_useStyle_0();
    return v4.createElement("Frame", {
        Position = v41.position, 
        Size = UDim2.new(0, v12.DIVIDER_CELL_WIDTH, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        DividerBar = v4.createElement("Frame", {
            Position = UDim2.new(0, 2, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, 1, 0, 28), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v42.Theme.Divider.Color, 
            BackgroundTransparency = if l_GetFFlagUsePolishedAnimations_0() and v41.toggleTransition then v41.toggleTransition:map(function(v43) --[[ Line: 166 ]]
                -- upvalues: v42 (copy)
                return v42.Theme.Divider.Transparency + (1 - v43) * (1 - v42.Theme.Divider.Transparency);
            end) else v42.Theme.Divider.Transparency, 
            Visible = v41.visible or true
        })
    });
end;
AnimationStateHelper = function(v44) --[[ Line: 177 ]] --[[ Name: AnimationStateHelper ]]
    -- upvalues: v14 (copy), v6 (copy), v4 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v18 (copy), v12 (copy), l_GetFFlagUsePolishedAnimations_0 (copy), l_GetFIntIconSelectionTimeout_0 (copy)
    local v45 = v14(v6:currentSubMenu());
    local v46 = v14(v6:selectedItem());
    local v47 = v14(v6:inFocusNav());
    v4.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: v47 (copy), l_ContextActionService_0 (ref), v6 (ref), v44 (copy), l_GuiService_0 (ref)
        if v47 then
            l_ContextActionService_0:BindCoreAction("RBXEscapeUnibar", function() --[[ Line: 185 ]]
                -- upvalues: v6 (ref)
                v6:disableFocusNav();
            end, false, Enum.KeyCode.ButtonB);
            if v44.menuFrameRef.current then
                l_GuiService_0:Select(v44.menuFrameRef.current);
                return;
            end;
        else
            l_ContextActionService_0:UnbindCoreAction("RBXEscapeUnibar");
            if l_GuiService_0.SelectedCoreObject and v44.menuFrameRef.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end, {
        v47
    });
    v4.useEffect(function() --[[ Line: 204 ]]
        -- upvalues: v45 (copy), v44 (copy), v18 (ref), v12 (ref)
        if v45 == "nine_dot" then
            v44.setToggleSubmenuTransition((v18.spring(1, v12.MENU_ANIMATION_SPRING)));
            return;
        else
            v44.setToggleSubmenuTransition((v18.spring(0, v12.MENU_ANIMATION_SPRING)));
            return;
        end;
    end, {
        v45
    });
    v4.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: l_GetFFlagUsePolishedAnimations_0 (ref), l_GetFIntIconSelectionTimeout_0 (ref), v44 (copy), v46 (copy), l_GuiService_0 (ref)
        if l_GetFFlagUsePolishedAnimations_0() then
            local v50 = coroutine.create(function() --[[ Line: 214 ]]
                -- upvalues: l_GetFIntIconSelectionTimeout_0 (ref), v44 (ref), v46 (ref), l_GuiService_0 (ref)
                local v48 = 0;
                while true do
                    if v48 < l_GetFIntIconSelectionTimeout_0() then
                        v48 = v48 + 1;
                        task.wait();
                        if v44.menuFrameRef.current and v46 then
                            local l_FirstChild_0 = v44.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v46, true);
                            if l_FirstChild_0 then
                                l_GuiService_0.SelectedCoreObject = l_FirstChild_0;
                                return;
                            end;
                        end;
                    else
                        return;
                    end;
                end;
            end);
            coroutine.resume(v50);
            return;
        else
            if v44.menuFrameRef.current and v46 then
                local l_FirstChild_1 = v44.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v46, true);
                if l_FirstChild_1 then
                    l_GuiService_0.SelectedCoreObject = l_FirstChild_1;
                end;
            end;
            return;
        end;
    end, {
        v46
    });
    return nil;
end;
linearInterpolation = function(v52, v53, v54) --[[ Line: 245 ]] --[[ Name: linearInterpolation ]]
    return v52 * (1 - v54) + v53 * v54;
end;
IconPositionBinding = function(v55, v56, v57, v58, v59, v60, v61, v62, v63) --[[ Line: 249 ]] --[[ Name: IconPositionBinding ]]
    -- upvalues: v4 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), v12 (copy)
    return (v4.joinBindings({
        v55, 
        v59, 
        v60
    }):map(function(v64) --[[ Line: 261 ]]
        -- upvalues: v63 (copy), v57 (copy), v56 (copy), v58 (copy), v62 (copy), v61 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (ref), v12 (ref)
        local v65 = 0;
        v65 = if v63.current then linearInterpolation(v57, v56, v64[2]) else linearInterpolation(v56, v57, v64[2]);
        local l_v58_0 = v58;
        if v62 and not v61 then
            l_v58_0 = v58 - v64[3];
        end;
        local v67 = v65 - l_v58_0;
        return UDim2.new(0, (if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v12.UNIBAR_END_PADDING else 0) + l_v58_0 + v67 * v64[1], 0, 0);
    end));
end;
isLeft = function(v68) --[[ Line: 292 ]] --[[ Name: isLeft ]]
    return v68 == Enum.HorizontalAlignment.Left;
end;
Unibar = function(v69) --[[ Line: 296 ]] --[[ Name: Unibar ]]
    -- upvalues: v4 (copy), v13 (copy), v6 (copy), v18 (copy), v32 (copy), v12 (copy), l_GetFFlagUsePolishedAnimations_0 (copy), v15 (copy), v17 (copy), v16 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), l_useStyle_0 (copy), l_GetFFlagChromeUsePreferredTransparency_0 (copy)
    local v70 = {};
    local v71 = v4.useRef({});
    local v72 = v4.useRef(Vector2.zero);
    local v73 = false;
    local v74 = v71.current or {};
    local v75 = v13();
    local v76 = v6:status():get() == v6.MenuStatus.Open;
    local v77, v78 = v18.useAnimatedBinding(v76 and 1 or 0);
    local v79, v80 = v18.useAnimatedBinding(v76 and 1 or 0);
    local v81, v82 = v18.useAnimatedBinding(v76 and 1 or 0);
    local v83, v84 = v18.useAnimatedBinding(0);
    local v85 = nil;
    if v32 then
        v85 = v4.useRef(0);
    end;
    local v86, v87 = v18.useAnimatedBinding(1);
    local v88 = v4.useRef(false);
    local v89 = v4.useRef(0);
    local v90 = v6:currentSubMenu():get() == "nine_dot";
    local v91, v92 = v18.useAnimatedBinding(v90 and 1 or 0);
    local v93 = {};
    local v94 = 0;
    local v95 = 0;
    local v96 = 0;
    local v97 = 0;
    local v98 = 0;
    local v101 = v4.useCallback(function(v99) --[[ Line: 332 ]]
        -- upvalues: v72 (copy), v6 (ref), v69 (copy), v12 (ref)
        local l_zero_0 = Vector2.zero;
        if v99 then
            l_zero_0 = v99.AbsolutePosition;
            if l_zero_0 ~= v72.current then
                v72.current = l_zero_0;
                v6:setMenuAbsolutePosition(l_zero_0);
            end;
        end;
        if v99 and v69.onAreaChanged then
            v69.onAreaChanged(v12.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, v99.AbsoluteSize);
        end;
    end, {});
    local v103 = v4.joinBindings({
        if l_GetFFlagUsePolishedAnimations_0() then v81 else v77, 
        v83
    }):map(function(v102) --[[ Line: 350 ]]
        -- upvalues: v97 (ref), v12 (ref)
        return UDim2.new(0, linearInterpolation(v97, v102[2], v102[1]), 0, v12.ICON_CELL_WIDTH);
    end);
    local v104 = v15(v6:orderAlignment(), isLeft);
    for _, v106 in v75 do
        if v106.integration.availability:get() == v6.AvailabilitySignal.Pinned then
            v94 = v94 + 1;
        end;
    end;
    local v107 = 0;
    v107 = v104 and 1 or math.max(v94 - 1, 0);
    for v108, v109 in v75 do
        if v109.isDivider then
            local v110 = v95 + v12.ICON_CELL_WIDTH * v107;
            local v111 = v74[v109.id] or v95;
            v70[v109.id] = v95;
            v73 = v73 or v111 ~= v95;
            local v112 = IconPositionBinding(if l_GetFFlagUsePolishedAnimations_0() then v79 else v77, v111, v95, v110, v86, v83, false, v104, v88);
            local v113 = nil;
            v113 = if v104 then v4.joinBindings({
                v112, 
                v103
            }):map(function(v114) --[[ Line: 392 ]]
                -- upvalues: v12 (ref)
                return v114[1].X.Offset >= v12.ICON_CELL_WIDTH * 0.5;
            end) else v4.joinBindings({
                v112, 
                v103
            }):map(function(v115) --[[ Line: 397 ]]
                -- upvalues: v12 (ref)
                local v116 = v115[1];
                local v117 = v115[2];
                return v116.X.Offset <= v117.X.Offset - v12.ICON_CELL_WIDTH;
            end);
            v93[v109.id or "icon" .. v108] = v4.createElement(IconDivider, {
                position = v112, 
                visible = v113, 
                toggleTransition = if l_GetFFlagUsePolishedAnimations_0() then v81 else nil
            });
            v95 = v95 + v12.DIVIDER_CELL_WIDTH;
        elseif v109.integration then
            local v118 = false;
            local v119 = v95 + v12.ICON_CELL_WIDTH * v107;
            if v109.integration.availability:get() == v6.AvailabilitySignal.Pinned then
                v118 = true;
                v119 = v96;
            end;
            local v120 = if v74[v109.id] == nil then v95 else v74[v109.id];
            v70[v109.id] = v95;
            v73 = v73 or v120 ~= v95;
            local v121 = IconPositionBinding(if l_GetFFlagUsePolishedAnimations_0() then v79 else v77, v120, v95, v119, v86, v83, v118, v104, v88);
            local v122 = nil;
            v122 = if v104 then v4.joinBindings({
                v121, 
                v103
            }):map(function(v123) --[[ Line: 436 ]]
                -- upvalues: v12 (ref)
                return v123[1].X.Offset >= v12.ICON_CELL_WIDTH * 0.5;
            end) else v4.joinBindings({
                v121, 
                v103
            }):map(function(v124) --[[ Line: 441 ]]
                -- upvalues: v12 (ref)
                local v125 = v124[1];
                local v126 = v124[2];
                return v125.X.Offset <= v126.X.Offset - v12.ICON_CELL_WIDTH * 1.5;
            end);
            if v109.integration.components.Container then
                local v127 = if v109.integration.containerWidthSlots then v109.integration.containerWidthSlots:get() else 0;
                v93[v109.id or "container" .. v108] = v4.createElement(v17, {
                    position = v121, 
                    visible = v118 or v122, 
                    integration = v109, 
                    containerWidthSlots = v127
                });
                v95 = v95 + v127 * v12.ICON_CELL_WIDTH;
                if v118 then
                    v96 = v96 + v127 * v12.ICON_CELL_WIDTH;
                end;
            else
                v93[v109.id or "icon" .. v108] = v4.createElement(v16, {
                    position = v121, 
                    visible = v118 or v122, 
                    toggleTransition = v91, 
                    integration = v109
                });
                v95 = v95 + v12.ICON_CELL_WIDTH;
                if v118 then
                    v96 = v96 + v12.ICON_CELL_WIDTH;
                end;
            end;
        end;
    end;
    v97 = v95;
    if v69.onMinWidthChanged then
        v69.onMinWidthChanged(v97);
    end;
    v98 = if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v12.UNIBAR_END_PADDING * 2 + v95 else v95;
    v4.useEffect(function() --[[ Line: 488 ]]
        -- upvalues: v32 (ref), v85 (ref), v83 (copy), v84 (copy), v18 (ref), v98 (ref), v12 (ref)
        local v128 = nil;
        v128 = if v32 then v85.current else v83:getValue();
        if v83:getValue() == 0 then
            v84((v18.instant(v98)));
            if v32 then
                v85.current = v98;
                return;
            end;
        elseif v128 ~= v98 then
            v84(v18.spring(v98, v12.MENU_ANIMATION_SPRING));
            if v32 then
                v85.current = v98;
            end;
        end;
    end, {
        v98
    });
    v4.useEffect(function() --[[ Line: 509 ]]
        -- upvalues: v6 (ref), v97 (ref), v12 (ref), v98 (ref)
        v6:setMenuAbsoluteSize(Vector2.new(v97, v12.ICON_CELL_WIDTH), Vector2.new(v98, v12.ICON_CELL_WIDTH));
    end, {
        v97, 
        v98
    });
    if v73 then
        v89.current = (v89.current or 0) + 1;
    end;
    v71.current = v70;
    v4.useEffect(function() --[[ Line: 521 ]]
        -- upvalues: v88 (copy), v87 (copy), v18 (ref), v12 (ref)
        if not v88.current then
            v87(v18.spring(0, v12.MENU_ANIMATION_SPRING));
            v88.current = true;
            return;
        else
            v87(v18.spring(1, v12.MENU_ANIMATION_SPRING));
            v88.current = false;
            return;
        end;
    end, {
        v89.current, 
        v88
    });
    local v129 = l_useStyle_0();
    return v4.createElement("Frame", {
        Size = v103, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v69.menuFrameRef, 
        [v4.Change.AbsoluteSize] = v101, 
        [v4.Change.AbsolutePosition] = v101
    }, {
        v4.createElement(AnimationStateHelper, {
            setToggleTransition = v78, 
            setToggleIconTransition = v80, 
            setToggleWidthTransition = v82, 
            setToggleSubmenuTransition = v92, 
            menuFrameRef = v69.menuFrameRef
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v129.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = if l_GetFFlagChromeUsePreferredTransparency_0() then v129.Theme.BackgroundUIContrast.Transparency * v129.Settings.PreferredTransparency else v129.Theme.BackgroundUIContrast.Transparency
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, v93)
    });
end;
return v4.memo(function(v130) --[[ Line: 583 ]]
    -- upvalues: v4 (copy), v15 (copy), v6 (copy), v10 (copy), v11 (copy)
    local v131 = v4.useRef(nil);
    local v132 = v4.useRef(nil);
    local function v133() --[[ Line: 589 ]] --[[ Name: updateSize ]]
        -- upvalues: v132 (copy), v131 (copy)
        if v132.current and v131.current then
            v132.current.Size = v131.current.Size;
        end;
    end;
    local v134 = v15(v6:orderAlignment(), isLeft);
    v4.useEffect(function() --[[ Line: 597 ]]
        -- upvalues: v131 (copy), v133 (copy), v132 (copy)
        local v135 = nil;
        if v131 and v131.current then
            v135 = v131.current:GetPropertyChangedSignal("Size"):Connect(v133);
        end;
        if v132.current and v131.current then
            v132.current.Size = v131.current.Size;
        end;
        return function() --[[ Line: 605 ]]
            -- upvalues: v135 (ref)
            if v135 then
                v135:disconnect();
            end;
        end;
    end);
    return {
        v4.createElement("Frame", {
            Name = "UnibarMenu", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v130.layoutOrder, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            ref = v132
        }, {
            v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = if v134 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 10)
            }), 
            v4.createElement(Unibar, {
                menuFrameRef = v131, 
                onAreaChanged = v130.onAreaChanged, 
                onMinWidthChanged = v130.onMinWidthChanged
            }), 
            v4.createElement(v10), 
            (v4.createElement(v11))
        })
    };
end, l_GetFFlagAnimateSubMenu_0() and function(_, _) --[[ Line: 648 ]]
    return true;
end or nil);