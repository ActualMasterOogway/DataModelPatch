local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
return {
    [v5.EnterSquadButtonPressed] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.EnterSquadButtonPressed, 
        formatRulesForAdditionalInfo = {
            conversationId = v1.identity, 
            squadButtonSource = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            userIntention = v1.identity
        }
    }, 
    [v5.PartySheetAction] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.PartySheetAction, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            actionType = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.SquadInvitePageNavSource] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadInvitePageNavSource, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            inviteNavSource = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.SquadExperienceInviteApiCall] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadExperienceInviteApiCall, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            experienceInviteId = v1.identity, 
            invitationPlaceId = v1.identity, 
            isSuccess = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            squadMembers = v1.identity, 
            squadMembersCount = v1.identity
        }
    }, 
    [v5.SquadInvite] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadInvite, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            inviteeCount = v1.identity, 
            inviteeUserIds = v1.identity, 
            isSuccess = v1.identity, 
            source = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            userId = v1.identity
        }
    }, 
    [v5.SquadVoteApiCall] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadVoteApiCall, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            experienceInviteId = v1.identity, 
            isSuccess = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            voteType = v1.identity
        }
    }, 
    [v5.SquadToastActions] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadToastActions, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            experienceInviteId = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            toastAction = v1.identity, 
            toastType = v1.identity
        }
    }
};