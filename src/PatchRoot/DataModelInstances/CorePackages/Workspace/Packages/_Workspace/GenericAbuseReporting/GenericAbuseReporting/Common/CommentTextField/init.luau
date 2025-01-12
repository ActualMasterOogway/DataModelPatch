local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
return function(v3) --[[ Line: 22 ]] --[[ Name: CommentTextField ]]
    -- upvalues: v1 (copy), l_useStyle_0 (copy)
    local v4, v5 = v1.useState("");
    local v6 = l_useStyle_0();
    local l_Font_0 = v6.Font.Body.Font;
    local l_BaseSize_0 = v6.Font.BaseSize;
    local l_Theme_0 = v6.Theme;
    local v12 = v1.useCallback(function(v10) --[[ Line: 29 ]]
        -- upvalues: v5 (copy), v3 (copy), v4 (copy)
        local l_Text_0 = v10.Text;
        if v10.TextFits then
            v5(l_Text_0);
            v3.onUpdate(l_Text_0);
            return;
        else
            v10.Text = v4;
            return;
        end;
    end);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundTransparency = v6.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v3.backgroundColor3 or v6.Theme.BackgroundDefault.Color, 
        LayoutOrder = v3.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        CommentField = v1.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 40), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = v3.backgroundColor3 or l_Theme_0.BackgroundDefault.Color, 
            PlaceholderText = v3.placeholderText, 
            Font = l_Font_0, 
            Text = v3.text, 
            TextSize = l_BaseSize_0, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = v3.textXAlignment or Enum.TextXAlignment.Left, 
            TextYAlignment = v3.textYAlignment or Enum.TextYAlignment.Top, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            RichText = false, 
            MultiLine = true, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            ClearTextOnFocus = false, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            Interactable = v3.interactable, 
            [v1.Change.Text] = v12
        })
    });
end;