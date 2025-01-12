local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v10 = require(l_RobloxGui_0.Modules.ErrorReporting.RateLimiter);
local v11 = require(l_RobloxGui_0.Modules.ErrorReporting.PiiFilter);
local l_BacktraceReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).BacktraceReporter;
local v13 = require(l_CorePackages_0.Packages.React);
game:DefineFastFlag("DisableCorescriptBacktraceReporting", false);
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "");
game:DefineFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds", 300);
game:DefineFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting", true);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount", 5);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod", 60);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10);
game:DefineFastInt("CoreScriptBacktraceErrorReportPercentage", 100);
local function _() --[[ Line: 41 ]] --[[ Name: CanReportCoreScriptBacktrace ]]
    return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100);
end;
if not game:GetFastFlag("DisableCorescriptBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100) then
    local v15 = {
        LocalVersion = l_RunService_0:GetRobloxVersion(), 
        BaseUrl = l_ContentProvider_0.BaseUrl, 
        PlaceId = game.PlaceId, 
        Platform = l_UserInputService_0:GetPlatform().Name, 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion()
    };
    local v16 = v11.new({
        eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
    });
    local l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting");
    local v18 = nil;
    if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
        v18 = v10.new({
            period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"), 
            threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"), 
            processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
        });
    end;
    local v20 = l_BacktraceReporter_0.new({
        httpService = l_HttpService_0, 
        token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"), 
        processErrorReportMethod = function(v19) --[[ Line: 75 ]] --[[ Name: processReport ]]
            -- upvalues: v15 (copy), l_Players_0 (copy), l_RunService_0 (copy)
            v19:addAttributes(v15);
            v19:addAttributes({
                PlayerCount = #l_Players_0:GetPlayers()
            });
            v19:addAttributes({
                RobloxChannel = l_RunService_0:GetRobloxClientChannel()
            });
            return v19;
        end
    });
    do
        local l_v18_0 = v18;
        local function v31(v22, v23, v24, v25) --[[ Line: 96 ]] --[[ Name: handleErrorDetailed ]]
            -- upvalues: l_CoreGui_0 (copy), l_CorePackages_0 (copy), v13 (copy), v16 (copy), l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 (copy), l_v18_0 (ref), v20 (copy)
            if v24 ~= nil and (v24:IsDescendantOf(l_CoreGui_0) or v24:IsDescendantOf(l_CorePackages_0)) then
                local v26, v27 = v13.unstable_parseReactError(v22);
                v22 = v26.message;
                v23 = v26.stack or v23;
                v25 = v25 or v27;
                local v28 = v16:cleanPii(v22);
                local v29 = v16:cleanPii(v23);
                if v25 ~= nil then
                    v25 = v16:cleanPii(v25);
                end;
                if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
                    local v30 = v28 .. v29;
                    if l_v18_0:isRateLimited(v30) then
                        return;
                    else
                        l_v18_0:increment(v30);
                    end;
                end;
                v20:reportErrorDeferred(v28, v29, v25);
            end;
        end;
        l_ScriptContext_0.ErrorDetailed:Connect(function(...) --[[ Line: 134 ]]
            -- upvalues: v31 (copy)
            local l_status_0, l_result_0 = pcall(v31, ...);
            if not l_status_0 then
                warn(("CoreScript error reporter failed to handle an error:\n%s"):format(l_result_0));
            end;
        end);
        v15.ServerVersion = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999):InvokeServer();
    end;
end;