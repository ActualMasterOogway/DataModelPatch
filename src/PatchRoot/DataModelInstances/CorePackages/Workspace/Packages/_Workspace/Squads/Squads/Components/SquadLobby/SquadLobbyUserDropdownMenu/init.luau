local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local l_Cryo_0 = v1.Cryo;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_SharedFlags_0 = v1.SharedFlags;
local l_ExperienceService_0 = v1.ExperienceService;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ModalBottomSheet_0 = l_UIBlox_0.ModalBottomSheet;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_SquadsCore_0 = v1.SquadsCore;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_useStore_0 = v1.Hooks.useStore;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_CrossExperienceVoice_0 = v1.CrossExperienceVoice;
local l_useBackgroundExperience_0 = l_CrossExperienceVoice_0.Hooks.useBackgroundExperience;
local l_useParticipants_0 = l_CrossExperienceVoice_0.Hooks.useParticipants;
local v22 = require(l_script_FirstAncestor_0.Hooks.useSquadUserDropdownMenuButtons);
local l_GameParams_0 = l_ExperienceService_0.GameParams;
local l_ExperienceService_1 = l_ExperienceService_0.ExperienceService;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = l_SquadsCore_0.Enums.SquadPromptType;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_useIsLocalPlayerPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_FFlagEnableSquadUserCardHoverFix_0 = l_SharedFlags_0.FFlagEnableSquadUserCardHoverFix;
local v34 = l_Images_0["icons/common/play"];
local v35 = l_Images_0["icons/menu/profile"];
local v36 = l_Images_0["icons/actions/feedback"];
local v37 = l_Images_0["icons/actions/leave"];
local v38 = l_Images_0["icons/controls/headphoneDeafen_small"];
local v39 = {
    isInExperience = false, 
    onDismiss = function() --[[ Line: 80 ]] --[[ Name: onDismiss ]]

    end, 
    openViewProfile = function() --[[ Line: 81 ]] --[[ Name: openViewProfile ]]

    end, 
    openVoiceAbuseReport = function() --[[ Line: 82 ]] --[[ Name: openVoiceAbuseReport ]]

    end, 
    parentChannelId = "", 
    userId = ""
};
return function(v40) --[[ Line: 87 ]]
    -- upvalues: l_Cryo_0 (copy), v39 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStore_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v22 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_EventNames_0 (copy), v2 (copy), l_dependencyArray_0 (copy), l_SquadPromptType_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipants_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_GameParams_0 (copy), l_ExperienceService_1 (copy), v38 (copy), v34 (copy), v37 (copy), v35 (copy), v36 (copy), l_ModalBottomSheet_0 (copy)
    local v41 = l_Cryo_0.Dictionary.union(v39, v40);
    local v42 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v43 = l_useDispatch_0();
    local v44 = l_useLocalUserId_0();
    local v45 = l_useStore_0();
    local v46 = if l_FFlagEnableSquadUserCardHoverFix_0 then v22(v41.userId, v41.isInExperience) else nil;
    local v47 = l_useLocalization_0({
        joinButtonText = "Common.VisitGame.Label.Play", 
        viewProfileText = "Feature.Chat.Label.ViewProfile", 
        reportUserText = "Feature.Chat.Action.ReportUser", 
        removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
        voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible"
    });
    local v48 = v42.useGetConversationFromId(v41.parentChannelId);
    local v49 = l_React_0.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v48 (copy), l_Constants_0 (ref), v44 (copy)
        return v48 and v48.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v48.initiator == v44;
    end, {
        v48, 
        v44
    });
    local v50 = l_React_0.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v42 (copy), l_EventNames_0 (ref), v41 (copy), v2 (ref)
        v42.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v41.parentChannelId, 
            actionType = v2.ViewProfileButtonClicked
        });
        v41.openViewProfile();
    end, l_dependencyArray_0(v41.parentChannelId, v41.openViewProfile, v42.fireSquadAnalytics));
    local v51 = l_React_0.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: v42 (copy), l_EventNames_0 (ref), v41 (copy), v2 (ref), v45 (copy), l_SquadPromptType_0 (ref), v43 (copy)
        v42.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v41.parentChannelId, 
            actionType = v2.RemoveUserDropDownButtonClicked
        });
        v42.setSquadPrompt(v45, {
            promptType = l_SquadPromptType_0.RemoveFromChat, 
            onConfirm = function() --[[ Line: 131 ]] --[[ Name: onConfirm ]]
                -- upvalues: v41 (ref), v42 (ref), l_EventNames_0 (ref), v2 (ref), v43 (ref)
                if v41.userId ~= "" and v41.parentChannelId ~= "" then
                    v42.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v41.parentChannelId, 
                        actionType = v2.RemoveUserDialogButtonClicked
                    });
                    return v42.removeUserFromParentChannel(v43, v41.parentChannelId, v41.userId);
                else
                    return nil;
                end;
            end
        });
    end, l_dependencyArray_0(v43, v41.userId, v41.parentChannelId, v42.fireSquadAnalytics, v42.setSquadPrompt, v42.removeUserFromParentChannel));
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v52 = l_useBackgroundExperience_0();
        v54 = l_useParticipants_0();
        v55 = l_React_0.useMemo(function() --[[ Line: 165 ]]
            -- upvalues: v52 (ref)
            if v52 then
                return v52.voiceChannelId;
            else
                return nil;
            end;
        end, l_dependencyArray_0(v52));
        v56 = l_React_0.useMemo(function() --[[ Line: 168 ]]
            -- upvalues: v52 (ref)
            if v52 then
                return v52.voiceSessionId;
            else
                return nil;
            end;
        end, l_dependencyArray_0(v52));
        if not l_FFlagEnableSquadUserCardHoverFix_0 then
            local v57 = if v41.userId then tonumber(v41.userId) else nil;
            if v57 then
                local v58 = l_useIsLocalPlayerPartyVoiceEligible_0();
                local v59 = l_useIsUserPartyVoiceEligible_0(v57);
                v53 = l_useIsCurrentSquadPartyVoiceEligible_0() == true and v58 and not v59;
            end;
        end;
    end;
    local v61 = l_React_0.useCallback(function(v60) --[[ Line: 185 ]]
        -- upvalues: v41 (copy)
        return v60.Squad.Presence.byUserId[v41.userId];
    end, {
        v41.userId
    });
    local v62 = l_useSelector_0(v61);
    local v64 = l_React_0.useMemo(function() --[[ Line: 190 ]]
        -- upvalues: l_FFlagEnableSquadUserCardHoverFix_0 (ref), v46 (copy), v62 (copy), l_PresenceType_0 (ref)
        if l_FFlagEnableSquadUserCardHoverFix_0 then
            local v63 = false;
            if table.find(v46, "JoinButton") ~= nil then
                v63 = v62 and v62.userPresenceType == l_PresenceType_0.InGame and v62.placeId;
            end;
            return v63;
        else
            return v62 and v62.userPresenceType == l_PresenceType_0.InGame and v62.placeId;
        end;
    end, l_dependencyArray_0(v62, v46));
    local v66 = l_React_0.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v64 (copy), l_GameParams_0 (ref), v41 (copy), v62 (copy), l_ExperienceService_1 (ref)
        if v64 then
            local v65 = l_GameParams_0.fromUserId(v41.userId, v62.placeId);
            l_ExperienceService_1:LaunchExperience(v65, "SquadLobby", nil);
        end;
    end, l_dependencyArray_0(v64, v41.userId, v62));
    local v67 = nil;
    v67 = if l_FFlagEnableSquadUserCardHoverFix_0 then l_React_0.useMemo(function() --[[ Line: 212 ]]
        -- upvalues: v38 (ref), v47 (copy), v34 (ref), v66 (copy), v37 (ref), v51 (copy), v35 (ref), v50 (copy), v36 (ref), v44 (copy), v41 (copy), v55 (ref), v56 (ref), l_Cryo_0 (ref), v54 (ref), v46 (copy)
        local v70 = {
            VoiceIneligibleButton = {
                icon = v38, 
                text = v47.voiceIneligibleText, 
                stayOnActivated = true
            }, 
            JoinButton = {
                icon = v34, 
                text = v47.joinButtonText, 
                onActivated = v66
            }, 
            RemoveUserButton = {
                icon = v37, 
                text = v47.removeFromGroupText, 
                onActivated = v51
            }, 
            ViewProfileButton = {
                icon = v35, 
                text = v47.viewProfileText, 
                onActivated = v50
            }, 
            ReportButton = {
                icon = v36, 
                text = v47.reportUserText, 
                onActivated = function() --[[ Line: 237 ]] --[[ Name: onActivated ]]
                    -- upvalues: v44 (ref), v41 (ref), v55 (ref), v56 (ref), l_Cryo_0 (ref), v54 (ref)
                    local v69 = {
                        submitterUserId = tostring(v44), 
                        abuserUserId = v41.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v55, 
                        voiceSessionId = v56, 
                        voiceUserIds = l_Cryo_0.List.map(v54 or {}, function(v68) --[[ Line: 244 ]]
                            return v68.userId;
                        end), 
                        voiceUserCount = #(v54 or {})
                    };
                    v41.openSquadVoiceAbuseReport(v69);
                end
            }
        };
        local v71 = {};
        for _, v73 in v46 do
            local v74 = v70[v73];
            if v74 then
                table.insert(v71, v74);
            end;
        end;
        return v71;
    end, l_dependencyArray_0(v41.userId, v41.openSquadVoiceAbuseReport, v47.joinButtonText, v47.removeFromGroupText, v47.reportUserText, v47.viewProfileText, v47.voiceIneligibleText, v44, v55, v56, v54, v51, v46, v66, v50)) else l_React_0.useMemo(function() --[[ Line: 286 ]]
        -- upvalues: v44 (copy), v41 (copy), v55 (ref), v53 (ref), v38 (ref), v47 (copy), v64 (copy), v34 (ref), v66 (copy), v35 (ref), v50 (copy), v36 (ref), v56 (ref), l_Cryo_0 (ref), v54 (ref), v49 (copy), v37 (ref), v51 (copy)
        local v75 = tostring(v44) == v41.userId;
        local v76 = not v41.isInExperience;
        local v77 = not not v55 and not v75;
        local v78 = {};
        if v53 then
            table.insert(v78, {
                icon = v38, 
                text = v47.voiceIneligibleText, 
                stayOnActivated = true
            });
        end;
        if v64 then
            table.insert(v78, {
                icon = v34, 
                text = v47.joinButtonText, 
                onActivated = v66
            });
        end;
        if v76 then
            table.insert(v78, {
                icon = v35, 
                text = v47.viewProfileText, 
                onActivated = v50
            });
        end;
        if v77 then
            table.insert(v78, {
                icon = v36, 
                text = v47.reportUserText, 
                onActivated = function() --[[ Line: 321 ]] --[[ Name: onActivated ]]
                    -- upvalues: v44 (ref), v41 (ref), v55 (ref), v56 (ref), l_Cryo_0 (ref), v54 (ref)
                    local v80 = {
                        submitterUserId = tostring(v44), 
                        abuserUserId = v41.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v55, 
                        voiceSessionId = v56, 
                        voiceUserIds = l_Cryo_0.List.map(v54 or {}, function(v79) --[[ Line: 328 ]]
                            return v79.userId;
                        end), 
                        voiceUserCount = #(v54 or {})
                    };
                    v41.openSquadVoiceAbuseReport(v80);
                end
            });
        end;
        if v49 then
            table.insert(v78, {
                icon = v37, 
                text = v47.removeFromGroupText, 
                onActivated = v51
            });
        end;
        return v78;
    end, l_dependencyArray_0(v41.isInExperience, v41.userId, v41.openSquadVoiceAbuseReport, v47.joinButtonText, v47.removeFromGroupText, v47.reportUserText, v47.viewProfileText, v47.voiceIneligibleText, v53, v44, v55, v56, v54, v51, v64, v49, v66, v50));
    if #v67 > 0 then
        return l_React_0.createElement(l_ModalBottomSheet_0, {
            bottomGap = 20, 
            onDismiss = function() --[[ Line: 374 ]] --[[ Name: onDismiss ]]
                -- upvalues: v41 (copy)
                v41.onDismiss();
            end, 
            buttonModels = v67, 
            screenWidth = 400, 
            showImages = true
        });
    else
        v41.onDismiss();
        return nil;
    end;
end;