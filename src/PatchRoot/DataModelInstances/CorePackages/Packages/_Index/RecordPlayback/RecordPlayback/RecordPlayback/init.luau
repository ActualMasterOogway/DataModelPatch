local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.SharedUtils);
local l_unwrapPromiseError_0 = v3.unwrapPromiseError;
local v5 = require(l_Parent_1.RequestPipeline);
local v6 = require(l_Parent_1.PrettyFormat);
local v7 = require(l_Parent_1.HttpServiceMock);
local _ = require(l_Parent_0.Artifacts);
local _ = require(l_Parent_0.ArtifactLoader);
local _ = require(l_Parent_0.RequestFormatter);
local v11 = require(l_Parent_0.RequestPromiseTracker);
local v12 = require(l_Parent_0.UrlUtils);
local l_LineWriter_0 = v3.LineWriter;
local l_Error_0 = v3.Error;
local l_try_0 = v3.try;
local function v20(v16, v17) --[[ Line: 58 ]] --[[ Name: sortRequests ]]
    -- upvalues: v12 (copy)
    local l_url_0 = v16.url;
    local l_url_1 = v17.url;
    if l_url_0.host == l_url_1.host then
        if l_url_0.path == l_url_1.path then
            return v12.formatQuery(l_url_0.query) < v12.formatQuery(l_url_1.query);
        else
            return l_url_0.path < l_url_1.path;
        end;
    else
        return l_url_0.host < l_url_1.host;
    end;
end;
local v21 = {};
local v22 = {
    __index = v21
};
v21.new = function(v23, v24) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v22 (copy)
    return (setmetatable({
        _recordMissingRequests = false, 
        _forceRecording = false, 
        _ignoreMissingRequests = false, 
        _assertRequestExistence = true, 
        _useRequestsOnlyOnce = true, 
        _artifactLoader = v23, 
        _contentLocation = v24, 
        _httpService = l_HttpService_0, 
        _warn = warn
    }, v22));
end;
v21.forceRecording = function(v25) --[[ Line: 91 ]] --[[ Name: forceRecording ]]
    v25._forceRecording = true;
    return v25;
end;
v21.recordMissingRequests = function(v26) --[[ Line: 96 ]] --[[ Name: recordMissingRequests ]]
    v26._recordMissingRequests = true;
    return v26;
end;
v21.ignoreMissingRequests = function(v27) --[[ Line: 101 ]] --[[ Name: ignoreMissingRequests ]]
    v27._ignoreMissingRequests = true;
    return v27;
end;
v21.skipExistenceAssertion = function(v28) --[[ Line: 106 ]] --[[ Name: skipExistenceAssertion ]]
    v28._assertRequestExistence = false;
    return v28;
end;
v21.reusableRequests = function(v29) --[[ Line: 111 ]] --[[ Name: reusableRequests ]]
    v29._useRequestsOnlyOnce = false;
    return v29;
