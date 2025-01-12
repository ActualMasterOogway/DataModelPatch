local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getDefaultValue_0 = require(l_Parent_1.SharedUtils).getDefaultValue;
local _ = require(l_Parent_0.Types);
local v4 = {
    [Enum.HttpError.OK] = "OK", 
    [Enum.HttpError.InvalidUrl] = "InvalidUrl", 
    [Enum.HttpError.DnsResolve] = "DnsResolve", 
    [Enum.HttpError.ConnectFail] = "ConnectFail", 
    [Enum.HttpError.OutOfMemory] = "OutOfMemory", 
    [Enum.HttpError.TimedOut] = "Timedout", 
    [Enum.HttpError.TooManyRedirects] = "TooManyRedirects", 
    [Enum.HttpError.InvalidRedirect] = "InvalidRedirect", 
    [Enum.HttpError.NetFail] = "NetFail", 
    [Enum.HttpError.Aborted] = "Aborted", 
    [Enum.HttpError.SslConnectFail] = "SslConnectFail", 
    [Enum.HttpError.SslVerificationFail] = "SslVerificationFail", 
    [Enum.HttpError.Unknown] = "Unknown"
};
local function v6(v5) --[[ Line: 26 ]] --[[ Name: completeStatsInfo ]]
    -- upvalues: l_getDefaultValue_0 (copy)
    return {
        WasRequestRetried = l_getDefaultValue_0(v5.WasRequestRetried, false), 
        DurationInQueue = v5.DurationInQueue or 0, 
        DurationNameLookup = v5.DurationNameLookup or 0, 
        DurationConnect = v5.DurationConnect or 0, 
        DurationSSLHandshake = v5.DurationSSLHandshake or 0, 
        DurationMakeRequest = v5.DurationMakeRequest or 0, 
        DurationReceiveResponse = v5.DurationReceiveResponse or 0, 
        RoundTripTime = v5.RoundTripTime or 0
    };
end;
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9, v10) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        _request = v9, 
        _requestImplementation = v10, 
        _cancelCallbacks = {}
    }, v8));
end;
v7.Start = function(v11, v12) --[[ Line: 103 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), l_getDefaultValue_0 (copy), v4 (copy)
    local v13 = false;
    local function _(v14, v15) --[[ Line: 105 ]] --[[ Name: processOnce ]]
        -- upvalues: v13 (ref), v12 (copy)
        if v13 then
            return;
        else
            v13 = true;
            v12(v14, v15);
            return;
        end;
    end;
    local function v23(v17) --[[ Line: 113 ]] --[[ Name: handleResult ]]
        -- upvalues: v6 (ref), l_getDefaultValue_0 (ref), v13 (ref), v12 (copy)
        if v17.type == "response" then
            local l_response_0 = v17.response;
            if l_response_0.HttpError == nil or l_response_0.HttpError == Enum.HttpError.OK then
                local v19 = {
                    StatusCode = l_response_0.StatusCode, 
                    StatusMessage = l_response_0.StatusMessage, 
                    Stats = v6(l_response_0.Stats or {}), 
                    Body = l_response_0.Body, 
                    Headers = l_response_0.Headers or {}, 
                    IsCached = l_getDefaultValue_0(l_response_0.IsCached, false), 
                    HttpError = l_response_0.HttpError or Enum.HttpError.OK
                };
                if v13 then
                    return;
                else
                    v13 = true;
                    v12(true, v19);
                    return;
                end;
            else
                local v20 = {
                    ErrorMessage = "HttpError: " .. "Unknown", 
                    HttpError = Enum.HttpError.Unknown
                };
                if v13 then
                    return;
                else
                    v13 = true;
                    v12(false, v20);
                    return;
                end;
            end;
        elseif v17.type == "error" then
            local v21 = {
                ErrorMessage = "HttpError: " .. tostring(v17.error), 
                HttpError = Enum.HttpError.Unknown
            };
            if v13 then
                return;
            else
                v13 = true;
                v12(false, v21);
                return;
            end;
        elseif v17.type == "internal-error" then
            error(v17.error);
            return;
        elseif v17.type == "suspend" then
            local v22 = {
                ErrorMessage = "HttpError: request was delayed until the record-playback logic ended", 
                HttpError = Enum.HttpError.Unknown
            };
            if v13 then
                return;
            else
                v13 = true;
                v12(false, v22);
                return;
            end;
        else
            error(("unknown result of type `%s`"):format((tostring(v17.type))));
            return;
        end;
    end;
    local v24 = debug.traceback(nil, 2);
    local v25 = v11._requestImplementation(v11._request, v24):andThen(v23);
    local function v28() --[[ Line: 153 ]] --[[ Name: cancel ]]
        -- upvalues: v4 (ref), v13 (ref), v12 (copy), v25 (copy)
        local l_Aborted_0 = Enum.HttpError.Aborted;
        local v27 = {
            ErrorMessage = "HttpError: " .. (v4[l_Aborted_0] or "Unknown"), 
            HttpError = l_Aborted_0
        };
        if not v13 then
            v13 = true;
            v12(false, v27);
        end;
        v25:cancel();
    end;
    table.insert(v11._cancelCallbacks, v28);
end;
v7.Cancel = function(v29) --[[ Line: 166 ]] --[[ Name: Cancel ]]
    local l__cancelCallbacks_0 = v29._cancelCallbacks;
    v29._cancelCallbacks = {};
    for _, v32 in ipairs(l__cancelCallbacks_0) do
        v32();
    end;
end;
return v7;