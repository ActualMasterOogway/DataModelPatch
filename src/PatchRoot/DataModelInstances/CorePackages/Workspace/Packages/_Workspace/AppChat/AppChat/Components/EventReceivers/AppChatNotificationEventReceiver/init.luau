local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local v4 = require(l_Parent_0.AppChatNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v9 = require(script.Parent.useRealtimePlatformChat);
local v10 = require(l_script_FirstAncestor_0.Contexts.UnreadMessages.useUnreadMessagesDispatch);
game:DefineFastFlag("AppChatUnreadRealtimeEventMkII", false);
local v11 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return v2.memo(function() --[[ Line: 17 ]] --[[ Name: AppChatNotificationEventReceiver ]]
    -- upvalues: v8 (copy), v10 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), v11 (copy), v4 (copy), v7 (copy), v9 (copy), v3 (copy)
    local v12 = v8();
    local v13 = v10();
    local v14 = l_useDispatch_0();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 22 ]]
        return v15.ChatAppReducer.unreadMessageCount;
    end);
    v2.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v11 (ref), v14 (copy), v4 (ref), v12 (copy), v7 (ref)
        v11:debug("Fetching conversation metadata to get unread count");
        v14(v4.rodux.GetConversationMetadata.API()):andThen(function(v17) --[[ Line: 30 ]]
            -- upvalues: v11 (ref), v12 (ref), v7 (ref)
            local l_global_unread_message_count_0 = v17.responseBody.global_unread_message_count;
            v11:info("Initial unread message count: {}", l_global_unread_message_count_0);
            v12.fireAnalyticsEvent(v7.preloadSocialTabDataEvent, {
                unreadConversationCount = l_global_unread_message_count_0
            });
        end):catch(function(v19) --[[ Line: 38 ]]
            -- upvalues: v11 (ref), v12 (ref), v7 (ref)
            v11:error("Failure in GetConversationMetadata. Error: {}", (tostring(v19)));
            v12.fireAnalyticsEvent(v7.preloadSocialTabDataFailedEvent, {});
        end);
    end, {
        v14, 
        v12
    });
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v16 (copy), v13 (copy)
        v11:info("Dispatching unread messsage count as {}", v16);
        v13(v16);
    end, {
        v13, 
        v16
    });
    v9(function(v20) --[[ Line: 49 ]]
        -- upvalues: v11 (ref), v14 (copy), v4 (ref)
        local v21 = v20.Type == "ChannelMetadataUpdated";
        if game:GetFastFlag("AppChatUnreadRealtimeEventMkII") then
            local v22 = true;
            if v20.Type ~= "ChannelMetadataUpdated" then
                v22 = v20.Type == "ChannelMarkedRead";
            end;
            v21 = v22;
        end;
        if v21 then
            v11:info("Received event {}, fetching conversation metadata to get unread count", v20.Type);
            v14(v4.rodux.GetConversationMetadata.API()):catch(function(v23) --[[ Line: 57 ]]
                -- upvalues: v11 (ref)
                v11:error("Failure in GetConversationMetadata. Error: {}", (tostring(v23)));
            end);
        end;
    end, {
        v14
    });
    v3.useRealtimeConnectionStateChanged("CommunicationChannels", function(v24, v25) --[[ Line: 63 ]]
        -- upvalues: v11 (ref), v14 (copy), v4 (ref)
        if v24 == Enum.ConnectionState.Connected and v25 then
            v11:info("Connection re-established, fetching conversation metadata to get unread count");
            v14(v4.rodux.GetConversationMetadata.API()):catch(function(v26) --[[ Line: 66 ]]
                -- upvalues: v11 (ref)
                v11:error("Failure in GetConversationMetadata. Error: {}", (tostring(v26)));
            end);
        end;
    end, {
        v14
    });
    return nil;
end);