local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialCountsItem);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
return function(v8) --[[ Line: 27 ]] --[[ Name: SocialCountsRow ]]
    -- upvalues: l_abbreviateCount_0 (copy), l_useLocalization_0 (copy), v6 (copy), v2 (copy), l_HorizontalPageMargin_0 (copy), v4 (copy)
    local v9 = l_abbreviateCount_0(v8.friendsCount);
    local v10 = l_abbreviateCount_0(v8.followersCount);
    local v11 = l_abbreviateCount_0(v8.followingsCount);
    local v12 = l_useLocalization_0({
        friends = v6.Friends, 
        followers = v6.Followers, 
        following = v6.Following
    });
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v8.size, 
        backgroundTransparency = 1, 
        layoutOrder = v8.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        FriendsRowItem = v2.createElement(v4, {
            text = v12.friends, 
            count = v9, 
            layoutOrder = 1, 
            onActivated = v8.onActivatedFriends
        }), 
        FollowersRowItem = v2.createElement(v4, {
            text = v12.followers, 
            count = v10, 
            layoutOrder = 2, 
            onActivated = v8.onActivatedFollowers
        }), 
        FollowingRowItem = v2.createElement(v4, {
            text = v12.following, 
            count = v11, 
            layoutOrder = 3, 
            onActivated = v8.onActivatedFollowings
        })
    });
end;