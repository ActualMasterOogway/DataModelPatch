local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoice);
return function() --[[ Line: 5 ]] --[[ Name: CrossExperienceVoiceComponent ]]
    -- upvalues: v1 (copy)
    v1();
    return nil;
end;