local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_2.Core.Style.withStyle);
local v8 = require(l_Parent_3.Otter);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v10 = require(l_Parent_1.ImageSet.getIconSize);
local v11 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_1.ImageSet.Images);
local v13 = require(l_Parent_1.Button.IconButton);
local v14 = require(l_Parent_0.ThumbnailButton);
local v15 = require(l_Parent_0.getShowItems);
local v16 = require(l_Parent_0.calcMediaGallerySizesFromWidth);
local v17 = require(l_Parent_0.calcMediaGallerySizesFromHeight);
local v18 = v10(v11.Medium);
local v19 = {
    frequency = 4, 
    dampingRatio = 1
};
local v20 = v5.Component:extend("MediaGalleryPreview");
v20.validateProps = v6.strictInterface({
    layoutOrder = v6.optional(v6.integer), 
    size = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    position = v6.optional(v6.UDim2), 
    items = v6.array(v6.strictInterface({
        imageId = v6.string, 
        isVideo = v6.optional(v6.boolean)
    })), 
    numberOfThumbnails = v6.optional(v6.integer), 
    onPreviewActivated = v6.optional(v6.callback), 
    onVideoPlayActivated = v6.optional(v6.callback)
});
v20.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    numberOfThumbnails = 5
};
v20.getDerivedStateFromProps = function(v21, v22) --[[ Line: 76 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v15 (copy)
    if v22.items == v21.items and v22.numberOfThumbnails == v21.numberOfThumbnails then
        return;
    else
        local v23, v24, v25 = v15(v21);
        return {
            items = v21.items, 
            numberOfThumbnails = v21.numberOfThumbnails, 
            itemsToShow = v23, 
            videoItemsSize = v24, 
            imageItemsSize = v25, 
            animationOn = v25 > 1, 
            animatedIndex = v24 + 1, 
            selectedIndex = v24 + 1
        };
    end;
end;
v20.init = function(v26) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v5 (copy)
    v26.state = {
        items = nil, 
        numberOfThumbnails = 1, 
        itemsToShow = nil, 
        videoItemsSize = 0, 
        imageItemsSize = 0, 
        animationOn = false, 
        animatedIndex = 1, 
        selectedIndex = 1, 
        showArrows = false, 
        focusIndex = 1
    };
    v26.animationTime = 0;
    v26.scrolling = false;
    v26.scrollMotor = v8.createSingleMotor(0);
    local v27, v28 = v5.createBinding(UDim2.fromScale(1, 1));
    v26.contentSize = v27;
    v26.updateContentSize = v28;
    v27, v28 = v5.createBinding(UDim2.fromScale(1, 0.5));
    v26.previewSize = v27;
    v26.updatePreviewSize = v28;
    v27, v28 = v5.createBinding(UDim2.fromScale(1, 0.5));
    v26.paginationSize = v27;
    v26.updatePaginationSize = v28;
    v27, v28 = v5.createBinding(UDim2.fromScale(0, 0));
    v26.thumbnailSize = v27;
    v26.updateThumbnailSize = v28;
    v27, v28 = v5.createBinding(Vector2.new(0, 0));
    v26.canvasPosition = v27;
    v26.updateCanvasPosition = v28;
    v27, v28 = v5.createBinding(0);
    v26.progress = v27;
    v26.updateProgress = v28;
    v27, v28 = v5.createBinding(0);
    v26.previewTransparency = v27;
    v26.updatePreviewTransparency = v28;
    v26.onResize = function(v29) --[[ Line: 121 ]]
        -- upvalues: v26 (copy)
        v26:updateSizes(v29);
        v26.updateCanvasPosition(Vector2.new(v26:getCanvasPositionX(), 0));
    end;
    v26.onMouseLeave = function(_, v31) --[[ Line: 126 ]]
        -- upvalues: v26 (copy)
        if v31.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v26.resetAnimation();
            v26:setState(function(v32) --[[ Line: 132 ]]
                -- upvalues: v26 (ref)
                local l_selectedIndex_0 = v32.selectedIndex;
                local v34 = v26.getNextFocusIndex(l_selectedIndex_0);
                return {
                    animationOn = v32.imageItemsSize > 1, 
                    animatedIndex = l_selectedIndex_0, 
                    focusIndex = v34
                };
            end);
            return;
        end;
    end;
    v26.onPreviewActivated = function() --[[ Line: 144 ]]
        -- upvalues: v26 (copy)
        v26.resetAnimation();
        v26:setState({
            animationOn = false
        });
        if v26.props.onPreviewActivated then
            local l_originalIndex_0 = v26.state.itemsToShow[v26.state.selectedIndex].originalIndex;
            v26.props.onPreviewActivated(l_originalIndex_0);
        end;
    end;
    v26.onMouseEnterPagination = function(_, v37) --[[ Line: 159 ]]
        -- upvalues: v26 (copy)
        if v37.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v26:setState(function(v38) --[[ Line: 164 ]]
                if v38.showArrows then
                    return;
                else
                    return {
                        showArrows = true
                    };
                end;
            end);
            return;
        end;
    end;
    v26.onMouseLeavePagination = function(_, v40) --[[ Line: 175 ]]
        -- upvalues: v26 (copy)
        if v40.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v26:setState(function(v41) --[[ Line: 180 ]]
                if not v41.showArrows then
                    return;
                else
                    return {
                        showArrows = false
                    };
                end;
            end);
            return;
        end;
    end;
    v26.onCycleLeftActivated = function() --[[ Line: 191 ]]
        -- upvalues: v26 (copy)
        if v26.scrolling then
            return;
        else
            local v42 = math.max(v26.state.focusIndex - 1, 1);
            v26.resetAnimation();
            v26:setState({
                animationOn = false, 
                focusIndex = v42
            });
            return;
        end;
    end;
    v26.onCycleRightActivated = function() --[[ Line: 205 ]]
        -- upvalues: v26 (copy)
        if v26.scrolling then
            return;
        else
            local v43 = #v26.props.items;
            local v44 = math.min(v26.state.focusIndex + 1, v43);
            v26.resetAnimation();
            v26:setState({
                animationOn = false, 
                focusIndex = v44
            });
            return;
        end;
    end;
    v26.onItemActivated = function(v45) --[[ Line: 220 ]]
        -- upvalues: v26 (copy)
        local l_isVideo_0 = v26.state.itemsToShow[v45].isVideo;
        v26.resetAnimation();
        v26:setState({
            animationOn = false, 
            selectedIndex = not l_isVideo_0 and v45 or nil
        });
        if l_isVideo_0 then
            v26.onVideoPlayActivated(v45);
        end;
    end;
    v26.onItemPlayActivated = function(v47) --[[ Line: 235 ]]
        -- upvalues: v26 (copy)
        v26.resetAnimation();
        v26:setState({
            animationOn = false
        });
        v26.onVideoPlayActivated(v47);
    end;
    v26.onVideoPlayActivated = function(v48) --[[ Line: 244 ]]
        -- upvalues: v26 (copy)
        if v26.props.onVideoPlayActivated then
            local l_originalIndex_1 = v26.state.itemsToShow[v48].originalIndex;
            v26.props.onVideoPlayActivated(l_originalIndex_1);
        end;
    end;
    v26.getNextFocusIndex = function(v50) --[[ Line: 253 ]]
        -- upvalues: v26 (copy)
        local l_focusIndex_0 = v26.state.focusIndex;
        local l_numberOfThumbnails_0 = v26.props.numberOfThumbnails;
        if v50 < l_focusIndex_0 then
            return v50;
        elseif l_focusIndex_0 + l_numberOfThumbnails_0 <= v50 then
            return v50 - l_numberOfThumbnails_0 + 1;
        else
            return l_focusIndex_0;
        end;
    end;
    v26.resetAnimation = function() --[[ Line: 268 ]]
        -- upvalues: v26 (copy)
        v26.animationTime = 0;
        v26.updateProgress(0);
        v26.updatePreviewTransparency(0);
    end;
    v26.renderSteppedCallback = function(v53) --[[ Line: 274 ]]
        -- upvalues: v26 (copy)
        v26.animationTime = v26.animationTime + v53;
        local v54 = v26.animationTime - 4.5;
        if v26.animationTime > 5 then
            v26.animationTime = 0;
            v26.updateProgress(0);
            local l_animatedIndex_0 = v26.state.animatedIndex;
            local l_videoItemsSize_0 = v26.state.videoItemsSize;
            local l_imageItemsSize_0 = v26.state.imageItemsSize;
            local v58 = (l_animatedIndex_0 - l_videoItemsSize_0) % l_imageItemsSize_0 + 1 + l_videoItemsSize_0;
            local v59 = v26.getNextFocusIndex(v58);
            v26:setState({
                animatedIndex = v58, 
                selectedIndex = v58, 
                focusIndex = v59
            });
            return;
        else
            v26.updateProgress(v26.animationTime / 5);
            if v54 > 0 then
                v26.updatePreviewTransparency(v54 / 0.5);
            end;
            return;
        end;
    end;
    v26.scrollMotorOnStep = function(v60) --[[ Line: 302 ]]
        -- upvalues: v26 (copy)
        v26.updateCanvasPosition(Vector2.new(v60, 0));
    end;
    v26.scrollMotorOnComplete = function() --[[ Line: 306 ]]
        -- upvalues: v26 (copy)
        v26.scrolling = false;
    end;
    v26.scrollMotor:onStep(v26.scrollMotorOnStep);
    v26.scrollMotor:onComplete(v26.scrollMotorOnComplete);
end;
v20.render = function(v61) --[[ Line: 314 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v5 (copy), v13 (copy), v18 (copy), v12 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local l_layoutOrder_0 = v61.props.layoutOrder;
    local l_anchorPoint_0 = v61.props.anchorPoint;
    local l_position_0 = v61.props.position;
    local l_size_0 = v61.props.size;
    local l_numberOfThumbnails_1 = v61.props.numberOfThumbnails;
    local v67 = #v61.props.items;
    local l_itemsToShow_0 = v61.state.itemsToShow;
    local l_showArrows_0 = v61.state.showArrows;
    local l_focusIndex_1 = v61.state.focusIndex;
    local l_selectedIndex_1 = v61.state.selectedIndex;
    local l_animationOn_0 = v61.state.animationOn;
    local l_videoItemsSize_1 = v61.state.videoItemsSize;
    local l_imageItemsSize_1 = v61.state.imageItemsSize;
    local v75 = false;
    if v67 > 1 then
        v75 = not l_animationOn_0;
    end;
    local v76 = l_animationOn_0 and (l_selectedIndex_1 - l_videoItemsSize_1) % l_imageItemsSize_1 + 1 + l_videoItemsSize_1 or nil;
    local v77 = l_numberOfThumbnails_1 < v67;
    local v78 = l_focusIndex_1 <= 1;
    local v79 = l_focusIndex_1 + l_numberOfThumbnails_1 > #l_itemsToShow_0;
    return v7(function(v80) --[[ Line: 337 ]]
        -- upvalues: v5 (ref), l_layoutOrder_0 (copy), l_size_0 (copy), l_anchorPoint_0 (copy), l_position_0 (copy), v61 (copy), v75 (copy), l_animationOn_0 (copy), v76 (copy), l_itemsToShow_0 (copy), l_selectedIndex_1 (copy), v77 (copy), l_showArrows_0 (copy), v13 (ref), v18 (ref), v12 (ref), v78 (copy), v79 (copy), l_EventConnection_0 (ref), l_RunService_0 (ref)
        return v5.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v61.onResize, 
            [v5.Event.InputEnded] = v75 and v61.onMouseLeave or nil
        }, {
            Content = v5.createElement("Frame", {
                Size = v61.contentSize, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 24)
                }), 
                Preview = v5.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = v61.previewSize, 
                    BackgroundTransparency = 1
                }, {
                    AnimationLabel = l_animationOn_0 and v5.createElement("ImageLabel", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = v76 and l_itemsToShow_0[v76].imageId, 
                        BackgroundTransparency = 1, 
                        ZIndex = -1
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }) or nil, 
                    Button = v5.createElement("ImageButton", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = l_itemsToShow_0[l_selectedIndex_1].imageId, 
                        ImageTransparency = v61.previewTransparency, 
                        BackgroundTransparency = 1, 
                        AutoButtonColor = false, 
                        ZIndex = 1, 
                        [v5.Event.Activated] = v61.onPreviewActivated
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    })
                }), 
                Pagination = v5.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = v61.paginationSize, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Event.InputBegan] = v77 and v61.onMouseEnterPagination or nil, 
                    [v5.Event.InputEnded] = v77 and v61.onMouseLeavePagination or nil
                }, {
                    LeftArrow = l_showArrows_0 and v5.createElement(v13, {
                        size = UDim2.new(0, v18, 1, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        position = UDim2.fromScale(0, 0.5), 
                        icon = v12["icons/actions/cycleLeft"], 
                        isDisabled = v78, 
                        onActivated = v61.onCycleLeftActivated
                    }) or nil, 
                    Scroller = v61:renderScroller(v80), 
                    RightArrow = l_showArrows_0 and v5.createElement(v13, {
                        size = UDim2.new(0, v18, 1, 0), 
                        anchorPoint = Vector2.new(1, 0.5), 
                        position = UDim2.fromScale(1, 0.5), 
                        icon = v12["icons/actions/cycleRight"], 
                        isDisabled = v79, 
                        onActivated = v61.onCycleRightActivated
                    }) or nil
                })
            }), 
            EventConnection = l_animationOn_0 and v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = v61.renderSteppedCallback
            }) or nil
        });
    end);
