local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_ErrorQueue_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).ErrorQueue;
local v5 = require(script.Parent.removePII);
local v6 = require(script.Parent.Analytics).new();
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v8 = require(script.Parent.RobloxTelemetryConfigs.LuaShellErrors);
local v9 = require(script.Parent.RobloxTelemetryConfigs.LuaErrorV2CounterConfig);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagErrorCounter");
local v11 = game:DefineFastString("LuaErrorByPlatformCounter", "LuaErrorPlatformOther");
local v12 = game:DefineFastFlag("EnableLuaErrorV2Counter", false);
local v13 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitThreshold"));
local v14 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitIntervalInSec"));
local l_FVariable_1 = settings():GetFVariable("LuaAppsDiagRateLimitedErrorsCounter");
local v16 = 2 * v13;
local function _(v17) --[[ Line: 50 ]] --[[ Name: createProductName ]]
    -- upvalues: l_RunService_0 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    return string.format("%s-%s", v17, l_l_RunService_0_RobloxVersion_0);
end;
local function _(v20) --[[ Line: 55 ]] --[[ Name: convertNewlinesToPipes ]]
    local v21 = "";
    local v22 = true;
    for v23 in v20:gmatch("[^\r\n]+") do
        if v22 then
            v21 = v23;
            v22 = false;
        else
            v21 = v21 .. " | " .. v23;
        end;
    end;
    return v21;
end;
local function _(v25) --[[ Line: 69 ]] --[[ Name: removePlayerPersonalData ]]
    -- upvalues: v5 (copy)
    return v5(v25);
end;
local function v32(v27, v28, v29, v30) --[[ Line: 73 ]] --[[ Name: printError ]]
    local v31 = {
        "---- Unhandled Error Handler -----", 
        string.format("Current App<%s, %d> : \n%s\n", type(v27), #v27, v27), 
        string.format("Message<%s,%d> :\n%s\n", type(v28), #v28, v28), 
        string.format("Stack<%s,%d> :\n%s", type(v29), #v29, v29), 
        string.format("Script<%s> :\n%s", type(v30), v30:GetFullName()), 
        "----------------------------------"
    };
    print(table.concat(v31, "\n"));
end;
local function v36(_, v34, v35) --[[ Line: 87 ]]
    -- upvalues: v6 (copy)
    v6.GoogleAnalytics:trackEvent(v34.productName, v34.errorMessage, v34.errorStack, v35);
end;
local function _(v37, v38, v39, v40) --[[ Line: 99 ]] --[[ Name: reportErrorToRobloxTelemetry ]]
    -- upvalues: l_default_0 (copy), v8 (copy)
    local v41 = {
        app = v37, 
        err = v38, 
        stack = v39, 
        script = v40:GetFullName()
    };
    l_default_0:logRobloxTelemetryEvent(v8, nil, v41);
end;
local function _() --[[ Line: 110 ]] --[[ Name: reportErrorToDiag ]]
    -- upvalues: v6 (copy), l_FVariable_0 (copy)
    v6.Diag:reportCounter(l_FVariable_0, 1);
end;
local function _() --[[ Line: 115 ]] --[[ Name: reportErrorToDiagByPlatform ]]
    -- upvalues: v6 (copy), v11 (copy)
    v6.Diag:reportCounter(v11, 1);
end;
local function _() --[[ Line: 119 ]] --[[ Name: reportErrorRateLimitingToDiag ]]
    -- upvalues: v6 (copy), l_FVariable_1 (copy)
    v6.Diag:reportCounter(l_FVariable_1, 1);
end;
local v46 = {};
v46.__index = v46;
v46.new = function(v47, v48, v49) --[[ Line: 129 ]] --[[ Name: new ]]
    -- upvalues: l_ScriptContext_0 (copy), v14 (copy), v13 (copy), v46 (copy), l_ErrorQueue_0 (copy), v36 (copy), v3 (copy), l_RunService_0 (copy)
    if not v47 then
        v47 = l_ScriptContext_0.Error;
    end;
    v48 = v48 or v14;
    local v50 = {
        _isInstance = true, 
        _verbose = false, 
        _signalConnectionToken = nil, 
        _shouldReportDiag = true, 
        _shouldReportGoogleAnalytics = true, 
        _shouldReportInflux = true, 
        _currentApp = "Unknown", 
        _reportQueueGA = nil, 
        _backtraceReporter = v49, 
        _rateLimitingThreshold = v13, 
        _rateLimitingIntervalSec = v48, 
        _rateLimitCounts = {}, 
        _rateLimitNextTick = tick() + v48
    };
    setmetatable(v50, v46);
    v50._reportQueueGA = l_ErrorQueue_0.new(v36, {
        queueKeyLimit = 10
    });
    v50._signalConnectionToken = v47:connect(function(v51, v52, v53, v54) --[[ Line: 171 ]]
        -- upvalues: v3 (ref), v50 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 173 ]]
            -- upvalues: v3 (ref), v51 (ref), v52 (ref), v54 (ref), v50 (ref), v53 (copy)
            local v55, v56 = v3.unstable_parseReactError(v51);
            v51 = v55.message;
            v52 = v55.stack or v52;
            v54 = v54 or v56;
            v50:handleError(v51, v52, v53, v54);
        end);
        if not l_status_0 then
            warn(string.format("An error occurred while reporting an error : %s", l_result_0));
        end;
    end);
    if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ then
        game:BindToClose(function() --[[ Line: 200 ]]
            -- upvalues: v50 (copy)
            v50:delete();
        end);
    end;
    v50._rateLimitHeartbeatConnectionToken = l_RunService_0.Heartbeat:connect(function() --[[ Line: 206 ]]
        -- upvalues: v50 (copy)
        local v59 = tick();
        if v50._rateLimitNextTick < v59 then
            v50:_processRateLimitingTick();
            v50._rateLimitNextTick = v59 + v50._rateLimitingIntervalSec;
        end;
    end);
    return v50;
