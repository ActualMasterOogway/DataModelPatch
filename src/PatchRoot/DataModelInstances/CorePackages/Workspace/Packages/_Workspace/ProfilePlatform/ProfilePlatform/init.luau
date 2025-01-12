local v0 = require(script.Contexts.ProfileWrapperContext);
local v1 = require(script.Common.Enums);
return {
    ["jest.config"] = script["jest.config"], 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    installReducer = require(script.Rodux.installReducer), 
    EventNames = require(script.Analytics.EventNames), 
    LoadingStagesExtension = require(script.Analytics.LoadingStagesExtension), 
    initializeProfileAnalytics = require(script.Analytics.initializeProfileAnalytics), 
    ProfilePlatformNavigator = require(script.Navigation.ProfilePlatformNavigatorWithProviders), 
    ProfileWrapperContext = v0, 
    ProfileTypes = v1.ProfileTypes, 
    Screens = v1.Screens, 
    Sources = v1.Sources
};