local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v11 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useState_0 = v4.useState;
local v15 = require(l_script_FirstAncestor_0.Hooks.useUnfilteredThreadsConversationBanner);
local v16 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v19 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_UnfilteredThreadsConversationBanner_0 = v19.Constants.UnfilteredThreadsConversationBanner;
local v22 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v25 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v26 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v27 = require(script.Parent.PartialModal);
local v28 = {
    conversationId = "", 
    onDismissed = function() --[[ Line: 48 ]] --[[ Name: onDismissed ]]

    end, 
    navigateToCreateUnfilteredChat = function() --[[ Line: 49 ]] --[[ Name: navigateToCreateUnfilteredChat ]]

    end, 
    titleKey = "Feature.Chat.Heading.UnlockRichCommunication", 
    bodyKey = "Feature.Chat.Description.PhoneVerificationDialog", 
    actionKey = "Feature.Chat.Action.AddPhoneNumber"
};
return l_memo_0(function(v29) --[[ Line: 56 ]] --[[ Name: PhoneVerificationPartialModalContainer ]]
    -- upvalues: v3 (copy), v28 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_useDispatch_0 (copy), v11 (copy), l_useState_0 (copy), v6 (copy), v15 (copy), l_useEffectOnMount_0 (copy), v22 (copy), l_useEffect_0 (copy), v16 (copy), l_UnfilteredThreadsConversationBanner_0 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v26 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v25 (copy), l_useLocalization_0 (copy), v4 (copy), v27 (copy)
    local v30 = v3.Dictionary.union(v28, v29);
    local v31 = l_useStyle_0();
    local v32 = l_useScreenSize_0();
    local v33 = l_useDispatch_0();
    local v34 = v11(v30.conversationId);
    local v35, v36 = l_useState_0(false);
    local v37 = v6();
    local v38 = v15(v30.conversationId);
    l_useEffectOnMount_0(function() --[[ Line: 66 ]]
        -- upvalues: v37 (copy), v22 (ref), v30 (copy)
        if v37 then
            v37.fireAnalyticsEvent(v22.ConversationPvDialogRendered, {
                conversationId = v30.conversationId
            });
        end;
    end);
    l_useEffect_0(function() --[[ Line: 75 ]]
        -- upvalues: v34 (copy), v16 (ref), v30 (copy), v38 (copy), l_UnfilteredThreadsConversationBanner_0 (ref)
        if v34 and v34.moderationType == v16.ModerationType.TrustedComms then
            v30.onDismissed();
        end;
        if v38 ~= l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_ONE_TO_ONE and v38 ~= l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_GROUP then
            if v38 == l_UnfilteredThreadsConversationBanner_0.DUPLICATE_UPGRADE then
                v30.navigateToCreateUnfilteredChat();
                return;
            else
                v30.onDismissed();
            end;
        end;
    end, {
        v34, 
        v30.navigateToCreateUnfilteredChat, 
        v30.onDismissed, 
        v38
    });
    local v41 = l_useCallback_0(function() --[[ Line: 95 ]]
        -- upvalues: v37 (copy), v22 (ref), v30 (copy), v36 (copy), v33 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v26 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v25 (ref)
        if v37 then
            v37.fireAnalyticsEvent(v22.ConversationPvDialogActionClicked, {
                conversationId = v30.conversationId
            });
        end;
        v36(true);
        v33(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v26, 
                completionCallback = function(v39, _) --[[ Line: 106 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v33 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v37 (ref), v22 (ref), v30 (ref), v25 (ref), v36 (ref)
                    v33(l_NavigateBack_0(true));
                    if v39 == l_AccessResponseEnum_0.Granted then
                        if v37 then
                            v37.fireAnalyticsEvent(v22.ConversationPvDialogSucceeded, {
                                conversationId = v30.conversationId
                            });
                        end;
                        v33(v25(v30.conversationId));
                        return;
                    else
                        if v37 then
                            v37.fireAnalyticsEvent(v22.ConversationPvDialogFailed, {
                                conversationId = v30.conversationId
                            });
                        end;
                        v36(false);
                        return;
                    end;
                end
            }
        }));
    end, {
        v33, 
        v36, 
        v37, 
        v30.conversationId
    });
    local v42 = l_useCallback_0(function() --[[ Line: 130 ]]
        -- upvalues: v37 (copy), v22 (ref), v30 (copy)
        if v37 then
            v37.fireAnalyticsEvent(v22.ConversationPvDialogDismissed, {
                conversationId = v30.conversationId
            });
        end;
        v30.onDismissed();
    end, {
        v37, 
        v30.conversationId, 
        v30.onDismissed
    });
    local v43 = l_useLocalization_0({
        titleKey = v30.titleKey, 
        bodyKey = v30.bodyKey, 
        actionKey = v30.actionKey
    });
    return v4.createElement(v27, {
        titleText = v43.titleKey, 
        bodyText = v43.bodyKey, 
        actionText = v43.actionKey, 
        screenSize = v32, 
        isButtonDisabled = v35, 
        onActivated = v41, 
        onDismissed = v42, 
        style = v31
    });
end);