local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useState_0 = v5.useState;
local v14 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v21 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v22 = require(script.Parent.Parent.ConversationModal.ConversationModal);
local v23 = {
    showNetworkErrorToast = function() --[[ Line: 45 ]] --[[ Name: showNetworkErrorToast ]]

    end, 
    onHeightChanged = function() --[[ Line: 46 ]] --[[ Name: onHeightChanged ]]

    end, 
    bodyKey = "Feature.Chat.Message.PhoneVerificationPendingState", 
    acceptKey = "Feature.Chat.Action.Continue", 
    denyKey = "Feature.Chat.Action.LeaveGroup"
};
PhoneVerificationUpsellContainer = function(v24) --[[ Line: 54 ]] --[[ Name: PhoneVerificationUpsellContainer ]]
    -- upvalues: v4 (copy), v23 (copy), l_useState_0 (copy), l_useLocalUserId_0 (copy), v14 (copy), l_useEffectOnMount_0 (copy), v19 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v21 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v20 (copy), l_useLocalization_0 (copy), v5 (copy), v22 (copy)
    local v25 = v4.Dictionary.join(v23, v24);
    local v26, v27 = l_useState_0(false);
    local v28 = l_useLocalUserId_0();
    local v29 = v14();
    l_useEffectOnMount_0(function() --[[ Line: 60 ]]
        -- upvalues: v29 (copy), v19 (ref), v25 (copy)
        if v29 then
            v29.fireAnalyticsEvent(v19.ConversationPvUpsellRendered, {
                conversationId = v25.conversationId
            });
        end;
    end);
    local v30 = l_useDispatch_0();
    local v33 = l_useCallback_0(function(v31, v32) --[[ Line: 69 ]]
        -- upvalues: v30 (copy), v3 (ref)
        return v30(v3.rodux.RemoveUserFromConversation.API(v32, v31));
    end, l_dependencyArray_0(v30));
    local v36 = l_useCallback_0(function() --[[ Line: 73 ]]
        -- upvalues: v29 (copy), v19 (ref), v25 (copy), v27 (copy), v30 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v21 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v20 (ref)
        if v29 then
            v29.fireAnalyticsEvent(v19.ConversationPvUpsellContinueClicked, {
                conversationId = v25.conversationId
            });
        end;
        v27(true);
        v30(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v21, 
                completionCallback = function(v34, _) --[[ Line: 84 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v30 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v29 (ref), v19 (ref), v25 (ref), v20 (ref), v27 (ref)
                    v30(l_NavigateBack_0(true));
                    if v34 == l_AccessResponseEnum_0.Granted then
                        if v29 then
                            v29.fireAnalyticsEvent(v19.ConversationPvUpsellSucceeded, {
                                conversationId = v25.conversationId
                            });
                        end;
                        v30(v20(v25.conversationId));
                        return;
                    else
                        if v29 then
                            v29.fireAnalyticsEvent(v19.ConversationPvUpsellFailed, {
                                conversationId = v25.conversationId
                            });
                        end;
                        v27(false);
                        return;
                    end;
                end
            }
        }));
    end, l_dependencyArray_0(v30, v27, v29, v25.conversationId));
    local v37 = l_useCallback_0(function() --[[ Line: 109 ]]
        -- upvalues: v29 (copy), v19 (ref), v25 (copy), v27 (copy), v33 (copy), v28 (copy)
        if v29 then
            v29.fireAnalyticsEvent(v19.ConversationPvUpsellLeftGroup, {
                conversationId = v25.conversationId
            });
        end;
        if v25.conversationId then
            v27(true);
            v33(v28, v25.conversationId):catch(function() --[[ Line: 120 ]]
                -- upvalues: v25 (ref)
                v25.showNetworkErrorToast();
            end):finally(function() --[[ Line: 123 ]]
                -- upvalues: v27 (ref)
                v27(false);
            end);
        end;
    end, l_dependencyArray_0(v28, v25.conversationId, v29, v33, v25.showNetworkErrorToast));
    local v38 = l_useLocalization_0({
        bodyText = v25.bodyKey, 
        acceptText = v25.acceptKey, 
        denyText = v25.denyKey
    });
    return v5.createElement(v22, {
        bodyText = v38.bodyText, 
        acceptText = v38.acceptText, 
        denyText = v38.denyText, 
        layoutOrder = v25.layoutOrder, 
        onAccepted = v36, 
        onDenied = v37, 
        loading = v26, 
        onHeightChanged = v25.onHeightChanged
    });
end;
return l_memo_0(PhoneVerificationUpsellContainer);