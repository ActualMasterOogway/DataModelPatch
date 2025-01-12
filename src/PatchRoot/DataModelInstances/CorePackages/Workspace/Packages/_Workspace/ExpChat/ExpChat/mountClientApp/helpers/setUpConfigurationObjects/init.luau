local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v4 = require(l_script_FirstAncestor_0.Parent.ExpChatShared);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v6 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v7 = require(l_Flags_0.getTextChatServicePropertyTextBox);
local l_Analytics_0 = v4.Analytics;
local v9 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v11 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v12 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v13 = require(l_Actions_0.ChatWindowConfigurationEnabled);
local v14 = require(l_Actions_0.ChannelTabsConfigurationEnabled);
local l_TargetTextChannelPropertyChanged_0 = v4.Actions.TargetTextChannelPropertyChanged;
local v16 = require(l_Actions_0.BubbleChatSettingsChanged);
local v17 = require(l_Actions_0.ChatLayoutVerticalAlignmentChanged);
local v18 = require(l_Actions_0.ChatLayoutHorizontalAlignmentChanged);
local v19 = require(l_Actions_0.ChatWindowSettingsChanged);
local v20 = require(l_Actions_0.ChatInputBarSettingsChanged);
local v21 = require(l_Actions_0.ChannelTabsSettingsChanged);
local v22 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v23 = require(script.Parent.setUpBubbleChatConfigurationChildren);
local v24 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationPropertyKeyboardKeyCode);
local v25 = require(l_script_FirstAncestor_0.Flags.getEnableBubbleChatConfigurationMaxBubbles);
local v26 = require(l_script_FirstAncestor_0.Flags.getEnableBubbleChatConfigurationTailVisible);
local v27 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagReenableTextChatForTenFootInterfaces;
local function _(v30) --[[ Line: 44 ]] --[[ Name: isKeyboardKeyCodeSanitized ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v30);
    if l_l_UserInputService_0_StringForKeyCode_0 == nil or l_l_UserInputService_0_StringForKeyCode_0 == "" then
        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v30));
        return false;
    else
        return true;
    end;
end;
local function v39(v33, v34) --[[ Line: 57 ]] --[[ Name: shouldReorderTabs ]]
    -- upvalues: l_TextChatService_0 (copy), v9 (copy)
    if v34 == nil or v33[v34.Name] == nil then
        return false;
    else
        local v35 = 0;
        for _ in pairs(v33) do
            v35 = v35 + 1;
        end;
        local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        if not l_ChannelTabsConfiguration_0 then
            return false;
        else
            local l_X_0 = l_ChannelTabsConfiguration_0.AbsoluteSize.X;
            return (not (l_X_0 < v35 * v9.ChannelTabsSettings.MinTabWidth) and v35 or math.floor((l_X_0 - v9.ChannelTabsSettings.DropdownIconContainerWidth) / v9.ChannelTabsSettings.MinTabWidth)) < v33[v34.Name].TabIndex;
        end;
    end;
