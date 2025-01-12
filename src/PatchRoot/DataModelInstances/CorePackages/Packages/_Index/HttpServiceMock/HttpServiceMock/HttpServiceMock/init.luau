local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_unwrapPromiseError_0 = require(l_Parent_1.SharedUtils).unwrapPromiseError;
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.httpContentTypeToHeader);
local v6 = require(l_Parent_0.HttpRequestWrapper);
local v7 = {};
local v8 = {
    __index = v7
};
local function _(v9) --[[ Line: 59 ]] --[[ Name: normalizeHeaderName ]]
    return v9:lower();
end;
local function v15(v11) --[[ Line: 63 ]] --[[ Name: normalizeHeaders ]]
    local v12 = {};
    for v13, v14 in pairs(v11) do
        v12[v13:lower()] = v14;
    end;
    return v12;
end;
local function _(v16) --[[ Line: 72 ]] --[[ Name: normalizeMethod ]]
    return v16:upper();
end;
v7.new = function(v18) --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        HttpEnabled = true, 
        _requestImplementation = v18
    }, v8));
end;
v7.GenerateGUID = function(_, v20) --[[ Line: 85 ]] --[[ Name: GenerateGUID ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID(v20);
end;
v7.GetAsync = function(v21, v22, v23, v24) --[[ Line: 89 ]] --[[ Name: GetAsync ]]
    -- upvalues: v15 (copy)
    if v23 == nil then
        v23 = false;
    end;
    local v25 = v15(v24 or {});
    if v23 then
        v25[("cache-control"):lower()] = "no-cache";
    end;
    return v21:_processLegacyResponse({
        Type = "get", 
        Url = v22, 
        Method = ("GET"):upper(), 
        Headers = v25, 
        Body = nil, 
        Timeout = nil, 
        Priority = nil, 
        CachePolicy = nil, 
        RequestType = nil
    });
end;
v7.GetHttpEnabled = function(v26) --[[ Line: 113 ]] --[[ Name: GetHttpEnabled ]]
    return v26.HttpEnabled;
end;
v7.GetUserAgent = function(_) --[[ Line: 117 ]] --[[ Name: GetUserAgent ]]
    return "Roblox/mockAgent";
end;
v7.JSONDecode = function(_, v29) --[[ Line: 121 ]] --[[ Name: JSONDecode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONDecode(v29);
end;
v7.JSONEncode = function(_, v31) --[[ Line: 125 ]] --[[ Name: JSONEncode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode(v31);
end;
v7.PostAsync = function(v32, v33, v34, v35, v36, v37) --[[ Line: 129 ]] --[[ Name: PostAsync ]]
    -- upvalues: v15 (copy), v5 (copy)
    local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
    if v35 ~= nil then
        l_ApplicationJson_0 = v35;
    end;
    if v36 == nil then
        v36 = false;
    end;
    local v39 = v15(v37 or {});
    if v36 then
        v39[("content-encoding"):lower()] = "gzip";
    end;
    v39[("content-type"):lower()] = v5(l_ApplicationJson_0);
    return v32:_processLegacyResponse({
        Type = "post", 
        Url = v33, 
        Method = ("POST"):upper(), 
        Headers = v39, 
        Body = v34
    });
end;
v7._processLegacyResponse = function(v40, v41) --[[ Line: 162 ]] --[[ Name: _processLegacyResponse ]]
    -- upvalues: l_unwrapPromiseError_0 (copy)
    local v42 = debug.traceback(nil, 3);
    local v43 = v40._requestImplementation(v41, v42):expect();
    if v43.type == "error" then
        error(v43.error, 2);
        return;
    elseif v43.type == "internal-error" then
        error(l_unwrapPromiseError_0(v43.error), 2);
        return;
    elseif v43.type == "response" then
        local l_response_0 = v43.response;
        local l_StatusCode_0 = l_response_0.StatusCode;
        if l_StatusCode_0 >= 200 and l_StatusCode_0 <= 299 and l_StatusCode_0 ~= 202 then
            return l_response_0.Body;
        else
            error(("HTTP %d (%s)"):format(l_StatusCode_0, l_response_0.StatusMessage), 2);
            return;
        end;
    elseif v43.type == "suspend" then
        error("request was delayed until the record-playback logic ended", 2);
        return;
    else
        error(("unknown result of type `%s`"):format((tostring(v43.type))), 2);
        return;
    end;
end;
v7.RequestAsync = function(v46, v47) --[[ Line: 185 ]] --[[ Name: RequestAsync ]]
    -- upvalues: v15 (copy), l_unwrapPromiseError_0 (copy)
    local v48 = debug.traceback(nil, 2);
    local v49 = v46._requestImplementation({
        Type = "request", 
        Url = v47.Url, 
        Method = (v47.Method or "GET"):upper(), 
        Headers = v15(v47.Headers or {}), 
        Body = v47.Body
    }, v48):expect();
    if v49.type == "error" then
        error(v49.error);
        return;
    elseif v49.type == "internal-error" then
        error(l_unwrapPromiseError_0(v49.error));
        return;
    elseif v49.type == "response" then
        return v49.response;
    else
        error(("unknown result of type `%s`"):format((tostring(v49.type))));
        return;
    end;
end;
v7.RequestInternal = function(v50, v51) --[[ Line: 206 ]] --[[ Name: RequestInternal ]]
    -- upvalues: v15 (copy), v6 (copy)
    local v52 = {
        Type = "internal", 
        Url = v51.Url, 
        Method = (v51.Method or "GET"):upper(), 
        Headers = v15(v51.Headers or {}), 
        Body = v51.Body, 
        Timeout = v51.Timeout, 
        Priority = v51.Priority, 
        CachePolicy = v51.CachePolicy, 
        RequestType = v51.RequestType
    };
    return v6.new(v52, v50._requestImplementation);
end;
v7.SetHttpEnabled = function(v53, v54) --[[ Line: 222 ]] --[[ Name: SetHttpEnabled ]]
    v53.HttpEnabled = v54;
end;
v7.UrlEncode = function(_, v56) --[[ Line: 226 ]] --[[ Name: UrlEncode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:UrlEncode(v56);
end;
return v7;