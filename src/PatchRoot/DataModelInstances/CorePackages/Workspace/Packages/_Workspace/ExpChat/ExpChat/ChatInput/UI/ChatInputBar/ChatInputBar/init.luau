local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v11 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v12 = require(l_script_FirstAncestor_0.Config);
local v13 = require(l_script_FirstAncestor_0.SpatialUI);
local v14 = v5.Logger:new("ExpChat/" .. script.Name);
local l_autoCastCommand_0 = v5.Commands.autoCastCommand;
local l_RBXWhisperCommand_0 = v5.Commands.Whisper.RBXWhisperCommand;
local l_RBXTeamCommand_0 = v5.Commands.RBXTeamCommand;
local v18 = require(l_script_FirstAncestor_0.Localization);
local v19 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v20 = require(script.Parent.ChannelChip);
local v21 = require(l_script_FirstAncestor_0.Autocomplete.AutocompleteText);
local v22 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeEmojis);
local v23 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeCommands);
local v24 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortEmojiResultsCallback);
local v25 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortCommandResultsCallback);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatInput");
local v27 = require(l_script_FirstAncestor_1.UI.AutocompleteDropdown);
local v28 = require(l_Parent_0.NotificationModalsManager);
local v29 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationPropertyIsFocused);
local v30 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommandAutocomplete);
local v32 = game:DefineFastFlag("TriggerEmojiAutocompleteWithTwoCharacters", false);
local v33 = require(l_script_FirstAncestor_0.Flags.getTextChatServiceTextChatCommandAutocompleteVisible);
local l_GetFFlagChatTimeoutModernChatSpecificImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagChatTimeoutModernChatSpecificImpl;
local v35 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatWindowMemoization);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = require(l_Parent_0.SharedFlags).GetFFlagReenableTextChatForTenFootInterfaces;
local v37 = game:DefineFastFlag("ExpChatFixDuplicateOnScreenKeyboard1", false);
local l_ActionBindableEvent_0 = v5.ActionBindableEvent;
local function v42(v39, v40) --[[ Line: 61 ]] --[[ Name: setTransparency ]]
    return v40:map(function(v41) --[[ Line: 62 ]]
        -- upvalues: v39 (copy)
        return v39 + v41 * (1 - v39);
    end);
end;
local function _(v43) --[[ Line: 68 ]] --[[ Name: checkIsTimeoutInEffect ]]
    if v43 and v43.isEnforced then
        local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
        local v45 = math.ceil((v43.endTimestamp - l_UnixTimestamp_0) / 60);
        return v43.isEnforced and v45 > 0, v45;
    else
        return false, 0;
    end;
end;
local v47 = nil;
local v48 = nil;
if v35() then
    v47 = v21.new(v22);
    v48 = v21.new(v23);
