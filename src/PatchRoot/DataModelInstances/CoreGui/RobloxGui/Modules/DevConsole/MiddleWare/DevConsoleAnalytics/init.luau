local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(script.Parent.Parent.Actions.SetActiveTab);
local v4 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility);
local v5 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized);
local v6 = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0);
local v7 = game:DefineFastFlag("DevConsoleUseThrottledMetrics", false);
ReportDevConsoleOpenClose = function(v8, v9) --[[ Line: 23 ]] --[[ Name: ReportDevConsoleOpenClose ]]
    -- upvalues: v4 (copy), l_RbxAnalyticsService_0 (copy)
    if v9.type == v4.name then
        local l_isVisible_0 = v8:getState().DisplayOptions.isVisible;
        local l_visibleStartTime_0 = v8:getState().DisplayOptions.visibleStartTime;
        if v9.isVisible ~= l_isVisible_0 then
            if v9.isVisible then
                l_RbxAnalyticsService_0:ReportCounter("DevConsoleStartVisible", 1);
                return;
            else
                local v12 = tick() - l_visibleStartTime_0;
                l_RbxAnalyticsService_0:ReportStats("DevConsoleSessionTime", v12);
            end;
        end;
    end;
end;
getTabAnalyticsKeyName = function(v13, v14) --[[ Line: 39 ]] --[[ Name: getTabAnalyticsKeyName ]]
    if v14 ~= nil then
        return string.format("%s_%s", v13, v14 and "Client" or "Server");
    else
        return string.format("%s", v13);
    end;
end;
dispatchTabAnalytics = function(v15) --[[ Line: 47 ]] --[[ Name: dispatchTabAnalytics ]]
    -- upvalues: v7 (copy), v2 (copy), l_RbxAnalyticsService_0 (copy), v6 (copy)
    if v7 then
        local v16 = v2.join({
            placeId = game.PlaceId, 
            calledFrom = "devConsoleTabChange"
        }, v15);
        l_RbxAnalyticsService_0:ReportInfluxSeries("devConsoleMetric", v16, v6);
        return;
    else
        l_RbxAnalyticsService_0:SendEventImmediately("client", "devConsoleMetric", "devConsoleTabChange", v15);
        return;
    end;
end;
ReportTabChange = function(v17, v18) --[[ Line: 62 ]] --[[ Name: ReportTabChange ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    if v18.type == v3.name then
        local l_MainView_0 = v17:getState().MainView;
        local l_newTabIndex_0 = v18.newTabIndex;
        local l_isClientView_0 = v18.isClientView;
        if l_newTabIndex_0 ~= l_MainView_0.currTabIndex or l_isClientView_0 ~= nil and l_isClientView_0 ~= l_MainView_0.isClientView then
            local v22 = {
                initTab = getTabAnalyticsKeyName(l_MainView_0.currTabIndex, l_MainView_0.isClientView), 
                endTab = getTabAnalyticsKeyName(l_newTabIndex_0, l_isClientView_0)
            };
            dispatchTabAnalytics(v22);
            return;
        end;
    elseif v18.type == v4.name then
        local l_MainView_1 = v17:getState().MainView;
        local l_DisplayOptions_0 = v17:getState().DisplayOptions;
        local v25 = nil;
        v25 = if v18.isVisible then {
            initTab = "StartVisible", 
            endTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView)
        } else if l_DisplayOptions_0.isMinimized then {
            initTab = "Minimized", 
            endTab = "EndVisible"
        } else {
            initTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView), 
            endTab = "EndVisible"
        };
        dispatchTabAnalytics(v25);
        return;
    elseif v18.type == v5.name then
        local l_MainView_2 = v17:getState().MainView;
        local v27 = nil;
        v27 = if v18.isMinimized then {
            initTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView), 
            endTab = "Minimized"
        } else {
            initTab = "Minimized", 
            endTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView)
        };
        dispatchTabAnalytics(v27);
    end;
end;
return function(v28, v29) --[[ Line: 124 ]]
    return function(v30) --[[ Line: 125 ]]
        -- upvalues: v29 (copy), v28 (copy)
        ReportTabChange(v29, v30);
        ReportDevConsoleOpenClose(v29, v30);
        v28(v30);
    end;
end;