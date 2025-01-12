local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local v1 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatToastNudgeConfig);
local v2 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatTimeoutConfig);
local v3 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatDialogNudgeConfig);
local v4 = game:DefineFastFlag("InExperienceInterventionTimeoutConfig", false);
local v5 = {
    v1, 
    v3
};
if v4 then
    table.insert(v5, v2);
end;
return v5;