local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.BarOnTopScrollingFrame);
local v10 = require(v8.Divider);
local v11 = require(v8.PlayerCell);
local v12 = require(v8.PlayerSearchPredicate);
local v13 = require(v8.SearchBar);
local _ = require(v8.ThemedTextLabel);
local v15 = require(v8.withLocalization);
local v16 = require(l_Parent_0.Actions.NavigateBack);
local v17 = require(l_Parent_0.Actions.EndReportFlow);
local v18 = require(l_Parent_0.Actions.SelectReportListing);
local _ = require(l_Parent_0.Resources.Assets);
local v20 = require(l_Parent_0.Resources.Constants);
local v21 = require(l_Parent_0.Components.ModalDialog);
local v22 = require(l_Parent_0.Components.GameCell);
local v23 = require(l_Parent_0.Utility.SendAnalytics);
local v24 = require(l_Parent_0.Utility.SessionUtility);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v29 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v30 = require(l_CorePackages_0.Packages.React);
local l_Colors_0 = v5.App.Style.Colors;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Provider_0 = v5.Core.Style.Provider;
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v41 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v42 = v3.PureComponent:extend("ReportMenu");
local function v44(v43) --[[ Line: 66 ]]
    -- upvalues: v30 (copy), v28 (copy), v27 (copy), v2 (copy)
    if not v30.useContext(v28.Context).voiceEnabled then
        return nil;
    else
        return v30.createElement(v27, v2.Dictionary.join(v43, {}));
    end;
end;
v42.validateProps = v6.strictInterface({
    isReportMenuOpen = v6.boolean, 
    screenSize = v6.Vector2, 
    closeDialog = v6.callback, 
    openReportDialog = v6.callback, 
    canNavigateBack = v6.boolean, 
    reportCategory = v6.optional(v6.string), 
    navigateBack = v6.optional(v6.callback)
});
v42.init = function(v45) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_default_0 (copy)
    v45.scrollingFrameRef = v3.createRef();
    v45.state = {
        isFilterMode = false, 
        filterText = nil
    };
    v45.onSearch = function() --[[ Line: 92 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            isFilterMode = true, 
            filterText = ""
        });
    end;
    v45.onTextChanged = function(v46) --[[ Line: 99 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            filterText = v46
        });
    end;
    v45.onCancel = function() --[[ Line: 105 ]]
        -- upvalues: v45 (copy), v3 (ref)
        v45:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
    end;
    v45.scrollToTop = function() --[[ Line: 112 ]]
        -- upvalues: v45 (copy)
        local v47 = v45.scrollingFrameRef:getValue();
        if v47 then
            v47:scrollToTop();
        end;
    end;
    v45.navigateBack = function() --[[ Line: 119 ]]
        -- upvalues: v45 (copy)
        v45.props.navigateBack(v45.state.filterText ~= nil);
    end;
    v45.closeDialog = function() --[[ Line: 123 ]]
        -- upvalues: v45 (copy)
        v45.props.closeDialog(v45.state.filterText ~= nil);
    end;
    v45.layoutBindings = {};
    v45.getLayoutBinding = function(v48, v49) --[[ Line: 128 ]]
        -- upvalues: v45 (copy), v3 (ref)
        local v50 = v45.layoutBindings[v48];
        if not v50 then
            local v51, v52 = v3.createBinding(v49);
            v50 = {
                valueBinding = v51, 
                setValue = v52, 
                value = v49
            };
            v45.layoutBindings[v48] = v50;
        end;
        if v50.value ~= v49 then
            v50.value = v49;
            v50.setValue(v49);
        end;
        return v50.valueBinding;
    end;
    v45.playerIsVoiceActive = function(v53) --[[ Line: 148 ]]
        -- upvalues: l_default_0 (ref)
        return l_default_0.participants[tostring(v53)] ~= nil;
    end;
    v45.sortedUserIds = {};
end;
local function v56(v54, v55) --[[ Line: 155 ]] --[[ Name: sortPlayers ]]
    return v54.DisplayName:lower() < v55.DisplayName:lower();
