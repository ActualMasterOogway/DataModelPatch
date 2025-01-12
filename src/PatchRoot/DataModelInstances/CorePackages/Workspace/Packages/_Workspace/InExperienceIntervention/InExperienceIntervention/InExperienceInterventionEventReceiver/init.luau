local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Utils.Constants);
local v6 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.InterventionTreatmentConfigList);
InExperienceInterventionEventReceiver = function(v7) --[[ Line: 15 ]] --[[ Name: InExperienceInterventionEventReceiver ]]
    -- upvalues: v4 (copy), l_NotificationService_0 (copy), v5 (copy), l_HttpService_0 (copy), v6 (copy)
    v4.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_NotificationService_0 (ref), v5 (ref), l_HttpService_0 (ref), v6 (ref), v7 (copy)
        local v13 = l_NotificationService_0.RobloxEventReceived:Connect(function(v8) --[[ Line: 17 ]]
            -- upvalues: v5 (ref), l_HttpService_0 (ref), v6 (ref), v7 (ref)
            if v8.namespace == v5.EXP_INTERV_SIGNAL_NAMESPACE then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
                    -- upvalues: l_HttpService_0 (ref), v8 (copy)
                    return l_HttpService_0:JSONDecode(v8.detail);
                end);
                if not l_status_0 then
                    return;
                else
                    for _, v12 in v6 do
                        if v12.shouldTriggerVisualTreatment(l_result_0) then
                            v12.onTriggerVisualTreatment(v7.uiStateDispatch, l_result_0);
                        end;
                        if v12.shouldTriggerBehavioralTreatment(l_result_0) then
                            v12.onTriggerBehavioralTreatment();
                        end;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 35 ]]
            -- upvalues: v13 (copy)
            v13:Disconnect();
        end;
    end, {});
    return v4.createElement("Frame", {});
end;
return InExperienceInterventionEventReceiver;