return {
    AddSystemInfoToArgs = require(script.AddSystemInfoToArgs), 
    validateProps = require(script.validateProps), 
    logResponseError = require(script.logResponseError), 
    logResponseTelemetry = require(script.logResponseTelemetry), 
    parseBooleanString = require(script.parseBooleanString), 
    OmniRecommendationsPageType = require(script.OmniRecommendationsPageType), 
    VerticalEfficiencyExperimentation = require(script.VerticalEfficiencyExperimentation), 
    getPageSideMargin = require(script.getPageSideMargin), 
    isSearchTypeInOmniSearch = require(script.isSearchTypeInOmniSearch), 
    ["jest.config"] = script["jest.config"]
};