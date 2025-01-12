local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_Promise_0 = v1.Promise;
local l_t_0 = v1.t;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
local v7 = l_t_0.strictInterface({
    localUserId = l_t_0.string, 
    inactiveFriendsNetworkRequestStatus = l_t_0.string, 
    onResolve = l_t_0.union(l_t_0.callback, l_t_0.table), 
    onError = l_t_0.union(l_t_0.callback, l_t_0.table)
});
return function(v8) --[[ Line: 18 ]]
    -- upvalues: v7 (copy), l_Promise_0 (copy), l_FriendsNetworking_0 (copy), l_NetworkStatus_0 (copy)
    return {
        refreshPageData = function(v9) --[[ Line: 20 ]] --[[ Name: refreshPageData ]]
            -- upvalues: v7 (ref), l_Promise_0 (ref), v8 (copy), l_FriendsNetworking_0 (ref), l_NetworkStatus_0 (ref)
            assert(v7(v9));
            return l_Promise_0.all({
                v8(l_FriendsNetworking_0.GetFriendsFromUserId.API(v9.localUserId)), 
                v8(l_FriendsNetworking_0.GetFriendRequestsCount.API()), 
                v8(function(_) --[[ Line: 26 ]]
                    -- upvalues: v9 (copy), l_NetworkStatus_0 (ref), v8 (ref), l_FriendsNetworking_0 (ref), l_Promise_0 (ref)
                    if v9.inactiveFriendsNetworkRequestStatus == l_NetworkStatus_0.NotStarted or v9.inactiveFriendsNetworkRequestStatus == l_NetworkStatus_0.Failed then
                        return v8(l_FriendsNetworking_0.GetInactiveFriends.API(v9.localUserId));
                    else
                        return l_Promise_0.resolve();
                    end;
                end)
            }):andThen(v9.onResolve):catch(v9.onError);
        end, 
        getFriendRequestsCount = function() --[[ Line: 41 ]] --[[ Name: getFriendRequestsCount ]]
            -- upvalues: v8 (copy), l_FriendsNetworking_0 (ref)
            return v8(l_FriendsNetworking_0.GetFriendRequestsCount.API());
        end
    };
end;