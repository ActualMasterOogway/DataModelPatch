local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v2.httpRequest;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, l_RODUX_KEY_0):new(l_RODUX_KEY_0 .. " Networking");
local v6 = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v8 = game:DefineFastFlag("EnableProfilePlatformChallengeInterceptor", false);
local v14 = l_httpRequest_0.config({
    requestFunction = function(v9, v10, v11) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), l_httpRequest_0 (copy)
        v5:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v10, v9));
        return l_httpRequest_0.requestFunctions.RequestInternal(v9, v10, v11);
    end, 
    postRequestFunction = function(v12, v13) --[[ Line: 21 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v13.requestMethod, v13.url, v12.StatusCode, v12.Body));
    end, 
    maxRetryCount = v6
});
return (v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v8 and l_ChallengeRequestWrapper_0(v14) or v14
}));