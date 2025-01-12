local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.FriendsLanding);
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local l_compose_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoduxTools.compose;
local v10 = require(script.Parent.ConversationGroupsEntry);
local v11 = require(script.Parent.ConversationListWithTopBar);
local v12 = require(script.Parent.ChatLoading.ChatLoadingContainer);
local v13 = require(script.Parent.EmptyConversationList);
local v14 = require(script.Parent.NoConversationsLanding);
local v15 = require(script.Parent.mapDispatchToProps);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v18 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local v19 = require(l_script_FirstAncestor_0.Hooks.useGetConversations);
local v20 = require(l_script_FirstAncestor_0.Hooks.useIsAppLoaded);
local v21 = require(l_script_FirstAncestor_0.Hooks.useAreConversationsFetching);
local v22 = require(l_script_FirstAncestor_0.Hooks.useIsOldestConversationFetched);
local v23 = require(l_script_FirstAncestor_0.Hooks.useHasConversations);
local v24 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabledFromReason);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v27 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v28 = require(l_Parent_0.UserProfiles);
local v29 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v30 = require(l_script_FirstAncestor_0.Conversations.getAllParticipants);
local l_useCallback_0 = v4.useCallback;
local l_useState_0 = v4.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v35 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v36 = require(l_Parent_0.AppChatNetworking);
local v37 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local l_IsVRAppBuild_0 = v2.IsVRAppBuild;
local l_useEffect_0 = v4.useEffect;
local v40 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v41 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v45 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v46 = require(script.Parent.Logger):new(script.Name);
local v47 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v48 = require(l_script_FirstAncestor_0.Analytics.Enums.EmptyStateType);
local v49 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v50 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPersistentEventReceivers);
local v51 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTabHideGroupsLinkOnVR);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v53 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local l_HorizontalPageMargin_0 = v6.App.Container.HorizontalPageMargin;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_NoFriendsView_0 = v7.Components.NoFriendsView;
local v57 = game:DefineFastString("ChatTabAddFriendsButtonKey", "Feature.Friends.Feature.Friends.Heading.AddFriends");
local v58 = game:DefineFastFlag("AppChatHideTopBarIconsEmptyStateInExperience", false);
local v59 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupSetting);
local v60 = game:DefineFastFlag("AppChatDisabledEmptyStateReasons", false);
local v61 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatUseNewNoConversationsLanding);
local v62 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage() and game:DefineFastFlag("AppChatLandingEnableJoinPartyFTUX", false);
local v63 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v64 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v65 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local v66 = require(l_script_FirstAncestor_0.EnumScreens);
local v67 = {
    topBarHeight = 0, 
    isShowingFilterBox = false, 
    navigateToSquadLobby = function() --[[ Line: 98 ]] --[[ Name: navigateToSquadLobby ]]

    end
};
local function _(v68, v69, v70) --[[ Line: 101 ]] --[[ Name: formatTitle ]]
    -- upvalues: v3 (copy), v29 (copy)
    local v71 = false;
    local v73 = v3.List.map(v68.otherParticipants, function(v72) --[[ Line: 103 ]]
        -- upvalues: v69 (copy), v71 (ref)
        if v69[tostring(v72)] == nil then
            v71 = true;
        end;
        return v69[tostring(v72)];
    end);
    if v71 and v68.isDefaultTitle then
        return "";
    else
        return v29(v68, v73, v70);
    end;
