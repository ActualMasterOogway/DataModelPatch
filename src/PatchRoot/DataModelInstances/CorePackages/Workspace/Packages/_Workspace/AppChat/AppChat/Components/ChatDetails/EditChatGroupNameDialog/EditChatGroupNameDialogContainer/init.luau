local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_Parent_0.AppChatNetworking);
local l_ResponseStatus_0 = v13.Constants.ResponseStatus;
local l_ResponseIndicator_0 = v5.Components.ResponseIndicator;
local v16 = require(script.Parent.EditChatGroupNameDialog);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v18 = require(l_script_FirstAncestor_0.Logger);
local v21 = {
    Success = function() --[[ Line: 36 ]] --[[ Name: Success ]]
        return {
            visible = false, 
            isLoading = false, 
            warningTextKey = nil
        };
    end, 
    Moderated = function() --[[ Line: 45 ]] --[[ Name: Moderated ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Response.ChatNameFullyModerated.V2" or "Feature.Chat.Response.ChatNameFullyModerated"
        };
    end, 
    Default = function(v19, v20) --[[ Line: 54 ]] --[[ Name: Default ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = {
                l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.FailedToRenameConversation.V2" or "Feature.Chat.Message.FailedToRenameConversation"; 
                EXISTING_NAME = v19, 
                NEW_NAME = v20
            }
        };
    end, 
    Waiting = function() --[[ Line: 67 ]] --[[ Name: Waiting ]]
        return {
            visible = true, 
            isLoading = true
        };
    end
};
local v22 = {
    onModalClose = function() --[[ Line: 86 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Save", 
    placeholderTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Description.NameGroup" or "Feature.Chat.Description.NameGroupChat"
};
EditChatGroupNameDialogContainer = function(v23) --[[ Line: 99 ]] --[[ Name: EditChatGroupNameDialogContainer ]]
    -- upvalues: v3 (copy), v22 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v13 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v21 (copy), v18 (copy), l_ResponseStatus_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_ResponseIndicator_0 (copy), v16 (copy)
    local v24 = v3.Dictionary.join(v22, v23);
    local v25, v26 = l_useState_0({
        visible = true, 
        isLoading = false
    });
    local v27 = l_useDispatch_0();
    local v30 = l_useCallback_0(function(v28, v29) --[[ Line: 107 ]]
        -- upvalues: v27 (copy), v13 (ref)
        return v27(v13.rodux.UpdateConversationTitle.API(v28, v29));
    end, l_dependencyArray_0(v27));
    local v35 = l_useSelector_0(function(v31) --[[ Line: 111 ]]
        -- upvalues: v24 (copy)
        local l_conversationId_0 = v24.conversationId;
        local v33 = v31.ChatAppReducer.Conversations[l_conversationId_0];
        local v34 = "";
        if v33 and not v33.isDefaultTitle then
            v34 = v33.title;
        end;
        return v34;
    end);
    local v39 = l_useCallback_0(function(v36) --[[ Line: 126 ]]
        -- upvalues: v24 (copy), v26 (copy), v21 (ref), v30 (copy), v18 (ref), v35 (copy), l_ResponseStatus_0 (ref)
        if v24.conversationId then
            v26(v21.Waiting());
            v30(v24.conversationId, v36.InputBox):andThen(function(v37) --[[ Line: 130 ]]
                -- upvalues: v18 (ref), v26 (ref), v21 (ref), v35 (ref), v36 (copy), l_ResponseStatus_0 (ref), v24 (ref)
                if not v37 or not v37.responseBody or not v37.responseBody.conversations or not v37.responseBody.conversations[1] then
                    v18.error("Conversation rename response is invalid.");
                    v26(v21.Default(v35, v36.InputBox));
                    return;
                elseif v37.responseBody.conversations[1].status == l_ResponseStatus_0.SUCCESS then
                    v26(v21.Success());
                    v24.onModalClose();
                    return;
                elseif v37.responseBody and v37.responseBody.conversations[1].status == l_ResponseStatus_0.MODERATED then
                    v18.error("Conversation rename was moderated.");
                    v26(v21.Moderated());
                    return;
                else
                    v18.error("Conversation rename request failed.");
                    v26(v21.Default(v35, v36.InputBox));
                    return;
                end;
            end):catch(function(_) --[[ Line: 153 ]]
                -- upvalues: v26 (ref), v21 (ref), v35 (ref), v36 (copy)
                v26(v21.Default(v35, v36.InputBox));
            end);
        end;
        return true;
    end, l_dependencyArray_0(v24.conversationId, v35));
    local v40 = l_useLocalization_0({
        titleText = v24.titleKey, 
        placeholderText = v24.placeholderTextKey, 
        cancelText = v24.cancelTitleKey, 
        confirmText = v24.confirmationTitleKey, 
        warningText = v25.warningTextKey
    });
    return v4.createElement(v4.Fragment, nil, {
        responseIndicator = v25.isLoading and v4.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        dialog = v25.visible and v4.createElement(v16, v3.Dictionary.join(v24, v40, {
            onActivated = v39, 
            inputText = v35, 
            conversationTitle = v35
        }))
    });
end;
return l_memo_0(EditChatGroupNameDialogContainer);