local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.AnalyticsConstants);
local l_Enums_0 = v1.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v6 = require(script.Parent.EventNames);
local function v8(v7) --[[ Line: 12 ]]
    return v7;
end;
return {
    [v6.ProfilePageLoadedWithData] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            friendStatus = v8, 
            playerPresence = v8, 
            absolutePosition = v8, 
            isHomePageCarousel = v8, 
            isRecommendation = v8, 
            recommendationContextType = v8, 
            recommendationRank = v8, 
            recommendationSessionId = v8, 
            source = v8, 
            profileType = v8, 
            shareLinkId = v8
        }
    }, 
    [v6.ContextualMenuButtonChat] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.Chat, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButtonIgnoreFriendRequest] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.IgnoreFriendRequest, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButtonReport] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.Report, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButtonUnfriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.Unfriend, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButtonBlock] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.Block, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButtonSetAlias] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.ContextualMenuButtons.SetAlias, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.CTAButtonOpenEditProfilePage] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.OpenEditProfilePage
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.CTAButtonChat] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.Chat
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.CTAButtonUnfriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.Unfriend
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.CTAButtonUnblock] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.Unblock
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.CTAButtonAddFriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.AddFriend
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v8, 
            isHomePageCarousel = v8, 
            isRecommendation = v8, 
            recommendationContextType = v8, 
            recommendationRank = v8, 
            recommendationSessionId = v8, 
            source = v8, 
            contextualInfoType = v8, 
            shareLinkId = v8, 
            profileType = v8
        }
    }, 
    [v6.CTAButtonAddFriendFromContacts] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.AddFriendFromContacts
        }, 
        formatRulesForAdditionalInfo = {
            shareLinkId = v8
        }
    }, 
    [v6.CTAButtonAcceptFriendRequest] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.AcceptFriendRequest
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v8, 
            contextualInfoType = v8, 
            isHomePageCarousel = v8, 
            isRecommendation = v8, 
            recommendationContextType = v8, 
            recommendationRank = v8, 
            recommendationSessionId = v8, 
            source = v8, 
            buttonSurface = v8, 
            shareLinkId = v8, 
            profileType = v8
        }
    }, 
    [v6.CTAButtonShareProfileQRCode] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.CTAButtons.ShareProfileQRCode
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v8
        }
    }, 
    [v6.FriendsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.Friends
        }
    }, 
    [v6.FollowersButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.Followers
        }
    }, 
    [v6.FollowingsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.Following
        }
    }, 
    [v6.ViewPlayerProfileButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.ViewPlayerProfile
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v8, 
            friendStatus = v8, 
            isHomePageCarousel = v8, 
            isRecommendation = v8, 
            recommendationContextType = v8, 
            recommendationRank = v8, 
            recommendationSessionId = v8, 
            source = v8, 
            buttonSurface = v8
        }
    }, 
    [v6.ContextualMenuButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.ContextualMenu
        }
    }, 
    [v6.GameDetailsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.GameDetails
        }
    }, 
    [v6.EditDisplayNameButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.EditDisplayName
        }, 
        formatRulesForAdditionalInfo = {
            canSetDisplayName = v8
        }
    }, 
    [v6.SetAliasButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.SetAlias
        }
    }, 
    [v6.ProfileClosed] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.Dismissed
    }, 
    [v6.ProfileContentPostOpened] = {
        context = l_Contexts_0.SocialContentEntrypoints, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = v2.ContentPostActions.PostSelected, 
            namespace = v2.LuaProfileCarousel
        }, 
        formatRulesForAdditionalInfo = {
            creatorUserId = v8, 
            postId = v8, 
            postPosition = v8
        }
    }, 
    [v6.FavoritesQuickLinkClicked] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.FavoritesQuickLink
        }, 
        formatRulesForAdditionalInfo = {
            friendStatus = v8
        }
    }, 
    [v6.InventoryQuickLinkClicked] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.InventoryQuickLink
        }, 
        formatRulesForAdditionalInfo = {
            friendStatus = v8
        }
    }, 
    [v6.GroupsQuickLinkClicked] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.GroupsQuickLink
        }, 
        formatRulesForAdditionalInfo = {
            friendStatus = v8
        }
    }, 
    [v6.BadgesQuickLinkClicked] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.Btns.BadgesQuickLink
        }, 
        formatRulesForAdditionalInfo = {
            friendStatus = v8
        }
    }
};