local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v6.Core.Style.withStyle;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_ControlState_0 = v6.Core.Control.Enum.ControlState;
local l_Images_0 = v6.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local v15 = require(l_CorePackages_0.Packages.ReactOtter);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v18 = require(script.Parent.FlashingDot);
local v19 = require(script.Parent.FlashingDotV2);
local v20 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Chrome.Enabled)();
local v22 = require(l_CoreGui_0.RobloxGui.Modules.isNewTiltIconEnabled);
local v23 = require(script.Parent.Parent.Parent.Constants);
local v24 = require(script.Parent.Parent.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local l_GetFFlagChromeUsePreferredTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeUsePreferredTransparency;
local v26 = game:DefineFastFlag("EnableTopBarIconButtonBackgroundProps", false);
local l_GetFFlagFixUnibarVirtualCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixUnibarVirtualCursor;
local v28 = v3.PureComponent:extend("IconButton");
local v29 = if v22() then v23.TopBarHeight - 4 else 32;
if v24() then
    v29 = v23.TopBarButtonHeight;
end;
local v30 = l_Images_0["component_assets/circle_17"];
v28.validateProps = v5.strictInterface({
    icon = v5.union(v5.string, v5.table), 
    iconSize = v5.union(v5.integer, v5.UDim2, v5.table), 
    enableFlashingDot = v5.optional(v5.boolean), 
    useIconScaleAnimation = v5.optional(v5.boolean), 
    onActivated = v5.callback, 
    onHover = v5.optional(v5.callback), 
    onHoverEnd = v5.optional(v5.callback), 
    backgroundTransparency = v5.optional(v5.number), 
    backgroundColor3 = v5.optional(v5.Color3), 
    backgroundCornerRadius = v5.optional(v5.UDim)
});
AnimatedScaleIcon = function(v31) --[[ Line: 61 ]] --[[ Name: AnimatedScaleIcon ]]
    -- upvalues: v15 (copy), v4 (copy), v3 (copy), l_ImageSetLabel_0 (copy)
    local v32, v33 = v15.useAnimatedBinding(v31.iconSize);
    v4.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v33 (copy), v15 (ref), v31 (copy)
        v33(v15.spring(v31.iconSize, {
            dampingRatio = 1, 
            frequency = 2.857142857142857
        }));
        return function() --[[ Line: 69 ]]

        end;
    end, {
        v31.iconSize
    });
    return v3.createElement(l_ImageSetLabel_0, {
        Size = v32:map(function(v34) --[[ Line: 73 ]]
            return UDim2.fromOffset(v34, v34);
        end), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v31.icon, 
        ImageColor3 = v31.style.Theme.IconEmphasis.Color, 
        ImageTransparency = v31.style.Theme.IconEmphasis.Transparency, 
        ZIndex = 1
    });
end;
v28.init = function(v35) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy)
    v35:setState({
        controlState = l_ControlState_0.Default
    });
    v35.controlStateUpdated = function(v36, v37) --[[ Line: 91 ]]
        -- upvalues: v35 (copy), l_ControlState_0 (ref)
        if v35.props.onHover and v37 == l_ControlState_0.Hover then
            v35.props.onHover();
        elseif v35.props.onHoverEnd and v36 == l_ControlState_0.Hover and v37 ~= l_ControlState_0.Hover then
            v35.props.onHoverEnd();
        end;
        v35:setState({
            controlState = v37
        });
    end;
end;
v28.render = function(v38) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagFixUnibarVirtualCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if l_GetFFlagFixUnibarVirtualCursor_0() then
        return l_withSelectionCursorProvider_0(function(v39) --[[ Line: 109 ]]
            -- upvalues: v38 (copy)
            return v38:renderWithSelectionCursor(v39);
        end);
    else
        return v38:renderWithSelectionCursor(nil);
    end;
