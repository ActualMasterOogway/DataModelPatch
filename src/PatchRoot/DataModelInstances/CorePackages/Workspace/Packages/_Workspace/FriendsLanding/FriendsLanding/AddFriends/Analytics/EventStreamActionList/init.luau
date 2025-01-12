local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_Sources_0 = l_Enums_0.Sources;
local v7 = require(script.Parent.EventNames);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
return {
    [v7.OpenUserSearch] = {
        context = l_Contexts_0.Players, 
        eventType = l_EventTypes_0.Search, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            act = "open", 
            source = l_Sources_0.AddFriendsPage
        }
    }, 
    [v7.PageLoad] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            page = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            requestingUserId = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            gamesContext = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            absPosition = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            mutualFriendsContext = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            recommendationSessionId = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            recommendationCount = v2.identity, 
            status = if l_FFlagAddFriendsMigrateAnalytics_0 then v2.identity else nil
        }
    }, 
    [v7.AddFriendsPageLoadingTime] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            recommendationSessionId = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v2.identity, 
            loadingTime = v2.identity, 
            status = v2.identity
        }
    }, 
    [v7.UserSearchClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "peopleSearchBar"
        }
    } else nil, 
    [v7.CIBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "connectWithFriends"
        }
    } else nil, 
    [v7.QRCodeBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "shareProfileQRCode"
        }
    } else nil, 
    [v7.CIBtnImpression] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "connectWithFriends"
        }
    } else nil, 
    [v7.QRCodeBtnImpression] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "shareProfileQRCode"
        }
    } else nil, 
    [v7.RequestFriendshipBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "requestFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v2.identity, 
            targetUserId = v2.identity, 
            absolutePosition = v2.identity, 
            rank = v2.identity, 
            contextType = v2.identity, 
            entityType = v2.identity
        }
    } else nil, 
    [v7.AcceptFriendshipBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "acceptFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v2.identity, 
            targetUserId = v2.identity, 
            absolutePosition = v2.identity, 
            rank = v2.identity, 
            contextType = v2.identity, 
            entityType = v2.identity
        }
    } else nil, 
    [v7.DeclineFriendshipBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "declineFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v2.identity, 
            targetUserId = v2.identity, 
            absolutePosition = v2.identity, 
            rank = v2.identity, 
            contextType = v2.identity, 
            entityType = v2.identity
        }
    } else nil, 
    [v7.PlayerTileClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "userTileClick"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v2.identity, 
            targetUserId = v2.identity, 
            absolutePosition = v2.identity, 
            rank = v2.identity, 
            contextType = v2.identity, 
            entityType = v2.identity, 
            friendStatus = v2.identity
        }
    } else nil, 
    [v7.IgnoreAllBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "ignoreAll"
        }
    } else nil, 
    [v7.ShowMoreBtnClick] = if l_FFlagAddFriendsMigrateAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "loadMoreUsers"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v2.identity
        }
    } else nil
};