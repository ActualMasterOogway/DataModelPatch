local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingIsVerifiedFromUserProfile);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserProfiles);
local v5 = require(l_Parent_0.Dash);
local v6 = require(script.Parent.FriendTile);
return function(v7) --[[ Line: 13 ]] --[[ Name: FriendTileContainer ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v8 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v7.user.id
        }, 
        query = if v1 then v4.Queries.userProfilesFriendsLandingQueryByUserIds else v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    return v3.createElement(v6, v5.join(v7, {
        userProfile = if v8.data then v8.data.userProfiles[1] else nil
    }));
end;