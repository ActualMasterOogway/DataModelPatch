local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v7 = require(l_Parent_0.UserProfiles);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local l_useState_0 = v3.useState;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local v19 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_useUserProfilesFetch_0 = v7.Hooks.useUserProfilesFetch;
local l_userProfilesCombinedNameAndUsernameByUserIds_0 = v7.Queries.userProfilesCombinedNameAndUsernameByUserIds;
local v22 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
local v24 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v26 = require(script.Parent.Selectors.selectChatUserEntryModelList);
local v27 = require(script.Parent.ChatDetailsPage);
local v28 = require(script.Parent.Dialogs.GenericDialogType);
local v29 = require(l_Parent_0.AppChatNetworking);
local v30 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v31 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v32 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v34 = {
    topBarHeight = 0, 
    wideMode = false, 
    participants = nil, 
    isGroupConversation = nil, 
    isGroupOwner = nil, 
    conversationId = nil, 
    conversation = nil, 
    navigateBack = function() --[[ Line: 57 ]] --[[ Name: navigateBack ]]

    end, 
    navigateToEditChatMembers = function() --[[ Line: 58 ]] --[[ Name: navigateToEditChatMembers ]]

    end, 
    navigateToDialog = function() --[[ Line: 59 ]] --[[ Name: navigateToDialog ]]

    end, 
    navigateToToast = function() --[[ Line: 60 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateToConversation = function() --[[ Line: 61 ]] --[[ Name: navigateToConversation ]]

    end
};
return function(v35) --[[ Line: 64 ]]
    -- upvalues: v2 (copy), v34 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v3 (copy), v24 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_useNavigation_0 (copy), v32 (copy), v13 (copy), l_useSelector_0 (copy), v6 (copy), v18 (copy), l_useEffect_0 (copy), v29 (copy), l_useCallback_0 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesCombinedNameAndUsernameByUserIds_0 (copy), v31 (copy), v26 (copy), l_getConversationDisplayTitle_0 (copy), v22 (copy), v19 (copy), v5 (copy), v28 (copy), v30 (copy), l_dependencyArray_0 (copy), l_useEffectOnMount_0 (copy), v27 (copy)
    local v36 = v2.Dictionary.join(v34, v35 or {});
    local v37 = l_useStyle_0();
    local v38 = l_useLocalization_0({
        pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
        generalText = "Feature.Chat.Label.General", 
        titleNotSetText = "Feature.Chat.Label.NotSet", 
        membersText = "Feature.Chat.Label.Members", 
        addFriendsText = "Feature.Chat.Label.AddFriends", 
        leaveGroupText = "Feature.Chat.Heading.LeaveGroup", 
        chatGroupText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        tooManyPeopleText = {
            l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.PartyGroupLimitToastText" or "Feature.Chat.Message.ToastText"; 
            friendNum = 5
        }, 
        networkErrorToastText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        conversationTypeHeaderText = "Feature.Chat.Label.TextFiltering", 
        enabledText = "Feature.Chat.Label.Enabled", 
        disabledText = "Feature.Chat.Label.Disabled", 
        createUnfilteredChatText = "Feature.Chat.Label.CreateUnfilteredChat", 
        createUnfilteredChatSubtitleText = "Feature.Chat.Description.CreateUnfilteredChatCell"
    });
    local v39 = v3.useContext(v24);
    local v40 = l_useDispatch_0();
    local v41, v42 = l_useState_0(false);
    local v43 = l_useNavigation_0();
    local v44 = true;
    if v32() then
        v44 = v13();
    end;
    local v46 = l_useSelector_0(function(v45) --[[ Line: 104 ]]
        -- upvalues: v6 (ref), v36 (copy), v18 (ref)
        return v6(v45, (("ChatAppReducer.Conversations.%*"):format(v36.conversationId or ""))) or v18.empty();
    end);
    local v47 = v46 and v46.source;
    l_useEffect_0(function() --[[ Line: 110 ]]
        -- upvalues: v47 (copy), v40 (copy), v29 (ref), v36 (copy)
        if v47 ~= "channels" then
            return;
        else
            v40(v29.rodux.GetConversationsParticipantsMetadata.API({
                v36.conversationId
            })):catch(function() --[[ Line: 116 ]]
                warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata");
            end);
            return;
        end;
    end, {
        v36.conversationId, 
        v36.participants, 
        v47
    });
    local v49 = l_useSelector_0(l_useCallback_0(function(v48) --[[ Line: 121 ]]
        -- upvalues: v6 (ref)
        return v6(v48, "ChatAppReducer.UnfilteredThreads.eligibility") or {};
    end, {}));
    local l_isFullyEligible_0 = v49.isFullyEligible;
    local v51 = v49.isIXPEligible and v49.isRolloutEligible;
    local v52 = l_useUserProfilesFetch_0({
        userIds = v46.participants, 
        query = l_userProfilesCombinedNameAndUsernameByUserIds_0
    });
    local v53 = v31();
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    if v46 then
        v54 = l_useSelector_0(function(v62) --[[ Line: 142 ]]
            -- upvalues: v52 (copy), v26 (ref), v46 (copy)
            if v52.data then
                return v26(v62, v46.participants, v52.data.userProfiles);
            else
                return {};
            end;
        end);
        v56 = v46.conversationType == v18.Type.MULTI_USER_CONVERSATION;
        v55 = l_useSelector_0(function(v63) --[[ Line: 154 ]]
            -- upvalues: v56 (ref), v46 (copy)
            return v56 and v46.initiator == v63.LocalUserId;
        end);
        v57 = l_getConversationDisplayTitle_0(v46);
        if v46.participantMetadata then
            for v64, v65 in v54 do
                v54[v64] = v2.Dictionary.join(v65, {
                    metadata = v46.participantMetadata[v64]
                });
            end;
        end;
        v59 = v22(v46);
        v58 = v56 and v59;
        if v32() and v58 then
            v44 = false;
        end;
        v60 = v46.moderationType == v19.ModerationType.TrustedComms;
        v61 = v46.source == "channels";
    end;
    local v66 = v54 and #v54 or 0;
    local v67 = l_isFullyEligible_0 and v56 and not v60 and v61;
    local v68 = v60 or v51;
    local v69 = if v60 then v38.enabledText else v38.disabledText;
    if v46.isDefaultTitle then
        v57 = v38.titleNotSetText;
    end;
    local function _(v70) --[[ Line: 186 ]]
        -- upvalues: v5 (ref)
        return v5.new(function(v71, v72) --[[ Line: 187 ]]
            -- upvalues: v70 (copy)
            if #v70.participants > 5 then
                v72();
                return;
            else
                v71();
                return;
            end;
        end);
    end;
    local function v74() --[[ Line: 197 ]]
        -- upvalues: v36 (copy), v28 (ref)
        v36.navigateToDialog(v28.EditChatGroupNameDialog, {
            conversationId = v36.conversationId
        });
    end;
    local function v75() --[[ Line: 202 ]]
        -- upvalues: v36 (copy), v28 (ref), v53 (copy), v30 (ref), v66 (copy), v55 (ref)
        v36.navigateToDialog(v28.LeaveGroupDialog, {
            conversationId = v36.conversationId
        });
        if v53 then
            v53.fireAnalyticsEvent(v30.ChatDetailsLeaveGroupBtnClicked, {
                conversationId = v36.conversationId, 
                participantsCount = v66, 
                isGroupOwner = v55
            });
        end;
    end;
    local v76 = l_useCallback_0(function() --[[ Line: 214 ]]
        -- upvalues: v43 (copy), v39 (copy)
        if v43 then
            v39.navigateToUnfilteredThreadsLearnMore(v43.navigate);
            return;
        else
            v39.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, l_dependencyArray_0(v39, v43));
    local v80 = l_useCallback_0(function() --[[ Line: 222 ]]
        -- upvalues: v53 (copy), v30 (ref), v36 (copy), v66 (copy), v55 (ref), v42 (copy), v40 (copy), v29 (ref), v38 (copy)
        if v53 then
            v53.fireAnalyticsEvent(v30.ChatDetailsCreateUnfilteredChatCellClicked, {
                conversationId = v36.conversationId, 
                participantsCount = v66, 
                isGroupOwner = v55
            });
        end;
        v42(true);
        v40(v29.rodux.DuplicateConversation.API(v36.conversationId, "trusted_comms")):andThen(function(v77) --[[ Line: 232 ]]
            -- upvalues: v36 (ref), v38 (ref)
            local l_responseBody_0 = v77.responseBody;
            local v79 = l_responseBody_0 and l_responseBody_0.conversations and l_responseBody_0.conversations[1] and l_responseBody_0.conversations[1].id;
            if v79 then
                v36.navigateToConversation(v79);
                return;
            else
                v36.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v38.networkErrorToastText
                        }
                    }
                });
                return;
            end;
        end):catch(function() --[[ Line: 250 ]]
            -- upvalues: v36 (ref), v38 (ref)
            v36.navigateToToast({
                toastProps = {
                    toastContent = {
                        toastTitle = v38.networkErrorToastText
                    }
                }
            });
        end):finally(function() --[[ Line: 259 ]]
            -- upvalues: v42 (ref)
            v42(false);
        end);
    end, {
        v40, 
        v42, 
        v36.navigateToToast, 
        v36.navigateToConversation, 
        v53, 
        v36.conversationId, 
        v66, 
        v55
    });
    local function v82(v81) --[[ Line: 275 ]]
        -- upvalues: v36 (copy), v28 (ref), v59 (ref), v56 (ref), v55 (ref)
        v36.navigateToDialog(v28.ParticipantDialog, {
            conversationId = v36.conversationId, 
            participantId = v81, 
            showRemoveUserButton = not v59 and v56 and v55
        });
    end;
    local function v84(v83) --[[ Line: 283 ]]
        -- upvalues: v36 (copy)
        v36.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v83
                }
            }
        });
    end;
    local function v89(v85) --[[ Line: 293 ]]
        -- upvalues: v46 (copy), v5 (ref), v36 (copy), v84 (copy), v53 (copy), v30 (ref), v66 (copy), v55 (ref), v56 (ref)
        local l_v46_0 = v46;
        v5.new(function(v87, v88) --[[ Line: 187 ]]
            -- upvalues: l_v46_0 (copy)
            if #l_v46_0.participants > 5 then
                v88();
                return;
            else
                v87();
                return;
            end;
        end):andThen(function() --[[ Line: 294 ]]
            -- upvalues: v36 (ref), v46 (ref)
            v36.navigateToEditChatMembers(v46);
        end, function() --[[ Line: 297 ]]
            -- upvalues: v84 (ref), v85 (copy)
            v84(v85);
        end);
        if v53 then
            v53.fireAnalyticsEvent(v30.ChatDetailsAddFriendsBtnClicked, {
                conversationId = v36.conversationId, 
                participantsCount = v66, 
                isGroupOwner = v55, 
                isGroupConversation = v56
            });
        end;
    end;
    local v90 = v46 and v46.moderationType or v2.None;
    local v91 = v46 and v46.userPendingStatus or v2.None;
    l_useEffect_0(function() --[[ Line: 313 ]]
        -- upvalues: v53 (copy), v90 (copy), v91 (copy)
        if v53 then
            v53.updateInfoForAllEvents({
                moderationType = v90, 
                userPendingStatus = v91
            });
        end;
    end, {
        v53, 
        v90, 
        v91
    });
    if v53 then
        l_useEffectOnMount_0(function() --[[ Line: 323 ]]
            -- upvalues: v53 (copy), v30 (ref), v36 (copy), v46 (copy), v55 (ref), v56 (ref)
            v53.fireAnalyticsEvent(v30.ChatDetailsRendered, {
                conversationId = v36.conversationId, 
                participantsCount = #v46.participants, 
                isGroupOwner = v55, 
                isGroupConversation = v56
            });
        end);
    end;
    return v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        ChatDetailsPage = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Content = v3.createElement(v27, v2.Dictionary.join({
                navigateBack = v36.navigateBack, 
                onGroupNameEntryCellActivated = v74, 
                onLeaveGroupCellActivated = v75, 
                onParticipantCellActivated = v82, 
                onAddFriendsCellActivated = function() --[[ Line: 354 ]] --[[ Name: onAddFriendsCellActivated ]]
                    -- upvalues: v89 (copy), v38 (copy)
                    return v89(v38.tooManyPeopleText);
                end, 
                onConversationTypeIconActivated = v76, 
                onCreateUnfilteredChatCellActivated = v80, 
                conversationTitle = v57, 
                conversation = v46, 
                conversationId = v36.conversationId, 
                participants = v54, 
                isGroupConversation = v56, 
                wideMode = v36.wideMode, 
                shouldHideGroupChatFunctionality = v58, 
                shouldShowAddFriends = v44, 
                shouldShowRevampedUI = v68, 
                shouldShowCreateUnfilteredChat = v67, 
                conversationTypeText = v69, 
                isCreateUnfilteredChatLoading = v41, 
                topBarHeight = v36.topBarHeight, 
                LayoutOrder = 2, 
                style = v37
            }, v38))
        })
    });
end;