local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local _ = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local v8 = require(script.Parent.dependencies);
local l_RoduxCall_0 = v8.RoduxCall;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local l_teleportToRootPlace_0 = v8.teleportToRootPlace;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
return function(v18) --[[ Line: 22 ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), l_RoduxCall_0 (copy), l_Players_0 (copy), l_FaceAnimatorService_0 (copy), l_default_0 (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), l_CallAction_0 (copy), l_teleportToRootPlace_0 (copy)
    local function _(v19) --[[ Line: 23 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        coroutine.wrap(function() --[[ Line: 24 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v19 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v19);
        end)();
    end;
    v18:getCallState():andThen(function(v21) --[[ Line: 36 ]]
        -- upvalues: l_RoduxCall_0 (ref), l_Players_0 (ref), v18 (copy)
        if v21.status == l_RoduxCall_0.Enums.Status.Teleporting and l_Players_0.LocalPlayer and v21.callerId == l_Players_0.LocalPlayer.UserId and v21.callId then
            if v21.instanceId == game.JobId then
                v18:teleportSuccessCall(v21.callId);
                return;
            else
                v18:finishCall(v21.callId);
                return;
            end;
        else
            if v21.status == l_RoduxCall_0.Enums.Status.Accepting and l_Players_0.LocalPlayer and v21.calleeId == l_Players_0.LocalPlayer.UserId and v21.callId then
                if v21.instanceId == game.JobId then
                    v18:answerSuccessCall(v21.callId);
                    return;
                else
                    v18:rejectCall(v21.callId);
                end;
            end;
            return;
        end;
    end);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 65 ]]
        -- upvalues: v18 (copy), l_FaceAnimatorService_0 (ref)
        v18:updateMicAndCamState(nil, l_FaceAnimatorService_0.VideoAnimationEnabled);
    end);
    l_default_0.muteChanged.Event:Connect(function(v22) --[[ Line: 70 ]]
        -- upvalues: l_default_0 (ref), v18 (copy)
        local v23 = l_default_0:getService();
        if v23 and v23.VoiceChatState ~= Enum.VoiceChatState.Leaving and v23.VoiceChatState ~= Enum.VoiceChatState.Ended then
            v18:updateMicAndCamState(v22, nil);
        end;
    end);
    v12 = v18:listenToHandleMicAndCamChanged(function(v24) --[[ Line: 83 ]]
        -- upvalues: l_default_0 (ref), l_FaceAnimatorService_0 (ref)
        local v25 = l_default_0:getService();
        if v25 and v25.VoiceChatState == Enum.VoiceChatState.Joined and l_default_0.localMuted ~= nil and v24.muted ~= nil and v24.muted ~= l_default_0.localMuted then
            l_default_0:ToggleMic("CallAPI");
        end;
        if l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled ~= v24.camEnabled and v24.camEnabled ~= nil then
            l_FaceAnimatorService_0.VideoAnimationEnabled = v24.camEnabled;
        end;
    end);
    v13 = v18:listenToHandleTeleportingCall(function(v26) --[[ Line: 107 ]]
        -- upvalues: l_RoduxCall_0 (ref), l_Players_0 (ref), v18 (copy), l_RobloxReplicatedStorage_0 (ref)
        if v26.status == l_RoduxCall_0.Enums.Status.Teleporting and l_Players_0.LocalPlayer and v26.callId and v26.callerId == l_Players_0.LocalPlayer.UserId then
            coroutine.wrap(function() --[[ Line: 114 ]]
                -- upvalues: v26 (copy), v18 (ref), l_RobloxReplicatedStorage_0 (ref)
                if v26.instanceId == game.JobId then
                    v18:teleportSuccessCall(v26.callId);
                    return;
                else
                    l_RobloxReplicatedStorage_0:WaitForChild("ContactListIrisInviteTeleport", 1e999):FireServer(v26.placeId, v26.instanceId, v26.reservedServerAccessCode);
                    return;
                end;
            end)();
        end;
    end);
    v14 = v18:listenToHandleTransferCallTeleportJoin(function(v27) --[[ Line: 133 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local v28 = {
            callId = v27.callId, 
            participants = {
                tostring(v27.callerId), 
                (tostring(v27.calleeId))
            }
        };
        coroutine.wrap(function() --[[ Line: 24 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v28 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v28);
        end)();
    end);
    v15 = v18:listenToHandleTransferCallTeleportLeave(function(_) --[[ Line: 140 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local l_wrap_0 = coroutine.wrap;
        local v31 = nil;
        l_wrap_0(function() --[[ Line: 24 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v31 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v31);
        end)();
    end);
    v16 = v18:listenToHandleActiveCall(function(v32) --[[ Line: 146 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local v33 = {
            callId = v32.callId, 
            participants = {
                tostring(v32.callerId), 
                (tostring(v32.calleeId))
            }
        };
        coroutine.wrap(function() --[[ Line: 24 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v33 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v33);
        end)();
    end);
    v17 = v18:listenToHandleEndCall(function(v34) --[[ Line: 153 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref), l_CallAction_0 (ref), l_teleportToRootPlace_0 (ref)
        local l_wrap_1 = coroutine.wrap;
        local v36 = nil;
        l_wrap_1(function() --[[ Line: 24 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v36 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v36);
        end)();
        if v34.callAction == l_CallAction_0.Finish and game.JobId == v34.instanceId then
            l_teleportToRootPlace_0();
        end;
    end);
end;