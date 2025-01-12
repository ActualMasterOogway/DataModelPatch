local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_ImageSetLabel_0 = v1.UIBlox.Core.ImageSet.ImageSetLabel;
local v4 = l_Roact_0.PureComponent:extend("CallbackInputBox");
v4.defaultProps = {
    initialInputText = "", 
    inputTextFont = Enum.Font.BuilderSans, 
    inputTextColor3 = Color3.new(1, 0, 1), 
    inputTextSize = 14, 
    inputTextYAlignment = Enum.TextYAlignment.Center, 
    inputTextXAlignment = Enum.TextXAlignment.Center, 
    inputTextTransparency = 0, 
    placeholderTextTransparency = 0.6, 
    placeholderTextColor3 = Color3.new(1, 0, 0), 
    placeholderText = "Test placeholder text", 
    clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    clearIconColor3 = Color3.new(1, 1, 0), 
    clearIconTransparency = 0, 
    clearButtonSize = 24, 
    clipsDescendants = true, 
    manualFocusRelease = false, 
    captureFocusOnMount = false, 
    multiLine = false, 
    textWrapped = false, 
    showCancelIconOnLoad = false, 
    textInputType = Enum.TextInputType.Default, 
    returnKeyType = Enum.ReturnKeyType.Default, 
    clearButtonDisabled = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function() --[[ Line: 38 ]] --[[ Name: focusChangedCallback ]]

    end, 
    onSelectCallback = function() --[[ Line: 39 ]] --[[ Name: onSelectCallback ]]

    end, 
    returnPressedFromOnScreenKeyboardCallback = function() --[[ Line: 40 ]] --[[ Name: returnPressedFromOnScreenKeyboardCallback ]]

    end, 
    inputBoxRef = nil, 
    [l_Roact_0.Change.AbsoluteSize] = function() --[[ Line: 44 ]]

    end
};
v4.init = function(v5) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v5.clearRef = l_Roact_0.createRef();
    v5.inputBoxRef = v5.props.inputBoxRef or l_Roact_0.createRef();
    v5.inputText = v5.props.initialInputText;
    v5.textChangedEventUnlocked = false;
    v5.focusTextbox = function() --[[ Line: 58 ]]
        -- upvalues: v5 (copy)
        v5.props.onSelectCallback();
        if not v5.inputBoxRef.current:IsFocused() then
            v5.inputBoxRef.current:captureFocus();
        end;
    end;
