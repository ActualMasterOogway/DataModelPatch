local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_memo_0 = v5.memo;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableCFM);
local v8 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local v9 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(script.Parent.ParticipantDialog);
local v12 = require(script.Parent.PlayerContextualMenuWrapper);
local v13 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    viewProfileText = "Feature.Chat.Label.ViewProfile", 
    reportUserText = "Feature.Chat.Action.ReportUser", 
    removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
    cancelText = "Feature.Chat.Action.Cancel", 
    openViewProfile = nil, 
    openReportUser = nil, 
    openRemoveUserDialog = nil, 
    onDismiss = nil
};
ParticipantDialogContainer = function(v14) --[[ Line: 53 ]] --[[ Name: ParticipantDialogContainer ]]
    -- upvalues: v4 (copy), v13 (copy), v8 (copy), l_useLocalization_0 (copy), v9 (copy), v2 (copy), v7 (copy), v5 (copy), v12 (copy), v11 (copy)
    local v15 = v4.Dictionary.join(v13, v14);
    local v17 = v8(function(v16) --[[ Line: 55 ]]
        return v16.getChatViewProfileOption();
    end);
    local v18 = l_useLocalization_0({
        viewProfileText = v15.viewProfileText, 
        reportUserText = v15.reportUserText, 
        removeFromGroupText = v15.removeFromGroupText, 
        cancelText = v15.cancelText
    });
    local v19 = v9({
        v2.ViewUserProfile
    });
    if v7() and not v19[v2.ViewUserProfile] then
        return v5.createElement(v12, {
            conversationId = v15.conversationId, 
            participantId = v15.participantId, 
            onDismiss = v15.onDismiss, 
            openRemoveUserDialog = v15.openRemoveUserDialog, 
            removeFromGroupText = v18.removeFromGroupText, 
            openReportUser = v15.openReportUser, 
            showRemoveUserButton = v15.showRemoveUserButton
        });
    else
        return v5.createElement(v11, v4.Dictionary.join(v15, v18, {
            showViewProfileButton = v17
        }));
    end;
end;
return l_memo_0(ParticipantDialogContainer);