local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.AppChatNetworking);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useMemo_0 = v3.useMemo;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v17 = require(l_script_FirstAncestor_0.Logger):new("AppChat.Realtime");
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local v19 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v20 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v21 = require(l_script_FirstAncestor_0.Actions.FetchChatSettingsCompleted);
local v22 = require(l_script_FirstAncestor_0.Http.RoduxAliases);
local v23 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedUserTyping);
local v24 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v25 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local v26 = require(l_script_FirstAncestor_0.Actions.SetConnectionState);
local v27 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v28 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v29 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v30 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local v31 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v32 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages);
local v33 = require(l_script_FirstAncestor_0.EnumScreens);
local l_getNewMessages_0 = v32.Thunks.getNewMessages;
local v35 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateAndRefreshConversations);
local v36 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v37 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllUserPresences);
local v38 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v39 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v40 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllFriendsAsync);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v42 = require(l_script_FirstAncestor_0.Conversations.Thunks.getUnfilteredThreadsEligibility);
local v43 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
local v44 = require(script.Parent.CommunicationChannelsTypes);
local _ = require(script.Parent.UnfilteredThreadsTypes);
local _ = require(script.Parent.ChatMigrationTypes);
local v47 = game:DefineFastFlag("ChatEventReceiverChannelTypeAllowlist", false);
local v48 = game:DefineFastFlag("EnableUnfriendChatDetailsBugfix", false);
local v49 = game:DefineFastFlag("AppChatHandleChannelArchived", false);
local l_getFFlagDebugUnfilteredThreads_0 = require(l_Parent_0.SharedFlags).getFFlagDebugUnfilteredThreads;
local v51 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
local v52 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatNewSettingsEndpoint);
local v53 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPersistentEventReceivers);
local v54 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local function v60(v55) --[[ Line: 65 ]] --[[ Name: chunkAndLogString ]]
    -- upvalues: v17 (copy)
    local v56 = {};
    for v57 = 1, #v55, 800 do
        table.insert(v56, v55:sub(v57, v57 + 800 - 1));
    end;
    for _, v59 in v56 do
        v17:debug(v59);
    end;
