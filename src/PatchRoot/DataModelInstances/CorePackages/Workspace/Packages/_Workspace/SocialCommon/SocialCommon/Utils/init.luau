return {
    getMutualFriendsText = require(script.getMutualFriendsText), 
    getRecommendationContextualInfoDisplay = require(script.getRecommendationContextualInfoDisplay), 
    getRecommendationContextualInfoType = require(script.getRecommendationContextualInfoType), 
    convertLuaAppUserToSocialUser = require(script.convertLuaAppUserToSocialUser), 
    convertUserPresenceTypeToString = require(script.convertUserPresenceTypeToString), 
    InputUtilities = require(script.InputUtilities), 
    simpleUrlDecode = require(script.simpleUrlDecode), 
    buildApiSiteUrl = require(script.buildApiSiteUrl), 
    userIdExists = require(script.userIdExists), 
    hydrateEmptyIdsHelper = require(script.hydrateEmptyIdsHelper)
};