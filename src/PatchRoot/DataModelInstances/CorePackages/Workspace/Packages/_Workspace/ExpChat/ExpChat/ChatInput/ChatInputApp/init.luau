local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Localization);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_script_FirstAncestor_0.Config);
local v10 = require(l_Parent_0.SharedFlags);
local v11 = require(l_script_FirstAncestor_0.Actions.FocusChatHotKeyActivated);
local v12 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownActivated);
local v13 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownResultsChanged);
local v14 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownSelectionChanged);
local v15 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownTypeChanged);
local v16 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownDeactivated);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v10.GetFFlagReenableTextChatForTenFootInterfaces;
local l_UI_0 = script.Parent.UI;
local v19 = require(l_UI_0.ChatInputBar);
local v20 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v22 = require(l_Parent_0.Cryo);
local v23 = v6.Component:extend("ChatInputBarApp");
v23.defaultProps = {
    addTopPadding = true, 
    LayoutOrder = 1, 
    onSendChat = nil, 
    transparencyValue = v6.createBinding(0.3)
};
v23.getPlaceholderText = function(v24) --[[ Line: 39 ]] --[[ Name: getPlaceholderText ]]
    if v24.props.isUsingGamepad then
        return v24.props.placeholderGamepadText;
    elseif v24.props.isUsingTouch then
        return v24.props.placeholderTouchText;
    else
        return v24.props.placeholderKeyboardText;
    end;
end;
v23.render = function(v25) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v19 (copy), l_UserInputService_0 (copy), v9 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy)
    return v7.createElement(v19, {
        userInputService = l_UserInputService_0, 
        contextActionService = game:GetService("ContextActionService"), 
        messageCharacterLimit = v9.MessageCharacterLimit, 
        sendButtonContainerWidth = 30, 
        addTopPadding = v25.props.addTopPadding, 
        LayoutOrder = v25.props.LayoutOrder, 
        placeholderText = if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then v25:getPlaceholderText() else if v25.props.isUsingTouch then v25.props.placeholderTouchText else v25.props.placeholderKeyboardText, 
        disabledChatPlaceholderText = v25.props.disabledChatPlaceholderText, 
        size = UDim2.fromScale(1, 0), 
        chatIntervention = v25.props.chatIntervention, 
        onSendChat = v25.props.onSendChat, 
        transparencyValue = v25.props.transparencyValue, 
        canLocalUserChat = v25.props.canLocalUserChat, 
        targetTextChannel = v25.props.targetTextChannel, 
        localTeam = v25.props.localTeam, 
        localPlayer = v25.props.localPlayer, 
        defaultSystemTextChannel = v25.props.defaultSystemTextChannel, 
        shouldFocusChatInputBar = v25.props.shouldFocusChatInputBar, 
        resetTargetChannel = v25.props.resetTargetChannel, 
        focusChatHotKeyActivated = v25.props.focusChatHotKeyActivated, 
        devDefinedFocusKeyCode = v25.props.devDefinedFocusKeyCode, 
        visible = v25.props.visible, 
        onFocus = v25.props.onFocus, 
        onUnfocus = v25.props.onUnfocus, 
        onHovered = v25.props.onHovered, 
        onUnhovered = v25.props.onUnhovered, 
        onAbsoluteSizeChanged = v25.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v25.props.onAbsolutePositionChanged, 
        chatWindowSettings = v25.props.chatWindowSettings, 
        chatInputBarSettings = v25.props.chatInputBarSettings, 
        isChatHotkeyEnabled = v25.props.isChatHotkeyEnabled, 
        autocompleteDropdownReducer = v25.props.autocompleteDropdownReducer, 
        autocompleteDropdownActivated = v25.props.autocompleteDropdownActivated, 
        autocompleteDropdownResultsChanged = v25.props.autocompleteDropdownResultsChanged, 
        autocompleteDropdownSelectionChanged = v25.props.autocompleteDropdownSelectionChanged, 
        autocompleteDropdownTypeChanged = v25.props.autocompleteDropdownTypeChanged, 
        autocompleteDropdownDeactivated = v25.props.autocompleteDropdownDeactivated, 
        autocompleteEnabled = v25.props.autocompleteEnabled, 
        isChannelBarVisible = v25.props.isChannelBarVisible
    });
