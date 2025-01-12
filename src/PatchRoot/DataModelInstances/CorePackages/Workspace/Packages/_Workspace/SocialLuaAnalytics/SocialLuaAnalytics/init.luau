local _ = require(script.Analytics.Types);
local _ = require(script.Analytics.Enums.Contexts);
local _ = require(script.Analytics.Enums.PlatformSpecificity);
return {
    ["jest.config"] = script["jest.config"], 
    Analytics = require(script.Analytics), 
    TestingAnalytics = require(script.TestingAnalytics), 
    Telemetry = {
        new = require(script.Telemetry.telemetryNewConfig), 
        createEmitter = require(script.Telemetry.telemetryCreateEmitter)
    }
};