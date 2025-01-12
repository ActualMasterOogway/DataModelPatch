local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(script.Parent.Conversation);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatHiddenMessages);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagImprovePreviewMessage);
local l_getFFlagAppChatEnableConversationUnavailableUI_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatEnableConversationUnavailableUI;
local function v13(v12) --[[ Line: 18 ]] --[[ Name: getMessageId ]]
    return v12.id;
end;
local function v18(v14, v15) --[[ Line: 22 ]] --[[ Name: messageSortPredicate ]]
    local l_UnixTimestamp_0 = v14.sent:GetUnixTimestamp();
    local l_UnixTimestamp_1 = v15.sent:GetUnixTimestamp();
    if l_UnixTimestamp_0 == l_UnixTimestamp_1 then
        return v14.id > v15.id;
    else
        return l_UnixTimestamp_0 < l_UnixTimestamp_1;
    end;
end;
local function v21(v19, v20) --[[ Line: 32 ]] --[[ Name: sendingMessageSortPredicate ]]
    return v19.order < v20.order;
end;
local function _(v22, v23) --[[ Line: 38 ]] --[[ Name: convertToLegacyConversationType ]]
    -- upvalues: v7 (copy)
    if v23 == "friends" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    elseif v22 == "group" then
        return v7.Type.MULTI_USER_CONVERSATION;
    elseif v22 == "one_to_one" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    else
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    end;
end;
local function v29(v25) --[[ Line: 51 ]] --[[ Name: getFriendId ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        for _, v28 in v25.participant_user_ids do
            if tostring(v28) ~= tostring(l_LocalPlayer_0.UserId) then
                return "friends:" .. tostring(v28);
            end;
        end;
    end;
    return "friends:unknown-id";
end;
local v30 = {
    ModerationType = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }, 
    UserPendingStatus = {
        Invalid = "invalid", 
        Pending = "pending", 
        NotPending = "not_pending"
    }
};
v30.mockBase = function() --[[ Line: 82 ]] --[[ Name: mockBase ]]
    -- upvalues: l_OrderedMap_0 (copy), v13 (copy), v18 (copy), v21 (copy), v7 (copy), v6 (copy), v30 (copy), l_DateTime_0 (copy)
    return {
        source = "channels", 
        type = "one_to_one", 
        messages = l_OrderedMap_0.new(v13, v18), 
        sendingMessages = l_OrderedMap_0.new(v13, v21), 
        id = "1-2-3", 
        clientId = "1-2-3", 
        initiator = "1", 
        hasUnreadMessages = false, 
        conversationType = v7.Type.ONE_TO_ONE_CONVERSATION, 
        hasGroupUp = false, 
        usersTyping = {}, 
        isUserLeaving = false, 
        fetchingOlderMessages = false, 
        serverState = v6.ServerState.CREATED, 
        pinnedGame = {}, 
        moderationType = v30.ModerationType.TrustedComms, 
        userPendingStatus = v30.UserPendingStatus.NotPending, 
        participantPendingStatus = v30.UserPendingStatus.NotPending, 
        previewMessageId = nil, 
        lastUpdated = l_DateTime_0.now(), 
        title = "test", 
        titleForViewer = "test", 
        isDefaultTitle = false, 
        participants = {
            "1"
        }, 
        participantMetadata = {
            ["1"] = {
                isPending = false
            }
        }
    };
end;
v30.mock = function(v31) --[[ Line: 125 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v30 (copy)
    return v4.Dictionary.join(v30.mockBase(), v31 or {});
end;
v30.response = function(v32) --[[ Line: 129 ]] --[[ Name: response ]]
    return {
        source = if v32.source then v32.source else "channels", 
        type = if v32.type then v32.type else "one_to_one", 
        created_at = if v32.created_at then v32.created_at else "2021-01-01T00:00:00Z", 
        created_by = if v32.created_by then v32.created_by else 1, 
        id = if v32.id then v32.id else "1-2-3", 
        name = if v32.name then v32.name else "test", 
        participant_user_ids = if v32.participant_user_ids then v32.participant_user_ids else {
            1
        }, 
        unread_message_count = if v32.unread_message_count then v32.unread_message_count else 0, 
        updated_at = if v32.updated_at then v32.updated_at else "2021-01-01T00:00:00Z", 
        messages = if v32.messages then v32.messages else {}, 
        moderation_type = if v32.moderation_type then v32.moderation_type else "trusted_comms", 
        user_pending_status = if v32.user_pending_status then v32.user_pending_status else "not_pending", 
        participant_pending_status = if v32.participant_pending_status then v32.participant_pending_status else "not_pending", 
        success = if v32.success then v32.success else nil, 
        preview_message = if v32.preview_message then v32.preview_message else nil, 
        hasGroupUp = if v32.hasGroupUp then v32.hasGroupUp else false
    };
end;
v30.fromChannelsApi = function(v33) --[[ Line: 170 ]] --[[ Name: fromChannelsApi ]]
    -- upvalues: l_OrderedMap_0 (copy), v13 (copy), v18 (copy), v21 (copy), v29 (copy), v7 (copy), v6 (copy), l_getFFlagAppChatEnableConversationUnavailableUI_0 (copy), v9 (copy), v10 (copy), l_DateTime_0 (copy)
    local v34 = {
        source = v33.source, 
        type = v33.type, 
        createdAt = v33.created_at, 
        messages = l_OrderedMap_0.new(v13, v18), 
        sendingMessages = l_OrderedMap_0.new(v13, v21), 
        id = if v33.source == "friends" then v29(v33) else tostring(v33.id), 
        clientId = "", 
        initiator = tostring(v33.created_by), 
        hasUnreadMessages = v33.unread_message_count > 0
    };
    local l_type_0 = v33.type;
    v34.conversationType = if v33.source == "friends" then v7.Type.ONE_TO_ONE_CONVERSATION else if l_type_0 == "group" then v7.Type.MULTI_USER_CONVERSATION else if l_type_0 == "one_to_one" then v7.Type.ONE_TO_ONE_CONVERSATION else v7.Type.ONE_TO_ONE_CONVERSATION;
    v34.usersTyping = {};
    v34.isUserLeaving = false;
    v34.fetchingOlderMessages = false;
    v34.serverState = if v33.source == "friends" then v6.ServerState.NONE else v6.ServerState.CREATED;
    v34.pinnedGame = {};
    v34.moderationType = v33.moderation_type;
    v34.userPendingStatus = v33.user_pending_status;
    if l_getFFlagAppChatEnableConversationUnavailableUI_0() and v33.participant_pending_status then
        v34.participantPendingStatus = v33.participant_pending_status;
    end;
    local l_preview_message_0 = v33.preview_message;
    if v9() and l_preview_message_0 then
        if v10() then
            if l_preview_message_0.is_previewable then
                v34.previewMessageId = l_preview_message_0.id;
            end;
        else
            v34.previewMessageId = l_preview_message_0.id;
        end;
    end;
    v34.hasGroupUp = if v33.has_group_up then v33.has_group_up else false;
    v34.lastUpdated = l_DateTime_0.fromIsoDate(v33.updated_at);
    v34.title = v33.name;
    v34.titleForViewer = "";
    v34.isDefaultTitle = v33.name == nil;
    v34.participants = {};
    if v33.participant_user_ids then
        for _, v38 in v33.participant_user_ids do
            table.insert(v34.participants, (tostring(v38)));
        end;
    end;
    v34.participantMetadata = {};
    return v34;
end;
v30.getFriendConversationId = function(v39) --[[ Line: 227 ]] --[[ Name: getFriendConversationId ]]
    -- upvalues: v29 (copy)
    return (v29({
        participant_user_ids = v39
    }));
end;
return v30;