local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v4 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
return function(v5) --[[ Line: 12 ]] --[[ Name: ReportTextEntry ]]
    -- upvalues: v4 (copy), l_useStyle_0 (copy), v2 (copy)
    local v6 = v4();
    local v7 = l_useStyle_0();
    local l_Font_0 = v7.Font.Body.Font;
    local v9 = v7.Font.BaseSize * v6.TextEntryRelativeSize;
    local l_Theme_0 = v7.Theme;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40 + v6.TextOffset + 20), 
        BackgroundTransparency = v7.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v7.Theme.BackgroundDefault.Color, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        AbuseReportsText = v2.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 40 + v6.TextOffset), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            PlaceholderText = v5.placeholderText, 
            Font = l_Font_0, 
            Text = v5.text, 
            TextSize = v9, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            RichText = false, 
            MultiLine = true, 
            TextWrapped = true, 
            ClearTextOnFocus = false, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            [v2.Event.FocusLost] = function() --[[ Line: 57 ]]

            end, 
            [v2.Event.Focused] = function() --[[ Line: 58 ]]

            end, 
            [v2.Change.AbsoluteSize] = function() --[[ Line: 59 ]]

            end, 
            [v2.Change.Text] = function(v11) --[[ Line: 60 ]]
                -- upvalues: v5 (copy)
                if v5.text ~= v11.Text then
                    v5.onUpdate(v11.Text);
                end;
            end
        })
    });
end;