local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_UIStateActions_0 = require(l_script_FirstAncestor_0.Utils.Constants).UIStateActions;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: InExperienceInterventionUIStateReducer ]]
    -- upvalues: l_UIStateActions_0 (copy)
    local v5 = table.clone(v3);
    if v4.type == l_UIStateActions_0.ToggleNotificationDialog then
        v5.isShown = v4.isShown;
        v5.treatmentType = v4.treatmentType;
        v5.detail = v4.detail or {};
    end;
    return v5;
end;