end;
v42.getPlayerList = function(v57) --[[ Line: 159 ]] --[[ Name: getPlayerList ]]
    -- upvalues: v2 (copy), l_Players_0 (copy), v56 (copy), v12 (copy)
    local v58 = {};
    local v59 = v2.List.sort(l_Players_0:GetPlayers(), v56);
    for _, v61 in ipairs(v59) do
        if v61 ~= l_Players_0.LocalPlayer then
            if not v57.state.isFilterMode then
                table.insert(v58, v61);
            elseif v12(v57.state.filterText, v61.Name, v61.DisplayName) then
                table.insert(v58, v61);
            end;
        end;
    end;
    return (v2.List.sort(v58, function(v62, v63) --[[ Line: 175 ]]
        return v62.DisplayName:lower() < v63.DisplayName:lower();
    end));
end;
local v64 = {
    [v20.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v20.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v20.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
};
v42.categoryTitle = function(v65) --[[ Line: 187 ]] --[[ Name: categoryTitle ]]
    -- upvalues: v64 (copy)
    return v64[v65.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle";
end;
v42.renderHeaderBar = function(v66) --[[ Line: 191 ]] --[[ Name: renderHeaderBar ]]
    -- upvalues: l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), l_makeBackButton_0 (copy), l_HeaderBar_0 (copy), v3 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v15 (copy), v13 (copy)
    local v67 = nil;
    v67 = if v66.props.canNavigateBack then if l_GetFFlagUIBloxUseNewHeaderBar_0() then l_makeBackButton_0(v66.navigateBack) else l_HeaderBar_0.renderLeft.backButton(v66.navigateBack) else function() --[[ Line: 198 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v66 (copy)
        return v3.createElement(l_IconButton_0, {
            iconSize = l_IconSize_0.Medium, 
            icon = l_Images_0["icons/navigation/close"], 
            onActivated = v66.closeDialog
        });
    end;
    if not v66.state.isFilterMode then
        return v15({
            titleText = v66:categoryTitle()
        })(function(v68) --[[ Line: 210 ]]
            -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v67 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v66 (copy)
            return v3.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                barHeight = 48, 
                renderLeft = v67, 
                renderRight = function() --[[ Line: 215 ]] --[[ Name: renderRight ]]
                    -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v66 (ref)
                    return v3.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/common/search"], 
                        onActivated = v66.onSearch
                    });
                end, 
                onHeaderActivated = v66.scrollToTop, 
                title = v68.titleText
            });
        end);
    else
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(24, 6), 
            Size = UDim2.new(1, -48, 1, -12)
        }, {
            v3.createElement(v13, {
                size = UDim2.fromScale(1, 1), 
                text = v66.state.filterText, 
                autoCaptureFocus = true, 
                onTextChanged = v66.onTextChanged, 
                onCancelled = v66.onCancel
            })
        });
    end;
