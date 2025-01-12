local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.UIBloxConfig);
local v7 = require(l_Parent_2.Core.Style.withStyle);
local v8 = require(l_Parent_1.Loading.LoadableImage);
local v9 = require(l_Parent_1.ImageSet.Images);
local v10 = require(l_Parent_1.Button.IconButton);
local v11 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_1.ImageSet.getIconSize);
local v13 = require(l_Parent_1.ImageSet.getIconSizeUDim2);
local v14 = require(l_Parent_1.Container.VerticalScrollView);
local v15 = require(l_Parent_1.Button.ActionBar);
local v16 = require(l_Parent_1.Button.StickyActionBar);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v18 = require(l_Parent_0.getPlatformConfig);
local v19 = require(l_Parent_0.DetailsPageHeader);
local v20 = require(l_Parent_0.DetailsPageBody);
local v21 = require(l_Parent_0.validateDetailsPageComponentList);
local v22 = v4.PureComponent:extend("DetailsPageTemplate");
v22.validateProps = v5.strictInterface({
    thumbnailImageUrl = v5.optional(v5.string), 
    thumbnailHeight = v5.optional(v5.number), 
    thumbnailAspectRatio = v5.optional(v5.Vector2), 
    titleText = v5.optional(v5.string), 
    subTitleText = v5.optional(v5.string), 
    actionBarLabelText = v5.optional(v5.string), 
    renderInfoContent = v5.optional(v5.callback), 
    actionBarProps = v5.optional(v15.validateProps), 
    actionBarWidth = v5.optional(v5.number), 
    componentList = v5.optional(v21), 
    dualPanelBreakpoint = v5.optional(v5.number), 
    sideMargin = v5.optional(v5.number), 
    bodyClipsDescendants = v5.optional(v5.boolean), 
    startingOffsetPosition = v5.optional(v5.number), 
    headerBarBackgroundHeight = v5.optional(v5.number), 
    onClose = v5.callback, 
    bannerPlaceholderGradient = v5.optional(v5.table), 
    bannerImageUrl = v5.optional(v5.string), 
    isFullscreen = v5.optional(v5.boolean), 
    renderFullscreenContent = v5.optional(v5.callback), 
    deviceType = v5.optional(v5.string), 
    isMobile = v5.optional(v5.boolean), 
    tokens = v5.optional(v5.table), 
    containerRef = v5.optional(v5.union(v5.table, v5.callback))
});
v22.defaultProps = {
    deviceType = l_DeviceType_0.Desktop, 
    isFullscreen = false
};
local function _(v23, v24) --[[ Line: 109 ]] --[[ Name: getHeaderPaddingHeight ]]
    -- upvalues: v18 (copy)
    local v25 = v18(v23.deviceType);
    return v24 - if v23.headerBarBackgroundHeight then v23.headerBarBackgroundHeight else v25.headerBarBackgroundHeight;
