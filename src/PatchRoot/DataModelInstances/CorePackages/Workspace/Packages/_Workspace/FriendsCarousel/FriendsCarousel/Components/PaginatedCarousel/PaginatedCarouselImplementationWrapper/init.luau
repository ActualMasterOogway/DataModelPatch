local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useCarouselList);
local v4 = require(script.Parent.usePaginatedFriendsCarouselList);
local v5 = require(script.Parent.RefreshCarouselWrapper);
local l_Analytics_0 = require(l_script_FirstAncestor_0.Analytics).Analytics;
local l_FFlagPaginatedFriendsCarouselEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagPaginatedFriendsCarouselEnabledForAll;
return function(v8) --[[ Line: 15 ]] --[[ Name: PaginatedCarouselImplementationWrapper ]]
    -- upvalues: v2 (copy), l_Analytics_0 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v9 = v2.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: l_Analytics_0 (ref), v8 (copy)
        return l_Analytics_0({
            infoForAllEvents = {
                uid = v8.localUserId
            }
        });
    end, {
        v8.localUserId
    });
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then
        local v15 = v4({
            userId = v8.localUserId, 
            fireAnalyticsEvent = v9 and v9.fireAnalyticsEvent, 
            friendsSortVariant = v8.friendsSortVariant
        });
        v11 = v15.onlineFriends;
        v12 = v15.offlineFriends;
        v13 = v15.fetchMoreFriends;
        v14 = v15.refetchCarouselData;
    else
        local v16, v17, v18 = v3({
            userId = v8.localUserId, 
            fireAnalyticsEvent = v9 and v9.fireAnalyticsEvent, 
            friendsSortVariant = v8.friendsSortVariant
        });
        v10 = v16;
        v13 = v17;
        v14 = v18;
    end;
    return v2.createElement(v5, {
        refreshSignal = v8.carouselProps.refreshSignal, 
        refetchData = v14, 
        renderChildComponent = function() --[[ Line: 52 ]] --[[ Name: renderChildComponent ]]
            -- upvalues: v8 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref)
            return v8.renderChildComponent({
                carouselList = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then nil else v10, 
                onlineFriends = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v11 else nil, 
                offlineFriends = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v12 else nil, 
                fetchMoreFriends = v13
            });
        end
    });
end;