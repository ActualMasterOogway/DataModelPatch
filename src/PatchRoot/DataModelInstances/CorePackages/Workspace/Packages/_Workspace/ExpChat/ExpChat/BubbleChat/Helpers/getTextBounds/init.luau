local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_TextService_0 = game:GetService("TextService");
local v4 = require(l_script_FirstAncestor_0.BubbleChat.Helpers.getAbsolutePaddingbyDimension);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagReplicateUIPaddingChildProperties);
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local function v18(v7, v8) --[[ Line: 11 ]]
    -- upvalues: l_CoreGui_0 (copy), v5 (copy), v4 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.Name = "RichTextSizingLabel";
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.Parent = l_ScreenGui_0;
    l_TextLabel_0.Text = v7;
    l_TextLabel_0.TextSize = v8.TextSize;
    if v8.FontFace then
        l_TextLabel_0.FontFace = v8.FontFace;
    else
        l_TextLabel_0.Font = v8.Font;
    end;
    l_TextLabel_0.Size = UDim2.fromOffset(v8.MaxWidth, 10000);
    local l_TextBounds_0 = l_TextLabel_0.TextBounds;
    l_ScreenGui_0:Destroy();
    local v12 = nil;
    if v5() and v8.UIPadding then
        local v13 = v4(v8.UIPadding.PaddingLeft, l_TextBounds_0.X);
        local v14 = v4(v8.UIPadding.PaddingRight, l_TextBounds_0.X);
        local v15 = v4(v8.UIPadding.PaddingTop, l_TextBounds_0.Y);
        local v16 = v4(v8.UIPadding.PaddingBottom, l_TextBounds_0.Y);
        v12 = Vector2.new((v13 + v14) * 2, v15 + v16);
    else
        local l_Padding_0 = v8.Padding;
        v12 = Vector2.new(l_Padding_0 * 4, l_Padding_0 * 2);
    end;
    return v12 + l_TextBounds_0;
end;
return function(v19, v20, v21) --[[ Line: 53 ]]
    -- upvalues: l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v18 (copy), l_TextService_0 (copy)
    if v21 == nil then
        v21 = l_TextChatService_0;
    end;
    if l_getFFlagExpChatAlwaysRunTCS_0() or v21.ChatVersion == Enum.ChatVersion.TextChatService then
        return (v18(v19, v20));
    else
        return l_TextService_0:GetTextSize(v19, v20.TextSize, v20.Font, Vector2.new(v20.MaxWidth, 10000)) + Vector2.new(v20.Padding * 4, v20.Padding * 2);
    end;
end;