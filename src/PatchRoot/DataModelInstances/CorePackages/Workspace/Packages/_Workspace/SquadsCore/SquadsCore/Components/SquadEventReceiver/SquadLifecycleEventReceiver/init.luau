local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.RoduxSquads);
local v6 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v7 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadViewFlags);
local v8 = require(l_script_FirstAncestor_0.Thunks.fetchActiveSquad);
local v9 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RealtimeDelivery);
local v12 = require(l_Parent_0.LuauPolyfill);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_clearInterval_0 = v12.clearInterval;
local l_clearTimeout_0 = v12.clearTimeout;
local l_setInterval_0 = v12.setInterval;
local l_setTimeout_0 = v12.setTimeout;
local v19 = game:DefineFastFlag("SquadInitPollingFix", false);
local v20 = game:DefineFastFlag("EnableSquadRTNPollingOptimizations", false);
local v21 = game:DefineFastInt("ActiveSquadPollingCardIntervalSeconds", 10);
local v22 = game:DefineFastInt("ActiveSquadPollingLobbyIntervalSeconds", 30);
local v23 = game:DefineFastInt("ActiveSquadPollingIdleIntervalSeconds", 60);
local v24 = game:DefineFastInt("ActiveSquadInitPollingDelaySeconds", 3);
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
return function(v26) --[[ Line: 42 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v10 (copy), v6 (copy), v19 (copy), l_setTimeout_0 (copy), v8 (copy), v24 (copy), l_clearTimeout_0 (copy), v7 (copy), v21 (copy), v22 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v11 (copy), v3 (copy), v4 (copy), v9 (copy), v5 (copy), v20 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = tonumber(l_useLocalUserId_0()) or 0;
    local v29, v30 = v10.useState(false);
    local v31 = v10.useContext(v6).useSquadViewFlags();
    local v32, v33 = v10.useState(-1);
    if v19 then
        v10.useEffect(function() --[[ Line: 55 ]]
            -- upvalues: l_setTimeout_0 (ref), v27 (copy), v8 (ref), v30 (copy), v24 (ref), l_clearTimeout_0 (ref)
            local v34 = l_setTimeout_0(function() --[[ Line: 56 ]]
                -- upvalues: v27 (ref), v8 (ref), v30 (ref)
                v27(v8());
                v30(true);
            end, v24 * 1000);
            return function() --[[ Line: 61 ]]
                -- upvalues: v34 (copy), l_clearTimeout_0 (ref)
                if v34 then
                    l_clearTimeout_0(v34);
                end;
            end;
        end, {});
    end;
    v10.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v31 (copy), v7 (ref), v21 (ref), v22 (ref), v23 (ref), v19 (ref), v29 (copy), l_setInterval_0 (ref), v27 (copy), v8 (ref), l_clearInterval_0 (ref)
        local v35 = nil;
        v35 = if bit32.band(v31, v7.SquadSystemMessage) ~= 0 then v21 else if bit32.band(v31, v7.SquadLobby) ~= 0 then v22 else v23;
        local v36 = nil;
        v36 = if v19 then if v29 then l_setInterval_0(function() --[[ Line: 85 ]]
            -- upvalues: v27 (ref), v8 (ref)
            v27(v8());
        end, v35 * 1000) else nil else l_setInterval_0(function() --[[ Line: 89 ]]
            -- upvalues: v27 (ref), v8 (ref)
            v27(v8());
        end, v35 * 1000);
        return function() --[[ Line: 93 ]]
            -- upvalues: v36 (ref), l_clearInterval_0 (ref)
            if v36 then
                l_clearInterval_0(v36);
            end;
        end;
    end, {
        v26.currentSquadId, 
        v31, 
        v32, 
        v29
    });
    local v38 = v10.useCallback(function(v37) --[[ Line: 104 ]]
        -- upvalues: v32 (copy), v27 (copy), v8 (ref), v33 (copy)
        if v32 < v37 then
            v27(v8()):andThen(function() --[[ Line: 106 ]]
                -- upvalues: v33 (ref), v37 (copy)
                v33(v37);
            end);
        end;
    end, {
        v27, 
        v8, 
        v33, 
        v32
    });
    v11.useRealtimeNamespace(v3.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(v39) --[[ Line: 113 ]]
        -- upvalues: v3 (ref), v26 (copy), v28 (copy), v4 (ref), v9 (ref), v27 (copy), v5 (ref), v20 (ref), v38 (copy), v8 (ref)
        if v39.ChannelType == v3.SQUAD_CHANNEL_TYPE then
            local v40 = v26.currentSquadId == v39.ChannelId;
            local v41 = false;
            if v39.Actor.Type == "User" then
                v41 = v39.Actor.Id == tostring(v28);
            end;
            v4:debug("Squad RTN received. Detail: {}, CurrentSquadId: {}, LocalUserId: {}", v9(v39), v26.currentSquadId, v28);
            if v40 then
                if v39.Type == v3.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE or v39.Type == v3.CHANNEL_DELETED_DETAIL_TYPE then
                    v27(v5.Actions.CurrentSquadUpdated(nil));
                    return;
                elseif v39.Type == v3.CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE or v39.Type == v3.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE or v39.Type == v3.CHANNEL_UPDATED_DETAIL_TYPE then
                    if v20 then
                        v38(v39.SequenceNumber);
                        return;
                    else
                        v27(v8());
                        return;
                    end;
                end;
            elseif v39.Type == v3.CHANNEL_CREATED_DETAIL_TYPE and v41 then
                if v20 then
                    v38(v39.SequenceNumber);
                    return;
                else
                    v27(v8());
                    return;
                end;
            elseif v39.Type == v3.CHANNEL_LOCAL_USER_ADDED_DETAIL_TYPE then
                if v20 then
                    v38(v39.SequenceNumber);
                    return;
                else
                    v27(v8());
                end;
            end;
        end;
    end, {
        v26.currentSquadId, 
        v27, 
        v28, 
        v38
    });
    v10.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), v27 (copy), v8 (ref)
        local v42 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 171 ]]
            -- upvalues: v27 (ref), v8 (ref)
            v27(v8());
        end, false, true);
        return function() --[[ Line: 174 ]]
            -- upvalues: v42 (copy)
            v42:Disconnect();
        end;
    end, {
        v26.currentSquadId, 
        v27
    });
    return nil;
end;