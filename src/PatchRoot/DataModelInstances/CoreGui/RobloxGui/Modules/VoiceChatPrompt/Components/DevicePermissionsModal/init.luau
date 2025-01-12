local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local v10 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v12 = require(script.Parent.Parent.Helpers.getMicDeeplinkDirections);
local v13 = require(script.Parent.Parent.Helpers.getPrimingText);
local v14 = v11:FormatByKey("Feature.SettingsHub.Action.OpenSettings");
local v15 = v11:FormatByKey("Feature.SettingsHub.Action.Ok");
local v16 = v11:FormatByKey("Feature.SettingsHub.Action.NotNow");
local v17 = l_Images_0["icons/controls/microphone"];
local v18 = v5.wrap(v4.strictInterface({
    titleText = v4.string, 
    bodyText = v4.string, 
    handlePrimaryActivated = v4.callback, 
    handleSecondaryActivated = v4.callback, 
    Analytics = v4.table, 
    promptStyle = v4.table, 
    showPrompt = v4.boolean, 
    settingsAppAvailable = v4.boolean, 
    UserInputService = v4.table
}));
return function(v19) --[[ Line: 63 ]] --[[ Name: DevicePermissionsModal ]]
    -- upvalues: v18 (copy), v12 (copy), v13 (copy), l_TextService_0 (copy), v3 (copy), v6 (copy), v10 (copy), v17 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v16 (copy), v14 (copy), v15 (copy)
    assert(v18(v19));
    local v20 = v12(v19.settingsAppAvailable, v19.UserInputService);
    local v21 = v13(v19.UserInputService);
    local l_Font_0 = v19.promptStyle.Font.Header1.Font;
    local v23 = v19.promptStyle.Font.Header1.RelativeSize * v19.promptStyle.Font.BaseSize;
    local v24 = 20 + l_TextService_0:GetTextSize(v19.titleText, v23, l_Font_0, Vector2.new(325, 1e999)).Y;
    local l_Font_1 = v19.promptStyle.Font.Body.Font;
    local v26 = v19.promptStyle.Font.Body.RelativeSize * v19.promptStyle.Font.BaseSize;
    local v27 = 20 + l_TextService_0:GetTextSize(v19.bodyText, v26, l_Font_1, Vector2.new(325, 1e999)).Y;
    local v28 = 0;
    if v21 then
        local l_Font_2 = v19.promptStyle.Font.CaptionHeader.Font;
        local v30 = v19.promptStyle.Font.CaptionHeader.RelativeSize * v19.promptStyle.Font.BaseSize;
        v28 = 10 + l_TextService_0:GetTextSize(v21, v30, l_Font_2, Vector2.new(325, 1e999)).Y;
    end;
    local v31 = 0;
    if v20 then
        local l_Font_3 = v19.promptStyle.Font.Body.Font;
        local v33 = v19.promptStyle.Font.Body.RelativeSize * v19.promptStyle.Font.BaseSize;
        local l_Y_0 = l_TextService_0:GetTextSize(v20, v33, l_Font_3, Vector2.new(325, 1e999)).Y;
        v31 = (v21 and 10 or 20) + l_Y_0;
    end;
    local v35 = 4;
    if v20 then
        v35 = 4.5;
    end;
    if v21 then
        v35 = 5.5;
    end;
    return v3.createElement("ScreenGui", {
        DisplayOrder = 8, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        Enabled = v19.showPrompt, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Overlay = v3.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v19.promptStyle.Theme.Overlay.Color, 
            BackgroundTransparency = v19.promptStyle.Theme.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = ""
        }), 
        DialogMainFrame = v3.createElement(v6.Core.ImageSet.ImageSetLabel, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v10.Images.RoundedRect.Image, 
            ImageColor3 = v19.promptStyle.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = v19.promptStyle.Theme.BackgroundUIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ScaleType = v10.Images.RoundedRect.ScaleType, 
            Size = UDim2.new(0, 365, 0, v24 + 5 + v27 + 36 + v35 * 20 + v31 + 55 + v28), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            SliceCenter = v10.Images.RoundedRect.SliceCenter
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15), 
                PaddingBottom = UDim.new(0, 20), 
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v3.createElement(v6.Core.ImageSet.ImageSetLabel, {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v17, 
                Size = UDim2.new(0, 55, 0, 55), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            TitleTextContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v24), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 7)
                }), 
                TitleText = v3.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v19.promptStyle.Font.Header1, 
                    colorStyle = v19.promptStyle.Theme.SystemPrimaryDefault, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v19.titleText
                })
            }), 
            Divider = v3.createElement("Frame", {
                BackgroundColor3 = v19.promptStyle.Theme.Divider.Color, 
                BackgroundTransparency = v19.promptStyle.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            DividerSpaceContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, 15)
            }), 
            BodyTextContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v27)
            }, {
                BodyText = v3.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v19.promptStyle.Font.Body, 
                    colorStyle = v19.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v19.bodyText, 
                    lineHeight = 1.2
                })
            }), 
            InfoTextContainer = if v20 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, v31 + 20)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v21 and 8 or 15), 
                    PaddingLeft = UDim.new(0, 8)
                }), 
                TextContainer = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v31)
                }, {
                    InfoText = v3.createElement(v6.App.Text.StyledTextLabel, {
                        fontStyle = v19.promptStyle.Font.Body, 
                        colorStyle = v19.promptStyle.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v20, 
                        lineHeight = 1.25
                    })
                })
            }) else nil, 
            SpaceContainer = if not v21 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 7, 
                Size = UDim2.new(1, 0, 0, v20 and 40 or 20)
            }) else nil, 
            PrimingTextContainer = if v21 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 8, 
                Size = UDim2.new(1, 0, 0, v28)
            }, {
                PrimingText = v3.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v19.promptStyle.Font.Body, 
                    colorStyle = v19.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v21, 
                    lineHeight = 1.25
                })
            }) else nil, 
            SpaceContainerTemp = if v21 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 9, 
                Size = UDim2.new(1, 0, 0, 30)
            }) else nil, 
            ButtonContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 10, 
                Size = UDim2.new(1, 0, 0, 36)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SecondaryButton = if v19.settingsAppAvailable then v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 1, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v16, 
                    onActivated = v19.handleSecondaryActivated
                }) else nil, 
                ConfirmButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 2, 
                    size = UDim2.new(v19.settingsAppAvailable and 0.5 or 1, -5, 0, 36), 
                    text = if v19.settingsAppAvailable then v14 else v15, 
                    onActivated = v19.handlePrimaryActivated
                })
            })
        })
    });
end;