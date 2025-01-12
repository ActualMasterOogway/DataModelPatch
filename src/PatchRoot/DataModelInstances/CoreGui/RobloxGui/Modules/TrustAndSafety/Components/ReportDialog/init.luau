local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Dependencies);
local v8 = require(v7.GameIcon);
local v9 = require(v7.PlayerCell);
local v10 = require(v7.ThemedTextLabel);
local v11 = require(v7.withLocalization);
local v12 = require(v7.playerInterface);
local v13 = require(l_Parent_0.Actions.NavigateBack);
local v14 = require(l_Parent_0.Actions.EndReportFlow);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Thunks.SendReport);
local v17 = require(l_Parent_0.Components.TextEntryField);
local v18 = require(l_Parent_0.Components.ModalDialog);
local v19 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialog);
local v20 = require(l_Parent_0.Components.ReportAnything.ScreenshotFlowStepHandler);
local v21 = require(l_Parent_0.Utility.SendAnalytics);
local v22 = require(l_Parent_0.Utility.SessionUtility);
local v23 = require(l_Parent_0.Utility.ScreenshotHelper);
local v24 = require(l_Parent_0.Flags.GetFFlagReportAnythingScreenshot);
local v25 = require(l_Parent_0.Flags.GetFFlagReportAnythingMultistepScreenshot);
local v26 = require(l_Parent_0.Actions.ScreenshotAnnotated);
local v27 = require(l_Parent_0.Thunks.FilterIdentifiedAvatars);
local l_Provider_0 = v5.Core.Style.Provider;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Colors_0 = v5.App.Style.Colors;
local l_DropdownMenu_0 = v5.App.Menu.DropdownMenu;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v37 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v38 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v39 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v40 = require(l_CorePackages_0.Packages.React);
local function v42(v41) --[[ Line: 52 ]]
    -- upvalues: v40 (copy), v38 (copy), v37 (copy), v1 (copy)
    if not v40.useContext(v38.Context).voiceEnabled then
        return nil;
    else
        return v40.createElement(v37, v1.Dictionary.join(v41, {}));
    end;
end;
local v43 = {
    "Swearing", 
    "Inappropriate Username", 
    "Bullying", 
    "Scamming", 
    "Dating", 
    "Cheating/Exploiting", 
    "Personal Question", 
    "Offsite Links"
};
local v44 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnHover = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnPress = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v45 = v2.PureComponent:extend("ReportDialog");
v45.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    reportType = v4.optional(v4.valueOf(v15.ReportType)), 
    targetPlayer = v4.optional(v12), 
    placeName = v4.string, 
    screenSize = v4.Vector2, 
    screenshotAnnotationPoints = v4.array(v4.Vector2), 
    navigateBack = v4.optional(v4.callback), 
    canNavigateBack = v4.optional(v4.boolean), 
    sendReport = v4.callback, 
    closeDialog = v4.optional(v4.callback), 
    screenshotAnnotated = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string), 
    currentPage = v4.string
});
v45.init = function(v46) --[[ Line: 110 ]] --[[ Name: init ]]
    v46.state = {
        reasonText = nil, 
        descriptionText = ""
    };
    v46.onReasonChanged = function(v47) --[[ Line: 116 ]]
        -- upvalues: v46 (copy)
        v46:setState({
            reasonText = v47
        });
    end;
    v46.onTextChanged = function(v48) --[[ Line: 122 ]]
        -- upvalues: v46 (copy)
        v46:setState({
            descriptionText = v48
        });
    end;
    v46.onReport = function(v49, v50) --[[ Line: 128 ]]
        -- upvalues: v46 (copy)
        local v51 = v46:getReason();
        v46.props.sendReport(v46.props.reportType, v46.props.targetPlayer, v51, v46.state.descriptionText, v46.props.reportCategory, v49, v50);
    end;
    v46.navigateBack = function() --[[ Line: 142 ]]
        -- upvalues: v46 (copy)
        v46.props.navigateBack(v46.state.reasonText, v46.state.descriptionText ~= "");
    end;
    v46.onCancel = function() --[[ Line: 146 ]]
        -- upvalues: v46 (copy)
        v46.props.closeDialog(v46.state.reasonText, v46.state.descriptionText ~= "");
    end;
    v46.onScreenshotAnnotated = function(v52) --[[ Line: 150 ]]
        -- upvalues: v46 (copy)
        v46.props.screenshotAnnotated(v46.props.reportCategory, v46.props.reportType, v52);
    end;
