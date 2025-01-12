local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_SocialLibraries_0 = v1.SocialLibraries;
local v8 = require(l_Parent_1.SocialCommon);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v10 = require(script.Parent.PYMKCarouselUserContextualInfo);
local v11 = require(script.Parent.usePYMKCarouselUserButtons);
local v12 = require(l_Parent_0.Analytics);
local v13 = require(l_Parent_0.Analytics.getFriendStatus);
local l_EventNames_0 = v12.EventNames;
local v15 = require(l_Parent_0.Common.Constants);
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local v17 = require(l_Parent_1.SocialStopwatch);
local l_ImpressionsTagUtility_0 = require(l_Parent_1.Impressions).ImpressionsTagUtility;
local l_getRecommendationContextualInfoType_0 = v8.Utils.getRecommendationContextualInfoType;
local l_CarouselUserTile_0 = v8.Components.CarouselUserTile.CarouselUserTile;
local l_FFlagLuaAppPYMKCollectionMigration_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPYMKCollectionMigration;
return function(v22) --[[ Line: 44 ]]
    -- upvalues: l_FFlagLuaAppPYMKCollectionMigration_0 (copy), l_React_0 (copy), l_ImpressionsTagUtility_0 (copy), v17 (copy), l_EventNames_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RoduxFriends_0 (copy), v11 (copy), l_RecommendationContextType_0 (copy), v10 (copy), v15 (copy), l_getRecommendationContextualInfoType_0 (copy), v13 (copy), l_Roact_0 (copy), l_CarouselUserTile_0 (copy)
    local v23 = nil;
    if l_FFlagLuaAppPYMKCollectionMigration_0 then
        v23 = l_React_0.useRef(nil);
        l_React_0.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v23 (ref), v22 (copy)
            l_ImpressionsTagUtility_0.AddTag(v23, v22.impressionsTag, v22.LayoutOrder);
            return function() --[[ Line: 50 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v23 (ref), v22 (ref)
                l_ImpressionsTagUtility_0.RemoveTag(v23, v22.impressionsTag, v22.LayoutOrder);
            end;
        end, {
            v23, 
            v22.impressionsTag, 
            v22.LayoutOrder
        });
    end;
    l_React_0.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v17 (ref), v22 (copy), l_EventNames_0 (ref)
        local v24 = v17.Stopwatch.stop(v17.Events.PYMKCarouselLoaded);
        if v24 then
            v22.fireAnalyticsEvent(l_EventNames_0.PYMKCarouselLoadingTime, {
                loadingTime = v24.timeElapsed
            });
        end;
    end, {});
    local v26 = l_useSelector_0(function(v25) --[[ Line: 65 ]]
        return (tostring(v25.LocalUserId));
    end);
    local v27 = tostring(v22.userId);
    local v29 = l_useSelector_0(function(v28) --[[ Line: 71 ]]
        -- upvalues: l_getDeepValue_0 (ref), v27 (copy)
        return l_getDeepValue_0(v28, string.format("PYMKCarousel.Users.byUserId.%s", v27));
    end);
    local v31 = l_useSelector_0(function(v30) --[[ Line: 75 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v27 (copy)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v30)({
            v27
        })[v27] or nil;
    end);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 79 ]]
        -- upvalues: l_getDeepValue_0 (ref), v27 (copy)
        return l_getDeepValue_0(v32, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v27));
    end);
    local v35 = l_useSelector_0(function(v34) --[[ Line: 86 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v26 (copy), v27 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v34)(v26)[v27] or {};
    end);
    local v36 = v11({
        userId = v27, 
        showToast = v22.showToast, 
        fireAnalyticsEvent = v22.fireAnalyticsEvent, 
        absolutePosition = v22.absolutePosition, 
        contactId = if v35.contextType == l_RecommendationContextType_0.Contacts then v35.entityId else nil
    });
    local function v37() --[[ Line: 100 ]]
        -- upvalues: v10 (ref), v22 (copy), v35 (copy)
        return v10({
            lineWidth = v22.tileWidth, 
            userId = v22.userId, 
            contextType = v35.contextType
        });
    end;
    local v38 = if v35.mutualFriendsCount then v35.mutualFriendsCount else if v35.mutualFriendsList then #v35.mutualFriendsList else nil;
    local function v39() --[[ Line: 112 ]]
        -- upvalues: v22 (copy), v27 (copy), v15 (ref), v38 (copy), v35 (copy), l_getRecommendationContextualInfoType_0 (ref), l_RecommendationContextType_0 (ref)
        v22.openProfilePeekView(v27, {
            absolutePosition = v22.absolutePosition, 
            source = v15.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            mutualFriendsCount = v38, 
            recommendationSessionId = v22.recommendationSessionId, 
            recommendationRank = v35.rank, 
            recommendationContextType = v35.contextType.rawValue(), 
            contextualInfoType = l_getRecommendationContextualInfoType_0(v35), 
            contactProps = if v35.contextType == l_RecommendationContextType_0.Contacts and v35.entityId then {
                contactId = v35.entityId, 
                avatarImageUrl = if v35.thumbnailEntities then v35.thumbnailEntities.avatarImageUrl else nil, 
                contactName = v35.entityDisplayName
            } else nil, 
            profileType = v35.contextType == l_RecommendationContextType_0.Contacts and "FromContacts" or nil
        });
    end;
    local function v40() --[[ Line: 141 ]]
        -- upvalues: v39 (copy), v22 (copy), l_EventNames_0 (ref), v27 (copy), v13 (ref), v31 (copy), v33 (copy), v35 (copy), l_RecommendationContextType_0 (ref)
        v39();
        v22.fireAnalyticsEvent(l_EventNames_0.UserPressed, {
            recommendationId = v27, 
            friendStatus = v13(v31, v33), 
            recommendationContextType = v35.contextType, 
            recommendationRank = v35.rank, 
            absolutePosition = v22.absolutePosition, 
            contactId = if v35.contextType == l_RecommendationContextType_0.Contacts then v35.entityId else nil
        });
    end;
    return l_Roact_0.createFragment({
        PYMKCarouselUserTile = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, v22.tileWidth, 0, v22.tileWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = if l_FFlagLuaAppPYMKCollectionMigration_0 then v22.LayoutOrder else nil, 
            ref = if l_FFlagLuaAppPYMKCollectionMigration_0 then v23 else nil
        }, {
            CarouselUserTile = l_Roact_0.createElement(l_CarouselUserTile_0, {
                headshotImageUrl = if v35.thumbnailEntities then v35.thumbnailEntities.headshotImageUrl else nil, 
                userId = v27, 
                userName = if v35.contextType == l_RecommendationContextType_0.Contacts then v35.entityDisplayName or "" else (v29 or {}).displayName or "", 
                tileSize = v22.tileWidth, 
                renderContextualInfo = v37, 
                renderButtons = v36, 
                onActivatedTile = v40, 
                onActivatedContextual = v40
            })
        })
    });
end;