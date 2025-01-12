local _ = require(script.Analytics.uiStatusBarTappedEvent);
local v1 = require(script.Hooks.useLogInputTypeChanged);
local v2 = require(script.Hooks.useLogOrientationChanged);
local v3 = require(script.Hooks.useLogStatusBarTapped);
local v4 = require(script.Analytics.switchAccountScrimError);
return {
    useLogInputTypeChanged = v1, 
    useLogOrientationChanged = v2, 
    useLogStatusBarTapped = v3, 
    switchAccountScrimError = v4
};