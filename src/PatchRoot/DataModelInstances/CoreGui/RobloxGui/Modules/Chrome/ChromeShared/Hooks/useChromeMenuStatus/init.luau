local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local v1 = require(l_script_FirstAncestor_0.Service);
local v2 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2(v1:status());
end;