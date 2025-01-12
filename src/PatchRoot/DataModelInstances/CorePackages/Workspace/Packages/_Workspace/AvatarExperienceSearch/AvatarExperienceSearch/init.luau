return {
    Components = {
        SearchBar = require(script.Components.SearchBar)
    }, 
    Features = {
        SearchLandingPage = require(script.Features.SearchLandingPage.SearchLandingPage), 
        useSearchLandingPageProps = require(script.Features.SearchLandingPage.useSearchLandingPageProps)
    }, 
    Utils = {
        RecentSearchTermsAppStorage = require(script.Utils.RecentSearchTermsAppStorage), 
        normalizeKeyword = require(script.Utils.normalizeKeyword)
    }, 
    ["jest.config"] = script["jest.config"]
};