local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_useStyle_0 = v1.UIBlox.Core.Style.useStyle;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SocialCommon);
local v7 = require(l_Parent_0.SocialStopwatch);
local l_calculateContextualMaxHeight_0 = v6.Components.CarouselUserTile.calculateContextualMaxHeight;
local v9 = require(l_Parent_0.tutils);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v11 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v11.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v11.useCollectionLayoutParams;
local l_CollectionItemSize_0 = v11.CollectionViewTypes.CollectionItemSize;
local l_useCollectionImpressionsSignal_0 = v11.useCollectionImpressionsSignal;
local l_CarouselUpdatesExperimentation_0 = v11.CarouselUpdatesExperimentation;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local v18 = require(l_script_FirstAncestor_0.Analytics);
local l_BtnValues_0 = v18.BtnValues;
local l_EventNames_0 = v18.EventNames;
local l_useUserSeenEvent_0 = v18.useUserSeenEvent;
local v22 = require(l_script_FirstAncestor_0.Components.PYMKCarouselUserTile);
local v23 = require(l_script_FirstAncestor_0.Components.PYMKCarouselButtonTile);
local v24 = require(l_script_FirstAncestor_0.Components.PYMKCarouselFindFriendsTooltip);
local v25 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.usePYMKCarouselItemList);
local v26 = require(l_script_FirstAncestor_0.installReducer.Selectors.getPYMKSortedRecommendationIds);
local l_FFlagLuaAppScrollableDesktopCarousels_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppScrollableDesktopCarousels;
local l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppScrollableDesktopCarouselsIXP;
local v29 = 0;
local function v66(v30) --[[ Line: 65 ]] --[[ Name: PYMKCollectionCarousel ]]
    -- upvalues: l_useAppPolicy_0 (copy), v5 (copy), l_useSelector_0 (copy), v26 (copy), v9 (copy), v25 (copy), l_EventNames_0 (copy), l_BtnValues_0 (copy), v7 (copy), v29 (ref), l_useStyle_0 (copy), l_calculateContextualMaxHeight_0 (copy), l_FFlagLuaAppScrollableDesktopCarousels_0 (copy), l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 (copy), l_CarouselUpdatesExperimentation_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useUserSeenEvent_0 (copy), l_useCollectionImpressionsSignal_0 (copy), v23 (copy), v24 (copy), v22 (copy), l_CollectionCarousel_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 66 ]]
        return v31.useGridPageLayout();
    end);
    local v33, v34 = v5.useState(nil);
    local v35 = v5.useRef(nil);
    local v38 = l_useSelector_0(function(v36) --[[ Line: 76 ]]
        -- upvalues: v26 (ref)
        local l_LocalUserId_0 = v36.LocalUserId;
        return v26(l_LocalUserId_0)(v36);
    end, v9.shallowEqual);
    local v39 = v38 and #v38 or 0;
    local l_recommendationSessionId_0 = v30.recommendationSessionId;
    local l_fireAnalyticsEvent_0 = v30.fireAnalyticsEvent;
    local v42 = v25({
        recommendationIds = v38, 
        recommendationCount = v39, 
        findFriendsTileEnabled = v30.findFriendsTileEnabled, 
        seeAllTileEnabled = v30.seeAllTileEnabled
    });
    local v43 = v5.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_BtnValues_0 (ref), v30 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselGenericTileClicked, {
            btn = l_BtnValues_0.SeeAll.rawValue()
        });
        v30.goToAddFriendsPage(false);
    end, {
        v30.goToAddFriendsPage, 
        l_fireAnalyticsEvent_0
    });
    v5.useLayoutEffect(function() --[[ Line: 98 ]]
        -- upvalues: v7 (ref)
        v7.Stopwatch.start(v7.Events.PYMKCarouselLoaded);
        return function() --[[ Line: 100 ]]
            -- upvalues: v7 (ref)
            if v7.Stopwatch.get(v7.Events.PYMKCarouselLoaded) then
                v7.Stopwatch.stop(v7.Events.PYMKCarouselLoaded);
            end;
        end;
    end, {
        l_recommendationSessionId_0
    });
    local v44, v45 = v5.useState(os.clock());
    v5.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v39 (copy), v29 (ref), v30 (copy), v45 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v39, 
            refreshCount = v29, 
            findFriendsTileEnabled = v30.findFriendsTileEnabled
        });
        v29 = v29 + 1;
        v45(os.clock());
    end, {
        l_recommendationSessionId_0, 
        v39
    });
    local v46 = l_useStyle_0();
    local v47 = v5.useMemo(function() --[[ Line: 119 ]]
        -- upvalues: l_calculateContextualMaxHeight_0 (ref), v46 (copy)
        return l_calculateContextualMaxHeight_0({
            font = v46.Font
        });
    end, {
        v46.Font
    });
    local v49 = v5.useCallback(function(v48) --[[ Line: 125 ]]
        -- upvalues: v47 (copy)
        return v48 + v47;
    end, {
        v47
    });
    local v50 = {
        fractionalItemAmount = if l_FFlagLuaAppScrollableDesktopCarousels_0 or l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 and l_CarouselUpdatesExperimentation_0.getIsDesktopScrollable() then nil else v32 and 0 or nil, 
        sideMargin = if v32 then nil else v30.sideMargin
    };
    local v51 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v33, true, v50);
    local v52 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v57 = v5.useCallback(function(v53) --[[ Line: 144 ]]
        -- upvalues: v42 (copy), v52 (copy)
        local v54 = {};
        for _, v56 in v53 do
            table.insert(v54, {
                item = v42[v56]
            });
        end;
        if #v52 > 0 then
            v52[1].onViewableItemsChanged({
                changed = v54
            });
        end;
    end, {
        v52, 
        v42
    });
    local v58, v59 = l_useCollectionImpressionsSignal_0(v30.scrollViewPositionChangedSignal);
    local v65 = v5.useCallback(function(v60, v61, _, _) --[[ Line: 163 ]]
        -- upvalues: v51 (copy), v5 (ref), v23 (ref), v30 (copy), l_fireAnalyticsEvent_0 (copy), v24 (ref), v22 (ref), l_recommendationSessionId_0 (copy)
        local l_itemWidth_0 = v51.itemWidth;
        if v60.isButtonTile then
            return v5.createElement(v23, {
                id = v60.id, 
                tileWidth = l_itemWidth_0, 
                goToAddFriendsPage = v30.goToAddFriendsPage, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                shouldShowContactImporterBadge = v30.shouldShowContactImporterBadge, 
                LayoutOrder = v61
            }), "PYMKCarouselButtonTile";
        elseif v60.isTooltip then
            return v5.createElement(v24, {
                LayoutOrder = v61
            }), "PYMKCarouselFindFriendsTooltip";
        else
            return v5.createElement(v22, {
                userId = v60.id, 
                tileWidth = l_itemWidth_0, 
                contextualInfoLines = 2, 
                openProfilePeekView = v30.openProfilePeekView, 
                showToast = v30.showToast, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                absolutePosition = v60.absolutePosition, 
                recommendationSessionId = l_recommendationSessionId_0, 
                LayoutOrder = v61, 
                impressionsTag = "PYMKCollectionCarousel"
            }), "PYMKCarouselUserTile";
        end;
    end, {
        v30.goToAddFriendsPage, 
        l_fireAnalyticsEvent_0, 
        v30.shouldShowContactImporterBadge, 
        v30.openProfilePeekView, 
        v30.showToast, 
        l_recommendationSessionId_0, 
        v51.itemWidth
    });
    if #v42 == 0 then
        return nil;
    else
        return v5.createElement(v5.Fragment, nil, {
            PYMKCarousel = v5.createElement(l_CollectionCarousel_0, {
                title = v30.carouselTitle, 
                onActivateHeader = v43, 
                containerRef = v34, 
                scrollingFrameRef = v35, 
                items = v42, 
                renderItem = v65, 
                getItemHeight = v49, 
                numColumns = v51.numColumns, 
                fractionalItemAmount = v51.fractionalItemAmount, 
                columnGap = v51.columnGap, 
                sideMargin = v51.sideMargin, 
                maxItemsToShow = v51.maxTilesToShow, 
                shouldUseGridPageLayout_legacy = v32 or false, 
                onViewableItemsChanged = v59, 
                onChangeCanvasPosition = v59
            }), 
            ScreenSizeImpressionsTracker = v5.createElement(l_ScreenSizeImpressionsTracker_0, {
                pageContext = v30.pageContext, 
                parentRef = v35, 
                impressionsTag = "PYMKCollectionCarousel", 
                scrollViewPositionChangedSignal = v58, 
                sendImpressions = v57, 
                dataUpdatedTimestamp = v44
            })
        });
    end;
end;
return v5.memo(v66);