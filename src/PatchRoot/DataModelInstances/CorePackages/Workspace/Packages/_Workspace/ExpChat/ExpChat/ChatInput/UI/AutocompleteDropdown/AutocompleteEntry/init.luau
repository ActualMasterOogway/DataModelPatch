local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_1.EmojiList);
local v5 = require(l_script_FirstAncestor_0.Config);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    local l_createElement_0 = v2.createElement;
    local v8 = "Frame";
    local v9 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v5.AutocompleteEntryDefaultSizeY), 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder, 
        ZIndex = 2, 
        [v2.Event.MouseEnter] = v6.onAutocompleteDropdownHover
    };
    local v10 = {};
    local l_createElement_1 = v2.createElement;
    local v12 = "TextButton";
    local v13 = {
        Size = UDim2.new(1, 0, 1, v6.isDividerVisible and -1 or 0), 
        BackgroundTransparency = v6.setTransparency(v6.layoutOrder == v6.selectedIndex and v5.AutocompleteSelectedTransparency or 1, v6.transparencyValue), 
        BackgroundColor3 = v6.layoutOrder == v6.selectedIndex and v5.AutocompleteSelectedColor or nil, 
        Text = "", 
        ZIndex = 3, 
        [v2.Event.Activated] = v6.onAutocompleteSelected
    };
    local v14 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 30), 
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v15 = false;
    if v6.autocompleteType == "emojis" then
        v15 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v6.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = string.format("%s", v4[v6.result].base), 
            TextColor3 = v6.chatInputBarSettings.TextColor3, 
            TextSize = v6.chatInputBarSettings.TextSize, 
            TextStrokeColor3 = v6.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v6.setTransparency(v6.chatInputBarSettings.TextStrokeTransparency, v6.transparencyValue), 
            TextTransparency = v6.setTransparency(0, v6.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1, 
            ZIndex = 2
        });
    end;
    v14.EmojiLabel = v15;
    v15 = false;
    if v6.autocompleteType == "emojis" then
        v15 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v6.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = "  ", 
            TextColor3 = v6.chatInputBarSettings.TextColor3, 
            TextSize = 14, 
            TextStrokeColor3 = v6.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v6.setTransparency(v6.chatInputBarSettings.TextStrokeTransparency, v6.transparencyValue), 
            TextTransparency = v6.setTransparency(0, v6.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 2, 
            ZIndex = 2
        });
    end;
    v14.SpaceLabel = v15;
    v14.TextLabel = v2.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = v6.chatInputBarSettings.FontFace, 
        RichText = true, 
        Size = UDim2.new(0, 0, 0, 0), 
        Text = string.format("%s", v6.result), 
        TextColor3 = v6.chatInputBarSettings.TextColor3, 
        TextSize = v6.chatInputBarSettings.TextSize, 
        TextStrokeColor3 = v6.chatInputBarSettings.TextStrokeColor3, 
        TextStrokeTransparency = v6.setTransparency(v6.chatInputBarSettings.TextStrokeTransparency, v6.transparencyValue), 
        TextTransparency = v6.setTransparency(0, v6.transparencyValue), 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        LayoutOrder = 3, 
        ZIndex = 2
    });
    v10.TextLabelButton = l_createElement_1(v12, v13, v14);
    v10.Divider = v6.isDividerVisible and v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = v6.setTransparency(v5.ChatInputBarBorderTransparency, v6.transparencyValue), 
        BackgroundColor3 = v5.ChatInputBarBorderColor3, 
        BorderSizePixel = 0, 
        ZIndex = 2
    }) or nil;
    return l_createElement_0(v8, v9, v10);
end;