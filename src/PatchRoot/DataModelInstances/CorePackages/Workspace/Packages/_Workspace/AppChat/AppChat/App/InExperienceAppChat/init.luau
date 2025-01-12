local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ApolloProvider_0 = require(l_Parent_0.ApolloClient).ApolloProvider;
local _ = require(l_Parent_0.ApolloClient);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Responsive);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.UserLib);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Constants_0 = v7.App.Style.Constants;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_Parent_0.SocialPolicies).ChatPolicies;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v16 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v17 = require(l_script_FirstAncestor_0.App.InExperienceAppChatContainer);
local v18 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllFriendsAsync);
local l_GetLocalUser_0 = v8.Thunks.GetLocalUser;
local l_LayerCollectorProvider_0 = v7.Core.Layout.LayerCollector.LayerCollectorProvider;
local v21 = require(l_script_FirstAncestor_0.App.AppChatToastManagerInExp);
local v22 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatNotificationEventReceiver);
local v23 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatPersistentEventReceivers);
local v24 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVisible);
local v25 = require(l_script_FirstAncestor_0.App.Hooks.usePreventExperienceControls);
local v26 = require(l_script_FirstAncestor_0.Hooks.useAppChatUpdateSession);
local v27 = require(l_Parent_0.Style);
local l_UiModeStyleProvider_0 = v27.UiModeStyleProvider;
local l_DesignTokenProvider_0 = v27.DesignTokenProvider;
local v30 = require(l_Parent_0.SquadsCore);
local l_SquadEventReceiver_0 = v30.SquadEventReceiver;
local l_SquadOverlay_0 = v30.SquadOverlay;
local v33 = require(l_script_FirstAncestor_0.App.Hooks.useParentContainerVisibilitySignal);
local v34 = require(l_script_FirstAncestor_0.App.InExperienceAppChatExperimentation);
local v35 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local v36 = game:DefineFastFlag("AppChatMoveDispatchLocalUser", false);
local v37 = game:DefineFastFlag("DebugAppChatDisplayOnJoin", false);
local v38 = game:DefineFastInt("AppChatInExperienceDisplayOrder", 5);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_GetFFlagHidePartyInviteToastsU13_0 = require(l_Parent_0.SharedFlags).GetFFlagHidePartyInviteToastsU13;
local l_getFFlagAppChatCorescriptsToastsEnabled_0 = require(l_script_FirstAncestor_0.Flags).getFFlagAppChatCorescriptsToastsEnabled;
local v43 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMoveApolloProvider);
local l_getFFlagAppChatPersistentEventReceivers_0 = require(l_script_FirstAncestor_0.Flags).getFFlagAppChatPersistentEventReceivers;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
InExperienceAppChat = function(v46) --[[ Line: 74 ]] --[[ Name: InExperienceAppChat ]]
    -- upvalues: v5 (copy), l_useDispatch_0 (copy), v24 (copy), v37 (copy), v35 (copy), v33 (copy), v26 (copy), v25 (copy), v16 (copy), v18 (copy), v36 (copy), l_GetLocalUser_0 (copy), l_getFFlagAppChatCorescriptsToastsEnabled_0 (copy), v34 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_useSelector_0 (copy), l_GetFFlagHidePartyInviteToastsU13_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_SquadEventReceiver_0 (copy), l_getFFlagAppChatPersistentEventReceivers_0 (copy), v23 (copy), v22 (copy), v21 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), l_DesignTokenProvider_0 (copy), l_SquadOverlay_0 (copy), v38 (copy), l_LayerCollectorProvider_0 (copy), v6 (copy), v43 (copy), l_RoactServices_0 (copy), l_AppSessionService_0 (copy), l_SessionService_0 (copy), v17 (copy), l_ApolloProvider_0 (copy)
    local v47 = v5.useRef(nil);
    local v48 = l_useDispatch_0();
    local v49, v50 = v24(v37);
    local l_showParentContainer_0 = v5.useContext(v35).showParentContainer;
    local l_updateCurrentSquadId_0 = v5.useContext(v35).updateCurrentSquadId;
    local v53, v54 = v5.useState("");
    v33();
    v26(v49);
    v25(v49);
    v5.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v49 (copy), v48 (copy), v16 (ref), v18 (ref), v36 (ref), l_GetLocalUser_0 (ref)
        if v49 then
            v48(v16(true));
            v48(v18(true));
            if not v36 then
                v48(l_GetLocalUser_0());
            end;
        end;
    end, {
        v48, 
        v49
    });
    if v36 then
        v5.useEffect(function() --[[ Line: 97 ]]
            -- upvalues: v48 (copy), l_GetLocalUser_0 (ref)
            v48(l_GetLocalUser_0());
        end, {
            v48
        });
    end;
    local v55 = l_getFFlagAppChatCorescriptsToastsEnabled_0() and v34.default.variant.ShowPlatformChatNotifications;
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        local v58 = l_useSelector_0(function(v56) --[[ Line: 108 ]]
            local v57 = v56.Squad and v56.Squad.Squad and v56.Squad.Squad.currentSquad;
            if v57 and v57.squadId then
                return v57.squadId;
            else
                return "";
            end;
        end);
        local l_v58_0 = v58 --[[ copy: 10 -> 11 ]];
        v5.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: l_updateCurrentSquadId_0 (copy), l_v58_0 (copy)
            l_updateCurrentSquadId_0(l_v58_0);
        end, {
            v58, 
            l_updateCurrentSquadId_0
        });
    end;
    local v61 = if l_GetFFlagLuaAppEnableSquadPage_0() then l_useSelector_0(function(v60) --[[ Line: 119 ]]
        return v60.Squad.SquadPrompt.arguments;
    end) else nil;
    return (v5.createElement(v5.Fragment, {}, {
        SquadEventReceiver = if l_GetFFlagLuaAppEnableSquadPage_0() and l_GetFFlagHidePartyInviteToastsU13_0() then v5.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0
            }
        }, v5.createElement(l_SquadEventReceiver_0)) else if l_GetFFlagLuaAppEnableSquadPage_0() then v5.createElement(l_SquadEventReceiver_0) else nil, 
        AppChatPersistentEventReceivers = if l_getFFlagAppChatPersistentEventReceivers_0() then v5.createElement(v23) else nil, 
        AppChatNotificationEventReceiver = if not l_getFFlagAppChatPersistentEventReceivers_0() then v5.createElement(v22) else nil, 
        AppChatToastManagerInExp = if v55 then v5.createElement(v21, {
            hideAllChatToasts = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then nil else v49, 
            isAppChatVisible = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v49 else nil, 
            navigateToChat = function(v62) --[[ Line: 151 ]] --[[ Name: navigateToChat ]]
                -- upvalues: l_showParentContainer_0 (copy), v54 (copy)
                l_showParentContainer_0();
                v54(v62);
            end
        }) else nil, 
        AppChatContainer = v5.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            v5.createElement(l_DesignTokenProvider_0, {
                tokenMappers = {}
            }, {
                SquadOverlay = if l_GetFFlagLuaAppEnableSquadPage_0() and v61 and v61.promptType then v5.createElement(l_SquadOverlay_0) else nil, 
                AppChat = if v49 then v5.createElement("ScreenGui", {
                    ResetOnSpawn = false, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets, 
                    DisplayOrder = v38, 
                    ref = v47
                }, {
                    LayerCollectorProvider = v5.createElement(l_LayerCollectorProvider_0, {}, {
                        containerRef = v5.createElement(v6.ContainerRef.Provider, {
                            value = v47
                        }, {
                            v5.createElement(l_RoactAppPolicy_0.Provider, {
                                policy = {
                                    l_AppFeaturePolicies_0, 
                                    l_ChatPolicies_0
                                }
                            }, if v43() then v5.createElement(l_RoactServices_0.ServiceProvider, {
                                services = {
                                    [l_AppSessionService_0] = l_SessionService_0
                                }
                            }, {
                                InExperienceAppChatContainer = v5.createElement(v17, {
                                    hideAppChat = v50, 
                                    initialConversationId = v53, 
                                    setInitialConversationId = v54
                                })
                            }) else v5.createElement(l_ApolloProvider_0, {
                                client = v46.apolloClient
                            }, {
                                v5.createElement(l_RoactServices_0.ServiceProvider, {
                                    services = {
                                        [l_AppSessionService_0] = l_SessionService_0
                                    }
                                }, {
                                    InExperienceAppChatContainer = v5.createElement(v17, {
                                        hideAppChat = v50, 
                                        initialConversationId = v53, 
                                        setInitialConversationId = v54
                                    })
                                })
                            }))
                        })
                    })
                }) else nil
            })
        })
    }));
end;
return InExperienceAppChat;