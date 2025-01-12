local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Dependencies);
local v10 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v11 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v12 = require(v9.Divider);
return function(v13) --[[ Line: 29 ]] --[[ Name: RestartScreenshotDialog ]]
    -- upvalues: l_useStyle_0 (copy), v11 (copy), v3 (copy), l_HeaderBar_0 (copy), v10 (copy), v12 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local v14 = l_useStyle_0();
    local l_Theme_0 = v14.Theme;
    local l_Font_0 = v14.Font;
    local v17 = 48;
    local v18 = 180;
    local v19 = 50;
    if v11() and v13.isSmallPortraitMode then
        v17 = 84;
        v18 = 260;
        v19 = 100;
    end;
    local v20 = v13.isSmallPortraitMode and 343 or 480;
    return v3.createElement("Frame", {
        Size = UDim2.new(0, v20, 0, v18), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        ZIndex = 5
    }, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        HeaderAndContent = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Header = v3.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                barHeight = 48, 
                renderLeft = function() --[[ Line: 66 ]] --[[ Name: renderLeft ]]

                end, 
                renderRight = function() --[[ Line: 68 ]] --[[ Name: renderRight ]]

                end, 
                title = if v11() then v10:FormatByKey("Feature.ReportAbuse.Action.RetakeScene") else "Retake Scene", 
                LayoutOrder = 1
            }), 
            Divider = v3.createElement(v12, {
                LayoutOrder = 2
            }), 
            Description = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -v17 - 1), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingBottom = UDim.new(0, 8), 
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16)
                }), 
                TextBody = v3.createElement("TextLabel", {
                    Text = if v11() then v10:FormatByKey("Feature.ReportAbuse.Message.RetakeScene") else "Help us understand what\226\128\153s happening around you. We\226\128\153ll capture the scene the moment you select \226\128\156Report.\226\128\157", 
                    Font = l_Font_0.Body.Font, 
                    LayoutOrder = 3, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = 16, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = if v11() then Enum.TextYAlignment.Top else nil, 
                    Size = UDim2.new(1, 0, 0, v19), 
                    BackgroundTransparency = 1
                })
            })
        }), 
        Footer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v17), 
            Position = UDim2.new(0, 0, 1, -v17), 
            BorderSizePixel = 0, 
            LayoutOrder = 4
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 6), 
                PaddingBottom = UDim.new(0, 6), 
                PaddingLeft = UDim.new(0, 16), 
                PaddingRight = UDim.new(0, 16)
            }), 
            ActionButtons = v3.createElement(l_ButtonStack_0, {
                forcedFillDirection = if v11() and v13.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = if v13.isSmallPortraitMode then {
                            onActivated = v13.onCancel, 
                            text = if v11() then v10:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel", 
                            size = if v11() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 80, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v13.onCancel, 
                            text = if v11() then v10:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel"
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = if v13.isSmallPortraitMode then {
                            onActivated = v13.onRestart, 
                            text = if v11() then v10:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience", 
                            size = if v11() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 200, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v13.onRestart, 
                            text = if v11() then v10:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience"
                        }
                    }
                }
            })
        })
    });
end;