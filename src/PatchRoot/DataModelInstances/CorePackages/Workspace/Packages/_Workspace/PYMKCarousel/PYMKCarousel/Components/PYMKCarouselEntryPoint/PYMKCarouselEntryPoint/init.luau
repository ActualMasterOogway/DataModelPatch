local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local v4 = require(l_Parent_0.RobloxAppHooks);
local l_useSelector_0 = v2.Hooks.useSelector;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_useLocalUserId_0 = v4.useLocalUserId;
local l_setupFireEvent_0 = require(l_script_FirstAncestor_0.Analytics).setupFireEvent;
local l_getSessionIdByKey_0 = v2.RoduxAnalytics.Selectors.getSessionIdByKey;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local v11 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent);
local v12 = require(l_script_FirstAncestor_0.Components.PYMKCollectionCarousel);
local l_FFlagLuaAppPYMKCollectionMigration_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPYMKCollectionMigration;
return function(v14) --[[ Line: 40 ]] --[[ Name: PYMKCarouselEntryPoint ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), l_React_0 (copy), l_setupFireEvent_0 (copy), l_dependencyArray_0 (copy), l_FFlagLuaAppPYMKCollectionMigration_0 (copy), v12 (copy), v11 (copy)
    local v15 = l_useLocalUserId_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 43 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v16)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v18 = l_React_0.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: l_setupFireEvent_0 (ref), v15 (copy), v17 (copy), v14 (copy)
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v15, 
                recommendationSessionId = v17
            }, 
            analytics = {
                Diag = v14.diagService, 
                EventStream = v14.eventIngestService
            }
        });
    end, l_dependencyArray_0(v15, v17));
    if not v15 then
        return nil;
    elseif v17 or v14.findFriendsTileEnabled then
        if l_FFlagLuaAppPYMKCollectionMigration_0 and v14.isCollectionViewEnabled then
            return l_React_0.createElement(v12, {
                findFriendsTileEnabled = v14.findFriendsTileEnabled, 
                seeAllTileEnabled = v14.seeAllTileEnabled, 
                recommendationSessionId = v17, 
                carouselTitle = v14.carouselTitle, 
                sideMargin = v14.sideMargin, 
                openProfilePeekView = v14.openProfilePeekView, 
                showToast = v14.showToast, 
                goToAddFriendsPage = v14.goToAddFriendsPage, 
                shouldShowContactImporterBadge = v14.shouldShowContactImporterBadge, 
                pageContext = v14.pageContext, 
                scrollViewPositionChangedSignal = v14.scrollViewPositionChangedSignal, 
                fireAnalyticsEvent = v18
            });
        else
            return l_React_0.createElement(v11, {
                findFriendsTileEnabled = v14.findFriendsTileEnabled, 
                seeAllTileEnabled = v14.seeAllTileEnabled, 
                recommendationSessionId = v17, 
                carouselTitle = v14.carouselTitle, 
                sideMargin = v14.sideMargin, 
                openProfilePeekView = v14.openProfilePeekView, 
                showToast = v14.showToast, 
                goToAddFriendsPage = v14.goToAddFriendsPage, 
                shouldShowContactImporterBadge = v14.shouldShowContactImporterBadge, 
                fireAnalyticsEvent = v18
            });
        end;
    else
        return nil;
    end;
end;