local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ExpChatShared);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.llama);
local l_List_0 = v5.List;
local l_Dictionary_0 = v5.Dictionary;
local l_Set_0 = v5.Set;
local l_None_0 = v5.None;
local v10 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v12 = require(l_Actions_0.IncomingMessageReceived);
local v13 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v14 = require(l_Actions_0.OutgoingMessageSent);
local l_UserMuted_0 = v3.Actions.UserMuted;
local l_UserUnmuted_0 = v3.Actions.UserUnmuted;
local l_PlayerRemoved_0 = v3.Actions.PlayerRemoved;
local v18 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v19 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local v20 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v21 = require(l_Actions_0.BubbleChatSettingsChanged);
local l_ChatWindowMessagesCleared_0 = v3.Actions.ChatWindowMessagesCleared;
local v23 = require(l_Actions_0.ChatTranslationGlobalToggled);
local v24 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v25 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleCreated);
local v26 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleTextUpdated);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local l_TextChatService_0 = game:GetService("TextChatService");
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagFixInvalidMessagesShowingOnSenderSide);
local v31 = require(l_script_FirstAncestor_0.GlobalFlags);
getChatTranslationEnabled = function() --[[ Line: 41 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v34 = {
    canLocalUserChat = false, 
    isBubbleChatEnabled = false, 
    _mutedUserIds = {}, 
    messageLimit = 50, 
    windowMessagesInOrder = {}, 
    windowMessagesInOrderByTabId = {}, 
    byMessageId = {}, 
    bubbleMessagesInOrderBySenderId = {}, 
    mockUserIdToPartOrModel = {}, 
    partOrModelToMockUserId = {}, 
    messagesBySenderId = {}
};
local function v63(v35, v36) --[[ Line: 95 ]] --[[ Name: mapByMessageIdInOrderHelper ]]
    -- upvalues: v30 (copy), v10 (copy), l_None_0 (copy), l_HttpService_0 (copy), l_Dictionary_0 (copy), v28 (copy), l_List_0 (copy)
    if v30() then
        if v10(v36.text) and v36.status ~= Enum.TextChatMessageStatus.Floodchecked and v36.status ~= Enum.TextChatMessageStatus.MessageTooLong then
            return v35;
        end;
    elseif v10(v36.text) then
        return v35;
    end;
    local l_partOrModel_0 = v36.partOrModel;
    local l_userId_0 = v36.userId;
    local l_messageId_0 = v36.messageId;
    local v40 = if v36.textChannel then v36.textChannel.Name == "RBXSystem" and "RBXGeneral" or v36.textChannel.Name else l_None_0;
    local l_windowMessagesInOrder_0 = v35.windowMessagesInOrder;
    local v42 = v35.windowMessagesInOrderByTabId[v40] or {};
    local l_byMessageId_0 = v35.byMessageId;
    local l_bubbleMessagesInOrderBySenderId_0 = v35.bubbleMessagesInOrderBySenderId;
    local l_mockUserIdToPartOrModel_0 = v35.mockUserIdToPartOrModel;
    local l_partOrModelToMockUserId_0 = v35.partOrModelToMockUserId;
    local l_messagesBySenderId_0 = v35.messagesBySenderId;
    if not l_userId_0 and l_partOrModel_0 then
        l_userId_0 = l_partOrModelToMockUserId_0[l_partOrModel_0];
        if not l_userId_0 then
            l_userId_0 = l_HttpService_0:GenerateGUID(false);
            l_mockUserIdToPartOrModel_0 = l_Dictionary_0.join(l_mockUserIdToPartOrModel_0, {
                [l_userId_0] = l_partOrModel_0
            });
            l_partOrModelToMockUserId_0 = l_Dictionary_0.join(l_partOrModelToMockUserId_0, {
                [l_partOrModel_0] = l_userId_0
            });
        end;
    end;
    if l_byMessageId_0[l_messageId_0] then
        local v48 = {
            userId = l_userId_0, 
            prefixText = v36.prefixText, 
            text = v36.text, 
            translation = v36.translation, 
            useTranslation = v36.useTranslation, 
            textChannel = v36.textChannel, 
            messageId = l_messageId_0, 
            status = v36.status, 
            timestamp = v36.timestamp, 
            isVisibleInBubbleChat = v36.isVisibleInBubbleChat, 
            isVisibleInChatWindow = v36.isVisibleInChatWindow, 
            shouldOverrideBubbleChatSettings = v36.shouldOverrideBubbleChatSettings, 
            bubbleChatMessageProperties = v36.bubbleChatMessageProperties, 
            chatWindowMessageProperties = v36.chatWindowMessageProperties
        };
        l_byMessageId_0 = l_Dictionary_0.join(l_byMessageId_0, {
            [l_messageId_0] = v48
        });
        if v28() and l_userId_0 and l_messagesBySenderId_0[l_userId_0] then
            local v51 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v49, _) --[[ Line: 163 ]]
                -- upvalues: l_messageId_0 (copy)
                return v49.messageId == l_messageId_0;
            end);
            if v51 and v51 > 0 then
                l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                    [l_userId_0] = l_List_0.set(l_messagesBySenderId_0[l_userId_0], v51, v48)
                });
            end;
        end;
        if v30() and (v36.status == Enum.TextChatMessageStatus.Floodchecked or v36.status == Enum.TextChatMessageStatus.MessageTooLong) then
            l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, l_List_0.count(l_windowMessagesInOrder_0));
            v42 = l_List_0.removeIndex(v42, l_List_0.count(v42));
            l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, v36.messageId);
            if l_userId_0 then
                if v28() then
                    local v54 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v52, _) --[[ Line: 187 ]]
                        -- upvalues: l_messageId_0 (copy)
                        return v52.messageId == l_messageId_0;
                    end);
                    if v54 and v54 > 0 then
                        l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                            [l_userId_0] = l_List_0.removeIndex(l_messagesBySenderId_0[l_userId_0], v54)
                        });
                    end;
                elseif l_bubbleMessagesInOrderBySenderId_0 ~= nil then
                    l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                        [l_userId_0] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[l_userId_0], v36.messageId)
                    });
                end;
            end;
        end;
        return l_Dictionary_0.join(v35, {
            windowMessagesInOrder = l_windowMessagesInOrder_0, 
            windowMessagesInOrderByTabId = l_Dictionary_0.join(v35.windowMessagesInOrderByTabId, {
                [v40] = v42
            }), 
            byMessageId = l_byMessageId_0, 
            bubbleMessagesInOrderBySenderId = if not v28() then l_bubbleMessagesInOrderBySenderId_0 else nil, 
            messagesBySenderId = if v28() then l_messagesBySenderId_0 else nil
        });
    else
        if #l_windowMessagesInOrder_0 == v35.messageLimit and v36.isVisibleInChatWindow then
            local v55 = l_windowMessagesInOrder_0[1];
            local v56 = if l_byMessageId_0[v55] then l_byMessageId_0[v55].userId else nil;
            l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, 1);
            do
                local l_v55_0 = v55;
                if v56 then
                    if v28() and l_messagesBySenderId_0 ~= nil and l_messagesBySenderId_0[v56] then
                        local v60 = l_List_0.findWhere(l_messagesBySenderId_0[v56], function(v58, _) --[[ Line: 230 ]]
                            -- upvalues: l_v55_0 (ref)
                            return v58.messageId == l_v55_0;
                        end);
                        if v60 and v60 > 0 then
                            l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                                [v56] = l_List_0.removeIndex(l_messagesBySenderId_0[v56], v60)
                            });
                        end;
                        if l_Dictionary_0.count(l_messagesBySenderId_0[v56]) == 0 then
                            l_messagesBySenderId_0 = l_Dictionary_0.removeKey(l_messagesBySenderId_0, v56);
                            if l_mockUserIdToPartOrModel_0[v56] then
                                local v61 = l_mockUserIdToPartOrModel_0[v56];
                                if l_partOrModelToMockUserId_0[v61] then
                                    l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v61);
                                end;
                                l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v56);
                            end;
                        end;
                    elseif l_bubbleMessagesInOrderBySenderId_0 ~= nil and l_bubbleMessagesInOrderBySenderId_0[v56] then
                        l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                            [v56] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[v56], l_v55_0)
                        });
                        if l_Dictionary_0.count(l_bubbleMessagesInOrderBySenderId_0[v56]) == 0 then
                            l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.removeKey(l_bubbleMessagesInOrderBySenderId_0, v56);
                            if l_mockUserIdToPartOrModel_0[v56] then
                                local v62 = l_mockUserIdToPartOrModel_0[v56];
                                if l_partOrModelToMockUserId_0[v62] then
                                    l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v62);
                                end;
                                l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v56);
                            end;
                        end;
                    end;
                end;
                if #v42 == v35.messageLimit then
                    l_v55_0 = v42[1];
                    v42 = l_List_0.removeIndex(v42, 1);
                    l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, l_v55_0);
                end;
            end;
        end;
        if v36.isVisibleInChatWindow then
            l_windowMessagesInOrder_0 = l_List_0.append(l_windowMessagesInOrder_0, l_messageId_0);
            v42 = l_List_0.append(v42, l_messageId_0);
        end;
        return l_Dictionary_0.join(v35, {
            windowMessagesInOrder = l_windowMessagesInOrder_0, 
            windowMessagesInOrderByTabId = l_Dictionary_0.join(v35.windowMessagesInOrderByTabId, {
                [v40] = v42
            }), 
            byMessageId = l_Dictionary_0.join(l_byMessageId_0, {
                [l_messageId_0] = {
                    userId = l_userId_0, 
                    prefixText = v36.prefixText, 
                    text = v36.text, 
                    translation = v36.translation, 
                    useTranslation = v36.useTranslation, 
                    messageId = l_messageId_0, 
                    status = v36.status, 
                    timestamp = v36.timestamp, 
                    isVisibleInBubbleChat = v36.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v36.isVisibleInChatWindow, 
                    partOrModel = l_partOrModel_0, 
                    shouldOverrideBubbleChatSettings = v36.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v36.bubbleChatMessageProperties, 
                    chatWindowMessageProperties = v36.chatWindowMessageProperties, 
                    textChannel = v36.textChannel
                }
            }), 
            bubbleMessagesInOrderBySenderId = if not v28() and l_userId_0 then l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                [l_userId_0] = l_List_0.append(l_bubbleMessagesInOrderBySenderId_0[l_userId_0] or {}, l_messageId_0)
            }) else nil, 
            mockUserIdToPartOrModel = l_mockUserIdToPartOrModel_0, 
            partOrModelToMockUserId = l_partOrModelToMockUserId_0, 
            messagesBySenderId = if v28() and l_userId_0 then l_Dictionary_0.join(l_messagesBySenderId_0, {
                [l_userId_0] = l_List_0.append(l_messagesBySenderId_0[l_userId_0] or {}, {
                    userId = l_userId_0, 
                    prefixText = v36.prefixText, 
                    text = v36.text, 
                    translation = v36.translation, 
                    useTranslation = v36.useTranslation, 
                    messageId = l_messageId_0, 
                    status = v36.status, 
                    timestamp = v36.timestamp, 
                    isVisibleInBubbleChat = v36.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v36.isVisibleInChatWindow, 
                    partOrModel = l_partOrModel_0, 
                    shouldOverrideBubbleChatSettings = v36.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v36.bubbleChatMessageProperties, 
                    chatWindowMessageProperties = v36.chatWindowMessageProperties, 
                    textChannel = v36.textChannel
                })
            }) else nil
        });
    end;
