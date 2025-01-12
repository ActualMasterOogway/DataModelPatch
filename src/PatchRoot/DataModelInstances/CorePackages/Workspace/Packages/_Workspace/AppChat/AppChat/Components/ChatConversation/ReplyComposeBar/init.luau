local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local v7 = require(script.Parent.ReplyComposeBarText);
local v8 = require(script.Parent.ReplyComposeBarConstants);
local v9 = {
    LayoutOrder = 3, 
    totalHeight = 0, 
    spaceNotAvailableForText = 0, 
    replyingToUserText = nil, 
    replyingToUserContent = nil, 
    replyingToUserThumbnail = nil, 
    replyingToUserPresenceImage = nil
};
ReplyComposeBar = function(v10) --[[ Line: 45 ]] --[[ Name: ReplyComposeBar ]]
    -- upvalues: v4 (copy), v9 (copy), l_useStyle_0 (copy), v3 (copy), v8 (copy), v2 (copy), v7 (copy), v5 (copy)
    local v11 = v4.Dictionary.union(v9, v10);
    local v12 = l_useStyle_0();
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v11.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v11.totalHeight)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TopBorder = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v8.BORDER_HEIGHT), 
            BackgroundColor3 = v12.Theme.UIDefault.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }), 
        ContentFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderColor3 = v12.Theme.Divider.Color, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v11.totalHeight - v8.BORDER_HEIGHT)
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v8.HORIZONTAL_PADDING), 
                PaddingRight = UDim.new(0, v8.HORIZONTAL_PADDING), 
                PaddingBottom = UDim.new(0, v8.VERTICAL_PADDING), 
                PaddingTop = UDim.new(0, v8.VERTICAL_PADDING)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Avatar = v11.replyingToUserThumbnail and v3.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = v12.Tokens.Global.Color.None.Transparency, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v8.ICON_WIDTH_HEIGHT, 0, v8.ICON_WIDTH_HEIGHT)
            }, {
                AvatarCircle = v3.createElement(v2, {
                    circleColor3 = v12.Theme.BackgroundDefault.Color, 
                    circleTransparency = v12.Tokens.Global.Color.None.Transparency, 
                    circleInteriorTransparency = v12.Tokens.Global.Color.None.Transparency, 
                    circleInteriorBackgroundColor3 = v12.Theme.BackgroundDefault.Color, 
                    onActivated = nil, 
                    thumbnails = {
                        v11.replyingToUserThumbnail
                    }, 
                    presenceImage = v11.replyingToUserPresenceImage, 
                    presenceImageColor3 = v12.Theme.OnlineStatus.Color, 
                    presenceImageTransparency = v12.Theme.OnlineStatus.Transparency, 
                    showNewPresenceImage = true
                })
            }) or nil, 
            Text = v3.createElement(v7, {
                layoutOrder = 2, 
                spaceNotAvailable = v11.spaceNotAvailableForText, 
                horizontalPadding = if v11.replyingToUserThumbnail then v8.HORIZONTAL_PADDING else 0, 
                userText = v11.replyingToUserText, 
                contentText = v11.replyingToUserContent
            }), 
            CloseButton = v3.createElement(v5.App.Button.IconButton, {
                layoutOrder = 3, 
                icon = v5.App.ImageSet.Images["icons/actions/edit/clear"], 
                iconTransparency = 0, 
                onActivated = v11.onCloseActivated
            })
        })
    });
end;
return v3.memo(ReplyComposeBar);