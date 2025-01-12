local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialog);
local v6 = require(l_Parent_0.Components.ReportAnything.ScreenshotReviewDialog);
local v7 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
return function(v8) --[[ Line: 23 ]] --[[ Name: ScreenshotFlowStepHandler ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), v3 (copy), v5 (copy)
    local v9, v10 = v2.useState(v8.initialPageNumber == nil and 1 or v8.initialPageNumber);
    local v11, v12 = v2.useState(1.7777777777777777);
    local v13, v14 = v2.useState(800);
    local v15, v16 = v2.useState(800);
    local v17, v18 = v2.useState(true);
    local v19 = v2.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v10 (copy)
        v10(2);
    end, {
        v10
    });
    local v20 = v2.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v10 (copy)
        v10(1);
    end, {
        v10
    });
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v14 (copy), v16 (copy), v18 (copy), v8 (copy)
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v12(l_ViewportSize_0.X / l_ViewportSize_0.Y);
            v14(l_ViewportSize_0.Y);
            v16(l_ViewportSize_0.X);
            local l_v18_0 = v18;
            local v24 = false;
            if l_ViewportSize_0.X < l_ViewportSize_0.Y then
                v24 = l_ViewportSize_0.X < 800;
            end;
            l_v18_0(v24);
            if v8.reportAnythingAnalytics and l_ViewportSize_0.X < l_ViewportSize_0.Y then
                v8.reportAnythingAnalytics.setIsPortraitMode();
            end;
        end;
    end, {});
    local _ = nil;
    if v9 == 1 then
        return (v2.createElement(v6, {
            imageAspectRatio = v11, 
            isSmallPortraitMode = v17, 
            viewportHeight = v13, 
            viewportWidth = v15, 
            onNextPage = v19, 
            onBack = v8.dismissAction, 
            onSkip = v8.skipAnnotationAction, 
            onRestart = v8.restartAction, 
            screenshot = v8.screenshot, 
            reportAnythingAnalytics = v8.reportAnythingAnalytics
        }, {}));
    else
        local v26 = v8.entryPoint == "player" and "Select Person in Scene" or "Select Problem in Scene";
        if v7() then
            v26 = v8.entryPoint == "player" and v3:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") or v3:FormatByKey("Feature.ReportAbuse.Label.SelectProblem");
        end;
        return (v2.createElement(v5, {
            titleText = v26, 
            backAction = v20, 
            dismissAction = v8.dismissAction, 
            reportAction = v8.reportAction, 
            initialAnnotationPoints = v8.initialAnnotationPoints, 
            isSmallPortraitMode = v17, 
            screenshot = v8.screenshot, 
            imageAspectRatio = v11, 
            reportAnythingAnalytics = v8.reportAnythingAnalytics
        }));
    end;
end;