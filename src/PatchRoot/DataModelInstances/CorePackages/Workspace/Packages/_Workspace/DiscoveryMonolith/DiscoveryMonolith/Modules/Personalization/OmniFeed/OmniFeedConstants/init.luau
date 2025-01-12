local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
return {
    DataSource = {
        DiscoveryApi = "DiscoveryApi", 
        GamesApi = "GamesApi", 
        Local = "Local", 
        SearchApi = "SearchApi", 
        OmniAutocompleteApi = l_FFlagSearchOmniAutocompletePage_0 and "OmniAutocompleteApi" or nil
    }, 
    EventContext = "HomeOmniFeed", 
    OmniSortRetrievalStatus = {
        Exception = "Exception", 
        Success = "Success"
    }, 
    GlobalLayoutDataKeys = {
        JYFRefresh = "JYFRefresh"
    }, 
    TopicLayoutDataKeys = {
        PYMKFindFriendsEnabled = "PYMKFindFriendsEnabled", 
        PYMKSeeAllEnabled = "PYMKSeeAllEnabled", 
        JYFFindFriendsEnabled = "JYFFindFriendsEnabled", 
        ComponentType = "componentType", 
        PlayerCountStyle = "playerCountStyle", 
        IsSponsoredFooterAllowed = "isSponsoredFooterAllowed", 
        LinkPath = "linkPath", 
        SubtitleLinkPath = "subtitleLinkPath", 
        HideSeeAll = "hideSeeAll", 
        InfoText = "infoText", 
        EndTimestamp = "endTimestamp", 
        CountdownString = "countdownString", 
        PlayButtonStyle = "playButtonStyle", 
        BackgroundImageAssetId = "backgroundImageAssetId", 
        HeaderButtonText = l_FFlagLuaAppHeaderButtonText_0 and "headerButtonText" or nil, 
        HideTileMetadata = "hideTileMetadata", 
        HideTileTitle = "hideTileTitle", 
        ContainedTile = "containedTile"
    }, 
    ComponentTypeDataKeys = {
        EventTile = "EventTile", 
        GridTile = "GridTile", 
        AppGameTileNoMetadata = "AppGameTileNoMetadata"
    }, 
    ItemLayoutDataKeys = {
        Footer = "Footer"
    }, 
    OmniRecommendationsRequestIntent = {
        ManualRefresh = "manualRefresh", 
        AutoRefresh = "autoRefresh", 
        FriendPresenceChange = "friendPresenceChange", 
        LogIn = "logIn", 
        LoadMore = "loadMore", 
        GameExit = "gameExit"
    }, 
    ContentGroupType = {
        Game = "Game", 
        Text = "Text", 
        User = "User"
    }
};