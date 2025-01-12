local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_TextChatService_0 = game:GetService("TextChatService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Interactable_0 = v8.Core.Control.Interactable;
local l_ControlState_0 = v8.Core.Control.Enum.ControlState;
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_withStyle_0 = v8.Core.Style.withStyle;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_Images_0 = v8.App.ImageSet.Images;
local l_SelectionCursorProvider_0 = v8.App.SelectionImage.SelectionCursorProvider;
local v16 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_GetFFlagFixUnibarVirtualCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixUnibarVirtualCursor;
local l_Presentation_0 = script.Parent.Presentation;
local v20 = require(l_Presentation_0.MenuIcon);
local v21 = require(l_Presentation_0.ChatIcon);
local v22 = require(l_Presentation_0.ConnectIcon);
local v23 = require(l_Presentation_0.MoreMenu);
local v24 = require(l_Presentation_0.HealthBar);
local v25 = require(l_Presentation_0.HurtOverlay);
local v26 = require(l_Presentation_0.GamepadMenu);
local v27 = require(l_Presentation_0.GamepadNavigationDialog);
local v28 = require(l_Presentation_0.HeadsetMenu);
local v29 = require(l_Presentation_0.VoiceBetaBadge);
local v30 = require(l_Presentation_0.BadgeOver13);
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local v32 = require(l_Chrome_0.Enabled);
local v33 = require(l_Chrome_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
local v34 = require(l_Chrome_0.Integrations.MusicUtility.Constants);
local v35 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromeAnalytics();
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v36.GetFFlagReenableTextChatForTenFootInterfaces;
local l_GetFFlagEnableSceneAnalysisPerformanceTest_0 = v36.GetFFlagEnableSceneAnalysisPerformanceTest;
local l_GetFFlagSongbirdUseReportAudioModal_0 = v36.GetFFlagSongbirdUseReportAudioModal;
local v40 = require(l_Chrome_0.Flags.GetFFlagEnableSongbirdPeek);
local v41 = nil;
local v42 = if v32() and v40() then require(l_Chrome_0.ChromeShared.Peek) else nil;
local v43 = nil;
local v44 = nil;
if v32() then
    v41 = require(l_Chrome_0.ChromeShared.Unibar);
end;
if game:GetEngineFeature("InGameChromeSignalAPI") then
    v43 = require(l_Chrome_0.ChromeShared.Service.KeepOutAreasHandler);
    if v35 and (not l_GetFFlagFixChromeReferences_0() or v32()) then
        v44 = require(l_Chrome_0.ChromeShared.Analytics);
    end;
end;
local v45 = require(script.Parent.Connection);
local l_Parent_0 = l_Presentation_0.Parent.Parent;
local v47 = require(l_Parent_0.Constants);
local v48 = require(l_Parent_0.Flags.GetFFlagChangeTopbarHeightCalculation);
local v49 = require(l_Parent_0.Flags.GetFFlagFixDupeBetaBadge);
local v50 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v51 = require(l_Parent_0.Actions.SetScreenSize);
local v52 = require(l_Parent_0.Actions.SetKeepOutArea);
local v53 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v54 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v55 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v56 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v57 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadge);
local v58 = game:DefineFastFlag("TopBarUseNewBadge", false);
local v59 = game:DefineFastFlag("ControlBetaBadgeWithGuac", false);
local v60 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v61 = require(l_Parent_0.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local l_GetFFlagEnablePartyIconInNonChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePartyIconInNonChrome;
local l_GetFFlagEnablePartyMicIconInChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePartyMicIconInChrome;
local l_GetFFlagPeekUseFixedHeight_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekUseFixedHeight;
local l_GetFFlagSongbirdMountDebugAudioEmitters_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSongbirdMountDebugAudioEmitters;
local v67 = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v69 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v70 = require(script.Parent.Parent.TopBarAppPolicy);
local v71 = v32();
local v72 = require(l_RobloxGui_0.Modules.VR.VRBottomBar.VRBottomBar);
local v73 = if v56() then v47.TopBarHeight - 4 else 30;
local function _(v74) --[[ Line: 106 ]] --[[ Name: selectMenuOpen ]]
    return v74.displayOptions.menuOpen or v74.displayOptions.inspectMenuOpen;
end;
local v76 = v5.PureComponent:extend("TopBarApp");
v76.validateProps = v7.strictInterface({
    menuOpen = v7.optional(v7.boolean), 
    inspectMenuOpen = v7.optional(v7.boolean), 
    displayBetaBadge = v7.boolean, 
    setScreenSize = v7.callback, 
    setKeepOutArea = v7.callback, 
    removeKeepOutArea = v7.callback, 
    showBadgeOver12 = v7.optional(v7.boolean)
});
v76.init = function(v77) --[[ Line: 123 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v32 (copy), l_Chrome_0 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), l_TextChatService_0 (copy)
    local v78, v79 = v5.createBinding(UDim2.new());
    v77.unibarRightSidePosition = v78;
    v77.setUnibarRightSidePosition = v79;
    v78, v79 = v5.createBinding(false);
    v77.closeButtonState = v78;
    v77.setCloseButtonState = v79;
    v78, v79 = v5.createBinding(false);
    v77.badgeOver13Visible = v78;
    v77.setBadgeOver13Visible = v79;
    v77.onCloseBtnStateChange = function(_, v81) --[[ Line: 127 ]]
        -- upvalues: v77 (copy)
        v77.setCloseButtonState(v81);
    end;
    if v32() then
        v77:setState({
            unibarAlignment = require(l_Chrome_0.Service):orderAlignment():get()
        });
    end;
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        v77:setState({
            chatVersion = l_TextChatService_0.ChatVersion
        });
        if not game:IsLoaded() then
            game.Loaded:Connect(function() --[[ Line: 145 ]]
                -- upvalues: v77 (copy), l_TextChatService_0 (ref)
                v77:setState({
                    chatVersion = l_TextChatService_0.ChatVersion
                });
            end);
        end;
    end;
end;
v76.didMount = function(v82) --[[ Line: 154 ]] --[[ Name: didMount ]]
    -- upvalues: v32 (copy), l_Chrome_0 (copy)
    if v32() then
        local v83 = require(l_Chrome_0.Service);
        v82.orderAlignmentConnection = v83:orderAlignment():connect(function() --[[ Line: 157 ]]
            -- upvalues: v82 (copy), v83 (copy)
            v82:setState({
                unibarAlignment = v83:orderAlignment():get()
            });
        end);
    end;
end;
v76.willUnmount = function(v84) --[[ Line: 165 ]] --[[ Name: willUnmount ]]
    -- upvalues: v32 (copy)
    if v32() and v84.orderAlignmentConnection then
        v84.orderAlignmentConnection:disconnect();
        v84.orderAlignmentConnection = nil;
    end;
end;
v76.render = function(v85) --[[ Line: 174 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v86) --[[ Line: 175 ]]
        -- upvalues: v85 (copy)
        return v85:renderWithStyle(v86);
    end);
end;
v76.renderWithStyle = function(v87, v88) --[[ Line: 180 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v32 (copy), v57 (copy), v59 (copy), v49 (copy), v47 (copy), v56 (copy), v48 (copy), v54 (copy), v60 (copy), v5 (copy), v69 (copy), v72 (copy), l_default_0 (copy), v20 (copy), l_GetFFlagFixUnibarVirtualCursor_0 (copy), l_SelectionCursorProvider_0 (copy), v45 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v26 (copy), v61 (copy), v27 (copy), v28 (copy), l_VRService_0 (copy), v50 (copy), v43 (ref), v25 (copy), v41 (ref), v55 (copy), l_Interactable_0 (copy), v73 (copy), l_RobloxGui_0 (copy), l_ControlState_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_GetFFlagEnableSceneAnalysisPerformanceTest_0 (copy), v16 (copy), l_GetFFlagSongbirdMountDebugAudioEmitters_0 (copy), v40 (copy), l_GetFFlagPeekUseFixedHeight_0 (copy), v34 (copy), v42 (copy), l_GetFFlagSongbirdUseReportAudioModal_0 (copy), l_GetFFlagEnablePartyMicIconInChrome_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v67 (copy), v44 (ref), v71 (copy), v24 (copy), v58 (copy), v30 (copy), l_Analytics_0 (copy), l_Players_0 (copy), v29 (copy), l_GetFFlagEnablePartyIconInNonChrome_0 (copy), v33 (copy), v22 (copy), v21 (copy), v23 (copy)
    local v89 = v32();
    local v90 = v57() and not v89;
    local v91 = nil;
    if v59 then
        if v49() then
            v91 = v87.props.displayBetaBadge;
        else
            v90 = v87.props.displayBetaBadge;
        end;
    end;
    local l_Right_0 = Enum.HorizontalAlignment.Right;
    if v87.state.unibarAlignment ~= nil then
        l_Right_0 = v87.state.unibarAlignment;
    end;
    local l_ScreenSideOffset_0 = v47.ScreenSideOffset;
    local v94 = not v56() and 36 or v47.TopBarHeight;
    if v48() then
        v94 = v47.TopBarHeight;
    end;
    if v54:IsEnabled() then
        l_ScreenSideOffset_0 = v47.ScreenSideOffsetTenFoot;
        v94 = v47.TopBarHeightTenFoot;
    end;
    local v95 = not (v87.props.menuOpen or v87.props.inspectMenuOpen);
    local v96 = UDim2.new(0, 0, 0, if v48() then v47.TopBarTopMargin else 0);
    local v97 = v94 - v47.TopBarTopMargin;
    local v98 = UDim2.new(0, l_ScreenSideOffset_0, 0, 0);
    local v99 = UDim2.new(1, -l_ScreenSideOffset_0, 0, 0);
    local v100 = UDim2.new(1, -l_ScreenSideOffset_0, 0, v47.TopBarTopMargin);
    local v101 = UDim2.new(0, 0, 0.5, 0);
    local v103 = if v60 then v5.createElement(v69.Provider, {}, {
        VRBottomBar = v69.withVoiceState(function(v102) --[[ Line: 218 ]]
            -- upvalues: v5 (ref), v72 (ref), l_default_0 (ref)
            return v5.createElement(v72, {
                voiceChatServiceManager = l_default_0, 
                voiceEnabled = v102.voiceEnabled, 
                voiceState = v102.voiceState
            });
        end)
    }) else v5.createElement(v72);
    local v104 = v5.createElement(v20, {
        iconScale = v87.props.menuOpen and 1.25 or 1, 
        layoutOrder = 1, 
        showBadgeOver12 = v87.props.showBadgeOver12
    });
    if l_GetFFlagFixUnibarVirtualCursor_0() then
        v104 = v5.createElement(l_SelectionCursorProvider_0, {}, {
            Icon = v104
        });
    end;
    return v5.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 6, 
        [v5.Change.AbsoluteSize] = function(v105) --[[ Line: 245 ]]
            -- upvalues: v87 (copy)
            v87.props.setScreenSize(v105.AbsoluteSize);
        end
    }, {
        Connection = v5.createElement(v45), 
        GamepadMenu = if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then v5.createElement(v26, {
            chatVersion = v87.state.chatVersion
        }) else v5.createElement(v26), 
        GamepadNavigationDialog = if v61 then v5.createElement(v27) else nil, 
        HeadsetMenu = v5.createElement(v28), 
        VRBottomBar = l_VRService_0.VREnabled and v103 or nil, 
        KeepOutAreasHandler = if v50 and v43 then v5.createElement(v43) else nil, 
        FullScreenFrame = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v95
        }, {
            HurtOverlay = v5.createElement(v25)
        }), 
        MenuIconHolder = v56() and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_ScreenSideOffset_0, 0, if v48() then v47.TopBarTopMargin else 0), 
            Size = UDim2.new(1, 0, 0, if v48() then v97 else v94)
        }, {
            MenuIcon = v104
        }), 
        LegacyCloseMenu = not v41 and not v55() and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_ScreenSideOffset_0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v94), 
            Visible = v87.props.menuOpen
        }, {
            CloseMenuButtonRound = v41 and v5.createElement(l_Interactable_0, {
                onStateChanged = v87.onCloseBtnStateChange, 
                Visible = not v54:IsEnabled(), 
                BackgroundTransparency = v88.Theme.Overlay.Transparency, 
                Position = v101, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v73, 0, v73), 
                BackgroundColor3 = v88.Theme.Overlay.Color, 
                [v5.Event.Activated] = function() --[[ Line: 306 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }, {
                UICorner = v89 and v5.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil, 
                Line1 = v5.createElement("Frame", {
                    Name = "TopLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = 45
                }), 
                Line2 = v5.createElement("Frame", {
                    Name = "BottomLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = -45
                }), 
                StateOverlayRound = not v89 and v5.createElement("Frame", {
                    BackgroundTransparency = v87.closeButtonState:map(function(v106) --[[ Line: 336 ]]
                        -- upvalues: l_ControlState_0 (ref), v88 (copy)
                        if v106 == l_ControlState_0.Pressed then
                            return v88.Theme.BackgroundOnPress.Transparency;
                        elseif v106 == l_ControlState_0.Hover then
                            return v88.Theme.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    BackgroundColor3 = v87.closeButtonState:map(function(v107) --[[ Line: 345 ]]
                        -- upvalues: l_ControlState_0 (ref), v88 (copy)
                        if v107 == l_ControlState_0.Pressed then
                            return v88.Theme.BackgroundOnPress.Color;
                        elseif v107 == l_ControlState_0.Hover then
                            return v88.Theme.BackgroundOnHover.Color;
                        else
                            return Color3.new(1, 1, 1);
                        end;
                    end), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                }, {
                    UICorner = v89 and v5.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) or nil
                }) or nil
            }) or nil, 
            CloseMenuButton = not v41 and v5.createElement(l_ImageSetButton_0, {
                Visible = not v54:IsEnabled(), 
                BackgroundTransparency = 1, 
                Position = v101, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v73, 0, v73), 
                Image = l_Images_0["icons/controls/close-ingame"], 
                [v5.Event.Activated] = function() --[[ Line: 371 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }) or nil
        }), 
        SongbirdPerformanceExperiment = if l_GetFFlagEnableSceneAnalysisPerformanceTest_0() then v5.createElement(v16.PerformanceExperiment) else nil, 
        SongbirdDebugAudio = if l_GetFFlagSongbirdMountDebugAudioEmitters_0() then v5.createElement(v16.DebugAudioEmitters) else nil, 
        PeekFrame = v32() and v40() and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if l_GetFFlagPeekUseFixedHeight_0() then v34.PEEK_CONTAINER_HEIGHT else v97), 
            Position = if l_GetFFlagPeekUseFixedHeight_0() then v34.getPeekContainerPosition(v88) else v96
        }, {
            Peek = v5.createElement(v42)
        }), 
        SongbirdReportAudioFrame = v32() and l_GetFFlagSongbirdUseReportAudioModal_0() and v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, 0, 0, v34.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
        }, {
            ReportAudioPopup = v5.createElement(v16.ReportAudioPopup)
        }), 
        UnibarLeftFrame = v41 and l_Right_0 == Enum.HorizontalAlignment.Left and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if v48() then v97 else v94), 
            Position = if v48() then v100 else v99, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            PartyMicBinder = if v89 and l_GetFFlagEnablePartyMicIconInChrome_0() and l_GetFFlagEnableCrossExpVoice_0() then v5.createElement(v67) else nil, 
            ChromeAnalytics = if v44 then v5.createElement(v44) else nil, 
            KeepOutAreasHandler = if not v50 and v43 then v5.createElement(v43) else nil, 
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2), 
                PaddingLeft = UDim.new(0, l_ScreenSideOffset_0 + v47.Padding + v47.TopBarHeight + 2)
            }), 
            Unibar = v5.createElement(v41, {
                layoutOrder = 1, 
                onAreaChanged = v87.props.setKeepOutArea, 
                onMinWidthChanged = function(v108) --[[ Line: 443 ]] --[[ Name: onMinWidthChanged ]]
                    -- upvalues: v87 (copy)
                    v87.setUnibarRightSidePosition(UDim2.new(0, v108, 0, 0));
                end
            }), 
            HealthBar = if v71 then v5.createElement(v24, {}) else nil, 
            StackedElements = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = v87.unibarRightSidePosition, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v47.Padding)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, v47.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = if v71 then nil else v5.createElement(v24, {
                    layoutOrder = 10
                }), 
                CenterBadgeOver13 = if v58 then v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    LayoutOrder = 4, 
                    Visible = v87.badgeOver13Visible
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    BadgeOver13 = v5.createElement(v30, {
                        layoutOrder = 1, 
                        analytics = l_Analytics_0.new(), 
                        player = l_Players_0.LocalPlayer, 
                        voiceChatServiceManager = l_default_0, 
                        VRService = game:GetService("VRService"), 
                        visibilityChanged = v87.setBadgeOver13Visible
                    })
                }) else nil, 
                VoiceBetaBadge = if v57() and (not v49() or v91) then v5.createElement(v29, {
                    layoutOrder = 6, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            })
        }) or nil, 
        UnibarRightFrame = v41 and l_Right_0 == Enum.HorizontalAlignment.Right and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if v48() then v97 else v94), 
            Position = if v48() then v100 else v99, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if v44 then v5.createElement(v44) else nil, 
            KeepOutAreasHandler = if not v50 and v43 then v5.createElement(v43) else nil, 
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            Layout = v5.createElement("UIListLayout", {
                Padding = UDim.new(0, v47.Padding), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HealthBar = v5.createElement(v24, {
                layoutOrder = 1
            }), 
            Unibar = v5.createElement(v41, {
                onAreaChanged = v87.props.setKeepOutArea, 
                layoutOrder = 2
            })
        }) or nil, 
        TopBarFrame = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if v48() then v97 else v94), 
            Visible = v95, 
            Position = v96
        }, {
            LeftFrame = not v54:IsEnabled() and v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -l_ScreenSideOffset_0, 1, 0), 
                Position = v98
            }, {
                Layout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, v47.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = if v58 then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Blank = v89 and v5.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v47.TopBarHeight - 4, 0, 1), 
                    BackgroundTransparency = 1
                }), 
                MenuIcon = not v56() and v5.createElement(v20, {
                    layoutOrder = 1, 
                    showBadgeOver12 = v87.props.showBadgeOver12
                }), 
                ConnectIcon = not v89 and l_GetFFlagEnablePartyIconInNonChrome_0() and v33() and v5.createElement(v22, {
                    setKeepOutArea = v87.props.setKeepOutArea, 
                    removeKeepOutArea = v87.props.removeKeepOutArea, 
                    layoutOrder = 2
                }) or nil, 
                ChatIcon = not v89 and v5.createElement(v21, {
                    layoutOrder = 3
                }) or nil, 
                BadgeOver13 = if not v58 or v89 then nil else v5.createElement(v30, {
                    layoutOrder = 4, 
                    analytics = l_Analytics_0.new(), 
                    player = l_Players_0.LocalPlayer, 
                    voiceChatServiceManager = l_default_0, 
                    VRService = game:GetService("VRService"), 
                    visibilityChanged = nil
                }), 
                VoiceBetaBadge = if v90 and (not v49() or v91) then v5.createElement(v29, {
                    layoutOrder = 4, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            }), 
            RightFrame = not v41 and v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -l_ScreenSideOffset_0, 1, 0), 
                Position = v99, 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, v47.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = v5.createElement(v24, {
                    layoutOrder = 1
                }), 
                MoreMenu = not v54:IsEnabled() and v5.createElement(v23, {
                    layoutOrder = 2
                })
            }) or nil
        })
    });
