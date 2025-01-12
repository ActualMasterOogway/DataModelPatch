local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local v1 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local _ = require(script.Parent.SquadContractType);
return {
    closeSquadPrompt = function() --[[ Line: 9 ]] --[[ Name: closeSquadPrompt ]]

    end, 
    createFriendConversation = function(_, _) --[[ Line: 12 ]] --[[ Name: createFriendConversation ]]

    end, 
    fetchParentChannelDetails = function(_, _) --[[ Line: 15 ]] --[[ Name: fetchParentChannelDetails ]]
        return nil;
    end, 
    inviteToParentChannel = function(_, _, _) --[[ Line: 18 ]] --[[ Name: inviteToParentChannel ]]
        return function(_) --[[ Line: 19 ]]
            return nil;
        end;
    end, 
    navigateIntoSquadLobby = function(_, _) --[[ Line: 23 ]] --[[ Name: navigateIntoSquadLobby ]]

    end, 
    removeUserFromParentChannel = function(_, _, _) --[[ Line: 26 ]] --[[ Name: removeUserFromParentChannel ]]
        return function(_) --[[ Line: 27 ]]
            return nil;
        end;
    end, 
    setSquadPrompt = function(_, _) --[[ Line: 31 ]] --[[ Name: setSquadPrompt ]]

    end, 
    useGetConversationFromId = function(_) --[[ Line: 34 ]] --[[ Name: useGetConversationFromId ]]
        return nil;
    end, 
    useParentChannelHasGroupUp = function(_) --[[ Line: 37 ]] --[[ Name: useParentChannelHasGroupUp ]]
        return false;
    end, 
    useParentChannelHasSquadAccess = function(_) --[[ Line: 40 ]] --[[ Name: useParentChannelHasSquadAccess ]]
        return false;
    end, 
    useParentChannelTitleSelector = function(_) --[[ Line: 43 ]] --[[ Name: useParentChannelTitleSelector ]]
        return "";
    end, 
    useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 46 ]] --[[ Name: useParentChannelIsPartyVoiceEligible ]]
        return nil;
    end, 
    useSquadRootView = function() --[[ Line: 49 ]] --[[ Name: useSquadRootView ]]
        -- upvalues: v1 (copy)
        return v1.None;
    end, 
    useSquadTopBannerManager = function() --[[ Line: 52 ]] --[[ Name: useSquadTopBannerManager ]]
        return {
            disableSquadTopBanner = function(_, _) --[[ Line: 54 ]] --[[ Name: disableSquadTopBanner ]]

            end, 
            useSquadTopBannerDisabled = function() --[[ Line: 55 ]] --[[ Name: useSquadTopBannerDisabled ]]
                return false;
            end
        };
    end
};