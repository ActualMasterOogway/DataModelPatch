local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UserProfiles);
local v3 = require(l_Parent_0.ApolloClient);
local l_ApolloClientTestUtils_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local l_mockApolloClient_0 = l_ApolloClientTestUtils_0.mockApolloClient;
return function(v7) --[[ Line: 14 ]]
    -- upvalues: l_mockApolloClient_0 (copy), v2 (copy), l_queries_0 (copy), v1 (copy), v3 (copy)
    local v8 = l_mockApolloClient_0({});
    v2.TestUtils.writeProfileDataToCache(v8, {
        ["1989"] = {
            combinedName = "Test Primary Name", 
            alias = "Test Primary Name", 
            contactName = "Test Contact Name", 
            displayName = "Test Display Name", 
            username = "username"
        }, 
        ["1969"] = {
            combinedName = "OrangeClement", 
            alias = "OrangeClement", 
            contactName = "Test Contact Name", 
            displayName = "ClementOrange", 
            username = "username"
        }, 
        ["1949"] = {
            combinedName = "AzurePine", 
            alias = "AzurePine", 
            contactName = "Test Contact Name", 
            displayName = "PineAzure", 
            username = "username"
        }, 
        ["2"] = {
            combinedName = "combinedName2", 
            alias = "alias2", 
            contactName = "contactName2", 
            displayName = "displayName2", 
            username = "username2"
        }, 
        ["3"] = {
            combinedName = "combinedName3", 
            alias = "alias3", 
            contactName = "contactName3", 
            displayName = "displayName3", 
            username = "username3"
        }, 
        ["4"] = {
            combinedName = "combinedName4", 
            alias = "alias4", 
            contactName = "contactName4", 
            displayName = "displayName4", 
            username = "username4"
        }, 
        ["422502"] = {
            combinedName = "TestUserB", 
            alias = "(alias)", 
            contactName = "Test Contact Name", 
            displayName = "TestUserB", 
            username = "username"
        }
    });
    local v9 = {
        __typename = "Friend", 
        id = "2", 
        hasVerifiedBadge = false, 
        targetUserId = "1"
    };
    local v10 = {
        __typename = "Friend", 
        id = "3", 
        targetUserId = "1", 
        presence = {
            __typename = "UserPresence", 
            id = "3", 
            userPresenceType = "InGame", 
            lastLocation = "location", 
            lastOnline = "time", 
            gameId = "game-id", 
            placeId = "123", 
            rootPlaceId = "456", 
            universeId = "789"
        }
    };
    local v11 = {
        __typename = "Friend", 
        id = "422502", 
        targetUserId = "1", 
        presence = {
            __typename = "UserPresence", 
            id = "422502", 
            userPresenceType = "InGame", 
            lastLocation = "location", 
            lastOnline = "time", 
            gameId = "game-id", 
            placeId = "123", 
            rootPlaceId = "456", 
            universeId = "789"
        }
    };
    v8:writeQuery({
        variables = {
            userId = "1", 
            sort = 1, 
            nextCursor = ""
        }, 
        query = l_queries_0.allFriendsByUserId, 
        data = {
            allFriendsByUserId = {
                __typename = "FriendsListPage", 
                prevCursor = "", 
                curCursor = "", 
                nextCursor = "", 
                targetUserId = "1", 
                friends = {
                    v9
                }
            }
        }, 
        loading = false
    });
    v8:writeQuery({
        variables = {
            userId = "1", 
            sort = 1
        }, 
        query = l_queries_0.onlineFriendsByUserId, 
        data = {
            onlineFriendsByUserId = {
                v10, 
                v11
            }
        }, 
        loading = false
    });
    return v1.createElement(v3.ApolloProvider, {
        client = v8
    }, {
        AnalyticsElement = v7
    });
end;