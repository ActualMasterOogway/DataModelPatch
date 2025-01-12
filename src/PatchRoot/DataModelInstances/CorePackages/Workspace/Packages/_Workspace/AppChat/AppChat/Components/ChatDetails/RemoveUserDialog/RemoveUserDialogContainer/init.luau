local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v6.memo;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v14 = require(script.Parent.RemoveUserDialogLayout);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v16 = {
    participantId = nil, 
    onModalClose = function() --[[ Line: 42 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = "Feature.Chat.Action.RemoveUser", 
    messageKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.RemoveUser.V2" or "Feature.Chat.Message.RemoveUser", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Remove", 
    failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.FailedToRemoveUser.V2" or "Feature.Chat.Message.FailedToRemoveUser", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
RemoveUserDialogContainer = function(v17) --[[ Line: 59 ]] --[[ Name: RemoveUserDialogContainer ]]
    -- upvalues: v5 (copy), v16 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v2 (copy), l_useLocalization_0 (copy), v6 (copy), v14 (copy)
    local v18 = v5.Dictionary.join(v16, v17);
    local v19, v20 = l_useState_0(true);
    local v21, v22 = l_useState_0(false);
    local v23, v24 = l_useState_0(false);
    local v25 = l_useDispatch_0();
    local v28 = l_useCallback_0(function(v26, v27) --[[ Line: 66 ]]
        -- upvalues: v25 (copy), v4 (ref)
        return v25(v4.rodux.RemoveUserFromConversation.API(v27, v26));
    end, l_dependencyArray_0(v25));
    local v32 = l_useSelector_0(function(v29) --[[ Line: 70 ]]
        -- upvalues: v18 (copy), v2 (ref)
        local v30 = v29.ChatAppReducer.Conversations[v18.conversationId] or {
            title = nil
        };
        local v31 = v29.Users[v18.participantId];
        return {
            conversationTitle = v30.title, 
            targetUser = v2(v29, v31)
        };
    end);
    local v34 = l_useCallback_0(function() --[[ Line: 82 ]]
        -- upvalues: v22 (copy), v20 (copy), v18 (copy), v28 (copy), v24 (copy)
        v22(true);
        v20(false);
        local l_conversationId_0 = v18.conversationId;
        if l_conversationId_0 then
            v28(v18.participantId, l_conversationId_0):andThen(function() --[[ Line: 89 ]]
                -- upvalues: v18 (ref)
                v18.onModalClose();
            end):catch(function() --[[ Line: 92 ]]
                -- upvalues: v22 (ref), v20 (ref), v24 (ref)
                v22(false);
                v20(true);
                v24(true);
            end);
        end;
        return true;
    end, l_dependencyArray_0(v18.participantId, v18.conversationId));
    local v35 = l_useLocalization_0({
        titleText = v18.titleKey, 
        bodyText = {
            v18.messageKey; 
            USERNAME = v32.targetUser.displayName
        }, 
        cancelText = v18.cancelTitleKey, 
        confirmText = v18.confirmationTitleKey, 
        failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser", 
        failureBodyText = {
            v18.failureBodyKey; 
            USERNAME = v32.targetUser.displayName, 
            CONVERSATION_TITLE = v32.conversationTitle
        }, 
        failureButtonText = "Feature.Chat.Action.Confirm"
    });
    return v6.createElement(v14, v5.Dictionary.join(v18, v35, v32, {
        onActivated = v34, 
        displayFailed = v23, 
        isModalVisible = v19, 
        isLoading = v21
    }));
end;
return l_memo_0(RemoveUserDialogContainer);