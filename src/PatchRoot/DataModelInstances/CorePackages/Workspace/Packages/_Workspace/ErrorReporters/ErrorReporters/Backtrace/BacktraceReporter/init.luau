local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.BacktraceReport);
local v5 = require(script.Parent.Parent.ErrorQueue);
local v6 = l_RunService_0:IsStudio();
local v7 = game:DefineFastInt("OldestUAVersionToReportErrors", 0);
local v8 = {};
v8.__index = v8;
local v9 = v3.strictInterface({
    httpService = v3.some(v3.instanceOf("HttpService"), v3.interface({
        JSONEncode = v3.callback, 
        JSONDecode = v3.callback, 
        RequestInternal = v3.callback
    })), 
    token = v3.string, 
    processErrorReportMethod = v3.optional(v3.callback), 
    queueOptions = v3.optional(v3.table), 
    generateLogMethod = v3.optional(v3.callback), 
    logIntervalInSeconds = v3.optional(v3.numberPositive)
});
v8.new = function(v10) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v6 (copy), v8 (copy), v5 (copy)
    local v11, v12 = v9(v10);
    local v13 = nil;
    if v11 then
        v13 = {
            _isEnabled = true, 
            _httpService = v10.httpService, 
            _errorQueue = nil, 
            _reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. v10.token, 
            _processErrorReportMethod = v10.processErrorReportMethod, 
            _sharedAttributes = {}, 
            _sharedAnnotations = {}, 
            _generateLogMethod = v10.generateLogMethod, 
            _logIntervalInSeconds = v10.logIntervalInSeconds or 60, 
            _lastLogTime = 0
        };
    elseif v6 or _G.__DEV__ then
        error("invalid arguments for BacktraceReporter: " .. v12);
    else
        v13 = {
            _isEnabled = false
        };
    end;
    setmetatable(v13, v8);
    if v13._isEnabled then
        local v14 = v5.new(function(...) --[[ Line: 71 ]]
            -- upvalues: v13 (ref)
            v13:_reportErrorFromErrorQueue(...);
        end, v10.queueOptions);
        v13._errorQueue = v14;
        v13._errorQueue:startTimer();
    end;
    return v13;
end;
v8.isTooOldToReportErrors = function(_) --[[ Line: 84 ]] --[[ Name: isTooOldToReportErrors ]]
    -- upvalues: l_RunService_0 (copy), v7 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v17 = tonumber(string.match(l_l_RunService_0_RobloxVersion_0, ".(%d+)."));
    if not v17 then
        return false;
    elseif v17 < v7 then
        return true;
    else
        return false;
    end;
end;
v8.sendErrorReport = function(v18, v19, v20) --[[ Line: 96 ]] --[[ Name: sendErrorReport ]]
    -- upvalues: v6 (copy)
    if not v18._isEnabled then
        return;
    elseif v18:isTooOldToReportErrors() then
        return;
    else
        if v6 or _G.__DEV__ then
            assert(v19:validate());
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 112 ]]
            -- upvalues: v18 (copy), v19 (copy)
            return v18._httpService:JSONEncode(v19);
        end);
        if not l_status_0 then
            warn("Cannot convert report to Json");
            return;
        else
            pcall(function() --[[ Line: 121 ]]
                -- upvalues: v18 (copy), l_result_0 (copy), v20 (copy)
                v18._httpService:RequestInternal({
                    Url = v18._reportUrl .. "&format=json", 
                    Method = "POST", 
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }, 
                    Body = l_result_0
                }):Start(function(_, v24) --[[ Line: 131 ]]
                    -- upvalues: v20 (ref), v18 (ref)
                    if v24.StatusCode == 200 and v20 ~= nil then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 135 ]]
                            -- upvalues: v18 (ref), v24 (copy)
                            return v18._httpService:JSONDecode(v24.Body);
                        end);
                        if l_status_1 and l_result_1._rxid ~= nil then
                            v18:_sendLogToReport(l_result_1._rxid, v20);
                        end;
                    end;
                end);
            end);
            return;
        end;
    end;
end;
v8._sendLogToReport = function(v27, v28, v29) --[[ Line: 147 ]] --[[ Name: _sendLogToReport ]]
    if type(v29) ~= "string" or #v29 == 0 then
        return;
    else
        pcall(function() --[[ Line: 152 ]]
            -- upvalues: v27 (copy), v28 (copy), v29 (copy)
            v27._httpService:RequestInternal({
                Url = v27._reportUrl .. "&object=" .. v28 .. "&attachment_name=log.txt", 
                Method = "POST", 
                Headers = {
                    ["Content-Type"] = "text/plain"
                }, 
                Body = v29
            }):Start(function(_, _) --[[ Line: 162 ]]

            end);
        end);
        return;
    end;
