local l_SessionService_0 = game:GetService("SessionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = {};
v3.__index = v3;
v3.MenuContexts = {
    LegacyMenu = game:DefineFastString("ReportAnalyticsLegacyMenuContext", "ReportAbuseLegacyMenu"), 
    LegacySentPage = game:DefineFastString("ReportAnalyticsLegacySentPageContext", "ReportAbuseLegacySentPage"), 
    NewMenu = game:DefineFastString("ReportAnalyticsNewMenuContext", "ReportAbuseNewMenu")
};
v3.DiagCounters = {
    SuccessfulSubmissionTime = game:DefineFastString("ReportAnalyticsSuccessfulSubmissionTimeStat", "SuccessfulSubmissionTime"), 
    AbandonedSubmissionTime = game:DefineFastString("ReportAnalyticsAbandonedSubmissionTimeStat", "AbandonedSubmissionTime"), 
    SubmittedMethodOfAbuse = game:DefineFastString("ReportAnalyticsSubmittedMethodOfAbuseStat", "SubmittedMethodOfAbuse")
};
v3.ActionNames = {
    FieldChanged = game:DefineFastString("ReportAnalyticsFieldChanged", "FieldChanged"), 
    FormSubmitted = game:DefineFastString("ReportAnalyticsFormSubmitted", "FormSubmitted"), 
    FormAbandoned = game:DefineFastString("ReportAnalyticsFormAbandoned", "FormAbandoned"), 
    ButtonActivated = game:DefineFastString("ReportAnalyticsButtonActivated", "ButtonActivated"), 
    InGameAbuseReport = game:DefineFastString("ReportAnalyticsInGameAbuseReport", "InGameAbuseReport")
};
v3.SessionConstants = {
    StructuralIdentifier = {
        Level1 = "level1", 
        AbuseReport = "AbuseReport"
    }, 
    Metadata = {
        EntryPoint = "entryPoint", 
        DeleteOnGameLeave = "_deleteOnGameLeave"
    }
};
local v4 = {
    SUBMIT = 1, 
    ABANDON = 2
};
v3.new = function(v5, v6, v7) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    assert(v7, "Base context needs to be provided to ReportAbuseAnalytics");
    local v8 = {
        _eventStreamImpl = v5, 
        _diagImpl = v6, 
        _context = v7
    };
    setmetatable(v8, v3);
    return v8;
end;
v3.reportFormSubmitted = function(v9, v10, v11, v12) --[[ Line: 70 ]] --[[ Name: reportFormSubmitted ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v13 = v9._context .. "_" .. v3.DiagCounters.SuccessfulSubmissionTime;
    local v14 = v9._context .. "_" .. v3.DiagCounters.SubmittedMethodOfAbuse .. "_" .. v11;
    v12 = v2.Dictionary.join(v12 or {}, {
        timeToComplete = v10, 
        methodOfAbuse = v11
    });
    v9._diagImpl:reportStats(v13, v10);
    v9._diagImpl:reportCounter(v14, 1);
    v9._eventStreamImpl:sendEventDeferred(v9._context, v3.ActionNames.FormSubmitted, v12);
end;
v3.reportFormAbandoned = function(v15, v16, v17) --[[ Line: 93 ]] --[[ Name: reportFormAbandoned ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v18 = v15._context .. "_" .. v3.DiagCounters.AbandonedSubmissionTime;
    v17 = v2.Dictionary.join(v17 or {}, {
        timeToExit = v16
    });
    v15._diagImpl:reportStats(v18, v16);
    v15._eventStreamImpl:sendEventDeferred(v15._context, v3.ActionNames.FormAbandoned, v17);
end;
v3.reportAnalyticsFieldChanged = function(v19, v20) --[[ Line: 108 ]] --[[ Name: reportAnalyticsFieldChanged ]]
    -- upvalues: v3 (copy)
    v19._eventStreamImpl:sendEventDeferred(v19._context, v3.ActionNames.FieldChanged, v20 or {});
end;
v3.reportButtonClick = function(v21, v22) --[[ Line: 116 ]] --[[ Name: reportButtonClick ]]
    -- upvalues: v3 (copy)
    v21._eventStreamImpl:sendEventDeferred(v21._context, v3.ActionNames.ButtonActivated, v22 or {});
end;
v3.reportInGameAbuseReportInteraction = function(v23, v24) --[[ Line: 129 ]] --[[ Name: reportInGameAbuseReportInteraction ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v25 = v24.interactionType == v4.SUBMIT;
    local l_AbandonedSubmissionTime_0 = v3.DiagCounters.AbandonedSubmissionTime;
    if v25 then
        l_AbandonedSubmissionTime_0 = v3.DiagCounters.SuccessfulSubmissionTime;
        local v27 = v23._context .. "_" .. v3.DiagCounters.SubmittedMethodOfAbuse .. "_" .. v24.inferredTypeofabuseSelection;
        v23._diagImpl:reportCounter(v27, 1);
    end;
    local v28 = v23._context .. "_" .. l_AbandonedSubmissionTime_0;
    v23._diagImpl:reportStats(v28, v24.timeSpentMs);
    v23._eventStreamImpl:sendEventDeferred(v23._context, v3.ActionNames.InGameAbuseReport, v24);
end;
v3.reportEventAndIncrement = function(v29, v30, v31) --[[ Line: 150 ]] --[[ Name: reportEventAndIncrement ]]
    v29._diagImpl:reportCounter(v29._context .. "_" .. v30, 1);
    v29._eventStreamImpl:sendEventDeferred(v29._context, v30, v31 or {});
end;
v3.startAbuseReportSession = function(_, v33) --[[ Line: 156 ]] --[[ Name: startAbuseReportSession ]]
    -- upvalues: l_SessionService_0 (copy), v3 (copy)
    if not l_SessionService_0:SessionExists(v3.SessionConstants.StructuralIdentifier.AbuseReport) then
        l_SessionService_0:SetSession(v3.SessionConstants.StructuralIdentifier.Level1, v3.SessionConstants.StructuralIdentifier.AbuseReport, v3.SessionConstants.StructuralIdentifier.AbuseReport);
    end;
    if not l_SessionService_0:GetMetadata(v3.SessionConstants.StructuralIdentifier.AbuseReport, v3.SessionConstants.Metadata.EntryPoint) then
        l_SessionService_0:SetMetadata(v3.SessionConstants.StructuralIdentifier.AbuseReport, v3.SessionConstants.Metadata.EntryPoint, v33);
    end;
    l_SessionService_0:SetMetadata(v3.SessionConstants.StructuralIdentifier.AbuseReport, v3.SessionConstants.Metadata.DeleteOnGameLeave, "True");
end;
v3.getAbuseReportSessionEntryPoint = function(_) --[[ Line: 188 ]] --[[ Name: getAbuseReportSessionEntryPoint ]]
    -- upvalues: l_SessionService_0 (copy), v3 (copy)
    if l_SessionService_0:SessionExists(v3.SessionConstants.StructuralIdentifier.AbuseReport) then
        return (l_SessionService_0:GetMetadata(v3.SessionConstants.StructuralIdentifier.AbuseReport, v3.SessionConstants.Metadata.EntryPoint));
    else
        return "";
    end;
end;
v3.endAbuseReportSession = function(_) --[[ Line: 202 ]] --[[ Name: endAbuseReportSession ]]
    -- upvalues: l_SessionService_0 (copy), v3 (copy)
    if l_SessionService_0:SessionExists(v3.SessionConstants.StructuralIdentifier.AbuseReport) then
        l_SessionService_0:RemoveSession(v3.SessionConstants.StructuralIdentifier.AbuseReport);
    end;
end;
return v3;