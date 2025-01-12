local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(l_script_FirstAncestor_0.BubbleChat.ChatBubble);
local v5 = require(l_script_FirstAncestor_0.Flags.getFixBubblesOutofOrderWhenZoomedIn);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local v7 = require(l_script_FirstAncestor_0.GlobalFlags);
local v8 = (if v6() then v2.PureComponent else v2.Component):extend("BubbleChatList");
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabledBubbleChat);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableGradientForChatWindowMessage);
v8.getDerivedStateFromProps = function(v11, v12) --[[ Line: 22 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_List_0 (copy), v5 (copy), v9 (copy)
    local v13 = {};
    if v12.bubbles then
        for _, v15 in ipairs(v12.bubbles) do
            if not l_List_0.findWhere(v11.messages, function(v16, _) --[[ Line: 29 ]]
                -- upvalues: v15 (copy)
                return v16.messageId == v15.messageId;
            end) then
                table.insert(v13, {
                    messageId = v15.messageId, 
                    fadingOut = true
                });
            end;
        end;
    end;
    for _, v19 in ipairs(v11.messages) do
        local v20 = nil;
        if v5() then
            v20 = tonumber(tostring(v19.timestamp):sub(-9));
        end;
        table.insert(v13, {
            messageId = v19.messageId, 
            fadingOut = false, 
            text = v19.text, 
            translation = if v9() then v19.translation else nil, 
            useTranslation = if v9() then v19.useTranslation else nil, 
            timestamp = v20 or v19.timestamp, 
            bubbleChatMessageProperties = v19.bubbleChatMessageProperties
        });
    end;
    return {
        bubbles = v13
    };
end;
v8.init = function(v21, v22) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: l_List_0 (copy)
    v21.state = {};
    if (not v22.messages or #v22.messages == 0) and v22.onLastBubbleFadeOut then
        v22.onLastBubbleFadeOut();
    end;
    v21.onBubbleFadeOut = function(v23) --[[ Line: 73 ]]
        -- upvalues: l_List_0 (ref), v21 (copy)
        local v25 = l_List_0.filter(v21.state.bubbles, function(v24) --[[ Line: 74 ]]
            -- upvalues: v23 (copy)
            return v24.messageId ~= v23;
        end);
        if #v25 == 0 and v21.props.onLastBubbleFadeOut then
            v21.props.onLastBubbleFadeOut();
            return;
        else
            v21:setState({
                bubbles = v25
            });
            return;
        end;
    end;
end;
v8.render = function(v26) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), v10 (copy), v5 (copy), v4 (copy), v9 (copy)
    local v27 = {};
    local l_chatSettings_0 = v26.props.chatSettings;
    v27.Layout = v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Padding = UDim.new(0, l_chatSettings_0.BubblesSpacing)
    });
    v27.CaretPadding = v26.props.chatSettings.TailVisible and (not v7.AvatarChatEnabled or v26.props.showCaret) and v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8)
    });
    for v29, v30 in ipairs(v26.state.bubbles) do
        local v31 = v29 == #v26.state.bubbles;
        local v32 = v31 and v26.props.renderFirstInsert or nil;
        local l_insertSize_0 = v26.props.insertSize;
        local l_text_0 = v30.text;
        local l_translation_0 = v30.translation;
        if v10() and v30.bubbleChatMessageProperties then
            local l_bubbleChatMessageProperties_0 = v30.bubbleChatMessageProperties;
            if l_bubbleChatMessageProperties_0:IsA("TextChatMessageProperties") then
                if l_bubbleChatMessageProperties_0.Text ~= "" then
                    l_text_0 = l_bubbleChatMessageProperties_0.Text;
                end;
                if l_bubbleChatMessageProperties_0.Translation ~= "" then
                    l_translation_0 = l_bubbleChatMessageProperties_0.Translation;
                end;
            end;
        end;
        if v5() then
            v27["Bubble" .. v30.messageId] = v2.createElement(v4, {
                messageId = v30.messageId, 
                text = l_text_0 or "", 
                translation = if v9() then l_translation_0 else nil, 
                useTranslation = if v9() then v30.useTranslation else nil, 
                timestamp = v30.timestamp or 0, 
                isMostRecent = v31, 
                theme = v26.props.theme, 
                fadingOut = v30.fadingOut, 
                onFadeOut = v26.onBubbleFadeOut, 
                chatSettings = l_chatSettings_0, 
                renderInsert = v32, 
                insertSize = l_insertSize_0, 
                showCaret = v26.props.showCaret, 
                clientSettings = v26.props.clientSettings, 
                bubbleChatMessageProperties = v30.bubbleChatMessageProperties, 
                isTextChatServiceOn = v26.props.isTextChatServiceOn
            });
        else
            v27["Bubble" .. v30.messageId] = v2.createElement(v4, {
                messageId = v30.messageId, 
                text = l_text_0 or "", 
                translation = if v9() then l_translation_0 else nil, 
                useTranslation = if v9() then v30.useTranslation else nil, 
                timestamp = v30.timestamp and v30.timestamp.UnixTimestamp or 0, 
                isMostRecent = v31, 
                theme = v26.props.theme, 
                fadingOut = v30.fadingOut, 
                onFadeOut = v26.onBubbleFadeOut, 
                chatSettings = l_chatSettings_0, 
                renderInsert = v32, 
                insertSize = l_insertSize_0, 
                showCaret = v26.props.showCaret, 
                clientSettings = v26.props.clientSettings, 
                bubbleChatMessageProperties = v30.bubbleChatMessageProperties
            });
        end;
    end;
    return v2.createElement("Frame", {
        Visible = v26.props.isVisible, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v27);
end;
return v8;