local l_Parent_0 = script.Parent.Parent;
local l_getDeepValue_0 = require(l_Parent_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy)
    return l_getDeepValue_0(v3, l_RODUX_KEY_0 .. "." .. "ShowContactImporterParams") or {};
end;