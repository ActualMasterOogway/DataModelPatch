local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.RoactAppExperiment);
local v8 = require(l_Parent_1.UIBlox);
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_Text_0 = v4.Text;
local v12 = require(l_Parent_0.Context.CapturesContext);
local v13 = require(l_Parent_0.App.CapturesPolicy);
local v14 = require(l_Parent_0.Components.CoreUI.OnOffButton);
local v15 = require(l_Parent_0.Components.CoreUI.VideoCaptureCTA);
local v16 = require(l_Parent_0.Hooks.useKeyboardEnabled);
local l_useUserExperiment_0 = v7.useUserExperiment;
local v18 = require(l_Parent_0.Flags.FFlagCapturesHotkeyEnabledForAll);
local v19 = require(l_Parent_0.Flags.FFlagEnableCapturesHotkeyExperiment);
local l_FStringCapturesIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringCapturesIXPLayer;
local v21 = UDim.new(0, 8);
local v22 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX and "Opt" or "Alt";
return (v13.connect(function(v23) --[[ Line: 241 ]]
    return {
        eligibleForVideoCapture = v23.eligibleForVideoCapture()
    };
end)(function(v24) --[[ Line: 50 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v12 (copy), l_GuiService_0 (copy), v18 (copy), v19 (copy), v16 (copy), l_useUserExperiment_0 (copy), l_FStringCapturesIXPLayer_0 (copy), l_useLocalization_0 (copy), v22 (copy), l_UserInputService_0 (copy), l_Text_0 (copy), v21 (copy), v14 (copy), v15 (copy)
    local v25 = l_useStyle_0();
    local l_chromeEnabled_0 = v6.useContext(v12).chromeEnabled;
    local v27, v28 = v6.useState(Vector2.new(0, 0));
    local v29, v30 = v6.useState(l_GuiService_0.PreferredTextSize);
    local v31 = if not not v18 or v19 then v16() else false;
    v6.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v30 (copy), l_GuiService_0 (ref)
        local function v32() --[[ Line: 61 ]] --[[ Name: onPreferredTextSizeChangedSignal ]]
            -- upvalues: v30 (ref), l_GuiService_0 (ref)
            v30(l_GuiService_0.PreferredTextSize);
        end;
        local v33 = l_GuiService_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(v32);
        return function() --[[ Line: 67 ]]
            -- upvalues: v33 (copy)
            v33:Disconnect();
        end;
    end, {});
    local v34 = false;
    if v18 then
        v34 = v31;
    elseif v19 then
        v34 = l_useUserExperiment_0({
            l_FStringCapturesIXPLayer_0
        }, function(v35) --[[ Line: 76 ]]
            -- upvalues: l_FStringCapturesIXPLayer_0 (ref)
            return (v35[l_FStringCapturesIXPLayer_0] or {}).CapturesDesktopHotkeyEnabled;
        end) and v31;
    end;
    local v36 = l_useLocalization_0({
        capturesTitle = "Feature.Captures.Title.Captures", 
        educationalText = "Feature.Captures.Label.EducationalText", 
        hotkeyEducationalText = {
            "Feature.Captures.Label.HotkeyEducationalText"; 
            keyOne = v22, 
            keyTwo = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One)
        }
    });
    local v37 = if v34 then v36.hotkeyEducationalText else v36.educationalText;
    local l_Color_0 = v25.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v25.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v25.Theme.TextDefault.Color;
    local l_Font_0 = v25.Font.CaptionBody.Font;
    local v42 = v25.Font.BaseSize * v25.Font.CaptionBody.RelativeSize;
    local l_Color_2 = v25.Theme.TextEmphasis.Color;
    local l_Font_1 = v25.Font.Header2.Font;
    local v45 = v25.Font.BaseSize * v25.Font.Header2.RelativeSize;
    local v47 = v6.useCallback(function(v46) --[[ Line: 108 ]]
        -- upvalues: v28 (copy), v24 (copy)
        v28(v46.AbsoluteSize);
        if v24.onAbsoluteSizeChanged then
            v24.onAbsoluteSizeChanged(v46.AbsoluteSize);
        end;
    end, {});
    local v48 = v6.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: l_Text_0 (ref), v37 (copy), l_Font_0 (copy), v42 (copy)
        return l_Text_0.GetTextWidth(v37, l_Font_0, v42);
    end, {
        l_Font_0, 
        v42, 
        v29, 
        v37
    });
    local l_X_0 = v27.X;
    local v50 = v48 < l_X_0 - 224 - 24;
    local v51 = 20;
    if not v50 and not (v48 < l_X_0 - 24) then
        v51 = l_Text_0.GetTextHeight(v37, l_Font_0, v42, l_X_0 - 24) + 10;
    end;
    return v6.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v24.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        [v6.Change.AbsoluteSize] = v47
    }, {
        UICorner = v6.createElement("UICorner", {
            CornerRadius = v21
        }), 
        UIPadding = v6.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12)
        }), 
        Layout = if not l_chromeEnabled_0 then v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }) else nil, 
        CapturesToggleCTA = if not l_chromeEnabled_0 then v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0)
        }, {
            TextFrame = v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Title = v6.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_Font_1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 30), 
                    Text = v36.capturesTitle, 
                    TextColor3 = l_Color_2, 
                    TextSize = v45, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                EducationalLabel = v6.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_Font_0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v51), 
                    Text = v37, 
                    TextColor3 = l_Color_1, 
                    TextSize = v42, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            CapturesToggleFrame = v6.createElement("Frame", {
                AnchorPoint = if v50 then Vector2.new(1, 0.5) else Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = if v50 then UDim2.fromScale(1, 0.5) else UDim2.new(1, 0, 0, -10), 
                Size = UDim2.fromOffset(224, 44)
            }, {
                OnOffButton = v6.createElement(v14, {
                    height = 44, 
                    width = 224
                })
            })
        }) else nil, 
        Space = if not v24.eligibleForVideoCapture or l_chromeEnabled_0 then nil else v6.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 20), 
            LayoutOrder = 2
        }), 
        VideoCaptureCTA = if v24.eligibleForVideoCapture then v6.createElement(v15, {
            closeSettingsMenu = v24.closeSettingsMenu, 
            LayoutOrder = 3
        }) else nil
    });
end));