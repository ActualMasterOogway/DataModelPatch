local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.audio.getAudibleVolume);
return function(v2) --[[ Line: 18 ]] --[[ Name: isAudible ]]
    -- upvalues: v1 (copy)
    return v1(v2) > 0.01;
end;