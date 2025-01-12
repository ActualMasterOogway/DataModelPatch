local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_script_FirstAncestor_0.ChatInput);
local v5 = require(l_script_FirstAncestor_0.ChatWindow);
local v6 = require(l_script_FirstAncestor_0.ChannelBar);
local v7 = require(l_script_FirstAncestor_0.Config);
local v8 = require(l_script_FirstAncestor_0.Timer);
local v9 = require(l_script_FirstAncestor_0.SpatialUI);
local v10 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v12 = (if require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements)() then v3.PureComponent else v3.Component):extend("AppLayout");
v12.defaultProps = {
    addTopPadding = true, 
    canLocalUserChat = false, 
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    LayoutOrder = 1, 
    mutedUserIds = nil, 
    onSendChat = nil, 
    textTimer = v8.new(v7.ChatWindowTextFadeOutTime), 
    timer = v8.new(v7.ChatWindowBackgroundFadeOutTime), 
    isSpatialUIEnabled = false
};
local v13 = {
    frequency = 1.25, 
    dampingRatio = 1
};
v12.init = function(v14) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v2 (copy), v13 (copy)
    local v15, v16 = v3.createBinding(0);
    v14.transparencyValue = v15;
    v14.updateBackgroundTransparency = v16;
    v14.backgroundTransparencyMotor = v2.createSingleMotor(0);
    v14.backgroundTransparencyMotor:onStep(v14.updateBackgroundTransparency);
    v15, v16 = v3.createBinding(0);
    v14.textTransparencyValue = v15;
    v14.updateTextTransparencyValue = v16;
    v14.textTransparencyMotor = v2.createSingleMotor(0);
    v14.textTransparencyMotor:onStep(v14.updateTextTransparencyValue);
    v14.resetBackgroundTransparency = function() --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v2 (ref), v13 (ref)
        v14.backgroundTransparencyMotor:setGoal(v2.instant(0));
        v14.props.timer:stop();
        if v14.props.isTextBoxFocused == false and v14.props.isSpatialUIEnabled == false then
            v14.props.timer:start():andThen(function() --[[ Line: 53 ]]
                -- upvalues: v14 (ref), v2 (ref), v13 (ref)
                v14.backgroundTransparencyMotor:setGoal(v2.spring(1, v13));
            end);
        end;
    end;
    v14.resetTextTransparency = function() --[[ Line: 59 ]]
        -- upvalues: v14 (copy), v2 (ref), v13 (ref)
        v14.textTransparencyMotor:setGoal(v2.instant(0));
        v14.props.textTimer:stop();
        if v14.props.isTextBoxFocused == false then
            v14.props.textTimer:start():andThen(function() --[[ Line: 64 ]]
                -- upvalues: v14 (ref), v2 (ref), v13 (ref)
                v14.textTransparencyMotor:setGoal(v2.spring(1, v13));
            end);
        end;
    end;
    v14.onAbsolutePositionChanged = function(v17, v18) --[[ Line: 70 ]]
        v18.AbsolutePositionWrite = v17.AbsolutePosition;
    end;
    v14.onAbsoluteSizeChanged = function(v19, v20) --[[ Line: 74 ]]
        v20.AbsoluteSizeWrite = v19.AbsoluteSize;
    end;
end;
v12.didMount = function(v21) --[[ Line: 79 ]] --[[ Name: didMount ]]
    -- upvalues: v2 (copy), v13 (copy)
    v21.props.timer:start():andThen(function() --[[ Line: 80 ]]
        -- upvalues: v21 (copy), v2 (ref), v13 (ref)
        v21.backgroundTransparencyMotor:setGoal(v2.spring(1, v13));
    end);
    v21.props.textTimer:start():andThen(function() --[[ Line: 84 ]]
        -- upvalues: v21 (copy), v2 (ref), v13 (ref)
        v21.textTransparencyMotor:setGoal(v2.spring(1, v13));
    end);
end;
v12.didUpdate = function(v22, v23, _) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    if v23.lastGeneralActivityTimestamp ~= v22.props.lastGeneralActivityTimestamp then
        v22.resetBackgroundTransparency();
        v22.resetTextTransparency();
        return;
    else
        if v23.lastMessageActivityTimestamp ~= v22.props.lastMessageActivityTimestamp then
            v22.resetTextTransparency();
        end;
        return;
    end;
