local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.PromptInfo);
local v3 = require(script.ScreenSize);
local v4 = require(script.GameName);
local v5 = require(script.AnalyticsInfo);
return (v1.combineReducers({
    promptInfo = v2, 
    screenSize = v3, 
    gameName = v4, 
    analyticsInfo = v5
}));