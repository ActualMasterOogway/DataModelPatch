local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v7.App.InputButton.Checkbox;
local _ = v7.App.ImageSet.Images;
local v12 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v13 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v14 = v13:FormatByKey("Feature.SettingsHub.Action.TurnOn");
local v15 = v13:FormatByKey("Feature.SettingsHub.Action.NotNow");
local v16 = v13:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.SelectingTurnOn");
local v17 = v6.wrap(v5.strictInterface({
    titleText = v5.optional(v5.string), 
    bodyText = v5.optional(v5.string), 
    handlePrimaryActivated = v5.optional(v5.callback), 
    handleSecondaryActivated = v5.optional(v5.callback), 
    Analytics = v5.optional(v5.table), 
    showCheckbox = v5.optional(v5.boolean), 
    promptStyle = v5.optional(v5.table), 
    showPrompt = v5.optional(v5.boolean)
}));
return function(v18) --[[ Line: 58 ]] --[[ Name: VoiceChatConsentModal ]]
    -- upvalues: v17 (copy), v4 (copy), l_TextService_0 (copy), v16 (copy), v3 (copy), v7 (copy), v12 (copy), l_Checkbox_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v15 (copy), v14 (copy)
    assert(v17(v18));
    local v19, v20 = v4.useState(false);
    local l_Font_0 = v18.promptStyle.Font.Header1.Font;
    local v22 = v18.promptStyle.Font.Header1.RelativeSize * v18.promptStyle.Font.BaseSize;
    local v23 = 20 + l_TextService_0:GetTextSize(v18.titleText, v22, l_Font_0, Vector2.new(325, 1e999)).Y;
    local l_Font_1 = v18.promptStyle.Font.Body.Font;
    local v25 = v18.promptStyle.Font.Body.RelativeSize * v18.promptStyle.Font.BaseSize;
    local v26 = 20 + l_TextService_0:GetTextSize(v18.bodyText, v25, l_Font_1, Vector2.new(325, 1e999)).Y;
    local l_Font_2 = v18.promptStyle.Font.CaptionHeader.Font;
    local v28 = v18.promptStyle.Font.CaptionHeader.RelativeSize * v18.promptStyle.Font.BaseSize;
    local v29 = 20 + l_TextService_0:GetTextSize(v16, v28, l_Font_2, Vector2.new(325, 1e999)).Y;
    return v3.createElement("ScreenGui", {
        DisplayOrder = 8, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        Enabled = v18.showPrompt, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Overlay = v3.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v18.promptStyle.Theme.Overlay.Color, 
            BackgroundTransparency = v18.promptStyle.Theme.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = ""
        }), 
        DialogMainFrame = v3.createElement(v7.Core.ImageSet.ImageSetLabel, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v12.Images.RoundedRect.Image, 
            ImageColor3 = v18.promptStyle.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = v18.promptStyle.Theme.BackgroundUIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ScaleType = v12.Images.RoundedRect.ScaleType, 
            Size = UDim2.new(0, 365, 0, v23 + 1 + v26 + 14 + 36 + 60 + v29), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            SliceCenter = v12.Images.RoundedRect.SliceCenter
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 20), 
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TitleTextContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, v23), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                TitleText = v3.createElement(v7.App.Text.StyledTextLabel, {
                    fontStyle = v18.promptStyle.Font.Header1, 
                    colorStyle = v18.promptStyle.Theme.SystemPrimaryDefault, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v18.titleText
                })
            }), 
            Divider = v3.createElement("Frame", {
                BackgroundColor3 = v18.promptStyle.Theme.Divider.Color, 
                BackgroundTransparency = v18.promptStyle.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            DividerSpaceContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 7)
            }), 
            BodyTextContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, v26)
            }, {
                BodyText = v3.createElement(v7.App.Text.StyledTextLabel, {
                    fontStyle = v18.promptStyle.Font.Body, 
                    colorStyle = v18.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v18.bodyText, 
                    lineHeight = 1.2
                })
            }), 
            InfoTextContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v29 + 20)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 15)
                }), 
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                Checkbox = v18.showCheckbox and v3.createElement(l_Checkbox_0, {
                    text = "", 
                    isSelected = v19, 
                    isDisabled = false, 
                    onActivated = function(v30) --[[ Line: 200 ]] --[[ Name: onActivated ]]
                        -- upvalues: v20 (copy)
                        v20(v30);
                    end, 
                    layoutOrder = 1
                }), 
                TextContainer = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(v18.showCheckbox and 0.95 or 1, 0, 0, v29)
                }, {
                    Padding = v18.showCheckbox and v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 10)
                    }), 
                    InfoText = v3.createElement(v7.App.Text.StyledTextLabel, {
                        fontStyle = v18.promptStyle.Font.CaptionHeader, 
                        colorStyle = v18.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v16, 
                        lineHeight = 1.15
                    })
                })
            }), 
            SpaceContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, 10)
            }), 
            ButtonContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 7, 
                Size = UDim2.new(1, 0, 0, 36), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SecondaryButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 1, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v15, 
                    onActivated = v18.handleSecondaryActivated
                }), 
                ConfirmButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 2, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v14, 
                    isDisabled = v18.showCheckbox and not v19, 
                    onActivated = v18.handlePrimaryActivated
                })
            })
        })
    });
end;