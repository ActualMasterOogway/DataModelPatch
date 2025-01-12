local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v2 = game:DefineFastFlag("RealNamesInDisplayNameExperimentRunning", false);
return function() --[[ Line: 7 ]]
    -- upvalues: l_useAppPolicy_0 (copy), v2 (copy)
    return l_useAppPolicy_0(function(v3) --[[ Line: 8 ]]
        -- upvalues: v2 (ref)
        if v2 then
            return true;
        else
            return v3.getRealNamesInDisplayNamesEnabled();
        end;
    end);
end;