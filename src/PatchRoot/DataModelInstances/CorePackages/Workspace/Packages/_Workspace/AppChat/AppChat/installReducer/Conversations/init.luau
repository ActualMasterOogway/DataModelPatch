local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Conversations);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.HasUnreadMessages);
local v9 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchedOldestMessage);
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchingOlderMessages);
local l_MessageFailedToSend_0 = v6.Actions.MessageFailedToSend;
local l_MessageModerated_0 = v6.Actions.MessageModerated;
local v13 = require(l_script_FirstAncestor_0.Conversations.Actions.ReadConversation);
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedConversation);
local l_ReceivedMessages_0 = v6.Actions.ReceivedMessages;
local v16 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v17 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v18 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local l_SendingMessage_0 = v6.Actions.SendingMessage;
local l_SentMessage_0 = v6.Actions.SentMessage;
local v21 = require(l_script_FirstAncestor_0.Conversations.Actions.SetConversationLoadingStatus);
local v22 = require(l_script_FirstAncestor_0.Conversations.Actions.SetPinnedGameForConversation);
local v23 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserLeavingConversation);
local v24 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserTyping);
local v25 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v26 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v27 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v28 = require(l_script_FirstAncestor_0.Http.NetworkingBlocking);
local v29 = require(l_script_FirstAncestor_0.Models.Conversation);
local v30 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local v34 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v35 = require(l_script_FirstAncestor_0.Utils.addConversation);
local l_getFFlagAppChatPCMFixBlocking_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatPCMFixBlocking;
local v37 = require(script.Parent.updateConversationReducer);
local v38 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatHiddenMessages);
local v39 = require(l_script_FirstAncestor_0.Utils.getOneToOneConversationIdFromFriendId);
local function v46(v40, v41) --[[ Line: 50 ]] --[[ Name: markConversationAndMessagesAsRead ]]
    -- upvalues: l_Immutable_0 (copy)
    local v42 = v40[v41];
    if not v42 then
        warn("Conversation " .. v41 .. " not found in ReadConversation reducer");
        return v40;
    else
        assert(v42, "FFlagLuauTinyControlFlowAnalysis");
        local v44 = v42.messages:Map(function(v43) --[[ Line: 59 ]]
            -- upvalues: l_Immutable_0 (ref)
            if v43.read then
                return v43;
            else
                return l_Immutable_0.Set(v43, "read", true);
            end;
        end);
        local v45 = l_Immutable_0.Set(v42, "messages", v44);
        v45 = l_Immutable_0.Set(v45, "hasUnreadMessages", false);
        return (l_Immutable_0.Set(v40, v45.id, v45));
    end;
