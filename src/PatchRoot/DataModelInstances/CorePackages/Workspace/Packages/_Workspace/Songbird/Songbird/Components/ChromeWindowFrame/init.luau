local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Components.CollapsibleFrame);
local v7 = require(l_script_FirstAncestor_0.Components.DismissButton);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseSmallWidthMusicIcon);
local l_GetFFlagSongbirdWindowResponsiveSizing_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongbirdWindowResponsiveSizing;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixReportModalShownBehavior);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdWindowFitAndFinish);
local l_createNextOrder_0 = v5.createNextOrder;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local l_useState_0 = v4.useState;
local v18 = {
    autoCollapseSeconds = 3, 
    isSubMenuOpen = false, 
    onToggleSubMenu = function() --[[ Line: 39 ]] --[[ Name: onToggleSubMenu ]]

    end
};
return function(v19) --[[ Line: 44 ]] --[[ Name: ChromeWindowFrame ]]
    -- upvalues: v2 (copy), v18 (copy), v11 (copy), l_useState_0 (copy), l_createNextOrder_0 (copy), l_GetFFlagSongbirdWindowResponsiveSizing_0 (copy), l_useRef_0 (copy), v3 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), l_RunService_0 (copy), v4 (copy), v12 (copy), v6 (copy), v8 (copy), v7 (copy), v9 (copy)
    local v20 = v2.Dictionary.join(v18, v19);
    local v21 = nil;
    local v22 = nil;
    if not v11() then
        local v23, v24 = l_useState_0(false);
        v21 = v23;
        v22 = v24;
    end;
    local v25 = l_createNextOrder_0();
    local v26 = if l_GetFFlagSongbirdWindowResponsiveSizing_0() then nil else l_useRef_0(nil);
    local v27 = l_useRef_0(nil);
    local v28 = v3.Hooks.useTokens();
    local v29, v30 = l_useState_0(true);
    local v31 = nil;
    local v32 = nil;
    if not l_GetFFlagSongbirdWindowResponsiveSizing_0() then
        local v33, v34 = l_useState_0(Vector2.new(1e999, 1e999));
        v31 = v33;
        v32 = v34;
    end;
    local v35 = l_useCallback_0(function() --[[ Line: 64 ]]
        -- upvalues: v20 (copy)
        if v20.onClose then
            v20.onClose();
        end;
    end, {
        v20.onClose
    });
    local v37 = if not v11() then l_useCallback_0(function() --[[ Line: 72 ]]
        -- upvalues: v22 (ref)
        v22(function(v36) --[[ Line: 73 ]]
            return not v36;
        end);
    end, {}) else function() --[[ Line: 77 ]]

    end;
    local v39 = l_useCallback_0(function(v38) --[[ Line: 80 ]]
        -- upvalues: v27 (copy), v30 (copy), v3 (ref)
        v27.current = nil;
        v30(true);
        if v38 == v3.Enums.ControlState.Default then
            v27.current = os.time();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 96 ]]
        -- upvalues: v20 (copy), l_RunService_0 (ref), v27 (copy), v30 (copy)
        if v20.autoCollapseSeconds and v20.autoCollapseSeconds > 0 then
            local v40 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 100 ]]
                -- upvalues: v27 (ref), v20 (ref), v30 (ref)
                if v27.current and os.time() - v27.current >= v20.autoCollapseSeconds then
                    v30(false);
                end;
            end);
            return function() --[[ Line: 108 ]]
                -- upvalues: v40 (copy)
                v40:Disconnect();
            end;
        else
            return nil;
        end;
    end, {
        v20.autoCollapseSeconds
    });
    if not l_GetFFlagSongbirdWindowResponsiveSizing_0() then
        l_useEffect_0(function() --[[ Line: 116 ]]
            -- upvalues: v26 (copy), v32 (ref)
            if v26.current then
                v26.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 118 ]]
                    -- upvalues: v32 (ref), v26 (ref)
                    v32(v26.current.AbsoluteSize);
                end);
            end;
        end, {});
    end;
    return v4.createElement(v3.View, {
        tag = l_GetFFlagSongbirdWindowResponsiveSizing_0() and "auto-xy" or "size-full", 
        sizeConstraint = {
            MaxSize = if l_GetFFlagSongbirdWindowResponsiveSizing_0() then if v20.maxSize then v20.maxSize else nil else v31
        }, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }, 
        onStateChanged = v39
    }, {
        WindowFrame = v4.createElement(v3.View, {
            tag = v12() and "size-full-0 auto-y bg-over-media-100 radius-medium col gap-xxsmall stroke-emphasis" or "size-full-0 auto-y bg-over-media-200 radius-medium col gap-xxsmall padding-y-xsmall stroke-emphasis", 
            sizeConstraint = if l_GetFFlagSongbirdWindowResponsiveSizing_0() then nil else {
                MaxSize = if v20.maxSize then v20.maxSize else nil
            }, 
            ref = if l_GetFFlagSongbirdWindowResponsiveSizing_0() then nil else v26
        }, {
            CollapsibleTitleBar = v4.createElement(v6, {
                isCollapsed = not v29, 
                LayoutOrder = v25()
            }, {
                TitleBar = v4.createElement(v3.View, {
                    tag = v12() and "size-full-0 auto-y row flex-between items-center padding-left-small" or "size-full-0 auto-y row flex-between items-center padding-x-small"
                }, {
                    Title = v4.createElement(v3.Text, {
                        tag = v12() and "auto-xy shrink text-title-medium content-emphasis" or "auto-xy shrink text-caption-large", 
                        Text = v20.title
                    }), 
                    Actions = v4.createElement(v3.View, {
                        tag = v12() and "auto-xy row" or "auto-xy row gap-xsmall", 
                        LayoutOrder = v25()
                    }, {
                        CloseButton = if v8() then v4.createElement(v7, {
                            icon = v12() and "icons/navigation/close" or "icons/navigation/close_small", 
                            iconSize = if v12() then nil else v3.Enums.IconSize.Small, 
                            onDismiss = v35, 
                            layoutOrder = v25()
                        }) else v4.createElement(v3.IconButton, {
                            icon = "icons/navigation/close_small", 
                            size = v3.Enums.IconSize.Small, 
                            onActivated = v35, 
                            LayoutOrder = v25()
                        })
                    })
                })
            }), 
            Divider = if v29 then v4.createElement(v3.View, {
                backgroundStyle = v28.Color.Stroke.Emphasis, 
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = v25()
            }) else nil, 
            Content = v4.createElement(v3.View, {
                tag = v12() and "size-full-0 auto-y row gap-small flex-between items-center padding-left-small padding-y-small" or v9() and "size-full-0 auto-y row gap-small flex-between items-center" or "size-full-0 auto-y row gap-small padding-x-small flex-between items-center", 
                LayoutOrder = v25()
            }, {
                Body = v4.createElement(v3.View, {
                    tag = "size-full-0 auto-y shrink clip", 
                    LayoutOrder = v25()
                }, v20.children), 
                Actions = v4.createElement(v3.View, {
                    tag = v12() and "auto-xy row flex-between items-center" or "auto-xy row gap-xsmall flex-between items-center", 
                    LayoutOrder = v25()
                }, {
                    CustomActions = if v20.actions then v4.createElement(v3.View, {
                        tag = v12() and "row auto-xy" or "row auto-xy gap-xsmall", 
                        LayoutOrder = v25()
                    }, v20.actions) else nil, 
                    OverflowButton = if v20.submenu then v4.createElement(v3.IconButton, {
                        icon = "icons/common/overflow", 
                        size = v3.Enums.IconSize.Medium, 
                        onActivated = if v11() then v20.onToggleSubMenu else v37, 
                        LayoutOrder = v25()
                    }) else nil
                })
            })
        }), 
        SubMenu = if v20.submenu and if v11() then v20.isSubMenuOpen else v21 then v4.createElement(v3.View, {
            tag = "auto-xy bg-over-media-200 radius-medium padding-small", 
            Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(v28.Gap.Small, 0)
        }, v20.submenu) else nil
    });
end;