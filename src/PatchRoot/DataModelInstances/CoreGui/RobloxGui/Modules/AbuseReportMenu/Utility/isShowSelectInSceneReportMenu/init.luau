local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local l_GetFFlagSelectInSceneReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelectInSceneReportMenu;
local v5 = require(l_script_FirstAncestor_0.Utility.isInSelectInSceneReportMenuOverrideList);
local v6 = false;
if l_GetFFlagSelectInSceneReportMenu_0() then
    task.defer(function() --[[ Line: 13 ]]
        -- upvalues: v6 (ref), v5 (copy)
        v6 = v5();
    end);
end;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_GetFFlagSelectInSceneReportMenu_0 (copy), l_ExperienceStateCaptureService_0 (copy), v3 (copy), v6 (ref)
    if not l_GetFFlagSelectInSceneReportMenu_0() then
        return false;
    elseif not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
        return false;
    elseif not game:GetEngineFeature("CaptureModeEnabled") then
        return false;
    else
        if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
            if not l_ExperienceStateCaptureService_0:CanEnterCaptureMode() then
                v7({
                    type = v3.AnalyticsActions.SetMemoryRequirementMet, 
                    memoryRequirementMet = 0
                });
                return false;
            else
                v7({
                    type = v3.AnalyticsActions.SetMemoryRequirementMet, 
                    memoryRequirementMet = 1
                });
            end;
        end;
        if not game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
            return false;
        elseif v6 then
            return true;
        else
            return true;
        end;
    end;
end;