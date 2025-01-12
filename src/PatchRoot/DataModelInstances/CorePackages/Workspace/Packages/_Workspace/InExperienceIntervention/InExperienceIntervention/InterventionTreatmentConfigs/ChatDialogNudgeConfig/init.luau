local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local v1 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
return {
    configName = "ChatDialogNudge", 
    signalNameSpace = v1.EXP_INTERV_SIGNAL_NAMESPACE, 
    shouldTriggerVisualTreatment = function(v3) --[[ Line: 8 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        local v4 = false;
        if v3.type == v1.NotificationDialogType.ChatNudge then
            v4 = v3.modalType == v1.NotificationModalType.Dialog;
        end;
        return v4;
    end, 
    shouldTriggerBehavioralTreatment = function(_) --[[ Line: 12 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        return false;
    end, 
    onTriggerVisualTreatment = function(v6, v7) --[[ Line: 15 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        v6({
            type = v1.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v1.TreatmentType.ChatNudgeDialog, 
            isShown = true, 
            detail = v7
        });
    end, 
    onTriggerBehavioralTreatment = function() --[[ Line: 23 ]] --[[ Name: onTriggerBehavioralTreatment ]]

    end
};