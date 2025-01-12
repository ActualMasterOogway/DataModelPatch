local v0 = require(script.Components.TenFootUiContainer);
local v1 = require(script.Components.TenFootUiOverflowScreen);
local v2 = require(script.Constants);
local v3 = require(script.Reducers.CrossPlaySettings);
local v4 = require(script.Hooks.CrossPlay.useCrossPlaySettings);
local v5 = require(script.ServiceWrappers.PlatformServiceOrStub);
return {
    ["jest.config"] = script["jest.config"], 
    TenFootUiContainer = v0, 
    TenFootUiOverflowScreen = v1, 
    Constants = v2, 
    useCrossPlaySettings = v4, 
    Reducers = {
        CrossPlaySettings = v3
    }, 
    PlatformServiceOrStub = v5, 
    Views = require(script.ReactNavigationExtend.Views), 
    Hooks = require(script.ReactNavigationExtend.Hooks), 
    RnBypassAdapter = require(script.ReactNavigationExtend.RnBypassAdapter)
};