local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_Interactable_0 = v2.Core.Control.Interactable;
local function v6() --[[ Line: 19 ]] --[[ Name: NOOP ]]

end;
return function(v7) --[[ Line: 21 ]] --[[ Name: SocialCountsItem ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_Interactable_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy)
    local v8 = l_useStyle_0();
    local l_Theme_0 = v8.Theme;
    local l_Font_0 = v8.Font;
    local v11 = v7.count ~= "0";
    local v12 = v11 and l_Theme_0.TextEmphasis or l_Theme_0.TextMuted;
    return v1.createElement(l_Interactable_0, {
        Size = UDim2.new(0.25, 0, 0, 44), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v1.Event.Activated] = if v11 then v7.onActivated else v6, 
        onStateChanged = v6, 
        LayoutOrder = v7.layoutOrder, 
        Active = v11
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Count = v1.createElement(l_StyledTextLabel_0, {
            text = v7.count, 
            fontStyle = l_Font_0.Header1, 
            colorStyle = v12, 
            textYAlignment = Enum.TextYAlignment.Bottom, 
            layoutOrder = 1
        }), 
        Text = v1.createElement(l_StyledTextLabel_0, {
            text = v7.text, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = v12, 
            textYAlignment = Enum.TextYAlignment.Top, 
            layoutOrder = 2
        })
    });
end;