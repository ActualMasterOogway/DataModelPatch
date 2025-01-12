local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_withStyle_0 = v5.Style.withStyle;
local v9 = require(script.Parent.isMessageValid);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.isKeyCodePressed);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local v15 = Color3.fromRGB(184, 184, 184);
local v16 = Color3.fromRGB(0, 162, 255);
local l_CallbackInputBox_0 = v2.Components.CallbackInputBox;
local v18 = require(l_script_FirstAncestor_0.Analytics.Enums.SendButtonClickActionResult);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationIncreasePadding);
game:DefineFastFlag("AppChatBehaviorCollectionEnabledMaster", false);
game:DefineFastInt("AppChatBehaviorCollectionEnabledPercentage", 0);
local v22 = v3.PureComponent:extend("ChatInputBar");
local v23 = require(l_script_FirstAncestor_0.Analytics.KeystrokeEvent);
v22.defaultProps = {
    userInputService = l_UserInputService_0, 
    initialInputText = "", 
    placeholderText = "Say something", 
    sendButtonContainerSize = 45, 
    LayoutOrder = 0, 
    maxCharacterLength = 160, 
    maxKeystrokeDataLength = 200, 
    messageListRef = nil, 
    onHeightChanged = function() --[[ Line: 47 ]] --[[ Name: onHeightChanged ]]

    end, 
    onPositionChanged = function() --[[ Line: 48 ]] --[[ Name: onPositionChanged ]]

    end, 
    onFocusLost = function() --[[ Line: 49 ]] --[[ Name: onFocusLost ]]

    end, 
    onSendBtnClicked = nil, 
    onSendChat = nil, 
    onTextChanged = function() --[[ Line: 53 ]] --[[ Name: onTextChanged ]]

    end, 
    inputBoxRef = nil, 
    eventLoggingFunc = l_default_0.logRobloxTelemetryEvent, 
    textChangedFallback = false
};
v22.init = function(v24) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), l_Text_0 (copy), v21 (copy), l_getAppFeaturePolicies_0 (copy), l_Players_0 (copy), v9 (copy), v10 (copy), v18 (copy)
    v24.isMounted = false;
    v24.state = {
        inputText = v24.props.initialInputText, 
        showSendChat = false, 
        chatBarWidth = 0, 
        frameHeight = 0
    };
    v24.inputBoxRef = v24.props.inputBoxRef or v3.createRef();
    v24.messageListRef = v24.props.messageListRef;
    v24.textChangedFallback = v24.props.textChangedFallback or not l_UserInputService_0.KeyboardEnabled;
    v24.heightOfFourLines = function(v25, v26, v27) --[[ Line: 75 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight("A\nB\nC\nD", v25, v26, v27);
    end;
    v24.calculateInputBoxHeight = function(v28, v29, v30, v31) --[[ Line: 79 ]]
        -- upvalues: l_Text_0 (ref), v24 (copy), v21 (ref)
        local v32 = v30 + math.min(l_Text_0.GetTextHeight(v28, v29, v30, v31), (v24.heightOfFourLines(v29, v30, v31)));
        if v21() then
            v32 = v32 + 16;
        end;
        if v24.props.onHeightChanged then
            v24.props.onHeightChanged(v32);
        end;
        return v32;
    end;
    v24.inputConnectionActive = false;
    v24.inputBeganConnection = nil;
    v24.inputEndedConnection = nil;
    v24.keyPressedData = {};
    v24.eventTypeData = {};
    v24.timestampData = {};
    v24.shouldCollectKeystrokes = false;
    local v33 = l_getAppFeaturePolicies_0().getKeystrokeCollectionEnabled();
    if game:GetFastFlag("AppChatBehaviorCollectionEnabledMaster") then
        local l_game_FastInt_0 = game:GetFastInt("AppChatBehaviorCollectionEnabledPercentage");
        if l_game_FastInt_0 > 0 and l_Players_0.LocalPlayer and v33 then
            v24.shouldCollectKeystrokes = l_Players_0.LocalPlayer.UserId % 100 < l_game_FastInt_0;
        end;
    end;
    v24.onTextChanged = function(v35, v36, v37, v38) --[[ Line: 110 ]]
        -- upvalues: v24 (copy), v9 (ref)
        if not v24.isMounted then
            return;
        else
            local v39 = false;
            if v35 and v9(v35, v24.props.maxCharacterLength) then
                v39 = true;
            end;
            local v40 = v24.calculateInputBoxHeight(v35, v36, v37, v38);
            v24:setState({
                inputText = v35, 
                showSendChat = v39, 
                frameHeight = v40
            });
            v24.props.onTextChanged(v35);
            if v24.shouldCollectKeystrokes and v24.textChangedFallback then
                v24:recordTextChange(v35);
            end;
            return;
        end;
    end;
    v24.onInputBeganEvent = function(v41) --[[ Line: 137 ]]
        -- upvalues: v24 (copy), v10 (ref)
        if v24.shouldCollectKeystrokes and not v24.textChangedFallback and v41.UserInputType == Enum.UserInputType.Keyboard then
            v24:recordKeystroke(true, v41.KeyCode);
        end;
        if v10({
            v41
        }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not v10(v24.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
            v24.onSendActivated();
        end;
    end;
    v24.onInputEndedEvent = function(v42) --[[ Line: 156 ]]
        -- upvalues: v24 (copy)
        if v24.shouldCollectKeystrokes and not v24.textChangedFallback and v42.UserInputType == Enum.UserInputType.Keyboard then
            v24:recordKeystroke(false, v42.KeyCode);
        end;
    end;
    v24.focusChanged = function(v43) --[[ Line: 164 ]]
        -- upvalues: v24 (copy)
        if v43 and not v24.inputConnectionActive then
            v24.inputBeganConnection = v24.props.userInputService.InputBegan:Connect(v24.onInputBeganEvent);
            v24.inputEndedConnection = v24.props.userInputService.InputEnded:Connect(v24.onInputEndedEvent);
            v24.inputConnectionActive = true;
            return;
        else
            if not v43 and v24.inputConnectionActive then
                v24:disconnectInputConnection();
                v24.props.onFocusLost();
            end;
            return;
        end;
    end;
    v24.onSendActivated = function() --[[ Line: 175 ]]
        -- upvalues: l_Text_0 (ref), v24 (copy), v18 (ref), v9 (ref)
        local v44 = l_Text_0.Trim(v24.state.inputText);
        local l_None_0 = v18.None;
        if v24.state.showSendChat and v9(v44, v24.props.maxCharacterLength) then
            v24.inputBoxRef:getValue().Text = "";
            v24:setState({
                inputText = "", 
                showSendChat = false
            });
            if v24.props.onSendChat then
                if v44 == "/shrug" then
                    v24.props.onSendChat("\194\175\\_(\227\131\132)_/\194\175");
                else
                    v24.props.onSendChat(v44);
                end;
                l_None_0 = v18.WillSend;
            end;
            local v46 = v24.messageListRef and v24.messageListRef.current and v24.messageListRef.current._listRef;
            if v46 then
                v46:scrollToOffset({
                    offset = 0
                });
            end;
        else
            l_None_0 = if not v24.state.showSendChat then v18.ButtonInactive else v18.MessageInvalid;
        end;
        if v24.props.onSendBtnClicked then
            v24.props.onSendBtnClicked(l_None_0);
        end;
        if v24.shouldCollectKeystrokes then
            v24:sendKeystrokeEvent("UASendPressed");
        end;
    end;
    v24.chatBoxSizeChanged = function(v47) --[[ Line: 222 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            chatBarWidth = v47.AbsoluteSize.X
        });
    end;
end;
v22.render = function(v48) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v21 (copy), l_IconSize_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v16 (copy), v15 (copy)
    return l_withStyle_0(function(v49) --[[ Line: 230 ]]
        -- upvalues: v48 (copy), v3 (ref), v21 (ref), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), l_GetFFlagLuaAppEnableFoundationColors_0 (ref), v16 (ref), v15 (ref)
        local l_Font_0 = v49.Font;
        local l_Font_1 = l_Font_0.Body.Font;
        local v52 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_frameHeight_0 = v48.state.frameHeight;
        if l_frameHeight_0 == 0 then
            l_frameHeight_0 = v48.calculateInputBoxHeight(v48.state.inputText, l_Font_1, v52, v48.state.chatBarWidth);
        end;
        return v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v48.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
            [v3.Change.AbsolutePosition] = v48.props.onPositionChanged
        }, {
            layout = v3.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding = v3.createElement("UIPadding", {
                PaddingLeft = if v21() then UDim.new(0, 20) else UDim.new(0, l_IconSize_0.Regular / 4), 
                PaddingRight = if v21() then UDim.new(0, 10) else nil, 
                PaddingBottom = if v21() then UDim.new(0, 13) else UDim.new(0, 5), 
                PaddingTop = if v21() then UDim.new(0, 8) else nil
            }), 
            inputBorder = v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, -v48.props.sendButtonContainerSize, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                ImageColor3 = v49.Theme.Divider.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9)
            }, {
                inputImage = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Image = l_Images_0["component_assets/circle_21"], 
                    ImageColor3 = v49.Theme.UIMuted.Color, 
                    ImageTransparency = v49.Theme.UIMuted.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9)
                }, {
                    padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v52 / 2.5), 
                        PaddingLeft = UDim.new(0.02, 0), 
                        PaddingRight = UDim.new(0.02, 0)
                    }), 
                    inputBox = v3.createElement(l_CallbackInputBox_0, {
                        initialInputText = v48.props.initialInputText, 
                        inputTextFont = l_Font_1, 
                        inputTextColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v49.Theme.TextEmphasis.Color else v49.Theme.TextMuted.Color, 
                        inputTextSize = v52, 
                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                        inputTextYAlignment = Enum.TextYAlignment.Top, 
                        placeholderText = v48.props.placeholderText, 
                        placeholderTextColor3 = v49.Theme.TextMuted.Color, 
                        placeholderTextTransparency = v49.Theme.TextMuted.Transparency, 
                        clipsDescendants = false, 
                        multiLine = true, 
                        manualFocusRelease = true, 
                        textWrapped = true, 
                        focusChangedCallback = v48.focusChanged, 
                        clearButtonDisabled = true, 
                        clearButtonSize = 0, 
                        textChangedCallback = function(v54) --[[ Line: 317 ]] --[[ Name: textChangedCallback ]]
                            -- upvalues: v48 (ref), l_Font_1 (copy), v52 (copy)
                            v48.onTextChanged(v54, l_Font_1, v52, v48.state.chatBarWidth);
                        end, 
                        [v3.Change.AbsoluteSize] = v48.chatBoxSizeChanged, 
                        inputBoxRef = v48.inputBoxRef
                    })
                })
            }), 
            sendButton = v3.createElement("TextButton", {
                Size = UDim2.new(0, v48.props.sendButtonContainerSize, 1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Text = "", 
                [v3.Event.Activated] = v48.onSendActivated
            }, {
                layout = v3.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                sendIcon = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then if v48.state.showSendChat then v49.Tokens.Semantic.Color.Icon.Emphasis.Color3 else v49.Tokens.Semantic.Color.Icon.Default.Color3 else v48.state.showSendChat and v16 or v15, 
                    ImageTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v48.state.showSendChat and 0 or 0.5 else nil, 
                    Image = l_Images_0["icons/actions/send"]
                })
            })
        });
    end);
