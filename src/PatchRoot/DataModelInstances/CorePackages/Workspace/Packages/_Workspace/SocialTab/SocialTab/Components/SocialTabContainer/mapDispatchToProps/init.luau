local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v2.Promise;
local v4 = require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount);
local l_GetPresencesFromUserIds_0 = v2.NetworkingPresence.GetPresencesFromUserIds;
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkingUsers_0 = v2.NetworkingUsers;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_EnteredChatFromEntryPoint_0 = v2.AppChat.Actions.EnteredChatFromEntryPoint;
return function(v10) --[[ Line: 14 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_Promise_0 (copy), v4 (copy), l_SocialLibraries_0 (copy), l_GetPresencesFromUserIds_0 (copy), l_NetworkingUsers_0 (copy), v1 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        refreshPageData = function() --[[ Line: 16 ]] --[[ Name: refreshPageData ]]
            -- upvalues: l_NetworkingFriends_0 (ref), l_Promise_0 (ref), v10 (copy), v4 (ref), l_SocialLibraries_0 (ref), l_GetPresencesFromUserIds_0 (ref), l_NetworkingUsers_0 (ref), v1 (ref)
            local l_GetFriendRequestsCount_0 = l_NetworkingFriends_0.GetFriendRequestsCount;
            return l_Promise_0.all({
                v10(v4.API()), 
                v10(function(v12) --[[ Line: 21 ]]
                    -- upvalues: l_SocialLibraries_0 (ref), v10 (ref), l_GetPresencesFromUserIds_0 (ref), l_Promise_0 (ref)
                    local v13 = l_SocialLibraries_0.Dictionary.getDeepValue(v12:getState(), "SocialTab.Friends.byUserId.localUserId");
                    if v13 then
                        return v10(l_GetPresencesFromUserIds_0.API(v13));
                    else
                        return l_Promise_0.resolve();
                    end;
                end), 
                v10(l_GetFriendRequestsCount_0.API()), 
                v10(function(v14) --[[ Line: 34 ]]
                    -- upvalues: v10 (ref), l_NetworkingUsers_0 (ref)
                    return v10(l_NetworkingUsers_0.GetUserV2FromUserId.API(v14:getState().LocalUserId));
                end)
            }):catch(function() --[[ Line: 37 ]]
                -- upvalues: v1 (ref)
                v1:info("Failed to refresh SocialTab data");
            end);
        end, 
        fetchFriendsRequestsCount = function() --[[ Line: 41 ]] --[[ Name: fetchFriendsRequestsCount ]]
            -- upvalues: v10 (copy), l_NetworkingFriends_0 (ref)
            return v10(l_NetworkingFriends_0.GetFriendRequestsCount.API());
        end, 
        enteredChatFromEntryPoint = function(v15) --[[ Line: 44 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v10 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v10(l_EnteredChatFromEntryPoint_0(v15));
        end
    };
end;