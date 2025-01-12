local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v7.memo;
local v10 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v7.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v7.useState;
local l_ResponseIndicator_0 = v2.Components.ResponseIndicator;
local v18 = require(script.Parent.LeaveGroupDialog);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v21 = {
    onModalClose = function() --[[ Line: 46 ]] --[[ Name: onModalClose ]]

    end, 
    onLeaveSuccess = function() --[[ Line: 47 ]] --[[ Name: onLeaveSuccess ]]

    end, 
    titleKey = "Feature.Chat.Heading.LeaveGroup", 
    cancelKey = "Feature.Chat.Action.Stay", 
    confirmKey = "Feature.Chat.Action.Leave", 
    bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.LeaveGroup.V2" or "Feature.Chat.Message.LeaveGroup", 
    failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.FailedToLeaveGroup.V2" or "Feature.Chat.Message.FailedToLeaveGroup", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
LeaveGroupDialogContainer = function(v22) --[[ Line: 64 ]] --[[ Name: LeaveGroupDialogContainer ]]
    -- upvalues: v6 (copy), v21 (copy), l_useState_0 (copy), v10 (copy), l_useEffectOnMount_0 (copy), v5 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_useLocalization_0 (copy), v7 (copy), v18 (copy), l_ResponseIndicator_0 (copy)
    local v23 = v6.Dictionary.join(v21, v22);
    local v24, v25 = l_useState_0(true);
    local v26, v27 = l_useState_0(false);
    local v28, v29 = l_useState_0(false);
    local v30 = v10();
    l_useEffectOnMount_0(function() --[[ Line: 71 ]]
        -- upvalues: v30 (copy), v5 (ref), v23 (copy)
        if v30 then
            v30.fireAnalyticsEvent(v5.ChatDetailsLeaveGroupDialogRendered, {
                conversationId = v23.conversationId
            });
        end;
    end);
    local v31 = l_useDispatch_0();
    local v34 = l_useCallback_0(function(v32, v33) --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v4 (ref)
        return v31(v4.rodux.RemoveUserFromConversation.API(v33, v32));
    end, l_dependencyArray_0(v31));
    local v37 = l_useSelector_0(function(v35) --[[ Line: 84 ]]
        -- upvalues: v23 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (ref)
        local v36 = v35.ChatAppReducer.Conversations[v23.conversationId] or {
            title = nil, 
            hasGroupUp = nil
        };
        return {
            localUserId = v35.LocalUserId, 
            conversationTitle = v36.title, 
            hasGroupUp = if l_GetFFlagLuaAppEnableSquadPage_0() then v36.hasGroupUp else nil
        };
    end);
    local v38 = l_useCallback_0(function() --[[ Line: 99 ]]
        -- upvalues: v27 (copy), v25 (copy), v30 (copy), v5 (ref), v23 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (ref), v37 (copy), v34 (copy), v29 (copy)
        v27(true);
        v25(false);
        if v30 then
            v30.fireAnalyticsEvent(v5.ChatDetailsLeaveGroupDialogLeaveClicked, {
                conversationId = v23.conversationId, 
                selectedConversationHasGroupUp = if l_GetFFlagLuaAppEnableSquadPage_0() then v37.hasGroupUp else nil
            });
        end;
        if v23.conversationId then
            v34(v37.localUserId, v23.conversationId):andThen(function() --[[ Line: 113 ]]
                -- upvalues: v23 (ref)
                v23.onModalClose();
                v23.onLeaveSuccess();
            end):catch(function() --[[ Line: 117 ]]
                -- upvalues: v27 (ref), v25 (ref), v29 (ref)
                v27(false);
                v25(true);
                v29(true);
            end);
        end;
        return true;
    end, l_dependencyArray_0(v37.localUserId, v37.hasGroupUp, v23.conversationId, v30, v34));
    local v39 = l_useCallback_0(function(...) --[[ Line: 135 ]]
        -- upvalues: v30 (copy), v5 (ref), v23 (copy)
        if v30 then
            v30.fireAnalyticsEvent(v5.ChatDetailsLeaveGroupDialogStayClicked, {
                conversationId = v23.conversationId
            });
        end;
        v23.onModalClose(...);
    end, l_dependencyArray_0(v23.onModalClose, v30, v23.conversationId));
    local v40 = l_useLocalization_0({
        titleText = v23.titleKey, 
        cancelText = v23.cancelKey, 
        confirmText = v23.confirmKey, 
        bodyText = v23.bodyKey, 
        failureTitleText = v23.failureTitleKey, 
        failureBodyText = {
            v23.failureBodyKey; 
            CONVERSATION_TITLE = v37.conversationTitle
        }, 
        failureButtonText = v23.failureButtonKey
    });
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        LeaveGroupDialog = v24 and v7.createElement(v18, v6.Dictionary.join(v23, v40, v37, {
            onActivated = v38, 
            displayFailed = v28, 
            onModalClose = v39
        })), 
        ResponseIndicator = v26 and v7.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        })
    });
end;
return l_memo_0(LeaveGroupDialogContainer);