end;
local function v72(v64, v65) --[[ Line: 337 ]] --[[ Name: globalToggleTranslations ]]
    -- upvalues: l_Dictionary_0 (copy)
    local l_useTranslation_0 = v65.useTranslation;
    local l_byMessageId_1 = v64.byMessageId;
    local v68 = {};
    for v69, _ in pairs(l_byMessageId_1) do
        local v71 = l_byMessageId_1[v69];
        if v71 ~= nil then
            v68[v69] = {
                prefixText = v71.prefixText, 
                text = v71.text, 
                translation = v71.translation, 
                useTranslation = l_useTranslation_0, 
                messageId = v71.messageId, 
                status = v71.status, 
                timestamp = v71.timestamp, 
                isVisibleInBubbleChat = v71.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v71.isVisibleInChatWindow, 
                partOrModel = v71.partOrModel, 
                shouldOverrideBubbleChatSettings = v71.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v71.bubbleChatMessageProperties, 
                chatWindowMessageProperties = v71.chatWindowMessageProperties, 
                userId = v71.userId, 
                textChannel = v71.textChannel
            };
        end;
    end;
    return l_Dictionary_0.join(v64, {
        byMessageId = l_Dictionary_0.join(l_byMessageId_1, v68)
    });
end;
local function v79(v73, v74) --[[ Line: 371 ]] --[[ Name: individualToggleTranslation ]]
    -- upvalues: l_Dictionary_0 (copy)
    local l_useTranslation_1 = v74.useTranslation;
    local l_messageId_1 = v74.messageId;
    local l_byMessageId_2 = v73.byMessageId;
    local v78 = l_byMessageId_2[l_messageId_1];
    if v78 ~= nil then
        return l_Dictionary_0.join(v73, {
            byMessageId = l_Dictionary_0.join(l_byMessageId_2, {
                [l_messageId_1] = {
                    prefixText = v78.prefixText, 
                    text = v78.text, 
                    translation = v78.translation, 
                    useTranslation = l_useTranslation_1, 
                    messageId = v78.messageId, 
                    status = v78.status, 
                    timestamp = v78.timestamp, 
                    isVisibleInBubbleChat = v78.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v78.isVisibleInChatWindow, 
                    partOrModel = v78.partOrModel, 
                    shouldOverrideBubbleChatSettings = v78.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v78.bubbleChatMessageProperties, 
                    chatWindowMessageProperties = v78.chatWindowMessageProperties, 
                    userId = v78.userId, 
                    textChannel = v78.textChannel
                }
            })
        });
    else
        return nil;
    end;
