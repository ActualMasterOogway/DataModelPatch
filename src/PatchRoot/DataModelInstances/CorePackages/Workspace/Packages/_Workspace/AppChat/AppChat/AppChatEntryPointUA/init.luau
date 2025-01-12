local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppBlox);
local v3 = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.AppTabBarRodux);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.Navigation);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.RoactServiceTags);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.SharedFlags);
local v12 = require(l_Parent_0.SocialCommon);
local v13 = require(l_Parent_0.SquadsCore);
local v14 = require(l_Parent_0.UIBlox);
local v15 = require(l_Parent_0.UniversalAppPolicy);
local l_AppNotificationService_0 = v8.AppNotificationService;
local l_FullscreenPageWithSafeArea_0 = v2.FullscreenPageWithSafeArea;
local l_SetTabBarVisibleFromChat_0 = v4.Thunks.SetTabBarVisibleFromChat;
local l_Signal_0 = v3.Signal;
local l_SquadAppChatEventReceiver_0 = v13.SquadAppChatEventReceiver;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useAppPolicy_0 = v15.useAppPolicy;
local l_useCallback_0 = v7.useCallback;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useEarlyIsFocused_0 = v6.useEarlyIsFocused;
local l_useEffect_0 = v7.useEffect;
local l_useIsWideMode_0 = v12.Hooks.useIsWideMode;
local l_useMemo_0 = v7.useMemo;
local l_useNavigation_0 = v6.useNavigation;
local l_useRoactService_0 = v10.useRoactService;
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useState_0 = v7.useState;
local l_useStyle_0 = v14.Core.Style.useStyle;
local v34 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v35 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local v36 = require(l_script_FirstAncestor_0.Components.ExternalNavigationHandler.Container);
local v37 = require(l_script_FirstAncestor_0.Actions.ToggleChatPaused);
local v38 = require(l_script_FirstAncestor_0.Hooks.useExternalNavigationByScreen);
local l_FFlagSquadAppChatRTNFix_0 = v11.FFlagSquadAppChatRTNFix;
local v40 = {};
AppChatEntryPointUA = function(v41) --[[ Line: 60 ]] --[[ Name: AppChatEntryPointUA ]]
    -- upvalues: v5 (copy), v40 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useEarlyIsFocused_0 (copy), l_useIsWideMode_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), l_useState_0 (copy), v38 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), l_useMemo_0 (copy), l_Signal_0 (copy), l_useCallback_0 (copy), l_SetTabBarVisibleFromChat_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v37 (copy), v7 (copy), l_FullscreenPageWithSafeArea_0 (copy), v34 (copy), v36 (copy), v35 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    local v42 = v5.Dictionary.join(v40, v41);
    local v43 = l_useStyle_0();
    local v44 = l_useDispatch_0();
    local v45 = l_useEarlyIsFocused_0();
    local v46 = l_useIsWideMode_0();
    local v47 = l_useNavigation_0();
    local v49 = l_useAppPolicy_0(function(v48) --[[ Line: 68 ]]
        return {
            shouldSystemBarUsuallyBePresent = v48.getShouldSystemBarUsuallyBePresent()
        };
    end);
    local v50, v51 = l_useState_0(0);
    local v52, v53 = v38();
    local v54 = l_useRoactService_0(l_AppNotificationService_0);
    local v55 = l_useMemo_0(function() --[[ Line: 78 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end);
    local v56 = l_useMemo_0(function() --[[ Line: 82 ]]
        -- upvalues: v42 (copy), v54 (copy)
        return v42.RobloxEventReceiver.new(v54);
    end);
    local v58 = l_useCallback_0(function(v57) --[[ Line: 86 ]]
        -- upvalues: v44 (copy), l_SetTabBarVisibleFromChat_0 (ref), v49 (copy)
        v44(l_SetTabBarVisibleFromChat_0(v57 or v49.shouldSystemBarUsuallyBePresent));
    end, l_dependencyArray_0(v44, v49.shouldSystemBarUsuallyBePresent));
    local v59 = l_useMemo_0(function() --[[ Line: 90 ]]
        return {};
    end);
    local v61 = l_useSelector_0(function(v60) --[[ Line: 94 ]]
        return v60.NotificationBadgeCounts.TopBarNotificationIcon;
    end);
    l_useEffect_0(function() --[[ Line: 98 ]]
        -- upvalues: v44 (copy), v37 (ref), v45 (copy)
        v44(v37(not v45));
    end, l_dependencyArray_0(v45, v44));
    return v7.createElement(v7.Fragment, {}, {
        FullscreenPageWithSafeArea = v7.createElement(l_FullscreenPageWithSafeArea_0, {
            BackgroundColor3 = v43.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v43.Theme.BackgroundDefault.Transparency, 
            includeStatusBar = true
        }, {
            AppChatEntryPoint = v7.createElement(v34, {
                setActiveConversationId = v51, 
                updateExternalNavigationForScreen = v53, 
                navigateToLuaAppPages = v59, 
                rnBypassActionSignal = v55, 
                notificationCount = v61, 
                setTabBarVisible = v58, 
                isVisible = v45, 
                wideMode = v46, 
                navigation = v47
            })
        }), 
        ExternalNavigationHandler = v7.createElement(v36, {
            navigationByScreen = v52
        }), 
        ChatEventReceiver = v7.createElement(v35, {
            robloxEventReceiver = v56, 
            rnBypassActionSignal = v55, 
            activeConversationId = tostring(v50)
        }), 
        SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v7.createElement(l_SquadAppChatEventReceiver_0) else nil
    });
end;
return AppChatEntryPointUA;