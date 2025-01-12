local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v3 = require(script.Parent.EventNames);
local l_FFlagProfilePlatformFixTelemetryEvents_0 = v1.FFlagProfilePlatformFixTelemetryEvents;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ProfilePlatformAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v3.ProfileLoadingStage] = {
        description = "Stage of loading profile", 
        lastUpdated = {
            24, 
            6, 
            6
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v5) --[[ Line: 25 ]] --[[ Name: status ]]
                        return v5;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                overrideName = function(v6) --[[ Line: 32 ]] --[[ Name: overrideName ]]
                    -- upvalues: v3 (copy)
                    return v3.ProfileLoadingStage .. "Time" .. v6.status;
                end, 
                dynamicCustomFields = {
                    status = function(v7) --[[ Line: 36 ]] --[[ Name: status ]]
                        return v7;
                    end, 
                    isProfilePlatform = l_FFlagProfilePlatformFixTelemetryEvents_0 and function(v8) --[[ Line: 40 ]]
                        return v8 or false;
                    end or nil
                }
            }
        }
    }, 
    [v3.ProfileInExperienceUserLoadingStage] = {
        description = "User in experience opened", 
        lastUpdated = {
            24, 
            6, 
            10
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v9) --[[ Line: 55 ]] --[[ Name: status ]]
                        return v9;
                    end, 
                    isInExperience = function(v10) --[[ Line: 58 ]] --[[ Name: isInExperience ]]
                        return v10;
                    end
                }
            }
        }
    }, 
    [v3.ProfilePageLoadedWithData] = {
        description = "Profile page loaded with data", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = if l_FFlagProfilePlatformFixTelemetryEvents_0 then l_SupportedTelemetryBackends_0.RobloxTelemetryCounter else l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    friendStatus = function(v11) --[[ Line: 74 ]] --[[ Name: friendStatus ]]
                        return v11;
                    end
                }
            }
        }
    }, 
    [v3.ContextualMenuButtonChat] = {
        description = "Chat button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonIgnoreFriendRequest] = {
        description = "Ignore friend request button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonReport] = {
        description = "Report button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonUnfriend] = {
        description = "Unfriend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonBlock] = {
        description = "Block button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonSetAlias] = {
        description = "Set alias button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonOpenEditProfilePage] = {
        description = "Open edit profile page button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonChat] = {
        description = "Chat button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonUnfriend] = {
        description = "Unfriend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonUnblock] = {
        description = "Unblock button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAddFriend] = {
        description = "Add friend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAddFriendFromContacts] = {
        description = "Add friend from contacts clicked", 
        lastUpdated = {
            24, 
            9, 
            12
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAcceptFriendRequest] = {
        description = "Accept friend request button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonShareProfileQRCode] = {
        description = "Share profile QR code button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FriendsButton] = {
        description = "Friends button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FollowersButton] = {
        description = "Followers button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FollowingsButton] = {
        description = "Following button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ViewPlayerProfileButton] = {
        description = "View player profile button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButton] = {
        description = "Contextual menu button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }, 
            if l_FFlagProfilePlatformFixTelemetryEvents_0 then nil else {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.GameDetailsButton] = {
        description = "Game details button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }, 
            if l_FFlagProfilePlatformFixTelemetryEvents_0 then nil else {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.EditDisplayNameButton] = {
        description = "Edit display name button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }, 
            if l_FFlagProfilePlatformFixTelemetryEvents_0 then nil else {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.SetAliasButton] = {
        description = "Set alias button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }, 
            if l_FFlagProfilePlatformFixTelemetryEvents_0 then nil else {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.ProfileClosed] = {
        description = "Profile closed", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.CatalogItemOpened] = {
        description = "Catalog item opened", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.ProfileContentPostOpened] = {
        description = "Content post opened", 
        lastUpdated = {
            24, 
            9, 
            18
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FavoritesQuickLinkClicked] = {
        description = "Favorites quick link clicked", 
        lastUpdated = {
            24, 
            9, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.InventoryQuickLinkClicked] = {
        description = "Inventory quick link clicked", 
        lastUpdated = {
            24, 
            9, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.GroupsQuickLinkClicked] = {
        description = "Groups quick link clicked", 
        lastUpdated = {
            24, 
            9, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.BadgesQuickLinkClicked] = {
        description = "Badges quick link clicked", 
        lastUpdated = {
            24, 
            9, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};