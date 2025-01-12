local v0 = require(script.Utility.isSelectedDataDSAIllegalContent);
local v1 = require(script.Utility.isShowEUDSAIllegalContentReportingLink);
local v2 = require(script.Utility.isInDSAFeaturesOverrideList);
local v3 = require(script.Components.DSAReportLink);
local v4 = require(script.Utility.Constants);
return {
    isShowEUDSAIllegalContentReportingLink = v1, 
    isSelectedDataDSAIllegalContent = v0, 
    isInDSAFeaturesOverrideList = v2, 
    DSAReportLink = v3, 
    Constants = v4, 
    ["jest.config"] = script["jest.config"]
};