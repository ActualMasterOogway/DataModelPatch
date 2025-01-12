local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useContext_0 = v5.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useState_0 = v5.useState;
local v16 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v18 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v19 = require(script.Parent.Parent.ConversationModal.ConversationModal);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v21 = {
    showNetworkErrorToast = function() --[[ Line: 44 ]] --[[ Name: showNetworkErrorToast ]]

    end, 
    onHeightChanged = function() --[[ Line: 45 ]] --[[ Name: onHeightChanged ]]

    end, 
    bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.IneligibleToJoinChat.V2" or "Feature.Chat.Message.IneligibleToJoinChat", 
    acceptKey = "Feature.Chat.Action.LearnMore", 
    denyKey = "Feature.Chat.Action.LeaveGroup"
};
IneligibleModalContainer = function(v22) --[[ Line: 55 ]] --[[ Name: IneligibleModalContainer ]]
    -- upvalues: v4 (copy), v21 (copy), l_useState_0 (copy), l_useLocalUserId_0 (copy), l_useContext_0 (copy), v6 (copy), v16 (copy), l_useNavigation_0 (copy), l_useEffectOnMount_0 (copy), v18 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v5 (copy), v19 (copy)
    local v23 = v4.Dictionary.join(v21, v22);
    local v24, v25 = l_useState_0(false);
    local v26 = l_useLocalUserId_0();
    local v27 = l_useContext_0(v6);
    local v28 = v16();
    local v29 = l_useNavigation_0();
    l_useEffectOnMount_0(function() --[[ Line: 63 ]]
        -- upvalues: v28 (copy), v18 (ref), v23 (copy)
        if v28 then
            v28.fireAnalyticsEvent(v18.ConversationIneligibleModalRendered, {
                conversationId = v23.conversationId
            });
        end;
    end);
    local v30 = l_useDispatch_0();
    local v33 = l_useCallback_0(function(v31, v32) --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v3 (ref)
        return v30(v3.rodux.RemoveUserFromConversation.API(v32, v31));
    end, l_dependencyArray_0(v30));
    local v34 = l_useCallback_0(function() --[[ Line: 76 ]]
        -- upvalues: v28 (copy), v18 (ref), v23 (copy), v29 (copy), v27 (copy)
        if v28 then
            v28.fireAnalyticsEvent(v18.ConversationIneligibleModalLearnMoreClicked, {
                conversationId = v23.conversationId
            });
        end;
        if v29 then
            v27.navigateToUnfilteredThreadsLearnMore(v29.navigate);
            return;
        else
            v27.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, l_dependencyArray_0(v27, v28, v23.conversationId, v29));
    local v35 = l_useCallback_0(function() --[[ Line: 90 ]]
        -- upvalues: v28 (copy), v18 (ref), v23 (copy), v25 (copy), v33 (copy), v26 (copy)
        if v28 then
            v28.fireAnalyticsEvent(v18.ConversationIneligibleModalLeftGroup, {
                conversationId = v23.conversationId
            });
        end;
        if v23.conversationId then
            v25(true);
            v33(v26, v23.conversationId):catch(function() --[[ Line: 100 ]]
                -- upvalues: v23 (ref)
                v23.showNetworkErrorToast();
            end):finally(function() --[[ Line: 103 ]]
                -- upvalues: v25 (ref)
                v25(false);
            end);
        end;
    end, l_dependencyArray_0(v26, v23.conversationId, v28, v33, v23.showNetworkErrorToast));
    local v36 = l_useLocalization_0({
        bodyText = v23.bodyKey, 
        acceptText = v23.acceptKey, 
        denyText = v23.denyKey
    });
    return v5.createElement(v19, {
        bodyText = v36.bodyText, 
        acceptText = v36.acceptText, 
        denyText = v36.denyText, 
        layoutOrder = v23.layoutOrder, 
        onAccepted = v34, 
        onDenied = v35, 
        loading = v24, 
        onHeightChanged = v23.onHeightChanged
    });
end;
return l_memo_0(IneligibleModalContainer);