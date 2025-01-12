local v0 = game:DefineFastFlag("SelfieViewEnabled", false);
local v1 = require(script.Parent.Parent.Parent.Chrome.Enabled);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0 or v1();
end;