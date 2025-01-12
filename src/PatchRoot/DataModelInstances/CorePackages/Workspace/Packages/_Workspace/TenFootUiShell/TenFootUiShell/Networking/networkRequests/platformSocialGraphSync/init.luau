local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Promise);
local v6 = game:DefineFastInt("SocialGraphSyncRequestRetryCount", 1);
local v7 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "platform-social-graph-sync-gateway/v1/start-sync"
});
local _ = function() --[[ Line: 22 ]] --[[ Name: getHeaders ]]
    -- upvalues: v5 (copy), l_MessageBusService_0 (copy)
    return v5.new(function(v8, _) --[[ Line: 23 ]]
        -- upvalues: l_MessageBusService_0 (ref)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v10) --[[ Line: 24 ]]
            -- upvalues: v8 (copy)
            v8(v10);
        end, {});
    end);
end;
return function(v12, v13) --[[ Line: 35 ]] --[[ Name: platformSocialGraphSync ]]
    -- upvalues: v5 (copy), l_MessageBusService_0 (copy), l_HttpService_0 (copy), v6 (copy), v7 (copy)
    return v5.new(function(v14, _) --[[ Line: 23 ]]
        -- upvalues: l_MessageBusService_0 (ref)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v16) --[[ Line: 24 ]]
            -- upvalues: v14 (copy)
            v14(v16);
        end, {});
    end):andThen(function(v17) --[[ Line: 36 ]]
        -- upvalues: l_HttpService_0 (ref), v6 (ref), v7 (ref), v12 (copy), v5 (ref), v13 (copy)
        if v17 == nil or not v17.success then
            warn("credential headers error");
            return;
        else
            local v18 = {
                headers = v17.headers or {}, 
                postBody = l_HttpService_0:JSONEncode({}), 
                maxRetryCount = v6
            };
            local v19 = v7();
            return v12(v19, "POST", v18):andThen(function(_) --[[ Line: 49 ]]
                -- upvalues: v5 (ref)
                return v5.resolve();
            end, function(_) --[[ Line: 51 ]]
                -- upvalues: v13 (ref), v5 (ref)
                warn("platform social graph sync request failed");
                v13.Diag:reportCounter("TriggerPlatformSocialGraphSyncFailed", 1);
                return v5.resolve();
            end);
        end;
    end);
end;