local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SquadsCore_0 = v1.SquadsCore;
local l_React_0 = v1.React;
local l_NetworkingSquads_0 = v1.NetworkingSquads;
local l_NetworkStatus_0 = v1.RoduxNetworking.Enum.NetworkStatus;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_SquadState_0 = l_SquadsCore_0.Enums.SquadState;
local l_useCurrentSquadId_0 = l_SquadsCore_0.Hooks.useCurrentSquadId;
return function() --[[ Line: 15 ]]
    -- upvalues: l_useCurrentSquadId_0 (copy), l_React_0 (copy), l_NetworkingSquads_0 (copy), l_useSelector_0 (copy), l_SquadState_0 (copy), l_NetworkStatus_0 (copy)
    local v9 = l_useCurrentSquadId_0() or "";
    local v11 = l_React_0.useCallback(function(v10) --[[ Line: 18 ]]
        -- upvalues: l_NetworkingSquads_0 (ref)
        return l_NetworkingSquads_0.JoinSquad.getStatus(v10, {});
    end, {});
    local v12 = l_useSelector_0(v11);
    local v14 = l_React_0.useCallback(function(v13) --[[ Line: 23 ]]
        -- upvalues: l_NetworkingSquads_0 (ref)
        return l_NetworkingSquads_0.CreateOrJoinSquad.getStatus(v13, {});
    end, {});
    local v15 = l_useSelector_0(v14);
    local l_Idle_0 = l_SquadState_0.Idle;
    if v9 ~= "" then
        return l_SquadState_0.Active;
    else
        if v12 == l_NetworkStatus_0.Fetching or v15 == l_NetworkStatus_0.Fetching then
            l_Idle_0 = l_SquadState_0.Initializing;
        end;
        return l_Idle_0;
    end;
end;