end;
v8._generateLog = function(v32) --[[ Line: 168 ]] --[[ Name: _generateLog ]]
    if v32._generateLogMethod ~= nil and tick() - v32._lastLogTime > v32._logIntervalInSeconds then
        v32._lastLogTime = tick();
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 172 ]]
            -- upvalues: v32 (copy)
            return v32._generateLogMethod();
        end);
        if l_status_2 and type(l_result_2) == "string" and #l_result_2 > 0 then
            return l_result_2;
        end;
    end;
    return nil;
end;
v8._generateErrorReport = function(v35, v36, v37, v38) --[[ Line: 184 ]] --[[ Name: _generateErrorReport ]]
    -- upvalues: v4 (copy)
    local v39 = nil;
    v39 = if type(v38) == "table" then v4.fromDetails(v38) else v4.fromMessageAndStack(v36, v37);
    v39:addAttributes(v35._sharedAttributes);
    v39:addAnnotations(v35._sharedAnnotations);
    if type(v38) == "string" and v38 ~= "" then
        v39:addAnnotations({
            stackDetails = v38
        });
    end;
    return v39;
end;
v8.reportErrorImmediately = function(v40, v41, v42, v43) --[[ Line: 206 ]] --[[ Name: reportErrorImmediately ]]
    if not v40._isEnabled then
        return;
    else
        local v44 = v40:_generateErrorReport(v41, v42, v43);
        if v40._processErrorReportMethod ~= nil then
            v44 = v40._processErrorReportMethod(v44);
        end;
        v40:sendErrorReport(v44, (v40:_generateLog()));
        return;
    end;
end;
v8.reportErrorDeferred = function(v45, v46, v47, v48) --[[ Line: 223 ]] --[[ Name: reportErrorDeferred ]]
    if not v45._isEnabled then
        return;
    else
        local v49 = string.format("%s | %s", v46, v47);
        local v50 = {};
        if not v45._errorQueue:hasError(v49) then
            local v51 = v45:_generateErrorReport(v46, v47, v48);
            if v45._processErrorReportMethod ~= nil then
                v51 = v45._processErrorReportMethod(v51);
            end;
            v50 = {
                backtraceReport = v51, 
                log = v45:_generateLog()
            };
        end;
        v45._errorQueue:addError(v49, v50);
        return;
    end;
end;
v8._reportErrorFromErrorQueue = function(v52, _, v54, v55) --[[ Line: 250 ]] --[[ Name: _reportErrorFromErrorQueue ]]
    local l_backtraceReport_0 = v54.backtraceReport;
    local l_log_0 = v54.log;
    l_backtraceReport_0:addAttributes({
        ErrorCount = v55
    });
    v52:sendErrorReport(l_backtraceReport_0, l_log_0);
end;
local l_IAttributes_0 = v4.IAttributes;
v8.updateSharedAttributes = function(v59, v60) --[[ Line: 264 ]] --[[ Name: updateSharedAttributes ]]
    -- upvalues: v2 (copy), l_IAttributes_0 (copy), v6 (copy)
    local v61 = v2.Dictionary.join(v59._sharedAttributes, v60);
    local v62, v63 = l_IAttributes_0(v61);
    if not v62 then
        if v6 or _G.__DEV__ then
            assert(v62, v63);
        else
            return;
        end;
    end;
    v59._sharedAttributes = v61;
end;
local l_IAnnotations_0 = v4.IAnnotations;
v8.updateSharedAnnotations = function(v65, v66) --[[ Line: 283 ]] --[[ Name: updateSharedAnnotations ]]
    -- upvalues: v2 (copy), l_IAnnotations_0 (copy), v6 (copy)
    local v67 = v2.Dictionary.join(v65._sharedAnnotations, v66);
    local v68, v69 = l_IAnnotations_0(v67);
    if not v68 then
        if v6 or _G.__DEV__ then
            assert(v68, v69);
        else
            return;
        end;
    end;
    v65._sharedAnnotations = v67;
end;
v8.reportAllErrors = function(v70) --[[ Line: 300 ]] --[[ Name: reportAllErrors ]]
    if v70._errorQueue ~= nil then
        v70._errorQueue:reportAllErrors();
    end;
end;
v8.stop = function(v71) --[[ Line: 306 ]] --[[ Name: stop ]]
    v71._isEnabled = false;
    if v71._errorQueue ~= nil then
        v71:reportAllErrors();
        v71._errorQueue:stopTimer();
    end;
end;
return v8;