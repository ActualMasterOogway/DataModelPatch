local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = {
    layoutOrder = 2, 
    spaceNotAvailable = 0, 
    horizontalPadding = 0, 
    userText = "", 
    contentText = ""
};
ReplyComposeBarText = function(v7) --[[ Line: 27 ]] --[[ Name: ReplyComposeBarText ]]
    -- upvalues: v2 (copy), v6 (copy), l_useStyle_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v8 = v2.Dictionary.union(v6, v7);
    local v9 = l_useStyle_0();
    return v1.createElement("Frame", {
        LayoutOrder = v8.layoutOrder, 
        Size = UDim2.new(1, -v8.spaceNotAvailable, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v8.horizontalPadding), 
            PaddingRight = UDim.new(0, v8.horizontalPadding)
        }), 
        TextLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        UserReplyingTo = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v8.userText, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textWrapped = false, 
            size = UDim2.new(1, 0, 0.5, 0), 
            fluidSizing = false, 
            fontStyle = v9.Font.CaptionHeader, 
            colorStyle = v9.Theme.TextMuted
        }), 
        ContentReplyingTo = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            text = v8.contentText, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textWrapped = false, 
            size = UDim2.new(1, 0, 0.5, 0), 
            fluidSizing = false, 
            fontStyle = v9.Font.Body, 
            colorStyle = v9.Theme.TextEmphasis
        })
    });
end;
return v1.memo(ReplyComposeBarText);