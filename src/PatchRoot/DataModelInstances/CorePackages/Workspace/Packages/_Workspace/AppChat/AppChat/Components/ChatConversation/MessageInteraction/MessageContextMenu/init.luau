local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v7 = require(script.Parent.Logger);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v9 = require(l_Parent_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_PeekView_0 = require(l_Parent_0.PeekView).PeekView;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_ContextualMenu_0 = v9.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v9.App.Menu.MenuDirection;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local l_useLayerCollector_0 = v9.Core.Layout.LayerCollector.useLayerCollector;
local v22 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v23 = {
    message = nil, 
    userOwnsMessage = false, 
    inputBoxRef = v3.createRef(), 
    unitTestDeviceType = nil, 
    unitTestScreenSize = nil
};
if v23.unitTestDeviceType ~= nil then
    v7:error("Default unit test device type must ALWAYS BE NIL!");
    error("Default unit test device type was not nil.");
end;
if v23.unitTestScreenSize ~= nil then
    v7:error("Default unit test screen size must ALWAYS BE NIL!");
    error("Default unit test screen size was not nil.");
end;
MessageContextMenu = function(v24) --[[ Line: 79 ]] --[[ Name: MessageContextMenu ]]
    -- upvalues: v2 (copy), v23 (copy), v20 (copy), l_useStyle_0 (copy), v3 (copy), l_Signal_0 (copy), l_useLayerCollector_0 (copy), l_useNavigation_0 (copy), l_useDeviceType_0 (copy), v22 (copy), l_useLocalization_0 (copy), l_PeekViewState_0 (copy), v8 (copy), l_DeviceType_0 (copy), l_default_0 (copy), l_Images_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_PeekView_0 (copy)
    local v25 = v2.Dictionary.union(v23, v24);
    local v26 = v20();
    local l_Color_0 = l_useStyle_0().Tokens.Global.Color;
    local v28 = v3.useRef(l_Signal_0.new());
    local v29 = v25.unitTestScreenSize or l_useLayerCollector_0().absoluteSize;
    local v30 = l_useNavigation_0();
    local v31 = v25.unitTestDeviceType or l_useDeviceType_0();
    local v32 = v22();
    local v33 = l_useLocalization_0({
        replyText = "Feature.Chat.Action.Reply", 
        copyText = "Feature.Chat.Action.Copy", 
        editText = "Feature.Chat.Action.Edit", 
        deleteText = "Feature.Chat.Action.Delete", 
        reportText = "Feature.Chat.Action.Report"
    });
    local v35 = v3.useCallback(function(v34) --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v25 (copy)
        if v32 then
            v32.fireAnalyticsEvent(v34, {
                conversationId = if v25.message then v25.message.conversationId else nil, 
                targetMessageSenderId = if v25.message then v25.message.senderTargetId else nil, 
                targetMessageId = if v25.message then v25.message.id else nil, 
                targetMessageSentAt = if v25.message and v25.message.sent then tostring(v25.message.sent.dateTime) else nil, 
                targetMessageLength = if v25.message and v25.message.content then #v25.message.content else nil
            });
        end;
    end, {
        v25.message
    });
    local v36 = v3.useRef(false);
    local v37 = v3.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v25 (copy)
        if v25.inputBoxRef and v25.inputBoxRef.current then
            v25.inputBoxRef.current:CaptureFocus();
        end;
    end, {
        v25.inputBoxRef
    });
    local v38 = v3.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v30 (copy)
        v30.goBack();
    end, {
        v30.goBack
    });
    local v39 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v28 (copy)
        v28.current:fire();
    end, {
        v28.current
    });
    local v42 = v3.useCallback(function(v40, _) --[[ Line: 140 ]]
        -- upvalues: l_PeekViewState_0 (ref), v38 (copy)
        if v40 == l_PeekViewState_0.Closed then
            v38();
        end;
    end, {
        v38
    });
    v3.useEffect(function() --[[ Line: 146 ]]
        -- upvalues: v35 (copy), v8 (ref), v25 (copy), v36 (copy)
        v35(v8.ChatMessageMenuOpened);
        if v25.inputBoxRef and v25.inputBoxRef.current then
            v36.current = v25.inputBoxRef.current:IsFocused();
        end;
    end, {});
    local v43 = v3.useCallback(function() --[[ Line: 155 ]]
        -- upvalues: v31 (copy), l_DeviceType_0 (ref), v39 (copy), v38 (copy)
        if v31 == l_DeviceType_0.Phone then
            v39();
            return;
        else
            v38();
            return;
        end;
    end, {
        v31, 
        v39, 
        v38
    });
    local v44 = v3.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v43 (copy), v36 (copy), v37 (copy)
        v43();
        if v36.current then
            v37();
        end;
    end, {
        v43, 
        v36.current, 
        v37
    });
    local v45 = v3.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: v35 (copy), v8 (ref), v43 (copy), v26 (copy), v25 (copy), v37 (copy)
        v35(v8.ChatMessageMenuReplyBtnActivated);
        v43();
        v26(v25.message);
        v37();
    end, {
        v35, 
        v43, 
        v26, 
        v25.message, 
        v37
    });
    local v46 = v3.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v35 (copy), v8 (ref), v43 (copy), l_default_0 (ref), v25 (copy)
        v35(v8.ChatMessageMenuCopyBtnActivated);
        v43();
        l_default_0:shareText({
            text = v25.message.content, 
            context = "AppChat-ChatConversation-MessageContextMenu"
        });
    end, {
        v35, 
        v43, 
        v25.message.content
    });
    local v47 = v3.useCallback(function() --[[ Line: 205 ]]

    end);
    local v48 = v3.useCallback(function() --[[ Line: 209 ]]

    end);
    local v49 = v3.useCallback(function() --[[ Line: 213 ]]

    end);
    local v51 = v3.useMemo(function() --[[ Line: 218 ]]
        -- upvalues: l_Images_0 (ref), v33 (copy), v45 (copy), v46 (copy), v25 (copy), v47 (copy), l_Color_0 (copy), v48 (copy), v49 (copy)
        local v50 = {
            {
                icon = l_Images_0["icons/placeholder/placeholderOff"], 
                text = v33.replyText, 
                onActivated = v45
            }, 
            {
                icon = l_Images_0["icons/actions/edit/copy"], 
                text = v33.copyText, 
                onActivated = v46
            }
        };
        if v25.userOwnsMessage then
            table.insert(v50, {
                icon = l_Images_0["icons/actions/edit/edit"], 
                text = v33.editText, 
                onActivated = v47
            });
            table.insert(v50, {
                icon = l_Images_0["icons/actions/edit/delete"], 
                iconColorOverride = l_Color_0.Red.Color3, 
                text = v33.deleteText, 
                textColorOverride = l_Color_0.Red.Color3, 
                onActivated = v48
            });
            return v50;
        else
            table.insert(v50, {
                icon = l_Images_0["icons/placeholder/placeholderOff"], 
                iconColorOverride = l_Color_0.Red.Color3, 
                text = v33.reportText, 
                textColorOverride = l_Color_0.Red.Color3, 
                onActivated = v49
            });
            return v50;
        end;
    end, {
        v33.replyText, 
        v33.copyText, 
        v33.editText, 
        v33.deleteText, 
        v33.reportText, 
        v45, 
        v46, 
        v47, 
        v48, 
        v49, 
        v25.userOwnsMessage
    });
    local v52 = 56 * #v51;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if v31 == l_DeviceType_0.Desktop or v31 == l_DeviceType_0.Tablet then
        v53 = 20;
        v54 = v29;
        v55 = Vector2.new(0.5, 0.5);
        v56 = UDim.new(0.5, 0);
        v57 = UDim.new(0.5, 0);
    else
        v53 = 0;
        v54 = Vector2.new(0, 0);
        v55 = Vector2.new(0.5, 1);
        v56 = UDim.new(0, v52);
        v57 = UDim.new(1, 0);
    end;
    local v58 = v3.createElement(l_ContextualMenu_0, {
        screenSize = v54, 
        menuDirection = l_MenuDirection_0.Up, 
        openPositionY = v56, 
        anchorPointOverride = v55, 
        horizontalAlignment = Enum.HorizontalAlignment.Center, 
        contextMenuWidthOverride = v57, 
        borderCornerRadius = v53, 
        buttonProps = v51, 
        isElementBackgroundVisible = true, 
        isElementDividerVisible = true, 
        open = true, 
        onDismiss = v44
    });
    local v59 = v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v3.Event.Activated] = v44
    }, {
        PeekView = v3.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, v52), 
            fullViewContentHeight = UDim.new(1, -v52), 
            mountAsFullView = false, 
            mountAnimation = true, 
            showDraggerInClosedState = false, 
            closeSignal = v28.current, 
            viewStateChanged = v42
        }, {
            v58
        })
    });
    if v31 == l_DeviceType_0.Desktop or v31 == l_DeviceType_0.Tablet then
        return v58;
    else
        return v59;
    end;
end;
return v3.memo(MessageContextMenu);