end;
v45.getReason = function(v53) --[[ Line: 155 ]] --[[ Name: getReason ]]
    -- upvalues: v15 (copy)
    if v53.props.reportType == v15.ReportType.Player then
        return v53.state.reasonText;
    elseif v53.props.reportType == v15.ReportType.Place then
        return "Inappropriate Content";
    else
        return nil;
    end;
end;
v45.canReport = function(v54) --[[ Line: 165 ]] --[[ Name: canReport ]]
    local v55 = v54:getReason() ~= nil;
    local v56 = utf8.len(utf8.nfcnormalize(v54.state.descriptionText));
    local v57 = false;
    if v56 >= 0 then
        v57 = v56 <= 160;
    end;
    return v55 and v57;
end;
v45.renderPlayerInfo = function(v58) --[[ Line: 172 ]] --[[ Name: renderPlayerInfo ]]
    -- upvalues: v15 (copy), l_withStyle_0 (copy), v1 (copy), v44 (copy), v2 (copy), l_Provider_0 (copy), v9 (copy), l_isPlayerVerified_0 (copy), v42 (copy), l_default_0 (copy), v39 (copy)
    local v59 = v58.props.reportCategory == v15.Category.Voice;
    return l_withStyle_0(function(v60) --[[ Line: 175 ]]
        -- upvalues: v1 (ref), v44 (ref), v59 (copy), v58 (copy), v2 (ref), l_Provider_0 (ref), v9 (ref), l_isPlayerVerified_0 (ref), v42 (ref), l_default_0 (ref), v39 (ref)
        local v61 = v1.Dictionary.join(v60.Theme, v44);
        local v62 = v1.Dictionary.join(v60, {
            Theme = v61
        });
        local v63 = 0;
        if v59 and v58.props.isReportDialogOpen then
            v63 = v63 + 1;
        end;
        return v2.createElement(l_Provider_0, {
            style = v62
        }, {
            v2.createElement(v9, {
                userId = v58.props.targetPlayer.UserId, 
                username = v58.props.targetPlayer.Name, 
                displayName = v58.props.targetPlayer.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v58.props.targetPlayer), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = 1, 
                key = tostring(v58.props.targetPlayer.UserId), 
                memoKey = v63
            }, {
                VoiceIndicator = v59 and v58.props.isReportDialogOpen and v2.createElement(v42, {
                    userId = tostring(v58.props.targetPlayer.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function() --[[ Line: 206 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref), v58 (ref), v39 (ref)
                        l_default_0:ToggleMutePlayer(v58.props.targetPlayer.UserId, v39.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            })
        });
    end);
end;
v45.renderDropDownMenu = function(v64) --[[ Line: 219 ]] --[[ Name: renderDropDownMenu ]]
    -- upvalues: v2 (copy), v11 (copy), v43 (copy), l_DropdownMenu_0 (copy)
    if not v64.props.isReportDialogOpen then
        return nil;
    else
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 72), 
            Size = UDim2.new(1, 0, 0, 48), 
            ZIndex = 10
        }, {
            DropDown = v11({
                menu1 = "CoreScripts.InGameMenu.Report.AbuseSwearing", 
                menu2 = "CoreScripts.InGameMenu.Report.AbuseUsername", 
                menu3 = "CoreScripts.InGameMenu.Report.AbuseBullying", 
                menu4 = "CoreScripts.InGameMenu.Report.AbuseScamming", 
                menu5 = "CoreScripts.InGameMenu.Report.AbuseDating", 
                menu6 = "CoreScripts.InGameMenu.Report.AbuseExploiting", 
                menu7 = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion", 
                menu8 = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink", 
                placeHolderText = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
            })(function(v65) --[[ Line: 240 ]]
                -- upvalues: v43 (ref), v64 (copy), v2 (ref), l_DropdownMenu_0 (ref)
                local v66 = {};
                local v67 = {};
                for v68, v69 in ipairs(v43) do
                    local v70 = v65["menu" .. tostring(v68)];
                    table.insert(v66, {
                        text = v70
                    });
                    v67[v70] = v69;
                end;
                local function v73(v71) --[[ Line: 251 ]] --[[ Name: onDropDownChanged ]]
                    -- upvalues: v67 (copy), v64 (ref)
                    local v72 = v67[v71];
                    v64.onReasonChanged(v72);
                end;
                return v2.createElement(l_DropdownMenu_0, {
                    placeholder = v65.placeHolderText, 
                    onChange = v73, 
                    height = UDim.new(0, 48), 
                    screenSize = v64.props.screenSize, 
                    cellDatas = v66, 
                    showDropShadow = true, 
                    fixedListHeight = 171
                });
            end)
        });
    end;
end;
v45.renderPlayerContents = function(v74) --[[ Line: 270 ]] --[[ Name: renderPlayerContents ]]
    -- upvalues: v11 (copy), v2 (copy), v17 (copy)
    return v11({
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v75) --[[ Line: 273 ]]
        -- upvalues: v2 (ref), v74 (copy), v17 (ref)
        return v2.createFragment({
            PlayerInfo = v74:renderPlayerInfo(), 
            DropDownMenu = v74:renderDropDownMenu(), 
            TextField = v2.createElement(v17, {
                enabled = v74.props.isReportDialogOpen, 
                text = v74.state.descriptionText, 
                textChanged = v74.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v75.placeHolderText, 
                Position = UDim2.fromOffset(0, 132), 
                Size = UDim2.new(1, 0, 1, -132)
            })
        });
    end);
end;
v45.renderPlaceContents = function(v76) --[[ Line: 291 ]] --[[ Name: renderPlaceContents ]]
    -- upvalues: v11 (copy), v2 (copy), v8 (copy), v10 (copy), v17 (copy)
    return v11({
        labelText = {
            "CoreScripts.InGameMenu.Report.ReportingGame"; 
            RBX_NAME = v76.props.placeName
        }, 
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v77) --[[ Line: 298 ]]
        -- upvalues: v2 (ref), v8 (ref), v10 (ref), v17 (ref), v76 (copy)
        return v2.createFragment({
            PlaceInfo = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(0, 24), 
                Size = UDim2.new(1, 0, 0, 64)
            }, {
                GameIcon = v2.createElement(v8, {
                    gameId = game.GameId, 
                    iconSize = 64, 
                    cornerRadius = UDim.new(0, 8)
                }), 
                Label = v2.createElement(v10, {
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, -76, 0, 40), 
                    Text = v77.labelText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            TextField = v2.createElement(v17, {
                enabled = v76.props.isReportDialogOpen, 
                text = v76.state.descriptionText, 
                textChanged = v76.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v77.placeHolderText, 
                Position = UDim2.fromOffset(0, 112), 
                Size = UDim2.new(1, 0, 1, -112)
            })
        });
    end);
end;
v45.renderContents = function(v78) --[[ Line: 336 ]] --[[ Name: renderContents ]]
    -- upvalues: v15 (copy)
    if v78.props.reportType == v15.ReportType.Player then
        return v78:renderPlayerContents();
    elseif v78.props.reportType == v15.ReportType.Place then
        return v78:renderPlaceContents();
    else
        return nil;
    end;
end;
local v79 = {
    [v15.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v15.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v15.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other", 
    [v15.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
};
v45.categoryTitle = function(v80) --[[ Line: 353 ]] --[[ Name: categoryTitle ]]
    -- upvalues: v15 (copy), v79 (copy)
    if v80.props.reportType == v15.ReportType.Place then
        return v79[v15.Category.Experience];
    else
        return v79[v80.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle";
    end;
end;
v45.render = function(v81) --[[ Line: 360 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v24 (copy), v15 (copy), v25 (copy), v40 (copy), v20 (copy), v23 (copy), v19 (copy), v2 (copy), v18 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return v11({
        titleText = v81:categoryTitle(), 
        cancelText = "CoreScripts.InGameMenu.Cancel", 
        reportText = "CoreScripts.InGameMenu.Report.SendReport", 
        toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport", 
        toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription"
    })(function(v82) --[[ Line: 367 ]]
        -- upvalues: v24 (ref), v81 (copy), v15 (ref), v25 (ref), v40 (ref), v20 (ref), v23 (ref), v19 (ref), v2 (ref), v18 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref)
        if v24() and v81.props.currentPage == v15.Page.ScreenshotDialog then
            if v25() then
                return v40.createElement(v20, {
                    dismissAction = v81.onCancel, 
                    titleText = "Highlight What's Wrong", 
                    entryPoint = "experience", 
                    screenshot = v23:GetScreenshotContentId(), 
                    skipAnnotationAction = function() --[[ Line: 376 ]] --[[ Name: skipAnnotationAction ]]

                    end, 
                    restartAction = function() --[[ Line: 377 ]] --[[ Name: restartAction ]]

                    end, 
                    reportAction = function() --[[ Line: 378 ]] --[[ Name: reportAction ]]

                    end
                });
            else
                return v40.createElement(v19, {
                    screenshot = v23:GetScreenshotContentId(), 
                    titleText = "Highlight What's Wrong", 
                    backAction = if v81.props.canNavigateBack then v81.navigateBack else nil, 
                    dismissAction = v81.onCancel, 
                    reportAction = v81.onScreenshotAnnotated, 
                    initialAnnotationPoints = v81.props.screenshotAnnotationPoints
                });
            end;
        else
            return v2.createElement(v18, {
                visible = v81.props.isReportDialogOpen, 
                screenSize = v81.props.screenSize, 
                titleText = v82.titleText, 
                contents = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    Contents = v81:renderContents()
                }), 
                actionButtons = v2.createElement(l_ButtonStack_0, {
                    buttonHeight = 48, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v81.onCancel, 
                                text = v82.cancelText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = not v81:canReport(), 
                                onActivated = function() --[[ Line: 420 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v81 (ref), v82 (copy)
                                    return v81.onReport(v82.toastDefaultTitle, v82.toastDefaultDescription);
                                end, 
                                text = v82.reportText
                            }
                        }
                    }
                }), 
                onDismiss = v81.onCancel, 
                onBackButtonActivated = if v81.props.canNavigateBack then v81.navigateBack else nil
            });
        end;
    end);
end;
v45.didUpdate = function(v83, v84) --[[ Line: 434 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v84.isReportDialogOpen and not v83.props.isReportDialogOpen then
        v83:setState({
            reasonText = v2.None, 
            descriptionText = ""
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v85, _) --[[ Line: 444 ]]
    -- upvalues: v15 (copy)
    return {
        reportCategory = v85.report.reportCategory, 
        isReportDialogOpen = v85.report.currentPage == v15.Page.ReportForm, 
        currentPage = v85.report.currentPage, 
        reportType = v85.report.reportType, 
        targetPlayer = v85.report.targetPlayer, 
        canNavigateBack = #v85.report.history > 1, 
        placeName = v85.placeInfo.name, 
        screenSize = v85.displayOptions.screenSize, 
        screenshotAnnotationPoints = v85.report.screenshotAnnotationPoints
    };
end, function(v87) --[[ Line: 456 ]]
    -- upvalues: v13 (copy), v21 (copy), v15 (copy), v14 (copy), v22 (copy), v27 (copy), v26 (copy), v16 (copy)
    return {
        navigateBack = function(v88, v89) --[[ Line: 458 ]] --[[ Name: navigateBack ]]
            -- upvalues: v87 (copy), v13 (ref), v21 (ref), v15 (ref)
            v87(v13());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowBack, {
                source = v15.Page.ReportForm, 
                reason = v88, 
                descriptionTextChanged = v89
            });
        end, 
        closeDialog = function(v90, v91) --[[ Line: 466 ]] --[[ Name: closeDialog ]]
            -- upvalues: v87 (copy), v14 (ref), v21 (ref), v15 (ref), v22 (ref)
            v87(v14());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowAbandoned, {
                source = v15.Page.ReportForm, 
                reason = v90, 
                descriptionTextChanged = v91
            });
            v22.endAbuseReportSession();
        end, 
        screenshotAnnotated = function(v92, v93, v94) --[[ Line: 476 ]] --[[ Name: screenshotAnnotated ]]
            -- upvalues: v87 (copy), v27 (ref), v26 (ref)
            v87(v27(v94));
            v87(v26(v92, v93, v94));
        end, 
        sendReport = function(v95, v96, v97, v98, v99, v100, v101) --[[ Line: 480 ]] --[[ Name: sendReport ]]
            -- upvalues: v87 (copy), v16 (ref)
            v87(v16(v95, v96, v97, v98, v99, v100, v101));
        end
    };
end)(v45);