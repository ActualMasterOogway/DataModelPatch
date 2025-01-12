local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(script.Parent.ReplyComposeBar);
local v6 = require(script.Parent.ReplyComposeBarConstants);
local l_useStyle_0 = v4.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local v9 = require(l_Parent_0.UserProfiles);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = {
    LayoutOrder = 3, 
    message = nil, 
    close = function() --[[ Line: 43 ]] --[[ Name: close ]]

    end, 
    inputBoxRef = nil, 
    setReplyComposeBarHeight = function(_) --[[ Line: 46 ]] --[[ Name: setReplyComposeBarHeight ]]

    end, 
    unknownUserKey = "Feature.Chat.Label.UnknownUser", 
    replyingToYourselfKey = "Feature.Chat.Label.ReplyingToYourself", 
    replyingToOthersKey = "Feature.Chat.Label.ReplyingToOthers"
};
ReplyComposeBarContainer = function(v17) --[[ Line: 53 ]] --[[ Name: ReplyComposeBarContainer ]]
    -- upvalues: v3 (copy), v16 (copy), l_useStyle_0 (copy), l_useLocalUserId_0 (copy), v13 (copy), v6 (copy), v2 (copy), v14 (copy), l_useSelector_0 (copy), v8 (copy), v9 (copy), l_useLocalization_0 (copy), v5 (copy)
    local v18 = v3.Dictionary.union(v16, v17);
    local v19 = l_useStyle_0();
    local v20 = l_useLocalUserId_0();
    local v21 = v13();
    local v22 = v19.Tokens.Global.Size_700 + v6.VERTICAL_PADDING * 2 + v6.BORDER_HEIGHT;
    local v24 = v2.useCallback(function(v23) --[[ Line: 64 ]]
        -- upvalues: v21 (copy), v18 (copy)
        if v21 then
            v21.fireAnalyticsEvent(v23, {
                conversationId = if v18.message then v18.message.conversationId else nil, 
                targetMessageSenderId = if v18.message then v18.message.senderTargetId else nil, 
                targetMessageId = if v18.message then v18.message.id else nil, 
                targetMessageSentAt = if v18.message and v18.message.sent then tostring(v18.message.sent.dateTime) else nil, 
                targetMessageLength = if v18.message and v18.message.content then #v18.message.content else nil
            });
        end;
    end, {
        v18.message
    });
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v24 (copy), v14 (ref), v18 (copy), v22 (copy)
        v24(v14.ChatInputBarReplyComposeRendered);
        v18.setReplyComposeBarHeight(v22);
        return function() --[[ Line: 85 ]]
            -- upvalues: v18 (ref)
            v18.setReplyComposeBarHeight(0);
        end;
    end, {});
    local v27 = l_useSelector_0(function(v25) --[[ Line: 91 ]]
        -- upvalues: v18 (copy), v8 (ref)
        local v26 = if v25 and v25.Users and v18.message.senderTargetId then v25.Users[v18.message.senderTargetId] else nil;
        if v26 then
            return {
                targetUser = v8(v25, v26)
            };
        else
            return {};
        end;
    end);
    local v28 = v9.Hooks.useUserProfilesFetch({
        userIds = {
            v18.message.senderTargetId
        }, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v29 = nil;
    v29 = if v27.targetUser and v27.targetUser.displayName then v27.targetUser.displayName else if v28.data and v28.data.userProfiles and v28.data.userProfiles[1] and v28.data.userProfiles[1].names then v9.Selectors.getCombinedNameFromId(v28.data, v18.message.senderTargetId) else v18.unknownUserKey;
    local v30 = l_useLocalization_0(if v29 == v18.unknownUserKey then {
        replyingToUserName = v29
    } else {}).replyingToUserName or v29;
    local v31 = v20 == v18.message.senderTargetId;
    local v32 = if v31 then v18.replyingToYourselfKey else {
        v18.replyingToOthersKey; 
        DISPLAY_NAME = v30
    };
    local l_replyingToUserText_0 = l_useLocalization_0({
        replyingToUserText = v32
    }).replyingToUserText;
    local v34 = if not v31 and v27.targetUser then v27.targetUser.thumbnail else nil;
    local v35 = if v27.targetUser then v27.targetUser.presenceImage else nil;
    local v36 = if v34 then v6.ICON_WIDTH_HEIGHT * 2 else v6.ICON_WIDTH_HEIGHT;
    local v37 = v2.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v24 (copy), v14 (ref), v18 (copy)
        v24(v14.ChatInputBarReplyComposeCancelBtnActivated);
        v18.close();
    end, {
        v24, 
        v18.close
    });
    return v2.createElement(v5, {
        LayoutOrder = v18.LayoutOrder, 
        totalHeight = v22, 
        spaceNotAvailableForText = v36, 
        replyingToUserText = l_replyingToUserText_0, 
        replyingToUserContent = v18.message.content, 
        replyingToUserThumbnail = v34, 
        replyingToUserPresenceImage = v35, 
        onCloseActivated = v37
    });
end;
return v2.memo(ReplyComposeBarContainer);