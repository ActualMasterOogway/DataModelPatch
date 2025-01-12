local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(l_CorePackages_0.Packages.ReactOtter);
local l_Interactable_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Control.Interactable;
local v10 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v11 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride");
local v12 = require(l_script_FirstAncestor_0.Utility.debounce);
local v13 = require(l_script_FirstAncestor_0.Service);
local v14 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v16 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local v17 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromeAnalytics();
local v18 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewFixes();
local v19 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagWindowFixes();
local v20 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GetFFlagSelfViewAssertFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewAssertFix;
local l_GetFFlagSelfieViewMoreFixMigration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfieViewMoreFixMigration;
local v24 = game:DefineFastInt("ChromeWindowLayoutOrder", 2);
local v25 = game:DefineFastFlag("WindowDragDetection", false);
local v26 = game:DefineFastInt("WindowMinDragDistance", 25);
local l_GetFFlagChromeDefaultWindowStartingPosition_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeDefaultWindowStartingPosition;
local v28 = require(l_script_FirstAncestor_0.Hooks.useWindowSize);
local v29 = {
    dampingRatio = 1, 
    frequency = 3
};
local v30 = {
    INTEGRATION = 1, 
    CLOSE_BUTTON = 2, 
    INPUT_SHIELD = 3, 
    INPUT_WRAPPER = 4
};
local v31 = false;
return function(v32) --[[ Line: 63 ]]
    -- upvalues: v28 (copy), v2 (copy), v18 (copy), l_useSelector_0 (copy), v8 (copy), l_GetFFlagChromeDefaultWindowStartingPosition_0 (copy), v29 (copy), v13 (copy), v19 (copy), v17 (copy), v16 (copy), l_UserInputService_0 (copy), v20 (copy), l_GetFFlagSelfieViewMoreFixMigration_0 (copy), l_VRService_0 (copy), v31 (ref), v10 (copy), v11 (copy), v25 (copy), v26 (copy), l_GetFFlagSelfViewAssertFix_0 (copy), l_TweenService_0 (copy), v24 (copy), v3 (copy), v14 (copy), v12 (copy), l_Interactable_0 (copy), v30 (copy), l_CoreGui_0 (copy)
    local v33 = v28(v32.integration.integration);
    local v34 = v2.useRef(nil);
    local v35 = v2.useRef(nil);
    local v36, v37 = v2.useBinding(false);
    local v38 = 0;
    local v39 = v2.useMemo(function() --[[ Line: 69 ]]
        return nil;
    end, {});
    local v41 = if v18 then l_useSelector_0(function(v40) --[[ Line: 74 ]]
        return v40.displayOptions.menuOpen or v40.displayOptions.inspectMenuOpen;
    end) else nil;
    local v42, v43 = v2.useBinding(false);
    local v44, v45 = v8.useAnimatedBinding(v33.X.Offset);
    local v46, v47 = v8.useAnimatedBinding(v33.Y.Offset);
    local v48 = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then v2.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v44 (copy), v46 (copy), v32 (copy)
        return Vector2.new(v44:getValue(), v46:getValue()) * (v32.integration.integration.windowAnchorPoint or Vector2.zero);
    end, {
        v44, 
        v46, 
        v32.integration
    }) else nil;
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v44 (copy), v45 (copy), v8 (ref), v33 (copy), v29 (ref)
        if v44:getValue() == 0 then
            v45((v8.instant(v33.X.Offset)));
            return;
        else
            v45(v8.spring(v33.X.Offset, v29));
            return;
        end;
    end, {
        v33.X.Offset
    });
    v2.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v46 (copy), v47 (copy), v8 (ref), v33 (copy), v29 (ref)
        if v46:getValue() == 0 then
            v47((v8.instant(v33.Y.Offset)));
            return;
        else
            v47(v8.spring(v33.Y.Offset, v29));
            return;
        end;
    end, {
        v33.Y.Offset
    });
    v2.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v13 (ref), v32 (copy), v19 (ref), v34 (copy), v35 (ref), v37 (copy), v45 (copy), v8 (ref), v47 (copy), v33 (copy), v29 (ref), v17 (ref), v16 (ref), l_UserInputService_0 (ref), v20 (ref)
        local v49 = nil;
        local v50 = nil;
        local v51 = v13:dragConnection(v32.integration.id);
        if not v19 or v51 then
            v49 = v51.connection;
            v50 = v51.inputObject;
        end;
        assert(v34.current ~= nil);
        assert(v34.current.Parent ~= nil);
        local l_current_0 = v34.current;
        local l_AbsoluteSize_0 = v34.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        if v49 ~= nil then
            v35 = v49;
            v37(true);
            if v35 then
                v45((v8.instant(42)));
                v47((v8.instant(42)));
                task.defer(v45, v8.spring(v33.X.Offset, v29));
                task.defer(v47, v8.spring(v33.Y.Offset, v29));
                local v54 = Vector3.new(v34.current.AbsolutePosition.X, v34.current.AbsolutePosition.Y, 0);
                if v17 then
                    v16.default:setWindowDefaultPosition(v32.integration.id, Vector2.new(v54.X, v54.Y));
                end;
                v35.current = l_UserInputService_0.InputChanged:Connect(function(v55, _) --[[ Line: 150 ]]
                    -- upvalues: v20 (ref), v50 (ref), v54 (copy), v54 (copy), l_AbsoluteSize_0 (copy), l_current_0 (copy)
                    local l_Position_0 = v55.Position;
                    if v20(v50, v55) then
                        return;
                    else
                        local v58 = l_Position_0 - v54;
                        local v59 = {
                            X = math.clamp((v58 + v54).X, 0, l_AbsoluteSize_0.X), 
                            Y = math.clamp((v58 + v54).Y, 0, l_AbsoluteSize_0.Y)
                        };
                        l_current_0.Position = UDim2.fromOffset(v59.X, v59.Y);
                        return;
                    end;
                end);
            end;
        else
            local v60 = v32.position or UDim2.new();
            if v32.integration.integration.cachePosition then
                local v61 = v13:windowPosition(v32.integration.id) or UDim2.new();
                local v62 = if v61.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v62 + v61.X.Offset, 0, v61.Y.Offset);
            else
                local v63 = if v60.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v63 + v60.X.Offset, 0, v60.Y.Offset);
            end;
        end;
    end, {});
    local v65 = v2.useCallback(function(v64) --[[ Line: 182 ]]
        -- upvalues: v32 (copy), v13 (ref)
        if v32.integration.integration.cachePosition then
            v13:updateWindowPosition(v32.integration.id, v64);
        end;
    end, {
        v32.integration
    });
    local v66 = if l_GetFFlagSelfieViewMoreFixMigration_0() then v2.useCallback(function() --[[ Line: 189 ]]
        -- upvalues: l_VRService_0 (ref), v31 (ref), v10 (ref), v11 (ref)
        if not l_VRService_0.VREnabled then
            v31 = true;
            v10.push(v11, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end) else nil;
    local v67 = if l_GetFFlagSelfieViewMoreFixMigration_0() then v2.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v31 (ref), v10 (ref), v11 (ref)
        if v31 then
            v31 = false;
            v10.pop(v11);
        end;
    end) else nil;
    local v81 = v2.useCallback(function(_, v69) --[[ Line: 209 ]]
        -- upvalues: v34 (copy), l_GetFFlagChromeDefaultWindowStartingPosition_0 (ref), v48 (copy), v44 (copy), v46 (copy), v32 (copy), v17 (ref), v16 (ref), v35 (ref), v42 (copy), l_UserInputService_0 (ref), v20 (ref), v25 (ref), v38 (ref), v26 (ref), v37 (copy)
        assert(v34.current ~= nil);
        assert(v34.current.Parent ~= nil);
        local l_current_1 = v34.current;
        local l_AbsoluteSize_1 = v34.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        local v72 = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then v48() else Vector2.new(v44:getValue(), v46:getValue()) * (v32.integration.integration.windowAnchorPoint or Vector2.new(0.5, 0.5));
        local l_Position_1 = v69.Position;
        local v74 = Vector3.new(v34.current.AbsolutePosition.X + v72.X, v34.current.AbsolutePosition.Y + v72.Y, 0);
        if v69.UserInputType == Enum.UserInputType.MouseButton1 or v69.UserInputType == Enum.UserInputType.Touch then
            if v17 then
                v16.default:onWindowTouchBegan(v32.integration.id, Vector2.new(v34.current.AbsolutePosition.X, v34.current.AbsolutePosition.Y));
            end;
            if not v35.current and not v42:getValue() then
                local v75 = {
                    X = math.clamp(v74.X, 0, l_AbsoluteSize_1.X - (v44:getValue() - v72.X)), 
                    Y = math.clamp(v74.Y, 0, l_AbsoluteSize_1.Y - (v46:getValue() - v72.Y))
                };
                l_current_1.Position = UDim2.fromOffset(v75.X, v75.Y);
                v35.current = l_UserInputService_0.InputChanged:Connect(function(v76, _) --[[ Line: 259 ]]
                    -- upvalues: v20 (ref), v69 (copy), l_Position_1 (copy), v25 (ref), v38 (ref), v26 (ref), v37 (ref), v74 (copy), v72 (copy), l_AbsoluteSize_1 (copy), v44 (ref), v46 (ref), l_current_1 (copy), v17 (ref), v16 (ref), v32 (ref)
                    if v20(v69, v76) then
                        return;
                    else
                        local l_Position_2 = v76.Position;
                        local v79 = l_Position_2 - l_Position_1;
                        if v25 then
                            v38 = v38 + v79.Magnitude;
                        end;
                        if not v25 or v26 < v38 then
                            v37(true);
                            local v80 = {
                                X = math.clamp((v79 + v74).X, v72.X, l_AbsoluteSize_1.X - (v44:getValue() - v72.X)), 
                                Y = math.clamp((v79 + v74).Y, v72.Y, l_AbsoluteSize_1.Y - (v46:getValue() - v72.Y))
                            };
                            l_current_1.Position = UDim2.fromOffset(v80.X, v80.Y);
                            if v17 then
                                v16.default:onWindowDrag(v32.integration.id, l_Position_2);
                            end;
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end, {
        v48
    });
    local function v89(v82) --[[ Line: 297 ]]
        -- upvalues: l_GetFFlagChromeDefaultWindowStartingPosition_0 (ref), v48 (copy), v44 (copy), v46 (copy), v32 (copy)
        local l_Parent_0 = v82.Parent;
        local l_Offset_0 = v82.Position.X.Offset;
        local l_Offset_1 = v82.Position.Y.Offset;
        local v86 = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then v48() else Vector2.new(v44:getValue(), v46:getValue()) * (v32.integration.integration.windowAnchorPoint or Vector2.new(0.5, 0.5));
        local l_AbsoluteSize_2 = l_Parent_0.AbsoluteSize;
        local v88 = true;
        if l_Offset_0 >= v86.X then
            v88 = true;
            if l_AbsoluteSize_2.X - (v44:getValue() - v86.X) >= l_Offset_0 then
                v88 = true;
                if l_Offset_1 >= v86.Y then
                    v88 = l_AbsoluteSize_2.Y - (v46:getValue() - v86.Y) < l_Offset_1;
                end;
            end;
        end;
        return v88;
    end;
    local v102 = v2.useCallback(function(v90) --[[ Line: 317 ]]
        -- upvalues: l_GetFFlagSelfViewAssertFix_0 (ref), v34 (copy), v39 (ref), v89 (copy), l_GetFFlagChromeDefaultWindowStartingPosition_0 (ref), v48 (copy), v44 (copy), v46 (copy), v32 (copy), v65 (copy), v43 (copy), l_TweenService_0 (ref)
        if l_GetFFlagSelfViewAssertFix_0() and (v34 == nil or v34.current == nil) then
            return;
        else
            assert(v34.current ~= nil);
            assert(v34.current.Parent ~= nil);
            local l_current_2 = v34.current;
            local l_Offset_2 = l_current_2.Position.X.Offset;
            local l_Offset_3 = l_current_2.Position.Y.Offset;
            if v39 and v39.PlaybackState == Enum.PlaybackState.Playing then
                v39:Cancel();
            end;
            if v89(l_current_2) then
                if l_current_2 == nil then
                    return;
                else
                    local l_Parent_1 = v34.current.Parent;
                    local v95 = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then v48() else Vector2.new(v44:getValue(), v46:getValue()) * (v32.integration.integration.windowAnchorPoint or Vector2.new(0.5, 0.5));
                    local l_AbsoluteSize_3 = l_Parent_1.AbsoluteSize;
                    local v97 = 0;
                    local v98 = 0;
                    if l_AbsoluteSize_3.X > v44:getValue() then
                        v97 = math.clamp(l_Offset_2, v95.X, l_AbsoluteSize_3.X - (v44:getValue() - v95.X));
                    end;
                    if l_AbsoluteSize_3.Y > v46:getValue() then
                        v98 = math.clamp(l_Offset_3, v95.Y, l_AbsoluteSize_3.Y - (v46:getValue() - v95.Y));
                    end;
                    local v99 = UDim2.new(0, v97, 0, v98);
                    v65(v99);
                    if not v90 then
                        v43(true);
                        local v100 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        v39 = l_TweenService_0:Create(l_current_2, v100, {
                            Position = v99
                        });
                        assert(v39 ~= nil);
                        v39.Completed:Connect(function(_) --[[ Line: 375 ]]
                            -- upvalues: v43 (ref), v39 (ref)
                            v43(false);
                            v39 = nil;
                        end);
                        v39:Play();
                        return;
                    else
                        l_current_2.Position = v99;
                        return;
                    end;
                end;
            else
                v65(UDim2.new(0, l_Offset_2, 0, l_Offset_3));
                return;
            end;
        end;
    end, {
        v48
    });
    local v105 = v2.useCallback(function(_, v104) --[[ Line: 388 ]]
        -- upvalues: v25 (ref), v38 (ref), v34 (copy), v17 (ref), v16 (ref), v32 (copy), v89 (copy), v35 (ref), v37 (copy), v13 (ref), v102 (copy)
        if v25 then
            v38 = 0;
        end;
        if v104.UserInputType == Enum.UserInputType.MouseButton1 or v104.UserInputType == Enum.UserInputType.Touch then
            if v34.current and v17 then
                v16.default:onWindowTouchEnded(v32.integration.id, Vector2.new(v34.current.AbsolutePosition.X, v34.current.AbsolutePosition.Y), (v89(v34.current)));
            end;
            if v35.current then
                v35.current:Disconnect();
                v35.current = nil;
                v37(false);
                v13:gesture(v32.integration.id, nil);
                v102();
            end;
        end;
    end, {});
    local l_v24_0 = v24;
    return v3.createPortal({
        Name = v2.createElement("ScreenGui", {
            Name = v14.WINDOW_HOST_GUI_NAME .. ":" .. v32.integration.id, 
            [v2.Change.AbsoluteSize] = v12(function() --[[ Line: 423 ]]
                -- upvalues: v102 (copy)
                v102();
            end, 0.2), 
            DisplayOrder = not v18 and 100 or v41 and -1 or l_v24_0, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            WindowFrame = v2.createElement("Frame", {
                Size = v2.joinBindings({
                    v44, 
                    v46
                }):map(function(v107) --[[ Line: 430 ]]
                    -- upvalues: v102 (copy)
                    v102(true);
                    return UDim2.fromOffset(v107[1], v107[2]);
                end), 
                LayoutOrder = 1, 
                ref = v34, 
                BorderSizePixel = 0, 
                AnchorPoint = if v32.integration.integration.windowAnchorPoint then v32.integration.integration.windowAnchorPoint else if l_GetFFlagChromeDefaultWindowStartingPosition_0() then nil else Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                WindowWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Integration = v32.integration.component(v32) or nil, 
                    InputShield = v2.createElement(l_Interactable_0, {
                        ZIndex = v30.INPUT_SHIELD, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Visible = v36
                    }), 
                    InputWrapper = v2.createElement("Frame", {
                        ZIndex = v30.INPUT_WRAPPER, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v2.Event.InputBegan] = v81, 
                        [v2.Event.InputEnded] = v105, 
                        [v2.Event.MouseEnter] = if l_GetFFlagSelfieViewMoreFixMigration_0() then v66 else nil, 
                        [v2.Event.MouseLeave] = if l_GetFFlagSelfieViewMoreFixMigration_0() then v67 else nil, 
                        [v2.Event.Destroying] = if l_GetFFlagSelfieViewMoreFixMigration_0() then v67 else nil
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;