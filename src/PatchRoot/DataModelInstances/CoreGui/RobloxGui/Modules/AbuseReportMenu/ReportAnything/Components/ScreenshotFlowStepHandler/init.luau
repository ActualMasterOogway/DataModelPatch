local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.ScreenshotDialog);
local v5 = require(l_Parent_0.Components.ScreenshotReviewDialog);
return function(v6) --[[ Line: 22 ]] --[[ Name: ScreenshotFlowStepHandler ]]
    -- upvalues: v1 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v7, v8 = v1.useState(v6.initialPageNumber == nil and 1 or v6.initialPageNumber);
    local v9, v10 = v1.useState(1.7777777777777777);
    local v11, v12 = v1.useState(800);
    local v13, v14 = v1.useState(800);
    local v15, v16 = v1.useState(true);
    local v17 = v1.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        v8(2);
    end, {
        v8
    });
    local v18 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v8 (copy)
        v8(1);
    end, {
        v8
    });
    v1.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v10 (copy), v12 (copy), v14 (copy), v16 (copy)
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v10(l_ViewportSize_0.X / l_ViewportSize_0.Y);
            v12(l_ViewportSize_0.Y);
            v14(l_ViewportSize_0.X);
            local l_v16_0 = v16;
            local v22 = false;
            if l_ViewportSize_0.X < l_ViewportSize_0.Y then
                v22 = l_ViewportSize_0.X < 800;
            end;
            l_v16_0(v22);
        end;
    end, {});
    local _ = nil;
    if v7 == 1 then
        return (v1.createElement(v5, {
            imageAspectRatio = v9, 
            isSmallPortraitMode = v15, 
            viewportHeight = v11, 
            viewportWidth = v13, 
            onNextPage = v17, 
            onBack = v6.dismissAction, 
            onSkip = v6.skipAnnotationAction, 
            onRestart = v6.restartAction, 
            screenshot = v6.screenshot, 
            reportAnythingAnalytics = v6.reportAnythingAnalytics
        }, {}));
    else
        local v24 = if v6.entryPoint == "player" then v2:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") else v2:FormatByKey("Feature.ReportAbuse.Label.SelectProblem");
        return (v1.createElement(v4, {
            titleText = v24, 
            backAction = v18, 
            dismissAction = v6.dismissAction, 
            finishAnnotationAction = v6.finishAnnotationAction, 
            initialAnnotationPoints = v6.initialAnnotationPoints, 
            isSmallPortraitMode = v15, 
            screenshot = v6.screenshot, 
            imageAspectRatio = v9, 
            setAnnotationCircleRadius = v6.setAnnotationCircleRadius, 
            setAnnotationAreaDimensions = v6.setAnnotationAreaDimensions, 
            reportAnythingAnalytics = v6.reportAnythingAnalytics
        }));
    end;
end;