local l_Parent_0 = script:FindFirstAncestor("DiscoveryTestHelpers").Parent;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v2 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfosReducer_0 = v2.TopicInfosReducer;
local l_TopicInfoModel_0 = v2.TopicInfoModel;
local v5 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v5.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v5.FetchStatusNamespace;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local function v10(v9) --[[ Line: 12 ]] --[[ Name: mockEntry ]]
    return {
        ageRecommendationDisplayName = "", 
        contentId = ("%*"):format(v9), 
        contentType = "Game", 
        friendVisitedString = "", 
        friendVisits = {}, 
        isSponsored = false, 
        minimumAge = 0, 
        name = ("name %*"):format(v9), 
        placeId = ("%*00"):format(v9), 
        playerCount = v9, 
        totalDownVotes = v9, 
        totalUpVotes = v9, 
        under13 = false, 
        under9 = false, 
        universeId = ("%*"):format(v9)
    };
end;
local function _(v11, v12, v13) --[[ Line: 32 ]] --[[ Name: mockTopicInfoFromOmni ]]
    -- upvalues: l_TopicInfoModel_0 (copy)
    local v14 = l_TopicInfoModel_0.mockFromOmniApi(v11);
    v14.displayName = v12;
    v14.treatmentType = v13;
    return v14;
end;
local function v20(_, v17) --[[ Line: 39 ]] --[[ Name: mockTopicContents ]]
    -- upvalues: v10 (copy)
    local v18 = {};
    for v19 = 1, v17 do
        table.insert(v18, (v10(v19)));
    end;
    return {
        entries = v18, 
        hasMoreRows = false, 
        nextPageExclusiveStartId = 0, 
        nextPageToken = "", 
        rowsRequested = 0, 
        updatedTimestamp = 1.718290975274871E9
    };
