local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.constants);
local v3 = require(l_Parent_1.dependencies);
local l_context_0 = l_Parent_1.context;
local _ = require(l_Parent_1.type);
local v6 = require(l_Parent_0.NotificationActionsFrame);
local v7 = require(l_Parent_0.NotificationContentFrame);
local v8 = require(l_context_0.useNotificationCardData);
local v9 = require(l_context_0.useNotificationCardState);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_DefaultCardPadding_0 = v2.Padding.DefaultCardPadding;
local l_DefaultContentPadding_0 = v2.DefaultContentPadding;
local l_DefaultCardCornerRadius_0 = v2.DefaultCardCornerRadius;
return function(_) --[[ Line: 27 ]]
    -- upvalues: v8 (copy), v2 (copy), l_DefaultCardPadding_0 (copy), l_useStyle_0 (copy), v9 (copy), l_React_0 (copy), l_Interactable_0 (copy), l_DefaultCardCornerRadius_0 (copy), l_DefaultContentPadding_0 (copy), v7 (copy), v6 (copy)
    local v18 = v8();
    local l_cardSize_0 = v18.cardSize;
    local v20 = if v18.cardTransparency then v18.cardTransparency else v2.CardTransparency.Default;
    local v21 = if l_cardSize_0 and l_cardSize_0.cardPadding then l_cardSize_0.cardPadding else l_DefaultCardPadding_0;
    local v22 = l_useStyle_0();
    local l_handleActions_0 = v18.handleActions;
    local v24 = v9("textBody");
    local v25 = v24 and v24[1];
    return l_React_0.createElement(l_Interactable_0, {
        AutoButtonColor = false, 
        BackgroundColor3 = v22.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v20, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        onStateChanged = function() --[[ Line: 45 ]] --[[ Name: onStateChanged ]]

        end, 
        Size = UDim2.new(1, 0, 0, 0), 
        [l_React_0.Event.Activated] = function() --[[ Line: 47 ]]
            -- upvalues: l_handleActions_0 (copy), v25 (copy)
            if l_handleActions_0 and v25 then
                l_handleActions_0(v25);
            end;
        end
    }, {
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = l_DefaultCardCornerRadius_0
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_DefaultContentPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v21), 
            PaddingLeft = UDim.new(0, v21), 
            PaddingRight = UDim.new(0, v21), 
            PaddingTop = UDim.new(0, v21)
        }), 
        NotificationContentFrame = l_React_0.createElement(v7), 
        NotificationActionsFrame = l_React_0.createElement(v6)
    });
end;