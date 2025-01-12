local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
return (require(l_Parent_0.React).createContext({
    closeSquadPrompt = function() --[[ Line: 32 ]] --[[ Name: closeSquadPrompt ]]

    end, 
    createFriendConversation = function(_, _) --[[ Line: 33 ]] --[[ Name: createFriendConversation ]]

    end, 
    disableSquadTopBanner = function(_, _) --[[ Line: 34 ]] --[[ Name: disableSquadTopBanner ]]

    end, 
    fetchParentChannelDetails = function(_, _) --[[ Line: 35 ]] --[[ Name: fetchParentChannelDetails ]]
        return nil;
    end, 
    fireSquadAnalytics = function(v9, v10) --[[ Line: 38 ]] --[[ Name: fireSquadAnalytics ]]
        return v9, v10;
    end, 
    inviteToParentChannel = function(_, _, _) --[[ Line: 41 ]] --[[ Name: inviteToParentChannel ]]
        return nil;
    end, 
    navigateIntoSquadLobby = function(_, _) --[[ Line: 44 ]] --[[ Name: navigateIntoSquadLobby ]]

    end, 
    removeUserFromParentChannel = function(_, _, _) --[[ Line: 45 ]] --[[ Name: removeUserFromParentChannel ]]
        return nil;
    end, 
    setSquadPrompt = function(_, _) --[[ Line: 48 ]] --[[ Name: setSquadPrompt ]]

    end, 
    updateSquadViewFlags = function(_, _) --[[ Line: 49 ]] --[[ Name: updateSquadViewFlags ]]

    end, 
    useGetConversationFromId = function(_) --[[ Line: 50 ]] --[[ Name: useGetConversationFromId ]]
        return nil;
    end, 
    useParentChannelHasGroupUp = function(_) --[[ Line: 53 ]] --[[ Name: useParentChannelHasGroupUp ]]
        return false;
    end, 
    useParentChannelHasSquadAccess = function(_) --[[ Line: 56 ]] --[[ Name: useParentChannelHasSquadAccess ]]
        return false;
    end, 
    useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 59 ]] --[[ Name: useParentChannelIsPartyVoiceEligible ]]
        return nil;
    end, 
    useParentChannelTitleSelector = function(_) --[[ Line: 62 ]] --[[ Name: useParentChannelTitleSelector ]]
        return "";
    end, 
    useSquadRootView = function() --[[ Line: 65 ]] --[[ Name: useSquadRootView ]]
        -- upvalues: v2 (copy)
        return v2.None;
    end, 
    useSquadTopBannerDisabled = function() --[[ Line: 68 ]] --[[ Name: useSquadTopBannerDisabled ]]
        return false;
    end, 
    useSquadViewFlags = function() --[[ Line: 71 ]] --[[ Name: useSquadViewFlags ]]
        return 0;
    end
}));