end;
v20.renderScroller = function(v81, v82) --[[ Line: 423 ]] --[[ Name: renderScroller ]]
    -- upvalues: v5 (copy), v18 (copy)
    return v5.createElement("ScrollingFrame", {
        Size = UDim2.new(1, -v18 * 2, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        ClipsDescendants = true, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = v81.canvasPosition
    }, v81:renderThumbnails(v82));
end;
v20.renderThumbnails = function(v83, v84) --[[ Line: 437 ]] --[[ Name: renderThumbnails ]]
    -- upvalues: v5 (copy), v14 (copy)
    local l_selectedIndex_2 = v83.state.selectedIndex;
    local l_animationOn_1 = v83.state.animationOn;
    local l_animatedIndex_1 = v83.state.animatedIndex;
    local v88 = {
        ListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        })
    };
    for v89, v90 in ipairs(v83.state.itemsToShow) do
        local l_isVideo_1 = v90.isVideo;
        local v92 = v89 == l_selectedIndex_2;
        local v93 = l_animationOn_1 and v89 == l_animatedIndex_1;
        local v94 = v90.imageId and v90.imageId ~= "";
        v88["item" .. v89] = v5.createElement("Frame", {
            LayoutOrder = v89, 
            Size = v83.thumbnailSize, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Thumbnail = v5.createElement(v14, {
                itemKey = v89, 
                imageId = v90.imageId, 
                isVideo = v90.isVideo, 
                isSelected = v92, 
                onActivated = v94 and v83.onItemActivated or nil, 
                onPlayActivated = l_isVideo_1 and v83.onItemPlayActivated or nil, 
                useScaledPlayButton = true
            }), 
            TimerBar = v93 and v83:renderTimerBar(v84) or nil
        });
    end;
    return v88;
