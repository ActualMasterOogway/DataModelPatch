local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Conversation_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation;
local l_getConversationDisplayTitle_0 = l_Conversation_0.getConversationDisplayTitle;
local l_getOtherParticipant_0 = l_Conversation_0.getOtherParticipant;
local l_getConversationGameId_0 = l_Conversation_0.getConversationGameId;
local v7 = require(script.Parent.populateUserIdsWithState);
local v8 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v9 = require(script.Parent.getLastMessageContent);
local v10 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v11 = require(l_script_FirstAncestor_0.Users.userPresenceUtils);
return function(v12, v13) --[[ Line: 37 ]]
    -- upvalues: v2 (copy), l_getOtherParticipant_0 (copy), v10 (copy), v11 (copy), l_getConversationDisplayTitle_0 (copy), v7 (copy), v9 (copy), v8 (copy), l_getConversationGameId_0 (copy)
    local v14 = v13.participants or {};
    local v16 = v2.List.filter(v14, function(v15) --[[ Line: 39 ]]
        -- upvalues: v12 (copy)
        return v15 ~= v12.LocalUserId;
    end);
    local v17 = nil;
    if v13.conversationType == "OneToOneConversation" then
        local v18 = l_getOtherParticipant_0(v12, v13.participants);
        local v19 = v10.Selectors.getUserPresenceByUserId(v12, v18);
        v17 = v11.getUserDisplayPresence(v19);
    end;
    local v20 = {};
    local l_Users_0 = v12.Users;
    for _, v23 in pairs(v14) do
        v20[v23] = l_Users_0[v23];
    end;
    local v24 = {
        shortRelativeTime = v13.lastUpdated and v13.lastUpdated:GetShortRelativeTime(), 
        longRelativeTime = v13.lastUpdated and v13.lastUpdated:GetLongRelativeTime(), 
        unixTime = v13.lastUpdated and v13.lastUpdated:GetUnixTimestamp()
    };
    return v2.Dictionary.join({
        id = v13.id, 
        title = l_getConversationDisplayTitle_0(v13), 
        participants = v7(v12, v14), 
        otherParticipants = v16, 
        isDefaultTitle = v13.isDefaultTitle, 
        hasGroupUp = v13.hasGroupUp, 
        lastMessageContent = v9(v13) or "", 
        hasUnreadMessages = v13.hasUnreadMessages or false, 
        thumbnails = v8(v16), 
        presenceText = v17 and v17.text, 
        presenceImage = v17 and v17.image, 
        gameId = l_getConversationGameId_0(v13, v12.LocalUserId, v20), 
        serverState = v13.serverState, 
        moderationType = v13.moderationType, 
        userPendingStatus = v13.userPendingStatus, 
        participantMetadata = v13.participantMetadata, 
        conversationType = v13.conversationType
    }, v24);
end;