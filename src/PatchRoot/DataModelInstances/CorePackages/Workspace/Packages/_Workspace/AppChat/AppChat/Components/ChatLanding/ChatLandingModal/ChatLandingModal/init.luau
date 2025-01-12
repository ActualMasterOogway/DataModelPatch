local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_Enum_0 = v5.App.Button.Enum;
local l_IconButton_0 = v5.App.Button.IconButton;
local v10 = require(l_script_FirstAncestor_0.Components.Label.Label);
local l_Images_0 = v5.App.ImageSet.Images;
local v12 = l_Images_0["icons/actions/favoriteOn"];
local v13 = l_Images_0["icons/navigation/close"];
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v15 = {
    titleText = "", 
    bodyText = "", 
    actionText = "", 
    buttonType = l_Enum_0.ButtonType.PrimarySystem, 
    paddingX = 12, 
    hideActionButton = false, 
    onActivated = function() --[[ Line: 47 ]] --[[ Name: onActivated ]]

    end, 
    onDismissed = function() --[[ Line: 48 ]] --[[ Name: onDismissed ]]

    end
};
return function(v16) --[[ Line: 53 ]] --[[ Name: ChatLandingModal ]]
    -- upvalues: v3 (copy), v15 (copy), l_useStyle_0 (copy), v4 (copy), v14 (copy), v10 (copy), v12 (copy), l_IconButton_0 (copy), v13 (copy), l_ButtonStack_0 (copy)
    local v17 = v3.Dictionary.join(v15, v16);
    local v18 = l_useStyle_0();
    local v19 = v17.style or v18;
    local l_Space_100_0 = v19.Tokens.Global.Space_100;
    local l_Size_500_0 = v19.Tokens.Global.Size_500;
    local l_Medium_0 = v19.Tokens.Semantic.Icon.Size.Medium;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v17.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        ContentPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_100_0), 
            PaddingBottom = UDim.new(0, l_Space_100_0), 
            PaddingLeft = UDim.new(0, v17.paddingX), 
            PaddingRight = UDim.new(0, v17.paddingX)
        }), 
        Content = v4.createElement("Frame", {
            BackgroundTransparency = v19.Theme.SystemPrimaryContent.Transparency, 
            BackgroundColor3 = v19.Theme.SystemPrimaryContent.Color, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_100_0 * 2)
            }), 
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v19.Tokens.Semantic.Radius.Medium)
            }), 
            UIStroke = v4.createElement("UIStroke", {
                Thickness = v19.Tokens.Global.Stroke_100, 
                Color = v19.Theme.Divider.Color, 
                Transparency = v19.Theme.Divider.Transparency
            }), 
            ContentPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_100_0), 
                PaddingBottom = UDim.new(0, l_Space_100_0), 
                PaddingLeft = UDim.new(0, l_Space_100_0), 
                PaddingRight = UDim.new(0, l_Space_100_0)
            }), 
            IconAndTextFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                HorizontalLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                TextFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, -l_Medium_0 - l_Space_100_0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, l_Space_100_0)
                    }), 
                    LabelAndTextFrame = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, l_Space_100_0)
                        }), 
                        TitleLabelWithIcon = if not v14() or v17.titleLabelText then v4.createElement(v10, {
                            bodyText = v17.titleLabelText, 
                            iconImage = v12, 
                            layoutOrder = 1
                        }) else nil, 
                        TitleTextLabel = v4.createElement("TextLabel", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 2, 
                            Font = v19.Font.Title.Font, 
                            BorderSizePixel = 0, 
                            Text = v17.titleText, 
                            TextColor3 = v19.Theme.TextEmphasis.Color, 
                            TextSize = v19.Font.Header2.RelativeSize * v19.Font.BaseSize, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            UIFlexItem = v4.createElement("UIFlexItem", {
                                FlexMode = Enum.UIFlexMode.Fill
                            })
                        })
                    }), 
                    BodyTextLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 2, 
                        Font = v19.Font.Body.Font, 
                        BorderSizePixel = 0, 
                        Text = v17.bodyText, 
                        TextColor3 = v19.Theme.TextDefault.Color, 
                        TextSize = v19.Font.CaptionBody.RelativeSize * v19.Font.BaseSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                ImageIcon = v4.createElement(l_IconButton_0, {
                    size = UDim2.new(0, l_Medium_0, 0, l_Medium_0), 
                    icon = v13, 
                    onActivated = v17.onDismissed, 
                    layoutOrder = 2
                })
            }), 
            Buttons = if v17.hideActionButton then nil else v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_Size_500_0)
            }, {
                ButtonStack = v4.createElement(l_ButtonStack_0, {
                    forcedFillDirection = Enum.FillDirection.Horizontal, 
                    buttons = {
                        {
                            buttonType = v17.buttonType, 
                            props = {
                                onActivated = v17.onActivated, 
                                text = v17.actionText
                            }
                        }
                    }
                })
            })
        })
    });
end;