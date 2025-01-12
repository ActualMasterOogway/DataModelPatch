local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v3 = {};
v3.__index = v3;
v3.SecondsBetweenUpdate = 1;
v3.NumSamplesToKeep = 20;
local v4 = nil;
v3.getSingleton = function() --[[ Line: 24 ]] --[[ Name: getSingleton ]]
    -- upvalues: v4 (ref), v3 (copy)
    if v4 == nil then
        v4 = v3.__new();
        v4:StartListening();
    end;
    return v4;
end;
v3.__new = function() --[[ Line: 33 ]] --[[ Name: __new ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = {};
    setmetatable(v5, v3);
    v5._statsAggregators = {};
    for _, v7 in ipairs(v1.AllStatTypes) do
        local v8 = v2.new(v7, v3.NumSamplesToKeep, v3.SecondsBetweenUpdate);
        v5._statsAggregators[v7] = v8;
    end;
    return v5;
end;
v3.StartListening = function(v9) --[[ Line: 50 ]] --[[ Name: StartListening ]]
    for _, v11 in pairs(v9._statsAggregators) do
        v11:StartListening();
    end;
end;
v3.StopListening = function(v12) --[[ Line: 56 ]] --[[ Name: StopListening ]]
    for _, v14 in pairs(v12._statsAggregators) do
        v14:StopListening();
    end;
end;
v3.GetAggregator = function(v15, v16) --[[ Line: 62 ]] --[[ Name: GetAggregator ]]
    return v15._statsAggregators[v16];
end;
return v3;