local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
local v7 = require(l_script_FirstAncestor_0.ReportAnything.Components.ScreenshotFlowStepHandlerContainer);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAbuseReportMenuConsoleSupportRefactor;
local v10 = {
    annotationPageHandle = nil, 
    annotationPageFrame = nil, 
    annotationPageScreenGui = nil
};
return {
    mountAnnotationPage = function(v11, v12, v13, v14, v15) --[[ Line: 36 ]] --[[ Name: mountAnnotationPage ]]
        -- upvalues: l_GuiService_0 (copy), v10 (copy), l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 (copy), l_CoreGui_0 (copy), v6 (copy), v4 (copy), v7 (copy)
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if not v10.annotationPageScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "AnnotationPageContents";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = if l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0() then l_CoreGui_0:FindFirstChild(v6.AbuseReportMenuPlaceholderFrame, true) else l_CoreGui_0:FindFirstChild(v6.AbuseReportMenuRootName, true);
            v10.annotationPageScreenGui = l_ScreenGui_0;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Parent = v10.annotationPageScreenGui;
            v10.annotationPageFrame = l_Frame_0;
        end;
        local v24 = v4.createElement(v7, {
            screenshot = v14.screenshotContentId, 
            entryPoint = v11, 
            backAction = function() --[[ Line: 68 ]] --[[ Name: backAction ]]
                -- upvalues: v10 (ref), v4 (ref)
                if v10.annotationPageHandle ~= nil then
                    v4.unmount(v10.annotationPageHandle);
                    v10.annotationPageHandle = nil;
                end;
                if v10.annotationPageScreenGui ~= nil then
                    v10.annotationPageFrame.Parent = nil;
                    v10.annotationPageFrame = nil;
                    v10.annotationPageScreenGui = nil;
                end;
            end, 
            dismissAction = function() --[[ Line: 71 ]] --[[ Name: dismissAction ]]
                -- upvalues: v10 (ref), v4 (ref)
                if v10.annotationPageHandle ~= nil then
                    v4.unmount(v10.annotationPageHandle);
                    v10.annotationPageHandle = nil;
                end;
                if v10.annotationPageScreenGui ~= nil then
                    v10.annotationPageFrame.Parent = nil;
                    v10.annotationPageFrame = nil;
                    v10.annotationPageScreenGui = nil;
                end;
            end, 
            finishAnnotationAction = function(v20) --[[ Line: 74 ]] --[[ Name: finishAnnotationAction ]]
                -- upvalues: v10 (ref), v4 (ref), v15 (copy), v6 (ref)
                if v10.annotationPageHandle ~= nil then
                    v4.unmount(v10.annotationPageHandle);
                    v10.annotationPageHandle = nil;
                end;
                if v10.annotationPageScreenGui ~= nil then
                    v10.annotationPageFrame.Parent = nil;
                    v10.annotationPageFrame = nil;
                    v10.annotationPageScreenGui = nil;
                end;
                v15({
                    type = v6.ReportAnythingActions.SetAnnotationPoints, 
                    annotationPoints = v20
                });
                v15({
                    type = v6.ReportAnythingActions.CompleteAttachment
                });
            end, 
            restartAction = function() --[[ Line: 84 ]] --[[ Name: restartAction ]]
                -- upvalues: v10 (ref), v4 (ref), v15 (copy), v6 (ref), v12 (copy)
                if v10.annotationPageHandle ~= nil then
                    v4.unmount(v10.annotationPageHandle);
                    v10.annotationPageHandle = nil;
                end;
                if v10.annotationPageScreenGui ~= nil then
                    v10.annotationPageFrame.Parent = nil;
                    v10.annotationPageFrame = nil;
                    v10.annotationPageScreenGui = nil;
                end;
                v15({
                    type = v6.ReportAnythingActions.ClearAll
                });
                v12();
            end, 
            skipAnnotationAction = function() --[[ Line: 94 ]] --[[ Name: skipAnnotationAction ]]
                -- upvalues: v10 (ref), v4 (ref), v15 (copy), v6 (ref)
                if v10.annotationPageHandle ~= nil then
                    v4.unmount(v10.annotationPageHandle);
                    v10.annotationPageHandle = nil;
                end;
                if v10.annotationPageScreenGui ~= nil then
                    v10.annotationPageFrame.Parent = nil;
                    v10.annotationPageFrame = nil;
                    v10.annotationPageScreenGui = nil;
                end;
                v15({
                    type = v6.ReportAnythingActions.CompleteAttachment
                });
            end, 
            setAnnotationCircleRadius = function(v21) --[[ Line: 100 ]] --[[ Name: setAnnotationCircleRadius ]]
                -- upvalues: v15 (copy), v6 (ref)
                v15({
                    type = v6.ReportAnythingActions.SetAnnotationCircleRadius, 
                    radius = v21
                });
            end, 
            setAnnotationAreaDimensions = function(v22, v23) --[[ Line: 106 ]] --[[ Name: setAnnotationAreaDimensions ]]
                -- upvalues: v15 (copy), v6 (ref)
                v15({
                    type = v6.ReportAnythingActions.SetAnnotationAreaDimensions, 
                    width = v22, 
                    height = v23
                });
            end, 
            initialAnnotationPoints = {}, 
            initialPageNumber = 1, 
            reportAnythingAnalytics = v13
        });
        v15({
            type = v6.ReportAnythingActions.SetAnnotationOptionSeen
        });
        v10.annotationPageHandle = v4.mount(v24, v10.annotationPageFrame, "AnnotationFlow");
    end, 
    unmountAnnotationPage = function() --[[ Line: 24 ]] --[[ Name: unmountAnnotationPage ]]
        -- upvalues: v10 (copy), v4 (copy)
        if v10.annotationPageHandle ~= nil then
            v4.unmount(v10.annotationPageHandle);
            v10.annotationPageHandle = nil;
        end;
        if v10.annotationPageScreenGui ~= nil then
            v10.annotationPageFrame.Parent = nil;
            v10.annotationPageFrame = nil;
            v10.annotationPageScreenGui = nil;
        end;
    end
};