end;
local function v84(v80, v81) --[[ Line: 405 ]] --[[ Name: mapByMessageIdInOrderBubbleChat ]]
    -- upvalues: v27 (copy), v63 (copy)
    local l_bubbleChatMessageTable_0 = v81.bubbleChatMessageTable;
    local v83 = {
        userId = l_bubbleChatMessageTable_0.bubbleChatMessageUserId, 
        prefixText = "", 
        text = l_bubbleChatMessageTable_0.message, 
        translation = if v27() then l_bubbleChatMessageTable_0.translation else nil, 
        useTranslation = if v27() then getChatTranslationEnabled() else nil, 
        messageId = l_bubbleChatMessageTable_0.bubbleChatMessageId, 
        status = Enum.TextChatMessageStatus.Success, 
        timestamp = l_bubbleChatMessageTable_0.timestamp, 
        partOrModel = l_bubbleChatMessageTable_0.partOrModel, 
        shouldOverrideBubbleChatSettings = true, 
        isVisibleInBubbleChat = true, 
        isVisibleInChatWindow = false, 
        bubbleChatMessageProperties = l_bubbleChatMessageTable_0.bubbleChatMessageProperties
    };
    return v63(v80, v83);
end;
local function v93(v85, v86) --[[ Line: 428 ]] --[[ Name: mapByMessageIdInOrder ]]
    -- upvalues: l_Set_0 (copy), v27 (copy), v63 (copy)
    local l_textChatMessage_0 = v86.textChatMessage;
    local v88 = if l_textChatMessage_0.TextSource then tostring(l_textChatMessage_0.TextSource.UserId) else nil;
    local v89 = nil;
    v89 = v88 == nil or if v85.canLocalUserChat then not (l_textChatMessage_0.Status ~= Enum.TextChatMessageStatus.Success) or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending else false;
    local v90 = if v88 then l_Set_0.has(v85._mutedUserIds, v88) else false;
    v89 = v89 and not v90;
    local v91 = false;
    if v85.isBubbleChatEnabled and v89 and (l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Success or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending) then
        v91 = true;
    end;
    local v92 = {
        userId = v88, 
        prefixText = l_textChatMessage_0.PrefixText, 
        text = l_textChatMessage_0.Text, 
        translation = if v27() then l_textChatMessage_0.Translation else nil, 
        useTranslation = if v27() then getChatTranslationEnabled() else nil, 
        textChannel = l_textChatMessage_0.TextChannel, 
        messageId = l_textChatMessage_0.MessageId, 
        status = l_textChatMessage_0.Status, 
        timestamp = l_textChatMessage_0.Timestamp, 
        isVisibleInBubbleChat = v91, 
        isVisibleInChatWindow = v89, 
        bubbleChatMessageProperties = l_textChatMessage_0.BubbleChatMessageProperties, 
        chatWindowMessageProperties = l_textChatMessage_0.ChatWindowMessageProperties
    };
    return v63(v85, v92);
