local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v6 = require(script.Parent.BaseCell);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local _ = require(l_script_FirstAncestor_0.types);
local v10 = {
    Text = "titleText", 
    primaryIconSize = 32, 
    isDisabled = false, 
    Size = UDim2.new(1, 0, 1, 0), 
    onActivated = function() --[[ Line: 44 ]] --[[ Name: onActivated ]]
        print("IconWithTextCell onActivated");
    end, 
    secondaryIcon = "", 
    secondaryIconSize = 24, 
    iconCellWidth = 60, 
    LayoutOrder = 0, 
    style = v2.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true
};
return l_memo_0(function(v11) --[[ Line: 67 ]] --[[ Name: IconWithTextCell ]]
    -- upvalues: v2 (copy), v10 (copy), v3 (copy), v6 (copy), v7 (copy), l_ImageSetLabel_0 (copy)
    local v12 = v2.Dictionary.join(v10, v11);
    local l_style_0 = v12.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v16 = v12.primaryIcon == nil;
    return v3.createElement(v6, {
        Size = v12.Size, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = if v7() then l_style_0.Tokens.Global.Color.None.Transparency else l_style_0.Theme.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        LayoutOrder = v12.LayoutOrder, 
        onActivated = v12.onActivated, 
        showDivider = v12.showDivider, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        isDisabled = v12.isDisabled, 
        avatarCircleCellWidth = v12.iconCellWidth
    }, {
        leftFrame = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.new(1, -v12.iconCellWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            leftListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            imageFrame = if not v16 then v3.createElement("Frame", {
                Size = UDim2.new(0, v12.iconCellWidth, 0, v12.primaryIconSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                primaryIcon = v3.createElement(l_ImageSetLabel_0, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v12.primaryIcon, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v12.primaryIconSize, 0, v12.primaryIconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1
                })
            }) else nil, 
            text = v3.createElement("TextLabel", {
                Size = UDim2.new(1, v16 and 0 or -v12.iconCellWidth, 1, 0), 
                Text = v12.Text, 
                TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        rightFrame = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(v12.iconCellWidth, v12.iconCellWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            secondaryIcon = v12.secondaryIcon and v3.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v12.secondaryIcon, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v12.secondaryIconSize, v12.secondaryIconSize)
            })
        })
    });
end);