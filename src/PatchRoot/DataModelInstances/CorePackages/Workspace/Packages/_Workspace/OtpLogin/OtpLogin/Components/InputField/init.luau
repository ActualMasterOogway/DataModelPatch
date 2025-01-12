local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_FFlagLuaAppFixCursorHooks_0 = v1.SharedFlags.FFlagLuaAppFixCursorHooks;
return function(v7) --[[ Line: 20 ]] --[[ Name: InputField ]]
    -- upvalues: l_useStyle_0 (copy), l_React_0 (copy), l_FFlagLuaAppFixCursorHooks_0 (copy), l_useCursor_0 (copy)
    local v8 = l_useStyle_0();
    local l_HelperText_0 = v8.Tokens.Component.HelperText;
    local l_Typography_0 = l_HelperText_0.Base.Typography;
    local v11 = l_React_0.useRef(nil);
    local v12, v13 = l_React_0.useState(false);
    local l_TextField_0 = v8.Tokens.Component.TextField;
    local v15 = if l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), 2, 2) else nil;
    local function v16() --[[ Line: 33 ]] --[[ Name: startFocus ]]
        -- upvalues: v7 (copy), v11 (copy), v13 (copy)
        if v7.disabled and v11.current then
            v11.current:ReleaseFocus();
            return;
        else
            v13(true);
            return;
        end;
    end;
    local function v17() --[[ Line: 41 ]] --[[ Name: endFocus ]]
        -- upvalues: v13 (copy)
        v13(false);
    end;
    local function _() --[[ Line: 45 ]] --[[ Name: hasError ]]
        -- upvalues: v7 (copy)
        return v7.errorMessage and string.len(v7.errorMessage) > 0;
    end;
    return l_React_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v7.LayoutOrder
    }, {
        Layout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v8.Tokens.Component.InputLabel.Base.Spacing.Bottom)
        }), 
        InputCanvas = l_React_0.createElement("CanvasGroup", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            GroupTransparency = if v7.disabled then 1 - l_TextField_0.Disabled.Field.Opacity else 0
        }, {
            Input = l_React_0.createElement("ImageButton", {
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.new(0, 1, 0, 1), 
                BackgroundTransparency = 1, 
                Selectable = not v7.disabled, 
                Image = "", 
                ImageColor3 = v8.Theme.BackgroundUIContrast.Color, 
                SelectionImageObject = if l_FFlagLuaAppFixCursorHooks_0 then v15 else l_useCursor_0(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), 2, 2), 
                [l_React_0.Event.Activated] = function() --[[ Line: 77 ]]
                    -- upvalues: v11 (copy)
                    if v11.current then
                        v11.current:CaptureFocus();
                    end;
                end
            }, {
                Corner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius)
                }), 
                Border = l_React_0.createElement("UIStroke", {
                    Color = if v7.errorMessage and string.len(v7.errorMessage) > 0 then l_TextField_0.Error.Field.BorderColor.Color3 else l_TextField_0.Base.Field.BorderColor.Color3, 
                    Transparency = if v7.errorMessage and string.len(v7.errorMessage) > 0 then l_TextField_0.Error.Field.BorderColor.Transparency else v12 and 0 or l_TextField_0.Base.Field.BorderColor.Transparency, 
                    Thickness = 1
                }), 
                BorderFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, -4, 1, -4), 
                    Position = UDim2.new(0, 2, 0, 2), 
                    BackgroundTransparency = 1
                }, {
                    Corner = l_React_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius - 2)
                    }), 
                    Focus = if not v7.disabled and v12 then l_React_0.createElement("UIStroke", {
                        Color = l_TextField_0.Base.Field.BorderColor.Color3, 
                        Transparency = 0.88, 
                        Thickness = 3
                    }) else nil, 
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_TextField_0.Base.Field.Spacing.Leading), 
                        PaddingRight = UDim.new(0, l_TextField_0.Base.Field.Spacing.Trailing)
                    }), 
                    Layout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_TextField_0.Base.Field.Gap * 2)
                    }), 
                    TextBox = l_React_0.createElement("TextBox", {
                        ref = v11, 
                        Text = v7.text, 
                        TextInputType = v7.textInputType or Enum.TextInputType.Default, 
                        ClearTextOnFocus = false, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextEditable = not v7.disabled, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = l_TextField_0.Base.Field.Typography.Font, 
                        TextSize = l_TextField_0.Base.Field.Typography.FontSize, 
                        LineHeight = 1, 
                        TextColor3 = l_TextField_0.Base.FieldValue.ContentColor.Color3, 
                        TextTransparency = l_TextField_0.Base.FieldValue.ContentColor.Transparency, 
                        PlaceholderText = v7.placeholder, 
                        ClipsDescendants = true, 
                        LayoutOrder = 1, 
                        [l_React_0.Event.Focused] = v16, 
                        [l_React_0.Event.FocusLost] = v17, 
                        [l_React_0.Change.Text] = v7.onChange
                    })
                })
            })
        }), 
        HelperText = if v7.errorMessage and string.len(v7.errorMessage) > 0 then l_React_0.createElement("TextLabel", {
            Text = v7.errorMessage, 
            TextTransparency = l_HelperText_0.Base.ContentColor.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            TextColor3 = l_HelperText_0.Error.ContentColor.Color3, 
            Font = l_Typography_0.Font, 
            TextSize = l_Typography_0.FontSize, 
            LineHeight = l_Typography_0.LineHeight, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }) else nil
    });
end;