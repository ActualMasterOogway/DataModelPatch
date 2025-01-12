local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_Logging_0 = v1.Logging;
local l_Parent_1 = l_Parent_0.Parent;
local l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 = require(l_Parent_1.SharedFlags).FFlagEnableAuthAnalyticsPrintDebuggingDev;
return function(v7, v8, v9) --[[ Line: 10 ]]
    -- upvalues: l_Logging_0 (copy), l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 (copy), v3 (copy)
    local v10 = {};
    for v11, v12 in pairs(v9) do
        if type(v11) == "string" then
            v10[v11] = v12;
        else
            l_Logging_0.warn("Failure logging " .. v8 .. ": Expected " .. v11 .. " to be a string key but got " .. type(v11));
            return;
        end;
    end;
    if l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 then
        local v13 = "";
        for v14, v15 in pairs(v10) do
            v13 = v13 .. v14 .. ": " .. tostring(v15) .. ", ";
        end;
        v13 = string.sub(v13, 1, -3);
        print("Emitting EventIngest " .. v8 .. ", context " .. v7 .. " with args: " .. v13);
    end;
    v3:sendEventDeferred(v7, v8, v10);
end;