end;
local function v111(v109) --[[ Line: 648 ]] --[[ Name: mapStateToProps ]]
    local l_inspectMenuOpen_0 = v109.displayOptions.inspectMenuOpen;
    return {
        menuOpen = v109.displayOptions.menuOpen, 
        inspectMenuOpen = l_inspectMenuOpen_0
    };
end;
local v114 = v70.connect(function(v112, _) --[[ Line: 657 ]]
    return {
        displayBetaBadge = v112.getDisplayVoiceBetaBadge(), 
        showBadgeOver12 = v112.showBadgeOver12()
    };
end)(v76);
return v6.UNSTABLE_connect2(v111, function(v115) --[[ Line: 664 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v51 (copy), v52 (copy), v53 (copy)
    return {
        setScreenSize = function(v116) --[[ Line: 666 ]] --[[ Name: setScreenSize ]]
            -- upvalues: v115 (copy), v51 (ref)
            return v115(v51(v116));
        end, 
        setKeepOutArea = function(v117, v118, v119) --[[ Line: 669 ]] --[[ Name: setKeepOutArea ]]
            -- upvalues: v115 (copy), v52 (ref)
            return v115(v52(v117, v118, v119));
        end, 
        removeKeepOutArea = function(v120) --[[ Line: 672 ]] --[[ Name: removeKeepOutArea ]]
            -- upvalues: v115 (copy), v53 (ref)
            return v115(v53(v120));
        end
    };
end)(v114);