end;
return function(v40, v41) --[[ Line: 83 ]]
    -- upvalues: l_Analytics_0 (copy), l_TextChatService_0 (copy), v12 (copy), v28 (copy), v39 (copy), l_TargetTextChannelPropertyChanged_0 (copy), v7 (copy), v22 (copy), v6 (copy), v24 (copy), v27 (copy), l_UserInputService_0 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), l_GuiService_0 (copy), v20 (copy), v13 (copy), v18 (copy), v17 (copy), v19 (copy), v25 (copy), v26 (copy), v16 (copy), v23 (copy), v14 (copy), v21 (copy), v11 (copy)
    if v41.analytics then
        l_Analytics_0.with(v41.analytics);
    end;
    local function v46(v42, v43, v44) --[[ Line: 88 ]]
        -- upvalues: l_Analytics_0 (ref)
        local v45 = nil;
        if type(v44) == "number" or type(v44) == "boolean" or typeof(v44) == "EnumItem" then
            v45 = tostring(v44);
        elseif typeof(v44) == "Color3" then
            v45 = v44:ToHex();
        elseif typeof(v44) == "Font" then
            v45 = tostring((string.gsub(v44.Family, "rbxasset://fonts/families/", ""))) .. " " .. tostring(v44.Weight) .. " " .. tostring(v44.Style);
        else
            return;
        end;
        assert(v45, "should exist");
        l_Analytics_0.FireClientAnalyticsWithEventName(v42, {
            [v43] = v45
        });
    end;
    local function v63() --[[ Line: 107 ]]
        -- upvalues: l_TextChatService_0 (ref), v40 (copy), v12 (ref), v28 (ref), v39 (ref), l_TargetTextChannelPropertyChanged_0 (ref), v41 (copy), v7 (ref), v22 (ref), v6 (ref), v24 (ref), v27 (ref), l_UserInputService_0 (ref), v46 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (ref), l_GuiService_0 (ref), v20 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        local v48 = {};
        if l_ChatInputBarConfiguration_0 then
            v40:dispatch(v12(l_ChatInputBarConfiguration_0.Enabled));
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 112 ]]
                -- upvalues: v40 (ref), v12 (ref), l_ChatInputBarConfiguration_0 (copy)
                v40:dispatch(v12(l_ChatInputBarConfiguration_0.Enabled));
            end);
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TargetTextChannel"):Connect(function() --[[ Line: 116 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy), v28 (ref), v39 (ref), v40 (ref), l_TargetTextChannelPropertyChanged_0 (ref)
                local l_TargetTextChannel_0 = l_ChatInputBarConfiguration_0.TargetTextChannel;
                local v50 = if v28() then v39(v40:getState().ChannelTabs.allChannelTabs, l_TargetTextChannel_0) else false;
                v40:dispatch(l_TargetTextChannelPropertyChanged_0(l_TargetTextChannel_0, v50));
            end);
            if v41.defaultTargetTextChannel then
                l_ChatInputBarConfiguration_0.TargetTextChannel = v41.defaultTargetTextChannel;
            end;
            if v7() then
                v40:dispatch(v22(l_ChatInputBarConfiguration_0.TextBox ~= nil));
                l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TextBox"):Connect(function() --[[ Line: 130 ]]
                    -- upvalues: v40 (ref), v22 (ref), l_ChatInputBarConfiguration_0 (copy)
                    v40:dispatch(v22(l_ChatInputBarConfiguration_0.TextBox ~= nil));
                end);
            end;
            v40.changed:connect(function(v51, v52) --[[ Line: 136 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy)
                if v51.TextChannels ~= v52.TextChannels and v51.TextChannels.targetTextChannel ~= v52.TextChannels.targetTextChannel then
                    l_ChatInputBarConfiguration_0.TargetTextChannel = v51.TextChannels.targetTextChannel;
                end;
            end);
            if v6() then
                local v53 = {
                    "BackgroundTransparency", 
                    "BackgroundColor3", 
                    "TextSize", 
                    "TextColor3", 
                    "TextStrokeColor3", 
                    "TextStrokeTransparency", 
                    "FontFace", 
                    "PlaceholderColor3"
                };
                if v24() then
                    table.insert(v53, "KeyboardKeyCode");
                end;
                if v27() and l_ChatInputBarConfiguration_0.AutocompleteEnabled ~= nil then
                    table.insert(v53, "AutocompleteEnabled");
                end;
                for _, v55 in ipairs(v53) do
                    if l_ChatInputBarConfiguration_0[v55] then
                        local v56 = l_ChatInputBarConfiguration_0[v55];
                        if v24() and v55 == "KeyboardKeyCode" then
                            local l_l_UserInputService_0_StringForKeyCode_1 = l_UserInputService_0:GetStringForKeyCode(v56);
                            local v58;
                            if l_l_UserInputService_0_StringForKeyCode_1 == nil or l_l_UserInputService_0_StringForKeyCode_1 == "" then
                                warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v56));
                                v58 = false;
                            else
                                v58 = true;
                            end;
                            if not v58 then
                                l_ChatInputBarConfiguration_0.KeyboardKeyCode = Enum.KeyCode.Slash;
                                v48[v55] = Enum.KeyCode.Slash;
                                continue;
                            end;
                        end;
                        v48[v55] = v56;
                        v46("ChatInputBarConfigurationLoaded", v55, v56);
                    end;
                end;
                if l_GetFFlagReenableTextChatForTenFootInterfaces_0() and l_GuiService_0:IsTenFootInterface() then
                    v48.TextSize = v48.TextSize * 1.5;
                end;
                l_ChatInputBarConfiguration_0.Changed:Connect(function(v59) --[[ Line: 195 ]]
                    -- upvalues: l_ChatInputBarConfiguration_0 (copy), v24 (ref), l_UserInputService_0 (ref), v40 (ref), v20 (ref), v46 (ref)
                    local v60 = l_ChatInputBarConfiguration_0[v59];
                    if v24() and v59 == "KeyboardKeyCode" then
                        local l_l_UserInputService_0_StringForKeyCode_2 = l_UserInputService_0:GetStringForKeyCode(v60);
                        local v62;
                        if l_l_UserInputService_0_StringForKeyCode_2 == nil or l_l_UserInputService_0_StringForKeyCode_2 == "" then
                            warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v60));
                            v62 = false;
                        else
                            v62 = true;
                        end;
                        if not v62 then
                            l_ChatInputBarConfiguration_0.KeyboardKeyCode = v40:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode;
                            return;
                        end;
                    end;
                    v40:dispatch(v20(v59, v60));
                    v46("ChatInputBarConfigurationChanged", v59, v60);
                end);
            end;
            return v48;
        else
            return {};
        end;
    end;
    local function v71() --[[ Line: 219 ]]
        -- upvalues: l_TextChatService_0 (ref), v40 (copy), v13 (ref), v18 (ref), v17 (ref), v46 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (ref), l_GuiService_0 (ref), v19 (ref)
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        local v65 = {};
        if l_ChatWindowConfiguration_0 then
            v40:dispatch(v13(l_ChatWindowConfiguration_0.Enabled));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 225 ]]
                -- upvalues: v40 (ref), v13 (ref), l_ChatWindowConfiguration_0 (copy)
                v40:dispatch(v13(l_ChatWindowConfiguration_0.Enabled));
            end);
            v40:dispatch(v18(l_ChatWindowConfiguration_0.HorizontalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function() --[[ Line: 230 ]]
                -- upvalues: v40 (ref), v18 (ref), l_ChatWindowConfiguration_0 (copy)
                v40:dispatch(v18(l_ChatWindowConfiguration_0.HorizontalAlignment));
            end);
            v40:dispatch(v17(l_ChatWindowConfiguration_0.VerticalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("VerticalAlignment"):Connect(function() --[[ Line: 235 ]]
                -- upvalues: v40 (ref), v17 (ref), l_ChatWindowConfiguration_0 (copy)
                v40:dispatch(v17(l_ChatWindowConfiguration_0.VerticalAlignment));
            end);
            for _, v67 in ipairs({
                "BackgroundColor3", 
                "BackgroundTransparency", 
                "FontFace", 
                "TextColor3", 
                "TextSize", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "HeightScale", 
                "WidthScale", 
                "HorizontalAlignment", 
                "VerticalAlignment"
            }) do
                if l_ChatWindowConfiguration_0[v67] then
                    local v68 = l_ChatWindowConfiguration_0[v67];
                    v65[v67] = v68;
                    v46("ChatWindowConfigurationLoaded", v67, v68);
                end;
            end;
            if l_GetFFlagReenableTextChatForTenFootInterfaces_0() and l_GuiService_0:IsTenFootInterface() then
                v65.TextSize = v65.TextSize * 1.5;
            end;
            l_ChatWindowConfiguration_0.Changed:Connect(function(v69) --[[ Line: 272 ]]
                -- upvalues: l_ChatWindowConfiguration_0 (copy), v40 (ref), v19 (ref), v46 (ref)
                local v70 = l_ChatWindowConfiguration_0[v69];
                v40:dispatch(v19(v69, v70));
                v46("ChatWindowConfigurationChanged", v69, v70);
            end);
            return v65;
        else
            return {};
        end;
    end;
    local function v83() --[[ Line: 285 ]]
        -- upvalues: l_TextChatService_0 (ref), v6 (ref), v25 (ref), v26 (ref), v46 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (ref), l_GuiService_0 (ref), v40 (copy), v16 (ref), v23 (ref)
        local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
        local v73 = {};
        if l_BubbleChatConfiguration_0 then
            local v74 = {
                "Enabled", 
                "AdorneeName", 
                "BubbleDuration", 
                "BubblesSpacing", 
                "VerticalStudsOffset", 
                "LocalPlayerStudsOffset", 
                "MinimizeDistance", 
                "MaxDistance", 
                "BackgroundColor3", 
                "TextColor3", 
                "TextSize", 
                "FontFace"
            };
            if v6() then
                table.insert(v74, "BackgroundTransparency");
            end;
            if v25() then
                table.insert(v74, "MaxBubbles");
            end;
            if v26() then
                table.insert(v74, "TailVisible");
            end;
            for _, v76 in ipairs(v74) do
                if l_BubbleChatConfiguration_0[v76] then
                    local v77 = l_BubbleChatConfiguration_0[v76];
                    v73[v76] = v77;
                    v46("BubbleChatConfigurationLoaded", v76, v77);
                end;
            end;
            if l_GetFFlagReenableTextChatForTenFootInterfaces_0() and l_GuiService_0:IsTenFootInterface() then
                v73.TextSize = v73.TextSize * 1.5;
            end;
            l_BubbleChatConfiguration_0.Changed:Connect(function(v78) --[[ Line: 335 ]]
                -- upvalues: l_BubbleChatConfiguration_0 (copy), v40 (ref), v16 (ref), v46 (ref)
                local v79 = l_BubbleChatConfiguration_0[v78];
                v40:dispatch(v16(v78, v79));
                v46("BubbleChatConfigurationChanged", v78, v79);
            end);
            local v80 = v23(v40);
            for v81, v82 in pairs(v80) do
                if v82 then
                    v73[v81] = v80[v81];
                end;
            end;
            return v73;
        else
            return {};
        end;
    end;
    local function v91() --[[ Line: 355 ]]
        -- upvalues: l_TextChatService_0 (ref), v40 (copy), v14 (ref), v46 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (ref), l_GuiService_0 (ref), v21 (ref)
        local l_ChannelTabsConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        local v85 = {};
        if l_ChannelTabsConfiguration_1 then
            v40:dispatch(v14(l_ChannelTabsConfiguration_1.Enabled));
            l_ChannelTabsConfiguration_1:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 361 ]]
                -- upvalues: v40 (ref), v14 (ref), l_ChannelTabsConfiguration_1 (copy)
                v40:dispatch(v14(l_ChannelTabsConfiguration_1.Enabled));
            end);
            for _, v87 in ipairs({
                "BackgroundTransparency", 
                "BackgroundColor3", 
                "HoverBackgroundColor3", 
                "FontFace", 
                "TextSize", 
                "TextColor3", 
                "SelectedTabTextColor3", 
                "TextStrokeColor3", 
                "TextStrokeTransparency"
            }) do
                if l_ChannelTabsConfiguration_1[v87] then
                    local v88 = l_ChannelTabsConfiguration_1[v87];
                    v85[v87] = v88;
                    v46("ChannelTabsConfigurationLoaded", v87, v88);
                end;
            end;
            if l_GetFFlagReenableTextChatForTenFootInterfaces_0() and l_GuiService_0:IsTenFootInterface() then
                v85.TextSize = v85.TextSize * 1.5;
            end;
            l_ChannelTabsConfiguration_1.Changed:Connect(function(v89) --[[ Line: 396 ]]
                -- upvalues: l_ChannelTabsConfiguration_1 (copy), v40 (ref), v21 (ref), v46 (ref)
                local v90 = l_ChannelTabsConfiguration_1[v89];
                v40:dispatch(v21(v89, v90));
                v46("ChannelTabsConfigurationChanged", v89, v90);
            end);
            return v85;
        else
            return {};
        end;
    end;
    local v92 = v71();
    local v93 = v83();
    local v94 = v63();
    local v95 = if v28() then v91() else {};
    v40:dispatch(v11({
        bubbleChatSettings = v93, 
        chatWindowSettings = v92, 
        chatInputBarSettings = v94, 
        channelTabsSettings = v95
    }));
end;