local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.Style);
local v7 = require(l_script_FirstAncestor_0.Components.ReportTypeSelector);
local v8 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportModes_0 = v8.ReportModes;
local l_ReportTypes_0 = v8.ReportTypes;
local v11 = require(l_script_FirstAncestor_0.Components.SelectInSceneReportMenu);
local v12 = require(l_script_FirstAncestor_0.Components.Containers.ReportPersonMenuItemsContainer);
local v13 = require(l_script_FirstAncestor_0.Components.Containers.ReportExperienceMenuItemsContainer);
local v14 = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v15 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v16 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
local v17 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v21 = require(l_script_FirstAncestor_0.Hooks.useReportAnythingWithScreenshot);
local v22 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v23 = require(l_script_FirstAncestor_0.Reducers.analyticsReducer);
local v24 = require(l_script_FirstAncestor_0.Components.createCleanup);
local v25 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local l_isShowEUDSAIllegalContentReportingLink_0 = v25.isShowEUDSAIllegalContentReportingLink;
local l_DSAReportLink_0 = v25.DSAReportLink;
local l_StyleProviderWithDefaultTheme_0 = v6.StyleProviderWithDefaultTheme;
local v29 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v30 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v30.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v30.FocusNavigableSurfaceIdentifierEnum;
local v33 = v29.FocusNavigationService.new(v29.EngineInterface.CoreGui);
local l_GetFFlagSelectInSceneReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelectInSceneReportMenu;
local l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAbuseReportMenuConsoleSupportRefactor;
local l_FStringReportMenuIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer;
local v37 = game:DefineFastString("SelectInSceneIXPField", "EnableSelectInScene");
local v38 = require(l_script_FirstAncestor_0.Utility.isShowSelectInSceneReportMenu);
local l_SegmentedControl_0 = require(l_CorePackages_0.Packages.UIBlox).App.Control.SegmentedControl;
local v40 = {
    l_ReportModes_0.Classic, 
    l_ReportModes_0.SelectInScene
};
local v41 = {
    l_ReportTypes_0.Person, 
    l_ReportTypes_0.Experience
};
local function _() --[[ Line: 69 ]] --[[ Name: isInSelectInSceneExperiment ]]
    -- upvalues: l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v37 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 71 ]]
        -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
        return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
    end);
    if not l_status_0 or not l_result_0 or l_result_0[v37] == nil then
        return false;
    else
        l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
        return l_result_0[v37];
    end;