end;
v22.init = function(v27) --[[ Line: 117 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v18 (copy), l_DeviceType_0 (copy)
    v27.containerRef = v4.createRef();
    v27.scrollingFrameRef = v4.createRef();
    v27.scrolled = false;
    v27.state = {
        showStickyActionTopBar = false, 
        backgroundHeight = 500, 
        containerSize = Vector2.new(500, 500), 
        backgroundComponentPosition = 250
    };
    v27.onContainerSizeChange = function(v28) --[[ Line: 128 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            containerSize = v28.AbsoluteSize
        });
    end;
    v27.onBackgroundComponentFrameSizeChange = function(v29) --[[ Line: 134 ]]
        -- upvalues: v27 (copy), v18 (ref)
        v27:setState(function(_, v31) --[[ Line: 136 ]]
            -- upvalues: v29 (copy), v18 (ref)
            local l_Y_0 = v29.AbsoluteSize.Y;
            local v33 = v18(v31.deviceType);
            v33 = math.max(0, l_Y_0 - if v31.headerBarBackgroundHeight then v31.headerBarBackgroundHeight else v33.headerBarBackgroundHeight) / 2;
            return {
                backgroundHeight = l_Y_0, 
                backgroundComponentPosition = v33
            };
        end);
    end;
    v27.canvasPositionChange = function(v34) --[[ Line: 147 ]]
        -- upvalues: v27 (copy), v18 (ref), l_DeviceType_0 (ref)
        v27.scrolled = true;
        v27:setState(function(v35, v36) --[[ Line: 150 ]]
            -- upvalues: v18 (ref), v34 (copy), v27 (ref), l_DeviceType_0 (ref)
            local l_backgroundHeight_0 = v35.backgroundHeight;
            local v38 = v18(v36.deviceType);
            local v39 = l_backgroundHeight_0 - if v36.headerBarBackgroundHeight then v36.headerBarBackgroundHeight else v38.headerBarBackgroundHeight;
            l_backgroundHeight_0 = math.max(0, v39 - v34.CanvasPosition.Y) / 2;
            if v39 < v34.CanvasPosition.Y then
                if v35.showStickyActionTopBar == false and v27.props.deviceType ~= l_DeviceType_0.Phone then
                    return {
                        showStickyActionTopBar = true
                    };
                else
                    return nil;
                end;
            elseif v35.showStickyActionTopBar == true then
                return {
                    showStickyActionTopBar = false, 
                    backgroundComponentPosition = l_backgroundHeight_0
                };
            else
                return {
                    backgroundComponentPosition = l_backgroundHeight_0
                };
            end;
        end);
    end;
end;
v22.render = function(v40) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceType_0 (copy), v18 (copy), v7 (copy), v12 (copy), v11 (copy), v4 (copy), v13 (copy), v10 (copy), v9 (copy), v8 (copy), v16 (copy), v14 (copy), v19 (copy), v6 (copy), v20 (copy), v15 (copy)
    local v41 = v40.props.deviceType == l_DeviceType_0.Phone;
    local v42 = v18(v40.props.deviceType);
    local v43 = if v40.props.thumbnailHeight then v40.props.thumbnailHeight else v42.thumbnailHeight;
    local v44 = if v40.props.headerBarBackgroundHeight then v40.props.headerBarBackgroundHeight else v42.headerBarBackgroundHeight;
    local v45 = if v40.props.sideMargin then v40.props.sideMargin else v42.sideMargin;
    local v46 = if v40.props.dualPanelBreakpoint then v40.props.dualPanelBreakpoint else v42.dualPanelBreakpoint;
    local l_props_0 = v40.props;
    local l_backgroundHeight_1 = v40.state.backgroundHeight;
    local v49 = v18(l_props_0.deviceType);
    local v50 = l_backgroundHeight_1 - if l_props_0.headerBarBackgroundHeight then l_props_0.headerBarBackgroundHeight else v49.headerBarBackgroundHeight;
    l_props_0 = v40.state.backgroundComponentPosition;
    l_backgroundHeight_1 = v40.state.containerSize;
    v49 = v40.props.isFullscreen;
    local l_renderFullscreenContent_0 = v40.props.renderFullscreenContent;
    local v52 = not v41 and (v49 and l_renderFullscreenContent_0 and true or false);
    return v7(function(v53) --[[ Line: 206 ]]
        -- upvalues: v40 (copy), v41 (copy), v12 (ref), v11 (ref), v44 (copy), v4 (ref), v13 (ref), v10 (ref), v52 (copy), v9 (ref), v8 (ref), l_props_0 (copy), l_backgroundHeight_1 (copy), v16 (ref), v14 (ref), v50 (copy), v19 (ref), v43 (copy), v6 (ref), v45 (copy), v20 (ref), v46 (copy), l_renderFullscreenContent_0 (copy), v15 (ref)
        local l_Theme_0 = v53.Theme;
        local v55 = v40.props.bannerImageUrl == nil;
        local v56 = v40.props.bannerPlaceholderGradient or {
            Rotation = 90, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
            })
        };
        local v57 = v41 and (v12(v11.Large) + 22) / 2 or v44 / 2;
        local v58 = v41 and v40.props.actionBarProps;
        return v4.createElement("TextButton", {
            Text = "", 
            AutoButtonColor = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v4.Ref] = if v40.props.containerRef then v40.props.containerRef else v40.containerRef, 
            [v4.Change.AbsoluteSize] = v40.onContainerSizeChange
        }, {
            CloseButtonFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = v13(v11.Large), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 22, 0, v57), 
                ZIndex = 2
            }, {
                CloseButton = v4.createElement(v10, {
                    size = UDim2.fromScale(1, 1), 
                    icon = v52 and v9["icons/navigation/pushBack"] or v9["icons/navigation/close"], 
                    iconColor3 = v53.Theme.UIEmphasis.Color, 
                    iconSize = v11.Medium, 
                    onActivated = v40.props.onClose, 
                    showBackground = v40.state.showStickyActionTopBar == false, 
                    backgroundColor = v53.Theme.BackgroundUIDefault
                })
            }), 
            BackgroundDetailsFrame = v4.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                [v4.Change.AbsoluteSize] = v40.onBackgroundComponentFrameSizeChange
            }, {
                GradientPlaceholder = v55 and v4.createElement("UIGradient", v56) or nil, 
                UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.7777777777777777
                }), 
                BackgroundImage = v55 == false and v4.createElement(v8, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0, l_props_0), 
                    Size = UDim2.new(0, l_backgroundHeight_1.x, 1, 0), 
                    Image = v40.props.bannerImageUrl, 
                    ScaleType = Enum.ScaleType.Crop
                }) or nil
            }), 
            StickyActionBarFrame = (not not v40.state.showStickyActionTopBar or v52) and v4.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 0, v44), 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                StickyActionBar = v4.createElement(v16, {
                    actionBarProps = v40.props.actionBarProps, 
                    actionBarWidth = v40.props.actionBarWidth, 
                    infoProps = {
                        icon = v40.props.thumbnailImageUrl, 
                        title = v40.props.titleText
                    }
                })
            }) or nil, 
            ContentScrollingFrame = v4.createElement(v14, {
                size = UDim2.fromScale(1, 1), 
                canvasSizeY = UDim.new(1, 0), 
                useAutomaticCanvasSize = true, 
                scrollingEnabled = not v52, 
                [v4.Change.CanvasPosition] = v40.canvasPositionChange, 
                scrollingFrameRef = v40.scrollingFrameRef
            }, {
                Layout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v50), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                MainView = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    HeaderContainer = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v44), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        DetailsPageHeader = v4.createElement(v19, {
                            thumbnailImageUrl = v40.props.thumbnailImageUrl, 
                            thumbnailAspectRatio = v40.props.thumbnailAspectRatio, 
                            thumbnailHeight = v43, 
                            titleText = v40.props.titleText, 
                            subTitleText = v40.props.subTitleText, 
                            actionBarLabelText = if v6.enableDetailsPageHeaderActionBarLabel then v40.props.actionBarLabelText else nil, 
                            renderInfoContent = v40.props.renderInfoContent, 
                            actionBarProps = if v6.hideHeaderActionBarWhenStickyBarActive then if v40.state.showStickyActionTopBar or v52 then nil else v40.props.actionBarProps else v40.props.actionBarProps, 
                            actionBarWidth = v40.props.actionBarWidth, 
                            headerBarBackgroundHeight = v44, 
                            sideMargin = v45, 
                            deviceType = v40.props.deviceType
                        })
                    }), 
                    BodyContainer = v4.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        LayoutOrder = 2, 
                        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                        BorderSizePixel = 0, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        BodyContainerSafeArea = v4.createElement("Frame", {
                            Size = UDim2.fromOffset(math.min(l_backgroundHeight_1.x, l_backgroundHeight_1.y * 1.7777777777777777), 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            Position = UDim2.fromScale(0.5, 0), 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            DetailsPageBody = v4.createElement(v20, {
                                titleText = v40.props.titleText, 
                                subTitleText = v40.props.subTitleText, 
                                renderInfoContent = v40.props.renderInfoContent, 
                                bodyClipsDescendants = v40.props.bodyClipsDescendants, 
                                componentList = v40.props.componentList, 
                                dualPanelBreakpoint = v46, 
                                sideMargin = v45, 
                                deviceType = v40.props.deviceType
                            })
                        })
                    })
                }), 
                MobileActionViewPadding = v58 and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 72), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                })
            }), 
            FullscreenFrame = v52 and v4.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, -v44), 
                Position = UDim2.fromOffset(0, v44), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                ZIndex = 2
            }, {
                FullscreenContent = l_renderFullscreenContent_0()
            }) or nil, 
            MobileActionBarFrame = v58 and v4.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 3
            }, {
                GradientBar = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0, 1), 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    Gradient = v4.createElement("UIGradient", {
                        Rotation = 270, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0.25), 
                            NumberSequenceKeypoint.new(1, 0.9999)
                        })
                    })
                }), 
                ActionBar = v4.createElement(v15, {
                    button = v40.props.actionBarProps.button, 
                    icons = v40.props.actionBarProps.icons
                })
            })
        });
    end);
end;
v22.didMount = function(v59) --[[ Line: 432 ]] --[[ Name: didMount ]]
    if v59.containerRef.current then
        v59.onContainerSizeChange(v59.containerRef.current);
    end;
end;
v22.didUpdate = function(v60) --[[ Line: 438 ]] --[[ Name: didUpdate ]]
    -- upvalues: v18 (copy)
    local v61 = v18(v60.props.deviceType);
    if v60.scrolled == false and v60.scrollingFrameRef.current then
        local v62 = if v60.props.startingOffsetPosition then v60.props.startingOffsetPosition else v61.startingOffsetPosition;
        local v63 = 0;
        local l_props_1 = v60.props;
        local l_backgroundHeight_2 = v60.state.backgroundHeight;
        local v66 = v18(l_props_1.deviceType);
        local v67 = math.max(v63, l_backgroundHeight_2 - (if l_props_1.headerBarBackgroundHeight then l_props_1.headerBarBackgroundHeight else v66.headerBarBackgroundHeight) - v62);
        v60.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, v67);
    end;
end;
return v22;