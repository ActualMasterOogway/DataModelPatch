local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(script.Parent.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local l_FFlagAddFriendsTelemetryEvents_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsTelemetryEvents;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("AddFriendsPageAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v1.AddFriendsPageLoadingTime] = {
        description = "Add friends page requests and recommendation promise loading time", 
        lastUpdated = {
            24, 
            6, 
            7
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v5) --[[ Line: 22 ]] --[[ Name: status ]]
                        return v5;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v6) --[[ Line: 30 ]] --[[ Name: status ]]
                        return v6;
                    end
                }
            }
        }
    }, 
    [v1.PlayerTileClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on user tiles", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v7) --[[ Line: 45 ]] --[[ Name: namespace ]]
                        return v7;
                    end, 
                    entityType = function(v8) --[[ Line: 48 ]] --[[ Name: entityType ]]
                        return v8;
                    end
                }
            }
        }
    } else nil, 
    [v1.RequestFriendshipBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on Request Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v9) --[[ Line: 64 ]] --[[ Name: namespace ]]
                        return v9;
                    end, 
                    entityType = function(v10) --[[ Line: 67 ]] --[[ Name: entityType ]]
                        return v10;
                    end
                }
            }
        }
    } else nil, 
    [v1.AcceptFriendshipBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on Accept Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v11) --[[ Line: 83 ]] --[[ Name: namespace ]]
                        return v11;
                    end, 
                    entityType = function(v12) --[[ Line: 86 ]] --[[ Name: entityType ]]
                        return v12;
                    end
                }
            }
        }
    } else nil, 
    [v1.DeclineFriendshipBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on Decline Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v13) --[[ Line: 102 ]] --[[ Name: namespace ]]
                        return v13;
                    end, 
                    entityType = function(v14) --[[ Line: 105 ]] --[[ Name: entityType ]]
                        return v14;
                    end
                }
            }
        }
    } else nil, 
    [v1.UserSearchClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on user search input", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.CIBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on contact importer banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.QRCodeBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on QRcode banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.CIBtnImpression] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page impressions for contact importer banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.QRCodeBtnImpression] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page impressions for QRcode banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.ShowMoreBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on Show More button", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v1.IgnoreAllBtnClick] = if l_FFlagAddFriendsTelemetryEvents_0 then {
        description = "Add friends page clicks on Ignore All button", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil
};