end;
return {
    mockEntry = v10, 
    mockTopicContents = v20, 
    mockGameSortForGamesApi = function(v21, v22, v23) --[[ Line: 54 ]] --[[ Name: mockGameSortForGamesApi ]]
        -- upvalues: l_TopicInfoModel_0 (copy)
        local v24 = l_TopicInfoModel_0.mockFromGamesApi(v21, v22);
        v24.displayIcon = "test-display-icon";
        v24.displayName = "test-display-name";
        v24.gameSetTargetId = v23;
        v24.token = "";
        v24.topicLayoutData = {};
        return v24;
    end, 
    mockStoreStateForOmniApi = function(v25, v26, _, v28, v29) --[[ Line: 64 ]] --[[ Name: mockStoreStateForOmniApi ]]
        -- upvalues: v10 (copy), l_GameInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), v20 (copy), l_TopicInfosReducer_0 (copy), l_TopicInfoModel_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy)
        local v30 = {};
        local v31 = {};
        local v32 = {};
        local v33 = {};
        local v34 = {};
        for v35 = 1, v28 do
            table.insert(v30, {
                contentId = v35, 
                contentType = "Game"
            });
            table.insert(v31, (v10(v35)));
            v32[("%*"):format(v35)] = v10(v35);
            v33[("%*"):format(v35)] = {
                PlayabilityStatus = "Playable"
            };
            v34[("%*"):format(v35)] = {
                summary = {
                    ageRecommendation = {
                        {
                            ageRecommendationDisplayName = "", 
                            minimumAge = 0
                        }
                    }
                }
            };
        end;
        local v36 = {
            AgeRecommendations = v34, 
            GameIconsKey = {}, 
            GamesProductInfoKey = {}, 
            GameDetails = {}, 
            GameDetailsPeekView = {}, 
            PlayabilityStatus = v33, 
            LocalUserId = 2, 
            Users = {}, 
            InGameUsersByGame = {}, 
            UserGameVotes = {}, 
            ShowAgeVerificationOverlay = {}, 
            GameSorts = {}, 
            OmniRecommendations = {
                [v26] = {
                    pageType = v26, 
                    metadata = {
                        Games = v31
                    }, 
                    sorts = {
                        {
                            numberOfRows = 1, 
                            recommendations = {}, 
                            topic = "Friends", 
                            topicId = "600000000", 
                            topicLayoutData = {}, 
                            treatmentType = "FriendCarousel"
                        }, 
                        {
                            numberOfRows = 1, 
                            recommendations = v30, 
                            topic = "Continue", 
                            topicId = v25, 
                            topicLayoutData = {}, 
                            treatmentType = "Carousel"
                        }
                    }
                }
            }
        };
        local v37 = {
            [l_GameInfosReducer_0.key] = v32, 
            [l_TopicContentsReducer_0.key] = {
                [v25] = v20(v25, v28)
            }
        };
        local l_key_0 = l_TopicInfosReducer_0.key;
        local v39 = {};
        local v40 = l_TopicInfoModel_0.mockFromOmniApi(v25);
        v40.displayName = "Continue";
        v40.treatmentType = "Carousel";
        v39[v25] = v40;
        v37[l_key_0] = v39;
        v37[l_FetchStatusReducer_0.key] = {
            [l_FetchStatusNamespace_0.GameSorts] = {
                [v25] = v29
            }, 
            [l_FetchStatusNamespace_0.OmniRecommendations] = {
                [v26] = v29
            }
        };
        v36.Personalization = v37;
        v36.BatchFetchingStatus = {};
        v36.FetchingStatus = {};
        v36.ScreenSize = Vector2.new(100, 100);
        v36.TopBar = {
            topBarHeight = 10
        };
        v36.GlobalGuiInset = {
            bottom = 10, 
            top = 10, 
            left = 0, 
            right = 0
        };
        v36.Navigation = {};
        v36.CentralOverlay = {
            OverlayType = nil
        };
        return v36;
    end, 
    mockStoreStateForGamesApi = function(v41, v42, v43, v44, v45) --[[ Line: 171 ]] --[[ Name: mockStoreStateForGamesApi ]]
        -- upvalues: v10 (copy), l_GameInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), v20 (copy), l_TopicInfosReducer_0 (copy), l_TopicInfoModel_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy)
        local v46 = {};
        local v47 = {};
        local v48 = {};
        for v49 = 1, v42 do
            v46[("%*"):format(v49)] = v10(v49);
            v47[("%*"):format(v49)] = {
                PlayabilityStatus = "Playable"
            };
            v48[("%*"):format(v49)] = {
                summary = {
                    ageRecommendation = {
                        {
                            ageRecommendationDisplayName = "", 
                            minimumAge = 0
                        }
                    }
                }
            };
        end;
        local v50 = {
            AgeRecommendations = v48, 
            GameIconsKey = {}, 
            GamesProductInfoKey = {}, 
            GameDetails = {}, 
            GameDetailsPeekView = {}, 
            PlayabilityStatus = v47, 
            LocalUserId = 2, 
            Users = {}, 
            InGameUsersByGame = {}, 
            UserGameVotes = {}, 
            ShowAgeVerificationOverlay = {}, 
            GameSortGroups = {
                HomeGames = {
                    pageId = ""
                }
            }
        };
        local v51 = {
            [l_GameInfosReducer_0.key] = v46, 
            [l_TopicContentsReducer_0.key] = {
                [v41] = v20(v41, v42)
            }
        };
        local l_key_1 = l_TopicInfosReducer_0.key;
        local v53 = {};
        local v54 = l_TopicInfoModel_0.mockFromGamesApi(v41, v44);
        v54.displayIcon = "test-display-icon";
        v54.displayName = "test-display-name";
        v54.gameSetTargetId = v45;
        v54.token = "";
        v54.topicLayoutData = {};
        v53[v41] = v54;
        v51[l_key_1] = v53;
        v51[l_FetchStatusReducer_0.key] = {
            [l_FetchStatusNamespace_0.GameSorts] = {
                [v41] = v43
            }
        };
        v50.Personalization = v51;
        v50.BatchFetchingStatus = {};
        v50.FetchingStatus = {};
        v50.ScreenSize = Vector2.new(100, 100);
        v50.TopBar = {
            topBarHeight = 10
        };
        v50.GlobalGuiInset = {
            bottom = 10, 
            top = 10, 
            left = 0, 
            right = 0
        };
        v50.Navigation = {};
        v50.CentralOverlay = {
            OverlayType = nil
        };
        return v50;
    end
};