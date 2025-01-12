local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.SquadExternalContractContext);
local _ = require(script.Parent.SquadContractType);
local v4 = require(script.Parent.SquadViewFlags);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local _ = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local l_useCurrentSquadId_0 = require(l_script_FirstAncestor_0.Hooks).useCurrentSquadId;
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.RoactUtils);
local v11 = require(l_Parent_0.SharedFlags);
local l_dependencyArray_0 = v10.Hooks.dependencyArray;
local l_FFlagEnableSquadTopBannerWideMode_0 = v11.FFlagEnableSquadTopBannerWideMode;
return function(v14) --[[ Line: 29 ]]
    -- upvalues: v9 (copy), v4 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), v5 (copy), l_useCurrentSquadId_0 (copy), v8 (copy), l_dependencyArray_0 (copy), v2 (copy)
    local v15, v16 = v9.useState(v4.None);
    local v19 = if l_FFlagEnableSquadTopBannerWideMode_0 then v14.contract.useSquadTopBannerManager() else v9.useMemo(function() --[[ Line: 34 ]]
        return {
            disableSquadTopBanner = function(_, _) --[[ Line: 36 ]] --[[ Name: disableSquadTopBanner ]]

            end, 
            useSquadTopBannerDisabled = function() --[[ Line: 37 ]] --[[ Name: useSquadTopBannerDisabled ]]
                return false;
            end
        };
    end, {});
    local v20 = v9.useMemo(v5.Analytics, {});
    local v21 = l_useCurrentSquadId_0();
    local v24 = v9.useCallback(function(v22, v23) --[[ Line: 45 ]]
        -- upvalues: v8 (ref), v21 (copy), v14 (copy), v20 (copy)
        v23 = v8.Dictionary.join(v23, {
            squadId = v21, 
            squadLocation = v14.squadLocation
        });
        v20.fireAnalyticsEvent(v22, v23);
    end, l_dependencyArray_0(v21, v14.squadLocation));
    return v9.createElement(v2.Provider, {
        value = {
            closeSquadPrompt = v14.contract.closeSquadPrompt, 
            createFriendConversation = v14.contract.createFriendConversation, 
            disableSquadTopBanner = v19.disableSquadTopBanner, 
            fetchParentChannelDetails = v14.contract.fetchParentChannelDetails, 
            fireSquadAnalytics = v24, 
            inviteToParentChannel = v14.contract.inviteToParentChannel, 
            navigateIntoSquadLobby = v14.contract.navigateIntoSquadLobby, 
            removeUserFromParentChannel = v14.contract.removeUserFromParentChannel, 
            setSquadPrompt = v14.contract.setSquadPrompt, 
            updateSquadViewFlags = v9.useCallback(function(v25, v26) --[[ Line: 65 ]]
                -- upvalues: v16 (copy)
                if v26 then
                    v16(function(v27) --[[ Line: 67 ]]
                        -- upvalues: v25 (copy)
                        return (bit32.bor(v27, v25));
                    end);
                    return;
                else
                    v16(function(v28) --[[ Line: 71 ]]
                        -- upvalues: v25 (copy)
                        return (bit32.band(v28, (bit32.bnot(v25))));
                    end);
                    return;
                end;
            end, {}), 
            useGetConversationFromId = v14.contract.useGetConversationFromId, 
            useParentChannelHasGroupUp = v14.contract.useParentChannelHasGroupUp, 
            useParentChannelHasSquadAccess = v14.contract.useParentChannelHasSquadAccess, 
            useParentChannelIsPartyVoiceEligible = v14.contract.useParentChannelIsPartyVoiceEligible, 
            useParentChannelTitleSelector = v14.contract.useParentChannelTitleSelector, 
            useSquadRootView = v14.contract.useSquadRootView, 
            useSquadTopBannerDisabled = v19.useSquadTopBannerDisabled, 
            useSquadViewFlags = v9.useCallback(function() --[[ Line: 83 ]]
                -- upvalues: v15 (copy)
                return v15;
            end, {
                v15
            })
        }
    }, v14.children);
end;