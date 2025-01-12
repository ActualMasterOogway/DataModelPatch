local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local v4 = require(l_script_FirstAncestor_0.Logger);
local l_React_0 = v3.React;
local l_DefaultTwoStepReportFlow_0 = v3.AbuseReporting.UXFlows.DefaultTwoStepReportFlow;
local l_NetworkingSquads_0 = v3.NetworkingSquads;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDispatch_0 = v3.Hooks.useDispatch;
local v10 = {
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryInappropriate", 
        value = "Swearing"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryBullyingV2", 
        value = "Bullying"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryTheft", 
        value = "Scamming"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryDating", 
        value = "Dating"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryScamming", 
        value = "Cheating/Exploiting"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryPrivateInfo", 
        value = "Personal Question"
    }
};
return function(v11) --[[ Line: 32 ]] --[[ Name: SquadVoiceAbuseReport ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), v4 (copy), l_HttpService_0 (copy), l_NetworkingSquads_0 (copy), l_dependencyArray_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v10 (copy)
    local v12 = l_useDispatch_0();
    local v17 = l_React_0.useCallback(function(v13, v14) --[[ Line: 34 ]]
        -- upvalues: v4 (ref), l_HttpService_0 (ref), v11 (copy), v12 (copy), l_NetworkingSquads_0 (ref)
        v4:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", v13, v14, l_HttpService_0:JSONEncode(v11.reportData));
        local v15, v16 = v12(l_NetworkingSquads_0.SendSquadVoiceAbuseReport.API({
            submitterUserId = v11.reportData.submitterUserId, 
            abuserUserId = v11.reportData.abuserUserId, 
            reportBeginTimestampMs = v11.reportData.reportBeginTimestampMs, 
            voiceChannelId = v11.reportData.voiceChannelId, 
            voiceUserIds = v11.reportData.voiceUserIds, 
            voiceUserCount = v11.reportData.voiceUserCount, 
            abuseReason = v13, 
            abuseComment = v14
        })):await();
        if v15 then
            v4:info("Abuse report submitted successfully. Response: {}", l_HttpService_0:JSONEncode(v16));
            return v15;
        else
            v4:error("Failed to submit abuse report. Response: {}", l_HttpService_0:JSONEncode(v16));
            return v15;
        end;
    end, l_dependencyArray_0(v11.reportData, v12));
    return l_React_0.createElement(l_DefaultTwoStepReportFlow_0, {
        analyticsContext = "Squad", 
        onSubmitProps = {
            hasNextSteps = false, 
            onSubmit = v17
        }, 
        onCloseProps = {
            hasPreviousSteps = false, 
            onAbandon = v11.onAbandon
        }, 
        implSubmit = v17, 
        onAbandon = v11.onAbandon, 
        onComplete = v11.onComplete, 
        reportCategories = v10
    });
end;