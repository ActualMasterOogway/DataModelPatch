local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.SpatialUI);
local v4 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatRefactorVisibleMessages);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatWindowMemoization);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableGradientForChatWindowMessage);
local v11 = require(l_script_FirstAncestor_0.Config);
local v12 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v14 = require(l_script_FirstAncestor_1.ScrollingView);
local v15 = require(l_script_FirstAncestor_1.TextMessageLabel);
local v16 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v17 = require(l_script_FirstAncestor_1.TopBanner);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_FStringReportingIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringReportingIXPLayer;
local l_GetFFlagEnableChatLineReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReporting;
local v21 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = {}, 
    transparencyValue = v11.ChatWindowBackgroundTransparency, 
    textTransparency = if v10() then v4.createBinding(0) else 0, 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
local function v49(v22) --[[ Line: 42 ]]
    -- upvalues: l_Dictionary_0 (copy), v21 (copy), v12 (copy), l_GetFFlagEnableChatLineReporting_0 (copy), l_useUserExperiment_0 (copy), l_FStringReportingIXPLayer_0 (copy), v4 (copy), v3 (copy), v8 (copy), v6 (copy), v7 (copy), v16 (copy), v15 (copy), l_TextChatService_0 (copy), v11 (copy), v17 (copy), v14 (copy)
    local v23 = l_Dictionary_0.join(v21, v22);
    local l_chatWindowSettings_0 = v23.chatWindowSettings;
    local l_BackgroundTransparency_0 = v12(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v12(l_chatWindowSettings_0).BackgroundColor3;
    local v28 = if l_GetFFlagEnableChatLineReporting_0() then l_useUserExperiment_0({
        l_FStringReportingIXPLayer_0
    }, function(v27) --[[ Line: 49 ]]
        -- upvalues: l_FStringReportingIXPLayer_0 (ref)
        return (v27[l_FStringReportingIXPLayer_0] or {}).EnableChatLineReporting;
    end) else false;
    local v32 = v4.useCallback(function(v29, v30) --[[ Line: 55 ]]
        -- upvalues: v23 (copy)
        if type(v30) == "number" then
            return v23.transparencyValue;
        else
            return v30:map(function(v31) --[[ Line: 60 ]]
                -- upvalues: v29 (copy)
                return v29 + v31 * (1 - v29);
            end);
        end;
    end);
    local v35 = v4.useCallback(function(v33) --[[ Line: 65 ]]
        -- upvalues: v23 (copy)
        v23.resetTargetChannel();
        local v34 = tonumber(v33.userId);
        if v34 then
            v23.activateWhisperMode(v34);
        end;
    end);
    local function _(v36) --[[ Line: 74 ]] --[[ Name: shouldDisplayMessageInChatWindow ]]
        -- upvalues: v23 (copy)
        if not v23.isChannelBarVisible then
            return v36.isVisibleInChatWindow;
        else
            if v36.isVisibleInChatWindow and v36.textChannel and v23.targetTextChannel then
                if v36.textChannel.Name == v23.targetTextChannel.Name then
                    return true;
                elseif v36.textChannel.Name == "RBXSystem" and v23.targetTextChannel.Name == "RBXGeneral" then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    local v38 = v4.useContext(v3);
    local v44 = v4.useCallback(function(v39) --[[ Line: 89 ]]
        -- upvalues: l_Dictionary_0 (ref), v8 (ref), v23 (copy), v6 (ref), v7 (ref), v4 (ref), v16 (ref), v35 (copy), v15 (ref)
        local v43 = l_Dictionary_0.map(v39, function(v40, v41) --[[ Line: 90 ]]
            -- upvalues: v8 (ref), v23 (ref), v6 (ref), l_Dictionary_0 (ref), v7 (ref), v4 (ref), v16 (ref), v35 (ref), v15 (ref)
            if if v8() then v40.isVisibleInChatWindow else if v23.isChannelBarVisible then if v40.isVisibleInChatWindow and v40.textChannel and v23.targetTextChannel then v40.textChannel.Name == v23.targetTextChannel.Name or v40.textChannel.Name == "RBXSystem" and v23.targetTextChannel.Name == "RBXGeneral" else false else v40.isVisibleInChatWindow then
                local v42 = if v40.userId and v6() then l_Dictionary_0.has(v23.verifiedUserIds, v40.userId) else false;
                if v7() then
                    return v4.createElement(v16, {
                        message = v40, 
                        LayoutOrder = v41, 
                        isUserVerified = v42, 
                        textTransparency = v23.textTransparency, 
                        onTextMessageLabelButtonActivated = v35, 
                        chatWindowSettings = v23.chatWindowSettings, 
                        showTranslationButton = v23.showTranslationButton, 
                        onToggle = function() --[[ Line: 108 ]] --[[ Name: onToggle ]]

                        end
                    }), v40.messageId;
                else
                    return v4.createElement(v15, {
                        message = v40, 
                        LayoutOrder = v41, 
                        isUserVerified = v42, 
                        textTransparency = v23.textTransparency, 
                        onTextMessageLabelButtonActivated = v35, 
                        chatWindowSettings = v23.chatWindowSettings
                    }), v40.messageId;
                end;
            else
                return nil, nil;
            end;
        end);
        v43["$layout"] = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v43;
    end);
    return v4.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v23.LayoutOrder, 
        Size = v23.size, 
        Visible = v23.visible, 
        BackgroundTransparency = v32(l_BackgroundTransparency_0, v23.transparencyValue), 
        [v4.Event.MouseEnter] = v23.onHovered, 
        [v4.Event.MouseLeave] = v23.onUnhovered, 
        [v4.Change.AbsoluteSize] = function(v45) --[[ Line: 144 ]]
            -- upvalues: l_TextChatService_0 (ref), v23 (copy)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_0 and v23.onAbsoluteSizeChanged then
                v23.onAbsoluteSizeChanged(v45, l_ChatWindowConfiguration_0);
            end;
        end, 
        [v4.Change.AbsolutePosition] = function(v47) --[[ Line: 150 ]]
            -- upvalues: l_TextChatService_0 (ref), v23 (copy)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_1 and v23.onAbsoluteSizeChanged then
                v23.onAbsolutePositionChanged(v47, l_ChatWindowConfiguration_1);
            end;
        end
    }, {
        uiSizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = if v38.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(v11.ChatWindowMaxWidth, v11.ChatWindowMaxHeight)
        }), 
        TopBanner = if v28 then v4.createElement(v17, {
            backgroundColor3 = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            iconTransparency = v32(l_BackgroundTransparency_0, v23.transparencyValue), 
            onFocus = v23.onFocus, 
            onUnfocus = v23.onUnfocus, 
            messages = v23.messages
        }) else nil, 
        scrollingView = v4.createElement(v14, {
            size = v23.size, 
            messages = v23.messages, 
            targetTextChannel = v23.targetTextChannel, 
            isChannelBarVisible = v23.isChannelBarVisible
        }, v44(v23.messages))
    });
end;
if v9() then
    return (v4.memo(v49));
else
    return v49;
end;