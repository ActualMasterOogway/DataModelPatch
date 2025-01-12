local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.PlaceIdContainer);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.GameCardContainer);
local v6 = {
    additionalProps = {
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 19 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 20 ]] --[[ Name: openGameDetailsPage ]]

        end
    }, 
    hasTail = false, 
    innerPadding = 0, 
    isIncoming = false, 
    isPending = true, 
    isUnfiltered = false, 
    maxWidth = 0, 
    parentWidth = 0, 
    wideMode = false
};
return function(v7) --[[ Line: 32 ]] --[[ Name: AssetCardTemp ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy), v2 (copy), v3 (copy)
    local v8 = v7.additionalProps or v6.additionalProps;
    local v9 = v8.placeId and v4 or v5;
    local v10 = v7.parentWidth or v6.parentWidth;
    local v11 = v7.wideMode or v6.wideMode;
    local v12 = if v7.isPending ~= nil then v7.isPending else v6.isPending;
    return v2.createElement(v3, {
        hasTail = v7.hasTail or v6.hasTail, 
        isIncoming = v7.isIncoming or v6.isIncoming, 
        isPending = v12, 
        isUnfiltered = v7.isUnfiltered, 
        isAssetCard = true, 
        LayoutOrder = v7.LayoutOrder, 
        padding = v7.innerPadding or v6.innerPadding, 
        [v2.Change.AbsoluteSize] = v7[v2.Change.AbsoluteSize]
    }, {
        AssetCard = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v10 - (v11 and 224 or 108), 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Card = v2.createElement(v9, v8)
        })
    });
end;