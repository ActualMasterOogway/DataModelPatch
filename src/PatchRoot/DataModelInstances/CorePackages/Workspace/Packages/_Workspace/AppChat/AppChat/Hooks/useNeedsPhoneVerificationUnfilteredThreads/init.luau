local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useCallback_0 = require(l_Parent_0.React).useCallback;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v5 = require(l_script_FirstAncestor_0.Utils.getNeedsPhoneVerificationUnfilteredThreads);
local v6 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
return function() --[[ Line: 12 ]]
    -- upvalues: v6 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v4 (copy), v5 (copy)
    local v7 = v6();
    local v9 = l_useSelector_0(l_useCallback_0(function(v8) --[[ Line: 15 ]]
        -- upvalues: v4 (ref)
        return v4(v8, "ChatAppReducer.UnfilteredThreads.eligibility") or {};
    end, {}));
    if v7 then
        return false;
    else
        return v5(v9);
    end;
end;