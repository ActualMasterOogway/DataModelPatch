game:DefineFastFlag("SideNavControllerBar", false);
local v0 = require(script.Parent.GetFFlagIGMGamepadSelectionHistory);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("SideNavControllerBar") and v0();
end;