end;
local function v215(v49) --[[ Line: 83 ]] --[[ Name: ChatInputBar ]]
    -- upvalues: v4 (copy), v37 (copy), v35 (copy), v47 (ref), v21 (copy), v22 (copy), v48 (ref), v23 (copy), v31 (copy), l_TextChatService_0 (copy), v33 (copy), v14 (copy), l_GetFFlagChatTimeoutModernChatSpecificImpl_0 (copy), v28 (copy), l_Images_0 (copy), v12 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), l_ActionBindableEvent_0 (copy), v29 (copy), l_Players_0 (copy), v25 (copy), v32 (copy), v24 (copy), l_List_0 (copy), v30 (copy), l_autoCastCommand_0 (copy), l_RBXTeamCommand_0 (copy), l_RBXWhisperCommand_0 (copy), v7 (copy), v11 (copy), v13 (copy), v27 (copy), v42 (copy), v20 (copy), l_ImageSetLabel_0 (copy)
    local v50, v51 = v4.useState("");
    local v52, v53 = v4.useState(false);
    local v54, v55 = v4.useState(0);
    local v56, v57 = v4.useBinding(0);
    local v58 = v4.useRef(false);
    local v59 = v4.useRef(nil);
    local v60 = v4.useRef(nil);
    local v61 = v4.useRef(nil);
    local v62 = v4.useRef(nil);
    local v63 = v4.useRef(false);
    local v64, v65 = v4.useState(0);
    local v66 = nil;
    if v37 then
        v66 = v4.useRef(false);
    end;
    if not v35() then
        v47 = v21.new(v22);
        v48 = v21.new(v23);
    end;
    v4.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v31 (ref), l_TextChatService_0 (ref), v48 (ref), v21 (ref), v23 (ref), v33 (ref)
        if v31() then
            l_TextChatService_0.ChildAdded:Connect(function(v67) --[[ Line: 117 ]]
                -- upvalues: v48 (ref), v21 (ref), v23 (ref), v33 (ref)
                if v67.ClassName == "TextChatCommand" and string.sub(v67.PrimaryAlias, 1, 1) == "/" then
                    v48 = v21.new(v23);
                    if v33() then
                        v67:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 122 ]]
                            -- upvalues: v48 (ref), v21 (ref), v23 (ref)
                            v48 = v21.new(v23);
                        end);
                    end;
                end;
            end);
        end;
    end, {});
    local v74 = v4.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v14 (ref), v50 (copy), v58 (copy), v49 (copy), v59 (copy), l_GetFFlagChatTimeoutModernChatSpecificImpl_0 (ref), v28 (ref), l_Images_0 (ref), v51 (copy), v63 (copy)
        v14:trace("onSendActivated with input text: '{}'", v50);
        if not v58.current or not v49.canLocalUserChat then
            v14:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v58.current), v49.canLocalUserChat);
            return;
        else
            if v59.current then
                local l_Text_0 = v59.current.Text;
                if v49.onSendChat and string.find(l_Text_0, "%S") ~= nil then
                    if l_GetFFlagChatTimeoutModernChatSpecificImpl_0() and v49.chatIntervention then
                        local l_timeoutData_0 = v49.chatIntervention.timeoutData;
                        local v70, v71;
                        if l_timeoutData_0 and l_timeoutData_0.isEnforced then
                            local l_UnixTimestamp_1 = DateTime.now().UnixTimestamp;
                            local v73 = math.ceil((l_timeoutData_0.endTimestamp - l_UnixTimestamp_1) / 60);
                            v70 = l_timeoutData_0.isEnforced and v73 > 0;
                            v71 = v73;
                        else
                            v70 = false;
                            v71 = 0;
                        end;
                        if v70 then
                            v28.SetUIBloxToast({
                                iconImage = l_Images_0["icons/status/alert"], 
                                toastTitle = ("You cannot send chats for %* minute(s)"):format(v71), 
                                toastSubtitle = "In the future, please follow the rules and be respectful.", 
                                sequenceNumber = DateTime.now().UnixTimestamp
                            });
                        else
                            v49.onSendChat(l_Text_0);
                        end;
                    else
                        v49.onSendChat(l_Text_0);
                    end;
                else
                    v14:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", l_Text_0, v49.canLocalUserChat);
                end;
                v59.current.Text = "";
                v59.current:ReleaseFocus();
                v51("");
                if v49.targetTextChannel and v49.targetTextChannelDisplayName ~= "" then
                    v63.current = true;
                    return;
                end;
            else
                v14:debug("onSendActivated could not send message because textBoxRef.current was nil");
            end;
            return;
        end;
    end, {
        v50
    });
    local v83 = v4.useCallback(function(v75) --[[ Line: 182 ]]
        -- upvalues: v49 (copy), v59 (copy), v54 (copy), v31 (ref), v51 (copy), v58 (copy), v14 (ref)
        v49.autocompleteDropdownActivated(false);
        v49.autocompleteDropdownResultsChanged({});
        local l_current_0 = v59.current;
        if l_current_0 then
            local l_Text_1 = l_current_0.Text;
            local v78 = string.sub(l_Text_1, 1, v54 - 1);
            local v79 = string.sub(l_Text_1, v54, #l_Text_1);
            local v80 = "";
            if v49.autocompleteDropdownReducer.autocompleteType == "emojis" then
                local l_Text_2 = v75.EmojiLabel.Text;
                v80 = string.gsub(v78, ":[^:]*$", l_Text_2);
            elseif v31() and v49.autocompleteDropdownReducer.autocompleteType == "commands" then
                local l_Text_3 = v75.TextLabel.Text;
                v80 = string.gsub(v78, "(/.*)", l_Text_3);
            end;
            if v79 ~= "" then
                v80 = v80 .. v79;
            end;
            l_current_0.Text = v80;
            v51(v80);
            if v58.current then
                l_current_0:CaptureFocus();
                if v79 ~= "" then
                    l_current_0.CursorPosition = #v80 - #v79 + 1;
                end;
            end;
            v49.autocompleteDropdownDeactivated();
            return;
        else
            v14:error("Could not find textBox");
            return;
        end;
    end);
    v4.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v58 (copy), v59 (copy), v14 (ref)
        if v58.current then
            local l_current_1 = v59.current;
            if l_current_1 then
                l_current_1:CaptureFocus();
                return;
            else
                v14:error("Could not focus chat input bar because textBox not found");
            end;
        end;
    end, {
        v49.shouldFocusChatInputBar
    });
    v4.useEffect(function() --[[ Line: 238 ]]
        -- upvalues: v14 (ref), v58 (copy)
        v14:trace("Mounted");
        v58.current = true;
        return function() --[[ Line: 242 ]]
            -- upvalues: v14 (ref), v58 (ref)
            v14:trace("Unmounting");
            v58.current = false;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 248 ]]
        -- upvalues: v49 (copy), v59 (copy), v55 (copy)
        if v49.autocompleteEnabled then
            local l_current_2 = v59.current;
            if l_current_2 then
                l_current_2:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 252 ]]
                    -- upvalues: l_current_2 (copy), v55 (ref)
                    local l_CursorPosition_0 = l_current_2.CursorPosition;
                    if l_CursorPosition_0 and l_CursorPosition_0 ~= -1 then
                        v55(l_CursorPosition_0);
                    end;
                end);
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 263 ]]
        -- upvalues: v49 (copy), v62 (copy)
        if v49.autocompleteEnabled then
            v62.current = v49.userInputService.InputBegan:connect(function(v87, _) --[[ Line: 265 ]]
                -- upvalues: v49 (ref)
                if v49.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down) then
                    if v87.KeyCode == Enum.KeyCode.Up and v49.autocompleteDropdownReducer.selectedIndex > 1 then
                        v49.autocompleteDropdownSelectionChanged(v49.autocompleteDropdownReducer.selectedIndex - 1);
                    end;
                    if v87.KeyCode == Enum.KeyCode.Down and v49.autocompleteDropdownReducer.selectedIndex < #v49.autocompleteDropdownReducer.results then
                        v49.autocompleteDropdownSelectionChanged(v49.autocompleteDropdownReducer.selectedIndex + 1);
                    end;
                end;
            end);
            return function() --[[ Line: 282 ]]
                -- upvalues: v62 (ref)
                local l_current_3 = v62.current;
                if l_current_3 and l_current_3.Connected then
                    l_current_3:Disconnect();
                end;
                v62.current = nil;
            end;
        else
            return function() --[[ Line: 290 ]]

            end;
        end;
    end, {
        v49.userInputService, 
        v49.autocompleteDropdownReducer
    });
    v4.useEffect(function() --[[ Line: 293 ]]
        -- upvalues: v61 (copy), v49 (copy), v59 (copy), v63 (copy), v14 (ref), v50 (copy)
        v61.current = v49.userInputService.InputEnded:connect(function(v90, _) --[[ Line: 294 ]]
            -- upvalues: v59 (ref), v63 (ref), v49 (ref), v14 (ref), v50 (ref)
            if v59.current and v59.current:IsFocused() and v90.KeyCode == Enum.KeyCode.Backspace then
                if v63.current and not v49.isChannelBarVisible then
                    v49.resetTargetChannel();
                    v14:debug("ChatInputBar ChatInputBarResetTargetChannel()");
                    v63.current = false;
                    return;
                elseif v50 == "" and v49.targetTextChannelDisplayName ~= "" then
                    v63.current = true;
                end;
            end;
        end);
        return function() --[[ Line: 313 ]]
            -- upvalues: v61 (ref)
            local l_current_4 = v61.current;
            if l_current_4 and l_current_4.Connected then
                l_current_4:Disconnect();
            end;
            v61.current = nil;
        end;
    end, {
        v49.userInputService
    });
    v4.useEffect(function() --[[ Line: 323 ]]
        -- upvalues: v49 (copy), v12 (ref), v59 (copy), v37 (ref), v66 (ref)
        local function v97(_, v94, v95) --[[ Line: 324 ]] --[[ Name: handleAction ]]
            -- upvalues: v49 (ref), v12 (ref), v59 (ref), v37 (ref), v66 (ref)
            if v49.isChatHotkeyEnabled and (v95.KeyCode == v12.ChatInputBarDefaultFocusKeyCode or v95.KeyCode == v49.devDefinedFocusKeyCode) then
                local l_current_5 = v59.current;
                if l_current_5 and v94 == Enum.UserInputState.Begin and l_current_5 and not l_current_5:IsFocused() then
                    task.delay(0, function() --[[ Line: 341 ]]
                        -- upvalues: l_current_5 (copy)
                        l_current_5:CaptureFocus();
                    end);
                    v49.focusChatHotKeyActivated();
                    if v37 then
                        v66.current = true;
                    end;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end;
        v49.contextActionService:BindCoreAction("FocusChat", v97, false, Enum.UserInputType.Keyboard);
        return function() --[[ Line: 367 ]]
            -- upvalues: v49 (ref)
            v49.contextActionService:UnbindCoreAction("FocusChat");
        end;
    end, if v37 then {
        v49.isChatHotkeyEnabled, 
        v49.devDefinedFocusKeyCode, 
        v66.current
    } else {
        v49.isChatHotkeyEnabled, 
        v49.devDefinedFocusKeyCode
    });
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        v4.useEffect(function() --[[ Line: 377 ]]
            -- upvalues: v59 (copy), l_ActionBindableEvent_0 (ref)
            local function v100(v98) --[[ Line: 378 ]]
                -- upvalues: v59 (ref)
                if v98.type == "ChatTopBarFocusActivated" then
                    local l_current_6 = v59.current;
                    if l_current_6 then
                        task.delay(0, function() --[[ Line: 382 ]]
                            -- upvalues: l_current_6 (copy)
                            l_current_6:CaptureFocus();
                        end);
                    end;
                end;
            end;
            local v101 = l_ActionBindableEvent_0.Event:Connect(v100);
            return function() --[[ Line: 391 ]]
                -- upvalues: v101 (copy)
                v101:disconnect();
            end;
        end, {
            v59.current
        });
    end;
    local function _(v102) --[[ Line: 397 ]]
        -- upvalues: l_TextChatService_0 (ref), v29 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_0 and v29() then
            l_ChatInputBarConfiguration_0.IsFocusedWrite = v102;
        end;
    end;
    local v106 = v4.useCallback(function() --[[ Line: 404 ]]
        -- upvalues: v53 (copy), v49 (copy), l_TextChatService_0 (ref), v29 (ref)
        v53(true);
        v49.onFocus();
        local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_1 and v29() then
            l_ChatInputBarConfiguration_1.IsFocusedWrite = true;
        end;
    end, {
        v49.onFocus
    });
    local v125 = v4.useCallback(function(_, v108, v109) --[[ Line: 410 ]]
        -- upvalues: v14 (ref), v60 (copy), v49 (copy), v83 (copy), v74 (copy), v58 (copy), v59 (copy), v54 (copy), v53 (copy), l_TextChatService_0 (ref), v29 (ref), v37 (ref), v66 (ref), l_Players_0 (ref)
        v14:debug("Focus lost with enter: {}", (tostring(v108)));
        local l_current_7 = v60.current;
        if v108 then
            if v49.autocompleteEnabled and l_current_7 and v49.autocompleteDropdownReducer.activated and #v49.autocompleteDropdownReducer.results > 0 then
                local l_OffsetFrame_0 = l_current_7.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                for _, v113 in ipairs(l_OffsetFrame_0:GetChildren()) do
                    if v113.ClassName == "Frame" and v113.LayoutOrder == v49.autocompleteDropdownReducer.selectedIndex then
                        v83(v113.TextLabelButton);
                        return;
                    end;
                end;
            else
                v74();
            end;
        end;
        if v58.current then
            if v49.autocompleteEnabled and l_current_7 and v49.autocompleteDropdownReducer.activated then
                if v109.KeyCode == Enum.KeyCode.Escape then
                    v49.autocompleteDropdownActivated(false);
                    local l_current_8 = v59.current;
                    if l_current_8 then
                        local l_v54_0 = v54;
                        l_current_8:CaptureFocus();
                        l_current_8.CursorPosition = l_v54_0;
                        return;
                    else
                        v14:error("Could not focus chat input bar because textBox not found");
                    end;
                else
                    local l_X_0 = v109.Position.X;
                    local l_Y_0 = v109.Position.Y;
                    local l_X_1 = l_current_7.AbsolutePosition.X;
                    local v119 = l_X_1 + l_current_7.AbsoluteSize.X;
                    local l_Y_1 = l_current_7.AbsolutePosition.Y;
                    local v121 = l_Y_1 + l_current_7.AbsoluteSize.Y;
                    if l_X_0 < l_X_1 or v119 < l_X_0 or l_Y_0 < l_Y_1 or v121 < l_Y_0 then
                        v49.autocompleteDropdownActivated(false);
                    end;
                end;
            else
                v53(false);
            end;
        end;
        v49.onUnfocus();
        local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_2 and v29() then
            l_ChatInputBarConfiguration_2.IsFocusedWrite = false;
        end;
        if v37 then
            if v66.current then
                l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
                if l_ChatInputBarConfiguration_2 then
                    local l_TextBox_0 = Instance.new("TextBox");
                    l_TextBox_0.Visible = false;
                    l_TextBox_0.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
                    l_TextBox_0:CaptureFocus();
                    l_TextBox_0:ReleaseFocus();
                    l_TextBox_0:Destroy();
                end;
                v66.current = false;
                return;
            end;
        else
            l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
            if l_ChatInputBarConfiguration_2 then
                local l_TextBox_1 = Instance.new("TextBox");
                l_TextBox_1.Visible = false;
                l_TextBox_1.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
                l_TextBox_1:CaptureFocus();
                l_TextBox_1:ReleaseFocus();
                l_TextBox_1:Destroy();
            end;
        end;
    end);
    local function v147(v126, v127, v128) --[[ Line: 512 ]] --[[ Name: handleAutocomplete ]]
        -- upvalues: v31 (ref), v49 (copy), v48 (ref), v25 (ref), v32 (ref), v47 (ref), v24 (ref), v64 (copy), l_List_0 (ref), v51 (copy), v60 (copy), v83 (copy), v65 (copy)
        if v31() and (v128 == "/" and v126.CursorPosition == 2 or v49.autocompleteDropdownReducer.autocompleteType == "commands" and v128 ~= ":") then
            v49.autocompleteDropdownTypeChanged("commands");
            v49.autocompleteDropdownActivated(true);
            if v128 ~= "" and v128 ~= " " then
                local v129 = string.sub(v127, 1, v126.CursorPosition - 1):lower();
                local v130 = v48:getResults(v129, v25);
                v49.autocompleteDropdownResultsChanged(v130);
                if v129 == v130[1] then
                    v49.autocompleteDropdownActivated(false);
                    v49.autocompleteDropdownResultsChanged({});
                    return;
                end;
            else
                v49.autocompleteDropdownDeactivated();
            end;
            return;
        elseif (v49.autocompleteDropdownReducer.activated or #v49.autocompleteDropdownReducer.results > 0) and v49.autocompleteDropdownReducer.autocompleteType == "emojis" then
            v49.autocompleteDropdownActivated(true);
            local v131 = string.sub(v127, 1, v126.CursorPosition - 1);
            local v132 = string.find(v131, ":[^:]*$");
            if v128 ~= "" and v128 ~= ":" and v128 ~= " " and v132 then
                if v32 then
                    local v133 = string.sub(v127, v132 + 1, v126.CursorPosition - 1):lower();
                    local v134 = {};
                    if v133 and string.len(v133) > 1 then
                        v134 = v47:getResults(v133, v24);
                    end;
                    v49.autocompleteDropdownResultsChanged(v134);
                    return;
                else
                    local v135 = string.sub(v127, v132 + 1, v126.CursorPosition - 1):lower();
                    local v136 = v47:getResults(v135, v24);
                    v49.autocompleteDropdownResultsChanged(v136);
                    return;
                end;
            elseif v128 == ":" then
                if v132 ~= v64 then
                    local v137 = string.sub(v127, v64 + 1, v126.CursorPosition - 2):lower();
                    if l_List_0.includes(v49.autocompleteDropdownReducer.results, v137) then
                        local v138 = string.sub(v127, v126.CursorPosition, #v127);
                        local v139 = string.sub(v127, 1, v126.CursorPosition - 2) .. v138;
                        v126.Text = v139;
                        v51(v139);
                        v126.CursorPosition = v126.CursorPosition - 1;
                        local l_current_9 = v60.current;
                        if l_current_9 then
                            local l_OffsetFrame_1 = l_current_9.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                            for _, v143 in ipairs(l_OffsetFrame_1:GetChildren()) do
                                if v143.ClassName == "Frame" then
                                    local l_TextLabelButton_0 = v143:FindFirstChild("TextLabelButton");
                                    if l_TextLabelButton_0 then
                                        local l_TextLabel_0 = l_TextLabelButton_0:FindFirstChild("TextLabel");
                                        if l_TextLabel_0 and l_TextLabel_0.Text and l_TextLabel_0.Text == v137 then
                                            v83(l_TextLabelButton_0);
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    else
                        v49.autocompleteDropdownActivated(false);
                        v49.autocompleteDropdownResultsChanged({});
                    end;
                    return;
                else
                    v49.autocompleteDropdownResultsChanged({});
                    return;
                end;
            elseif v128 == " " then
                v49.autocompleteDropdownActivated(false);
                v49.autocompleteDropdownResultsChanged({});
                return;
            else
                v49.autocompleteDropdownDeactivated();
                v65(0);
                return;
            end;
        else
            local v146 = string.find(v127, ":[^:]*$");
            if v128 == ":" then
                v49.autocompleteDropdownTypeChanged("emojis");
                v49.autocompleteDropdownActivated(true);
                v49.autocompleteDropdownResultsChanged({});
                v65(v146);
            end;
            return;
        end;
    end;
    local v158 = v4.useCallback(function(v148) --[[ Line: 629 ]]
        -- upvalues: v49 (copy), v51 (copy), v14 (ref), v50 (copy), v30 (ref), v147 (copy), v63 (copy), l_autoCastCommand_0 (ref), l_RBXTeamCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v7 (ref)
        local l_Text_4 = v148.Text;
        if v49.autocompleteEnabled then
            local v150 = string.find(l_Text_4, "\r");
            local v151 = v148.CursorPosition < #l_Text_4 + 1;
            if v150 then
                local v152 = string.gsub(l_Text_4, "\r", "");
                v148.Text = v152;
                v51(v152);
                if v151 then
                    v148.CursorPosition = v148.CursorPosition - 1;
                end;
                return;
            end;
        end;
        local v153 = string.sub(l_Text_4, v148.CursorPosition - 1, v148.CursorPosition - 1);
        v14:trace("Input: {}", l_Text_4);
        local v154 = if utf8.len(l_Text_4) then utf8.len(utf8.nfcnormalize(l_Text_4)) else string.len(l_Text_4);
        if v154 and v49.messageCharacterLimit < v154 then
            v14:debug("Message is over the character limit of {}", (tostring(v49.messageCharacterLimit)));
            v148.Text = v50;
            return;
        else
            v51(l_Text_4);
            if v30() and v49.autocompleteEnabled then
                v147(v148, l_Text_4, v153);
            end;
            local l_v63_0 = v63;
            local v156 = false;
            if #l_Text_4 == 0 then
                v156 = v63.current;
            end;
            l_v63_0.current = v156;
            if v49.localPlayer then
                l_v63_0 = v49.localPlayer.UserId;
                v156 = {
                    l_autoCastCommand_0(l_RBXTeamCommand_0, l_v63_0, l_Text_4), 
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v63_0, l_Text_4)
                };
                v7.any(v156):andThen(function() --[[ Line: 674 ]]
                    -- upvalues: v148 (copy), v51 (ref), v63 (ref)
                    v148.Text = "";
                    v51("");
                    v63.current = true;
                end):catch(function(v157) --[[ Line: 681 ]]
                    -- upvalues: v14 (ref)
                    v14:trace("Could not send autoCastCommand. Error: {}", v157);
                end);
            end;
            return;
        end;
    end);
    local v159 = nil;
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        v159 = v4.useCallback(function() --[[ Line: 689 ]]
            -- upvalues: v59 (copy)
            local l_current_10 = v59.current;
            if l_current_10 then
                l_current_10:ReleaseFocus(true);
            end;
        end, {
            v59.current
        });
    end;
    local v162 = v4.useCallback(function(v161) --[[ Line: 697 ]]
        -- upvalues: v57 (copy)
        v57(v161.Visible and v161.AbsoluteSize.X or 0);
    end);
    local v164 = v4.useCallback(function(v163) --[[ Line: 702 ]]
        -- upvalues: v49 (copy)
        v49.autocompleteDropdownSelectionChanged(v163.LayoutOrder);
    end);
    local v165 = v50 == "";
    local v166 = v165 and not v52;
    local l_chatInputBarSettings_0 = v49.chatInputBarSettings;
    local l_chatWindowSettings_0 = v49.chatWindowSettings;
    local l_BackgroundTransparency_0 = v11(l_chatInputBarSettings_0).BackgroundTransparency;
    local l_BackgroundTransparency_1 = v11(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v11(l_chatWindowSettings_0).BackgroundColor3;
    local v172 = v4.useContext(v13);
    local l_createElement_0 = v4.createElement;
    local v174 = "Frame";
    local v180 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v49.transparencyValue:map(function(v175) --[[ Line: 62 ]]
            -- upvalues: l_BackgroundTransparency_1 (copy)
            return l_BackgroundTransparency_1 + v175 * (1 - l_BackgroundTransparency_1);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v49.LayoutOrder, 
        Size = v49.size, 
        Visible = v49.visible, 
        ZIndex = 2, 
        [v4.Event.MouseEnter] = v49.onHovered, 
        [v4.Event.MouseLeave] = v49.onUnhovered, 
        [v4.Change.AbsoluteSize] = v4.useCallback(function(v176) --[[ Line: 728 ]]
            -- upvalues: l_TextChatService_0 (ref), v49 (copy)
            local l_ChatInputBarConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_3 and v49.onAbsoluteSizeChanged then
                v49.onAbsoluteSizeChanged(v176, l_ChatInputBarConfiguration_3);
            end;
        end), 
        [v4.Change.AbsolutePosition] = v4.useCallback(function(v178) --[[ Line: 734 ]]
            -- upvalues: l_TextChatService_0 (ref), v49 (copy)
            local l_ChatInputBarConfiguration_4 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_4 and v49.onAbsolutePositionChanged then
                v49.onAbsolutePositionChanged(v178, l_ChatInputBarConfiguration_4);
            end;
        end)
    };
    local v181 = {
        AutocompleteDropdown = v30() and v49.autocompleteEnabled and v4.createElement(v27, {
            chatInputBarSettings = l_chatInputBarSettings_0, 
            chatWindowSettings = l_chatWindowSettings_0, 
            setTransparency = v42, 
            transparencyValue = v49.transparencyValue, 
            activated = v49.autocompleteDropdownReducer.activated and v52, 
            results = v49.autocompleteDropdownReducer.results, 
            selectedIndex = v49.autocompleteDropdownReducer.selectedIndex, 
            autocompleteType = v49.autocompleteDropdownReducer.autocompleteType, 
            onAutocompleteDropdownHover = v164, 
            onAutocompleteSelected = v83, 
            autocompleteDropdownRef = v60, 
            textBoxRef = v59
        }) or nil, 
        UISizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v12.ChatWindowMaxWidth, 1e999)
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = v49.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v4.createElement;
    local v183 = "Frame";
    local v185 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_chatInputBarSettings_0.BackgroundColor3, 
        BackgroundTransparency = v49.transparencyValue:map(function(v184) --[[ Line: 62 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            return l_BackgroundTransparency_0 + v184 * (1 - l_BackgroundTransparency_0);
        end), 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v186 = {};
    local l_createElement_2 = v4.createElement;
    local v188 = "UIStroke";
    local v189 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = v12.ChatInputBarBorderColor3
    };
    local l_ChatInputBarBorderTransparency_0 = v12.ChatInputBarBorderTransparency;
    local l_l_ChatInputBarBorderTransparency_0_0 = l_ChatInputBarBorderTransparency_0 --[[ copy: 48 -> 61 ]];
    v189.Transparency = v49.transparencyValue:map(function(v192) --[[ Line: 62 ]]
        -- upvalues: l_l_ChatInputBarBorderTransparency_0_0 (copy)
        return l_l_ChatInputBarBorderTransparency_0_0 + v192 * (1 - l_l_ChatInputBarBorderTransparency_0_0);
    end);
    v186.Border = l_createElement_2(v188, v189);
    v186.Corner = v4.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    });
    l_createElement_2 = v4.createElement;
    v188 = "Frame";
    v189 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v193 = {};
    l_ChatInputBarBorderTransparency_0 = v4.createElement;
    local v194 = "Frame";
    local v195 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -v49.sendButtonContainerWidth, 0, 0)
    };
    local v196 = {};
    local l_createElement_3 = v4.createElement;
    local l_v20_0 = v20;
    local v199 = {};
    local l_transparencyValue_0 = v49.transparencyValue;
    local v201 = 0;
    local l_v201_0 = v201 --[[ copy: 60 -> 62 ]];
    v199.transparency = l_transparencyValue_0:map(function(v203) --[[ Line: 62 ]]
        -- upvalues: l_v201_0 (copy)
        return l_v201_0 + v203 * (1 - l_v201_0);
    end);
    v199.onAbsoluteSizeChanged = v162;
    v199.onChannelChipActivated = v49.resetTargetChannel;
    v199.targetTextChannelDisplayName = v49.targetTextChannelDisplayName or "";
    v199.isChannelBarVisible = v49.isChannelBarVisible;
    v196.TargetChannelChip = l_createElement_3(l_v20_0, v199);
    l_createElement_3 = not v49.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v4.createElement;
        l_v20_0 = "TextLabel";
        v199 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v12.ChatInputBarFont, 
            Text = v49.disabledChatPlaceholderText, 
            Position = UDim2.fromScale(1, 0), 
            Size = v56:map(function(v204) --[[ Line: 805 ]]
                return UDim2.new(1, -(v204 + 8), 0, 0);
            end), 
            TextColor3 = v166 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3, 
            TextSize = if v172.isSpatialUIEnabled then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
        };
        l_transparencyValue_0 = v166 and 0.5 or 0;
        local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 56 -> 64 ]];
        v199.TextTransparency = v49.transparencyValue:map(function(v206) --[[ Line: 62 ]]
            -- upvalues: l_l_transparencyValue_0_0 (copy)
            return l_l_transparencyValue_0_0 + v206 * (1 - l_l_transparencyValue_0_0);
        end);
        v199.TextWrapped = true;
        v199.TextXAlignment = Enum.TextXAlignment.Left;
        v199.TextYAlignment = Enum.TextYAlignment.Top;
        l_createElement_3 = l_createElement_3(l_v20_0, v199);
    end;
    v196.DisabledPlaceholderLabel = l_createElement_3;
    l_createElement_3 = v49.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v4.createElement;
        l_v20_0 = "Frame";
        v199 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = v56:map(function(v207) --[[ Line: 828 ]]
                return UDim2.new(1, -(v207 + 8), 0, 0);
            end)
        };
        local v208 = {};
        l_transparencyValue_0 = v49.canLocalUserChat;
        if l_transparencyValue_0 then
            l_transparencyValue_0 = v4.createElement;
            local v209 = "TextBox";
            local v210 = {
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                FontFace = l_chatInputBarSettings_0.FontFace, 
                PlaceholderText = v166 and v49.placeholderText or "", 
                Size = UDim2.fromScale(1, 0), 
                Text = "", 
                PlaceholderColor3 = l_chatInputBarSettings_0.PlaceholderColor3, 
                TextColor3 = l_chatInputBarSettings_0.TextColor3, 
                TextSize = if v172.isSpatialUIEnabled then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
            };
            v201 = v166 and 0.5 or 0;
            local l_v201_1 = v201 --[[ copy: 60 -> 63 ]];
            v210.TextTransparency = v49.transparencyValue:map(function(v212) --[[ Line: 62 ]]
                -- upvalues: l_v201_1 (copy)
                return l_v201_1 + v212 * (1 - l_v201_1);
            end);
            v201 = l_chatInputBarSettings_0.TextStrokeTransparency;
            v210.TextStrokeTransparency = v49.transparencyValue:map(function(v213) --[[ Line: 62 ]]
                -- upvalues: v201 (copy)
                return v201 + v213 * (1 - v201);
            end);
            v210.TextStrokeColor3 = l_chatInputBarSettings_0.TextStrokeColor3;
            v210.TextWrapped = true;
            v210.TextXAlignment = Enum.TextXAlignment.Left;
            v210.TextYAlignment = Enum.TextYAlignment.Top;
            v210.ZIndex = 2;
            v210[v4.Event.Focused] = v106;
            v210[v4.Event.FocusLost] = v125;
            v210[v4.Change.Text] = v158;
            v210[v4.Event.ReturnPressedFromOnScreenKeyboard] = v159;
            v210.ref = v59;
            l_transparencyValue_0 = l_transparencyValue_0(v209, v210);
        end;
        v208.TextBox = l_transparencyValue_0;
        l_createElement_3 = l_createElement_3(l_v20_0, v199, v208);
    end;
    v196.TextBoxContainer = l_createElement_3;
    v196.UIPadding = v4.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10), 
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10)
    });
    v193.TextContainer = l_ChatInputBarBorderTransparency_0(v194, v195, v196);
    l_ChatInputBarBorderTransparency_0 = v4.createElement;
    v194 = "TextButton";
    v195 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, v49.sendButtonContainerWidth, 1, 0), 
        Text = "", 
        [v4.Event.Activated] = v74
    };
    v196 = {
        Layout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    l_createElement_3 = v4.createElement;
    l_v20_0 = l_ImageSetLabel_0;
    v199 = {
        BackgroundTransparency = 1, 
        ImageColor3 = v165 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3
    };
    l_transparencyValue_0 = v165 and 0.5 or 0;
    v199.ImageTransparency = v49.transparencyValue:map(function(v214) --[[ Line: 62 ]]
        -- upvalues: l_transparencyValue_0 (copy)
        return l_transparencyValue_0 + v214 * (1 - l_transparencyValue_0);
    end);
    v199.Image = l_Images_0["icons/actions/send"];
    v199.Size = UDim2.new(0, 30, 0, 30);
    v199.ZIndex = 2;
    v196.SendIcon = l_createElement_3(l_v20_0, v199);
    v193.SendButton = l_ChatInputBarBorderTransparency_0(v194, v195, v196);
    v186.Container = l_createElement_2(v188, v189, v193);
    v181.Background = l_createElement_1(v183, v185, v186);
    return l_createElement_0(v174, v180, v181);
end;
local v222 = v18.connect(function(v216) --[[ Line: 907 ]]
    -- upvalues: v19 (copy)
    local v217 = nil;
    if v216.targetTextChannel then
        local v218 = {
            RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText", 
            RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
        };
        for v219, v220 in pairs(v218) do
            if string.match(v216.targetTextChannel.Name, v219) then
                if v219 == "RBXWhisper" then
                    local v221 = v19(v216.targetTextChannel, v216.localPlayer);
                    if v221 then
                        v217 = {
                            v220, 
                            {
                                RBX_NAME = v221
                            }
                        };
                    end;
                else
                    v217 = v220;
                end;
            end;
        end;
    end;
    return {
        targetTextChannelDisplayName = v217
    };
end)(v215);
return if v35() then v4.memo(v222) else v222;