end;
ChatLandingContainer = function(v75) --[[ Line: 118 ]] --[[ Name: ChatLandingContainer ]]
    -- upvalues: v3 (copy), v67 (copy), l_useDispatch_0 (copy), v17 (copy), v18 (copy), v24 (copy), v20 (copy), v21 (copy), v23 (copy), v22 (copy), l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v19 (copy), v4 (copy), v30 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), v50 (copy), v46 (copy), v45 (copy), v28 (copy), v40 (copy), v41 (copy), v29 (copy), v59 (copy), v49 (copy), v64 (copy), l_useEffectOnMount_0 (copy), v47 (copy), v63 (copy), l_useState_0 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v35 (copy), v62 (copy), l_dependencyArray_0 (copy), v36 (copy), v37 (copy), v61 (copy), v65 (copy), v66 (copy), v12 (copy), l_default_0 (copy), v16 (copy), l_NoFriendsView_0 (copy), v48 (copy), v57 (copy), v14 (copy), v60 (copy), v13 (copy), v11 (copy), v51 (copy), l_IsVRAppBuild_0 (copy), v58 (copy), v10 (copy), v27 (copy), v53 (copy), l_HorizontalPageMargin_0 (copy)
    local v76 = v3.Dictionary.join(v67, v75);
    local v77 = l_useDispatch_0();
    local v78 = v17();
    local v79 = v18();
    local v80 = v24("privacySettingsEnabled");
    local v81 = v24("globalRulesEnabled");
    local v82 = v20();
    local v83 = v21();
    local v84 = v23();
    local v85 = v22();
    local v86 = l_useLocalUserId_0();
    local v87 = l_useNavigation_0();
    local v88 = l_useStyle_0();
    local v89 = v19();
    local v90 = v4.useRef({});
    local v91 = v4.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v30 (ref), v89 (copy)
        return v30(v89);
    end, {
        v89
    });
    local v92 = l_usePrevious_0(v78);
    l_useEffect_0(function() --[[ Line: 143 ]]
        -- upvalues: v50 (ref), v46 (ref), v92 (copy), v78 (copy), v77 (copy), v45 (ref)
        if v50() then
            v46:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", v92, v78);
            if v92 ~= nil and v92 ~= v78 and v78 then
                v46:info("Chat has become enabled, fetching conversations");
                v77(v45());
            end;
        end;
    end, {
        v77, 
        v78, 
        v92
    });
    local v93 = v28.Hooks.useUserProfilesFetch({
        userIds = v91, 
        query = v28.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v94 = v28.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v86))
        }, 
        query = v28.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v107, v108, v109 = v4.useMemo(function() --[[ Line: 172 ]]
        -- upvalues: v90 (copy), v93 (copy), v3 (ref), v89 (copy), v40 (ref), v41 (ref), v94 (copy), v28 (ref), v86 (copy), v29 (ref), v59 (ref), v79 (copy)
        local l_current_0 = v90.current;
        if v93.data then
            v3.List.map(v93.data.userProfiles, function(v96) --[[ Line: 175 ]]
                -- upvalues: l_current_0 (copy)
                l_current_0[v96.id] = v96;
            end);
        end;
        local v97 = 0;
        local v98 = 0;
        local v99 = {};
        for _, v101 in v89 do
            if v40(v101) then
                v97 = v97 + 1;
            end;
            if v101.moderationType == v41.ModerationType.TrustedComms then
                v98 = v98 + 1;
            end;
            local v102 = if v94.data then v28.Selectors.getCombinedNameFromId(v94.data, v86) else "";
            local v103 = false;
            local v105 = v3.List.map(v101.otherParticipants, function(v104) --[[ Line: 103 ]]
                -- upvalues: l_current_0 (copy), v103 (ref)
                if l_current_0[tostring(v104)] == nil then
                    v103 = true;
                end;
                return l_current_0[tostring(v104)];
            end);
            local v106;
            if v103 and v101.isDefaultTitle then
                v106 = "";
                --[[ close >= 11 ]]
            else
                v106 = v29(v101, v105, v102);
                --[[ close >= 11 ]]
            end;
            if not v59() or v79 or v101.conversationType ~= "MultiUserConversation" then
                table.insert(v99, v3.Dictionary.join(v101, {
                    title = v106
                }));
            end;
        end;
        return v99, v97, v98;
    end, {
        v89, 
        v91, 
        v93.data, 
        v94.data, 
        v86, 
        v79
    });
    local v110 = v49();
    local v111 = v64();
    l_useEffect_0(function() --[[ Line: 222 ]]
        -- upvalues: v110 (copy), v107 (copy)
        if v110 then
            v110.updateInfoForAllEvents({
                chatLandingListCount = #v107
            });
        end;
    end, {
        #v107, 
        v110
    });
    l_useEffect_0(function() --[[ Line: 230 ]]
        -- upvalues: v110 (copy), v108 (copy), v109 (copy)
        if v110 then
            v110.updateInfoForAllEvents({
                pendingConversationCount = v108, 
                unfilteredConversationCount = v109
            });
        end;
    end, {
        v108, 
        v109, 
        v110
    });
    l_useEffectOnMount_0(function() --[[ Line: 239 ]]
        -- upvalues: v110 (copy), v47 (ref), v78 (copy)
        if v110 then
            v110.fireAnalyticsEvent(v47.ChatLandingScreenRendered, {
                isChatEnabled = v78
            });
        end;
    end);
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    if not v63() then
        local v116, v117 = l_useState_0({
            phone_verify = false, 
            fully_eligible_ftux = false, 
            party_only_ftux = false
        });
        local v119 = l_useSelector_0(l_useCallback_0(function(v118) --[[ Line: 256 ]]
            -- upvalues: v35 (ref)
            return v35(v118, "ChatAppReducer.UnfilteredThreads.ftuxModalVariant");
        end, {}));
        local v120 = false;
        if v119 == "phone_verify" then
            v120 = not v116.phone_verify and not v111;
        end;
        v112 = v120;
        v120 = false;
        if v119 == "fully_eligible_ftux" then
            v120 = not v116.fully_eligible_ftux and not v111;
        end;
        v113 = v120;
        v114 = false;
        if v62 then
            v120 = false;
            if v119 == "party_only_ftux" then
                v120 = not v116.party_only_ftux;
            end;
            v114 = v120;
        end;
        local l_v119_0 = v119 --[[ copy: 31 -> 42 ]];
        local l_v117_0 = v117 --[[ copy: 30 -> 43 ]];
        v115 = l_useCallback_0(function() --[[ Line: 272 ]]
            -- upvalues: l_v119_0 (copy), l_v117_0 (copy), v3 (ref)
            if not l_v119_0 then
                return;
            else
                l_v117_0(function(v123) --[[ Line: 276 ]]
                    -- upvalues: v3 (ref), l_v119_0 (ref)
                    return v3.Dictionary.join(v123, {
                        [l_v119_0] = true
                    });
                end);
                return;
            end;
        end, l_dependencyArray_0(v117, v119));
    end;
    local v126 = l_useSelector_0(l_useCallback_0(function(v124) --[[ Line: 284 ]]
        -- upvalues: v36 (ref), v37 (ref), v63 (ref)
        local v125 = true;
        if v36.rodux.GetUnfilteredThreadEligibility.getStatus(v124) ~= v37.Enum.NetworkStatus.Fetching then
            v125 = not v63() and v36.rodux.GetUnfilteredThreadsFtuxModal.getStatus(v124, v36.Constants.UnfilteredThreadsModalSequence) == v37.Enum.NetworkStatus.Fetching;
        end;
        return v125;
    end, {}));
    local v127 = v3.isEmpty(v107);
    local v129 = l_useSelector_0(function(v128) --[[ Line: 298 ]]
        return v128.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done";
    end);
    local v130 = (if v61() then v129 else not v82) or v127 and v83 or v127 and v84 or v127 and v126;
    local v131 = nil;
    local v132 = false;
    local v133 = false;
    local v134 = v65({
        v66.AddFriends, 
        v66.PrivacySettings, 
        v66.Groups
    });
    local _ = nil;
    if if v61() then v130 else v78 and v130 then
        v131 = v4.createElement(v12, {
            topBarHeight = v76.topBarHeight, 
            pageHeaderText = v76.pageHeaderText, 
            cellHeight = 64, 
            cellWidth = 375
        });
        if l_default_0.isEnabled() then
            v132 = true;
        end;
    elseif not v78 or v127 and v82 and not v83 then
        if l_default_0.isEnabled() and l_default_0:getShowAddFriendsOnChatTabNilState() and v78 then
            v131 = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v88.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if v16() then v88.Tokens.Global.Color.None.Transparency else v88.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                NoFriendsView = v4.createElement(l_NoFriendsView_0, {
                    pageRenderReport = function() --[[ Line: 349 ]] --[[ Name: pageRenderReport ]]
                        -- upvalues: v110 (copy), v47 (ref), v48 (ref)
                        if v110 then
                            v110.fireAnalyticsEvent(v47.ChatEmptyStateScreenRendered, {
                                emptyStateType = v48.NoFriendsView
                            });
                        end;
                    end, 
                    openAddFriendsPage = function() --[[ Line: 356 ]] --[[ Name: openAddFriendsPage ]]
                        -- upvalues: v110 (copy), v47 (ref), v76 (copy)
                        if v110 then
                            v110.fireAnalyticsEvent(v47.ChatAddFriendsBtnClicked);
                        end;
                        v76.navigateToAddFriends();
                    end, 
                    noFriendsHeaderKey = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
                    noFriendsTextLabelKey = "Feature.Friends.Text.NoFriends", 
                    addFriendsBtnLabelKey = v57, 
                    addFriendsBtnEnabled = v134[v66.AddFriends]
                })
            });
            v132 = true;
        else
            v131 = if v61() then v4.createElement(v14, {
                chatEnabled = v78, 
                privacySettingsEnabled = v80, 
                globalRulesEnabled = v81, 
                canNavigateToPrivacySettings = v134[v66.PrivacySettings], 
                canNavigateToAddFriends = v134[v66.AddFriends], 
                onCallToAction = function(v136) --[[ Line: 378 ]] --[[ Name: onCallToAction ]]
                    -- upvalues: v76 (copy), v110 (copy), v47 (ref)
                    if v136 == "privacy" then
                        v76.navigateToPrivacy();
                        return;
                    else
                        if v136 == "friends" then
                            if v110 then
                                v110.fireAnalyticsEvent(v47.ChatAddFriendsBtnClicked);
                            end;
                            v76.navigateToAddFriends();
                        end;
                        return;
                    end;
                end, 
                fireRenderEvent = l_default_0.isEnabled() and function(v137) --[[ Line: 389 ]]
                    -- upvalues: v60 (ref), v48 (ref), v110 (copy), v47 (ref)
                    local v138 = nil;
                    v138 = if v60 then if v137 == "friends" then v48.NoFriendsView else if v137 == "privacy" then v48.ChatSettingsDisabledView else if v137 == "regional" then v48.ChatUnavailableRegionView else v48.EmptyConversationList else if v137 == "friends" then v48.NoFriendsView else v48.EmptyConversationList;
                    if v110 then
                        v110.fireAnalyticsEvent(v47.ChatEmptyStateScreenRendered, {
                            emptyStateType = v138
                        });
                    end;
                end or nil
            }) else v4.createElement(v13, {
                chatEnabled = v78, 
                privacyButtonEnabled = v134[v66.PrivacySettings], 
                navigateToPrivacy = v76.navigateToPrivacy, 
                fireRenderEvent = l_default_0.isEnabled() and function() --[[ Line: 416 ]]
                    -- upvalues: v110 (copy), v47 (ref), v48 (ref)
                    if v110 then
                        v110.fireAnalyticsEvent(v47.ChatEmptyStateScreenRendered, {
                            emptyStateType = v48.EmptyConversationList
                        });
                    end;
                end or nil
            });
        end;
    else
        local v139 = ("conversationListWithTopBar%*"):format(v76.filterText);
        v132 = true;
        v133 = true;
        v131 = v4.createElement(v11, v3.Dictionary.join(v76, {
            filterText = v76.isShowingFilterBox and v76.filterText or nil, 
            key = v139, 
            itemList = v107, 
            appLoaded = v82, 
            localUserId = v86, 
            conversationsIsFetching = v83, 
            oldestConversationIsFetched = v85, 
            entryHeight = 64, 
            isInExperience = v111, 
            shouldShowPhoneVerificationUpsell = v112, 
            shouldShowUnfilteredAccessFtux = v113, 
            shouldShowPartyUpsellFtux = v114, 
            dismissUnfilteredThreadsFtux = v115, 
            showGroupsLink = v134[v66.Groups]
        }));
    end;
    if l_default_0.isEnabled() and v51() and l_IsVRAppBuild_0() then
        v132 = true;
    end;
    local v140 = v87.getScreenProps("setScreenTopBar", function() --[[ Line: 465 ]]

    end);
    if v58 then
        l_useEffect_0(function() --[[ Line: 468 ]]
            -- upvalues: v111 (copy), v140 (copy), v66 (ref), v133 (ref)
            if v111 then
                v140(v66.ChatLanding, {
                    rightHidden = not v133
                });
            end;
        end, {
            v133, 
            v140, 
            v111
        });
    end;
    local v141 = nil;
    local v142 = not v132 and v134[v66.Groups];
    v141 = if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() and v142 then v4.createElement(v4.Fragment, nil, {
        groupsLink = v4.createElement(v10, {
            entryHeight = 64
        }), 
        chatFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -64), 
            Position = UDim2.new(0, 0, 0, 64), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            chatContainer = v131
        })
    }) else v131;
    local v143 = v27();
    v4.useEffect(function() --[[ Line: 506 ]]
        -- upvalues: v143 (copy), v110 (copy), v47 (ref), v78 (copy), v130 (copy)
        if v143 and v110 then
            v110.fireAnalyticsEvent(v47.AppChatVisible, {
                isChatEnabled = v78, 
                isChatLoading = v130
            });
        end;
    end, l_dependencyArray_0(v143, v130));
    if v53() then
        return v4.createElement(l_HorizontalPageMargin_0, {
            backgroundColor3 = v88.Theme.BackgroundDefault.Color
        }, {
            chatContainerWithGroupsLink = v141
        });
    else
        return v141;
    end;
end;
return l_compose_0(v5.connect(nil, v15), l_RoactPaginator_0.connect(function() --[[ Line: 529 ]]
    return {
        pageSize = 30
    };
end))(ChatLandingContainer);