local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ApolloFriends);
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local l_userIdExists_0 = require(l_Parent_0.SocialCommon).Utils.userIdExists;
local v6 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v6.useQuery;
local l_useApolloClient_0 = v6.useApolloClient;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v10 = require(l_script_FirstAncestor_0.EventHandlers.handleFriendshipEvent);
local l_FFlagDontCallGetAllOnlineFriendsOnInvalidUserId_0 = require(l_Parent_0.SharedFlags).FFlagDontCallGetAllOnlineFriendsOnInvalidUserId;
return function() --[[ Line: 25 ]] --[[ Name: useHandleFriendshipEvent ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useApolloClient_0 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_FFlagDontCallGetAllOnlineFriendsOnInvalidUserId_0 (copy), l_userIdExists_0 (copy), v3 (copy), v2 (copy), v10 (copy)
    local v12 = l_useLocalUserId_0();
    local v13 = l_useApolloClient_0();
    local v14 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = l_FFlagDontCallGetAllOnlineFriendsOnInvalidUserId_0 and not l_userIdExists_0(v12), 
        notifyOnNetworkStatusChange = true, 
        variables = {
            userId = v12, 
            sort = v3.Enums.Sort.FriendshipScore
        }
    });
    return (v2.useCallback(function(v15) --[[ Line: 39 ]]
        -- upvalues: v10 (ref), v12 (copy), v14 (copy), v13 (copy)
        v10({
            localUserId = v12, 
            onlineFriendsRef = v14, 
            apolloClient = v13, 
            friendshipUpdate = v15
        });
    end, {
        v14
    }));
end;