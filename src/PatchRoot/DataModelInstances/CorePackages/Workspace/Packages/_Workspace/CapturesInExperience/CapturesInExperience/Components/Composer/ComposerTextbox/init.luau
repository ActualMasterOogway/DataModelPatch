local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Localization);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Colors_0 = v3.App.Style.Colors;
local l_useCallback_0 = v2.useCallback;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
return function(v8) --[[ Line: 24 ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v2 (copy), l_Colors_0 (copy)
    local v9 = l_useStyle_0();
    local v10 = l_useLocalization_0({
        postCaptionPlaceholder = "Feature.Captures.Label.PostCaptionPlaceholder"
    });
    local v15 = l_useCallback_0(function(v11) --[[ Line: 31 ]]
        -- upvalues: v8 (copy)
        local v12 = utf8.len(v11.text);
        if v12 ~= nil and v8.charLimit <= v12 then
            local v13 = utf8.offset(v11.text, v8.charLimit);
            local v14 = string.sub(v11.text, 1, v13);
            v8.setInputText(v14);
            v11.Text = v14;
            return;
        else
            v8.setInputText(v11.text);
            return;
        end;
    end, {});
    return v2.createElement("Frame", {
        BackgroundColor3 = v9.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v9.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0.4, 0)
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Padding = if v8.isHorizontal then v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 36)
        }) else nil, 
        TextBox = v2.createElement("TextBox", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            ClipsDescendants = true, 
            Font = Enum.Font.BuilderSans, 
            MaxVisibleGraphemes = v8.charLimit, 
            MultiLine = true, 
            PlaceholderColor3 = l_Colors_0.Graphite, 
            PlaceholderText = v10.postCaptionPlaceholder, 
            ShowNativeInput = true, 
            Text = v8.inputText, 
            TextColor3 = Color3.fromHex("#A0A1A2"), 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            [v2.Event.Changed] = v15
        })
    });
end;