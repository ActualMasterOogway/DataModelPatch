local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memo_0 = v4.memo;
local l_useMemo_0 = v4.useMemo;
local v8 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_LinkButton_0 = v8.App.Button.LinkButton;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v12 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v13 = {
    actionText = "PLACEHOLDER Action", 
    bodyText = "PLACEHOLDER Body", 
    height = 40, 
    onActivated = function() --[[ Line: 34 ]] --[[ Name: onActivated ]]

    end
};
return l_memo_0(function(v14) --[[ Line: 37 ]] --[[ Name: ConversationBanner ]]
    -- upvalues: v3 (copy), v13 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v12 (copy), l_useMemo_0 (copy), l_Text_0 (copy), v4 (copy), l_LinkButton_0 (copy)
    local v15 = v3.Dictionary.union(v13, v14);
    local v16 = l_useStyle_0();
    local v17 = v15.style or v16;
    local v18 = l_useTokens_0();
    local v19 = v12();
    local l_Space_200_0 = v17.Tokens.Global.Space_200;
    local l_Font_0 = v17.Font.CaptionBody.Font;
    local v22 = v17.Font.CaptionBody.RelativeSize * v17.Font.BaseSize;
    local v23 = l_useMemo_0(function() --[[ Line: 48 ]]
        -- upvalues: l_Text_0 (ref), v15 (copy), l_Font_0 (copy), v22 (copy)
        return l_Text_0.GetTextBounds(v15.actionText, l_Font_0, v22 + 2, Vector2.new(250, v15.height)).X;
    end, {
        v15.actionText, 
        l_Font_0, 
        v22, 
        v15.height
    });
    return v4.createElement("Frame", {
        BackgroundColor3 = if v19 then v18.Color.OverMedia.OverMedia_100.Color3 else v17.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = if v19 then v18.Color.OverMedia.OverMedia_100.Transparency else v17.Theme.BackgroundUIDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, v15.height)
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_Space_200_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Space_200_0), 
            PaddingRight = UDim.new(0, l_Space_200_0)
        }), 
        BodyText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v23 - l_Space_200_0, 1, 0), 
            Text = v15.bodyText, 
            TextColor3 = v17.Theme.TextEmphasis.Color, 
            TextSize = v22, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ActionText = v4.createElement(l_LinkButton_0, {
            fontStyle = "CaptionBody", 
            layoutOrder = 2, 
            size = UDim2.new(0, v23, 1, 0), 
            text = ("<b>%*</b>"):format(v15.actionText), 
            onActivated = v15.onActivated
        })
    });
end);