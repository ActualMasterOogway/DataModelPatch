local l_Modules_0 = script.Modules;
local _ = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults);
return {
    Modules = {
        LuaApp = {
            Actions = {
                Games = {
                    AddContentMetadata = require(l_Modules_0.LuaApp.Actions.Games.AddContentMetadata), 
                    AddOmniRecommendations = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations), 
                    AppendGameSortsInGroup = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup), 
                    SetGameSortsInGroup = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup), 
                    SetOmniAutocompleteSorts = require(l_Modules_0.LuaApp.Actions.Games.SetOmniAutocompleteSorts), 
                    SetOmniRecommendationsMetadataRequestStatus = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus), 
                    SetOmniRecommendationsRefreshTime = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime)
                }, 
                AppendSearchInGames = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames), 
                SetHomePageUpsellCardVariation = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation), 
                SetSearchInGames = require(l_Modules_0.LuaApp.Actions.SetSearchInGames), 
                SetSearchInGamesStatus = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus)
            }, 
            Analytics = {
                Events = {
                    Games = {
                        GameDetailsEvents = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents), 
                        gameDetailsPeekViewEvents = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailsPeekViewEvents)
                    }
                }, 
                Sessions = {
                    OmniSearchSessionUtil = require(l_Modules_0.LuaApp.Analytics.Sessions.OmniSearchSessionUtil)
                }
            }, 
            Common = {
                Experience = {
                    getPlayButtonProps = require(l_Modules_0.LuaApp.Common.Experience.getPlayButtonProps)
                }
            }, 
            Components = {
                EventReceivers = {
                    OnGameLeaveReceiver = require(l_Modules_0.LuaApp.Components.EventReceivers.OnGameLeaveReceiver)
                }, 
                ExperienceDetails = {
                    Flags = {
                        FFlagEDPAddRatingTitle10ft = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Flags.FFlagEDPAddRatingTitle10ft)
                    }, 
                    ExperienceRatings = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceRatings)
                }, 
                Games = {
                    AppFeaturedGameTileTwoByTwo = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo), 
                    GameGridSelector = require(l_Modules_0.LuaApp.Components.Games.GameGridSelector), 
                    GameGridTable = require(l_Modules_0.LuaApp.Components.Games.GameGridTable), 
                    OmniRecommendationsRefreshComponent = require(l_Modules_0.LuaApp.Components.Games.OmniRecommendationsRefreshComponent), 
                    TokenRefreshComponent = require(l_Modules_0.LuaApp.Components.Games.TokenRefreshComponent)
                }, 
                Generic = {
                    GridView = require(l_Modules_0.LuaApp.Components.Generic.GridView)
                }, 
                Search = {
                    SearchTypeSelection = {
                        Context = require(l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.Context), 
                        SearchSelectionTypeHeader = require(l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader)
                    }, 
                    getSearchItemsRowDataKey = require(l_Modules_0.LuaApp.Components.Search.getSearchItemsRowDataKey)
                }
            }, 
            DesignTokenMappers = {
                experienceDetailsTokenMapper = require(l_Modules_0.LuaApp.DesignTokenMappers.experienceDetailsTokenMapper)
            }, 
            Enum = {
                SearchRetrievalStatus = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus)
            }, 
            Flags = {
                GetFFlagEnableHomePageUpsellCard = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard), 
                GetFFlagFixFetchNextOmniWithoutPageToken = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken), 
                GetFFlagLuaAppUpdateGameSortGridRowHeight10ft = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft), 
                GetFFlagShowCreatorNameOnEmphasisSearchTileIXP = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
            }, 
            Http = {
                Requests = {
                    DiscoveryApi = {
                        OmniGetRecommendationsMetadata = require(l_Modules_0.LuaApp.Http.Requests.DiscoveryApi.OmniGetRecommendationsMetadata)
                    }, 
                    GamesApi = {
                        GetSearchLandingPageSuggestion = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion)
                    }, 
                    SearchGetOmniSearch = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch)
                }
            }, 
            Models = {
                DiscoveryApi = {
                    OmniRecommendations = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendations)
                }, 
                GamesApi = {
                    GameMediaEntry = require(l_Modules_0.LuaApp.Models.GamesApi.GameMediaEntry), 
                    GameSearchEntry = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry)
                }, 
                GameSortGroup = require(l_Modules_0.LuaApp.Models.GameSortGroup), 
                SearchInGames = require(l_Modules_0.LuaApp.Models.SearchInGames)
            }, 
            Reducers = {
                Games = {
                    GameMedia = require(l_Modules_0.LuaApp.Reducers.Games.GameMedia), 
                    GameSortGroups = require(l_Modules_0.LuaApp.Reducers.Games.GameSortGroups), 
                    OmniRecommendations = require(l_Modules_0.LuaApp.Reducers.Games.OmniRecommendations), 
                    OmniRecommendationsRefreshTime = require(l_Modules_0.LuaApp.Reducers.Games.OmniRecommendationsRefreshTime)
                }, 
                FetchHomePageDataStatusAll = require(l_Modules_0.LuaApp.Reducers.FetchHomePageDataStatusAll), 
                GamesPageDataStatus = require(l_Modules_0.LuaApp.Reducers.GamesPageDataStatus), 
                HomePageDataStatus = require(l_Modules_0.LuaApp.Reducers.HomePageDataStatus), 
                HomePageUpsellCardVariation = require(l_Modules_0.LuaApp.Reducers.HomePageUpsellCardVariation), 
                OmniRecommendationsMetadataRetrievalStatus = require(l_Modules_0.LuaApp.Reducers.OmniRecommendationsMetadataRetrievalStatus), 
                RequestsStatus = require(l_Modules_0.LuaApp.Reducers.RequestsStatus)
            }, 
            Thunks = {
                Games = {
                    ApiFetchGameMedia = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia), 
                    ApiFetchGamesData = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData), 
                    ApiFetchGamesInSort = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort), 
                    RefreshExpiringSortTokens = require(l_Modules_0.LuaApp.Thunks.Games.RefreshExpiringSortTokens), 
                    updateGamesSortData = require(l_Modules_0.LuaApp.Thunks.Games.updateGamesSortData)
                }, 
                Omni = {
                    ApiFetchOmniRecommendations = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations), 
                    ApiFetchOmniRecommendationsMetadata = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata), 
                    parseAndAddContentMetadata = require(l_Modules_0.LuaApp.Thunks.Omni.parseAndAddContentMetadata)
                }, 
                Search = {
                    ApiFetchGameSearchResults = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults), 
                    ApiFetchSearchLandingPage = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchSearchLandingPage), 
                    HandleGameSearchResults = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults)
                }, 
                FetchAdditionalFriendsInfo = require(l_Modules_0.LuaApp.Thunks.FetchAdditionalFriendsInfo), 
                FetchDataWithErrorToasts = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts), 
                FetchGamesPageData = require(l_Modules_0.LuaApp.Thunks.FetchGamesPageData), 
                FetchHomePageData = require(l_Modules_0.LuaApp.Thunks.FetchHomePageData), 
                LegacyUpdateUsers = require(l_Modules_0.LuaApp.Thunks.LegacyUpdateUsers), 
                RefreshGameSorts = require(l_Modules_0.LuaApp.Thunks.RefreshGameSorts)
            }, 
            Util = {
                Omni = {
                    OmniUtils = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils)
                }
            }
        }, 
        Personalization = {
            Analytics = {
                queryImpressionsEvent = require(l_Modules_0.Personalization.Analytics.queryImpressionsEvent), 
                querySuggestionClicked = require(l_Modules_0.Personalization.Analytics.querySuggestionClicked)
            }, 
            Games = {
                DataStore = {
                    GenerateTopicContents = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents)
                }, 
                Discovery = {
                    DiscoveryNextPageId = require(l_Modules_0.Personalization.Games.Discovery.DiscoveryNextPageId)
                }, 
                CollectionViewsExperimentation = require(l_Modules_0.Personalization.Games.CollectionViewsExperimentation), 
                GameCollectionCarousel = require(l_Modules_0.Personalization.Games.GameCollectionCarousel), 
                useLoadGamesForSortFromGamesApi = require(l_Modules_0.Personalization.Games.useLoadGamesForSortFromGamesApi), 
                useLoadMoreGames = require(l_Modules_0.Personalization.Games.useLoadMoreGames)
            }, 
            OmniFeed = {
                DataStore = {
                    AddExploreOmniItems = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddExploreOmniItems), 
                    AddSearchResultsOmniFeed = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed), 
                    ClearFeedItemRowData = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRowData), 
                    ClearGameGridFlexFeedItemBounds = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds), 
                    ClearOmniFeedItemsRowData = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearOmniFeedItemsRowData), 
                    FeedItemModel = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel), 
                    GameGridFlexFeedItemBounds = require(l_Modules_0.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds), 
                    OmniItemsGlobalLayoutData = require(l_Modules_0.Personalization.OmniFeed.DataStore.OmniItemsGlobalLayoutData), 
                    OmniItemsRowData = require(l_Modules_0.Personalization.OmniFeed.DataStore.OmniItemsRowData), 
                    SetFeedItemRowData = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRowData), 
                    SetGameGridFlexFeedItemInput = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput), 
                    SetOmniFeedItemsRowData = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetOmniFeedItemsRowData)
                }, 
                FeedItems = {
                    GameCarouselFeedItem = require(l_Modules_0.Personalization.OmniFeed.FeedItems.GameCarouselFeedItem), 
                    GameFiltersFeedItem = require(l_Modules_0.Personalization.OmniFeed.FeedItems.GameFiltersFeedItem), 
                    HomeGameGridFlexFeedItem = require(l_Modules_0.Personalization.OmniFeed.FeedItems.HomeGameGridFlexFeedItem), 
                    SearchGameGridFeedItem = require(l_Modules_0.Personalization.OmniFeed.FeedItems.SearchGameGridFeedItem), 
                    SearchTextFeedItem = require(l_Modules_0.Personalization.OmniFeed.FeedItems.SearchTextFeedItem)
                }, 
                OmniFeedConstants = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants), 
                OmniFeedImpressionsDetector = require(l_Modules_0.Personalization.OmniFeed.OmniFeedImpressionsDetector), 
                OmniFeedProps = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps), 
                OmniFeedTypes = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes), 
                useGridFlexFeedItemBounds = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds)
            }, 
            Search = {
                FIntSearchLandingPageSideMargin = require(l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin), 
                mapContentTypeToTreatmentType = require(l_Modules_0.Personalization.Search.mapContentTypeToTreatmentType), 
                SearchConstants = require(l_Modules_0.Personalization.Search.SearchConstants), 
                SearchPill = require(l_Modules_0.Personalization.Search.SearchPill)
            }, 
            Sessions = {
                DataStore = {
                    PageSessionTimestamp = require(l_Modules_0.Personalization.Sessions.DataStore.PageSessionTimestamp), 
                    SetPageSessionTimestamp = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp)
                }, 
                DiscoverPageSession = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession), 
                SearchLandingPageSession = require(l_Modules_0.Personalization.Sessions.SearchLandingPageSession)
            }
        }
    }, 
    ["jest.config"] = script["jest.config"]
};