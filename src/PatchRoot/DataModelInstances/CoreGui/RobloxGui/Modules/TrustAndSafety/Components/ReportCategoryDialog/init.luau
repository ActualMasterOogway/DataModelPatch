local _ = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Dependencies);
local _ = require(v9.FocusHandler);
local v11 = require(v9.playerInterface);
local v12 = require(v9.ThemedTextLabel);
local v13 = require(v9.withLocalization);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_withVoiceState_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext).withVoiceState;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v18 = require(v9.GameIcon);
local _ = require(l_Parent_0.Components.BlockPlayerItem);
local v20 = require(l_Parent_0.Actions.EndReportFlow);
local _ = require(l_Parent_0.Actions.OpenBlockPlayerDialog);
local v22 = require(l_Parent_0.Actions.SelectReportCategory);
local v23 = require(l_Parent_0.Utility.SendAnalytics);
local v24 = require(l_Parent_0.Utility.SessionUtility);
local v25 = require(l_Parent_0.Resources.Constants);
local v26 = require(l_Parent_0.Components.ModalDialog);
local v27 = require(l_Parent_0.Resources.Assets);
local _ = require(l_Parent_0.Components.GameCell);
local v29 = require(v9.BarOnTopScrollingFrame);
local l_Cell_0 = v5.App.Table.Cell;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_Provider_0 = v5.Core.Style.Provider;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Colors_0 = v5.App.Style.Colors;
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagReportMenuCellToUseAutomaticSize);
local v37 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnHover = {
        Color = l_Colors_0.Graphite, 
        Transparency = 0.666
    }, 
    BackgroundOnPress = {
        Color = l_Colors_0.Graphite, 
        Transparency = 0
    }
};
local function v39(v38) --[[ Line: 67 ]] --[[ Name: Divider ]]
    -- upvalues: v3 (copy), v7 (copy), l_Colors_0 (copy)
    return v3.createElement("Frame", v7.Dictionary.join({
        Size = UDim2.new(1, 0, 0, 1)
    }, v38, {
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Colors_0.Graphite, 
        BackgroundTransparency = 0.5, 
        theme = v7.None
    }));
