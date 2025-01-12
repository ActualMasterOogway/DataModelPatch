local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Packages_0 = l_CorePackages_0.Packages;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_Packages_0.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v9 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v9.setTimeout;
local l_clearTimeout_0 = v9.clearTimeout;
local _ = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Service.WindowSizeSignal);
local v13 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge);
local v14 = require(l_Packages_0.UIBlox);
local l_Interactable_0 = v14.Core.Control.Interactable;
local l_StyledTextLabel_0 = v14.App.Text.StyledTextLabel;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_withTooltip_0 = v14.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v14.App.Dialog.Enum.TooltipOrientation;
local l_ControlState_0 = v14.Core.Control.Enum.ControlState;
local l_Images_0 = v14.App.ImageSet.Images;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local v23 = require(script.Parent.CameraStatusIcon);
local v24 = require(script.Parent.CameraStatusDot);
local v25 = require(script.Parent.Parent.Utils.SizingUtils);
local v26 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v27 = require(script.Parent.Parent.Utils.ModelUtils);
local v28 = require(script.Parent.Parent.Hooks.useCameraOn);
local v29 = require(script.Parent.Parent.Hooks.useLocalPlayer);
local v30 = require(script.Parent.Parent.Hooks.useTrackerMessage);
local v31 = require(script.Parent.Parent.Hooks.useTooltipDismissal);
local v32 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Unibar.Constants);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local v35 = require(l_Chrome_0.Enabled);
local v36 = if l_GetFFlagFixChromeReferences_0() then if v35() then require(l_Chrome_0.Service) else nil else require(script.Parent.Parent.Parent.Chrome.Service);
local l_SelfieView_0 = script.Parent.Parent.Parent.SelfieView;
local v38 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local v39 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontStartOnOpen);
local l_GetFFlagSelfieViewUseNewErrorBody_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfieViewUseNewErrorBody;
local v41 = game:DefineFastFlag("SelfieViewReducedCornerWidth", true);
local v42 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v43 = l_Images_0["icons/actions/previewShrink"];
local v44 = l_Images_0["icons/actions/previewExpand"];
local v45 = require(script.Parent.FaceClone);
return function(v46) --[[ Line: 79 ]] --[[ Name: Window ]]
    -- upvalues: l_useStyle_0 (copy), l_GetFFlagSelfieViewUseNewErrorBody_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v28 (copy), v30 (copy), v13 (copy), l_useSelector_0 (copy), v25 (copy), v5 (copy), v29 (copy), v26 (copy), v31 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy), v38 (copy), v27 (copy), v42 (copy), v45 (copy), v39 (copy), l_ControlState_0 (copy), l_Interactable_0 (copy), v23 (copy), v32 (copy), v36 (copy), l_ImageSetLabel_0 (copy), v43 (copy), v44 (copy), v41 (copy), l_StyledTextLabel_0 (copy), l_withTooltip_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v24 (copy)
    local l_id_0 = v46.id;
    local v48 = l_useStyle_0();
    local l_Theme_0 = v48.Theme;
    local l_Font_0 = v48.Font;
    local v52 = if l_GetFFlagSelfieViewUseNewErrorBody_0() then l_useAppPolicy_0(function(v51) --[[ Line: 86 ]]
        return v51.getShowUpdatedCameraPath();
    end) else false;
    local v53 = l_useLocalization_0({
        robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader", 
        robloxPermissionErrorBody = l_GetFFlagSelfieViewUseNewErrorBody_0() and v52 and "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" or "CoreScripts.TopBar.RobloxPermissionErrorBody", 
        dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader", 
        dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody"
    });
    local v54 = v28();
    local v55 = v30();
    local v56 = v13(v46.windowSize);
    local v58 = l_useSelector_0(function(v57) --[[ Line: 105 ]]
        -- upvalues: v25 (ref), v56 (copy)
        return v25.getSize(v57.displayOptions.screenSize, v56);
    end);
    v5.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v46 (copy), v58 (copy)
        v46.windowSize:requestSize(v58.X, v58.Y);
    end, {
        v58
    });
    local v59 = v29();
    local v60 = v5.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v26 (ref)
        return v26.getPermissions().userCamEligible and v26.getPermissions().placeCamEnabled;
    end);
    local v61, v62, v63, v64 = v31(2000);
    local v65, v66 = v5.useState(true);
    local v67, v68 = v5.useState(false);
    local v69, v70 = v5.useState(false);
    local v71, v72 = v5.useState(false);
    local v73 = v5.useRef(nil);
    local function v74() --[[ Line: 127 ]]
        -- upvalues: v73 (copy), l_clearTimeout_0 (ref), v66 (copy), l_setTimeout_0 (ref)
        if v73.current then
            l_clearTimeout_0(v73.current);
        end;
        v66(true);
        v73.current = l_setTimeout_0(function() --[[ Line: 132 ]]
            -- upvalues: v66 (ref)
            v66(false);
        end, 2000);
    end;
    v5.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v73 (copy), l_clearTimeout_0 (ref), v66 (copy), l_setTimeout_0 (ref)
        if v73.current then
            l_clearTimeout_0(v73.current);
        end;
        v66(true);
        v73.current = l_setTimeout_0(function() --[[ Line: 132 ]]
            -- upvalues: v66 (ref)
            v66(false);
        end, 2000);
        return function() --[[ Line: 139 ]]
            -- upvalues: v73 (ref), l_clearTimeout_0 (ref)
            if v73.current then
                l_clearTimeout_0(v73.current);
            end;
        end;
    end, {
        v73
    });
    local function v76(v75) --[[ Line: 146 ]]
        -- upvalues: v73 (copy), l_clearTimeout_0 (ref), v66 (copy), l_setTimeout_0 (ref), v26 (ref), v64 (copy), v53 (copy), v38 (ref), v59 (copy), v27 (ref), v42 (ref)
        if v73.current then
            l_clearTimeout_0(v73.current);
        end;
        v66(true);
        v73.current = l_setTimeout_0(function() --[[ Line: 132 ]]
            -- upvalues: v66 (ref)
            v66(false);
        end, 2000);
        if not v26.getPermissions().userCamEnabled and not v75 then
            v64(v53.robloxPermissionErrorHeader, v53.robloxPermissionErrorBody);
            return;
        else
            if v38() then
                if v59.Character and not v27.hasDynamicHead(v59.Character) and not v26.isCameraOn() and not v75 then
                    v64(v53.dynamicAvatarMissingErrorHeader, v53.dynamicAvatarMissingErrorBody);
                end;
            elseif not v27.hasDynamicHead(v59.Character or v59.CharacterAdded:Wait()) and not v26.isCameraOn() and not v75 then
                v64(v53.dynamicAvatarMissingErrorHeader, v53.dynamicAvatarMissingErrorBody);
            end;
            v42:setLastCtx("SelfView");
            v26.toggleVideoAnimation();
            return;
        end;
    end;
    local v77 = v5.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v76 (copy)
        v76(false);
    end, {
        v26, 
        v27, 
        v53, 
        v59
    });
    local v78 = v5.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v73 (copy), l_clearTimeout_0 (ref), v66 (copy), l_setTimeout_0 (ref)
        if v73.current then
            l_clearTimeout_0(v73.current);
        end;
        v66(true);
        v73.current = l_setTimeout_0(function() --[[ Line: 132 ]]
            -- upvalues: v66 (ref)
            v66(false);
        end, 2000);
    end, {
        v74, 
        v65, 
        v46.windowSize
    });
    local v79 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 182 ]]
        -- upvalues: v45 (ref), v59 (copy), v79 (copy), v26 (ref), v46 (copy), v39 (ref), v76 (copy)
        if _G.__TESTEZ_RUNNING_TEST__ then
            return;
        else
            local v80 = v45(v59, v79.current);
            if not v26.isCameraOn() and not v46.isDraggedOut and not v39() then
                v76(true);
            end;
            return function() --[[ Line: 198 ]]
                -- upvalues: v80 (copy)
                if v80 then
                    v80();
                end;
            end;
        end;
    end, {
        v59, 
        v79
    });
    local v83 = v5.useCallback(function(_, v82) --[[ Line: 205 ]]
        -- upvalues: v70 (copy), l_ControlState_0 (ref)
        v70(v82 == l_ControlState_0.Hover);
    end, {
        v70
    });
    local v86 = v5.useCallback(function(_, v85) --[[ Line: 209 ]]
        -- upvalues: v68 (copy), l_ControlState_0 (ref)
        v68(v85 == l_ControlState_0.Hover);
    end, {
        v68
    });
    local v89 = v5.useCallback(function(_, v88) --[[ Line: 213 ]]
        -- upvalues: v72 (copy), l_ControlState_0 (ref)
        v72(v88 == l_ControlState_0.Hover);
    end, {
        v72
    });
    local v91 = v5.useCallback(function(v90) --[[ Line: 217 ]]
        -- upvalues: v5 (ref), l_Interactable_0 (ref), v69 (copy), v26 (ref), v48 (copy), v83 (copy), v77 (copy), v23 (ref)
        return v5.createElement(l_Interactable_0, {
            Size = UDim2.fromOffset(36, 36), 
            BackgroundColor3 = if v69 and v26.getPermissions().userCamEnabled then v48.Theme.BackgroundOnHover.Color else v48.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v48.Theme.Overlay.Transparency, 
            onStateChanged = v83, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v5.Change.AbsoluteSize] = v90, 
            [v5.Change.AbsolutePosition] = v90, 
            [v5.Event.Activated] = v77
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            CameraStatusIcon = v5.createElement(v23, {
                iconSize = UDim2.fromOffset(28, 28), 
                transparency = not v26.getPermissions().userCamEnabled and 0.5 or 0
            })
        });
    end, {
        v83, 
        v77
    });
    return v5.createElement("Frame", {
        Name = "SelfieViewFrame", 
        Active = true, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v48.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 0, 
        [v5.Event.MouseEnter] = v74, 
        [v5.Event.MouseMoved] = v74, 
        ref = v79
    }, {}, {
        CloseButtonWrapper = v65 and v5.createElement("Frame", {
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            Size = v32.CLOSE_BUTTON_FRAME
        }, {
            CloseButtonLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            CloseButtonInteractable = v5.createElement(l_Interactable_0, {
                Size = UDim2.fromOffset(36, 36), 
                BackgroundColor3 = if v67 then v48.Theme.BackgroundOnHover.Color else v48.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = 0.8, 
                onStateChanged = v86, 
                [v5.Event.Activated] = v36 and function() --[[ Line: 272 ]]
                    -- upvalues: v36 (ref), l_id_0 (copy)
                    v36:toggleWindow(l_id_0);
                end or nil
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                Fragment = v5.createElement(v5.Fragment, nil, {
                    v5.createElement("Frame", {
                        Name = "X1", 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v48.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = 45
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }), 
                    (v5.createElement("Frame", {
                        Name = "X2", 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v48.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = -45
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }))
                })
            })
        }), 
        ExpandButtonWrapper = if v65 then v5.createElement("Frame", {
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            Size = v32.CLOSE_BUTTON_FRAME, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0)
        }, {
            ExpandButtonLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ExpandButtonPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            ExpandButtonInteractable = v5.createElement(l_Interactable_0, {
                Size = UDim2.fromOffset(36, 36), 
                BackgroundColor3 = if v71 then v48.Theme.BackgroundOnHover.Color else v48.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = 0.8, 
                onStateChanged = v89, 
                [v5.Event.Activated] = v36 and function() --[[ Line: 342 ]]
                    -- upvalues: v46 (copy)
                    v46.windowSize:toggleIsLarge();
                end or nil
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                ExpandImage = v5.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(28, 28), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Image = if v56 then v43 else v44, 
                    ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                    ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                })
            })
        }) else nil, 
        Corners = v5.createElement("UICorner", {
            CornerRadius = if v41 then UDim.new(0, 8) else UDim.new(0, 20)
        }), 
        ControlMessage = v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -44), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Visible = v55.visible
        }, {
            Corners = v5.createElement("UICorner", {}), 
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Line1 = v5.createElement(l_StyledTextLabel_0, {
                text = v55.text, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.TextDefault, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 1, 
                size = UDim2.fromOffset(46, 36), 
                TextWrapped = true
            }), 
            Line2 = v5.createElement(l_StyledTextLabel_0, {
                text = v55.status, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.ContextualPrimaryContent, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 2, 
                size = UDim2.fromOffset(46, 12), 
                automaticSize = Enum.AutomaticSize.Y
            })
        }), 
        IconFrame = v65 and v60 and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v32.CLOSE_BUTTON_FRAME, 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            ZIndex = 2
        }, {
            Tooltip = l_withTooltip_0({
                headerText = v61, 
                bodyText = v62, 
                textXAlignment = Enum.TextXAlignment.Left
            }, {
                guiTarget = l_CoreGui_0, 
                active = v63, 
                DisplayOrder = 101, 
                preferredOrientation = l_TooltipOrientation_0.Bottom
            }, v91), 
            Hover = v5.createElement("Frame", {
                Size = UDim2.fromOffset(32, 32), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = v48.Theme.BackgroundOnHover.Transparency, 
                BackgroundColor3 = v48.Theme.BackgroundOnHover.Color
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            })
        }) or nil, 
        CameraStatusDot = if v54 then v5.createElement(v24, {
            Position = UDim2.new(1, -12, 1, -12), 
            ZIndex = 2, 
            Size = UDim2.fromOffset(8, 8)
        }) else nil, 
        Interactable = v5.createElement(l_Interactable_0, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v5.Event.Activated] = v78
        })
    });
end;