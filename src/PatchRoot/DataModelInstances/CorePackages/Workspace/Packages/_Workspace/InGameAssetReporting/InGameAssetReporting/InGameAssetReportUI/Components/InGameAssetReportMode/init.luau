local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local v9 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v10 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.AnalyticsReducer);
local v11 = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local v12 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog);
local v13 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportErrorModal);
local v14 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportCompleteModal);
local v15 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportLandscapeHeader);
local v16 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportPortraitHeaderFooter);
local v17 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.ScreenshotHighlighter);
local v18 = require(l_script_FirstAncestor_0.Utility.buildReport);
local v19 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.InGameAssetReportAnalytics);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagSelectInSceneEscapeKey);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagSelectInSceneUseEngineSignal);
local function v23(v22) --[[ Line: 46 ]]
    return v22.point;
end;
local function v25(v24) --[[ Line: 50 ]]
    return v24.interpretationResult;
end;
return function(v26) --[[ Line: 54 ]]
    -- upvalues: v6 (copy), v10 (copy), v9 (copy), v11 (copy), v21 (copy), l_ExperienceStateCaptureService_0 (copy), l_ScreenshotManager_0 (copy), v5 (copy), v25 (copy), v19 (copy), v23 (copy), v18 (copy), l_Players_0 (copy), v20 (copy), l_UserInputService_0 (copy), l_withLocalization_0 (copy), v16 (copy), v15 (copy), v17 (copy), v13 (copy), v12 (copy), v14 (copy)
    local v27, v28 = v6.useState({});
    local v29, v30 = v6.useState({});
    local v31, v32 = v6.useState(false);
    local v33, v34 = v6.useState(false);
    local v35, v36 = v6.useState(false);
    local v37, v38 = v6.useState("");
    local v39, v40 = v6.useState(nil);
    local v41, v42 = v6.useState(nil);
    local v43, v44 = v6.useState(true);
    local v45, v46 = v6.useReducer(v10, v9.AnalyticsInitialState);
    local v47, v48 = v6.useState(nil);
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v50 = v26.getIsSmallPortraitMode(l_ViewportSize_0);
    v6.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v46 (copy), v9 (ref)
        v46({
            type = v9.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v46({
            type = v9.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
    end, {});
    local v58 = v6.useCallback(function(v51, v52) --[[ Line: 85 ]]
        -- upvalues: v11 (ref), l_ViewportSize_0 (copy), v21 (ref), l_ExperienceStateCaptureService_0 (ref), v27 (copy), v37 (copy), l_ScreenshotManager_0 (ref), v38 (copy), v28 (copy), v30 (copy), v46 (copy), v9 (ref)
        local v53 = {
            point = v51, 
            interpretationResult = v11.interpretAnnotation(v51 * l_ViewportSize_0, v52 * math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y), function() --[[ Line: 91 ]]

            end)
        };
        if v21() then
            v53.signalConnection = l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Once(function(v54) --[[ Line: 96 ]]
                -- upvalues: v53 (copy)
                v53.engineSignalItem = v54;
            end);
            for _, v56 in ipairs(v27) do
                v56.signalConnection:Disconnect();
            end;
        end;
        if #v27 == 0 and v37 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v38, nil);
        end;
        local v57 = table.clone(v27);
        table.insert(v57, v53);
        v28(v57);
        v30({});
        v46({
            type = v9.AnalyticsActions.IncremementAnnotationCount
        });
        task.defer(v53.interpretationResult.raycastComputation);
    end, {
        v27, 
        v28, 
        v30, 
        v37
    });
    local v61 = v6.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v27 (copy), v29 (copy), v30 (copy), v28 (copy), v46 (copy), v9 (ref)
        if #v27 > 0 then
            local v59 = table.clone(v27);
            local v60 = table.clone(v29);
            table.insert(v60, table.remove(v59));
            v30(v60);
            v28(v59);
            v46({
                type = v9.AnalyticsActions.IncremementAnnotationUndoCount
            });
        end;
    end, {
        v28, 
        v27, 
        v30, 
        v29
    });
    local v64 = v6.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v29 (copy), v27 (copy), v30 (copy), v28 (copy), v46 (copy), v9 (ref)
        if #v29 > 0 then
            local v62 = table.clone(v27);
            local v63 = table.clone(v29);
            table.insert(v62, table.remove(v63));
            v30(v63);
            v28(v62);
            v46({
                type = v9.AnalyticsActions.IncremementAnnotationRedoCount
            });
        end;
    end, {
        v27, 
        v29
    });
    local v71 = v6.useCallback(function() --[[ Line: 160 ]]
        -- upvalues: v27 (copy), v37 (copy), l_ScreenshotManager_0 (ref), v38 (copy), v21 (ref), v5 (ref), v11 (ref), v42 (copy), v25 (ref), v40 (copy), v32 (copy), v46 (copy), v9 (ref), l_ViewportSize_0 (copy), v50 (copy)
        if #v27 == 0 and v37 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v38, nil);
        end;
        if v21() then
            local v66 = v5.List.map(v27, function(v65) --[[ Line: 167 ]]
                return v65.engineSignalItem;
            end);
            local v67 = v11.interpretInstanceListForGUIObjects(v66);
            local v68 = v11.extractItemsFromInterpretations({
                v67
            }, function() --[[ Line: 173 ]]

            end);
            v42(v68);
            task.defer(v68.computation);
        end;
        local v69 = v5.List.map(v27, v25);
        local v70 = v11.extractItemsFromInterpretations(v69, function() --[[ Line: 180 ]]

        end);
        v40(v70);
        v32(true);
        v46({
            type = v9.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y, 
            is_portrait_mode = v50
        });
        v46({
            type = v9.AnalyticsActions.IncrementNextCount
        });
        task.defer(v70.computation);
    end, {
        v27, 
        v32, 
        v40, 
        v37, 
        l_ViewportSize_0, 
        v50
    });
    local v72 = v6.useCallback(function() --[[ Line: 198 ]]
        -- upvalues: v19 (ref), v45 (copy), v26 (copy)
        v19(v45, 2);
        v26.backAction();
    end, {
        v26.backAction, 
        v45
    });
    local v73 = v5.List.map(v27, v23);
    local v78 = v6.useCallback(function(v74, v75, v76) --[[ Line: 210 ]]
        -- upvalues: v32 (copy), v34 (copy), v46 (copy), v9 (ref), v39 (copy), v27 (copy), v18 (ref), l_Players_0 (ref), v37 (copy), v73 (copy), v41 (copy)
        v32(false);
        v34(true);
        v46({
            type = v9.AnalyticsActions.SetExtractionResults, 
            results = v39, 
            final_annotation_count = #v27
        });
        v46({
            type = v9.AnalyticsActions.SetReasonSelection, 
            reason_selection = v74
        });
        v46({
            type = v9.AnalyticsActions.SetSurfaceSelection, 
            surface_selection = v75
        });
        v46({
            type = v9.AnalyticsActions.SetCommentAdded, 
            comment_added = #v76 > 0
        });
        local v77 = v18(l_Players_0.LocalPlayer.UserId, v37, v39, v74, v75, v76, v73, v41);
        if v77 then
            l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v77);
        end;
    end, {
        v39, 
        v41, 
        v32, 
        v34, 
        v37, 
        v27, 
        v73
    });
    local v79 = v6.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v40 (copy), v32 (copy)
        v40(nil);
        v32(false);
    end, {
        v32, 
        v40
    });
    local v80 = v6.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: v34 (copy), v19 (ref), v45 (copy), v26 (copy)
        v34(false);
        v19(v45, 1);
        v26.onReportComplete();
    end, {
        v26.onReportComplete, 
        v27, 
        v34, 
        v45
    });
    local v83 = v6.useCallback(function() --[[ Line: 275 ]]
        -- upvalues: v21 (ref), v27 (copy), v36 (copy)
        if v21() then
            for _, v82 in ipairs(v27) do
                v82.signalConnection:Disconnect();
            end;
        end;
        v36(true);
    end, {
        v36, 
        v27
    });
    local v84 = v6.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: v36 (copy)
        v36(false);
    end, {});
    local v85 = v6.useCallback(function() --[[ Line: 292 ]]
        -- upvalues: v43 (copy), v44 (copy), v46 (copy), v9 (ref), v31 (copy), v28 (copy), v30 (copy)
        if v43 then
            v44(false);
        else
            v46({
                type = v9.AnalyticsActions.SetDidUserResize, 
                did_user_resize = true
            });
        end;
        if not v31 then
            v28({});
            v30({});
        end;
    end, {
        v43, 
        v31
    });
    local v86 = #v27 > 0;
    local v87 = #v29 > 0;
    if v20() then
        v6.useEffect(function() --[[ Line: 315 ]]
            -- upvalues: v47 (copy), l_UserInputService_0 (ref), v72 (copy), v48 (copy)
            if v47 then
                v47:Disconnect();
            end;
            local v89 = l_UserInputService_0.InputEnded:Connect(function(v88) --[[ Line: 320 ]]
                -- upvalues: v72 (ref)
                if v88.KeyCode == Enum.KeyCode.Escape then
                    v72();
                end;
            end);
            v48(v89);
        end, {
            v72
        });
    end;
    return l_withLocalization_0({
        mainTitle = "Feature.ReportAbuse.Label.HighlightProblem", 
        next = "Feature.ReportAbuse.Action.Next"
    })(function(v90) --[[ Line: 333 ]]
        -- upvalues: v6 (ref), v85 (copy), v50 (copy), v16 (ref), v72 (copy), v61 (copy), v64 (copy), v87 (copy), v86 (copy), v27 (copy), v15 (ref), v71 (copy), v17 (ref), v73 (copy), v58 (copy), v83 (copy), v35 (copy), v13 (ref), l_ViewportSize_0 (copy), v84 (copy), v31 (copy), v12 (ref), v78 (copy), v79 (copy), v46 (copy), v33 (copy), v14 (ref), v80 (copy)
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v85
        }, {
            Header = v6.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                AutoButtonColor = false
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                InGameAssetReportModeHeader = if v50 then v6.createElement(v16.PortraitModeHeader, {
                    titleText = v90.mainTitle, 
                    nextText = v90.next, 
                    backAction = v72, 
                    undoAnnotationPoints = v61, 
                    redoAnnotationPoints = v64, 
                    isRedoEnabled = v87, 
                    isUndoEnabled = v86, 
                    annotationPoints = v27
                }) else v6.createElement(v15, {
                    titleText = v90.mainTitle, 
                    nextText = v90.next, 
                    nextAction = v71, 
                    backAction = v72, 
                    undoAnnotationPoints = v61, 
                    redoAnnotationPoints = v64, 
                    isRedoEnabled = v87, 
                    isUndoEnabled = v86, 
                    annotationPoints = v27
                })
            }), 
            Footer = if v50 then v6.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 60), 
                Position = UDim2.new(0, 0, 1, -60), 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false
            }, {
                InGameAssetReportModeFooter = v6.createElement(v16.PortraitModeFooter, {
                    nextAction = v71, 
                    annotationPoints = v27, 
                    nextText = v90.next
                })
            }) else nil, 
            ScreenshotAnnotation = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 1
            }, {
                Highlighter = v6.createElement(v17, {
                    annotationPoints = v73, 
                    handleNewAnnotationPoint = v58, 
                    onExceedMaxAnnotationLimit = v83, 
                    ZIndex = 2
                }, {})
            }), 
            ErrorStateModal = if v35 then v6.createElement(v13, {
                screenSize = l_ViewportSize_0, 
                onBack = v84
            }) else nil, 
            SubmitDialog = if v31 then v6.createElement(v12, {
                screenSize = l_ViewportSize_0, 
                onSubmit = v78, 
                onBack = v79, 
                analyticsDispatch = v46
            }) else nil, 
            ReportCompleteModal = if v33 then v6.createElement(v14, {
                screenSize = l_ViewportSize_0, 
                onClose = v80
            }) else nil
        });
    end);
end;