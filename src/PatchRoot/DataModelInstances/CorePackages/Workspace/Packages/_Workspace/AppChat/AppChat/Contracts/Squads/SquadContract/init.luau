local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v5 = require(l_script_FirstAncestor_0.Models.Conversation);
local v6 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v7 = require(l_script_FirstAncestor_0.Conversations.Thunks.createFriendConversation);
local l_ModerationType_0 = require(l_script_FirstAncestor_0.Models.ConversationChannels).ModerationType;
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.expandToGroupConversation);
local v10 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v11 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v12 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local v13 = require(l_script_FirstAncestor_0.Conversations.Thunks.NavigateIntoSquadLobby);
local v14 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v15 = require(l_script_FirstAncestor_0.Hooks.useGetConversationHasGroupUpFromId);
local v16 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_GetFFlagEnableSquadEntrypointsSettingsFix_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSquadEntrypointsSettingsFix;
local v18 = game:DefineFastFlag("FixSquadEmptyProfileFetch", false);
return {
    fetchParentChannelDetails = function(v19, v20) --[[ Line: 26 ]]
        -- upvalues: v10 (copy)
        return v19(v10(v20));
    end, 
    inviteToParentChannel = function(v21, v22, v23) --[[ Line: 30 ]]
        -- upvalues: v5 (copy), v2 (copy), v9 (copy)
        if v22.conversationType == v5.Type.MULTI_USER_CONVERSATION then
            return v21(v2.rodux.AddUserToConversation.API(v22.id, v23)):andThen(function() --[[ Line: 34 ]]
                -- upvalues: v22 (copy)
                return v22.id;
            end);
        else
            return v21(v9(v22.id, v23)):andThen(function(v24) --[[ Line: 40 ]]
                return v24.id;
            end);
        end;
    end, 
    navigateIntoSquadLobby = v13, 
    removeUserFromParentChannel = function(v25, v26, v27) --[[ Line: 46 ]]
        -- upvalues: v2 (copy)
        return v25(v2.rodux.RemoveUserFromConversation.API(v26, v27));
    end, 
    createFriendConversation = v7, 
    useGetConversationFromId = v14, 
    useParentChannelHasGroupUp = function(v28) --[[ Line: 50 ]]
        -- upvalues: v15 (copy)
        return v15(v28);
    end, 
    useParentChannelHasSquadAccess = function(v29) --[[ Line: 54 ]]
        -- upvalues: v14 (copy), l_GetFFlagEnableSquadEntrypointsSettingsFix_0 (copy), v6 (copy), v16 (copy)
        assert(v29 ~= nil, "Missing parent channel ID");
        local v30 = v14(v29) or {};
        if v30.source == "friends" then
            return true;
        else
            local v31 = nil;
            if l_GetFFlagEnableSquadEntrypointsSettingsFix_0() then
                v31 = v30.participantPendingStatus == v6.UserPendingStatus.Pending;
            end;
            local v32 = v16(v30);
            if l_GetFFlagEnableSquadEntrypointsSettingsFix_0() then
                return not v32 and not v31;
            else
                return not v32;
            end;
        end;
    end, 
    useParentChannelIsPartyVoiceEligible = function(v33) --[[ Line: 79 ]]
        -- upvalues: v14 (copy), l_ModerationType_0 (copy)
        local v34 = v14(v33);
        if v34 and v34.moderationType ~= nil then
            return v34.moderationType == l_ModerationType_0.TrustedComms;
        else
            return nil;
        end;
    end, 
    useParentChannelTitleSelector = function(v35) --[[ Line: 87 ]]
        -- upvalues: v14 (copy), v18 (copy), l_useLocalUserId_0 (copy), v3 (copy), v12 (copy), v11 (copy)
        local v36 = v14(v35);
        local v37 = if v18 then tonumber(l_useLocalUserId_0()) or 0 else l_useLocalUserId_0();
        local v38 = v3.Hooks.useUserProfilesFetch({
            userIds = v12(v36, v37), 
            query = v3.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        local v39 = v3.Hooks.useUserProfilesFetch({
            userIds = if v18 then if v37 > 0 then {
                (tostring(v37))
            } else {} else {
                (tostring(v37))
            }, 
            query = v3.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        return v11(v36, v38.data and v38.data.userProfiles, if v39.data then v3.Selectors.getCombinedNameFromId(v39.data, (tostring(v37))) else "");
    end
};