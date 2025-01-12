local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_AddFriends_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = v2.Rodux;
local l_llama_0 = v2.llama;
local l_FriendshipOriginSourceType_0 = require(l_Parent_0.FriendsNetworking).Enums.FriendshipOriginSourceType;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v8 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxFriends) else v2.RoduxFriends;
local v9 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxUsers) else v2.RoduxUsers;
local v10 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxPresence) else v2.RoduxPresence;
local l_RecommendationContextType_0 = v8.Enums.RecommendationContextType;
local l_User_0 = v9.Models.User;
local l_PresenceType_0 = v10.Enums.PresenceType;
local v14 = {
    ["36"] = Enum.FriendStatus.NotFriend, 
    ["39"] = Enum.FriendStatus.Friend, 
    ["37"] = Enum.FriendStatus.FriendRequestSent, 
    ["38"] = Enum.FriendStatus.FriendRequestReceived
};
local v15 = l_Rodux_0.Store.new(function() --[[ Line: 36 ]]
    -- upvalues: v14 (copy)
    return {
        LocalUserId = "0", 
        FriendStatuses = v14, 
        ScreenSize = Vector2.new(500, 500)
    };
end, {}, {
    l_Rodux_0.thunkMiddleware
});
local function v19(v16, v17) --[[ Line: 44 ]]
    -- upvalues: l_llama_0 (copy), v14 (copy), l_User_0 (copy)
    local v18 = l_llama_0.Dictionary.flip(v14)[v16];
    return l_llama_0.Dictionary.join(l_User_0.mock({
        id = v18
    }), v17);
end;
local v20 = {
    tileProps = {
        sentFromExperienceName = "TestSentFrom", 
        amIFollowingUser = true, 
        isUserFollowingMe = true
    }, 
    userProps = {
        mutualFriends = {
            {}, 
            {}, 
            {}
        }, 
        userPresenceType = l_PresenceType_0.InGame, 
        lastLocation = "TestLastLocation"
    }
};
return {
    localUserId = "0", 
    friendWithContextInfo = {
        FriendWithFullContextInfo = l_llama_0.Dictionary.joinDeep(v20, {
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFullContextInfo"
            }
        }), 
        FriendWithMutualFriends = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithMutualFriends", 
                mutualFriends = v20.userProps.mutualFriends
            }
        }, 
        Contact = {
            tileProps = {}, 
            userProps = {
                entityDisplayName = "entityDisplayName", 
                thumbnailEntities = {
                    avatarImageUrl = "avatarImageUrl"
                }, 
                contextType = l_RecommendationContextType_0.Contacts
            }
        }, 
        FriendWithSentFrom = {
            tileProps = {
                sentFromExperienceName = v20.tileProps.sentFromExperienceName
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithSentContext"
            }
        }, 
        FriendYouAreFollowing = {
            tileProps = {
                amIFollowingUser = v20.tileProps.amIFollowingUser
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithYourAllFollowing"
            }
        }, 
        FriendFollowingMe = {
            tileProps = {
                isUserFollowingMe = v20.tileProps.isUserFollowingMe
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFollowingMe", 
                followers = {}
            }
        }, 
        FriendViaQRCode = {
            tileProps = {
                originSourceType = l_FriendshipOriginSourceType_0.QrCode.rawValue()
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithQRCode"
            }
        }, 
        FriendNoFriend = {
            tileProps = {}, 
            userProps = {
                username = "NotFriend", 
                displayName = "Friend to add"
            }
        }, 
        FriendNoFriendWithNickname = {
            tileProps = {}, 
            userProps = {
                username = "NotFriend", 
                displayName = "Friend to add", 
                senderNickname = "SenderNickname"
            }
        }, 
        FriendPending = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestSent", 
                displayName = "Friend pending"
            }
        }
    }, 
    fullContextInfo = v20, 
    userForStatus = v19, 
    baseStore = v15
};