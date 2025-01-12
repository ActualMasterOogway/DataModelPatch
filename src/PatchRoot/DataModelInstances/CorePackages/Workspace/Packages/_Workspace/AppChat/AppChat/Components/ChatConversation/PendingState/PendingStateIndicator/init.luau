local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v10 = require(script.Parent.PendingShimmerBubble);
local v11 = {
    itemList = {
        {
            addBottomPadding = true, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.5
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.6
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.7
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.5
        }, 
        {
            addTopPadding = true, 
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }
    }, 
    size = UDim2.new(1, 0, 1, 0), 
    minTransparency = 0.5, 
    maxTransparency = 0.9
};
return l_memo_0(function(v12) --[[ Line: 114 ]] --[[ Name: PendingStateIndicator ]]
    -- upvalues: v4 (copy), v11 (copy), l_useStyle_0 (copy), l_useCallback_0 (copy), v5 (copy), v10 (copy), v2 (copy), l_BidirectionalFlatList_0 (copy)
    local v13 = v4.Dictionary.join(v11, v12);
    local v14 = l_useStyle_0();
    local v15 = v13.style or v14;
    local v16 = #v13.itemList;
    local v20 = l_useCallback_0(function(v17) --[[ Line: 120 ]]
        -- upvalues: v13 (copy), v5 (ref), v10 (ref), v4 (ref)
        local v18 = math.max(1, #v13.itemList);
        local v19 = v13.maxTransparency - (v13.maxTransparency - v13.minTransparency) * (v17.index - 1) / v18;
        return v5.createElement(v10, v4.Dictionary.join(v17.item, {
            backgroundTransparency = v19
        }));
    end, {
        v16
    });
    return v5.createElement("Frame", {
        BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = v13.size, 
        Transparency = if v2() then v15.Tokens.Global.Color.None.Transparency else v15.Theme.BackgroundDefault.Transparency, 
        LayoutOrder = v13.layoutOrder
    }, {
        ShimmerMessageList = v5.createElement(l_BidirectionalFlatList_0, {
            data = v13.itemList, 
            renderItem = v20, 
            inverted = true, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                Name = "ShimmerMessageList"
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            keyExtractor = function(_, v22) --[[ Line: 154 ]] --[[ Name: keyExtractor ]]
                return v22;
            end, 
            optimizeInvertedCanvasResize = true
        })
    });
end);