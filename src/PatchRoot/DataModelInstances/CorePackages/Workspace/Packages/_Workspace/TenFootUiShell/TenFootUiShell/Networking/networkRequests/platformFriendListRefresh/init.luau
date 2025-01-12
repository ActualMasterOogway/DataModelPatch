local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Promise);
local l_FetchFriendsCarousel_0 = require(l_Parent_0.FriendsCarousel).FetchFriendsCarousel;
local v7 = game:DefineFastInt("FriendListRefreshRequestRetryCount", 3);
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "platform-social-processor/v1/start-sync"
});
local _ = function() --[[ Line: 18 ]] --[[ Name: getHeaders ]]
    -- upvalues: v5 (copy), l_MessageBusService_0 (copy)
    return v5.new(function(v9, _) --[[ Line: 19 ]]
        -- upvalues: l_MessageBusService_0 (ref)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v11) --[[ Line: 20 ]]
            -- upvalues: v9 (copy)
            v9(v11);
        end, {});
    end);
end;
return function(v13, v14, v15) --[[ Line: 26 ]] --[[ Name: platformFriendListRefresh ]]
    -- upvalues: v5 (copy), l_MessageBusService_0 (copy), l_HttpService_0 (copy), v7 (copy), v8 (copy), l_FetchFriendsCarousel_0 (copy)
    return v5.new(function(v16, _) --[[ Line: 19 ]]
        -- upvalues: l_MessageBusService_0 (ref)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v18) --[[ Line: 20 ]]
            -- upvalues: v16 (copy)
            v16(v18);
        end, {});
    end):andThen(function(v19) --[[ Line: 27 ]]
        -- upvalues: l_HttpService_0 (ref), v7 (ref), v8 (ref), v14 (copy), v13 (copy), l_FetchFriendsCarousel_0 (ref), v5 (ref), v15 (copy)
        if v19 == nil or not v19.success then
            warn("credential headers error");
            return;
        else
            local l_headers_0 = v19.headers;
            local v21 = {};
            if l_headers_0 and l_headers_0.Authorization then
                v21.Authorization = l_headers_0.Authorization;
            end;
            local v22 = l_HttpService_0:JSONEncode(v21);
            local v23 = {
                headers = l_headers_0 or {}, 
                postBody = v22, 
                maxRetryCount = v7
            };
            local v24 = v8();
            return v14(v24, "POST", v23):andThen(function(_) --[[ Line: 47 ]]
                -- upvalues: v13 (ref), l_FetchFriendsCarousel_0 (ref), v5 (ref)
                v13(l_FetchFriendsCarousel_0()):andThen(function(_) --[[ Line: 49 ]]
                    -- upvalues: v5 (ref)
                    return v5.resolve();
                end, function(_) --[[ Line: 51 ]]
                    -- upvalues: v5 (ref)
                    warn("Refresh friends carousel failed after syncing platform friends");
                    return v5.resolve();
                end);
            end, function(_) --[[ Line: 56 ]]
                -- upvalues: v15 (ref), v5 (ref)
                warn("Platform friend list refresh failed.");
                v15.Diag:reportCounter("TriggerFriendListRefreshFailed", 1);
                return v5.resolve();
            end);
        end;
    end);
end;