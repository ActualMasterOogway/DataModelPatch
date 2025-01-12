local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_PlayerContext_0 = v6.App.Indicator.PlayerContext;
local v9 = require(l_Parent_0.UserProfiles);
return function(v10) --[[ Line: 21 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v3 (copy), v9 (copy), v2 (copy), l_PlayerContext_0 (copy), l_Images_0 (copy)
    local v11 = l_useLocalization_0({
        oneMutualFriendText = v5.OneMutualFriend, 
        pluralMutualFriendsText = v5.PluralMutualFriends, 
        oneOtherMutualFriendText = v5.OneOtherMutualFriend, 
        pluralOtherMutualFriendsText = v5.PluralOtherMutualFriends
    });
    local l_mutualFriendsCount_0 = v10.mutualFriendsCount;
    local v13 = #v10.mutualFriends;
    local v15 = v3.List.map(v10.mutualFriends, function(v14) --[[ Line: 32 ]]
        return (tostring(v14));
    end);
    local v16 = v9.Hooks.useUserProfilesFetch({
        userIds = v15, 
        query = v9.Queries.userProfilesCombinedNameByUserIds
    });
    local v17 = "";
    local v18 = {};
    if v16.data then
        for v19, v20 in v15 do
            local v21 = v9.Selectors.getCombinedNameFromId(v16.data, v20);
            v17 = v17 .. v21;
            if v19 ~= v13 then
                v17 = v17 .. ", ";
            end;
            v18[v19] = v21;
        end;
    end;
    local v22 = math.max(0, l_mutualFriendsCount_0 - v13);
    local v23 = "";
    if v22 == 0 then
        v23 = if v13 == 1 then v11.oneMutualFriendText else v11.pluralMutualFriendsText;
    else
        v23 = if v22 == 1 then v11.oneOtherMutualFriendText else v11.pluralOtherMutualFriendsText;
        v23 = ("+ %* %*"):format(tostring(v22), v23);
    end;
    return v2.createElement(l_PlayerContext_0, {
        icon = l_Images_0["icons/status/player/friend"], 
        text = ("%* %*"):format(v17, v23)
    });
end;