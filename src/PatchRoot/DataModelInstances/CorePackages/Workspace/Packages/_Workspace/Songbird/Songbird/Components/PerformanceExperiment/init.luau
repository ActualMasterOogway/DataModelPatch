local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_useAudibleSounds_0 = require(l_script_FirstAncestor_0.Parent.ReactSceneUnderstanding).useAudibleSounds;
return function() --[[ Line: 7 ]] --[[ Name: PerformanceExperiment ]]
    -- upvalues: l_useAudibleSounds_0 (copy)
    l_useAudibleSounds_0();
    return nil;
end;