end;
v22.didMount = function(v55) --[[ Line: 357 ]] --[[ Name: didMount ]]
    v55.isMounted = true;
end;
v22.willUnmount = function(v56) --[[ Line: 361 ]] --[[ Name: willUnmount ]]
    v56.isMounted = false;
    if v56.inputConnectionActive then
        v56:disconnectInputConnection();
    end;
    if v56.props.onHeightChanged then
        v56.props.onHeightChanged(0);
    end;
end;
v22.recordKeystroke = function(v57, v58, v59) --[[ Line: 373 ]] --[[ Name: recordKeystroke ]]
    if v58 then
        table.insert(v57.keyPressedData, v59.Name);
        table.insert(v57.eventTypeData, 0);
        table.insert(v57.timestampData, DateTime.now().UnixTimestampMillis);
    elseif v59 ~= Enum.KeyCode.Return and v59 ~= Enum.KeyCode.KeypadEnter or #v57.keyPressedData ~= 0 then
        table.insert(v57.keyPressedData, v59.Name);
        table.insert(v57.eventTypeData, 1);
        table.insert(v57.timestampData, DateTime.now().UnixTimestampMillis);
    end;
    if #v57.keyPressedData >= v57.props.maxKeystrokeDataLength then
        v57:sendKeystrokeEvent("UAMaxLengthReached");
    end;