end;
v42.renderContents = function(v69) --[[ Line: 243 ]] --[[ Name: renderContents ]]
    -- upvalues: v20 (copy), v3 (copy), v22 (copy), l_default_0 (copy), v10 (copy), v11 (copy), l_isPlayerVerified_0 (copy), v44 (copy), v29 (copy), l_withStyle_0 (copy), v2 (copy), v41 (copy), l_Provider_0 (copy), v9 (copy)
    local l_props_0 = v69.props;
    local v71 = v69.props.reportCategory == v20.Category.Voice;
    local v72 = 0;
    local v73 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    if not v69.state.isFilterMode and v69.props.reportCategory == v20.Category.None then
        v73.GameCell = v3.createElement(v22, {
            gameId = game.GameId, 
            layoutOrder = v69.getLayoutBinding("GameCell", v72), 
            onActivated = function() --[[ Line: 260 ]] --[[ Name: onActivated ]]
                -- upvalues: l_props_0 (copy), v20 (ref)
                l_props_0.openReportDialog(v20.ReportType.Place, nil);
            end
        });
    end;
    v72 = v72 + 1;
    local v74 = 72;
    local v75 = v69:getPlayerList();
    local v76 = {};
    if v71 then
        v76 = l_default_0:getRecentUsersInteractionData();
    end;
    v69.sortedUserIds = {};
    for _, v78 in pairs(v75) do
        local v79 = tostring(v78.UserId);
        if not v71 or v76[tostring(v78.UserId)] then
            table.insert(v69.sortedUserIds, v78.UserId);
            local v80 = 0;
            if v71 then
                v80 = v80 + 1;
            end;
            if v69.props.isReportMenuOpen then
                v80 = v80 + 2;
            end;
            v73["Divider" .. v79] = v3.createElement(v10, {
                LayoutOrder = v69.getLayoutBinding("Divider" .. v79, v72), 
                Size = UDim2.new(1, 0, 0, 1)
            });
            v72 = v72 + 1;
            v73["PlayerCell" .. v79] = v3.createElement(v11, {
                userId = v78.UserId, 
                username = v78.Name, 
                displayName = v78.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v78), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = v69.getLayoutBinding("PlayerCell" .. v79, v72), 
                onActivated = function() --[[ Line: 305 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_props_0 (copy), v20 (ref), v78 (copy)
                    l_props_0.openReportDialog(v20.ReportType.Player, v78);
                end, 
                memoKey = v80
            }, {
                VoiceIndicator = v71 and v69.props.isReportMenuOpen and v3.createElement(v44, {
                    userId = tostring(v78.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function() --[[ Line: 317 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref), v78 (copy), v29 (ref)
                        l_default_0:ToggleMutePlayer(v78.UserId, v29.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            });
            v72 = v72 + 1;
            v74 = v74 + 73;
        end;
    end;
    v73.DividerEnd = v3.createElement(v10, {
        LayoutOrder = v69.getLayoutBinding("DividerEnd", v72), 
        Size = UDim2.new(1, 0, 0, 1)
    });
    v72 = v72 + 1;
    return l_withStyle_0(function(v81) --[[ Line: 337 ]]
        -- upvalues: v2 (ref), v41 (ref), v3 (ref), l_Provider_0 (ref), v9 (ref), v74 (ref), v69 (copy), v73 (copy)
        local v82 = v2.Dictionary.join(v81.Theme, v41);
        local v83 = v2.Dictionary.join(v81, {
            Theme = v82
        });
        return v3.createElement(l_Provider_0, {
            style = v83
        }, {
            v3.createElement(v9, {
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, v74), 
                scrollingFrameRef = v69.scrollingFrameRef
            }, v73)
        });
    end);
end;
v42.render = function(v84) --[[ Line: 354 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v21 (copy)
    local v85 = v84.props.reportCategory ~= nil;
    return v3.createFragment({
        ModalDialog = v3.createElement(v21, {
            visible = v84.props.isReportMenuOpen, 
            screenSize = v84.props.screenSize, 
            headerBar = v84:renderHeaderBar(), 
            showCloseButton = not v85, 
            contents = v84:renderContents(), 
            onDismiss = v84.closeDialog
        })
    });
end;
v42.didUpdate = function(v86, v87) --[[ Line: 370 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy)
    if v87.isReportMenuOpen and not v86.props.isReportMenuOpen then
        v86:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
        local v88 = v86.scrollingFrameRef:getValue();
        if v88 and v88.CanvasPosition.Y > 0 then
            v88.CanvasPosition = Vector2.new(0, 0);
        end;
    end;
end;
return v4.UNSTABLE_connect2(function(v89, _) --[[ Line: 384 ]]
    -- upvalues: v20 (copy)
    return {
        isReportMenuOpen = v89.report.currentPage == v20.Page.Listing, 
        screenSize = v89.displayOptions.screenSize, 
        reportCategory = v89.report.reportCategory, 
        canNavigateBack = #v89.report.history > 1
    };
end, function(v91) --[[ Line: 392 ]]
    -- upvalues: v16 (copy), v23 (copy), v20 (copy), v17 (copy), v24 (copy), v18 (copy)
    return {
        navigateBack = function(v92) --[[ Line: 394 ]] --[[ Name: navigateBack ]]
            -- upvalues: v91 (copy), v16 (ref), v23 (ref), v20 (ref)
            v91(v16());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowBack, {
                source = v20.Page.Listing, 
                filterTextChanged = v92
            });
        end, 
        closeDialog = function(v93) --[[ Line: 401 ]] --[[ Name: closeDialog ]]
            -- upvalues: v91 (copy), v17 (ref), v23 (ref), v20 (ref), v24 (ref)
            v91(v17());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAbandoned, {
                source = v20.Page.Listing, 
                filterTextChanged = v93
            });
            v24.endAbuseReportSession();
        end, 
        openReportDialog = function(v94, v95, v96) --[[ Line: 409 ]] --[[ Name: openReportDialog ]]
            -- upvalues: v91 (copy), v18 (ref), v23 (ref), v20 (ref)
            v91(v18(v94, v95, v96));
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAdvance, {
                source = v20.Page.Listing, 
                reportType = v94
            });
        end
    };
end)(v42);