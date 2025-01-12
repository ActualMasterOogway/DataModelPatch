local l_StarterGui_0 = game:GetService("StarterGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), l_StarterGui_0 (copy), v4 (copy)
    local v5 = {
        evenStream = l_EventStream_0.new(l_RbxAnalyticsService_0)
    };
    v5.sendCoreGuiAnalytic = function(v6, v7) --[[ Line: 24 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), v5 (copy)
        local v8 = {
            placeid = tostring(game.PlaceId), 
            universeid = tostring(game.GameId), 
            type = tostring(v6.Name), 
            enabled = tostring(v7), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId()
        };
        v5.evenStream:sendEventDeferred("core_gui_type", "core_gui_type", v8);
    end;
    v5.signalConnection = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v9, v10) --[[ Line: 37 ]]
        -- upvalues: v5 (copy)
        v5.sendCoreGuiAnalytic(v9, v10);
    end);
    setmetatable(v5, v4);
    return v5;
end;
v4.DisconnectSignal = function(v11) --[[ Line: 45 ]] --[[ Name: DisconnectSignal ]]
    v11.signalConnection:Disconnect();
end;
local _ = v4.new();
return v4;