local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ChatNudgeCustomDialog);
local v4 = require(l_script_FirstAncestor_0.Components.ChatTimeoutCustomDialog);
local v5 = require(l_script_FirstAncestor_0.Components.ChatNudgeToast);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v7 = require(l_script_FirstAncestor_0.Utils.Constants);
local function _(v8) --[[ Line: 14 ]] --[[ Name: getRemainingSeconds ]]
    local v9 = DateTime.fromIsoDate(v8.timeoutStartTime);
    if v9 then
        return (v9.UnixTimestamp or DateTime.now().UnixTimestamp) + v8.timeoutDurationSeconds - DateTime.now().UnixTimestamp;
    else
        return -1;
    end;
end;
InExperienceInterventionDialogManager = function(v11) --[[ Line: 24 ]] --[[ Name: InExperienceInterventionDialogManager ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v12 = v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), v7 (ref)
        v11.uiStateDispatch({
            type = v7.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v7.TreatmentType.None, 
            isShown = false
        });
    end, {});
    local l_treatmentType_0 = v11.uiState.treatmentType;
    local l_detail_0 = v11.uiState.detail;
    if v11.uiState.isShown then
        if l_treatmentType_0 == v7.TreatmentType.ChatNudgeDialog then
            return v2.createElement(v3, {
                violatingChatLine = l_detail_0.evidence, 
                onDismiss = v12, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 == v7.TreatmentType.ChatTimeout and (l_detail_0.timeoutDurationSeconds or 0) > 0 then
            local v15 = DateTime.fromIsoDate(l_detail_0.timeoutStartTime);
            local v16 = if v15 then (v15.UnixTimestamp or DateTime.now().UnixTimestamp) + l_detail_0.timeoutDurationSeconds - DateTime.now().UnixTimestamp else -1;
            if v16 > 0 then
                return v2.createElement(v4, {
                    remainingSeconds = v16, 
                    duration = l_detail_0.timeoutDurationSeconds, 
                    onDismiss = v12, 
                    eventId = l_detail_0.decisionEventId, 
                    violatingChatLine = l_detail_0.evidence
                });
            end;
        elseif l_treatmentType_0 == v7.TreatmentType.ChatNudgeToast then
            return v2.createElement(v5, {
                violatingChatLine = l_detail_0.evidence, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 ~= v7.TreatmentType.BackendDriven then

        end;
    end;
    return nil;
end;
return InExperienceInterventionDialogManager;