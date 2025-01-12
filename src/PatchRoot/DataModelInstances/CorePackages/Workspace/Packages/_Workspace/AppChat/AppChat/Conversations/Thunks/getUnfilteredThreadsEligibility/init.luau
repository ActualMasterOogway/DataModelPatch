local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v7) --[[ Line: 16 ]]
        -- upvalues: v5 (ref), v2 (ref), v6 (copy), v3 (ref), v4 (ref)
        local v10 = if v5() then v7:dispatch(v2.rodux.GetChatLandingModal.API(v6)):catch(function(v8) --[[ Line: 18 ]]
            -- upvalues: v3 (ref)
            v3:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v8)));
        end) else v7:dispatch(v2.rodux.GetUnfilteredThreadsFtuxModal.API()):catch(function(v9) --[[ Line: 21 ]]
            -- upvalues: v3 (ref)
            v3:warning("Error in GetUnfilteredThreadsFtuxModal request. Error: {}", (tostring(v9)));
        end);
        return v4.all({
            v7:dispatch(v2.rodux.GetUnfilteredThreadEligibility.API()):catch(function(v11) --[[ Line: 25 ]]
                -- upvalues: v3 (ref)
                v3:warning("Error in GetUnfilteredThreadsEligibility request. Error: {}", (tostring(v11)));
            end), 
            v10
        }):andThen(function(v12) --[[ Line: 29 ]]
            -- upvalues: v5 (ref)
            return {
                GetUnfilteredThreadsEligibility = v12[1], 
                GetUnfilteredThreadsFtuxModal = if v5() then nil else v12[2], 
                GetChatLandingModal = if v5() then v12[2] else nil
            };
        end);
    end;
end;