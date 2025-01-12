local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.InputHandlers);
local v4 = require(l_Parent_0.React);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: useAddFriendsTileFocusNavigationBindings ]]
    -- upvalues: l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v3 (copy), v2 (copy)
    local v7 = {
        [Enum.KeyCode.ButtonX] = if not v6 then l_FocusNavigationEventNameEnum_0.AddFriend else l_FocusNavigationEventNameEnum_0.AcceptFriendRequest, 
        [Enum.KeyCode.ButtonR3] = l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest
    };
    local v8 = v4.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), l_FocusNavigationEventNameEnum_0 (ref), v3 (ref), v5 (copy)
        if not v6 then
            return {
                [l_FocusNavigationEventNameEnum_0.AddFriend] = {
                    handler = v3.onRelease(v5.requestFriendship)
                }
            };
        else
            return {
                [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = {
                    handler = v3.onRelease(v5.acceptFriendRequest)
                }, 
                [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = {
                    handler = v3.onRelease(v5.declineFriendRequest)
                }
            };
        end;
    end, {
        v5.acceptFriendRequest, 
        v5.declineFriendRequest, 
        v5.requestFriendship
    });
    local v9 = v2.useEventMap(v7);
    return v2.useEventHandlerMap(v8, v9);
end;