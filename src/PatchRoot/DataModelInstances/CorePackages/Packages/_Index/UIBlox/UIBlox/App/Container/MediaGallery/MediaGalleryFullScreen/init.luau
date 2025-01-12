local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v8 = require(l_Parent_1.ImageSet.Images);
local v9 = require(l_Parent_1.Button.IconButton);
local v10 = require(l_Parent_2.Core.Style.withStyle);
local v11 = require(l_Parent_0.ThumbnailButton);
local v12 = require(l_Parent_0.getShowItems);
local v13 = v5.Component:extend("MediaGalleryFullScreen");
v13.validateProps = v6.strictInterface({
    layoutOrder = v6.optional(v6.integer), 
    size = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    position = v6.optional(v6.UDim2), 
    items = v6.array(v6.interface({
        imageId = v6.string, 
        isVideo = v6.optional(v6.boolean)
    })), 
    showIndex = v6.optional(v6.integer), 
    onVideoPlayActivated = v6.optional(v6.callback)
});
v13.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    showIndex = 1
};
v13.getDerivedStateFromProps = function(v14, v15) --[[ Line: 58 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v12 (copy)
    local v16 = nil;
    if v15.items ~= v14.items then
        local v17 = v12(v14);
        v16 = {
            items = v14.items, 
            itemsToShow = v17, 
            showArrows = #v17 > 1, 
            focusIndex = math.min(v15.focusIndex or 1, #v17)
        };
    end;
    if v15.showIndex ~= v14.showIndex then
        v16 = v16 or {};
        v16.showIndex = v14.showIndex;
        v16.focusIndex = math.min(v14.showIndex, #v14.items);
    end;
    return v16;
end;
v13.init = function(v18) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v18.state = {
        items = nil, 
        itemsToShow = nil, 
        showArrows = true, 
        focusIndex = 1, 
        showIndex = 1
    };
    local v19, v20 = v5.createBinding(UDim2.fromScale(1, 1));
    v18.itemFrameSize = v19;
    v18.updateItemFrameSize = v20;
    v19, v20 = v5.createBinding(UDim2.new(0, 96, 1, 0));
    v18.arrowButtonSize = v19;
    v18.updateArrowButtonSize = v20;
    v19, v20 = v5.createBinding(UDim2.new(0.5, 0, 0.5, 0));
    v18.leftArrowPosition = v19;
    v18.updateLeftArrowPosition = v20;
    v19, v20 = v5.createBinding(UDim2.new(0.5, 0, 0.5, 0));
    v18.rightArrowPosition = v19;
    v18.updateRightArrowPosition = v20;
    v18.onResize = function(v21) --[[ Line: 95 ]]
        -- upvalues: v18 (copy)
        local l_X_0 = v21.AbsoluteSize.X;
        local l_Y_0 = v21.AbsoluteSize.Y;
        local v24 = math.floor(l_Y_0 * 1.7777777777777777);
        if l_X_0 < v24 then
            v24 = l_X_0;
            l_Y_0 = math.floor(v24 / 1.7777777777777777);
        end;
        v18.updateItemFrameSize(UDim2.new(0, v24, 0, l_Y_0));
    end;
    v18.onImageResize = function(v25) --[[ Line: 109 ]]
        -- upvalues: v18 (copy)
        local l_X_1 = v25.AbsoluteSize.X;
        local l_Y_1 = v25.AbsoluteSize.Y;
        v18.updateLeftArrowPosition(UDim2.new(0.5, -l_X_1 / 2, 0.5, 0));
        v18.updateRightArrowPosition(UDim2.new(0.5, l_X_1 / 2, 0.5, 0));
        v18.updateArrowButtonSize(UDim2.new(0, 96, 0, l_Y_1));
    end;
    v18.onUserInputBegan = function(v28) --[[ Line: 118 ]]
        -- upvalues: v18 (copy)
        if v28.UserInputType ~= Enum.UserInputType.Keyboard then
            return;
        else
            local l_focusIndex_0 = v18.state.focusIndex;
            local v30 = #v18.props.items;
            if v28.KeyCode == Enum.KeyCode.Left and l_focusIndex_0 > 1 then
                v18.showPreviousItem();
                return;
            else
                if v28.KeyCode == Enum.KeyCode.Right and l_focusIndex_0 < v30 then
                    v18.showNextItem();
                end;
                return;
            end;
        end;
    end;
    v18.showPreviousItem = function() --[[ Line: 133 ]]
        -- upvalues: v18 (copy)
        local v31 = v18.state.focusIndex - 1;
        if v31 < 1 then
            v31 = 1;
        end;
        v18:setState({
            focusIndex = v31
        });
    end;
    v18.showNextItem = function() --[[ Line: 144 ]]
        -- upvalues: v18 (copy)
        local v32 = #v18.props.items;
        local v33 = v18.state.focusIndex + 1;
        if v32 < v33 then
            v33 = v32;
        end;
        v18:setState({
            focusIndex = v33
        });
    end;
    v18.cycleNext = function() --[[ Line: 156 ]]
        -- upvalues: v18 (copy)
        local v34 = #v18.props.items;
        local v35 = v18.state.focusIndex + 1;
        if v34 < v35 then
            v35 = 1;
        end;
        v18:setState({
            focusIndex = v35
        });
    end;
    v18.onVideoPlayActivated = function(v36) --[[ Line: 168 ]]
        -- upvalues: v18 (copy)
        if v18.props.onVideoPlayActivated then
            local l_originalIndex_0 = v18.state.itemsToShow[v36].originalIndex;
            v18.props.onVideoPlayActivated(l_originalIndex_0);
        end;
    end;
end;
local function v45(_, v39, v40, v41, v42, v43, v44) --[[ Line: 177 ]] --[[ Name: renderArrowButton ]]
    -- upvalues: v5 (copy), v9 (copy), v8 (copy)
    return v5.createElement("Frame", {
        Size = v43, 
        AnchorPoint = v41, 
        Position = v42, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 100
    }, {
        ArrowButton = v5.createElement(v9, {
            size = UDim2.fromScale(1, 1), 
            icon = v8[v39], 
            showBackground = true, 
            backgroundTransparency = 1, 
            isDisabled = v40, 
            onActivated = v44
        })
    });
end;
v13.render = function(v46) --[[ Line: 197 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy)
    return v10(function(v47) --[[ Line: 198 ]]
        -- upvalues: v46 (copy)
        return v46:renderWithProvider(v47);
    end);
end;
v13.renderWithProvider = function(v48, v49) --[[ Line: 203 ]] --[[ Name: renderWithProvider ]]
    -- upvalues: v5 (copy), v45 (copy), v11 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_layoutOrder_0 = v48.props.layoutOrder;
    local l_anchorPoint_0 = v48.props.anchorPoint;
    local l_position_0 = v48.props.position;
    local l_size_0 = v48.props.size;
    local l_itemsToShow_0 = v48.state.itemsToShow;
    local l_showArrows_0 = v48.state.showArrows;
    local l_focusIndex_1 = v48.state.focusIndex;
    local v57 = l_itemsToShow_0[l_focusIndex_1];
    local v58 = l_focusIndex_1 <= 1;
    local v59 = #l_itemsToShow_0 <= l_focusIndex_1;
    return v5.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v5.Change.AbsoluteSize] = v48.onResize
    }, {
        LeftArrow = if l_showArrows_0 then v45(v49, "icons/actions/cycleLeft", v58, Vector2.new(1, 0.5), v48.leftArrowPosition, v48.arrowButtonSize, v48.showPreviousItem) else nil, 
        FullScreenItemFrame = v5.createElement("Frame", {
            Size = UDim2.new(1, -192, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v48.onImageResize
        }, {
            UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.7777777777777777
            }), 
            Item = v5.createElement(v11, {
                itemKey = l_focusIndex_1, 
                imageId = v57.imageId, 
                isVideo = v57.isVideo, 
                userInteractionEnabled = true, 
                onActivated = v48.cycleNext, 
                onPlayActivated = v57.isVideo and v48.onVideoPlayActivated or nil
            })
        }), 
        RightArrow = if l_showArrows_0 then v45(v49, "icons/actions/cycleRight", v59, Vector2.new(0, 0.5), v48.rightArrowPosition, v48.arrowButtonSize, v48.showNextItem) else nil, 
        EventConnection = l_showArrows_0 and v5.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v48.onUserInputBegan
        }) or nil
    });
end;
return v13;