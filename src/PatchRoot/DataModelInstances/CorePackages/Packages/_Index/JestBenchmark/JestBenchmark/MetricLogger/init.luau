local l_Parent_0 = script:FindFirstAncestor("JestBenchmark").Parent;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local function v4(v2, v3) --[[ Line: 24 ]] --[[ Name: defaultMetricLogger ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.log((("%*, %*"):format(v2, v3)));
end;
local v5 = {
    log = v4
};
v5.useCustomMetricLogger = function(v6) --[[ Line: 32 ]]
    -- upvalues: v5 (copy)
    v5.log = v6;
end;
v5.useDefaultMetricLogger = function() --[[ Line: 36 ]]
    -- upvalues: v5 (copy), v4 (copy)
    v5.log = v4;
end;
return v5;