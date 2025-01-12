local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v4 = require(l_Parent_0.Promise);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.RoduxSquads).Actions.CurrentSquadUpdated;
local v6 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v7 = game:DefineFastFlag("EnableLeaveSquadCatch", false);
return function(v8, v9, v10) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), l_CurrentSquadUpdated_0 (copy), v7 (copy), v6 (copy), v2 (copy)
    return function(v11) --[[ Line: 19 ]]
        -- upvalues: v4 (ref), v10 (copy), l_CurrentSquadUpdated_0 (ref), v7 (ref), v6 (ref), v2 (ref), v8 (copy), v9 (copy)
        local v12 = v11:getState();
        local v13 = v12.Squad and v12.Squad.Squad and v12.Squad.Squad.currentSquad and v12.Squad.Squad.currentSquad.squadId;
        if not v13 then
            return v4.resolve();
        else
            local function v15() --[[ Line: 31 ]]
                -- upvalues: v10 (ref), v11 (copy), l_CurrentSquadUpdated_0 (ref), v7 (ref), v6 (ref), v13 (copy), v2 (ref)
                if v10 then
                    v10();
                end;
                v11:dispatch(l_CurrentSquadUpdated_0(nil));
                if v7 then
                    v11:dispatch(v6.LeaveSquad.API({
                        squadId = v13
                    })):catch(function(v14) --[[ Line: 38 ]]
                        -- upvalues: v2 (ref)
                        v2:error("Error occured with NetworkingSquads.LeaveSquad: {}", (tostring(v14)));
                    end);
                    return;
                else
                    v11:dispatch(v6.LeaveSquad.API({
                        squadId = v13
                    }));
                    return;
                end;
            end;
            if v8 then
                return v9(v11, {
                    onConfirm = v15, 
                    promptType = v8
                });
            else
                v15();
                return v4.resolve();
            end;
        end;
    end;
end;