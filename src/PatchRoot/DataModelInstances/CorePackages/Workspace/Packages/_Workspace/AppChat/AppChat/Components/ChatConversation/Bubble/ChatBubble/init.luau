local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.ChatBubbleEnum);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v10 = {
    contentWidth = 0, 
    isIncoming = false, 
    isRepliedTo = false, 
    imageColor = Color3.new(0, 0, 0), 
    imageTransparency = 0, 
    padding = 0, 
    hasTail = false, 
    onAbsoluteSizeChanged = function(_) --[[ Line: 34 ]] --[[ Name: onAbsoluteSizeChanged ]]

    end, 
    setContentWidth = function(_) --[[ Line: 35 ]] --[[ Name: setContentWidth ]]

    end, 
    handleEvent = function(_) --[[ Line: 36 ]] --[[ Name: handleEvent ]]

    end, 
    containerChildren = {}
};
ChatBubble = function(v11) --[[ Line: 48 ]] --[[ Name: ChatBubble ]]
    -- upvalues: v4 (copy), v10 (copy), v5 (copy), v6 (copy), v2 (copy), l_Object_0 (copy)
    local v12 = v4.Dictionary.union(v10, v11);
    local v13 = UDim.new(0, v12.padding or v10.padding);
    local v14 = v5.TAIL_WIDTH + if v6() and v12.isRepliedTo then v5.REPLIED_TO_MARKER_WIDTH + v5.REPLIED_TO_MARKER_GAP else 0;
    local v15 = if v12.isIncoming then UDim2.new(0, v14, 0, 0) else UDim2.new(1, -v14, 0, 0);
    local l_BUBBLE_0 = v5.BUBBLE;
    if v12.hasTail then
        l_BUBBLE_0 = if v12.isIncoming then v5.RECEIVED_BUBBLE_WITH_TAIL else v5.SENT_BUBBLE_WITH_TAIL;
    end;
    local v18 = v2.useCallback(function(v17) --[[ Line: 68 ]]
        -- upvalues: v12 (copy)
        v12.onAbsoluteSizeChanged(v17);
    end, {
        v12.onAbsoluteSizeChanged
    });
    local v20 = v2.useCallback(function(v19) --[[ Line: 72 ]]
        -- upvalues: v12 (copy), v13 (copy)
        v12.setContentWidth(v19.AbsoluteContentSize.X + v13.Offset * 2);
    end, {
        v12.setContentWidth
    });
    return v2.createElement("ImageLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v12.contentWidth, 0, 0), 
        AnchorPoint = v12.isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = v12.imageColor, 
        Image = l_BUBBLE_0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v5.SLIDE_CENTER, 
        ImageTransparency = v12.imageTransparency, 
        Position = v15, 
        [v2.Change.AbsoluteSize] = v18
    }, l_Object_0.assign(table.clone(v12.containerChildren), {
        ["$margin"] = v2.createElement("UIPadding", {
            PaddingBottom = v13, 
            PaddingTop = v13, 
            PaddingRight = v13, 
            PaddingLeft = v13
        }), 
        ["$layout"] = v2.createElement("UIListLayout", {
            [v2.Change.AbsoluteContentSize] = v20
        })
    }));
end;
return v2.memo(ChatBubble);