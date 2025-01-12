local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(script.Parent.EventNames);
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local l_Enums_0 = v4.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v8 = require(script.Parent.BtnValues);
local v9 = require(l_Parent_0.Common.Constants);
local l_formatRecommendationContextType_0 = v4.Analytics.Formatters.formatRecommendationContextType;
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
local l_FFlagFixContactRecsFriendRequestLogging_0 = require(l_Parent_1.SharedFlags).FFlagFixContactRecsFriendRequestLogging;
local function v14(v13) --[[ Line: 18 ]]
    return v13;
end;
local v15 = {
    [v3.CarouselLoadedWithUsers] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.FriendsCarouselLoaded, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            recommendationCount = v14, 
            recommendationLimit = nil, 
            refreshCount = v14
        }
    }, 
    [v3.PYMKCarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            loadingTime = v14
        }
    }, 
    [v3.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName, 
            isRecommendation = true
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendStatus = v14, 
            recommendationRank = v14, 
            userId = v14, 
            contactId = v14
        }
    }, 
    [v3.UserPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            btn = v8.OpenPeopleList
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationId = v14, 
            friendStatus = v14, 
            recommendationRank = v14, 
            contactId = v14
        }
    }, 
    [v3.RequestFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.RequestFriendship, 
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v14, 
            requestedId = v14, 
            contactId = if l_FFlagFixContactRecsFriendRequestLogging_0 then v14 else nil
        }
    }, 
    [v3.AcceptFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.AcceptFriendship, 
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v14, 
            requestedId = v14
        }
    }
};
if l_getFFlagPYMKAddFriendsEntry_0() then
    local v16 = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            btn = v14
        }
    };
    v15[v3.CarouselGenericTileClicked] = v16;
end;
return v15;