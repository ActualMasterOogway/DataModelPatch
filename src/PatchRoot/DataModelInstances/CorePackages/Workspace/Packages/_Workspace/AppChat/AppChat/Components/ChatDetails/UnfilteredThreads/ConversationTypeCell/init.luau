local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local v9 = require(l_script_FirstAncestor_0.Components.Cells.BaseCell);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = {
    bodyText = "Placeholder body", 
    iconImage = nil, 
    iconSize = l_IconSize_0.Small, 
    iconCellWidth = 30, 
    cellHeight = 28, 
    onIconActivated = function() --[[ Line: 37 ]] --[[ Name: onIconActivated ]]

    end
};
return function(v13) --[[ Line: 42 ]] --[[ Name: ConversationTypeCell ]]
    -- upvalues: v3 (copy), v12 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v11 (copy), v4 (copy), v9 (copy), l_IconButton_0 (copy)
    local v14 = v3.Dictionary.join(v12, v13);
    local v15 = l_useStyle_0();
    local v16 = v14.style or v15;
    local l_Theme_0 = v16.Theme;
    local l_Font_0 = v16.Font;
    local l_Size_150_0 = v16.Tokens.Global.Size_150;
    local v20 = l_useTokens_0();
    local v21 = v11();
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        ConversationTypeRow = v4.createElement(v9, {
            Size = UDim2.new(1, 0, 0, v14.cellHeight), 
            BackgroundColor3 = if v21 then v20.Color.None.Color3 else l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = if v21 then v20.Color.None.Transparency else v16.Theme.BackgroundDefault.Transparency, 
            showDivider = false, 
            dividerColor3 = l_Theme_0.Divider.Color, 
            dividerTransparency = l_Theme_0.Divider.Transparency, 
            isDisabled = true
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Size_150_0)
            }), 
            TextFrame = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Text = v4.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Text = v14.bodyText, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                })
            }), 
            IconFrame = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v14.iconCellWidth, v14.iconCellWidth), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                InfoIcon = v4.createElement(l_IconButton_0, {
                    position = UDim2.fromScale(0.5, 0.5), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    icon = v14.iconImage, 
                    iconColor3 = l_Theme_0.IconDefault.Color, 
                    iconTransparency = l_Theme_0.IconDefault.Transparency, 
                    iconSize = v14.iconSize, 
                    backgroundTransparency = 1, 
                    size = UDim2.fromOffset(v14.iconCellWidth, v14.iconCellWidth), 
                    onActivated = v14.onIconActivated
                })
            })
        })
    });
end;