end;
local v33 = v8.connect(function(v26) --[[ Line: 96 ]]
    -- upvalues: l_Players_0 (copy)
    return {
        targetTextChannel = v26.TextChannels.targetTextChannel, 
        localPlayer = l_Players_0.LocalPlayer, 
        localTeam = v26.LocalTeam, 
        isUsingTouch = v26.isUsingTouch, 
        isUsingGamepad = v26.isUsingGamepad, 
        devDefinedFocusKeyCode = v26.ChatLayout.ChatInputBarSettings.KeyboardKeyCode, 
        defaultSystemTextChannel = v26.TextChannels.allTextChannels.RBXSystem, 
        shouldFocusChatInputBar = v26.shouldFocusChatInputBar, 
        chatInputBarSettings = v26.ChatLayout.ChatInputBarSettings, 
        chatIntervention = v26.ChatIntervention, 
        isChatHotkeyEnabled = v26.ChatVisibility.isChatHotkeyEnabled.value, 
        autocompleteDropdownReducer = v26.AutocompleteDropdown, 
        autocompleteEnabled = v26.ChatLayout.ChatInputBarSettings.AutocompleteEnabled
    };
end, function(v27) --[[ Line: 112 ]]
    -- upvalues: v11 (copy), v20 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy)
    return {
        focusChatHotKeyActivated = function() --[[ Line: 114 ]] --[[ Name: focusChatHotKeyActivated ]]
            -- upvalues: v27 (copy), v11 (ref)
            return v27(v11());
        end, 
        onFocus = function() --[[ Line: 118 ]] --[[ Name: onFocus ]]
            -- upvalues: v27 (copy), v20 (ref)
            return v27(v20("focus"));
        end, 
        onUnfocus = function() --[[ Line: 122 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v27 (copy), v20 (ref)
            return v27(v20("unfocus"));
        end, 
        onHovered = function() --[[ Line: 126 ]] --[[ Name: onHovered ]]
            -- upvalues: v27 (copy), v20 (ref)
            return v27(v20("hover"));
        end, 
        onUnhovered = function() --[[ Line: 130 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v27 (copy), v20 (ref)
            return v27(v20("unhover"));
        end, 
        autocompleteDropdownActivated = function(v28) --[[ Line: 134 ]] --[[ Name: autocompleteDropdownActivated ]]
            -- upvalues: v27 (copy), v12 (ref)
            return v27(v12(v28));
        end, 
        autocompleteDropdownResultsChanged = function(v29) --[[ Line: 138 ]] --[[ Name: autocompleteDropdownResultsChanged ]]
            -- upvalues: v27 (copy), v13 (ref)
            return v27(v13(v29));
        end, 
        autocompleteDropdownSelectionChanged = function(v30) --[[ Line: 142 ]] --[[ Name: autocompleteDropdownSelectionChanged ]]
            -- upvalues: v27 (copy), v14 (ref)
            return v27(v14(v30));
        end, 
        autocompleteDropdownTypeChanged = function(v31) --[[ Line: 146 ]] --[[ Name: autocompleteDropdownTypeChanged ]]
            -- upvalues: v27 (copy), v15 (ref)
            return v27(v15(v31));
        end, 
        autocompleteDropdownDeactivated = function() --[[ Line: 150 ]] --[[ Name: autocompleteDropdownDeactivated ]]
            -- upvalues: v27 (copy), v16 (ref)
            return v27(v16());
        end
    };
end)(v3.connect(function(v32) --[[ Line: 154 ]]
    -- upvalues: l_UserInputService_0 (copy)
    return {
        placeholderKeyboardText = {
            "CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", 
            {
                KEY = l_UserInputService_0:GetStringForKeyCode(v32.devDefinedFocusKeyCode)
            }
        }, 
        placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch", 
        disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"
    };
end)(v23));
if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
    return function(v34) --[[ Line: 167 ]]
        -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v22 (copy), v7 (copy), v33 (copy)
        local v35 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        local v36 = v35:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", {
            CHAT_BUTTON = v35:Format("CoreScripts.TopBar.Chat")
        });
        local v37 = v22.Dictionary.join(v34, {
            placeholderGamepadText = v36
        });
        return v7.createElement(v33, v37);
    end;
else
    return v33;
end;