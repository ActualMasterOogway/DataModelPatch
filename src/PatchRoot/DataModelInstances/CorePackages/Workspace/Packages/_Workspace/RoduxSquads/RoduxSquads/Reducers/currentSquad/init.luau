local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentSquadUpdated;
local l_SquadModel_0 = require(l_script_FirstAncestor_0.Models).SquadModel;
local v6 = require(l_script_FirstAncestor_0.Persists.PersistStorage);
local l_createPersistReducer_0 = require(l_script_FirstAncestor_0.Persists.PersistReducer).createPersistReducer;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
return function(v9) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), l_createPersistReducer_0 (copy), v6 (copy), v3 (copy), l_SquadModel_0 (copy), l_CurrentSquadUpdated_0 (copy)
    local l_NetworkingSquads_0 = v9.NetworkingSquads;
    local function v17(v11, v12) --[[ Line: 18 ]]
        -- upvalues: v2 (ref)
        if v11 == nil or v11.squadId ~= v12.squadId then
            if v12.deletedAtTime and v12.deletedAtTime ~= "" then
                return v11;
            elseif v11 and v11.parentChannelId == v12.parentChannelId then
                if v11.createdAtTime < v12.createdAtTime then
                    return v12;
                end;
            else
                return v12;
            end;
        elseif v12.deletedAtTime and v12.deletedAtTime ~= "" then
            return nil;
        elseif v11.updatedAtTime < v12.updatedAtTime then
            return v12;
        elseif v11.updatedAtTime == v12.updatedAtTime then
            if v11.parentChannelId ~= v12.parentChannelId then
                return v12;
            else
                local v14 = v2.List.sort(v2.List.map(v11.members, function(v13) --[[ Line: 47 ]]
                    return v13.userId;
                end));
                local v16 = v2.List.sort(v2.List.map(v12.members, function(v15) --[[ Line: 50 ]]
                    return v15.userId;
                end));
                if not v2.List.equals(v14, v16) then
                    return v12;
                end;
            end;
        end;
        return v11;
    end;
    return l_createPersistReducer_0(v2.Dictionary.join({
        storage = v6.new("currentSquadStore")
    }, v9.currentSquad or {}), v3.createReducer(nil, {
        [l_NetworkingSquads_0.CreateOrJoinSquad.Succeeded.name] = function(v18, v19) --[[ Line: 70 ]]
            -- upvalues: v17 (copy), l_SquadModel_0 (ref)
            local l_groupUp_0 = v19.responseBody.groupUp;
            return (v17(v18, l_SquadModel_0.format(l_groupUp_0)));
        end, 
        [l_NetworkingSquads_0.GetSquadActive.Succeeded.name] = function(v21, v22) --[[ Line: 78 ]]
            -- upvalues: v17 (copy), l_SquadModel_0 (ref)
            local l_groupUp_1 = v22.responseBody.groupUp;
            if l_groupUp_1 then
                return (v17(v21, l_SquadModel_0.format(l_groupUp_1)));
            else
                return nil;
            end;
        end, 
        [l_NetworkingSquads_0.GetSquadFromSquadId.Succeeded.name] = function(v24, v25) --[[ Line: 91 ]]
            -- upvalues: v17 (copy), l_SquadModel_0 (ref)
            local l_groupUp_2 = v25.responseBody.groupUp;
            local v27 = v24 and v24.squadId;
            if l_groupUp_2 and l_groupUp_2.groupUpId == v27 then
                return (v17(v24, l_SquadModel_0.format(l_groupUp_2)));
            else
                return v24;
            end;
        end, 
        [l_NetworkingSquads_0.JoinSquad.Succeeded.name] = function(v28, v29) --[[ Line: 106 ]]
            -- upvalues: v17 (copy), l_SquadModel_0 (ref)
            local l_groupUp_3 = v29.responseBody.groupUp;
            return (v17(v28, l_SquadModel_0.format(l_groupUp_3)));
        end, 
        [l_NetworkingSquads_0.LeaveSquad.Succeeded.name] = function(v31, v32) --[[ Line: 114 ]]
            local l_groupUpId_0 = v32.postBody.groupUpId;
            if v31 and v31.squadId == l_groupUpId_0 then
                return nil;
            else
                return v31;
            end;
        end, 
        [l_CurrentSquadUpdated_0.name] = function(v34, v35) --[[ Line: 122 ]]
            -- upvalues: v17 (copy), l_SquadModel_0 (ref)
            local l_squad_0 = v35.payload.squad;
            if not l_squad_0 then
                return nil;
            else
                return (v17(v34, l_SquadModel_0.format(l_squad_0)));
            end;
        end
    }));
end;