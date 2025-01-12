local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ModalBottomSheet_0 = require(l_Parent_0.UIBlox).ModalBottomSheet;
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(script.Parent.Logger);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_memo_0 = v6.memo;
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v9 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v12 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    showViewProfileButton = true, 
    viewProfileText = "localizedText.ViewProfile", 
    reportUserText = "localizedText.ReportUser", 
    removeFromGroupText = "localizedText.RemoveFromGroup", 
    cancelText = "localizedText.Cancel", 
    openViewProfile = function(_) --[[ Line: 48 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v4 (copy)
        v4:warning("openViewProfile was not passed to ParticipantDialog");
    end, 
    openReportUser = function(...) --[[ Line: 51 ]] --[[ Name: openReportUser ]]
        -- upvalues: v4 (copy)
        v4:warning("openReportUser was not passed to ParticipantDialog");
    end, 
    openRemoveUserDialog = function(...) --[[ Line: 54 ]] --[[ Name: openRemoveUserDialog ]]
        -- upvalues: v4 (copy)
        v4:warning("openRemoveUserDialog was not passed to ParticipantDialog");
    end, 
    onDismiss = function(_) --[[ Line: 57 ]] --[[ Name: onDismiss ]]
        -- upvalues: v4 (copy)
        v4:warning("onDismiss was not passed to ParticipantDialog");
    end
};
ParticipantDialog = function(v13) --[[ Line: 64 ]] --[[ Name: ParticipantDialog ]]
    -- upvalues: v5 (copy), v12 (copy), v8 (copy), v4 (copy), v9 (copy), v6 (copy), l_ModalBottomSheet_0 (copy)
    local v14 = v5.Dictionary.join(v12, v13);
    local v15 = v8();
    local l_conversationId_0 = v14.conversationId;
    local l_participantId_0 = v14.participantId;
    local l_showRemoveUserButton_0 = v14.showRemoveUserButton;
    local v19 = {};
    if v14.showViewProfileButton then
        table.insert(v19, {
            text = v14.viewProfileText, 
            onActivated = function() --[[ Line: 77 ]] --[[ Name: onActivated ]]
                -- upvalues: v4 (ref), l_participantId_0 (copy), v14 (copy)
                v4:info("User activated viewProfile | userId: {}", l_participantId_0);
                v14.openViewProfile(l_participantId_0);
            end
        });
    end;
    table.insert(v19, {
        text = v14.reportUserText, 
        onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
            -- upvalues: v4 (ref), l_participantId_0 (copy), l_conversationId_0 (copy), v15 (copy), v9 (ref), v14 (copy)
            v4:info("User activated reportUser | userId: {}, conversationId: {}", l_participantId_0, l_conversationId_0);
            if v15 then
                v15.fireAnalyticsEvent(v9.ChatDetailsReportUserClicked, {
                    conversationId = l_conversationId_0
                });
            end;
            v14.openReportUser(l_participantId_0, l_conversationId_0);
        end
    });
    if l_showRemoveUserButton_0 then
        table.insert(v19, {
            text = v14.removeFromGroupText, 
            onActivated = function() --[[ Line: 100 ]] --[[ Name: onActivated ]]
                -- upvalues: v14 (copy), l_participantId_0 (copy), l_conversationId_0 (copy)
                v14.openRemoveUserDialog(l_participantId_0, l_conversationId_0);
            end
        });
    end;
    table.insert(v19, {
        text = v14.cancelText, 
        onActivated = function() --[[ Line: 108 ]] --[[ Name: onActivated ]]

        end
    });
    return v6.createElement(l_ModalBottomSheet_0, {
        bottomGap = 10, 
        onDismiss = v14.onDismiss, 
        buttonModels = v19, 
        screenWidth = 400, 
        showImages = false
    });
end;
return l_memo_0(ParticipantDialog);