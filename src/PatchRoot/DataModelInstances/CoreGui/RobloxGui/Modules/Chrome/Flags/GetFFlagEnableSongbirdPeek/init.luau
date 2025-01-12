local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(l_script_FirstAncestor_0.Parent.ExperienceMenuABTestManager);
game:DefineFastFlag("EnableSongbirdPeek2", false);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1() and v2.default:shouldShowSongbirdPeek() then
        return true;
    else
        return game:GetFastFlag("EnableSongbirdPeek2");
    end;
end;