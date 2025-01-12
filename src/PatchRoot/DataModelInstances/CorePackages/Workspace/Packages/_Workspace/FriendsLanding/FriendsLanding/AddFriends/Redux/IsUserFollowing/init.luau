local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_llama_0 = v1.llama;
local l_Rodux_0 = v1.Rodux;
local v6 = if require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers then require(l_AddFriends_0.Networking.FriendsNetworking) else v1.FriendsNetworking;
return l_Rodux_0.createReducer({}, {
    [v6.GetFollowingExists.Succeeded.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: l_llama_0 (copy)
        local v9 = {};
        l_llama_0.List.every(v8.responseBody.followings, function(v10) --[[ Line: 20 ]]
            -- upvalues: v9 (copy)
            v9[tostring(v10.userId)] = {
                isFollowing = v10.isFollowing, 
                isFollowed = v10.isFollowed
            };
            return true;
        end);
        return l_llama_0.Dictionary.join(v7, v9);
    end
});