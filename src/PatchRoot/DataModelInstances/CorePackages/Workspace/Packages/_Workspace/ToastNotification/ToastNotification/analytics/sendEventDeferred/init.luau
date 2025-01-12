local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
local v3 = require(l_Parent_0.Cryo);
local v4 = game:DefineFastFlag("ToastNotificationAnalyticsPlaySessionId", false);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_RbxAnalyticsService_0 (copy), v3 (copy), l_getPlatformTarget_0 (copy)
    local v6 = nil;
    if v4 then
        v6 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return function(v7, v8, v9) --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v3 (ref), v6 (ref), v5 (copy), l_getPlatformTarget_0 (ref)
        local l_v9_0 = v9;
        if v4 then
            l_v9_0 = v3.Dictionary.join(l_v9_0 or {}, {
                playSessionId = v6
            });
        end;
        v5:SendEventDeferred(l_getPlatformTarget_0(), v7, v8, l_v9_0);
    end;
end;