end;
v46._processRateLimitingTick = function(v60) --[[ Line: 237 ]] --[[ Name: _processRateLimitingTick ]]
    -- upvalues: v16 (copy), v6 (copy), l_FVariable_1 (copy)
    local v61 = 0;
    for v62, v63 in pairs(v60._rateLimitCounts) do
        if v60._rateLimitingThreshold <= v63 then
            v61 = v61 + 1;
        end;
        local v64 = v63 - v60._rateLimitingThreshold;
        if v16 < v64 then
            v60._rateLimitCounts[v62] = v16;
        elseif v64 <= 0 then
            v60._rateLimitCounts[v62] = nil;
        else
            v60._rateLimitCounts[v62] = v64;
        end;
    end;
    if v61 > 0 then
        v6.Diag:reportCounter(l_FVariable_1, 1);
    end;
end;
v46._processErrorForRateLimiting = function(v65, v66, v67) --[[ Line: 260 ]] --[[ Name: _processErrorForRateLimiting ]]
    local v68 = v66 .. v67;
    local v69 = v65._rateLimitCounts[v68] or 0;
    v65._rateLimitCounts[v68] = v69 + 1;
    return v65._rateLimitingThreshold <= v69;
end;
v46.delete = function(v70) --[[ Line: 268 ]] --[[ Name: delete ]]
    if v70._rateLimitHeartbeatConnectionToken ~= nil then
        v70._rateLimitHeartbeatConnectionToken:disconnect();
    end;
    v70._signalConnectionToken:disconnect();
    v70._reportQueueGA:reportAllErrors();
    v70._reportQueueGA:stopTimer();
    if v70._backtraceReporter ~= nil then
        v70._backtraceReporter:stop();
    end;
end;
v46.setCurrentApp = function(v71, v72) --[[ Line: 286 ]] --[[ Name: setCurrentApp ]]
    if type(v72) ~= "string" then
        error("appName must be a string");
    end;
    v71._currentApp = v72;
end;
v46.startQueueTimers = function(v73) --[[ Line: 294 ]] --[[ Name: startQueueTimers ]]
    v73._reportQueueGA:startTimer();
end;
v46.stopQueueTimers = function(v74) --[[ Line: 298 ]] --[[ Name: stopQueueTimers ]]
    v74._reportQueueGA:stopTimer();
end;
v46.handleError = function(v75, v76, v77, v78, v79) --[[ Line: 306 ]] --[[ Name: handleError ]]
    -- upvalues: l_RunService_0 (copy), v32 (copy), v5 (copy), l_default_0 (copy), v8 (copy), v12 (copy), v9 (copy), v6 (copy), l_FVariable_0 (copy), v11 (copy)
    local l__currentApp_0 = v75._currentApp;
    local l_l_RunService_0_RobloxVersion_1 = l_RunService_0:GetRobloxVersion();
    local v82 = string.format("%s-%s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
    if v75._verbose then
        v32(v82, v76, v77, v78);
    end;
    l__currentApp_0 = v5(v76);
    l_l_RunService_0_RobloxVersion_1 = v5(v77);
    local v83 = "";
    local v84 = true;
    for v85 in l_l_RunService_0_RobloxVersion_1:gmatch("[^\r\n]+") do
        if v84 then
            v83 = v85;
            v84 = false;
        else
            v83 = v83 .. " | " .. v85;
        end;
    end;
    local l_v83_0 = v83;
    if v79 ~= nil then
        v79 = v5(v79);
    end;
    if v75:_processErrorForRateLimiting(l__currentApp_0, l_v83_0) then
        return;
    else
        v83 = string.format("%s | %s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
        if v75._shouldReportGoogleAnalytics then
            v75._reportQueueGA:addError(v83, {
                productName = v82, 
                errorMessage = l__currentApp_0, 
                errorStack = l_v83_0
            });
        end;
        if v75._backtraceReporter ~= nil then
            v75._backtraceReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v79);
        end;
        if v75._shouldReportInflux then
            v84 = {
                app = v82, 
                err = l__currentApp_0, 
                stack = l_v83_0, 
                script = v78:GetFullName()
            };
            l_default_0:logRobloxTelemetryEvent(v8, nil, v84);
        end;
        if v75._shouldReportDiag then
            if v12 then
                l_default_0:logRobloxTelemetryCounter(v9, 1);
            end;
            v6.Diag:reportCounter(l_FVariable_0, 1);
            v6.Diag:reportCounter(v11, 1);
        end;
        return;
    end;
end;
return v46;