local l_script_FirstAncestor_0 = script:FindFirstAncestor("QueryRefetch");
local v1 = require(l_script_FirstAncestor_0.Hooks.usePlatformNameQueryRefetch);
return function(v2) --[[ Line: 8 ]] --[[ Name: QueryRefetchManager ]]
    -- upvalues: v1 (copy)
    v1(v2.robloxEventReceiver);
    return nil;
end;