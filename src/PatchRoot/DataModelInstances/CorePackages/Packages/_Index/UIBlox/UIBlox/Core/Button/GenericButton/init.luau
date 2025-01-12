local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_3.Cryo);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v9 = require(l_Parent_1.Control.Interactable);
local v10 = require(l_Parent_1.Control.Enum.ControlState);
local v11 = require(script.Parent.getContentStyle);
local v12 = require(l_Parent_2.Core.Style.withStyle);
local v13 = require(l_Parent_1.ImageSet.ImageSetComponent);
local v14 = require(l_Parent_2.App.Loading.ShimmerPanel);
local v15 = require(l_Parent_2.App.ImageSet.Enum.IconSize);
local v16 = require(l_Parent_2.App.ImageSet.getIconSize);
local v17 = require(l_Parent_1.Text.GenericTextLabel.GenericTextLabel);
local v18 = require(l_Parent_2.Core.Animation.withAnimation);
local v19 = require(l_Parent_1.Style.Validator.validateFontInfo);
local v20 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v21 = require(l_Parent_1.Button.HoverButtonBackground);
local v22 = require(l_Parent_0.Enum.StandardButtonSize);
local v23 = require(l_Parent_2.UIBloxConfig);
local v24 = require(l_Parent_1.ImageSet.Validator.validateImage);
local v25 = v5.PureComponent:extend("GenericButton");
v25.init = function(v26) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v23 (copy), l_RunService_0 (copy), v5 (copy)
    v26:setState({
        controlState = v10.Initialize, 
        absoluteSize = Vector2.new(100, 100), 
        targetLoadingProgress = 1, 
        isButtonUnfocused = if v23.useRobloxGuiFocusedChangedEventInGenericButton then l_RunService_0:GetRobloxGuiFocused() else nil
    });
    v26.onStateChanged = function(v27, v28) --[[ Line: 55 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            controlState = v28
        });
        if v26.props.onStateChanged then
            v26.props.onStateChanged(v27, v28);
        end;
    end;
    v26.onAbsoluteSizeChanged = function(v29) --[[ Line: 64 ]]
        -- upvalues: v26 (copy), v5 (ref)
        v26:setState({
            absoluteSize = v29.AbsoluteSize
        });
        if v26.props[v5.Change.AbsoluteSize] then
            v26.props[v5.Change.AbsoluteSize](v29);
        end;
    end;
    v26.onRobloxGuiFocusedChanged = function(v30) --[[ Line: 73 ]]
        -- upvalues: v26 (copy)
        if v30 then
            v26:setState({
                targetLoadingProgress = 1, 
                isButtonUnfocused = true
            });
            return;
        else
            v26:setState({
                isButtonUnfocused = false
            });
            return;
        end;
    end;
