local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.NetworkProfiler);
local _ = require(l_script_FirstAncestor_0.RequestTypes);
local v6 = require(l_script_FirstAncestor_0.StatusCodes);
local v7 = require(l_script_FirstAncestor_0.NetworkLayers.HttpCanceller);
local v8 = game:DefineFastFlag("EnableErrorLoggingForAPICallsV1", false);
local l_GetFFlagEnableCounterLoggingForAPICalls_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCounterLoggingForAPICalls;
local v10 = require(l_script_FirstAncestor_0.Logger.GreenlistedEndpointsForErrorLogging);
local v11 = require(l_script_FirstAncestor_0.Logger.GreenlistedEndpointsForLogging);
local v12 = game:DefineFastFlag("LuaAppHttpNativeRetry", false);
local v13 = game:DefineFastFlag("LuaAppHttpSupportNoContent", false);
local v14 = game:DefineFastFlag("EnableRetryOnPrefetch401", false);
local l_None_0 = Enum.HttpCachePolicy.None;
local v16 = {
    [v6.REQUEST_TIMEOUT] = true, 
    [v6.SERVICE_UNAVAILABLE] = true, 
    [v6.GATEWAY_TIMEOUT] = true
};
local v17 = {};
v17.__index = v17;
local function _(v18) --[[ Line: 42 ]] --[[ Name: parseResponseBody ]]
    -- upvalues: v6 (copy), l_HttpService_0 (copy)
    if v18.StatusCode == v6.NO_CONTENT then
        return true, nil;
    else
        local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v18.Body);
        return l_status_0, l_result_0;
    end;
end;
v17.new = function(v22, v23, v24, v25) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_None_0 (copy), v17 (copy)
    local v26 = {
        resolve = nil, 
        reject = nil, 
        retryCount = 0, 
        maxRetryCount = v25 and v25.maxRetryCount or 4, 
        httpRequest = nil, 
        canceled = false, 
        httpService = v22, 
        session = v7.currentSession(), 
        internalOptions = {
            Url = v23, 
            Method = v24 and v24 or "GET", 
            Body = v25 and v25.postBody or nil, 
            Timeout = v25 and v25.timeout or 15000, 
            CachePolicy = v25 and v25.cachePolicy or l_None_0, 
            Priority = v25 and v25.priority or 0, 
            Headers = v25 and v25.headers or nil, 
            RequestType = v25 and v25.requestType or nil
        }
    };
    if (v24 == "POST" or v24 == "PATCH") and (v26.internalOptions.Headers == nil or v26.internalOptions.Headers["Content-Type"] == nil) then
        v26.internalOptions.Headers = v26.internalOptions.Headers or {};
        v26.internalOptions.Headers["Content-Type"] = "application/json";
    end;
    setmetatable(v26, v17);
    return v26;
end;
v17.start = function(v27, v28, v29) --[[ Line: 85 ]] --[[ Name: start ]]
    v27.resolve = v28;
    v27.reject = v29;
    v27:makeRequest();
end;
v17.processResponse = function(v30, v31) --[[ Line: 91 ]] --[[ Name: processResponse ]]
    -- upvalues: v13 (copy), v6 (copy), l_HttpService_0 (copy), v4 (copy), l_GetFFlagEnableCounterLoggingForAPICalls_0 (copy), v11 (copy)
    local v32 = nil;
    local v33 = nil;
    if v13 then
        local v34, v35;
        if v31.StatusCode == v6.NO_CONTENT then
            v34 = true;
            v35 = nil;
        else
            local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v31.Body);
            v34 = l_status_1;
            v35 = l_result_1;
        end;
        v32 = v34;
        v33 = v35;
    else
        local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v31.Body);
        v32 = l_status_2;
        v33 = l_result_2;
    end;
    if not v32 then
        v30.reject({
            HttpError = Enum.HttpError.OK, 
            isJSONValid = false
        });
        return;
    else
        v4:track({
            queued = v31.Stats.DurationInQueue, 
            nameLookup = v31.Stats.DurationNameLookup, 
            connect = v31.Stats.DurationConnect, 
            sslHandshake = v31.Stats.DurationSSLHandshake, 
            makeRequest = v31.Stats.DurationMakeRequest, 
            receiveResponse = v31.Stats.DurationReceiveResponse
        });
        local v40 = v31.Stats.RoundTripTime * 1000;
        local v41 = if v31.Body and typeof(v31.Body) == "string" then #v31.Body else 0;
        local v42 = {
            responseCode = v31.StatusCode, 
            requestUrl = v30.internalOptions.Url, 
            responseTimeMs = v40, 
            isJSONValid = true, 
            v33, 
            responseBody = v33, 
            responseStats = v31.Stats, 
            responseSize = v41
        };
        v30.resolve(v42);
        if l_GetFFlagEnableCounterLoggingForAPICalls_0() then
            v11.sendStatusCodeCounter(v30.internalOptions.Url, v31.StatusCode);
        end;
        return;
    end;
