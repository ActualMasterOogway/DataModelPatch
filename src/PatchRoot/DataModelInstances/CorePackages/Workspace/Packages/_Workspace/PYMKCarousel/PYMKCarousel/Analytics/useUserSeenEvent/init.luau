local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Common.Constants);
local v2 = require(l_Parent_0.dependencies);
local l_llama_0 = v2.llama;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v7 = require(script.Parent.EventNames);
local v8 = require(script.Parent.getFriendStatus);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local l_getFFlagPYMKAddFriendsEntry_0 = v2.getFFlagPYMKAddFriendsEntry;
return function(v11) --[[ Line: 13 ]]
    -- upvalues: l_React_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v1 (copy), l_getFFlagPYMKAddFriendsEntry_0 (copy), v7 (copy), l_RecommendationContextType_0 (copy), v8 (copy), l_llama_0 (copy)
    local v12 = l_React_0.useRef({});
    local v14 = l_useSelector_0(function(v13) --[[ Line: 15 ]]
        -- upvalues: l_getDeepValue_0 (ref), v1 (ref)
        return l_getDeepValue_0(v13, string.format("%s.Friends.friendshipStatus", v1.RODUX_KEY)) or {};
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 18 ]]
        -- upvalues: l_getDeepValue_0 (ref), v1 (ref)
        return l_getDeepValue_0(v15, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", v1.RODUX_KEY));
    end) or {};
    return l_React_0.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v12 (copy), l_getFFlagPYMKAddFriendsEntry_0 (ref), v11 (copy), v7 (ref), l_RecommendationContextType_0 (ref), v8 (ref), v14 (copy), v16 (copy), l_llama_0 (ref)
        return {
            {
                viewabilityConfig = {
                    itemVisiblePercentThreshold = 50, 
                    waitForInteraction = false
                }, 
                onViewableItemsChanged = function(v17) --[[ Line: 32 ]] --[[ Name: onViewableItemsChanged ]]
                    -- upvalues: v12 (ref), l_getFFlagPYMKAddFriendsEntry_0 (ref), v11 (ref), v7 (ref), l_RecommendationContextType_0 (ref), v8 (ref), v14 (ref), v16 (ref), l_llama_0 (ref)
                    for _, v19 in pairs(v17.changed) do
                        local l_item_0 = v19.item;
                        local v21 = v12.current or {};
                        local v22 = not v21[l_item_0.id];
                        if l_getFFlagPYMKAddFriendsEntry_0() then
                            v22 = not v21[l_item_0.id] and not l_item_0.isTooltip and not l_item_0.isButtonTile;
                        end;
                        if v22 then
                            v11(v7.UserSeen, {
                                userId = l_item_0.id, 
                                contactId = if l_item_0.recommendationContextType == l_RecommendationContextType_0.Contacts then l_item_0.id else nil, 
                                friendStatus = v8(v14[l_item_0.id], v16[l_item_0.id]), 
                                recommendationContextType = l_item_0.recommendationContextType, 
                                recommendationRank = l_item_0.recommendationRank, 
                                absolutePosition = l_item_0.absolutePosition
                            });
                            v12.current = l_llama_0.Dictionary.join(v12.current, {
                                [l_item_0.id] = true
                            });
                        end;
                    end;
                end
            }
        };
    end, {});
end;