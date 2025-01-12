local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.leaveSquad);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v5 = require(l_Parent_0.Promise);
local _ = function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v3 (copy)
    return function(v8) --[[ Line: 12 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v3 (ref)
        return v8:dispatch(v4.JoinSquad.API({
            squadId = v6, 
            leaveExisting = true
        })):catch(function(_) --[[ Line: 18 ]]
            -- upvalues: v7 (ref), v8 (copy), v3 (ref)
            v7(v8, {
                hideCancelButton = true, 
                promptType = v3.Error
            });
        end);
    end;
end;
return function(v11, v12) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
    return function(v13) --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v12 (copy), v3 (ref), v5 (ref), v4 (ref), v2 (ref)
        local v14 = v13:getState();
        local v15 = v14.Squad and v14.Squad.Squad and v14.Squad.Squad.currentSquad and v14.Squad.Squad.currentSquad.squadId;
        if v15 == v11 then
            v12(v13, {
                hideCancelButton = true, 
                promptType = v3.AlreadyJoined
            });
            return v5.resolve({});
        elseif not v15 then
            local l_v11_0 = v11;
            local l_v12_0 = v12;
            return v13:dispatch(function(v18) --[[ Line: 12 ]]
                -- upvalues: v4 (ref), l_v11_0 (copy), l_v12_0 (copy), v3 (ref)
                return v18:dispatch(v4.JoinSquad.API({
                    squadId = l_v11_0, 
                    leaveExisting = true
                })):catch(function(_) --[[ Line: 18 ]]
                    -- upvalues: l_v12_0 (ref), v18 (copy), v3 (ref)
                    l_v12_0(v18, {
                        hideCancelButton = true, 
                        promptType = v3.Error
                    });
                end);
            end);
        else
            return v13:dispatch(v2(v3.JoinAnotherSquad, v12, function() --[[ Line: 50 ]]
                -- upvalues: v13 (copy), v11 (ref), v12 (ref), v4 (ref), v3 (ref)
                local l_v13_0 = v13;
                local l_v11_1 = v11;
                local l_v12_1 = v12;
                l_v13_0:dispatch(function(v23) --[[ Line: 12 ]]
                    -- upvalues: v4 (ref), l_v11_1 (copy), l_v12_1 (copy), v3 (ref)
                    return v23:dispatch(v4.JoinSquad.API({
                        squadId = l_v11_1, 
                        leaveExisting = true
                    })):catch(function(_) --[[ Line: 18 ]]
                        -- upvalues: l_v12_1 (ref), v23 (copy), v3 (ref)
                        l_v12_1(v23, {
                            hideCancelButton = true, 
                            promptType = v3.Error
                        });
                    end);
                end);
            end));
        end;
    end;
end;