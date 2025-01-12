local l_RunService_0 = game:GetService("RunService");
local l_LogService_0 = game:GetService("LogService");
local function v5(v2, v3) --[[ Line: 6 ]] --[[ Name: waitUntil ]]
    -- upvalues: l_RunService_0 (copy)
    v3 = v3 or 1;
    local v4 = 0;
    while v4 < v3 and not v2() do
        v4 = v4 + l_RunService_0.Heartbeat:Wait();
    end;
end;
return function() --[[ Line: 14 ]] --[[ Name: waitForTestSuiteFinished ]]
    -- upvalues: v5 (copy), l_LogService_0 (copy)
    v5(function() --[[ Line: 15 ]]
        -- upvalues: l_LogService_0 (ref)
        local l_l_LogService_0_LogHistory_0 = l_LogService_0:GetLogHistory();
        for _, v8 in ipairs(l_l_LogService_0_LogHistory_0) do
            if string.match(v8.message, "%d+ passed, %d+ failed, %d+ skipped") then
                return true;
            end;
        end;
        return false;
    end, 300);
end;