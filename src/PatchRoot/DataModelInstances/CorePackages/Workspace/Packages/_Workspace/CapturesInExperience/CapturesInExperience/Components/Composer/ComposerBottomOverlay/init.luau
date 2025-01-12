local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Localization);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Colors_0 = v3.App.Style.Colors;
local l_Images_0 = v3.App.ImageSet.Images;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_TextButton_0 = v3.App.Button.TextButton;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v12 = game:DefineFastFlag("InfoOverlayBackgroundColorFix", false);
local v13 = UDim.new(0, 8);
return function(v14) --[[ Line: 34 ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), v13 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), v12 (copy), l_TextButton_0 (copy), l_Colors_0 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useLocalization_0({
        postAcknowledgeAction = "Feature.Captures.Action.PostCapturesOverlayAcknowledged", 
        postInfoLabel = "Feature.Captures.Label.PostCapturesInfoLabel", 
        postWarningLabel = "Feature.Captures.Label.PostCapturesWarningLabel"
    });
    return v2.createElement("Frame", {
        Active = true, 
        BackgroundColor3 = v15.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        InfoOverlay = v2.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = v15.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v15.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.new(1, 0, 0, 226)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v13
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            }), 
            ModalHeaderBar = v2.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                isTitleCentered = v14.isHorizontal, 
                layoutOrder = 1, 
                margin = 0, 
                size = UDim2.new(1, 0, 0, 48), 
                title = v14.isHorizontal and "Post Captures" or "", 
                renderLeft = function() --[[ Line: 90 ]] --[[ Name: renderLeft ]]
                    -- upvalues: v14 (copy), v2 (ref), v15 (copy)
                    if not v14.isHorizontal then
                        return (v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = v15.Font.Header2.Font, 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 24), 
                            Text = "Post Captures", 
                            TextColor3 = v15.Theme.TextEmphasis.Color, 
                            TextSize = 24, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }));
                    else
                        return nil;
                    end;
                end, 
                renderRight = function() --[[ Line: 104 ]] --[[ Name: renderRight ]]
                    -- upvalues: v2 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v14 (copy)
                    return v2.createElement(l_IconButton_0, {
                        icon = l_Images_0["icons/navigation/close"], 
                        iconSize = l_IconSize_0.Medium, 
                        onActivated = v14.onOverlayActive, 
                        showBackground = false
                    });
                end
            }), 
            BodyFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 114)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                PublicIcon = v2.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/status/public"], 
                    isDisabled = false, 
                    layoutOrder = 1, 
                    showBackground = false, 
                    size = UDim2.fromOffset(44, 44)
                }), 
                TextFrame = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    InfoLabel = v2.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = v15.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -60, 0, 20), 
                        Text = v16.postInfoLabel, 
                        TextColor3 = v15.Theme.TextEmphasis.Color, 
                        TextSize = 20, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true
                    }), 
                    WarningLabel = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Font = v15.Font.CaptionBody.Font, 
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -60, 0, 20), 
                        Text = v16.postWarningLabel, 
                        TextColor3 = v15.Theme.TextDefault.Color, 
                        TextSize = 20, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            }), 
            ConfirmButton = if v12 then v2.createElement(l_TextButton_0, {
                backgroundColor = {
                    Color = l_Colors_0.White, 
                    Transparency = 0
                }, 
                colorStyleDefault = "ItemBackgroundDefault", 
                layoutOrder = 3, 
                onActivated = v14.onOverlayActive, 
                showBackground = true, 
                size = UDim2.new(1, 0, 0, 40), 
                text = v16.postAcknowledgeAction
            }) else v2.createElement(l_TextButton_0, {
                layoutOrder = 3, 
                onActivated = v14.onOverlayActive, 
                showBackground = true, 
                size = UDim2.new(1, 0, 0, 40), 
                text = v16.postAcknowledgeAction
            })
        })
    });
end;