end;
return v4.createReducer(v34, {
    [v12.name] = v93, 
    [v13.name] = v84, 
    [v14.name] = v93, 
    [l_UserMuted_0.name] = function(v94, v95) --[[ Line: 517 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v94, {
            _mutedUserIds = l_Set_0.add(v94._mutedUserIds, v95.userId)
        });
    end, 
    [l_UserUnmuted_0.name] = function(v96, v97) --[[ Line: 522 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v96, {
            _mutedUserIds = l_Set_0.subtract(v96._mutedUserIds, v97.userId)
        });
    end, 
    [l_PlayerRemoved_0.name] = function(v98, v99) --[[ Line: 527 ]]
        -- upvalues: l_Dictionary_0 (copy), v28 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v98, {
            bubbleMessagesInOrderBySenderId = if not v28() then l_Dictionary_0.filter(v98.bubbleMessagesInOrderBySenderId, function(_, v101) --[[ Line: 530 ]]
                -- upvalues: v99 (copy)
                return v101 ~= v99.userId;
            end) else nil, 
            messagesBySenderId = if v28() then l_Dictionary_0.filter(v98.messagesBySenderId, function(_, v103) --[[ Line: 535 ]]
                -- upvalues: v99 (copy)
                return v103 ~= v99.userId;
            end) else nil, 
            _mutedUserIds = l_Set_0.subtract(v98._mutedUserIds, v99.userId)
        });
    end, 
    [v18.name] = function(v104, v105) --[[ Line: 542 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v104, {
            canLocalUserChat = v105.canUserChat
        });
    end, 
    [v19.name] = function(v106, _) --[[ Line: 545 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v106, {
            canLocalUserChat = false
        });
    end, 
    [v20.name] = function(v108, v109) --[[ Line: 548 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v108, {
            isBubbleChatEnabled = if v109.bubbleChatSettings.Enabled then v109.bubbleChatSettings.Enabled else false
        });
    end, 
    [v21.name] = function(v110, v111) --[[ Line: 555 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v111.property ~= "Enabled" then
            return v110;
        else
            local v113 = l_Dictionary_0.map(v110.byMessageId, function(v112) --[[ Line: 560 ]]
                -- upvalues: l_Dictionary_0 (ref), v111 (copy)
                if v112.shouldOverrideBubbleChatSettings then
                    return v112;
                else
                    return l_Dictionary_0.join(v112, {
                        isVisibleInBubbleChat = v111.value and v112.isVisibleInChatWindow
                    });
                end;
            end);
            return l_Dictionary_0.join(v110, {
                byMessageId = v113, 
                isBubbleChatEnabled = v111.value
            });
        end;
    end, 
    [l_ChatWindowMessagesCleared_0.name] = function(v114, _) --[[ Line: 575 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v117 = l_Dictionary_0.map(v114.byMessageId, function(v116) --[[ Line: 576 ]]
            -- upvalues: l_Dictionary_0 (ref)
            return l_Dictionary_0.join(v116, {
                isVisibleInChatWindow = false
            });
        end);
        return l_Dictionary_0.join(v114, {
            windowMessagesInOrder = {}, 
            windowMessagesInOrderByTabId = {}, 
            byMessageId = v117
        });
    end, 
    [v23.name] = v72, 
    [v24.name] = v79, 
    [v25.name] = function(v118, v119) --[[ Line: 485 ]] --[[ Name: mapByMessageIdInOrderLegacyBubbleChat ]]
        -- upvalues: v31 (copy), v63 (copy)
        if not v31.ConsolidateBubbleChat then
            return v118;
        else
            local l_messageData_0 = v119.messageData;
            local v121 = if l_messageData_0.timestamp then DateTime.fromUnixTimestampMillis(l_messageData_0.timestamp) else DateTime.now();
            local v122 = {
                userId = l_messageData_0.userId, 
                prefixText = "", 
                text = l_messageData_0.text, 
                messageId = l_messageData_0.id, 
                status = Enum.TextChatMessageStatus.Success, 
                timestamp = v121, 
                partOrModel = l_messageData_0.adornee, 
                shouldOverrideBubbleChatSettings = true, 
                isVisibleInBubbleChat = true, 
                isVisibleInChatWindow = false
            };
            return v63(v118, v122);
        end;
    end, 
    [v26.name] = function(v123, v124) --[[ Line: 590 ]]
        -- upvalues: v31 (copy), l_Dictionary_0 (copy), v28 (copy), l_List_0 (copy)
        if not v31.ConsolidateBubbleChat then
            return v123;
        else
            local l_byMessageId_3 = v123.byMessageId;
            local l_messagesBySenderId_1 = v123.messagesBySenderId;
            local l_messageId_2 = v124.messageId;
            local l_newText_0 = v124.newText;
            if l_byMessageId_3[l_messageId_2] then
                local v129 = l_byMessageId_3[l_messageId_2];
                v129.text = l_newText_0;
                l_byMessageId_3 = l_Dictionary_0.join(l_byMessageId_3, {
                    [l_messageId_2] = v129
                });
                if v28() then
                    local l_userId_1 = v129.userId;
                    if l_userId_1 and l_messagesBySenderId_1[l_userId_1] then
                        local v133 = l_List_0.findWhere(l_messagesBySenderId_1[l_userId_1], function(v131, _) --[[ Line: 609 ]]
                            -- upvalues: l_messageId_2 (copy)
                            return v131.messageId == l_messageId_2;
                        end);
                        if v133 and v133 > 0 then
                            l_messagesBySenderId_1 = l_Dictionary_0.join(l_messagesBySenderId_1, {
                                [l_userId_1] = l_List_0.set(l_messagesBySenderId_1[l_userId_1], v133, v129)
                            });
                        end;
                    end;
                end;
            end;
            if v28() then
                return (l_Dictionary_0.join(v123, {
                    byMessageId = l_byMessageId_3, 
                    messagesBySenderId = l_messagesBySenderId_1
                }));
            else
                return (l_Dictionary_0.set(v123, "byMessageId", l_byMessageId_3));
            end;
        end;
    end
});