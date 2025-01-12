game:DefineFastFlag("SelfieViewHideCameraStatusDot", false);
local v0 = require(script.Parent.Parent.Parent.IsExperienceMenuABTestEnabled);
local v1 = require(script.Parent.Parent.Parent.ExperienceMenuABTestManager);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0() and v1.default:shouldShowStaticSelfView() then
        return true;
    else
        return game:GetFastFlag("SelfieViewHideCameraStatusDot");
    end;
end;