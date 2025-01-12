local v0 = require(script.GameDetails);
local v1 = require(script.GamesByPlaceId);
local v2 = require(script.GetGameNameAndDescription);
local v3 = require(script.FetchGamePlayabilityAndProductInfo);
local v4 = require(script.FetchUserSettingsAndOptions);
return {
    AgeRecommendations = require(script.AgeRecommendations), 
    FetchGamePlayabilityAndProductInfo = v3, 
    FetchUserSettingsAndOptions = v4, 
    GameDetails = v0, 
    GamesByPlaceId = v1, 
    GetGameNameAndDescription = v2, 
    ["jest.config"] = script["jest.config"]
};