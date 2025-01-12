game:DefineFastFlag("EnableUISoundAndHaptics9", false);
local v0 = require(script.Parent.UIBlox.FFlagUIBloxUseNewInteractable);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return v0 and game:GetFastFlag("EnableUISoundAndHaptics9");
end;