end;
local function v83(v45) --[[ Line: 83 ]]
    -- upvalues: v5 (copy), v23 (copy), v8 (copy), v40 (copy), v41 (copy), v24 (copy), v21 (copy), v22 (copy), l_useLocalization_0 (copy), v16 (copy), v17 (copy), v15 (copy), l_GetFFlagSelectInSceneReportMenu_0 (copy), l_Players_0 (copy), v38 (copy), l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v37 (copy), v14 (copy), l_ReportTypes_0 (copy), v12 (copy), v13 (copy), l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_SegmentedControl_0 (copy), l_ReportModes_0 (copy), v11 (copy), v7 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_DSAReportLink_0 (copy)
    local v46, v47 = v5.useState(false);
    local v48, v49 = v5.useState(1);
    local v50, v51 = v5.useState(1);
    local v52, v53 = v5.useState(nil);
    local v54, v55 = v5.useState(0);
    local v56, v57 = v5.useState(false);
    local v58, v59 = v5.useState(false);
    local v60, v61 = v5.useState({
        width = 0, 
        height = 0
    });
    local v62 = false;
    if v60.width < v60.height then
        v62 = v60.width < 700;
    end;
    local v63, v64 = v5.useReducer(v23, v8.AnalyticsInitialState);
    local v65 = v40[v48];
    local v66 = v41[v50];
    local v67 = v5.useCallback(v24(v63, v64, v53, v66), {
        v63, 
        v50
    });
    local v68, v69 = v21(v46, v45.hideReportTab, v45.showReportTab, v67);
    local v70 = v22();
    local v71 = l_useLocalization_0(v8.localizationKeys);
    v5.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v45 (copy), v47 (copy), v16 (ref), v17 (ref), v53 (copy), v55 (copy), v15 (ref), v69 (copy), v8 (ref)
        v45.registerOnReportTabDisplayed(function() --[[ Line: 111 ]]
            -- upvalues: v47 (ref)
            v47(true);
        end);
        v45.registerOnReportTabHidden(function() --[[ Line: 114 ]]
            -- upvalues: v47 (ref), v16 (ref), v17 (ref)
            v47(false);
            v16.unmountAnnotationPage();
            v17.unmountModalSelector();
        end);
        v45.registerSetNextPlayerToReport(function(v72) --[[ Line: 119 ]]
            -- upvalues: v53 (ref)
            v53(v72);
        end);
        v45.registerOnMenuWidthChange(function(v73) --[[ Line: 122 ]]
            -- upvalues: v55 (ref)
            v55(v73);
        end);
        v45.registerOnSettingsHidden(function() --[[ Line: 125 ]]
            -- upvalues: v15 (ref), v69 (ref), v8 (ref)
            if v15:getAbuseReportSessionEntryPoint() == "" then
                v69({
                    type = v8.ReportAnythingActions.ClearAll
                });
            end;
        end);
    end, {});
    v5.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: v46 (copy), v51 (copy), l_GetFFlagSelectInSceneReportMenu_0 (ref), v49 (copy), v59 (copy), l_Players_0 (ref), v57 (copy)
        if not v46 then
            v51(0);
            if l_GetFFlagSelectInSceneReportMenu_0() then
                v49(1);
                v59(false);
                return;
            end;
        elseif #l_Players_0:GetPlayers() <= 1 then
            v57(true);
            v51(2);
            return;
        else
            v51(1);
            v57(false);
        end;
    end, {
        v46
    });
    v5.useEffect(function() --[[ Line: 157 ]]
        -- upvalues: v46 (copy), v64 (copy), v8 (ref), v15 (ref), v38 (ref), l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref), v37 (ref), v59 (copy), v61 (copy)
        if v46 then
            v64({
                type = v8.AnalyticsActions.SetMenuOpenedTimestamp, 
                timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
            });
            v15:startAbuseReportSession("ReportPage");
            if v38(v64) then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 71 ]]
                    -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
                    return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
                end);
                local v76;
                if not l_status_1 or not l_result_1 or l_result_1[v37] == nil then
                    v76 = false;
                else
                    l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
                    v76 = l_result_1[v37];
                end;
                if v76 then
                    v59(true);
                end;
            end;
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v61({
                width = l_ViewportSize_0.X, 
                height = l_ViewportSize_0.Y
            });
            v64({
                type = v8.AnalyticsActions.SetViewportInformation, 
                viewportSizeX = l_ViewportSize_0.X, 
                viewportSizeY = l_ViewportSize_0.Y
            });
        end;
    end, {
        v46, 
        v54
    });
    local v79 = nil;
    local v80 = {
        onReportComplete = v45.onReportComplete, 
        reportAnythingAnalytics = v14, 
        reportAnythingState = v68, 
        reportAnythingDispatch = v69, 
        hideReportTab = v45.hideReportTab, 
        isReportTabVisible = v46, 
        showReportSentPage = v45.showReportSentPage, 
        analyticsState = v63, 
        analyticsDispatch = v64, 
        preselectedPlayer = v52, 
        setPreselectedPlayer = v53, 
        menuWidth = v54, 
        viewportDimension = v60
    };
    if v66 == l_ReportTypes_0.Person then
        v79 = v5.createElement(v12, {
            utilityProps = v80, 
            isSmallPortraitViewport = v62
        });
    elseif v66 == l_ReportTypes_0.Experience then
        v79 = v5.createElement(v13, {
            utilityProps = v80, 
            isSmallPortraitViewport = v62
        });
    end;
    if l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0() then
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v70.TopPadding)
        }, {
            FocusNavigationCoreScriptsWrapper = v5.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
                selectionGroupName = v8.AbuseReportMenuRootName, 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                automaticSize = Enum.AutomaticSize.Y, 
                size = UDim2.new(1, 0, 0, 0)
            }, {
                [v8.AbuseReportMenuPlaceholderFrame] = v5.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    MenuLayoutFrame = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        Layout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = 0, 
                            Padding = UDim.new(0, 12)
                        }), 
                        SelectInSceneToggleFrame = if v58 then v5.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            LayoutOrder = 0
                        }, {
                            SelectInSceneToggle = v5.createElement(l_SegmentedControl_0, {
                                onTabActivated = function(v81) --[[ Line: 260 ]] --[[ Name: onTabActivated ]]
                                    -- upvalues: v49 (copy)
                                    v49(v81);
                                end, 
                                selectedTabIndex = v48, 
                                tabs = {
                                    {
                                        tabName = v71.BuildAReport
                                    }, 
                                    {
                                        tabName = v71.SelectInScene
                                    }
                                }, 
                                width = UDim.new(0, v54)
                            })
                        }) else nil, 
                        Menu = if v65 == l_ReportModes_0.SelectInScene then v5.createElement(v11, {
                            hideReportTab = v45.hideReportTab
                        }) else if v65 == l_ReportModes_0.Classic then v5.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 1
                        }, {
                            Layout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, v70.ItemPadding)
                            }), 
                            ReportTypeSelector = v5.createElement(v7, {
                                label = v71.ReportType, 
                                abuseType = v71[v41[v50]], 
                                layoutOrder = 0, 
                                utilityProps = v80, 
                                isSelectionDisabled = v56, 
                                menuWidth = v54, 
                                isSmallPortraitViewport = v62, 
                                onClickLeft = function() --[[ Line: 297 ]] --[[ Name: onClickLeft ]]
                                    -- upvalues: v69 (copy), v8 (ref), v64 (copy), v51 (copy), v50 (copy), v41 (ref)
                                    v69({
                                        type = v8.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v64({
                                        type = v8.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v51((v50 - 1 - 1) % #v41 + 1);
                                end, 
                                onClickRight = function() --[[ Line: 307 ]] --[[ Name: onClickRight ]]
                                    -- upvalues: v69 (copy), v8 (ref), v64 (copy), v51 (copy), v50 (copy), v41 (ref)
                                    v69({
                                        type = v8.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v64({
                                        type = v8.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v51((v50 - 1 + 1) % #v41 + 1);
                                end
                            }), 
                            MenuItemsContainer = v5.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                MenuItems = v79
                            }), 
                            DSALinkFrame = if l_isShowEUDSAIllegalContentReportingLink_0() then v5.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                DSALink = v5.createElement(l_DSAReportLink_0)
                            }) else nil
                        }) else nil
                    })
                })
            })
        });
    else
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v70.TopPadding)
        }, {
            MenuLayoutFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Layout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = 0, 
                    Padding = UDim.new(0, 12)
                }), 
                SelectInSceneToggleFrame = if v58 then v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    LayoutOrder = 0
                }, {
                    SelectInSceneToggle = v5.createElement(l_SegmentedControl_0, {
                        onTabActivated = function(v82) --[[ Line: 369 ]] --[[ Name: onTabActivated ]]
                            -- upvalues: v49 (copy)
                            v49(v82);
                        end, 
                        selectedTabIndex = v48, 
                        tabs = {
                            {
                                tabName = v71.BuildAReport
                            }, 
                            {
                                tabName = v71.SelectInScene
                            }
                        }, 
                        width = UDim.new(0, v54)
                    })
                }) else nil, 
                Menu = if v65 == l_ReportModes_0.SelectInScene then v5.createElement(v11, {
                    hideReportTab = v45.hideReportTab
                }) else if v65 == l_ReportModes_0.Classic then v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 1
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v70.ItemPadding)
                    }), 
                    ReportTypeSelector = v5.createElement(v7, {
                        label = v71.ReportType, 
                        abuseType = v71[v41[v50]], 
                        layoutOrder = 0, 
                        utilityProps = v80, 
                        isSelectionDisabled = v56, 
                        menuWidth = v54, 
                        isSmallPortraitViewport = v62, 
                        onClickLeft = function() --[[ Line: 406 ]] --[[ Name: onClickLeft ]]
                            -- upvalues: v69 (copy), v8 (ref), v64 (copy), v51 (copy), v50 (copy), v41 (ref)
                            v69({
                                type = v8.ReportAnythingActions.ClearAnnotationFlowProperties
                            });
                            v64({
                                type = v8.AnalyticsActions.IncrementExperiencePersonChanged
                            });
                            v51((v50 - 1 - 1) % #v41 + 1);
                        end, 
                        onClickRight = function() --[[ Line: 416 ]] --[[ Name: onClickRight ]]
                            -- upvalues: v69 (copy), v8 (ref), v64 (copy), v51 (copy), v50 (copy), v41 (ref)
                            v69({
                                type = v8.ReportAnythingActions.ClearAnnotationFlowProperties
                            });
                            v64({
                                type = v8.AnalyticsActions.IncrementExperiencePersonChanged
                            });
                            v51((v50 - 1 + 1) % #v41 + 1);
                        end
                    }), 
                    MenuItemsContainer = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        MenuItems = v79
                    }), 
                    DSALinkFrame = if l_isShowEUDSAIllegalContentReportingLink_0() then v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        DSALink = v5.createElement(l_DSAReportLink_0)
                    }) else nil
                }) else nil
            })
        });
    end;
end;
return function(v84) --[[ Line: 452 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 (copy), v5 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), v29 (copy), v33 (copy), v8 (copy), v83 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v85 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0() then
        return v5.createElement(l_StyleProviderWithDefaultTheme_0, {
            withDarkTheme = true
        }, {
            LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                localization = v85
            }, {
                FocusNavigationProvider = v5.createElement(v29.FocusNavigationContext.Provider, {
                    value = v33
                }, {
                    [v8.AbuseReportMenuRootName] = v5.createElement(v83, v84)
                })
            })
        });
    else
        return v5.createElement(l_StyleProviderWithDefaultTheme_0, {
            withDarkTheme = true
        }, {
            LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                localization = v85
            }, {
                FocusNavigationProvider = v5.createElement(v29.FocusNavigationContext.Provider, {
                    value = v33
                }, {
                    FocusNavigationCoreScriptsWrapper = v5.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
                        selectionGroupName = v8.AbuseReportMenuRootName, 
                        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                        automaticSize = Enum.AutomaticSize.Y, 
                        size = UDim2.new(1, 0, 0, 0)
                    }, {
                        [v8.AbuseReportMenuRootName] = v5.createElement(v83, v84)
                    })
                })
            })
        });
    end;
end;