end;
v17.retry = function(v43, v44, v45) --[[ Line: 131 ]] --[[ Name: retry ]]
    -- upvalues: v12 (copy)
    local v46 = true;
    if v12 and v44.Stats and v44.Stats.WasRequestRetried then
        v46 = false;
    end;
    if v46 then
        v43.retryCount = v43.retryCount + 1;
        if v43.retryCount > v43.maxRetryCount then
            v46 = false;
        end;
    end;
    if not v46 then
        v43.reject(v44);
        return;
    else
        if v43.internalOptions.Headers == nil then
            v43.internalOptions.Headers = {};
        end;
        v43.internalOptions.Headers["X-Retry-Attempt"] = tostring(v43.retryCount);
        local v47 = v45 or math.pow(2, v43.retryCount);
        delay(v47, function() --[[ Line: 157 ]]
            -- upvalues: v43 (copy)
            v43:makeRequest();
        end);
        return;
    end;
end;
v17.makeRequest = function(v48) --[[ Line: 162 ]] --[[ Name: makeRequest ]]
    -- upvalues: v7 (copy), v16 (copy), v14 (copy), v6 (copy), v8 (copy), l_GetFFlagEnableCounterLoggingForAPICalls_0 (copy), v11 (copy), v10 (copy)
    if v48.canceled then
        return;
    else
        v48.httpRequest = v48.httpService:RequestInternal(v48.internalOptions);
        v48.httpRequest:Start(function(v49, v50) --[[ Line: 169 ]]
            -- upvalues: v48 (copy), v7 (ref), v16 (ref), v14 (ref), v6 (ref), v8 (ref), l_GetFFlagEnableCounterLoggingForAPICalls_0 (ref), v11 (ref), v10 (ref)
            if v48.session ~= v7.currentSession() then
                warn("Http request aborted", v48.internalOptions.Url);
                return;
            elseif v49 then
                if v50.StatusCode >= 200 and v50.StatusCode < 400 then
                    v48:processResponse(v50);
                    return;
                elseif v16[v50.StatusCode] then
                    v48:retry(v50);
                    return;
                elseif v14 and v50.IsPrefetch and v50.StatusCode == v6.UNAUTHORIZED then
                    v48:retry(v50);
                    return;
                elseif v50.StatusCode == v6.TOO_MANY_REQUESTS and v50.Headers["Retry-After"] then
                    local v51 = tonumber(v50.Headers["Retry-After"]);
                    if v51 ~= nil and v51 <= 16 then
                        v48:retry(v50, v51);
                        return;
                    else
                        if v8 then
                            if l_GetFFlagEnableCounterLoggingForAPICalls_0() then
                                v11.sendStatusCodeCounter(v48.internalOptions.Url, v50.StatusCode);
                            else
                                v10.sendCounterIfKeyMatchesFetchStatus(v48.internalOptions.Url, v50.StatusCode);
                            end;
                        end;
                        v48.reject(v50);
                        return;
                    end;
                else
                    if v8 then
                        if l_GetFFlagEnableCounterLoggingForAPICalls_0() then
                            v11.sendStatusCodeCounter(v48.internalOptions.Url, v50.StatusCode);
                        else
                            v10.sendCounterIfKeyMatchesFetchStatus(v48.internalOptions.Url, v50.StatusCode);
                        end;
                    end;
                    v48.reject(v50);
                    return;
                end;
            else
                if not v48.canceled then
                    v48:retry({
                        HttpError = v50.HttpError
                    });
                end;
                return;
            end;
        end);
        return;
    end;
end;
v17.cancel = function(v52) --[[ Line: 233 ]] --[[ Name: cancel ]]
    v52.canceled = true;
    v52.reject({
        HttpError = Enum.HttpError.Aborted
    });
    if v52.httpRequest then
        v52.httpRequest:Cancel();
    end;
end;
return function(v53) --[[ Line: 241 ]] --[[ Name: createRequestInternalWrapper ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy), v3 (copy)
    if not v53 then
        v53 = l_HttpService_0;
    end;
    return function(v54, v55, v56) --[[ Line: 246 ]] --[[ Name: makeRequest ]]
        -- upvalues: v17 (ref), v53 (ref), v3 (ref)
        local v57 = v17.new(v53, v54, v55, v56);
        return v3.new(function(v58, v59) --[[ Line: 249 ]]
            -- upvalues: v57 (copy)
            v57:start(v58, v59);
        end), function() --[[ Line: 253 ]] --[[ Name: cancel ]]
            -- upvalues: v57 (copy)
            v57:cancel();
        end;
    end;
end;