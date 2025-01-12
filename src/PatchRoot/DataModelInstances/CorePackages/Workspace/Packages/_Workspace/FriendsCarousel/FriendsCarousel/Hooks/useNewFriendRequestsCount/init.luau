local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local v4 = require(l_Parent_0.RoactAppExperiment);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_FStringNewFriendRequestsBadgeLayer_0 = require(l_Parent_0.SharedFlags).FStringNewFriendRequestsBadgeLayer;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselFriendRequestCountEnabledForAll);
local v11 = require(l_script_FirstAncestor_0.Flags.FIntFriendsCarouselMaxNewRequestsCount);
return function() --[[ Line: 17 ]]
    -- upvalues: v10 (copy), v4 (copy), l_FStringNewFriendRequestsBadgeLayer_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useLocalization_0 (copy), v7 (copy), v11 (copy)
    local v12 = nil;
    v12 = v10 and true or v4.useUserExperiment({
        l_FStringNewFriendRequestsBadgeLayer_0
    }, function(v13) --[[ Line: 25 ]]
        -- upvalues: l_FStringNewFriendRequestsBadgeLayer_0 (ref)
        return (v13[l_FStringNewFriendRequestsBadgeLayer_0] or {}).showNewFriendRequestsBadge;
    end);
    local v15 = l_useSelector_0(function(v14) --[[ Line: 31 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v14, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0;
    end);
    local v16 = v15 > 0;
    local v17 = l_useLocalization_0({
        text = {
            v7.MaxFriendRequestsText; 
            maxRequestsCount = v11
        }
    });
    local v18 = if v11 < v15 then v17.text else tostring(v15);
    if v12 and v16 then
        return v18;
    else
        return nil;
    end;
end;