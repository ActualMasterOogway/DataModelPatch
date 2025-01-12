local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_Parent_0.TenFootUiCommon);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: useProcessNavigationStateChange ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy)
    local v7 = l_useDispatch_0();
    return (v2.useCallback(function(_, v9, _) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v7 (copy), v5 (copy)
        if v6 then
            v6(v9);
        end;
        v7(v5(v9));
    end, {
        v7, 
        v5, 
        v6
    }));
end;