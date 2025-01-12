local l_Parent_0 = script:FindFirstAncestor("DiscoveryTestHelpers").Parent;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local v2 = {
    GenreExplorer = "GenreExplorerLabel", 
    Carousel = "Carousel", 
    AvatarCarousel = "AvatarCarousel", 
    UserInfo = "UserInfo", 
    FriendCarousel = "FriendCarousel", 
    FriendRecommendationCarousel = "FriendRecommendationCarousel", 
    HomeGameGrid = "SortlessGrid"
};
mockEndpointResponse = function(v3) --[[ Line: 18 ]] --[[ Name: mockEndpointResponse ]]
    -- upvalues: l_OmniRecommendationsContentType_0 (copy), v2 (copy)
    local v4 = {
        rootPlaceId = "10395446", 
        universeId = "149757", 
        name = "test", 
        totalUpVotes = 10970, 
        totalDownVotes = 2564, 
        playerCount = 5, 
        under9 = true, 
        under13 = false, 
        friendActivityTitle = "Friend Activity", 
        minimumAge = 0, 
        ageRecommendationDisplayName = "All Ages"
    };
    return {
        contentMetadata = {
            [l_OmniRecommendationsContentType_0.Game] = {
                [v4.universeId] = v4
            }, 
            [l_OmniRecommendationsContentType_0.CatalogAsset] = {}, 
            [l_OmniRecommendationsContentType_0.CatalogBundle] = {}, 
            [l_OmniRecommendationsContentType_0.RecommendedFriend] = {}
        }, 
        sorts = {
            {
                topic = v3 or "topic123", 
                topicId = 100000003, 
                recommendationList = {
                    {
                        contentType = l_OmniRecommendationsContentType_0.Game, 
                        contentId = v4.universeId, 
                        contentMetadata = {
                            Score = "10"
                        }
                    }
                }, 
                treatmentType = v2.Carousel
            }
        }, 
        pageType = "Home", 
        requestId = "123avcd3-1431-35bd-24db-452abcde65abf35", 
        nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=", 
        isSessionExpired = false
    };
end;
return mockEndpointResponse;