end;
v4.render = function(v6) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_ImageSetLabel_0 (copy)
    local l_placeholderTextTransparency_0 = v6.props.placeholderTextTransparency;
    local l_inputTextTransparency_0 = v6.props.inputTextTransparency;
    local v9 = nil;
    v9 = if not v6.inputText or v6.inputText == "" then l_placeholderTextTransparency_0 else l_inputTextTransparency_0;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        inputBox = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            inputTextBox = l_Roact_0.createElement("TextBox", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -v6.props.clearButtonSize, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                TextColor3 = v6.props.inputTextColor3, 
                TextSize = v6.props.inputTextSize, 
                TextTransparency = v9, 
                Font = v6.props.inputTextFont, 
                PlaceholderText = v6.props.placeholderText, 
                PlaceholderColor3 = v6.props.placeholderTextColor3, 
                TextXAlignment = v6.props.inputTextXAlignment, 
                TextYAlignment = v6.props.inputTextYAlignment, 
                OverlayNativeInput = true, 
                ClearTextOnFocus = false, 
                ClipsDescendants = v6.props.clipsDescendants, 
                LayoutOrder = 1, 
                ManualFocusRelease = v6.props.manualFocusRelease, 
                MultiLine = v6.props.multiLine, 
                TextWrapped = v6.props.textWrapped, 
                TextInputType = v6.props.textInputType, 
                ReturnKeyType = v6.props.returnKeyType, 
                [l_Roact_0.Event.ReturnPressedFromOnScreenKeyboard] = v6.props.returnPressedFromOnScreenKeyboardCallback, 
                [l_Roact_0.Event.TouchTap] = v6.focusTextbox, 
                [l_Roact_0.Event.Focused] = function(v10) --[[ Line: 131 ]]
                    -- upvalues: v6 (copy), l_inputTextTransparency_0 (copy), l_placeholderTextTransparency_0 (copy)
                    if v6.inputBoxRef.current and v6.inputBoxRef.current.Text ~= "" then
                        if v6.clearRef.current and not v6.props.clearButtonDisabled then
                            v6.clearRef.current.Visible = true;
                        end;
                        v10.TextColor3 = v6.props.inputTextColor3;
                        v10.TextTransparency = l_inputTextTransparency_0;
                    else
                        v10.TextColor3 = v6.props.placeholderTextColor3;
                        v10.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v6.props.focusChangedCallback(true);
                end, 
                [l_Roact_0.Event.FocusLost] = function(v11, v12) --[[ Line: 147 ]]
                    -- upvalues: v6 (copy), l_placeholderTextTransparency_0 (copy)
                    if v6.inputBoxRef.current and v6.inputBoxRef.current.Text == "" then
                        v11.TextColor3 = v6.props.placeholderTextColor3;
                        v11.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v6.props.focusChangedCallback(false, v12);
                end, 
                [l_Roact_0.Change.Text] = function(v13) --[[ Line: 156 ]]
                    -- upvalues: v6 (copy), l_inputTextTransparency_0 (copy), l_placeholderTextTransparency_0 (copy)
                    if v13.Text ~= "" or v6.textChangedEventUnlocked then
                        if v13.Text ~= "" then
                            if v6.clearRef.current and not v6.props.clearButtonDisabled then
                                v6.clearRef.current.Visible = true;
                            end;
                            v13.TextColor3 = v6.props.inputTextColor3;
                            v13.TextTransparency = l_inputTextTransparency_0;
                        else
                            if v6.clearRef.current then
                                v6.clearRef.current.Visible = false;
                            end;
                            v13.TextColor3 = v6.props.placeholderTextColor3;
                            v13.TextTransparency = l_placeholderTextTransparency_0;
                        end;
                        v6.inputText = v13.Text;
                        if v6.props.textChangedCallback then
                            v6.props.textChangedCallback(v13.Text);
                        end;
                    end;
                    v6.textChangedEventUnlocked = true;
                end, 
                [l_Roact_0.Ref] = v6.inputBoxRef, 
                [l_Roact_0.Change.AbsoluteSize] = v6.props[l_Roact_0.Change.AbsoluteSize]
            }), 
            Clear = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v6.props.clearButtonSize, 1, 0), 
                AutoButtonColor = false, 
                LayoutOrder = 2, 
                Visible = not v6.props.clearButtonDisabled, 
                [l_Roact_0.Event.Activated] = function() --[[ Line: 195 ]]
                    -- upvalues: v6 (copy)
                    if v6.inputBoxRef.current then
                        v6.inputBoxRef.current.Text = "";
                    end;
                    v6.inputText = "";
                    if v6.clearRef.current then
                        v6.clearRef.current.Visible = false;
                    end;
                end
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = "Center", 
                    HorizontalAlignment = "Center"
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v6.props.clearButtonSize, 0, v6.props.clearButtonSize), 
                    Image = v6.props.clearIcon, 
                    ImageColor3 = v6.props.clearIconColor3, 
                    ImageTransparency = v6.props.clearIconTransparency, 
                    Visible = v6.props.showCancelIconOnLoad, 
                    [l_Roact_0.Ref] = v6.clearRef
                })
            })
        })
    });
end;
v4.didMount = function(v14) --[[ Line: 227 ]] --[[ Name: didMount ]]
    if v14.inputBoxRef.current then
        v14.inputBoxRef.current.Text = v14.inputText;
        if v14.props.captureFocusOnMount then
            spawn(function() --[[ Line: 232 ]]
                -- upvalues: v14 (copy)
                if v14.inputBoxRef and v14.inputBoxRef.current then
                    v14.inputBoxRef.current:captureFocus();
                end;
            end);
        end;
    end;
end;
return v4;