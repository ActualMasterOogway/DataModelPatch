local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
game:DefineFastFlag("TweakedMicPinning2", false);
local v1 = require(l_script_FirstAncestor_0.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(l_script_FirstAncestor_0.Parent.ExperienceMenuABTestManager);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1() and v2.default:shouldDockMic() then
        return true;
    else
        return game:GetFastFlag("TweakedMicPinning2");
    end;
end;