local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v6 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local function v15(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v10 = math.floor(workspace:GetServerTimeNow() * 1000);
    local v11 = 0;
    if v7.menuOpenedUnixTimestampMilliseconds > 0 then
        v11 = math.floor(v10 - v7.menuOpenedUnixTimestampMilliseconds);
    end;
    local v12, _ = v6.interpretAnnotations(v8);
    local v14 = {
        placeId = game.PlaceId, 
        isPortraitMode = v7.isPortraitMode, 
        viewportSizeX = v7.viewportSizeX, 
        viewportSizeY = v7.viewportSizeY, 
        timeSpentMs = v11, 
        experiencePersonChangeCount = v7.experiencePersonChangeCount, 
        typeofabuseChangeCount = v7.typeofabuseChangeCount, 
        personChangeCount = v7.personChangeCount, 
        reasonChangeCount = v7.reasonChangeCount, 
        captureSceneCount = v7.captureSceneCount, 
        reasonSelection = v7.reasonSelection, 
        commentAdded = v7.commentAdded, 
        experiencePersonSelection = v7.experiencePersonSelection, 
        annotationFinalCount = #v8.annotationPoints, 
        avatarFinalCount = #v12, 
        interactionType = v7.isSubmissionCompleted and 1 or 2, 
        typeofabuseSelection = v7.typeofabuseSelection, 
        memoryRequirementMet = v7.memoryRequirementMet
    };
    return (v3.Dictionary.join(v14, v9));
end;
return {
    forPersonReport = function(v16, v17, v18) --[[ Line: 58 ]]
        -- upvalues: v15 (copy), v4 (copy)
        local v19 = v15(v16, v17, v18);
        local v20 = nil;
        local l_Chat_0 = v4.AnalyticsAbuseMethods.Chat;
        for v22, v23 in pairs(v4.AbuseMethodToAnalyticsMapping) do
            if v22 == v16.typeofabuseSelection then
                v20 = v23;
                l_Chat_0 = v23;
            end;
        end;
        v19.typeofabuseSelection = v20;
        v19.inferredTypeofabuseSelection = l_Chat_0;
        return v19;
    end, 
    forExperienceReport = function(v24, v25, v26) --[[ Line: 80 ]]
        -- upvalues: v15 (copy), v4 (copy)
        local v27 = v15(v24, v25, v26);
        v27.typeofabuseSelection = v4.AnalyticsAbuseMethods.Game;
        v27.inferredTypeofabuseSelection = v4.AnalyticsAbuseMethods.Game;
        return v27;
    end
};