local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Promise);
local v3 = require(l_Parent_0.CallProtocolConstants);
local _ = require(l_Parent_0.CallProtocolTypes);
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({}, v6));
end;
v6.initCall = function(_, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 40 ]] --[[ Name: initCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    local v18 = {
        callerId = v8, 
        calleeId = v9, 
        callerCombinedName = v10, 
        calleeCombinedName = v11, 
        muted = v12, 
        camEnabled = v13, 
        callerUniqueIdentifier = v14, 
        placeId = v15, 
        reservedServerAccessCode = v16, 
        universeId = v17
    };
    l_MessageBusService_0:Publish(v3.MESSAGE_INIT_CALL, v18);
end;
v6.answerCall = function(_, v20) --[[ Line: 68 ]] --[[ Name: answerCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_ANSWER_CALL, {
        callId = v20
    });
end;
v6.answerSuccessCall = function(_, v22) --[[ Line: 77 ]] --[[ Name: answerSuccessCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_ANSWER_SUCCESS_CALL, {
        callId = v22
    });
end;
v6.rejectCall = function(_, v24) --[[ Line: 86 ]] --[[ Name: rejectCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_REJECT_CALL, {
        callId = v24
    });
end;
v6.cancelCall = function(_, v26) --[[ Line: 95 ]] --[[ Name: cancelCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_CANCEL_CALL, {
        callId = v26
    });
end;
v6.teleportSuccessCall = function(_, v28) --[[ Line: 104 ]] --[[ Name: teleportSuccessCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_TELEPORT_SUCCESS_CALL, {
        callId = v28
    });
end;
v6.finishCall = function(_, v30) --[[ Line: 113 ]] --[[ Name: finishCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_FINISH_CALL, {
        callId = v30
    });
end;
v6.getCallState = function(_) --[[ Line: 122 ]] --[[ Name: getCallState ]]
    -- upvalues: v2 (copy), l_MessageBusService_0 (copy), v3 (copy)
    return (v2.new(function(v32, _) --[[ Line: 123 ]]
        -- upvalues: l_MessageBusService_0 (ref), v3 (ref)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_GET_CALL_STATE, {}, function(v34) --[[ Line: 128 ]]
            -- upvalues: v32 (copy)
            v32(v34);
        end, {});
    end));
end;
v6.updateMicAndCamState = function(_, v36, v37) --[[ Line: 137 ]] --[[ Name: updateMicAndCamState ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    local v38 = {};
    if v36 ~= nil then
        v38.muted = v36;
    end;
    if v37 ~= nil then
        v38.camEnabled = v37;
    end;
    l_MessageBusService_0:Publish(v3.MESSAGE_UDPATE_MIC_AND_CAM_STATE, v38);
end;
v6.listenToHandleInitCall = function(_, v40) --[[ Line: 149 ]] --[[ Name: listenToHandleInitCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_INIT_CALL, v40, false, true);
end;
v6.listenToHandleConnectingCall = function(_, v42) --[[ Line: 153 ]] --[[ Name: listenToHandleConnectingCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_CONNECTING_CALL, v42, false, true);
end;
v6.listenToHandleTeleportingCall = function(_, v44) --[[ Line: 157 ]] --[[ Name: listenToHandleTeleportingCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_TELEPORTING_CALL, v44, false, true);
end;
v6.listenToHandleActiveCall = function(_, v46) --[[ Line: 161 ]] --[[ Name: listenToHandleActiveCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_ACTIVE_CALL, v46, false, true);
end;
v6.listenToHandleEndCall = function(_, v48) --[[ Line: 165 ]] --[[ Name: listenToHandleEndCall ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_END_CALL, v48, false, true);
end;
v6.listenToHandleCallMessage = function(_, v50) --[[ Line: 169 ]] --[[ Name: listenToHandleCallMessage ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_CALL_MESSAGE, v50, false, true);
end;
v6.listenToHandleMicAndCamChanged = function(_, v52) --[[ Line: 173 ]] --[[ Name: listenToHandleMicAndCamChanged ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_MIC_AND_CAM_CHANGED, v52, false, true);
end;
v6.listenToHandleTransferCallTeleportLeave = function(_, v54) --[[ Line: 177 ]] --[[ Name: listenToHandleTransferCallTeleportLeave ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE, v54, false, true);
end;
v6.listenToHandleTransferCallTeleportJoin = function(_, v56) --[[ Line: 181 ]] --[[ Name: listenToHandleTransferCallTeleportJoin ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    return l_MessageBusService_0:Subscribe(v3.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN, v56, false, true);
end;
v6.default = v6.new();
return v6;