end;
v21.execute = function(v30, v31) --[[ Line: 116 ]] --[[ Name: execute ]]
    -- upvalues: v5 (copy), v11 (copy), v7 (copy), l_try_0 (copy), l_LineWriter_0 (copy), v20 (copy), v6 (copy), l_Error_0 (copy)
    if v30._forceRecording then
        v30._artifactLoader:delete(v30._contentLocation);
    end;
    local v32 = v30._artifactLoader:load(v30._contentLocation, {
        useRequestsOnce = v30._useRequestsOnlyOnce
    });
    local v33 = v5.RequestPipeline.new();
    if v32 then
        v30:_insertPlayback(v32, v33);
    end;
    if v32 == nil or v30._recordMissingRequests then
        v30:_insertRecorder(v33);
    end;
    if v30._ignoreMissingRequests then
        v30:_insertIgnore(v33);
    end;
    local function v35(v34) --[[ Line: 136 ]] --[[ Name: makeRequest ]]
        -- upvalues: v33 (copy)
        return v33:process(v34);
    end;
    local v36 = debug.traceback(nil, 2);
    local v37 = v11.new(v35, v36);
    v37._warn = v30._warn;
    local v40 = v7.new(function(v38, v39) --[[ Line: 146 ]] --[[ Name: requestImplementation ]]
        -- upvalues: v37 (copy)
        return v37:makeRequest(v38, v39);
    end);
    local v41, v42 = l_try_0(function() --[[ Line: 158 ]]
        -- upvalues: v31 (copy), v40 (copy)
        return v31(v40) or nil;
    end);
    v37:close();
    if not v41 then
        error(v42);
        return;
    else
        local v43 = l_LineWriter_0.new();
        if v30._assertRequestExistence and v32 ~= nil then
            local v44 = v32:getUnusedRequests();
            local v45 = #v44;
            table.sort(v44, v20);
            if v45 == 1 then
                v43:write("A request was expected to happen but it did not: " .. v6.format(v44[1], {}));
            elseif v45 > 1 then
                v43:write("%d requests were expected to happen:", v45);
                for _, v47 in ipairs(v44) do
                    v43:write(" -> " .. v6.format(v47, {}));
                end;
            end;
        end;
        if v42 then
            local v48, v49 = l_try_0(v42);
            if not v48 then
                v43:verticalSpace():write("The clean-up callback has encountered an error: %s", (tostring(v49)));
            end;
        end;
        local v50 = v37:getRejections();
        local v51 = #v50;
        if v51 ~= 0 then
            v43:verticalSpace():write("%d promise%s rejected:", v51, v51 == 1 and "" or "s");
            for _, v53 in ipairs(v50) do
                v43:write(" -> %s", (tostring(v53)));
            end;
        end;
        local v54 = v37:getRunningPromises();
        local v55 = #v54;
        if v55 ~= 0 then
            v43:verticalSpace():write("%d promise%s are still running. Make sure that these promise are being cancelled:", v55, v55 == 1 and "" or "s");
            for _, v57 in ipairs(v54) do
                v43:write(" -> %s", v57._source);
            end;
        end;
        local v58 = v43:toString();
        if v58 ~= "" then
            error(l_Error_0.new(v58, 1));
        end;
        return;
    end;
end;
v21._insertRecorder = function(v59, v60) --[[ Line: 238 ]] --[[ Name: _insertRecorder ]]
    -- upvalues: v5 (copy), l_unwrapPromiseError_0 (copy)
    local v61 = v5.createPassthrough(v59._httpService);
    local v62 = v59._artifactLoader:getWriter(v59._contentLocation);
    v60:appendProcessor(v5.Matcher.all(), function(v63) --[[ Line: 243 ]]
        -- upvalues: v61 (copy), v62 (copy), l_unwrapPromiseError_0 (ref)
        local v64 = v61(v63):expect();
        if v64.type == "response" then
            v62:writeResponse(v63, v64.response);
            return v64;
        else
            if v64.type == "error" then
                v62:writeError(v63, l_unwrapPromiseError_0(v64.error));
            end;
            return v64;
        end;
    end);
end;
v21._insertPlayback = function(v65, v66, v67) --[[ Line: 256 ]] --[[ Name: _insertPlayback ]]
    -- upvalues: v6 (copy)
    v67:appendOptionalProcessor(function(v68) --[[ Line: 257 ]]
        -- upvalues: v66 (copy), v65 (copy), v6 (ref)
        local v69 = v66:find(v68);
        if v69 == nil then
            if v65._recordMissingRequests then
                return nil;
            else
                return nil, ("Unable to find response for the request %s\n\n"):format(v6.format(v68, {})) .. "To record only new requests, configure the RecordPlayback object by calling `recordMissingRequests()`\n";
            end;
        elseif v69.response ~= nil then
            return {
                type = "response", 
                response = v69.response
            };
        else
            return {
                type = "error", 
                error = v69.error
            };
        end;
    end);
end;
v21._insertIgnore = function(_, v71) --[[ Line: 285 ]] --[[ Name: _insertIgnore ]]
    -- upvalues: v5 (copy)
    v71:appendProcessor(v5.Matcher.all(), function(_) --[[ Line: 286 ]]
        return {
            type = "suspend"
        };
    end);
end;
return v21;