end;
local function v41(v40) --[[ Line: 85 ]] --[[ Name: CategoryCellContent ]]
    -- upvalues: v3 (copy), v36 (copy), l_ImageSetLabel_0 (copy), v12 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        AutomaticSize = if v36() then Enum.AutomaticSize.XY else nil
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        IconFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 68, 1, 0), 
            LayoutOrder = 1
        }, {
            Layout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CustomIcon = v40.iconComponent or nil, 
            Icon = v40.icon and v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v40.icon.Image, 
                Size = v40.icon.Size
            })
        }), 
        TextFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -68, 1, 0), 
            LayoutOrder = 2
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            Text = v3.createElement(v12, {
                AnchorPoint = Vector2.new(0, 0.5), 
                themeKey = "TextEmphasis", 
                fontKey = "Header2", 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v40.text, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            SubText = v3.createElement(v12, {
                AnchorPoint = Vector2.new(0, 0.5), 
                fontKey = "CaptionBody", 
                themeKey = "TextMuted", 
                Size = UDim2.new(1, 0, 0, 14), 
                Text = v40.subtext, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
local function v43(v42) --[[ Line: 144 ]] --[[ Name: CategoryCell ]]
    -- upvalues: v3 (copy), l_Cell_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v41 (copy)
    return v3.createElement(l_Cell_0, {
        userInteractionEnabled = true, 
        onActivated = v42.onActivated, 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.Square), 
        layoutOrder = v42.layoutOrder, 
        size = UDim2.new(1, 0, 0, 72), 
        head = v41(v42), 
        tail = v3.createElement("Frame")
    });
end;
local v44 = v3.PureComponent:extend("ReportCategoryDialog");
v44.validateProps = v6.strictInterface({
    isReportCategoryMenuOpen = v6.boolean, 
    screenSize = v6.Vector2, 
    inputType = v6.optional(v6.string), 
    reportType = v6.optional(v6.valueOf(v25.ReportType)), 
    targetPlayer = v6.optional(v11), 
    closeDialog = v6.callback, 
    selectReportCategory = v6.optional(v6.callback), 
    playerFocusedFlow = v6.boolean
});
v44.init = function(v45) --[[ Line: 169 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v45.buttonRef = v3.createRef();
    v45.onCancel = function() --[[ Line: 172 ]]
        -- upvalues: v45 (copy)
        v45.props.closeDialog();
    end;
end;
v44.renderContents = function(v46, v47, v48) --[[ Line: 177 ]] --[[ Name: renderContents ]]
    -- upvalues: v3 (copy), l_default_0 (copy), v7 (copy), v43 (copy), v27 (copy), v25 (copy), v39 (copy), v18 (copy), l_withStyle_0 (copy), v37 (copy), l_Provider_0 (copy), v29 (copy)
    local _ = v46.props;
    local v50 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_v47_0 = v47;
    if v47 then
        local v52 = l_default_0:getRecentUsersInteractionData();
        if v52 and not v7.isEmpty(v52) then
            if v46.props.playerFocusedFlow then
                l_v47_0 = v46.props.targetPlayer and v52[tostring(v46.props.targetPlayer.UserId)] ~= nil;
            end;
        else
            l_v47_0 = false;
        end;
    end;
    if l_v47_0 then
        table.insert(v50, v3.createElement(v43, {
            text = v48.voiceHeader, 
            subtext = v48.voiceDescription, 
            icon = v27.Images.VoiceChatIcon, 
            layoutOrder = #v50 + 1, 
            onActivated = function() --[[ Line: 211 ]] --[[ Name: onActivated ]]
                -- upvalues: v46 (copy), v25 (ref)
                v46.props.selectReportCategory(v25.Category.Voice);
            end
        }));
        table.insert(v50, v3.createElement(v39, {
            LayoutOrder = #v50 + 1
        }));
    end;
    table.insert(v50, v3.createElement(v43, {
        text = v48.textHeader, 
        subtext = v48.textDescription, 
        icon = v27.Images.TextChatIcon, 
        layoutOrder = #v50 + 1, 
        onActivated = function() --[[ Line: 231 ]] --[[ Name: onActivated ]]
            -- upvalues: v46 (copy), v25 (ref)
            v46.props.selectReportCategory(v25.Category.Text);
        end
    }));
    table.insert(v50, v3.createElement(v39, {
        LayoutOrder = #v50 + 1
    }));
    if not v46.props.playerFocusedFlow then
        table.insert(v50, v3.createElement(v43, {
            iconComponent = v3.createElement(v18, {
                gameId = game.GameId, 
                iconSize = 33, 
                cornerRadius = UDim.new(0, 8)
            }), 
            text = v48.experienceHeader, 
            subtext = v48.experienceDescription, 
            layoutOrder = #v50 + 1, 
            onActivated = function() --[[ Line: 255 ]] --[[ Name: onActivated ]]
                -- upvalues: v46 (copy), v25 (ref)
                v46.props.selectReportCategory(v25.Category.Experience);
            end
        }));
        table.insert(v50, v3.createElement(v39, {
            LayoutOrder = #v50 + 1
        }));
    end;
    table.insert(v50, v3.createElement(v43, {
        text = v48.otherHeader, 
        subtext = v48.otherDescription, 
        icon = v27.Images.OtherIcon, 
        layoutOrder = #v50 + 1, 
        onActivated = function() --[[ Line: 276 ]] --[[ Name: onActivated ]]
            -- upvalues: v46 (copy), v25 (ref)
            v46.props.selectReportCategory(v25.Category.Other);
        end
    }));
    table.insert(v50, v3.createElement(v39, {
        LayoutOrder = #v50 + 1
    }));
    return l_withStyle_0(function(v53) --[[ Line: 289 ]]
        -- upvalues: v7 (ref), v37 (ref), v3 (ref), l_Provider_0 (ref), v29 (ref), v46 (copy), v50 (copy)
        local v54 = v7.Dictionary.join(v53.Theme, v37);
        local v55 = v7.Dictionary.join(v53, {
            Theme = v54
        });
        return v3.createElement(l_Provider_0, {
            style = v55
        }, {
            v3.createElement(v29, {
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, 72), 
                scrollingFrameRef = v46.scrollingFrameRef
            }, v50)
        });
    end);
end;
v44.render = function(v56) --[[ Line: 306 ]] --[[ Name: render ]]
    -- upvalues: l_withVoiceState_0 (copy), v13 (copy), v3 (copy), v26 (copy)
    return l_withVoiceState_0(function(v57) --[[ Line: 307 ]]
        -- upvalues: v13 (ref), v3 (ref), v26 (ref), v56 (copy)
        return v13({
            titleText = "CoreScripts.InGameMenu.Report.MenuTitle", 
            dismissText = "CoreScripts.InGameMenu.Report.Done", 
            voiceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Voice", 
            voiceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Voice", 
            textHeader = "CoreScripts.InGameMenu.Report.Category.Header.Text", 
            textDescription = "CoreScripts.InGameMenu.Report.Category.Description.Text", 
            experienceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Experience", 
            experienceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Experience", 
            otherHeader = "CoreScripts.InGameMenu.Report.Category.Header.Other", 
            otherDescription = "CoreScripts.InGameMenu.Report.Category.Description.Other"
        })(function(v58) --[[ Line: 319 ]]
            -- upvalues: v3 (ref), v26 (ref), v56 (ref), v57 (copy)
            return v3.createFragment({
                ModalDialog = v3.createElement(v26, {
                    visible = v56.props.isReportCategoryMenuOpen, 
                    screenSize = v56.props.screenSize, 
                    titleText = v58.titleText, 
                    contents = v56:renderContents(v57.voiceEnabled, v58), 
                    showCloseButton = true, 
                    onDismiss = v56.onCancel
                })
            });
        end);
    end);
end;
return v4.UNSTABLE_connect2(function(v59, _) --[[ Line: 334 ]]
    -- upvalues: v25 (copy)
    return {
        isReportCategoryMenuOpen = v59.report.currentPage == v25.Page.Category, 
        reportType = v59.report.reportType, 
        targetPlayer = v59.report.targetPlayer, 
        screenSize = v59.displayOptions.screenSize, 
        playerFocusedFlow = v59.report.beginningReportType == v25.ReportType.Player
    };
end, function(v61) --[[ Line: 343 ]]
    -- upvalues: v22 (copy), v20 (copy), v23 (copy), v25 (copy), v24 (copy)
    return {
        selectReportCategory = function(v62) --[[ Line: 345 ]] --[[ Name: selectReportCategory ]]
            -- upvalues: v61 (copy), v22 (ref)
            v61(v22(v62));
        end, 
        closeDialog = function() --[[ Line: 348 ]] --[[ Name: closeDialog ]]
            -- upvalues: v61 (copy), v20 (ref), v23 (ref), v25 (ref), v24 (ref)
            v61(v20());
            v23(v25.Analytics.ReportType, v25.Analytics.ReportFlowAbandoned, {
                source = v25.Analytics.ReportType
            });
            v24.endAbuseReportSession();
        end
    };
end)(v44);