local l_Parent_0 = script:FindFirstAncestor("SocialTestHelpers").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_llama_0 = v1.llama;
local l_Presence_0 = v1.RoduxPresence.config({}).Models.Presence;
local l_User_0 = v1.RoduxUsers.config({}).Models.User;
local l_RecommendationContextType_0 = require(l_Parent_0.FriendsRodux).config().Enums.RecommendationContextType;
local v6 = {};
for v7 = 1, 40 do
    local v8 = l_User_0.mock({
        id = tostring(v7), 
        displayName = "displayName" .. tostring(v7), 
        username = "username" .. tostring(v7), 
        hasVerifiedBadge = false
    });
    v6[v8.id] = v8;
end;
local v9 = l_llama_0.Dictionary.keys(v6);
v6["40"].displayName = "offlineFriend1";
v6["39"].displayName = "offlineFriend2";
v6["38"].displayName = "onlineFriend";
v6["37"].displayName = "inGameFriend";
v6["36"].displayName = "inStudioFriend";
local v10 = {
    v6["40"].id, 
    v6["39"].id, 
    v6["38"].id, 
    v6["37"].id, 
    v6["36"].id
};
local v13 = l_llama_0.List.reduce(v6, function(v11, v12) --[[ Line: 36 ]]
    -- upvalues: l_llama_0 (copy), l_Presence_0 (copy)
    return l_llama_0.Dictionary.join(v11, {
        [v12.id] = l_Presence_0.format(l_Presence_0.mock({
            userPresenceType = 0
        }))
    });
end);
local v14 = {
    recom1 = {
        id = "recom1", 
        mutualFriendsList = {}, 
        rank = 3, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom2 = {
        id = "recom2", 
        mutualFriendsList = {}, 
        rank = 1, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom3 = {
        id = "recom3", 
        mutualFriendsList = {}, 
        rank = 5, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom4 = {
        id = "recom4", 
        mutualFriendsList = {}, 
        rank = 4, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }
};
local v17 = l_llama_0.List.reduce(l_llama_0.Dictionary.keys(v14), function(v15, v16) --[[ Line: 69 ]]
    -- upvalues: v14 (copy)
    v15[v16] = {
        id = tostring(v16), 
        displayName = "displayName" .. tostring(v16), 
        username = "username" .. tostring(v16), 
        rank = v14[v16].rank, 
        contextType = v14[v16].contextType
    };
    return v15;
end, {});
v13 = {
    ["40"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 0
    })), 
    ["39"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 0
    })), 
    ["38"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 1
    })), 
    ["37"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 2
    })), 
    ["36"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 3
    }))
};
return function(v18) --[[ Line: 99 ]]
    -- upvalues: v10 (copy), v6 (copy), v13 (ref), v9 (copy), v14 (copy), l_llama_0 (copy), v17 (copy)
    local v19 = v18 and v18.roduxKey or "FriendsLanding";
    return {
        noFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}
                }, 
                Users = {}, 
                Presence = {}, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        smallNumbersOfFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {
                        test = v10
                    }, 
                    countsByUserId = {
                        test = #v10
                    }, 
                    friendsRankByUserId = {
                        test = {
                            ["36"] = 10, 
                            ["37"] = 1, 
                            ["38"] = 3, 
                            ["39"] = 2, 
                            ["40"] = 5
                        }
                    }, 
                    recommendations = {}
                }, 
                Users = {
                    byUserId = v6
                }, 
                Presence = {
                    byUserId = v13
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        manyFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {
                        test = v9
                    }, 
                    countsByUserId = {
                        test = #v9
                    }, 
                    requests = {
                        receivedCount = 12
                    }, 
                    recommendations = {}
                }, 
                Users = {
                    byUserId = v6
                }, 
                Presence = {
                    byUserId = v13
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done", 
                    ["https://friends.roblox.com/v1/users/test/friends/inactive"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        deletedFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}
                }, 
                DeletedUsers = {
                    byUserId = {}
                }, 
                Users = {}, 
                Presence = {}, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(600, 300)
        }, 
        friendsAndRecommendations = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {
                        test = v10
                    }, 
                    countsByUserId = {
                        test = #v10
                    }, 
                    recommendations = {
                        byUserId = {
                            test = v14
                        }, 
                        bySource = {}
                    }, 
                    requests = {
                        receivedCount = 28
                    }, 
                    friendshipStatus = {
                        recom1 = Enum.FriendStatus.NotFriend, 
                        recom2 = Enum.FriendStatus.NotFriend, 
                        recom3 = Enum.FriendStatus.Unknown, 
                        recom4 = Enum.FriendStatus.FriendRequestSent
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v6, v17)
                }, 
                Presence = {
                    byUserId = v13
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        recommendationsOnly = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}, 
                    recommendations = {
                        byUserId = {
                            test = v14
                        }, 
                        bySource = {
                            AddFriendsPage = {
                                recom1 = true, 
                                recom2 = true, 
                                recom3 = true, 
                                recom4 = true
                            }
                        }
                    }, 
                    requests = {
                        receivedCount = 28
                    }, 
                    friendshipStatus = {
                        recom1 = Enum.FriendStatus.NotFriend, 
                        recom2 = Enum.FriendStatus.NotFriend, 
                        recom3 = Enum.FriendStatus.Unknown, 
                        recom4 = Enum.FriendStatus.FriendRequestSent
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v6, v17)
                }, 
                Presence = {
                    byUserId = v13
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        manyFriendsAndRecommendations = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v19] = {
                Friends = {
                    byUserId = {
                        test = v9
                    }, 
                    countsByUserId = {
                        test = #v9
                    }, 
                    recommendations = {
                        byUserId = {
                            test = v14
                        }, 
                        bySource = {}
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v6, v17)
                }, 
                Presence = {
                    byUserId = v13
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }
    };
end;