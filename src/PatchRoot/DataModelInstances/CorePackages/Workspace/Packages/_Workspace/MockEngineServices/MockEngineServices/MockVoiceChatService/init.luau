local l_Parent_0 = script:FindFirstAncestor("MockEngineServices").Parent;
local l_waitForEvents_0 = require(l_Parent_0.TestUtils).DeferredLuaHelpers.waitForEvents;
local function v2() --[[ Line: 5 ]]

end;
local function _(v3) --[[ Line: 6 ]]
    return function() --[[ Line: 7 ]]
        -- upvalues: v3 (copy)
        return v3;
    end;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local v10 = {
    makeMockUser = function(v8, v9) --[[ Line: 16 ]] --[[ Name: makeMockUser ]]
        return {
            userId = tostring(v8), 
            UserId = tostring(v8), 
            isMuted = false, 
            isMutedLocally = not not v9
        };
    end, 
    ParticipantsStateChanged = l_BindableEvent_0.Event, 
    StateChanged = l_BindableEvent_2.Event, 
    LocalPlayerModerated = l_BindableEvent_1.Event
};
local v11 = 0;
v10.GetVoiceChatApiVersionCB = function() --[[ Line: 7 ]]
    -- upvalues: v11 (copy)
    return v11;
end;
v10.GetVoiceChatAvailableCB = v2;
v10.IsSubscribePausedCB = v2;
v10.SubscribePauseCB = v2;
v10.SubscribeBlockCB = v2;
v10.SubscribeUnblockCB = v2;
v10.SubscribePauseAllCB = v2;
v10.groupId = 10000;
v10.publishPaused = false;
v10.available = true;
v10.joinCalled = false;
v10.policyMapper = nil;
v10.Disconnect = function(_) --[[ Line: 44 ]] --[[ Name: Disconnect ]]

end;
v10.Leave = function(_) --[[ Line: 49 ]] --[[ Name: Leave ]]

end;
v10.GetGroupId = function(v14) --[[ Line: 53 ]] --[[ Name: GetGroupId ]]
    return v14.groupId;
end;
v10.IsPublishPaused = function(v15) --[[ Line: 56 ]] --[[ Name: IsPublishPaused ]]
    return v15.publishPaused;
end;
v10.JoinByGroupIdToken = function(v16) --[[ Line: 59 ]] --[[ Name: JoinByGroupIdToken ]]
    v16.joinCalled = true;
    return true;
end;
v10.IsSubscribePaused = function(v17) --[[ Line: 64 ]] --[[ Name: IsSubscribePaused ]]
    return v17.IsSubscribePausedCB();
end;
v10.SubscribePause = function(v18, v19) --[[ Line: 67 ]] --[[ Name: SubscribePause ]]
    return v18.SubscribePauseCB(v19);
end;
v10.GetVoiceChatApiVersion = function(v20) --[[ Line: 71 ]] --[[ Name: GetVoiceChatApiVersion ]]
    return v20.GetVoiceChatApiVersionCB();
end;
v10.GetVoiceChatAvailable = function(v21) --[[ Line: 74 ]] --[[ Name: GetVoiceChatAvailable ]]
    return v21.GetVoiceChatAvailableCB();
end;
v10.SubscribeBlock = function(v22) --[[ Line: 77 ]] --[[ Name: SubscribeBlock ]]
    return v22.SubscribeBlockCB();
end;
v10.SubscribePauseAll = function(v23) --[[ Line: 81 ]] --[[ Name: SubscribePauseAll ]]
    return v23.SubscribePauseAllCB();
end;
v10.SubscribeUnblock = function(v24) --[[ Line: 84 ]] --[[ Name: SubscribeUnblock ]]
    return v24.SubscribeUnblockCB();
end;
v10.kickUsers = function(_, v26) --[[ Line: 88 ]] --[[ Name: kickUsers ]]
    -- upvalues: l_BindableEvent_0 (ref), l_waitForEvents_0 (copy)
    l_BindableEvent_0:Fire(v26, {}, {});
    l_waitForEvents_0();
end;
v10.ModerateLocalPlayer = function(_) --[[ Line: 93 ]] --[[ Name: ModerateLocalPlayer ]]
    -- upvalues: l_BindableEvent_1 (ref), l_waitForEvents_0 (copy)
    l_BindableEvent_1:Fire();
    l_waitForEvents_0();
end;
v10.addUsers = function(_, v29) --[[ Line: 98 ]] --[[ Name: addUsers ]]
    -- upvalues: l_BindableEvent_0 (ref), l_waitForEvents_0 (copy)
    l_BindableEvent_0:Fire({}, {}, v29);
    l_waitForEvents_0();
end;
v10.setUserStates = function(_, v31) --[[ Line: 103 ]] --[[ Name: setUserStates ]]
    -- upvalues: l_BindableEvent_0 (ref), l_waitForEvents_0 (copy)
    l_BindableEvent_0:Fire({}, {}, v31);
    l_waitForEvents_0();
end;
v10.GetSessionId = function(_) --[[ Line: 108 ]] --[[ Name: GetSessionId ]]
    return 1;
end;
v10.GetChannelId = function(_) --[[ Line: 112 ]] --[[ Name: GetChannelId ]]
    return 1;
end;
v10.resetMocks = function(v34) --[[ Line: 116 ]] --[[ Name: resetMocks ]]
    -- upvalues: l_BindableEvent_0 (ref), l_BindableEvent_2 (ref), l_BindableEvent_1 (ref)
    l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_2 = Instance.new("BindableEvent");
    l_BindableEvent_1 = Instance.new("BindableEvent");
    v34.LocalPlayerModerated = l_BindableEvent_1.Event;
    v34.ParticipantsStateChanged = l_BindableEvent_0.Event;
    v34.StateChanged = l_BindableEvent_2.Event;
    v34.joinCalled = false;
end;
return v10;