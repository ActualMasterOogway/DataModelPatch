local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.ClientSettings);
local v5 = require(script.Parent.mapStateToProps);
local v6 = require(script.Parent.mapDispatchToProps);
local v7 = require(script.Parent.Parent.BubbleChat);
local v8 = require(script.Parent.Parent.AppLayout);
local l_TextChatService_0 = game:GetService("TextChatService");
local v10 = require(l_script_FirstAncestor_0.GlobalFlags);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationShowFTUX);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_Parent_0.SharedFlags).getFFlagExpChatAlwaysRunTCS;
getChatWindowEnabled = function() --[[ Line: 22 ]] --[[ Name: getChatWindowEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
        -- upvalues: l_TextChatService_0 (ref)
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        if l_ChatWindowConfiguration_0 ~= nil then
            return l_ChatWindowConfiguration_0.Enabled;
        else
            return false;
        end;
    end);
    return l_status_0 and l_result_0;
end;
getChatTranslationEnabled = function() --[[ Line: 35 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 36 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_1 and l_result_1;
end;
getChatTranslationToggleEnabled = function() --[[ Line: 43 ]] --[[ Name: getChatTranslationToggleEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 44 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationToggleEnabled;
    end);
    return l_status_2 and l_result_2;
end;
shouldShowChatTranslationFTUX = function() --[[ Line: 51 ]] --[[ Name: shouldShowChatTranslationFTUX ]]
    -- upvalues: l_TextChatService_0 (copy)
    if game:GetEngineFeature("TextChatServiceSettingsSaved") then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_TextChatService_0 (ref)
            return l_TextChatService_0.ChatTranslationFTUXShown;
        end);
        return not (l_status_3 and l_result_3);
    else
        return true;
    end;
end;
local v24 = shouldShowChatTranslationFTUX();
local v25 = require(script.Parent.Parent.ChatTranslationFTUX);
local v26 = (if v13() then v2.PureComponent else v2.Component):extend("AppContainer");
v26.defaultProps = {
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    onSendChat = nil, 
    messages = {}, 
    mutedUserIds = nil, 
    textTimer = nil, 
    timer = nil, 
    textChatService = l_TextChatService_0
};
local v27 = nil;
v26.init = function(v28) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: l_getFFlagExpChatAlwaysRunTCS_0 (copy), v10 (copy)
    v28:setState({
        showTranslationButton = false
    });
    local _ = nil;
    v28.isTextChatServiceOn = not not l_getFFlagExpChatAlwaysRunTCS_0() or not v10.ConsolidateBubbleChat or v28.props.textChatService.ChatVersion == Enum.ChatVersion.TextChatService;
end;
v26.willUnmount = function(_) --[[ Line: 100 ]] --[[ Name: willUnmount ]]
    -- upvalues: v11 (copy), v27 (ref)
    if v11() then
        v27:Disconnect();
    end;
end;
v26.didMount = function(v31) --[[ Line: 106 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy), l_TextChatService_0 (copy), v27 (ref)
    if v11() then
        local function v39(v32) --[[ Line: 108 ]] --[[ Name: onTextChatServicePropertyChanged ]]
            -- upvalues: l_TextChatService_0 (ref), v31 (copy)
            if v32 == "ChatTranslationEnabled" then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 110 ]]
                    -- upvalues: l_TextChatService_0 (ref)
                    return l_TextChatService_0.ChatTranslationEnabled;
                end);
                if l_status_4 then
                    v31.props.onToggleTranslation(l_result_4);
                    v31:setState({
                        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                    });
                    return;
                end;
            elseif v32 == "ChatTranslationToggleEnabled" then
                local l_status_5, _ = pcall(function() --[[ Line: 122 ]]
                    -- upvalues: l_TextChatService_0 (ref)
                    return l_TextChatService_0.ChatTranslationToggleEnabled;
                end);
                local l_status_6, l_result_6 = pcall(function() --[[ Line: 126 ]]
                    -- upvalues: l_TextChatService_0 (ref)
                    return l_TextChatService_0.ChatTranslationEnabled;
                end);
                if l_status_5 then
                    if l_status_6 then
                        v31.props.onToggleTranslation(l_result_6);
                    end;
                    v31:setState({
                        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                    });
                end;
            end;
        end;
        if not v27 then
            v27 = l_TextChatService_0.Changed:Connect(v39);
        end;
        v31:setState({
            showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
        });
    end;
end;
v26.render = function(v40) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), v4 (copy), v8 (copy), v11 (copy), v12 (copy), v24 (copy), v25 (copy), v10 (copy)
    local v41 = v2.createElement(v7, {
        getIconVoiceIndicator = v40.props.getIconVoiceIndicator, 
        onClickedVoiceIndicator = v40.props.onClickedVoiceIndicator, 
        onClickedCameraIndicator = v40.props.onClickedCameraIndicator, 
        selfViewListenerChanged = v40.props.selfViewListenerChanged, 
        getPermissions = v40.props.getPermissions, 
        displayCameraDeniedToast = v40.props.displayCameraDeniedToast, 
        isCamEnabledForUserAndPlace = v40.props.isCamEnabledForUserAndPlace, 
        isCameraOnlyUser = v40.props.isCameraOnlyUser, 
        isTextChatServiceOn = v40.isTextChatServiceOn, 
        isVoiceServiceInitialized = v40.props.isVoiceServiceInitialized, 
        onClickedLikelySpeakingBubble = v40.props.onClickedLikelySpeakingBubble
    });
    if v40.isTextChatServiceOn then
        return v2.createElement(v4.Provider, {
            value = v40.props.clientSettings
        }, {
            app = v2.createFragment({
                appLayout = v2.createElement(v8, {
                    canLocalUserChat = v40.props.canLocalUserChat, 
                    isChatInputBarVisible = v40.props.isChatInputBarVisible, 
                    isChatWindowVisible = v40.props.isChatWindowVisible, 
                    isChannelBarVisible = v40.props.isChannelBarVisible, 
                    chatTopBarVisibility = v40.props.chatTopBarVisibility, 
                    messages = v40.props.messages, 
                    mutedUserIds = v40.props.mutedUserIds, 
                    onSendChat = v40.props.onSendChat, 
                    timer = v40.props.timer, 
                    textTimer = v40.props.textTimer, 
                    activateWhisperMode = v40.props.activateWhisperMode, 
                    resetTargetChannel = v40.props.resetTargetChannel, 
                    lastGeneralActivityTimestamp = v40.props.lastGeneralActivityTimestamp, 
                    lastMessageActivityTimestamp = v40.props.lastMessageActivityTimestamp, 
                    isTextBoxFocused = v40.props.isTextBoxFocused, 
                    onHovered = v40.props.onHovered, 
                    onUnhovered = v40.props.onUnhovered, 
                    chatLayoutAlignment = v40.props.chatLayoutAlignment, 
                    chatWindowSettings = v40.props.chatWindowSettings, 
                    clientSettings = v40.props.clientSettings, 
                    showTranslationButton = if v11() then v40.state.showTranslationButton else nil, 
                    isSpatialUIEnabled = v40.props.isSpatialUIEnabled
                }), 
                bubbleChat = v41, 
                ChatTranslationFTUX = if v11() and v12() and v24 and getChatTranslationEnabled() and getChatWindowEnabled() then v2.createElement(v25, {}) else nil
            })
        });
    elseif v10.ConsolidateBubbleChat then
        return v2.createElement(v4.Provider, {
            value = v40.props.clientSettings
        }, {
            bubbleChat = v41
        });
    else
        return nil;
    end;
end;
return v3.connect(v5, v6)(v26);