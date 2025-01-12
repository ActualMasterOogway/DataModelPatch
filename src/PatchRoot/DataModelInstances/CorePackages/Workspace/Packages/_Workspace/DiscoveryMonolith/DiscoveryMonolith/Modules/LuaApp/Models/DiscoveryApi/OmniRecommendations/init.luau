local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local v3 = require(l_Parent_0.Cryo);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local l_OmniRecommendationsPageType_0 = require(l_Parent_0.DiscoveryUtils).OmniRecommendationsPageType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v9 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v10 = {
    new = function() --[[ Line: 49 ]] --[[ Name: new ]]
        return {};
    end
};
v10.mock = function() --[[ Line: 55 ]] --[[ Name: mock ]]
    -- upvalues: v10 (copy), l_AppPage_0 (copy), l_GameInfoModel_0 (copy), l_OmniRecommendationsContentType_0 (copy), v9 (copy)
    local v11 = v10.new();
    v11.pageType = l_AppPage_0.Home;
    v11.nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=";
    v11.isSessionExpired = false;
    local v12 = l_GameInfoModel_0.mock();
    v11.sorts = {
        {
            topic = "topic1", 
            topicId = "100000003", 
            recommendations = {
                {
                    contentType = l_OmniRecommendationsContentType_0.Game, 
                    contentId = v12.universeId
                }
            }, 
            treatmentType = v9.Carousel, 
            numberOfRows = -1
        }
    };
    v11.recommendationsId = "3d14d9e6-cea3-4eec-bcdc-cfdc906f61cb";
    v11.omniSessionId = "d3240862-f901-419c-8780-5160e05d8473";
    return v11;
end;
v10.mockEndpointResponse = function(v13) --[[ Line: 84 ]] --[[ Name: mockEndpointResponse ]]
    -- upvalues: l_OmniRecommendationsContentType_0 (copy), v9 (copy), l_OmniRecommendationsPageType_0 (copy)
    local v14 = {
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
        ageRecommendationDisplayName = "All Ages", 
        friendVisits = {
            {
                userId = "1894536079"
            }
        }, 
        friendVisitedString = "1 Friend visited", 
        defaultLayoutData = {
            footer = {
                type = "TextLabel", 
                textLiteral = "This is footer text"
            }
        }, 
        layoutDataBySort = {
            ["500000000"] = {
                footer = {
                    type = "TextLabel", 
                    textLiteral = "This is a sort-level footer text"
                }
            }
        }, 
        primaryWideAssetId = "12046435434"
    };
    return {
        contentMetadata = {
            [l_OmniRecommendationsContentType_0.Game] = {
                [v14.universeId] = v14
            }
        }, 
        sorts = {
            {
                topic = "Friends", 
                topicId = 600000000, 
                recommendationList = {}, 
                treatmentType = v9.FriendCarousel
            }, 
            {
                topic = v13 or "topic123", 
                topicId = 100000003, 
                recommendationList = {
                    {
                        contentType = l_OmniRecommendationsContentType_0.Game, 
                        contentId = v14.universeId
                    }
                }, 
                treatmentType = v9.Carousel
            }
        }, 
        pageType = l_OmniRecommendationsPageType_0.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        requestId = "123avcd3-1431-35bd-24db-452abcde65abf35", 
        nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=", 
        isSessionExpired = false
    };
end;
v10.fromJsonData = function(v15, v16) --[[ Line: 147 ]] --[[ Name: fromJsonData ]]
    -- upvalues: l_OmniRecommendationsPageType_0 (copy), v2 (copy), v3 (copy)
    local _ = nil;
    local v18 = {};
    local v19 = l_OmniRecommendationsPageType_0.toAppPage(v15.pageType);
    if not v19 then
        return v2.error((("pageType %* for OmniRecommedations is not supported."):format(v19)));
    else
        assert(v19, "always exists for linter");
        v18.pageType = v19;
        if v15.sortsRefreshInterval and v15.sortsRefreshInterval > 0 then
            v18.sortsExpirationTime = tick() + v15.sortsRefreshInterval;
        end;
        v18.nextPageToken = v15.nextPageToken;
        v18.isSessionExpired = v15.isSessionExpired;
        v18.recommendationsId = v15.requestId;
        v18.omniSessionId = v16 or "Invalid_OmniSessionId";
        v18.sorts = v3.List.map(v15.sorts, function(v20) --[[ Line: 165 ]]
            -- upvalues: v3 (ref)
            local v21 = if v20.topicId then tostring(v20.topicId) else nil;
            return {
                topic = v20.topic, 
                topicId = v21, 
                subtitle = v20.subtitle, 
                recommendations = if v20.recommendationList then v3.List.map(v20.recommendationList, function(v22) --[[ Line: 173 ]]
                    return {
                        contentType = v22.contentType, 
                        contentId = v22.contentId, 
                        contentStringId = v22.contentStringId, 
                        contentMetadata = v22.contentMetadata
                    };
                end) else nil, 
                treatmentType = v20.treatmentType, 
                numberOfRows = v20.numberOfRows and v20.numberOfRows or -1, 
                topicLayoutData = v20.topicLayoutData
            };
        end);
        v18.globalLayoutData = v15.globalLayoutData or {};
        return v2.success(v18);
    end;
end;
return v10;