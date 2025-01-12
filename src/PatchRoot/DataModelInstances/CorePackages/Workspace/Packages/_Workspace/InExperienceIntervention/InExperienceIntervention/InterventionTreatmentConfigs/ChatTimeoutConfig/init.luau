local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v4 = require(l_Parent_0.ExperienceChat);
local l_GetFFlagChatTimeoutModernChatSpecificImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagChatTimeoutModernChatSpecificImpl;
return {
    configName = "ChatTimeout", 
    signalNameSpace = v2.EXP_INTERV_SIGNAL_NAMESPACE, 
    shouldTriggerVisualTreatment = function(v6) --[[ Line: 13 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: v2 (copy)
        return v6.type == v2.NotificationDialogType.ChatTimeout;
    end, 
    shouldTriggerBehavioralTreatment = function(v7) --[[ Line: 16 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        -- upvalues: v2 (copy)
        return v7.type == v2.NotificationDialogType.ChatTimeout;
    end, 
    onTriggerVisualTreatment = function(v8, v9) --[[ Line: 19 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: v2 (copy)
        v8({
            type = v2.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v2.TreatmentType.ChatTimeout, 
            isShown = true, 
            detail = v9
        });
    end, 
    onTriggerBehavioralTreatment = function() --[[ Line: 27 ]] --[[ Name: onTriggerBehavioralTreatment ]]
        -- upvalues: l_GetFFlagChatTimeoutModernChatSpecificImpl_0 (copy), v4 (copy)
        if l_GetFFlagChatTimeoutModernChatSpecificImpl_0() then
            v4.Events.ChatTimeoutUpdatedEvent(DateTime.now().UnixTimestamp + 65, true);
        end;
    end
};