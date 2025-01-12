local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local l_Core_0 = v1.Core;
local l_App_0 = v1.App;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local l_useStyle_0 = l_Core_0.Style.useStyle;
local l_ButtonStack_0 = l_App_0.Button.ButtonStack;
local l_Images_0 = l_App_0.ImageSet.Images;
local l_IconButton_0 = l_App_0.Button.IconButton;
local l_IconSize_0 = l_App_0.ImageSet.Enum.IconSize;
local l_ImageSetLabel_0 = l_Core_0.ImageSet.ImageSetLabel;
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.Cryo);
local v13 = l_Images_0["icons/navigation/close"];
local v14 = {
    showDismiss = true, 
    visible = true
};
return function(v15) --[[ Line: 48 ]] --[[ Name: Banner ]]
    -- upvalues: l_useStyle_0 (copy), v12 (copy), v14 (copy), v11 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy), l_ButtonStack_0 (copy), l_IconButton_0 (copy), v13 (copy), l_IconSize_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = v12.Dictionary.join(v14, v15);
    local l_Theme_0 = v16.Theme;
    local l_Font_0 = v16.Font;
    local l_Tokens_0 = v16.Tokens;
    local v21 = nil;
    if v17.ctaButtons then
        local v22 = {
            minHorizontalButtonPadding = 0, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        };
        v21 = v12.Dictionary.join(v22, v17.ctaButtons);
    end;
    return v11.createElement("Frame", {
        [v11.Tag] = "data-testid=Banner", 
        BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Visible = v17.visible, 
        Size = UDim2.new(0, 0, 0, 0)
    }, {
        UICorner = v11.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UISizeConstraint = v11.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, 1e999)
        }), 
        UILayout = v11.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        UIPadding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        IconWrapper = if v17.iconImage then v11.createElement("Frame", {
            BackgroundTransparency = v17.iconBackgroundColor and 0 or 1, 
            BackgroundColor3 = v17.iconBackgroundColor, 
            LayoutOrder = 1, 
            Size = UDim2.new(0, 28, 0, 28), 
            BorderSizePixel = 0
        }, {
            Icon = v11.createElement(l_ImageSetLabel_0, {
                Selectable = false, 
                Size = UDim2.fromOffset(28, 28), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v17.iconImage, 
                ImageColor3 = l_Tokens_0.Semantic.Color.Icon.Emphasis.Color3, 
                ImageTransparency = l_Tokens_0.Semantic.Color.Icon.Emphasis.Transparency, 
                BackgroundTransparency = 1
            })
        }) else nil, 
        MiddleFrame = v11.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(0, 500, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UILayout = v11.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Text = v11.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UISizeConstraint = v11.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(250, 1e999)
                }), 
                TextLayout = v11.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UIPadding = v11.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12)
                }), 
                Title = if v17.titleMessage then v11.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v17.titleMessage, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    fluidSizing = false, 
                    lineHeight = 1, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textWrapped = false, 
                    automaticSize = Enum.AutomaticSize.XY
                }) else nil, 
                Subline = if v17.sublineMessage then v11.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v17.sublineMessage, 
                    colorStyle = l_Theme_0.TextDefault, 
                    fontStyle = l_Font_0.CaptionBody, 
                    fluidSizing = false, 
                    lineHeight = 1, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textWrapped = false, 
                    automaticSize = Enum.AutomaticSize.XY
                }) else nil
            }), 
            ButtonFrame = if v17.ctaButtons then v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UISizeConstraint = v11.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(250, 28)
                }), 
                Buttons = v11.createElement(l_ButtonStack_0, v21)
            }) else nil
        }), 
        DismissButtonFrame = if v17.showDismiss then v11.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            DismissButton = v11.createElement(l_IconButton_0, {
                backgroundTransparency = 1, 
                icon = v13, 
                iconSize = l_IconSize_0.Small, 
                size = UDim2.new(0, 28, 0, 28), 
                onActivated = v17.onDismiss
            })
        }) else nil
    });
end;