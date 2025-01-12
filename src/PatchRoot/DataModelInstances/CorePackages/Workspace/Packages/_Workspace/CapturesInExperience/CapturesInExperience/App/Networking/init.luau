local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local l_NetworkingShareLinks_0 = v2.NetworkingShareLinks;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local l_RoduxShareLinks_0 = v2.RoduxShareLinks;
local v8 = require(l_Parent_0.Constants);
local v9 = v3.Logger.new(nil, v8.LoggerKey);
local v15 = l_httpRequest_0.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
        -- upvalues: v9 (copy), l_httpRequest_0 (copy)
        v9:debug((("Request: [ requestMethod = %*, url = %* ]"):format(v11, v10)));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v10, v11, v12);
    end, 
    postRequestFunction = function(v13, v14) --[[ Line: 22 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v9 (copy)
        v9:debug((("Response: [ requestMethod = %*, url = %*, statusCode = %*, body = %* ]"):format(v14.requestMethod, v14.url, v13.StatusCode, v13.Body)));
    end, 
    maxRetryCount = game:DefineFastInt("CapturesMaxHttpRequestRetries", 2), 
    maxWaitTime = game:DefineFastInt("CapturesMaxHttpRequestWaitTime", 8)
});
local v16 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = v15
});
return {
    NetworkingShareLinks = l_NetworkingShareLinks_0.config({
        roduxNetworking = v16
    }), 
    RoduxNetworking = v16, 
    RoduxShareLinks = l_RoduxShareLinks_0.config({
        keyPath = "ShareLinks"
    })
};