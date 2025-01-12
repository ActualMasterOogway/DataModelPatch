local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInitialization");
local v1 = require(l_script_FirstAncestor_0.Hooks.useRemoteAvatarUpdateEffect);
return function(v2) --[[ Line: 9 ]] --[[ Name: RemoteAvatarUpdateHandler ]]
    -- upvalues: v1 (copy)
    v1(v2.onUpdated);
    return nil;
end;