end;
local function v69(v47, v48, v49) --[[ Line: 75 ]] --[[ Name: addMessagesToConversation ]]
    -- upvalues: v38 (copy), l_Immutable_0 (copy), l_OrderedMap_0 (copy)
    local v50 = v47[v48];
    if v50 then
        local v51 = nil;
        local l_previewMessageId_0 = v50.previewMessageId;
        local v53 = 0;
        if v38() and l_previewMessageId_0 and v50.messages then
            local v54 = v50.messages:Get(l_previewMessageId_0);
            if v54 then
                v53 = v54.sent:GetUnixTimestamp();
            end;
        end;
        for v55 = 1, #v49.messages do
            local v56 = v49.messages[v55];
            local v57 = v50.messages:Get(v56.id);
            if v57 then
                if v51 then
                    v51.previousMessageId = v57.id;
                end;
                if v56.previousMessageId == nil and v57.previousMessageId ~= nil then
                    v56.previousMessageId = v57.previousMessageId;
                end;
                v56.read = v56.read or v57.read;
            elseif v38() and v56.isPreviewable and v53 < v56.sent:GetUnixTimestamp() then
                l_previewMessageId_0 = v56.id;
                v53 = v56.sent:GetUnixTimestamp();
            end;
            v51 = v56;
        end;
        if v38() then
            v50 = l_Immutable_0.JoinDictionaries(v50, {
                previewMessageId = l_previewMessageId_0
            });
        end;
        local v58 = l_OrderedMap_0.Insert(v50.messages, unpack(v49.messages));
        if v49.exclusiveStartMessageId and #v49.messages > 0 and v58:Get(v49.exclusiveStartMessageId) then
            local v59 = v49.messages[1];
            local v60 = v58:Get(v49.exclusiveStartMessageId);
            v58 = v58:Insert((l_Immutable_0.Set(v60, "previousMessageId", v59.id)));
        end;
        if v38() then
            local v61 = l_previewMessageId_0 and v58 and v58:Get(l_previewMessageId_0);
            local l_lastUpdated_0 = v50.lastUpdated;
            if v61 then
                l_lastUpdated_0 = (l_lastUpdated_0 and l_lastUpdated_0:GetUnixTimestamp() or 0) < v61.sent:GetUnixTimestamp() and v61.sent or v50.lastUpdated;
            end;
            local v63 = v49.shouldMarkConversationUnread or v50.hasUnreadMessages;
            local v64 = l_Immutable_0.JoinDictionaries(v50, {
                messages = v58, 
                lastUpdated = l_lastUpdated_0, 
                hasUnreadMessages = v63, 
                nextCursor = v49.nextCursor, 
                previousCursor = v49.previousCursor
            });
            v64 = l_Immutable_0.Set(v64, "usersTyping", {});
            return l_Immutable_0.Set(v47, v64.id, v64);
        else
            local v65 = v58.keys[#v58.keys];
            v51 = v58.values[v65];
            if v51 ~= nil then
                local v66 = (v50.lastUpdated and v50.lastUpdated:GetUnixTimestamp() or 0) < v51.sent:GetUnixTimestamp() and v51.sent or v50.lastUpdated;
                local v67 = v49.shouldMarkConversationUnread or v50.hasUnreadMessages;
                local v68 = l_Immutable_0.JoinDictionaries(v50, {
                    messages = v58, 
                    lastUpdated = v66, 
                    hasUnreadMessages = v67, 
                    nextCursor = v49.nextCursor, 
                    previousCursor = v49.previousCursor
                });
                v68 = l_Immutable_0.Set(v68, "usersTyping", {});
                return l_Immutable_0.Set(v47, v68.id, v68);
            else
                return v47;
            end;
        end;
    else
        return v47;
    end;
end;
local function v78(v70, v71, v72) --[[ Line: 200 ]] --[[ Name: addParticipantMetadataToConversation ]]
    -- upvalues: l_Immutable_0 (copy)
    local v73 = v70[v71];
    if not v73 then
        return v70;
    else
        local v74 = {};
        for v75, v76 in v72 do
            v74[tostring(v75)] = {
                isPending = v76.is_pending
            };
        end;
        local v77 = l_Immutable_0.JoinDictionaries(v73, {
            participantMetadata = v74
        });
        return (l_Immutable_0.Set(v70, v77.id, v77));
    end;
end;
local function _(v79, v80) --[[ Line: 229 ]] --[[ Name: messagesFromResponse ]]
    -- upvalues: l_Functional_0 (copy), v34 (copy)
    if not v80 then
        return {};
    else
        local v81 = nil;
        return (l_Functional_0.MapReverse(v80, function(v82) --[[ Line: 236 ]]
            -- upvalues: v34 (ref), v79 (copy), v81 (ref)
            local v83 = v34.fromWeb(v82, v79, v81);
            v81 = v83.id;
            return v83;
        end));
    end;
end;
local function v92(v85, v86) --[[ Line: 244 ]] --[[ Name: messagesFromResponseOfChannelsApi ]]
    -- upvalues: v34 (copy)
    if not v86 then
        return {};
    else
        local v87 = nil;
        local v88 = {};
        for v89 = #v86, 1, -1 do
            local v90 = v86[v89];
            local v91 = v34.fromChannelsApi(v90, v85, v87);
            if v91 then
                table.insert(v88, v91);
                v87 = v91.id;
            end;
        end;
        return v88;
    end;
end;
local function v95(v93) --[[ Line: 266 ]] --[[ Name: getMessagesFromConversationResponse ]]
    -- upvalues: l_Immutable_0 (copy)
    local v94 = v93.messages or {};
    if v93.preview_message then
        v94 = l_Immutable_0.JoinLists({
            v93.preview_message
        }, v94);
    end;
    return v94;
end;
local function _(v96) --[[ Line: 277 ]] --[[ Name: isMessageFromSelf ]]
    -- upvalues: l_Players_0 (copy)
    local v97 = v96 and v96[#v96] or nil;
    return v97 and v97.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false;
end;
local function v106(v99, v100) --[[ Line: 283 ]] --[[ Name: getShouldMarkConversationUnread ]]
    -- upvalues: l_Players_0 (copy)
    if not v99 or not v99.messages or not v100 then
        return false;
    else
        local v101 = v99.messages.keys[#v99.messages.keys];
        local v102 = v99.messages.values[v101];
        local v103 = v102 and v102.sent and v102.sent:GetUnixTimestamp() or 0;
        for v104 = #v100, 1, -1 do
            local v105 = v100[v104];
            if v105 then
                if v105.sent:GetUnixTimestamp() <= v103 then
                    return false;
                elseif v105.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId) and v105.isBadgeable then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return v4.createReducer({}, {
    [v14.name] = function(v107, v108) --[[ Line: 320 ]]
        -- upvalues: v37 (copy)
        return v37(v107, v108.conversation);
    end, 
    [v27.StartGroupConversation.Succeeded.name] = function(v109, v110) --[[ Line: 323 ]]
        -- upvalues: v29 (copy), v37 (copy)
        local l_responseBody_0 = v110.responseBody;
        local v112 = v29.fromWeb(l_responseBody_0.conversation);
        return v37(v109, v112);
    end, 
    [v27.StartOneToOneConversation.Succeeded.name] = function(v113, v114) --[[ Line: 328 ]]
        -- upvalues: v29 (copy), v37 (copy)
        local l_responseBody_1 = v114.responseBody;
        local v116 = v29.fromWeb(l_responseBody_1.conversation);
        return v37(v113, v116);
    end, 
    [v3.rodux.CreateConversation.Succeeded.name] = function(v117, v118) --[[ Line: 333 ]]
        -- upvalues: v30 (copy), v37 (copy)
        local l_responseBody_2 = v118.responseBody;
        if l_responseBody_2 and l_responseBody_2.conversations and l_responseBody_2.conversations[1] and l_responseBody_2.conversations[1].status == "success" then
            local v120 = v30.fromChannelsApi(l_responseBody_2.conversations[1]);
            v117 = v37(v117, v120);
        end;
        return v117;
    end, 
    [v3.rodux.DuplicateConversation.Succeeded.name] = function(v121, v122) --[[ Line: 347 ]]
        -- upvalues: v30 (copy), v35 (copy)
        local l_responseBody_3 = v122.responseBody;
        if l_responseBody_3 and l_responseBody_3.conversations and l_responseBody_3.conversations[1] then
            local v124 = v30.fromChannelsApi(l_responseBody_3.conversations[1]);
            v121 = v35(v121, v124);
        end;
        return v121;
    end, 
    [l_ReceivedMessages_0.name] = function(v125, v126) --[[ Line: 356 ]]
        -- upvalues: v69 (copy)
        return v69(v125, v126.conversationId, v126);
    end, 
    [l_SendingMessage_0.name] = function(v127, v128) --[[ Line: 359 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v129 = v127[v128.conversationId];
        if v129 then
            local v130 = l_OrderedMap_0.Insert(v129.sendingMessages, v128.message);
            local v131 = l_Immutable_0.Set(v129, "sendingMessages", v130);
            v127 = l_Immutable_0.Set(v127, v131.id, v131);
        end;
        return v127;
    end, 
    [l_SentMessage_0.name] = function(v132, v133) --[[ Line: 370 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v134 = v132[v133.conversationId];
        if v134 then
            local v135 = l_OrderedMap_0.Delete(v134.sendingMessages, v133.messageId);
            local v136 = l_Immutable_0.Set(v134, "sendingMessages", v135);
            v132 = l_Immutable_0.Set(v132, v136.id, v136);
        end;
        return v132;
    end, 
    [v18.name] = function(v137, v138) --[[ Line: 381 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_0 = v138.conversationId;
        local v140 = v137[l_conversationId_0];
        if v140 then
            local v141 = l_Immutable_0.JoinDictionaries(v140, {
                lastUpdated = v138.lastUpdated, 
                title = v138.title, 
                isDefaultTitle = v138.isDefaultTitle
            });
            v137 = l_Immutable_0.Set(v137, l_conversationId_0, v141);
        end;
        return v137;
    end, 
    [v8.name] = function(v142, v143) --[[ Line: 396 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v144 = v143.conversation and v142[v143.conversation.id];
        if v144 then
            local v145 = l_Immutable_0.Set(v144, "hasUnreadMessages", true);
            v142 = l_Immutable_0.Set(v142, v143.conversation.id, v145);
        end;
        return v142;
    end, 
    [v7.name] = function(v146, v147) --[[ Line: 405 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_1 = v147.conversationId;
        local l_participants_0 = v147.participants;
        local v150 = v146[l_conversationId_1];
        if v150 then
            local v151 = l_Immutable_0.JoinDictionaries(v150, {
                participants = l_participants_0, 
                lastUpdated = v147.lastUpdated, 
                title = v147.title
            });
            v146 = l_Immutable_0.Set(v146, l_conversationId_1, v151);
        end;
        return v146;
    end, 
    [v16.name] = function(v152, v153) --[[ Line: 421 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_2 = v153.conversationId;
        return l_Immutable_0.Set(v152, l_conversationId_2, nil);
    end, 
    [v24.name] = function(v155, v156) --[[ Line: 425 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v157 = v155[v156.conversationId];
        if v157 then
            local l_usersTyping_0 = v157.usersTyping;
            local v159 = l_Immutable_0.Set(l_usersTyping_0, v156.userId, v156.value);
            local v160 = l_Immutable_0.Set(v157, "usersTyping", v159);
            v155 = l_Immutable_0.Set(v155, v160.id, v160);
        end;
        return v155;
    end, 
    [v10.name] = function(v161, v162) --[[ Line: 436 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v163 = v161[v162.conversationId];
        if v163 then
            local v164 = l_Immutable_0.Set(v163, "fetchingOlderMessages", v162.fetchingOlderMessages);
            v161 = l_Immutable_0.Set(v161, v164.id, v164);
        end;
        return v161;
    end, 
    [v9.name] = function(v165, v166) --[[ Line: 445 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v167 = v165[v166.conversationId];
        if v167 then
            local v168 = l_Immutable_0.Set(v167, "fetchedOldestMessage", v166.fetchedOldestMessage);
            return l_Immutable_0.Set(v165, v168.id, v168);
        else
            return v165;
        end;
    end, 
    [v13.name] = function(v169, v170) --[[ Line: 454 ]]
        -- upvalues: v46 (copy)
        return (v46(v169, v170.conversationId));
    end, 
    [l_MessageModerated_0.name] = function(v171, v172) --[[ Line: 457 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v173 = v171[v172.conversationId];
        if v173 then
            local v174 = v173.sendingMessages:Get(v172.messageId);
            if v174 then
                local v175 = l_Immutable_0.Set(v174, "moderated", true);
                local v176 = v173.sendingMessages:Insert(v175);
                local v177 = l_Immutable_0.Set(v173, "sendingMessages", v176);
                v171 = l_Immutable_0.Set(v171, v177.id, v177);
            end;
        end;
        return v171;
    end, 
    [l_MessageFailedToSend_0.name] = function(v178, v179) --[[ Line: 471 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v180 = v178[v179.conversationId];
        if v180 then
            local v181 = v180.sendingMessages:Get(v179.messageId);
            if v181 then
                local v182 = l_Immutable_0.Set(v181, "failed", true);
                local v183 = v180.sendingMessages:Insert(v182);
                local v184 = l_Immutable_0.Set(v180, "sendingMessages", v183);
                v178 = l_Immutable_0.Set(v178, v184.id, v184);
            end;
        end;
        return v178;
    end, 
    [v21.name] = function(v185, v186) --[[ Line: 485 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v187 = v185[v186.conversationId];
        if v187 then
            local v188 = l_Immutable_0.Set(v187, "initialLoadingStatus", v186.value);
            return l_Immutable_0.Set(v185, v188.id, v188);
        else
            return v185;
        end;
    end, 
    [v23.name] = function(v189, v190) --[[ Line: 494 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v191 = v189[v190.id];
        if v191 then
            local v192 = l_Immutable_0.Set(v191, "isUserLeaving", v190.isLeaving);
            v189 = l_Immutable_0.Set(v189, v192.id, v192);
        end;
        return v189;
    end, 
    [v22.name] = function(v193, v194) --[[ Line: 502 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_3 = v194.conversationId;
        local v196 = v193[l_conversationId_3];
        if v196 then
            local v197 = {
                rootPlaceId = v194.rootPlaceId, 
                universeId = v194.universeId
            };
            local v198 = l_Immutable_0.JoinDictionaries(v196, {
                pinnedGame = v197
            });
            v193 = l_Immutable_0.Set(v193, l_conversationId_3, v198);
        end;
        return v193;
    end, 
    [v27.GetUserConversations.Succeeded.name] = function(v199, v200) --[[ Line: 520 ]]
        -- upvalues: v29 (copy), v37 (copy)
        local l_responseBody_4 = v200.responseBody;
        for _, v203 in ipairs(l_responseBody_4) do
            local v204 = v29.fromWeb(v203);
            v199 = v37(v199, v204);
        end;
        return v199;
    end, 
    [v3.rodux.GetUserConversations.Succeeded.name] = function(v205, v206) --[[ Line: 529 ]]
        -- upvalues: v30 (copy), v37 (copy), v38 (copy), v95 (copy), v5 (copy), v34 (copy), v69 (copy)
        local l_responseBody_5 = v206.responseBody;
        if l_responseBody_5 and l_responseBody_5.conversations then
            for _, v209 in l_responseBody_5.conversations do
                local v210 = v30.fromChannelsApi(v209);
                v205 = v37(v205, v210);
                local v211 = if v38() then v95(v209) else v209.messages;
                if v211 and #v211 > 0 then
                    local v213 = {
                        messages = v5.Array.map(v211, function(v212) --[[ Line: 541 ]]
                            -- upvalues: v34 (ref), v210 (copy)
                            return v34.fromChannelsApi(v212, v210.id);
                        end)
                    };
                    v205 = v69(v205, v210.id, v213);
                end;
            end;
        end;
        return v205;
    end, 
    [v27.GetConversations.Succeeded.name] = function(v214, v215) --[[ Line: 556 ]]
        -- upvalues: v29 (copy), v37 (copy)
        local l_responseBody_6 = v215.responseBody;
        for _, v218 in ipairs(l_responseBody_6) do
            local v219 = v29.fromWeb(v218);
            v214 = v37(v214, v219);
        end;
        return v214;
    end, 
    [v3.rodux.GetOlderMessages.Succeeded.name] = function(v220, v221) --[[ Line: 565 ]]
        -- upvalues: v92 (copy), v69 (copy), l_Immutable_0 (copy)
        local l_conversation_id_0 = v221.queryArgs.conversation_id;
        local l_responseBody_7 = v221.responseBody;
        local v224 = {};
        local v225 = v220[l_conversation_id_0];
        if not v225 then
            return v220;
        else
            assert(v225, "FFlagLuauTinyControlFlowAnalysis");
            local v226 = v225.previousCursor or nil;
            local v227 = v225.nextCursor or nil;
            if not l_responseBody_7 then
                return v220;
            else
                v224 = v92(l_conversation_id_0, l_responseBody_7.messages);
                local v228 = if l_responseBody_7.next_cursor == "" then nil else l_responseBody_7.next_cursor;
                if v228 then
                    v227 = v228;
                end;
                if v226 == nil then
                    v226 = if l_responseBody_7.previous_cursor == "" then nil else l_responseBody_7.previous_cursor;
                end;
                local v229 = {
                    messages = v224, 
                    nextCursor = v227, 
                    previousCursor = v226
                };
                v220 = v69(v220, l_conversation_id_0, v229);
                if not v228 then
                    local v230 = v220[l_conversation_id_0];
                    if v230 then
                        local v231 = l_Immutable_0.Set(v230, "fetchedOldestMessage", true);
                        v220 = l_Immutable_0.Set(v220, v231.id, v231);
                    end;
                end;
                return v220;
            end;
        end;
    end, 
    [v3.rodux.GetNewerMessages.Succeeded.name] = function(v232, v233) --[[ Line: 618 ]]
        -- upvalues: v92 (copy), v38 (copy), v106 (copy), l_Players_0 (copy), v69 (copy)
        local l_conversation_id_1 = v233.queryArgs.conversation_id;
        local l_responseBody_8 = v233.responseBody;
        local v236 = v232[l_conversation_id_1];
        if not v236 then
            return v232;
        else
            assert(v236, "FFlagLuauTinyControlFlowAnalysis");
            local v237 = v236.previousCursor or nil;
            local v238 = v236.nextCursor or nil;
            if not l_responseBody_8 then
                return v232;
            else
                local v239 = v92(l_conversation_id_1, l_responseBody_8.messages);
                if v238 == nil then
                    v238 = if l_responseBody_8.next_cursor == "" then nil else l_responseBody_8.next_cursor;
                end;
                local v240 = if l_responseBody_8.previous_cursor == "" then nil else l_responseBody_8.previous_cursor;
                if v240 then
                    v237 = v240;
                end;
                local v241;
                if v38() then
                    v241 = v106(v236, v239);
                else
                    local v242 = v239 and v239[#v239] or nil;
                    v241 = not (v242 and v242.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false);
                end;
                local v243 = {
                    messages = v239, 
                    nextCursor = v238, 
                    previousCursor = v237, 
                    shouldMarkConversationUnread = v241
                };
                return (v69(v232, l_conversation_id_1, v243));
            end;
        end;
    end, 
    [v27.GetMessages.Succeeded.name] = function(v244, v245) --[[ Line: 662 ]]
        -- upvalues: l_Functional_0 (copy), v34 (copy), l_Players_0 (copy), v69 (copy), l_Immutable_0 (copy)
        local l_conversationId_4 = v245.queryArgs.conversationId;
        local l_responseBody_9 = v245.responseBody;
        local v248;
        if not l_responseBody_9 then
            v248 = {};
        else
            local v249 = nil;
            do
                local l_v249_0 = v249;
                v248 = l_Functional_0.MapReverse(l_responseBody_9, function(v251) --[[ Line: 236 ]]
                    -- upvalues: v34 (ref), l_conversationId_4 (copy), l_v249_0 (ref)
                    local v252 = v34.fromWeb(v251, l_conversationId_4, l_v249_0);
                    l_v249_0 = v252.id;
                    return v252;
                end);
            end;
        end;
        l_responseBody_9 = {
            messages = v248
        };
        local v253 = v248 and v248[#v248] or nil;
        l_responseBody_9.shouldMarkConversationUnread = not (v253 and v253.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false);
        v244 = v69(v244, l_conversationId_4, l_responseBody_9);
        local l_pageSize_0 = v245.queryArgs.pageSize;
        if l_pageSize_0 and #v248 < l_pageSize_0 then
            local v255 = v244[l_conversationId_4];
            if not v255 then
                return v244;
            else
                assert(v255, "FFlagLuauTinyControlFlowAnalysis");
                v253 = v244[l_conversationId_4];
                if v253 then
                    local v256 = l_Immutable_0.Set(v253, "fetchedOldestMessage", true);
                    v244 = l_Immutable_0.Set(v244, v256.id, v256);
                end;
            end;
        end;
        return v244;
    end, 
    [v27.GetLatestMessages.Succeeded.name] = function(v257, v258) --[[ Line: 688 ]]
        -- upvalues: l_Functional_0 (copy), v34 (copy), v69 (copy)
        local l_responseBody_10 = v258.responseBody;
        for _, v261 in ipairs(l_responseBody_10) do
            local v262 = tostring(v261.conversationId);
            local l_chatMessages_0 = v261.chatMessages;
            local v264;
            if not l_chatMessages_0 then
                v264 = {};
            else
                local v265 = nil;
                do
                    local l_v265_0 = v265;
                    v264 = l_Functional_0.MapReverse(l_chatMessages_0, function(v267) --[[ Line: 236 ]]
                        -- upvalues: v34 (ref), v262 (copy), l_v265_0 (ref)
                        local v268 = v34.fromWeb(v267, v262, l_v265_0);
                        l_v265_0 = v268.id;
                        return v268;
                    end);
                end;
            end;
            l_chatMessages_0 = {
                messages = v264
            };
            v257 = v69(v257, v262, l_chatMessages_0);
        end;
        return v257;
    end, 
    [v3.rodux.GetConversationDetails.Succeeded.name] = function(v269, v270) --[[ Line: 700 ]]
        -- upvalues: v30 (copy), v37 (copy), v38 (copy), v95 (copy), v5 (copy), v34 (copy), v69 (copy)
        local v271 = v270.responseBody.conversations[1];
        if not v271 then
            return v269;
        else
            local v272 = v30.fromChannelsApi(v271);
            v269 = v37(v269, v272);
            local v273 = if v38() then v95(v271) else v271.messages;
            if v273 and #v273 > 0 then
                local v275 = {
                    messages = v5.Array.map(v273, function(v274) --[[ Line: 716 ]]
                        -- upvalues: v34 (ref), v272 (copy)
                        return v34.fromChannelsApi(v274, v272.id);
                    end)
                };
                v269 = v69(v269, v272.id, v275);
            end;
            return v269;
        end;
    end, 
    [v3.rodux.MultiGetConversationDetails.Succeeded.name] = function(v276, v277) --[[ Line: 729 ]]
        -- upvalues: v30 (copy), v37 (copy), v38 (copy), v95 (copy), v5 (copy), v34 (copy), v69 (copy)
        local l_responseBody_11 = v277.responseBody;
        if not l_responseBody_11 or not l_responseBody_11.conversations then
            return v276;
        else
            for _, v280 in l_responseBody_11.conversations do
                local v281 = v30.fromChannelsApi(v280);
                v276 = v37(v276, v281);
                local v282 = if v38() then v95(v280) else v280.messages;
                if v282 and #v282 > 0 then
                    local v284 = {
                        messages = v5.Array.map(v282, function(v283) --[[ Line: 743 ]]
                            -- upvalues: v34 (ref), v281 (copy)
                            return v34.fromChannelsApi(v283, v281.id);
                        end)
                    };
                    v276 = v69(v276, v281.id, v284);
                end;
            end;
            return v276;
        end;
    end, 
    [v3.rodux.MarkConversation.Succeeded.name] = function(v285, v286) --[[ Line: 756 ]]
        -- upvalues: v46 (copy)
        local v287 = v286.postBody.conversation_ids[1];
        return (v46(v285, v287));
    end, 
    [v27.MarkAsRead.Succeeded.name] = function(v288, v289) --[[ Line: 760 ]]
        -- upvalues: v46 (copy)
        local l_conversationId_5 = v289.postBody.conversationId;
        return (v46(v288, l_conversationId_5));
    end, 
    [v3.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(v291, v292) --[[ Line: 764 ]]
        -- upvalues: v78 (copy)
        for v293, v294 in v292.responseBody.conversation_participants_metadata do
            v291 = v78(v291, v293, v294.participants_metadata);
        end;
        return v291;
    end, 
    [v17.name] = function(_, _) --[[ Line: 779 ]]
        return {};
    end, 
    [v25.name] = function(v297, v298) --[[ Line: 782 ]]
        -- upvalues: l_Immutable_0 (copy)
        if v297[v298.oldFriendConversationId] then
            return l_Immutable_0.Set(v297, v298.oldFriendConversationId, nil);
        else
            return v297;
        end;
    end, 
    [v26.name] = function(v299, v300) --[[ Line: 789 ]]
        -- upvalues: v30 (copy), l_Immutable_0 (copy)
        local v301 = if v300.userId1 ~= "localUserId" then v300.userId1 else if v300.userId2 ~= "localUserId" then v300.userId2 else nil;
        if not v301 then
            return v299;
        else
            assert(v301, "FFlagLuauTinyControlFlowAnalysis");
            local v302 = v30.getFriendConversationId({
                v301
            });
            if v299[v302] then
                return l_Immutable_0.Set(v299, v302, nil);
            else
                return v299;
            end;
        end;
    end, 
    [v28.BlockUserById.Succeeded.name] = l_getFFlagAppChatPCMFixBlocking_0() and function(v303, v304) --[[ Line: 807 ]]
        -- upvalues: v39 (copy), l_Immutable_0 (copy), v30 (copy)
        local v305 = tostring(v304.namedIds.users);
        if not v305 then
            return v303;
        else
            local v306 = v39(v303, v305);
            local l_v303_0 = v303;
            if v306 and v303[v306] then
                l_v303_0 = l_Immutable_0.Set(l_v303_0, v306, nil);
            end;
            local v308 = v30.getFriendConversationId({
                v305
            });
            if v308 and v303[v308] then
                l_v303_0 = l_Immutable_0.Set(v303, v308, nil);
            end;
            return l_v303_0;
        end;
    end or nil
});