end;
v22.recordTextChange = function(v60, v61) --[[ Line: 393 ]] --[[ Name: recordTextChange ]]
    table.insert(v60.keyPressedData, v61:sub(-1));
    table.insert(v60.timestampData, DateTime.now().UnixTimestampMillis);
    if #v60.keyPressedData >= v60.props.maxKeystrokeDataLength then
        v60:sendKeystrokeEvent("UAMaxLengthReached");
    end;
end;
v22.sendKeystrokeEvent = function(v62, v63) --[[ Line: 403 ]] --[[ Name: sendKeystrokeEvent ]]
    -- upvalues: l_default_0 (copy), v23 (copy)
    if #v62.keyPressedData >= 0 then
        v62.props.eventLoggingFunc(l_default_0, v23, {}, {
            chatContext = v63, 
            keyPressedData = table.concat(v62.keyPressedData, ","), 
            eventTypeData = table.concat(v62.eventTypeData, ","), 
            timestampData = table.concat(v62.timestampData, ",")
        });
        v62.keyPressedData = {};
        v62.eventTypeData = {};
        v62.timestampData = {};
    end;
end;
v22.disconnectInputConnection = function(v64) --[[ Line: 417 ]] --[[ Name: disconnectInputConnection ]]
    if v64.inputBeganConnection then
        v64.inputBeganConnection:Disconnect();
        v64.inputBeganConnection = nil;
    end;
    if v64.inputEndedConnection then
        v64.inputEndedConnection:Disconnect();
        v64.inputEndedConnection = nil;
    end;
    v64.inputConnectionActive = false;
end;
return v22;