end;
v20.renderTimerBar = function(v95, v96) --[[ Line: 479 ]] --[[ Name: renderTimerBar ]]
    -- upvalues: v5 (copy)
    local l_UIDefault_0 = v96.Theme.UIDefault;
    local l_SecondaryContent_0 = v96.Theme.SecondaryContent;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 2), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ZIndex = 100
    }, {
        Background = v5.createElement("Frame", {
            Size = v95.thumbnailSize, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_UIDefault_0.Color, 
            BackgroundTransparency = l_UIDefault_0.Transparency
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Progress = v5.createElement("Frame", {
                Size = v95.progress:map(function(v99) --[[ Line: 504 ]]
                    return UDim2.fromScale(v99, 1);
                end), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Foreground = v5.createElement("Frame", {
                    Size = v95.thumbnailSize, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_SecondaryContent_0.Color, 
                    BackgroundTransparency = l_SecondaryContent_0.Transparency
                }, {
                    Corner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            })
        })
    });
end;
v20.didUpdate = function(v100, _, v102) --[[ Line: 526 ]] --[[ Name: didUpdate ]]
    if v100.state.focusIndex ~= v102.focusIndex then
        v100:scrollToNewIndex();
    end;
    if v100.state.selectedIndex ~= v102.selectedIndex then
        v100.updatePreviewTransparency(0);
    end;
end;
v20.updateSizes = function(v103, v104) --[[ Line: 536 ]] --[[ Name: updateSizes ]]
    -- upvalues: v16 (copy), v17 (copy)
    local l_X_0 = v104.AbsoluteSize.X;
    local l_Y_0 = v104.AbsoluteSize.Y;
    local l_numberOfThumbnails_2 = v103.props.numberOfThumbnails;
    local v108 = v16(l_X_0, l_numberOfThumbnails_2);
    if l_Y_0 < v108.contentSize.Y.Offset then
        v108 = v17(l_Y_0, l_numberOfThumbnails_2);
    end;
    v103.updateContentSize(v108.contentSize);
    v103.updatePreviewSize(v108.previewSize);
    v103.updatePaginationSize(v108.paginationSize);
    v103.updateThumbnailSize(v108.thumbnailSize);
end;
v20.getCanvasPositionX = function(v109) --[[ Line: 552 ]] --[[ Name: getCanvasPositionX ]]
    local l_focusIndex_2 = v109.state.focusIndex;
    local l_Offset_0 = v109.thumbnailSize:getValue().X.Offset;
    return (l_focusIndex_2 - 1) * (l_Offset_0 + 12);
end;
v20.scrollToNewIndex = function(v112) --[[ Line: 558 ]] --[[ Name: scrollToNewIndex ]]
    -- upvalues: v8 (copy), v19 (copy)
    local l_X_1 = v112.canvasPosition:getValue().X;
    local v114 = v112:getCanvasPositionX();
    v112.scrollMotor:setGoal(v8.instant(l_X_1));
    v112.scrollMotor:setGoal(v8.spring(v114, v19));
    v112.scrolling = true;
end;
return v20;