end;
v28.renderWithSelectionCursor = function(v40, v41) --[[ Line: 117 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v26 (copy), v22 (copy), l_withStyle_0 (copy), l_ControlState_0 (copy), v3 (copy), l_Interactable_0 (copy), l_GetFFlagChromeUsePreferredTransparency_0 (copy), v29 (ref), l_GetFFlagFixUnibarVirtualCursor_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v19 (copy), v18 (copy), v30 (copy)
    local v42 = v26 and not v22() and v40.props.backgroundColor3;
    return l_withStyle_0(function(v43) --[[ Line: 121 ]]
        -- upvalues: v40 (copy), l_ControlState_0 (ref), v3 (ref), l_Interactable_0 (ref), v22 (ref), l_GetFFlagChromeUsePreferredTransparency_0 (ref), v29 (ref), l_GetFFlagFixUnibarVirtualCursor_0 (ref), v41 (copy), l_CursorKind_0 (ref), v42 (copy), l_ImageSetLabel_0 (ref), v26 (ref), v20 (ref), v19 (ref), v18 (ref), v30 (ref)
        local v44 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v40.state.controlState == l_ControlState_0.Pressed then
            v44 = v43.Theme.BackgroundOnPress;
        elseif v40.state.controlState == l_ControlState_0.Hover then
            v44 = v43.Theme.BackgroundOnHover;
        end;
        return v3.createElement(l_Interactable_0, {
            onStateChanged = v40.controlStateUpdated, 
            ZIndex = 1, 
            BackgroundTransparency = if v22() then if l_GetFFlagChromeUsePreferredTransparency_0() then v43.Theme.BackgroundUIContrast.Transparency * v43.Settings.PreferredTransparency else v43.Theme.BackgroundUIContrast.Transparency else 1, 
            Position = UDim2.fromScale(0, v22() and 0.5 or 1), 
            AnchorPoint = Vector2.new(0, v22() and 0.5 or 1), 
            Size = UDim2.fromOffset(v29, v29), 
            Image = not v22() and "rbxasset://textures/ui/TopBar/iconBase.png" or nil, 
            BackgroundColor3 = v43.Theme.BackgroundUIContrast.Color, 
            SelectionImageObject = if l_GetFFlagFixUnibarVirtualCursor_0() and v22() then v41(l_CursorKind_0.SelectedKnob) else nil, 
            [v3.Event.Activated] = v40.props.onActivated, 
            [v3.Ref] = v40.props.forwardRef
        }, {
            UICorner = v22() and v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) or nil, 
            BackgroundFrame = if v42 then v3.createElement("Frame", {
                Size = v40.props.iconSize, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v40.props.backgroundTransparency, 
                BackgroundColor3 = v40.props.backgroundColor3, 
                ZIndex = 0
            }, {
                UICorner = if v40.props.backgroundCornerRadius then v3.createElement("UICorner", {
                    CornerRadius = v40.props.backgroundCornerRadius
                }) else nil
            }) else nil, 
            Icon = not v40.props.useIconScaleAnimation and v3.createElement(l_ImageSetLabel_0, {
                Size = if v26 and typeof(v40.props.iconSize) ~= "number" then v40.props.iconSize else UDim2.fromOffset(v40.props.iconSize, v40.props.iconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v40.props.icon, 
                ImageColor3 = v43.Theme.IconEmphasis.Color, 
                ImageTransparency = v43.Theme.IconEmphasis.Transparency, 
                ZIndex = 1
            }), 
            ScalingIcon = v40.props.useIconScaleAnimation and v3.createElement(AnimatedScaleIcon, {
                icon = v40.props.icon, 
                iconSize = v40.props.iconSize, 
                style = v43
            }), 
            FlashingDot = if v40.props.enableFlashingDot then v3.createElement(if v20() then v19 else v18) else nil, 
            StateOverlayRound = v22() and v3.createElement("Frame", {
                BackgroundTransparency = v44.Transparency, 
                BackgroundColor3 = v44.Color, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, {
                UICorner = v22() and v3.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil
            }) or nil, 
            StateOverlay = not v22() and v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v30, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 8, 8), 
                ImageColor3 = v44.Color, 
                ImageTransparency = v44.Transparency, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }) or nil
        });
    end);
end;
if v17 then
    return v3.forwardRef(function(v45, v46) --[[ Line: 228 ]]
        -- upvalues: v3 (copy), v28 (copy), v7 (copy)
        return v3.createElement(v28, v7.Dictionary.join(v45, {
            forwardRef = v46
        }));
    end);
else
    return v28;
end;