end;
local v31 = v6.interface({
    [v10.Default] = v6.string
});
v25.validateProps = v6.interface({
    icon = v6.optional(v24), 
    text = v6.optional(v6.string), 
    inputIcon = v6.optional(v24), 
    buttonImage = v24, 
    fontStyle = v6.optional(v6.union(v6.string, v19, v20)), 
    delayedInputImage = v6.optional(v24), 
    buttonStateColorMap = v31, 
    contentStateColorMap = v6.optional(v31), 
    textStateColorMap = v6.optional(v31), 
    iconStateColorMap = v6.optional(v31), 
    inputIconStateColorMap = v6.optional(v31), 
    isDisabled = v6.optional(v6.boolean), 
    isLoading = v6.optional(v6.boolean), 
    isDelayedInput = v6.optional(v6.boolean), 
    isHoverBackgroundEnabled = v6.optional(v6.boolean), 
    hoverImage = v6.optional(v24), 
    enableInputDelayed = v6.optional(v6.boolean), 
    delayInputSeconds = v6.optional(v6.numberPositive), 
    onActivated = v6.callback, 
    onStateChanged = v6.optional(v6.callback), 
    userInteractionEnabled = v6.optional(v6.boolean), 
    standardSize = v6.optional(v22.isEnumValue), 
    maxWidth = v6.optional(v6.numberPositive), 
    fitContent = v6.optional(v6.boolean), 
    buttonTextOverride = v6.optional(v6.strictInterface({
        RichText = v6.optional(v6.boolean), 
        Size = v6.optional(v6.UDim2), 
        TextSize = v6.optional(v6.number), 
        TextWrapped = v6.optional(v6.boolean), 
        TextTruncate = v6.optional(v6.enum(Enum.TextTruncate)), 
        TextXAlignment = v6.optional(v6.enum(Enum.TextXAlignment))
    })), 
    forwardedRef = v6.optional(v6.union(v6.table, v6.callback)), 
    feedbackType = v6.optional(v6.string)
});
v25.defaultProps = {
    fontStyle = "Header2", 
    isDisabled = false, 
    isLoading = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    delayInputSeconds = 3, 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
if v23.useRobloxGuiFocusedChangedEventInGenericButton then
    v25.didMount = function(v32) --[[ Line: 200 ]] --[[ Name: didMount ]]
        v32:setState({
            targetLoadingProgress = not v32.state.isButtonUnfocused and v32.props.enableInputDelayed and 0 or 1
        });
    end;
end;
v25.render = function(v33) --[[ Line: 209 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), v18 (copy)
    local l_isDelayedInput_0 = v33.props.isDelayedInput;
    local l_enableInputDelayed_0 = v33.props.enableInputDelayed;
    local l_delayInputSeconds_0 = v33.props.delayInputSeconds;
    local l_l_isDelayedInput_0_0 = l_isDelayedInput_0;
    if v23.useRobloxGuiFocusedChangedEventInGenericButton then
        l_l_isDelayedInput_0_0 = l_isDelayedInput_0 and not v33.state.isButtonUnfocused;
    end;
    if l_l_isDelayedInput_0_0 then
        local v38 = nil;
        v38 = if v23.useRobloxGuiFocusedChangedEventInGenericButton then v33.state.targetLoadingProgress else l_enableInputDelayed_0 and 0 or 1;
        return v18({
            loadingProgress = v38
        }, function(v39) --[[ Line: 229 ]]
            -- upvalues: v33 (copy)
            local v40 = math.clamp(v39.loadingProgress, 0, 1);
            return v33:renderButton(v40);
        end, {
            frequency = 1 / l_delayInputSeconds_0, 
            dampingRatio = 0.8
        });
    elseif v23.useRobloxGuiFocusedChangedEventInGenericButton then
        if v33.state.isButtonUnfocused then
            return v33:renderButton(1);
        else
            return v33:renderButton();
        end;
    else
        return v33:renderButton();
    end;
end;
v25.renderButton = function(v41, v42) --[[ Line: 253 ]] --[[ Name: renderButton ]]
    -- upvalues: v12 (copy), v6 (copy), v31 (copy), v11 (copy), v10 (copy), v22 (copy), v23 (copy), v5 (copy), v14 (copy), v16 (copy), v15 (copy), v13 (copy), v17 (copy), v7 (copy), v9 (copy), v21 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    return v12(function(v43) --[[ Line: 254 ]]
        -- upvalues: v6 (ref), v41 (copy), v31 (ref), v42 (copy), v11 (ref), v10 (ref), v22 (ref), v23 (ref), v5 (ref), v14 (ref), v16 (ref), v15 (ref), v13 (ref), v17 (ref), v7 (ref), v9 (ref), v21 (ref), l_EventConnection_0 (ref), l_RunService_0 (ref)
        assert(v6.table(v43), "Style provider is missing.");
        local l_controlState_0 = v41.state.controlState;
        local l_text_0 = v41.props.text;
        local l_icon_0 = v41.props.icon;
        local l_inputIcon_0 = v41.props.inputIcon;
        local l_isLoading_0 = v41.props.isLoading;
        local l_isDisabled_0 = v41.props.isDisabled;
        local l_isDelayedInput_1 = v41.props.isDelayedInput;
        local l_userInteractionEnabled_0 = v41.props.userInteractionEnabled;
        local l_buttonImage_0 = v41.props.buttonImage;
        local l_fontStyle_0 = v41.props.fontStyle;
        local l_delayedInputImage_0 = v41.props.delayedInputImage;
        local l_buttonStateColorMap_0 = v41.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v41.props.contentStateColorMap;
        local v57 = v41.props.textStateColorMap or l_contentStateColorMap_0;
        local v58 = v41.props.iconStateColorMap or l_contentStateColorMap_0;
        local v59 = v41.props.inputIconStateColorMap or l_contentStateColorMap_0;
        local l_Size_0 = v41.props.Size;
        local l_standardSize_0 = v41.props.standardSize;
        local v62 = v41.props.maxWidth or 640;
        local l_fitContent_0 = v41.props.fitContent;
        if l_text_0 then
            assert(v31(v57), "textStateColorMap is missing or invalid.");
        end;
        if l_icon_0 then
            assert(v31(v58), "iconStateColorMap is missing or invalid.");
        end;
        if l_inputIcon_0 then
            assert(v31(v59), "inputIconStateColorMap is missing or invalid.");
        end;
        if l_isDelayedInput_1 and l_delayedInputImage_0 == nil then
            l_isDelayedInput_1 = false;
        end;
        if l_isLoading_0 then
            l_isDisabled_0 = true;
        end;
        if l_isDisabled_0 then
            l_isDelayedInput_1 = false;
        end;
        if type(l_fontStyle_0) == "string" then
            l_fontStyle_0 = v43.Font[l_fontStyle_0];
        end;
        local l_l_delayedInputImage_0_0 = l_delayedInputImage_0;
        if v42 == 1 then
            l_l_delayedInputImage_0_0 = l_buttonImage_0;
        end;
        if l_isDelayedInput_1 and v42 ~= 0 then
            l_userInteractionEnabled_0 = false;
        end;
        local v65 = v11(l_buttonStateColorMap_0, l_controlState_0, v43);
        local v66 = l_text_0 and v11(v57, l_controlState_0, v43);
        local v67 = l_icon_0 and v11(v58, l_controlState_0, v43);
        local v68 = l_inputIcon_0 and v11(v59, l_controlState_0, v43);
        local v69 = false;
        if l_controlState_0 == v10.Hover then
            v69 = v41.props.isHoverBackgroundEnabled == true;
        end;
        local l_hoverImage_0 = v41.props.hoverImage;
        local v71 = 5;
        if l_standardSize_0 then
            local v72 = nil;
            local v73 = nil;
            if l_standardSize_0 == v22.Regular then
                v72 = 48;
                v71 = 12;
                l_fontStyle_0 = v43.Font.Header2;
                v73 = false;
            elseif l_standardSize_0 == v22.Small then
                v72 = 36;
                v71 = 8;
                l_fontStyle_0 = v43.Font.Header2;
                v73 = false;
            elseif l_standardSize_0 == v22.XSmall then
                v72 = 28;
                v71 = 8;
                l_fontStyle_0 = v43.Font.CaptionHeader;
                v73 = true;
            end;
            if l_fitContent_0 == nil then
                l_fitContent_0 = v73;
            end;
            local v74 = l_fitContent_0 and 0 or 1;
            l_Size_0 = UDim2.new(v74, 0, 0, v72);
        end;
        local v75 = nil;
        if l_isLoading_0 then
            v75 = {
                isLoadingShimmer = if v23.enableButtonLoadingShimmerPanelFix then v5.createElement(v14, {
                    Size = if l_standardSize_0 then UDim2.new(1, 2 * v71, 1, 0) else UDim2.new(1, 0, 1, 0), 
                    Position = if l_standardSize_0 then UDim2.new(0, -v71, 0, 0) else nil, 
                    cornerRadius = UDim.new(0, 8)
                }) else v5.createElement(v14, {
                    Size = UDim2.new(1, 0, 1, 0)
                })
            };
        else
            local l_X_0 = v41.state.absoluteSize.X;
            if l_standardSize_0 and l_fitContent_0 then
                l_X_0 = v62;
            end;
            local v77 = v41.state.absoluteSize.Y - 10;
            local v78 = l_X_0 - 2 * v71;
            if l_icon_0 then
                v78 = v78 - (5 + v16(v15.Medium));
            end;
            local v79 = Vector2.new(v78, v77);
            v75 = v41.props[v5.Children] or {
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Icon = l_icon_0 and v5.createElement(v13.Label, {
                    Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v67.Color, 
                    ImageTransparency = v67.Transparency, 
                    LayoutOrder = 1
                }) or nil, 
                Text = l_text_0 and v5.createElement(v17, v7.Dictionary.join({
                    BackgroundTransparency = 1, 
                    Text = l_text_0, 
                    fontStyle = l_fontStyle_0, 
                    colorStyle = v66, 
                    LayoutOrder = 2, 
                    maxSize = v79, 
                    TextWrapped = not l_standardSize_0 and nil, 
                    TextTruncate = if l_standardSize_0 then Enum.TextTruncate.AtEnd else nil, 
                    TextXAlignment = if l_standardSize_0 and l_icon_0 then Enum.TextXAlignment.Left else nil
                }, v41.props.buttonTextOverride or {})) or nil
            };
            v75 = v41.props[v5.Children] or {
                ButtonMiddleContent = v5.createElement("Frame", {
                    AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                    Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, v75), 
                ButtonIcon = l_inputIcon_0 and v5.createElement(v13.Label, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(1, -4, 0.5, 0), 
                    Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_inputIcon_0, 
                    ImageColor3 = v68.Color, 
                    ImageTransparency = v68.Transparency
                }) or nil
            };
        end;
        return v5.createElement(v9, v7.Dictionary.join(v41.props, {
            forwardedRef = v7.None, 
            icon = v7.None, 
            text = v7.None, 
            inputIcon = v7.None, 
            buttonImage = v7.None, 
            fontStyle = v7.None, 
            delayedInputImage = v7.None, 
            buttonStateColorMap = v7.None, 
            contentStateColorMap = v7.None, 
            textStateColorMap = v7.None, 
            iconStateColorMap = v7.None, 
            inputIconStateColorMap = v7.None, 
            onActivated = v7.None, 
            isLoading = v7.None, 
            isHoverBackgroundEnabled = v7.None, 
            hoverImage = v7.None, 
            isDelayedInput = v7.None, 
            enableInputDelayed = v7.None, 
            delayInputSeconds = v7.None, 
            standardSize = v7.None, 
            maxWidth = v7.None, 
            fitContent = v7.None, 
            buttonTextOverride = v7.None, 
            [v5.Children] = v7.None, 
            Size = l_Size_0, 
            AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
            [v5.Ref] = v41.props.forwardedRef, 
            isDisabled = l_isDisabled_0, 
            onStateChanged = v41.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            Image = l_buttonImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v65.Color, 
            ImageTransparency = v65.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v5.Event.Activated] = v41.props.onActivated, 
            [v5.Change.AbsoluteSize] = v41.onAbsoluteSizeChanged
        }), {
            UISizeConstraint = if l_standardSize_0 and v62 then v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v62, 1e999)
            }) else nil, 
            UIPadding = if l_standardSize_0 then v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v71), 
                PaddingRight = UDim.new(0, v71)
            }) else nil, 
            ButtonContent = v5.createElement("Frame", {
                AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v75), 
            LoadingImage = l_isDelayedInput_1 and v5.createElement(v13.Label, {
                Size = UDim2.new(v42, 0, 1, 0), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_l_delayedInputImage_0_0, 
                ImageColor3 = Color3.new(0, 0, 0), 
                ImageTransparency = 0.5, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v41.props.SliceCenter
            }), 
            HoverBackground = v69 and v5.createElement(v21, {
                sidePadding = if v23.fixGenericButtonHoverBackgroundPadding and l_standardSize_0 then UDim.new(0, v71) else nil, 
                image = if v23.enableGenericButtonHoverImage then l_hoverImage_0 else nil, 
                sliceCenter = if v23.enableGenericButtonHoverImage then v41.props.SliceCenter else nil
            }) or nil, 
            EventConnection = v23.useRobloxGuiFocusedChangedEventInGenericButton and v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RobloxGuiFocusedChanged, 
                callback = v41.onRobloxGuiFocusedChanged
            }) or nil
        });
    end);
end;
if v23.useRobloxGuiFocusedChangedEventInGenericButton then
    v25.didUpdate = function(v80, v81, v82) --[[ Line: 538 ]] --[[ Name: didUpdate ]]
        if v80.props.enableInputDelayed ~= v81.enableInputDelayed then
            v80:setState({
                targetLoadingProgress = v80.props.enableInputDelayed and 0 or 1
            });
        end;
        if not v80.state.isButtonUnfocused and v82.isButtonUnfocused and v80.state.targetLoadingProgress == 1 and v80.props.enableInputDelayed then
            v80:setState({
                targetLoadingProgress = 0
            });
        end;
    end;
end;
return v5.forwardRef(function(v83, v84) --[[ Line: 557 ]]
    -- upvalues: v5 (copy), v25 (copy), v7 (copy)
    return v5.createElement(v25, v7.Dictionary.join(v83, {
        forwardedRef = v84
    }));
end);