end;
local v61 = {
    handlesAppShellNotifications = true
};
ChatEventReceiver = function(v62) --[[ Line: 88 ]] --[[ Name: ChatEventReceiver ]]
    -- upvalues: l_useEffect_0 (copy), v17 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v6 (copy), l_useLocalUserId_0 (copy), v29 (copy), v30 (copy), v54 (copy), v31 (copy), l_useDispatch_0 (copy), v20 (copy), v52 (copy), v36 (copy), v39 (copy), v7 (copy), v21 (copy), v38 (copy), v40 (copy), v37 (copy), l_getNewMessages_0 (copy), v22 (copy), v23 (copy), v35 (copy), v24 (copy), v25 (copy), v26 (copy), v61 (copy), l_useRef_0 (copy), l_useLocalization_0 (copy), l_dependencyArray_0 (copy), v4 (copy), v33 (copy), l_FormFactor_0 (copy), v53 (copy), v48 (copy), v28 (copy), v18 (copy), v47 (copy), v44 (copy), v49 (copy), v19 (copy), v27 (copy), v51 (copy), l_useMemo_0 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), v60 (copy), v43 (copy), v42 (copy)
    l_useEffect_0(function() --[[ Line: 89 ]]
        -- upvalues: v17 (ref)
        v17:info("ChatEventReceiver mounted");
        return function() --[[ Line: 91 ]]
            -- upvalues: v17 (ref)
            v17:info("ChatEventReceiver unmounted");
        end;
    end, {});
    local v64 = l_useSelector_0(l_useCallback_0(function(v63) --[[ Line: 97 ]]
        return v63.ChatAppReducer.AppLoaded;
    end, {}));
    local v66 = l_useSelector_0(l_useCallback_0(function(v65) --[[ Line: 100 ]]
        return v65.ChatAppReducer.Conversations;
    end, {}));
    local v68 = l_useSelector_0(l_useCallback_0(function(v67) --[[ Line: 103 ]]
        return v67.FormFactor;
    end, {}));
    local v70 = l_useSelector_0(l_useCallback_0(function(v69) --[[ Line: 106 ]]
        return v69.Users;
    end, {}));
    local v71 = v6.isEmpty(v66);
    local v72 = l_useLocalUserId_0();
    local v73 = v29();
    local v74 = v30();
    local v75 = if v54() then v31() else nil;
    local v76 = l_useDispatch_0();
    local function v81(v77, v78, v79, v80) --[[ Line: 117 ]]
        -- upvalues: v76 (copy), v20 (ref)
        v76(v20(v77, v78, v79, v80));
    end;
    local function v82() --[[ Line: 120 ]]
        -- upvalues: v52 (ref), v76 (copy), v36 (ref), v39 (ref)
        if v52() then
            return v76(v36());
        else
            return v76(v36()):andThen(function() --[[ Line: 124 ]]
                -- upvalues: v76 (ref), v39 (ref)
                return v76(v39());
            end);
        end;
    end;
    local function v85() --[[ Line: 130 ]]
        -- upvalues: v52 (ref), v76 (copy), v7 (ref), v17 (ref)
        assert(not v52(), "Remove this function when FFlagAppChatNewSettingsEndpoint is enabled");
        return v76(v7.rodux.GetMetadata.API()):andThen(function(v83) --[[ Line: 136 ]]
            return v83.responseBody;
        end):catch(function(v84) --[[ Line: 139 ]]
            -- upvalues: v17 (ref)
            v17:warning("AppChatNetworking failure in RobloxEventReceiver->FetchChatSettings, Status: {}", (tostring(v84)));
            return {};
        end);
    end;
    local function _(v86) --[[ Line: 147 ]]
        -- upvalues: v52 (ref), v76 (copy), v21 (ref)
        assert(not v52(), "Remove this function when FFlagAppChatNewSettingsEndpoint is enabled");
        v76(v21(v86));
    end;
    local function v89(v88) --[[ Line: 154 ]]
        -- upvalues: v76 (copy), v38 (ref)
        return v76(v38(v88));
    end;
    local function v90() --[[ Line: 157 ]]
        -- upvalues: v76 (copy), v40 (ref)
        v76(v40());
    end;
    local function v91() --[[ Line: 160 ]]
        -- upvalues: v76 (copy), v37 (ref)
        spawn(function() --[[ Line: 161 ]]
            -- upvalues: v76 (ref), v37 (ref)
            v76(v37());
        end);
    end;
    local function v95(v92, v93, v94) --[[ Line: 165 ]]
        -- upvalues: v76 (copy), l_getNewMessages_0 (ref)
        return v76(l_getNewMessages_0(v92, v93, v94));
    end;
    local function _(v96, v97) --[[ Line: 168 ]]
        -- upvalues: v76 (copy), v22 (ref)
        v76(v22.Actions.AliasUpdated(v96, v97));
    end;
    local function v101(v99, v100) --[[ Line: 171 ]]
        -- upvalues: v76 (copy), v23 (ref)
        v76(v23(v99, v100));
    end;
    local function v102() --[[ Line: 175 ]]
        -- upvalues: v76 (copy), v35 (ref)
        v76(v35());
    end;
    local function v104(v103) --[[ Line: 179 ]]
        -- upvalues: v76 (copy), v24 (ref)
        v76(v24(v103));
    end;
    local function v109(v105, v106, v107, v108) --[[ Line: 182 ]]
        -- upvalues: v76 (copy), v25 (ref)
        v76(v25(v105, v106, v107, v108));
    end;
    local function _(v110) --[[ Line: 185 ]]
        -- upvalues: v76 (copy), v26 (ref)
        v76(v26(v110));
    end;
    local v112 = v6.Dictionary.join(v61, v62);
    local l_robloxEventReceiver_0 = v112.robloxEventReceiver;
    local v114 = l_useRef_0({});
    local v115 = l_useRef_0(Enum.ConnectionState.Connected);
    local v116 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
    });
    local l_networkErrorText_0 = v116.networkErrorText;
    local l_removedFromConversationToastTitle_0 = v116.removedFromConversationToastTitle;
    local v121 = l_useCallback_0(function(v119, v120) --[[ Line: 202 ]]
        -- upvalues: v114 (copy)
        assert(v114.current, "table");
        v114.current[v119] = v120;
    end, l_dependencyArray_0(v114.current));
    local v122 = l_useCallback_0(function() --[[ Line: 207 ]]
        -- upvalues: v112 (copy), v4 (ref), v33 (ref), l_networkErrorText_0 (copy)
        if v112.rnBypassActionSignal then
            v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v33.RoactChatToast, 
                params = {
                    toastProps = {
                        toastContent = {
                            toastTitle = l_networkErrorText_0
                        }
                    }
                }
            }));
        end;
    end, l_dependencyArray_0(v112.rnBypassActionSignal, l_networkErrorText_0));
    l_useEffect_0(function() --[[ Line: 223 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v121 (copy), v17 (ref), v76 (copy), v24 (ref), v112 (copy), v4 (ref), v68 (copy), l_FormFactor_0 (ref), v33 (ref), l_removedFromConversationToastTitle_0 (copy), v38 (ref), v25 (ref), v20 (ref), v71 (copy), l_getNewMessages_0 (ref), v23 (ref)
        local v143 = l_robloxEventReceiver_0:observeEvent("ChatNotifications", function(v123, v124, _) --[[ Line: 226 ]]
            -- upvalues: v121 (ref), v17 (ref), v76 (ref), v24 (ref), v112 (ref), v4 (ref), v68 (ref), l_FormFactor_0 (ref), v33 (ref), l_removedFromConversationToastTitle_0 (ref), v38 (ref), v25 (ref), v20 (ref), v71 (ref), l_getNewMessages_0 (ref), v23 (ref)
            v121("ChatNotifications", v123.SequenceNumber);
            local v126 = v123.Type or v124;
            v17:info("Received chat notification: {}", v126);
            local v127 = v123.ConversationId and tostring(v123.ConversationId) or "";
            if v126 == "RemovedFromConversation" or v126 == "ConversationRemoved" then
                v76(v24(v127));
                local l_activeConversationId_0 = v112.activeConversationId;
                if l_activeConversationId_0 ~= nil and tostring(l_activeConversationId_0) == v127 and v112.rnBypassActionSignal then
                    v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v68 == l_FormFactor_0.WIDE and v33.EmptyConversation or v33.ChatLanding
                    }));
                end;
                if v126 == "RemovedFromConversation" then
                    v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v33.RoactChatToast, 
                        params = {
                            toastProps = {
                                toastContent = {
                                    toastTitle = l_removedFromConversationToastTitle_0
                                }
                            }
                        }
                    }));
                    return;
                end;
            elseif v126 == "ConversationTitleChanged" or v126 == "ParticipantAdded" or v126 == "ParticipantLeft" then
                task.spawn(function() --[[ Line: 264 ]]
                    -- upvalues: v127 (copy), v76 (ref), v38 (ref), v126 (copy), v25 (ref), v20 (ref), v17 (ref)
                    v76(v38(v127)):andThen(function(v129) --[[ Line: 266 ]]
                        -- upvalues: v126 (ref), v127 (ref), v76 (ref), v25 (ref), v20 (ref)
                        local l_title_0 = v129.title;
                        local l_lastUpdated_0 = v129.lastUpdated;
                        if v126 == "ConversationTitleChanged" then
                            local l_v127_0 = v127;
                            local l_isDefaultTitle_0 = v129.isDefaultTitle;
                            v76(v25(l_v127_0, l_title_0, l_isDefaultTitle_0, l_lastUpdated_0));
                            return;
                        else
                            local l_v127_1 = v127;
                            local l_participants_0 = v129.participants;
                            v76(v20(l_v127_1, l_participants_0, l_title_0, l_lastUpdated_0));
                            return;
                        end;
                    end):catch(function(v136) --[[ Line: 287 ]]
                        -- upvalues: v17 (ref), v126 (ref)
                        v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v126, (tostring(v136)))));
                    end);
                end);
                return;
            elseif v126 == "AddedToConversation" or v126 == "NewConversation" then
                if v71 then
                    v17:debug((("Received %* event while loading conversation data"):format(v126)));
                    return;
                else
                    task.spawn(function() --[[ Line: 301 ]]
                        -- upvalues: v127 (copy), v76 (ref), v38 (ref), v17 (ref), v126 (copy)
                        v76(v38(v127)):catch(function(v137) --[[ Line: 302 ]]
                            -- upvalues: v17 (ref), v126 (ref)
                            v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v126, (tostring(v137)))));
                        end);
                    end);
                    return;
                end;
            elseif v126 == "NewMessage" then
                local v138 = tick();
                local _ = v76(l_getNewMessages_0(v127, false, v138));
                return;
            elseif v126 == "NewMessageBySelf" then
                local v140 = tick();
                local _ = v76(l_getNewMessages_0(v127, true, v140));
                return;
            elseif v126 == "ParticipantTyping" then
                local v142 = tostring(v123.UserId);
                v76(v23(v127, v142));
            end;
        end);
        return function() --[[ Line: 322 ]]
            -- upvalues: v143 (copy)
            if v143 and v143.disconnect then
                v143:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, v121, v112.activeConversationId, v112.rnBypassActionSignal, v71, v68, v70));
    l_useEffect_0(function() --[[ Line: 339 ]]
        -- upvalues: v53 (ref), v73 (copy), v112 (copy), v17 (ref), v4 (ref), v68 (copy), l_FormFactor_0 (ref), v33 (ref)
        if v53() and not v73 and v112.activeConversationId and v112.rnBypassActionSignal then
            v17:debug("Chat is disabled for our user, navigating away from active conversation");
            v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v68 == l_FormFactor_0.WIDE and v33.EmptyConversation or v33.ChatLanding
            }));
        end;
    end, {
        v73
    });
    local v144 = if v53() then if v112.activeConversationId then v66[v112.activeConversationId] else nil else nil;
    l_useEffect_0(function() --[[ Line: 356 ]]
        -- upvalues: v53 (ref), v74 (copy), v144 (copy), v112 (copy), v17 (ref), v4 (ref), v68 (copy), l_FormFactor_0 (ref), v33 (ref)
        if v53() and not v74 and v144 and v112.rnBypassActionSignal and v144.type == "group" then
            v17:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding");
            v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v68 == l_FormFactor_0.WIDE and v33.EmptyConversation or v33.ChatLanding
            }));
        end;
    end, l_dependencyArray_0(v74, v144));
    l_useEffect_0(function() --[[ Line: 374 ]]
        -- upvalues: v53 (ref), l_robloxEventReceiver_0 (copy), v17 (ref), v52 (ref), v76 (copy), v21 (ref), v112 (copy), v4 (ref), v68 (copy), l_FormFactor_0 (ref), v33 (ref), v82 (copy), v39 (ref)
        if v53() then
            return;
        else
            local v153 = l_robloxEventReceiver_0:observeEvent("ChatPrivacySettingsNotifications", function(v145, _) --[[ Line: 382 ]]
                -- upvalues: v17 (ref), v52 (ref), v76 (ref), v21 (ref), v112 (ref), v4 (ref), v68 (ref), l_FormFactor_0 (ref), v33 (ref), v82 (ref), v39 (ref)
                local l_Type_0 = v145.Type;
                v17:info("Received chat privacy settings notification: {}", l_Type_0);
                if l_Type_0 == "ChatDisabled" then
                    if not v52() then
                        local v148 = {
                            chatEnabled = false
                        };
                        assert(not v52(), "Remove this function when FFlagAppChatNewSettingsEndpoint is enabled");
                        v76(v21(v148));
                    end;
                    if v112.activeConversationId and v112.rnBypassActionSignal then
                        v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v68 == l_FormFactor_0.WIDE and v33.EmptyConversation or v33.ChatLanding
                        }));
                        return;
                    end;
                elseif l_Type_0 == "ChatEnabled" then
                    if not v52() then
                        local v149 = {
                            chatEnabled = true
                        };
                        assert(not v52(), "Remove this function when FFlagAppChatNewSettingsEndpoint is enabled");
                        v76(v21(v149));
                    end;
                    if v52() then
                        v82():andThen(function(_) --[[ Line: 406 ]]
                            -- upvalues: v76 (ref), v39 (ref)
                            return v76(v39());
                        end):catch(function(v151) --[[ Line: 409 ]]
                            -- upvalues: v17 (ref)
                            v17:warning("Failed to fetch chat data after receiving privacy setting notification: {}", (tostring(v151)));
                        end);
                        return;
                    else
                        v82():catch(function(v152) --[[ Line: 416 ]]
                            -- upvalues: v17 (ref)
                            v17:warning("Failed to fetch chat data after receiving privacy setting notification: {}", (tostring(v152)));
                        end);
                    end;
                end;
            end);
            return function() --[[ Line: 427 ]]
                -- upvalues: v153 (copy)
                if v153 and v153.disconnect then
                    v153:disconnect();
                end;
            end;
        end;
    end, l_dependencyArray_0(v76, v112.activeConversationId, v112.rnBypassActionSignal, v68));
    l_useEffect_0(function() --[[ Line: 434 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v76 (copy), v22 (ref)
        local v158 = l_robloxEventReceiver_0:observeEvent("UserTagChangeNotification", function(v154, _) --[[ Line: 435 ]]
            -- upvalues: v76 (ref), v22 (ref)
            if v154.Type == "UserTagUpdate" then
                local v156 = tostring(v154.UserId);
                local l_NewAlias_0 = v154.NewAlias;
                v76(v22.Actions.AliasUpdated(v156, l_NewAlias_0));
            end;
        end);
        return function() --[[ Line: 441 ]]
            -- upvalues: v158 (copy)
            if v158 and v158.disconnect then
                v158:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76));
    l_useEffect_0(function() --[[ Line: 449 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v17 (ref), v76 (copy), v35 (ref), v72 (copy), v48 (ref), v28 (ref), v144 (copy), v18 (ref), v6 (ref), v68 (copy), l_FormFactor_0 (ref), v33 (ref), v112 (copy), v4 (ref)
        local v168 = l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v159, _) --[[ Line: 450 ]]
            -- upvalues: v17 (ref), v76 (ref), v35 (ref), v72 (ref), v48 (ref), v28 (ref), v144 (ref), v18 (ref), v6 (ref), v68 (ref), l_FormFactor_0 (ref), v33 (ref), v112 (ref), v4 (ref)
            local l_Type_1 = v159.Type;
            v17:info("Received friendship notification: {}", l_Type_1);
            if l_Type_1 == "FriendshipCreated" then
                v76(v35());
                return;
            else
                if l_Type_1 == "FriendshipDestroyed" then
                    local v162 = nil;
                    if v159.EventArgs then
                        local v163 = tostring(v159.EventArgs.UserId1);
                        local v164 = tostring(v159.EventArgs.UserId2);
                        if v163 == v72 then
                            v163 = "localUserId";
                            v162 = if v48 then v164 else nil;
                        end;
                        if v164 == v72 then
                            v164 = "localUserId";
                            v162 = if v48 then v163 else nil;
                        end;
                        v76(v28({
                            userId1 = v163, 
                            userId2 = v164
                        }));
                    end;
                    do
                        local l_v162_0 = v162;
                        if v48 and v144 and v144.source == "friends" and v144.conversationType == v18.Type.ONE_TO_ONE_CONVERSATION and v6.List.findWhere(v144.participants, function(v166) --[[ Line: 483 ]]
                            -- upvalues: l_v162_0 (ref)
                            return v166 == l_v162_0;
                        end) then
                            local v167 = if v68 == l_FormFactor_0.WIDE then v33.EmptyConversation else v33.ChatLanding;
                            v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                                routeName = v167
                            }));
                        end;
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 497 ]]
            -- upvalues: v168 (copy)
            if v168 and v168.disconnect then
                v168:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, v102, v72, v68, v144, v112.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 514 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v17 (ref), v76 (copy), v24 (ref), v38 (ref), v112 (copy), v4 (ref), v33 (ref)
        local v175 = l_robloxEventReceiver_0:observeEvent("ChatMigration", function(v169, _) --[[ Line: 517 ]]
            -- upvalues: v17 (ref), v76 (ref), v24 (ref), v38 (ref), v112 (ref), v4 (ref), v33 (ref)
            local l_Type_2 = v169.Type;
            v17:info("Received chat migration notification: {}", l_Type_2);
            local v172 = nil;
            local v173 = nil;
            if l_Type_2 == "ConversationBackfilled" then
                v172 = v169.ConversationId;
                v173 = v169.ChannelId;
            elseif l_Type_2 == "ConversationReset" then
                v172 = v169.ChannelId;
                v173 = v169.ConversationId;
            else
                v17:warning((("ChatEventReceiver: unknown notification %*"):format(l_Type_2)));
                return;
            end;
            v76(v24(v172));
            v76(v38(v173)):catch(function(v174) --[[ Line: 535 ]]
                -- upvalues: v17 (ref), l_Type_2 (copy)
                v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(l_Type_2, (tostring(v174)))));
            end);
            if v112.activeConversationId and v172 and tostring(v112.activeConversationId) == v172 and v112.rnBypassActionSignal then
                v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                    routeName = v33.ChatConversation, 
                    params = {
                        conversationId = v173
                    }
                }));
            end;
        end);
        return function() --[[ Line: 557 ]]
            -- upvalues: v175 (copy)
            if v175 and v175.disconnect then
                v175:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, v112.activeConversationId, v112.rnBypassActionSignal, v89));
    local v178 = l_useCallback_0(function() --[[ Line: 572 ]]
        -- upvalues: v64 (copy), v52 (ref), v82 (copy), v17 (ref), v76 (copy), v35 (ref), v40 (ref), v37 (ref), v85 (copy)
        if v64 then
            if v52() then
                v82():andThen(function(v176) --[[ Line: 575 ]]
                    -- upvalues: v17 (ref), v76 (ref), v35 (ref), v40 (ref), v37 (ref)
                    if v176 then
                        v17:trace("Chat is enabled for our user, refreshing conversations");
                        v76(v35());
                        task.spawn(function() --[[ Line: 580 ]]
                            -- upvalues: v76 (ref), v40 (ref)
                            v76(v40());
                        end);
                        spawn(function() --[[ Line: 161 ]]
                            -- upvalues: v76 (ref), v37 (ref)
                            v76(v37());
                        end);
                        return;
                    else
                        v17:trace("Chat is disabled for our user, no need to refresh conversations");
                        return;
                    end;
                end);
                return;
            else
                v85():andThen(function(v177) --[[ Line: 589 ]]
                    -- upvalues: v17 (ref), v76 (ref), v35 (ref), v40 (ref), v37 (ref)
                    if v177.isChatEnabled then
                        v17:trace("Chat is enabled for our user, refreshing conversations");
                        v76(v35());
                        task.spawn(function() --[[ Line: 595 ]]
                            -- upvalues: v76 (ref), v40 (ref)
                            v76(v40());
                        end);
                        spawn(function() --[[ Line: 161 ]]
                            -- upvalues: v76 (ref), v37 (ref)
                            v76(v37());
                        end);
                        return;
                    else
                        v17:trace("Chat is disabled for our user, no need to refresh conversations");
                        return;
                    end;
                end);
            end;
        end;
    end, l_dependencyArray_0(v64, v85, v102, v90, v91, v82));
    l_useEffect_0(function() --[[ Line: 616 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v17 (ref), v76 (copy), v26 (ref), v115 (copy), v114 (copy), v64 (copy), v178 (copy)
        local v182 = l_robloxEventReceiver_0:observeEvent("signalR", function(v179, _, v181) --[[ Line: 619 ]]
            -- upvalues: v17 (ref), v76 (ref), v26 (ref), v115 (ref), v114 (ref), v64 (ref), v178 (ref)
            v17:info("SignalR connection state transitioned to {}", (tostring(v179)));
            v76(v26(v179));
            v115.current = v179;
            if v179 == Enum.ConnectionState.Connected and v181 and (v114.current == nil or v114.current.ChatNotifications ~= v181.ChatNotifications or v114.current.CommunicationChannels ~= v181.CommunicationChannels) then
                v17:trace("We missed some messages while we were disconnected. The chat app was previously {}", v64 and "loaded" or "unloaded");
                v178();
            end;
        end);
        return function() --[[ Line: 642 ]]
            -- upvalues: v182 (copy)
            if v182 and v182.disconnect then
                v182:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, v115, v114, v122, v64));
    l_useEffect_0(function() --[[ Line: 650 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v47 (ref), v44 (ref), v17 (ref), v121 (copy), v49 (ref), v76 (copy), v24 (ref), v112 (copy), v68 (copy), l_FormFactor_0 (ref), v33 (ref), v4 (ref), v72 (copy), l_removedFromConversationToastTitle_0 (copy), v38 (ref), v25 (ref), v20 (ref), v71 (copy), v19 (ref), v27 (ref), v51 (ref), l_getNewMessages_0 (ref), v23 (ref)
        local v203 = l_robloxEventReceiver_0:observeEvent("CommunicationChannels", function(v183, _) --[[ Line: 653 ]]
            -- upvalues: v47 (ref), v44 (ref), v17 (ref), v121 (ref), v49 (ref), v76 (ref), v24 (ref), v112 (ref), v68 (ref), l_FormFactor_0 (ref), v33 (ref), v4 (ref), v72 (ref), l_removedFromConversationToastTitle_0 (ref), v38 (ref), v25 (ref), v20 (ref), v71 (ref), v19 (ref), v27 (ref), v51 (ref), l_getNewMessages_0 (ref), v23 (ref)
            if v183.ChannelVertical ~= "PlatformChat" then
                return;
            elseif v47 and not table.find(v44.ChannelTypeAllowlist, v183.ChannelType) then
                return;
            else
                v17:info("Received channels notification: {}", v183.Type);
                v121("CommunicationChannels", v183.SequenceNumber);
                local l_ChannelId_0 = v183.ChannelId;
                if v183.Type == "ChannelDeleted" or v183.Type == "RemovedFromChannel" or v49 and v183.Type == "ChannelArchived" then
                    v76(v24(l_ChannelId_0));
                    local l_activeConversationId_1 = v112.activeConversationId;
                    if l_activeConversationId_1 ~= nil and tostring(l_activeConversationId_1) == v183.ChannelId and v112.rnBypassActionSignal then
                        local v187 = if v68 == l_FormFactor_0.WIDE then v33.EmptyConversation else v33.ChatLanding;
                        v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v187
                        }));
                    end;
                    if v183.Actor.Id ~= tostring(v72) then
                        v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v33.RoactChatToast, 
                            params = {
                                toastProps = {
                                    toastContent = {
                                        toastTitle = l_removedFromConversationToastTitle_0
                                    }
                                }
                            }
                        }));
                        return;
                    end;
                elseif v183.Type == "ChannelUpdated" or v183.Type == "ParticipantsAdded" or v183.Type == "ParticipantsRemoved" then
                    task.spawn(function() --[[ Line: 709 ]]
                        -- upvalues: l_ChannelId_0 (copy), v76 (ref), v38 (ref), v183 (copy), v25 (ref), v20 (ref), v17 (ref)
                        v76(v38(l_ChannelId_0)):andThen(function(v188) --[[ Line: 711 ]]
                            -- upvalues: v183 (ref), l_ChannelId_0 (ref), v76 (ref), v25 (ref), v20 (ref)
                            local l_title_1 = v188.title;
                            local l_lastUpdated_1 = v188.lastUpdated;
                            if v183.Type == "ChannelUpdated" then
                                local l_l_ChannelId_0_0 = l_ChannelId_0;
                                local l_isDefaultTitle_1 = v188.isDefaultTitle;
                                v76(v25(l_l_ChannelId_0_0, l_title_1, l_isDefaultTitle_1, l_lastUpdated_1));
                                return;
                            else
                                local l_l_ChannelId_0_1 = l_ChannelId_0;
                                local l_participants_1 = v188.participants;
                                v76(v20(l_l_ChannelId_0_1, l_participants_1, l_title_1, l_lastUpdated_1));
                                return;
                            end;
                        end):catch(function(v195) --[[ Line: 727 ]]
                            -- upvalues: v17 (ref), v183 (ref)
                            v17:warning((("Failure in RobloxEventReceiver->%*, Status: %*"):format(v183.Type, (tostring(v195)))));
                        end);
                    end);
                    return;
                elseif v183.Type == "AddedToChannel" or v183.Type == "ChannelCreated" or v183.Type == "ChannelMarkedRead" or v183.Type == "ChannelMetadataUpdated" or v183.Type == "ChannelUnarchived" then
                    if v71 then
                        v17:debug("Received {} event while loading conversation data", v183.Type);
                        return;
                    else
                        task.spawn(function() --[[ Line: 745 ]]
                            -- upvalues: l_ChannelId_0 (copy), v76 (ref), v38 (ref), v183 (copy), v19 (ref), v27 (ref), v112 (ref), v4 (ref), v33 (ref), v17 (ref)
                            v76(v38(l_ChannelId_0)):andThen(function(v196) --[[ Line: 747 ]]
                                -- upvalues: v183 (ref), v19 (ref), v76 (ref), v27 (ref), v112 (ref), v4 (ref), v33 (ref)
                                if (v183.Type == "ChannelCreated" or v183.Type == "ChannelUnarchived") and v196.type == "one_to_one" then
                                    local v197 = v19.getFriendConversationId(v196.participants);
                                    if v197 then
                                        v76(v27({
                                            newConversationId = v196.id, 
                                            oldFriendConversationId = v197
                                        }));
                                        if v112.activeConversationId == v197 then
                                            v112.rnBypassActionSignal:fire(v4.Actions.navigate({
                                                routeName = v33.ChatConversation, 
                                                params = {
                                                    conversationId = v196.id
                                                }
                                            }));
                                        end;
                                    end;
                                end;
                            end):catch(function(v198) --[[ Line: 771 ]]
                                -- upvalues: v17 (ref), v183 (ref)
                                v17:warning("Failure in RobloxEventReceiver->{}, Status: {}", v183.Type, (tostring(v198)));
                            end);
                        end);
                        return;
                    end;
                elseif v183.Type == "MessageCreated" or v51() and v183.Type == "SystemMessageCreated" then
                    local v199 = v183.Actor.Id == tostring(v72);
                    local v200 = tick();
                    local _ = v76(l_getNewMessages_0(l_ChannelId_0, v199, v200));
                    return;
                elseif v183.Type == "ParticipantTyping" and v183.IsTyping then
                    local l_Id_0 = v183.Actor.Id;
                    v76(v23(l_ChannelId_0, l_Id_0));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 791 ]]
            -- upvalues: v203 (copy)
            if v203 and v203.disconnect then
                v203:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v72, l_robloxEventReceiver_0, v121, v104, v112.activeConversationId, v112.rnBypassActionSignal, l_removedFromConversationToastTitle_0, v89, v109, v81, v71, v95, v101, v178));
    local v205 = l_useMemo_0(function() --[[ Line: 815 ]]
        -- upvalues: v66 (copy), v6 (ref)
        if not v66 then
            return {};
        else
            return (v6.List.filterMap(v6.Dictionary.values(v66), function(v204) --[[ Line: 820 ]]
                if v204 and v204.id and v204.source ~= "friends" then
                    return v204.id;
                else
                    return nil;
                end;
            end));
        end;
    end, l_dependencyArray_0(v66));
    l_useEffect_0(function() --[[ Line: 830 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v17 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v60 (ref), v6 (ref), v205 (copy), v76 (copy), v43 (ref), v112 (copy), v7 (ref), v54 (ref), v75 (copy)
        local v221 = l_robloxEventReceiver_0:observeEvent("ChatModerationTypeEligibility", function(v206, _) --[[ Line: 833 ]]
            -- upvalues: v17 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v60 (ref), v6 (ref), v205 (ref), v76 (ref), v43 (ref), v112 (ref), v7 (ref), v54 (ref), v75 (ref)
            v17:debug("Received ChatModerationTypeEligibility notification");
            local l_channels_inspected_0 = v206.channels_inspected;
            if not l_channels_inspected_0 or #l_channels_inspected_0 == 0 then
                return;
            else
                if l_getFFlagDebugUnfilteredThreads_0() then
                    local v209 = "";
                    for _, v211 in l_channels_inspected_0 do
                        v209 = ("%*, %*"):format(v209, v211);
                    end;
                    v60((("RTN CONVERSATIONS INSPECTED%*"):format(v209)));
                end;
                local v213 = v6.List.filter(l_channels_inspected_0, function(v212) --[[ Line: 847 ]]
                    -- upvalues: v205 (ref)
                    return table.find(v205, v212);
                end);
                if #v213 == 0 then
                    v17:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification");
                    return;
                else
                    if l_getFFlagDebugUnfilteredThreads_0() then
                        local v214 = "";
                        for _, v216 in v213 do
                            v214 = ("%*, %*"):format(v214, v216);
                        end;
                        v60((("RTN FILTERED CONVERSATIONS%*"):format(v214)));
                    end;
                    v76(v43(v213)):catch(function(v217) --[[ Line: 863 ]]
                        -- upvalues: v17 (ref)
                        v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(v217));
                    end);
                    if not v112.activeConversationId then
                        return;
                    else
                        if table.find(l_channels_inspected_0, v112.activeConversationId) then
                            v76(v7.rodux.GetConversationsParticipantsMetadata.API({
                                v112.activeConversationId
                            })):catch(function(v218) --[[ Line: 877 ]]
                                -- upvalues: v17 (ref)
                                v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(v218));
                            end);
                            if v54() then
                                v76(v7.rodux.GetConversationTopModal.API(v112.activeConversationId, v75)):catch(function(v219) --[[ Line: 890 ]]
                                    -- upvalues: v17 (ref)
                                    v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(v219));
                                end);
                                return;
                            else
                                v76(v7.rodux.GetUnfilteredThreadsConversationBanner.API(v112.activeConversationId)):catch(function(v220) --[[ Line: 902 ]]
                                    -- upvalues: v17 (ref)
                                    v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetUnfilteredThreadsConversationBanner, Status: " .. tostring(v220));
                                end);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 914 ]]
            -- upvalues: v221 (copy)
            if v221 and v221.disconnect then
                v221:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, v112.activeConversationId, v205));
    l_useEffect_0(function() --[[ Line: 921 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v17 (ref), v76 (copy), v42 (ref), v75 (copy)
        local v224 = l_robloxEventReceiver_0:observeEvent("EligibilityStatusChanged", function(_, _) --[[ Line: 924 ]]
            -- upvalues: v17 (ref), v76 (ref), v42 (ref), v75 (ref)
            v17:info("Received EligibilityStatusChanged notification");
            v76(v42(v75));
        end);
        return function() --[[ Line: 931 ]]
            -- upvalues: v224 (copy)
            if v224 and v224.disconnect then
                v224:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76));
    return {};
end;
return ChatEventReceiver;