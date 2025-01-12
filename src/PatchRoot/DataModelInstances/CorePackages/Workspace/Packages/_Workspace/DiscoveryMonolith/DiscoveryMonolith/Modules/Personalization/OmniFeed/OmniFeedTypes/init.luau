local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
return {
    GenreExplorer = "GenreExplorerLabel", 
    Carousel = "Carousel", 
    AvatarCarousel = "AvatarCarousel", 
    UserInfo = "UserInfo", 
    FriendCarousel = "FriendCarousel", 
    FriendRecommendationCarousel = "FriendRecommendationCarousel", 
    HomeGameGrid = "SortlessGrid", 
    JoinYourFriendsCarousel = "JoinYourFriendsCarousel", 
    SearchGameGrid = "SearchGameGrid", 
    SearchText = "SearchText", 
    UpsellCard = "UpsellCard", 
    UserSearchGrid = "UserSearchGrid", 
    Pills = l_FFlagLuaAppTopChartsFiltersEnabled_0 and "Pills" or nil, 
    SearchPillCarousel = l_FFlagSearchOmniAutocompletePage_0 and "SearchPillCarousel" or nil
};