local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_Parent_0.SharedFlags);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v7 = require(l_script_FirstAncestor_0.Logger);
local v8 = require(l_script_FirstAncestor_0.getRoactChatStackNavigator);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v10 = nil;
local v11 = nil;
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires);
local v13 = l_default_0.isEnabled() and not v12();
if not v13 then
    v10 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
    v11 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
end;
local v14 = require(l_script_FirstAncestor_0.LegacyAnalytics.AnalyticsProvider);
local v15 = require(l_script_FirstAncestor_0.TopBarContext);
local v16 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v17 = require(l_script_FirstAncestor_0.LuaAppNavigationContextProvider);
local v18 = require(l_script_FirstAncestor_0.Analytics.Enums.UnfilteredThreadsEligibilityForAnalytics);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPersistentEventReceivers);
local l_SetTabBarVisible_0 = require(l_Parent_0.AppTabBarRodux).Actions.SetTabBarVisible;
local v21 = require(l_script_FirstAncestor_0.Analytics.RoactChatAnalyticsProvider);
local v22 = require(l_Parent_0.React);
local v23 = require(l_Parent_0.RoactNavigation);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v22.memo;
local v27 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_useCallback_0 = v22.useCallback;
local v29 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useCurrentSquadParentChannelId_0 = require(l_Parent_0.SquadsCore).Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v22.useEffect;
local l_useIsVoiceConnected_0 = require(l_Parent_0.CrossExperienceVoice).Hooks.useIsVoiceConnected;
local l_useRef_0 = v22.useRef;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v22.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v38 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v40 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v41 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v42 = require(l_script_FirstAncestor_0.Conversations.Thunks.getUnfilteredThreadsEligibility);
local v43 = require(script.Parent.EnumScreens);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossExpVoice;
local v46 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v47 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v48 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableStandaloneAppChat);
local v49 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatInExpStopCachingWideMode);
local v50 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v51 = require(l_script_FirstAncestor_0.Utils.getNeedsPhoneVerificationUnfilteredThreads);
local v52 = require(l_script_FirstAncestor_0.Flags.getFFlagHideNotificationIconForVR);
local v53 = require(l_script_FirstAncestor_0.Flags.getFFlagFixChatsBottomInsetBackgroundColor);
local l_getFFlagAppChatCorescriptsToastsEnabled_0 = require(l_script_FirstAncestor_0.Flags).getFFlagAppChatCorescriptsToastsEnabled;
local v55 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableAppChatInExperience_0 = v5.GetFFlagEnableAppChatInExperience;
local v57 = require(l_script_FirstAncestor_0.App.InExperienceAppChatExperimentation);
local v58 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableConversationTitleWithFacePile);
local l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 = v5.GetFFlagAppChatInExperienceRenameToRobloxChat;
local v60 = require(l_script_FirstAncestor_0.Constants);
local v61 = if v58() then v60.NAV_BAR_WITH_FACEPILE_SIZE else v60.NEW_NAV_BAR_SIZE;
local v63 = {
    logger = l_Logger_0, 
    navigateToLuaAppPages = nil, 
    parameters = nil, 
    rnBypassActionSignal = nil, 
    setActiveConversationId = nil, 
    setBackButtonEnabled = nil, 
    setTabBarVisible = function() --[[ Line: 119 ]] --[[ Name: setTabBarVisible ]]

    end, 
    setInitialConversationId = function(_) --[[ Line: 120 ]] --[[ Name: setInitialConversationId ]]

    end, 
    wideMode = false, 
    notificationCount = 0, 
    navigateToRootStack = nil, 
    androidBackButtonSignal = nil, 
    initialConversationId = "", 
    chatPlacement = v16.Enum.Unknown
};
AppChatEntryPoint = function(v64) --[[ Line: 133 ]] --[[ Name: AppChatEntryPoint ]]
    -- upvalues: v3 (copy), v63 (copy), v16 (copy), v13 (copy), v10 (ref), l_script_FirstAncestor_0 (copy), v11 (ref), l_useSelector_0 (copy), l_useCallback_0 (copy), v18 (copy), v51 (copy), l_useDispatch_0 (copy), v19 (copy), v48 (copy), v50 (copy), l_dependencyArray_0 (copy), l_useEffect_0 (copy), v42 (copy), v29 (copy), l_useState_0 (copy), v22 (copy), v23 (copy), v8 (copy), v49 (copy), l_useRef_0 (copy), v7 (copy), v43 (copy), v40 (copy), v41 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), v2 (copy), v46 (copy), l_getFFlagAppChatCorescriptsToastsEnabled_0 (copy), v47 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), v27 (copy), v52 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v57 (copy), l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 (copy), l_useStyle_0 (copy), l_default_0 (copy), l_SetTabBarVisible_0 (copy), l_UserInputService_0 (copy), v61 (copy), v17 (copy), v55 (copy), v38 (copy), l_LayerCollectorProvider_0 (copy), v14 (copy), v15 (copy), v53 (copy), v21 (copy)
    local v65 = v3.Dictionary.join(v63, v64);
    local v66 = v16.isPlacementInExperience(v65.chatPlacement);
    if v13 then
        v10 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
        v11 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
    end;
    local v68 = l_useSelector_0(l_useCallback_0(function(v67) --[[ Line: 144 ]]
        return v67.LocalUserId;
    end, {})) or v65.localUserId;
    local v70 = l_useSelector_0(l_useCallback_0(function(v69) --[[ Line: 147 ]]
        return v69.GlobalGuiInset;
    end, {})) or {
        bottom = 0
    };
    local v72 = l_useSelector_0(l_useCallback_0(function(v71) --[[ Line: 150 ]]
        return v71.ChatAppReducer.LastEntryPoint;
    end, {}));
    local v75 = l_useSelector_0(l_useCallback_0(function(v73) --[[ Line: 153 ]]
        -- upvalues: v18 (ref), v51 (ref)
        local v74 = v73.ChatAppReducer.UnfilteredThreads and v73.ChatAppReducer.UnfilteredThreads.eligibility or {};
        if v74.isFullyEligible then
            return v18.FullyEligible;
        elseif v51(v74) then
            return v18.NeedsPhoneVerification;
        else
            return v18.Ineligible;
        end;
    end, {}));
    local v76 = l_useDispatch_0();
    if not v19() and v48() then
        local v77 = l_useCallback_0(function() --[[ Line: 169 ]]
            -- upvalues: v76 (copy), v50 (ref)
            v76(v50());
        end, l_dependencyArray_0(v76));
        local l_v77_0 = v77 --[[ copy: 8 -> 38 ]];
        l_useEffect_0(function() --[[ Line: 173 ]]
            -- upvalues: l_v77_0 (copy)
            l_v77_0();
        end, l_dependencyArray_0(v77));
    end;
    l_useEffect_0(function() --[[ Line: 178 ]]
        -- upvalues: v76 (copy), v42 (ref), v66 (copy)
        v76(v42(v66));
    end, l_dependencyArray_0(v76, v68, v66));
    local v79 = v29();
    local v80, v81 = l_useState_0({});
    local v82 = v22.useMemo(function() --[[ Line: 187 ]]
        -- upvalues: v23 (ref), v8 (ref), v65 (copy), v11 (ref), v10 (ref)
        return v23.createAppContainer(v8(v65.wideMode and v11 or v10, v65.navigateToRootStack, v65.androidBackButtonSignal, v65.androidBackButtonConnection));
    end, l_dependencyArray_0(v65.wideMode, v11, v10, v65.navigateToRootStack, v65.androidBackButtonSignal, v65.androidBackButtonConnection));
    local v83 = if v49() and v66 then v82 else l_useRef_0(v23.createAppContainer(v8(v65.wideMode and v11 or v10, v65.navigateToRootStack, v65.androidBackButtonSignal, v65.androidBackButtonConnection)));
    local v84 = l_useRef_0(false);
    local v85 = l_useRef_0(nil);
    local v86 = l_useRef_0(function(...) --[[ Line: 222 ]]

    end);
    l_useEffect_0(function() --[[ Line: 224 ]]
        -- upvalues: v65 (copy), v7 (ref)
        if v65.logger then
            v7:setParent(v65.logger);
        end;
    end, l_dependencyArray_0(v65.logger));
    local v88 = l_useCallback_0(function(v87) --[[ Line: 230 ]]
        -- upvalues: v84 (copy), v86 (copy)
        if not v84.current then
            return;
        else
            if v86.current then
                v86.current(v87);
            end;
            return;
        end;
    end, l_dependencyArray_0(v84, v86));
    local v90 = l_useCallback_0(function(v89) --[[ Line: 240 ]]
        -- upvalues: v23 (ref), v43 (ref)
        return v23.Actions.navigate({
            routeName = v43.ChatConversation, 
            params = {
                conversationId = v89
            }
        });
    end, {});
    local v93 = l_useCallback_0(function(v91) --[[ Line: 248 ]]
        -- upvalues: v23 (ref), v43 (ref), v65 (copy)
        local v92 = {
            v23.Actions.navigate({
                routeName = v43.ChatConversation, 
                params = {
                    conversationId = v91
                }
            }), 
            v23.Actions.navigate({
                routeName = v43.SquadLobby, 
                params = {
                    conversationId = v91
                }
            })
        };
        if v65.wideMode then
            return v23.Actions.navigate({
                routeName = v43.ChatLanding, 
                params = {
                    conversationId = v91
                }, 
                action = v23.StackActions.reset({
                    index = 2, 
                    actions = v92
                })
            });
        else
            table.insert(v92, 1, v23.Actions.navigate({
                routeName = v43.ChatLanding
            }));
            return v23.Actions.navigate({
                routeName = v43.ChatLandingStack, 
                params = {
                    conversationId = v91
                }, 
                action = v23.StackActions.reset({
                    index = 3, 
                    actions = v92
                })
            });
        end;
    end, {
        v65.wideMode
    });
    local v95 = l_useCallback_0(function(v94) --[[ Line: 294 ]]
        -- upvalues: v76 (copy), v40 (ref)
        return v76(v40("one_to_one", {
            v94
        }));
    end, l_dependencyArray_0(v76));
    local v97 = l_useCallback_0(function(v96) --[[ Line: 298 ]]
        -- upvalues: v76 (copy), v41 (ref)
        return v76(v41(v96));
    end, l_dependencyArray_0(v76));
    local v109 = l_useCallback_0(function(v98) --[[ Line: 302 ]]
        -- upvalues: v86 (copy), v65 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (ref), v93 (copy), v43 (ref), v97 (copy), v7 (ref), v90 (copy), v95 (copy), v23 (ref)
        v86.current = v98;
        if not v65.updateExternalNavigationForScreen then
            return function() --[[ Line: 305 ]]
                -- upvalues: v86 (ref)
                v86.current = nil;
            end;
        else
            local l_updateExternalNavigationForScreen_0 = v65.updateExternalNavigationForScreen;
            if l_GetFFlagLuaAppEnableSquadPage_0() then
                l_updateExternalNavigationForScreen_0(function(v100) --[[ Line: 312 ]]
                    -- upvalues: v98 (copy), v93 (ref)
                    local l_conversationId_0 = v100.conversationId;
                    v98(v93(l_conversationId_0));
                end, v43.SquadLobby);
            end;
            l_updateExternalNavigationForScreen_0(function(v102) --[[ Line: 318 ]]
                -- upvalues: v97 (ref), v7 (ref), v98 (copy), v90 (ref), v95 (ref)
                local v103 = v102 and v102.conversationId;
                if v103 then
                    v97(v103):andThen(function() --[[ Line: 323 ]]
                        -- upvalues: v7 (ref), v103 (copy), v98 (ref), v90 (ref)
                        v7:info("Successfully fetched conversation details for conversationId {} for external navigation", v103);
                        v98(v90(v103));
                    end):catch(function(v104) --[[ Line: 330 ]]
                        -- upvalues: v7 (ref)
                        v7:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v104)));
                    end);
                    return;
                else
                    local v105 = v102 and v102.userId;
                    if not v105 then
                        return;
                    else
                        spawn(function() --[[ Line: 345 ]]
                            -- upvalues: v95 (ref), v105 (copy), v7 (ref), v98 (ref), v90 (ref)
                            v95(v105):andThen(function(v106) --[[ Line: 347 ]]
                                -- upvalues: v7 (ref), v105 (ref), v98 (ref), v90 (ref)
                                v7:info("Successfully fetched conversation details for userId {} for external navigation", v105);
                                v98(v90(v106.id));
                            end):catch(function(v107) --[[ Line: 354 ]]
                                -- upvalues: v7 (ref)
                                v7:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(v107)));
                            end);
                        end);
                        return;
                    end;
                end;
            end, v43.ChatConversation);
            l_updateExternalNavigationForScreen_0(function(v108) --[[ Line: 364 ]]
                -- upvalues: v98 (copy), v23 (ref), v43 (ref), v65 (ref)
                v98(v23.Actions.navigate({
                    routeName = v43.ChatLanding, 
                    params = v108
                }));
                if v65.wideMode then
                    v98(v23.Actions.navigate({
                        routeName = v43.EmptyConversation
                    }));
                end;
            end, v43.ChatLanding);
            return function() --[[ Line: 376 ]]
                -- upvalues: l_updateExternalNavigationForScreen_0 (copy), v43 (ref), l_GetFFlagLuaAppEnableSquadPage_0 (ref), v86 (ref)
                l_updateExternalNavigationForScreen_0(nil, v43.ChatLanding);
                l_updateExternalNavigationForScreen_0(nil, v43.ChatConversation);
                if l_GetFFlagLuaAppEnableSquadPage_0() then
                    l_updateExternalNavigationForScreen_0(nil, v43.SquadLobby);
                end;
                v86.current = nil;
            end;
        end;
    end, l_dependencyArray_0(v86));
    local v111 = l_useCallback_0(function(v110) --[[ Line: 387 ]]
        -- upvalues: v2 (ref), v80 (copy)
        v2.isType(v110, "string", "screen");
        return v80[v110] or {};
    end, l_dependencyArray_0(v80));
    local v116 = l_useCallback_0(function(v112, v113) --[[ Line: 393 ]]
        -- upvalues: v2 (ref), v81 (copy), v3 (ref)
        v2.isType(v112, "string", "screen");
        v2.isType(v113, "table", "state");
        v81(function(v114) --[[ Line: 397 ]]
            -- upvalues: v3 (ref), v112 (copy), v113 (copy)
            local v115 = v3.Dictionary.join(v114[v112] or {}, v113);
            return v3.Dictionary.join(v114, {
                [v112] = v115
            });
        end);
    end, {});
    local v118 = l_useCallback_0(function(v117) --[[ Line: 405 ]]
        -- upvalues: v85 (copy), v88 (copy)
        if v85.current then
            v85.current:disconnect();
            v85.current = nil;
        end;
        if v117 then
            v85.current = v117:connect(v88);
        end;
    end, l_dependencyArray_0(v85));
    l_useEffect_0(function() --[[ Line: 416 ]]
        -- upvalues: v84 (copy), v118 (copy), v65 (copy), v76 (copy), v46 (ref)
        v84.current = true;
        v118(v65.rnBypassActionSignal);
        return function() --[[ Line: 420 ]]
            -- upvalues: v84 (ref), v118 (ref), v76 (ref), v46 (ref)
            v84.current = false;
            v118(nil);
            v76(v46());
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 428 ]]
        -- upvalues: l_getFFlagAppChatCorescriptsToastsEnabled_0 (ref), v65 (copy), v66 (copy), v76 (copy), v47 (ref), v43 (ref), v68 (copy)
        if l_getFFlagAppChatCorescriptsToastsEnabled_0() and v65.initialConversationId and v65.initialConversationId ~= "" and v66 then
            v76(v47({
                screen = v43.ChatConversation, 
                params = {
                    userId = v68, 
                    conversationId = v65.initialConversationId
                }
            }));
            v65.setInitialConversationId("");
        end;
        return function() --[[ Line: 442 ]]

        end;
    end, l_dependencyArray_0(v76, v68, v65.initialConversationId, v65.setInitialConversationId));
    local v119 = nil;
    local v120 = nil;
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        v119 = l_useCurrentSquadParentChannelId_0();
        if l_GetFFlagEnableCrossExpVoice_0() then
            v120 = l_useIsVoiceConnected_0();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 454 ]]
        -- upvalues: l_GetFFlagLuaAppEnableSquadPage_0 (ref), v66 (copy), v65 (copy), v119 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v120 (ref), v76 (copy), v47 (ref), v43 (ref), v68 (copy)
        if l_GetFFlagLuaAppEnableSquadPage_0() and v66 and v65.initialConversationId == "" and v119 then
            if l_GetFFlagEnableCrossExpVoice_0() and v120 then
                v76(v47({
                    screen = v43.SquadLobby, 
                    params = {
                        userId = v68, 
                        conversationId = v119
                    }
                }));
                return;
            else
                v76(v47({
                    screen = v43.ChatConversation, 
                    params = {
                        userId = v68, 
                        conversationId = v119
                    }
                }));
            end;
        end;
    end, l_dependencyArray_0());
    l_useEffect_0(function() --[[ Line: 475 ]]
        -- upvalues: v118 (copy), v65 (copy)
        v118(v65.rnBypassActionSignal);
    end, l_dependencyArray_0(v65.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 479 ]]
        -- upvalues: v3 (ref), v80 (copy), v81 (copy)
        if not v3.isEmpty(v80) then
            v81({});
        end;
    end, l_dependencyArray_0(v65.wideMode));
    local v122 = v27(function(v121) --[[ Line: 485 ]]
        return v121.getChatHeaderSearch();
    end);
    local v124 = v27(function(v123) --[[ Line: 488 ]]
        return v123.getChatHeaderCreateChatGroup();
    end);
    local v126 = v27(function(v125) --[[ Line: 491 ]]
        -- upvalues: v52 (ref)
        return v125.getChatHeaderNotifications() and (not v52() or v125.getWebViewSupport());
    end);
    local v127 = not v66 and v126;
    local v128 = v122 and not v66;
    local v129 = l_getFFlagAppChatCorescriptsToastsEnabled_0() and v66 and l_GetFFlagEnableAppChatInExperience_0() and v57.default.variant.ShowPlatformChatNotifications;
    local v130 = if v66 then not l_GetFFlagAppChatInExperienceRenameToRobloxChat_0() else l_GetFFlagEnableAppChatInExperience_0() and v57.default.variant.ShowPlatformChatNewTitleInUniversalApp;
    local v131 = l_useStyle_0();
    local v132 = nil;
    if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then
        v132 = l_useCallback_0(function(v133) --[[ Line: 519 ]]
            -- upvalues: v76 (copy), l_SetTabBarVisible_0 (ref)
            v76(l_SetTabBarVisible_0(v133));
        end, l_dependencyArray_0(v76));
    end;
    local v134 = v22.createElement(if v49() and v66 then v83 else v83.current, {
        externalDispatchConnector = v109, 
        parameters = v65.parameters, 
        setActiveConversationId = v65.setActiveConversationId, 
        setBackButtonEnabled = v65.setBackButtonEnabled, 
        setTabBarVisible = if l_default_0.isEnabled() then v132 else v65.setTabBarVisible, 
        chatIsVisible = v79, 
        screenProps = {
            navigateToLuaAppPages = v65.navigateToLuaAppPages, 
            topBarHeight = math.max(l_UserInputService_0.NavBarSize.Y, v61), 
            wideMode = v65.wideMode, 
            isInExperience = v66, 
            isVisible = v65.isVisible, 
            getScreenTopBar = v111, 
            setScreenTopBar = v116, 
            notificationCount = v65.notificationCount, 
            topBarShowSearch = v128, 
            topBarShowCreateChatGroup = v124, 
            topBarShowNotifications = v127, 
            topBarShowSnoozeNotifications = v129, 
            topBarUseConnectHeader = v130, 
            showSearchRow = v66, 
            navigateToRootStack = v65.navigateToRootStack, 
            navigateToAddFriends = if l_default_0.isEnabled() then v65.navigateToAddFriends else nil
        }
    });
    v134 = v22.createElement(v17, {
        navigateToLuaAppPages = v65.navigateToLuaAppPages, 
        dispatch = v76
    }, {
        navigation = v134
    });
    v134 = v22.createElement(v16.Provider, {
        value = {
            chatPlacement = v65.chatPlacement
        }
    }, {
        navigation = v134
    });
    if v55() then
        v134 = v22.createElement(v38, {}, {
            navigation = v134
        });
        if not v66 then
            v134 = v22.createElement(l_LayerCollectorProvider_0, {}, {
                navigation = v134
            });
        end;
    end;
    local v135 = v22.createElement(v14, {
        localUserId = v68, 
        entryPoint = v72
    }, {
        v22.createElement(v15.Provider, {
            value = v3.Dictionary.join(v80, {
                getScreenTopBar = v111, 
                setScreenTopBar = v116
            })
        }, {
            navigation = v134, 
            BottomInsetBackground = if v70.bottom > 0 then v22.createElement("Frame", {
                BackgroundColor3 = if v53() then v131.Theme.BackgroundDefault.Color else v131.Theme.NavigationBar.Color, 
                BackgroundTransparency = if v53() then v131.Theme.BackgroundDefault.Transparency else v131.Theme.NavigationBar.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v70.bottom), 
                ZIndex = 3
            }) else nil
        })
    });
    return v22.createElement(v21, {
        entryPoint = v72, 
        unfilteredThreadsEligibility = v75
    }, {
        v135
    });
end;
return l_memo_0(AppChatEntryPoint);