end;
v12.render = function(v25) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v3 (copy), v9 (copy), v7 (copy), v11 (copy), v5 (copy), v4 (copy), v6 (copy)
    local l_chatWindowSettings_0 = v25.props.chatWindowSettings;
    local v27 = v10.getBackgroundTransparency(l_chatWindowSettings_0, v25.props.clientSettings);
    local v28 = v10.getBackgroundColor(l_chatWindowSettings_0, v25.props.clientSettings);
    return v3.createElement(v9.Provider, {
        value = {
            isSpatialUIEnabled = v25.props.isSpatialUIEnabled
        }
    }, {
        appLayout = v3.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 1, 
            Position = v25.props.chatLayoutAlignment.Position, 
            AnchorPoint = v25.props.chatLayoutAlignment.AnchorPoint, 
            Size = if v25.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(v7.ChatWindowSize.X.Scale * l_chatWindowSettings_0.WidthScale, v7.ChatWindowSize.Y.Scale * l_chatWindowSettings_0.HeightScale)
        }, {
            uiSizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = if v25.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(v7.ChatWindowMaxWidth, 1e999)
            }), 
            layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = v25.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
            }), 
            topBorder = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                ImageColor3 = v28, 
                ImageTransparency = v25.transparencyValue:map(function(v29) --[[ Line: 136 ]]
                    -- upvalues: v27 (copy)
                    local l_v27_0 = v27;
                    return l_v27_0 + v29 * (1 - l_v27_0);
                end), 
                LayoutOrder = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 0, 8), 
                SliceCenter = Rect.new(8, 8, 24, 32), 
                Visible = if v11() then (v25.props.isChatWindowVisible or v25.props.isChatInputBarVisible) and not v25.props.isChannelBarVisible else v25.props.isChatWindowVisible or v25.props.isChatInputBarVisible, 
                [v3.Event.MouseEnter] = v25.props.onHovered, 
                [v3.Event.MouseLeave] = v25.props.onUnhovered
            }, {
                uiSizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v7.ChatWindowMaxWidth, 1e999)
                })
            }), 
            topPadding = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 8), 
                Visible = if v11() then v25.props.isChannelBarVisible else false, 
                BackgroundTransparency = v25.transparencyValue:map(function(v31) --[[ Line: 158 ]]
                    -- upvalues: v27 (copy)
                    local l_v27_1 = v27;
                    return l_v27_1 + v31 * (1 - l_v27_1);
                end), 
                BackgroundColor3 = l_chatWindowSettings_0.BackgroundColor3, 
                BorderSizePixel = 0, 
                [v3.Event.MouseEnter] = v25.props.onHovered, 
                [v3.Event.MouseLeave] = v25.props.onUnhovered, 
                ZIndex = 0
            }), 
            chatWindow = v3.createElement(v5, {
                LayoutOrder = 2, 
                size = UDim2.fromScale(1, 1), 
                transparencyValue = v25.transparencyValue, 
                textTransparency = v25.textTransparencyValue, 
                onHovered = v25.props.onHovered, 
                onUnhovered = v25.props.onUnhovered, 
                mutedUserIds = v25.props.mutedUserIds, 
                canLocalUserChat = v25.props.canLocalUserChat, 
                activateWhisperMode = v25.props.activateWhisperMode, 
                resetTargetChannel = v25.props.resetTargetChannel, 
                visible = v25.props.isChatWindowVisible, 
                onAbsoluteSizeChanged = v25.onAbsoluteSizeChanged, 
                onAbsolutePositionChanged = v25.onAbsolutePositionChanged, 
                chatWindowSettings = l_chatWindowSettings_0, 
                showTranslationButton = v25.props.showTranslationButton, 
                isChannelBarVisible = if v11() then v25.props.isChannelBarVisible else false
            }), 
            chatInputBar = v3.createElement(v4, {
                LayoutOrder = 3, 
                addTopPadding = v25.props.isChatWindowVisible, 
                onSendChat = v25.props.onSendChat, 
                transparencyValue = v25.transparencyValue, 
                canLocalUserChat = v25.props.canLocalUserChat, 
                resetTargetChannel = v25.props.resetTargetChannel, 
                visible = v25.props.isChatInputBarVisible, 
                onAbsoluteSizeChanged = v25.onAbsoluteSizeChanged, 
                onAbsolutePositionChanged = v25.onAbsolutePositionChanged, 
                chatWindowSettings = l_chatWindowSettings_0, 
                isChannelBarVisible = if v11() then v25.props.isChannelBarVisible else false
            }), 
            channelBar = v3.createElement(v6, {
                LayoutOrder = 4, 
                size = UDim2.fromScale(1, 1), 
                transparencyValue = v25.transparencyValue, 
                onHovered = v25.props.onHovered, 
                onUnhovered = v25.props.onUnhovered, 
                chatWindowSettings = l_chatWindowSettings_0, 
                visible = if v11() then v25.props.isChannelBarVisible else false
            }), 
            bottomBorder = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                ImageColor3 = v28, 
                ImageTransparency = v25.transparencyValue:map(function(v33) --[[ Line: 216 ]]
                    -- upvalues: v27 (copy)
                    local l_v27_2 = v27;
                    return l_v27_2 + v33 * (1 - l_v27_2);
                end), 
                LayoutOrder = 5, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 0, 8), 
                SliceCenter = Rect.new(8, 0, 24, 16), 
                Visible = v25.props.isChatWindowVisible or v25.props.isChatInputBarVisible, 
                [v3.Event.MouseEnter] = v25.props.onHovered, 
                [v3.Event.MouseLeave] = v25.props.onUnhovered
            }, {
                uiSizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v7.ChatWindowMaxWidth, 1e999)
                })
            })
        })
    });
end;
v12.willUnmount = function(v35) --[[ Line: 236 ]] --[[ Name: willUnmount ]]
    v35.backgroundTransparencyMotor:destroy();
    v35.textTransparencyMotor:destroy();
end;
return v12;