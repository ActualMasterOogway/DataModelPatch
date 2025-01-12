local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_context_0 = l_Parent_1.context;
local v3 = require(l_Parent_1.dependencies);
local v4 = require(l_Parent_0.NotificationStyledText);
local v5 = require(l_Parent_0.NotificationThumbnail);
local v6 = require(l_Parent_1.type);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local v12 = require(l_Parent_1.constants);
local v13 = require(l_context_0.useNotificationCardState);
local v14 = require(l_context_0.useNotificationCardData);
local l_DefaultContentPadding_0 = v12.DefaultContentPadding;
local l_DefaultTextContentPadding_0 = v12.DefaultTextContentPadding;
local v17 = Vector2.new(36, 36);
return function() --[[ Line: 21 ]]
    -- upvalues: l_useStyle_0 (copy), v14 (copy), v12 (copy), v13 (copy), l_React_0 (copy), l_DefaultContentPadding_0 (copy), v17 (copy), v5 (copy), l_DefaultTextContentPadding_0 (copy), v4 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), v6 (copy)
    local v18 = l_useStyle_0();
    local v19 = v18.Font.BaseSize * v18.Font.CaptionHeader.RelativeSize;
    local v20 = v18.Font.BaseSize * v18.Font.CaptionBody.RelativeSize;
    local l_cardSize_0 = v14().cardSize;
    local v22 = l_cardSize_0 and l_cardSize_0.thumbnail or v12.CardSizeDefault.thumbnail;
    local v23 = v13("textBody");
    local v24 = v23 and v23[1];
    local v25 = v24 and v24.title and {
        Text = v24.title, 
        MaxSize = Vector2.new(1e999, v19 * 2), 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v19, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 1, 
        Font = v18.Font.CaptionHeader.Font, 
        TextColor3 = v18.Theme.TextEmphasis.Color
    };
    local v26 = v24 and v24.label and {
        Text = v24.label, 
        MaxSize = Vector2.new(1e999, v20 * 2), 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v20, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 2, 
        Font = v18.Font.CaptionBody.Font
    };
    local v27 = v14();
    l_cardSize_0 = v27.cardSize;
    local l_handleActions_0 = v27.handleActions;
    local v29 = v13("singleMetaAction");
    local v30 = v29 and v29[1];
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_DefaultContentPadding_0)
        }), 
        ThumbnailTextContainer = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = if v30 then UDim2.new(1, -(l_DefaultContentPadding_0 + v17.X), 0, 0) else UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, l_DefaultContentPadding_0)
            }), 
            NotificationThumbnailFrame = l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, v22, 0, v22)
            }, {
                NotificationThumbnail = l_React_0.createElement(v5)
            }), 
            ToastTextFrame = l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -(v22 + l_DefaultContentPadding_0), 0, 0)
            }, {
                UIPadding = l_React_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, l_DefaultTextContentPadding_0)
                }), 
                ToastTitle = v25 and l_React_0.createElement(v4, v25), 
                ToastSubtitle = v26 and l_React_0.createElement(v4, v26)
            })
        }), 
        SingleMetaAction = if v30 then l_React_0.createElement(l_Interactable_0, {
            AutoButtonColor = false, 
            BackgroundColor3 = v18.Theme.UIMuted.Color, 
            BackgroundTransparency = 0.9, 
            LayoutOrder = 2, 
            onStateChanged = function() --[[ Line: 122 ]] --[[ Name: onStateChanged ]]

            end, 
            [l_React_0.Event.Activated] = function() --[[ Line: 123 ]]
                -- upvalues: l_handleActions_0 (copy), v30 (copy)
                if l_handleActions_0 then
                    l_handleActions_0(v30);
                end;
            end, 
            Size = UDim2.fromOffset(v17.X, v17.Y)
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v6.MetaActionIcons[v30.actionIcon], 
                ImageColor3 = v18.Theme.IconEmphasis.Color, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(28, 28)
            })
        }) else nil
    });
end;