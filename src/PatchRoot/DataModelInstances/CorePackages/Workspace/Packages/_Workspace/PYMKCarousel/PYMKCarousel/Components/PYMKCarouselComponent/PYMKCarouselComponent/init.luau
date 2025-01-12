local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local v5 = require(l_Parent_0.SocialCommon);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_UIBlox_0 = v1.UIBlox;
local l_FreeFlowCarousel_0 = l_UIBlox_0.App.Container.Carousel.FreeFlowCarousel;
local l_calculateContextualMaxHeight_0 = v5.Components.CarouselUserTile.calculateContextualMaxHeight;
local v11 = require(l_Parent_0.SocialStopwatch);
local v12 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v12.EventNames;
local l_useUserSeenEvent_0 = v12.useUserSeenEvent;
local v15 = require(l_script_FirstAncestor_0.Components.PYMKCarouselUserTile);
local v16 = require(l_script_FirstAncestor_0.Components.PYMKCarouselButtonTile);
local v17 = require(l_script_FirstAncestor_0.Components.PYMKCarouselFindFriendsTooltip);
local v18 = require(script.Parent.usePYMKCarouselItemList);
local v19 = require(l_script_FirstAncestor_0.installReducer.Selectors.getPYMKSortedRecommendationIds);
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
local function v22(v21) --[[ Line: 51 ]]
    return v21.id;
end;
local v23 = 0;
return function(v24) --[[ Line: 57 ]]
    -- upvalues: l_React_0 (copy), l_useSelector_0 (copy), v19 (copy), l_dependencyArray_0 (copy), v11 (copy), l_EventNames_0 (copy), v23 (ref), l_useUserSeenEvent_0 (copy), l_UIBlox_0 (copy), l_calculateContextualMaxHeight_0 (copy), l_getFFlagPYMKAddFriendsEntry_0 (copy), l_Roact_0 (copy), v16 (copy), v17 (copy), v15 (copy), v18 (copy), l_FreeFlowCarousel_0 (copy), v22 (copy)
    local v25, v26 = l_React_0.useState({});
    local v28 = l_useSelector_0(function(v27) --[[ Line: 60 ]]
        return (tostring(v27.LocalUserId));
    end);
    local v29 = l_useSelector_0(v19(v28));
    local v30 = v29 and #v29 or 0;
    local l_recommendationSessionId_0 = v24.recommendationSessionId;
    l_React_0.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v26 (copy), v29 (copy)
        v26(v29);
    end, l_dependencyArray_0(v30, l_recommendationSessionId_0));
    local l_fireAnalyticsEvent_0 = v24.fireAnalyticsEvent;
    l_React_0.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v11 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v30 (copy), v23 (ref), v24 (copy)
        v11.Stopwatch.start(v11.Events.PYMKCarouselLoaded);
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v30, 
            refreshCount = v23, 
            findFriendsTileEnabled = v24.findFriendsTileEnabled
        });
        v23 = v23 + 1;
        return function() --[[ Line: 84 ]]
            -- upvalues: v11 (ref)
            if v11.Stopwatch.get(v11.Events.PYMKCarouselLoaded) then
                v11.Stopwatch.stop(v11.Events.PYMKCarouselLoaded);
            end;
        end;
    end, {
        l_recommendationSessionId_0
    });
    local v33 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v34 = l_UIBlox_0.Core.Style.useStyle();
    local v35 = l_React_0.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: l_calculateContextualMaxHeight_0 (ref), v34 (copy)
        return l_calculateContextualMaxHeight_0({
            font = v34.Font
        });
    end, {
        v34.Font
    });
    local function v37(v36) --[[ Line: 100 ]]
        -- upvalues: l_getFFlagPYMKAddFriendsEntry_0 (ref), l_Roact_0 (ref), v16 (ref), v24 (copy), l_fireAnalyticsEvent_0 (copy), v17 (ref), v15 (ref), l_recommendationSessionId_0 (copy)
        if l_getFFlagPYMKAddFriendsEntry_0() and v36.isButtonTile then
            return (l_Roact_0.createElement(v16, {
                id = v36.id, 
                goToAddFriendsPage = v24.goToAddFriendsPage, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                shouldShowContactImporterBadge = v24.shouldShowContactImporterBadge
            }));
        elseif l_getFFlagPYMKAddFriendsEntry_0() and v36.isTooltip then
            return l_Roact_0.createElement(v17);
        else
            return l_Roact_0.createElement(v15, {
                userId = v36.id, 
                tileWidth = 100, 
                contextualInfoLines = 2, 
                openProfilePeekView = v24.openProfilePeekView, 
                showToast = v24.showToast, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                absolutePosition = v36.absolutePosition, 
                recommendationSessionId = l_recommendationSessionId_0
            });
        end;
    end;
    local v38 = if l_getFFlagPYMKAddFriendsEntry_0() then v18({
        recommendationIds = v25, 
        recommendationCount = v30, 
        findFriendsTileEnabled = v24.findFriendsTileEnabled, 
        seeAllTileEnabled = v24.seeAllTileEnabled
    }) else nil;
    return l_Roact_0.createElement(l_FreeFlowCarousel_0, {
        headerText = v24.carouselTitle, 
        identifier = v22, 
        itemList = if l_getFFlagPYMKAddFriendsEntry_0() then v38 else v25, 
        renderItem = v37, 
        itemSize = Vector2.new(100, 100 + v35), 
        carouselMargin = v24.sideMargin, 
        viewabilityConfigCallbackPairs = v33
    });
end;