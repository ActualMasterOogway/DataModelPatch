local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SocialTestHelpers").Parent;
local v2 = require(l_Parent_0.ReactRoblox);
local l_waitForEvents_0 = require(l_Parent_0.TestUtils).DeferredLuaHelpers.waitForEvents;
local l_MockNotificationService_0 = require(l_Parent_0.MockEngineServices).MockNotificationService;
local l_RobloxEventReceiver_0 = require(l_Parent_0.RealtimeDelivery).RobloxEventReceiver;
return function() --[[ Line: 15 ]] --[[ Name: createMockRealtime ]]
    -- upvalues: l_MockNotificationService_0 (copy), l_RobloxEventReceiver_0 (copy), l_HttpService_0 (copy), v2 (copy), l_waitForEvents_0 (copy)
    local v6 = l_MockNotificationService_0.new();
    return l_RobloxEventReceiver_0.new(v6), {
        emitRealtimeEvent = function(v7, v8) --[[ Line: 20 ]] --[[ Name: emitRealtimeEvent ]]
            -- upvalues: l_HttpService_0 (ref), v2 (ref), v6 (copy), l_waitForEvents_0 (ref)
            local v9 = l_HttpService_0:JSONEncode(v8);
            v2.act(function() --[[ Line: 22 ]]
                -- upvalues: v6 (ref), v7 (copy), v9 (copy), l_waitForEvents_0 (ref)
                v6.RobloxEventReceived:Fire({
                    namespace = v7, 
                    detail = v9
                });
                l_waitForEvents_0();
            end);
        end, 
        emitRealtimeConnectionState = function(v10, v11) --[[ Line: 30 ]] --[[ Name: emitRealtimeConnectionState ]]
            -- upvalues: v2 (ref), v6 (copy), l_HttpService_0 (ref), l_waitForEvents_0 (ref)
            v2.act(function() --[[ Line: 34 ]]
                -- upvalues: v6 (ref), v10 (copy), l_HttpService_0 (ref), v11 (copy), l_waitForEvents_0 (ref)
                v6.RobloxConnectionChanged:Fire("signalR", v10, 0, l_HttpService_0:JSONEncode(v11));
                l_waitForEvents_0();
            end);
        end
    };
end;