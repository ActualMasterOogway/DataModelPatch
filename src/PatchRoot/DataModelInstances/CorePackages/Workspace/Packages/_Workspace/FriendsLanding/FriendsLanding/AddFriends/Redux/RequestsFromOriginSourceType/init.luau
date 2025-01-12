local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v7 = if require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers then require(l_AddFriends_0.Networking.FriendsNetworking) else v1.FriendsNetworking;
return l_Rodux_0.createReducer({}, {
    [v7.GetFriendRequests.Succeeded.name] = function(_, v9) --[[ Line: 20 ]]
        -- upvalues: l_llama_0 (copy), l_getDeepValue_0 (copy)
        local l_data_0 = v9.responseBody.data;
        return (l_llama_0.Dictionary.map(l_data_0, function(v11) --[[ Line: 22 ]]
            -- upvalues: l_getDeepValue_0 (ref)
            return l_getDeepValue_0(v11, "friendRequest.originSourceType") or "", (tostring(v11.id));
        end));
    end
});