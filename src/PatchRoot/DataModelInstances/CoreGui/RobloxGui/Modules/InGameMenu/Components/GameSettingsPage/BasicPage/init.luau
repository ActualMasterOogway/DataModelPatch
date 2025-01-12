local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
local v7 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v7.Roact;
local l_RoactRodux_0 = v7.RoactRodux;
local l_t_0 = v7.t;
local l_UIBlox_0 = v7.UIBlox;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_LocalPlayer_0_PropertyChangedSignal_0 = l_LocalPlayer_0:GetPropertyChangedSignal("DevEnableMouseLock");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("IsUsingCameraYInverted");
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Components.Divider);
local v18 = require(l_Parent_0.Utility.ExternalEventConnection);
local v19 = require(l_Parent_0.Components.Page);
local v20 = require(l_Parent_0.Components.ThemedTextLabel);
local v21 = require(l_Parent_0.Localization.withLocalization);
local v22 = require(l_Parent_0.Resources.Assets);
local v23 = require(l_Parent_0.Actions.SetCurrentPage);
local v24 = require(script.Parent.AutoPropertyToggleEntry);
local v25 = require(script.Parent.SafetyBubbleModeEntry);
local v26 = nil;
if game:GetEngineFeature("VRMoreComfortSettings") then
    v26 = require(script.Parent.ComfortSettingsEntry);
end;
local v27 = require(script.Parent.CameraModeEntry);
local v28 = require(script.Parent.CameraSensitivityEntry);
local v29 = require(script.Parent.CategoryHeader);
local v30 = require(script.Parent.DeviceSelectionEntry);
local v31 = require(script.Parent.GraphicsQualityEntry);
local v32 = require(script.Parent.MovementModeEntry);
local v33 = require(script.Parent.ToggleEntry);
local v34 = require(script.Parent.VolumeEntry);
local v35 = require(l_Parent_0.Utility.SendAnalytics);
local v36 = require(l_Parent_0.Resources.Constants);
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Flags_0 = l_Parent_0.Flags;
local l_GetFFlagAddHapticsToggle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddHapticsToggle;
local v42 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v43 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local l_game_EngineFeature_0 = game:GetEngineFeature("VRMoreComfortSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_1 = l_UserGameSettings_0:GetPropertyChangedSignal("VREnabled");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v47 = l_Roact_0.PureComponent:extend("BasicPage");
v47.validateProps = l_t_0.strictInterface({
    switchToAdvancedPage = l_t_0.callback, 
    switchToVRComfortSettingsPage = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    isMenuOpen = l_t_0.boolean, 
    currentPage = l_t_0.optional(l_t_0.string), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    canGamepadCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    vrService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    isVRAppBuild = l_t_0.optional(l_t_0.callback), 
    currentZone = v42() and l_t_0.optional(l_t_0.number) or nil
});
v47.defaultProps = {
    vrService = l_VRService_0, 
    isVRAppBuild = l_IsVRAppBuild_0
};
local l_VREnabled_0 = l_UserGameSettings_0.VREnabled;
v47.init = function(v49) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy), l_Roact_0 (copy)
    v49:setState({
        shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock, 
        fullScreenEnabled = l_UserGameSettings_0:InFullScreen(), 
        invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted, 
        vrActive = v49.props.vrService.VREnabled, 
        vrEnabled = l_UserGameSettings_0.VREnabled, 
        voiceChatEnabled = false
    });
    local v50, v51 = l_Roact_0.createBinding(UDim2.new(0, 0, 0, 0));
    v49.pageSize = v50;
    v49.setPageSize = v51;
    v49.cameraModeButton = l_Roact_0.createRef();
    v49.volumeButton = l_Roact_0.createRef();
end;
v47.didUpdate = function(v52, v53) --[[ Line: 112 ]] --[[ Name: didUpdate ]]
    -- upvalues: v42 (copy), l_GuiService_0 (copy)
    if not v42() and v52.props.canCaptureFocus and v52.props.canGamepadCaptureFocus and (not v53.canCaptureFocus or not v53.canGamepadCaptureFocus) then
        if not v52.state.vrActive then
            l_GuiService_0.SelectedCoreObject = v52.cameraModeButton:getValue();
            return;
        else
            l_GuiService_0.SelectedCoreObject = v52.volumeButton:getValue();
        end;
    end;
end;
local function _() --[[ Line: 129 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v54 = 0;
    return function() --[[ Line: 131 ]]
        -- upvalues: v54 (ref)
        v54 = v54 + 1;
        return v54;
    end;
end;
v47.renderWithSelectionCursor = function(v56, v57) --[[ Line: 137 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v43 (copy), l_Platform_0 (copy), l_UserGameSettings_0 (copy), l_Roact_0 (copy), v19 (copy), v42 (copy), v15 (copy), v36 (copy), l_GuiService_0 (copy), v29 (copy), l_game_EngineFeature_0 (copy), v24 (copy), v26 (ref), v21 (copy), v20 (copy), l_ImageSetLabel_0 (copy), v22 (copy), l_VREnabled_0 (copy), v25 (copy), v17 (copy), v27 (copy), v28 (copy), v32 (copy), v34 (copy), l_GetFFlagAddHapticsToggle_0 (copy), v30 (copy), v31 (copy), v33 (copy), v35 (copy), l_CursorKind_0 (copy), v18 (copy), l_l_LocalPlayer_0_PropertyChangedSignal_0 (copy), l_LocalPlayer_0 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_1 (copy)
    local v58 = false;
    local v59 = 0;
    local v60;
    if true then
        local l_v59_0 = v59;
        v60 = function() --[[ Line: 131 ]]
            -- upvalues: l_v59_0 (ref)
            l_v59_0 = l_v59_0 + 1;
            return l_v59_0;
        end;
    end;
    v59 = v56.state.voiceChatEnabled and not v56.props.isVRAppBuild();
    local v62 = if v43() then l_Platform_0 == Enum.Platform.Windows or l_Platform_0 == Enum.Platform.UWP else (v56.state.vrActive or l_UserGameSettings_0.HasEverUsedVR) and not v56.props.isVRAppBuild();
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v19_0 = v19;
    local v65 = {
        pageTitle = v56.props.pageTitle, 
        position = v56.props.position
    };
    local v66 = {};
    local v67;
    if v42() then
        v67 = l_Roact_0.createElement;
        local l_v15_0 = v15;
        local v69 = {
            isFocused = v56.props.canCaptureFocus and v56.props.canGamepadCaptureFocus
        };
        local v70 = true;
        if v56.props.currentPage ~= v36.MainPagePageKey then
            v70 = v56.props.currentZone == 0;
        end;
        v69.shouldForgetPreviousSelection = v70;
        v69.didFocus = function(v71) --[[ Line: 152 ]] --[[ Name: didFocus ]]
            -- upvalues: l_GuiService_0 (ref), v56 (copy)
            if v71 then
                l_GuiService_0.SelectedCoreObject = v71;
                return;
            elseif not v56.state.vrActive then
                l_GuiService_0.SelectedCoreObject = v56.cameraModeButton:getValue();
                return;
            else
                l_GuiService_0.SelectedCoreObject = v56.volumeButton:getValue();
                return;
            end;
        end;
        v67 = v67(l_v15_0, v69);
        v58 = v67;
    end;
    if not v58 then
        v67 = nil;
    end;
    v58 = false;
    v66.FocusHandler = v67;
    v66.PageContents = l_Roact_0.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        CanvasSize = v56.pageSize, 
        Position = v56.props.position, 
        Size = UDim2.new(1, 0, 1, 0), 
        Selectable = false
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [l_Roact_0.Change.AbsoluteContentSize] = function(v72) --[[ Line: 174 ]]
                -- upvalues: v56 (copy)
                v56.setPageSize(UDim2.new(0, 0, 0, v72.AbsoluteContentSize.Y));
            end
        }), 
        VRControlsHeader = if v56.state.vrActive then l_Roact_0.createElement(v29, {
            LayoutOrder = v60(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle"
        }) else nil, 
        VignetteEnabled = if not l_game_EngineFeature_0 and v56.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VignetteEnabled"
        }) else nil, 
        VRSmoothRotationEnabled = if not l_game_EngineFeature_0 and v56.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VRSmoothRotationEnabled"
        }) else nil, 
        VRComfortSettings = if l_game_EngineFeature_0 and v56.state.vrActive then l_Roact_0.createElement(v26, {
            LayoutOrder = v60()
        }) else nil, 
        VRComfortSettingsPageButton = if l_game_EngineFeature_0 and v56.state.vrActive then l_Roact_0.createElement("TextButton", {
            LayoutOrder = v60(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            [l_Roact_0.Event.Activated] = v56.props.switchToVRComfortSettingsPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
            })(function(v73) --[[ Line: 215 ]]
                -- upvalues: l_Roact_0 (ref), v20 (ref)
                return l_Roact_0.createElement(v20, {
                    Text = v73.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }) else nil, 
        VRMode = if v62 then l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VREnabled", 
            subtextEnabled = v56.state.vrEnabled ~= l_VREnabled_0, 
            subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending"
        }) else nil, 
        VRSafetyBubbleMode = if v56.state.vrActive then l_Roact_0.createElement(v25, {
            LayoutOrder = v60()
        }) else nil, 
        VRControlsDivider = if v56.state.vrActive then l_Roact_0.createElement(v17, {
            LayoutOrder = v60(), 
            Size = UDim2.new(1, -24, 0, 1)
        }) else nil, 
        CameraHeader = if not v56.state.vrActive then l_Roact_0.createElement(v29, {
            LayoutOrder = v60(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle"
        }) else nil, 
        CameraMode = not v56.state.vrActive and l_Roact_0.createElement(v27, {
            LayoutOrder = v60(), 
            ButtonRef = v56.cameraModeButton, 
            canOpen = v56.props.canCaptureFocus, 
            canCaptureFocus = v56.props.canGamepadCaptureFocus
        }), 
        InvertedCamera = not v56.state.vrActive and v56.state.invertedCameraEnabled and l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera", 
            instance = l_UserGameSettings_0, 
            valueKey = "CameraYInverted"
        }), 
        CameraSensitivity = not v56.state.vrActive and l_Roact_0.createElement(v28, {
            LayoutOrder = v60(), 
            canCaptureFocus = v56.props.canCaptureFocus and v56.props.canGamepadCaptureFocus, 
            isMenuOpen = v56.props.isMenuOpen
        }), 
        CameraDivider = if not v56.state.vrActive then l_Roact_0.createElement(v17, {
            LayoutOrder = v60(), 
            Size = UDim2.new(1, -24, 0, 1)
        }) else nil, 
        ControlsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v60(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio"
        }), 
        ShiftLock = not v56.state.vrActive and l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock", 
            instance = l_UserGameSettings_0, 
            valueKey = "ControlMode", 
            onValue = Enum.ControlMode.MouseLockSwitch, 
            offValue = Enum.ControlMode.Classic, 
            lockedToOff = not v56.state.shiftLockEnabled
        }), 
        MovementMode = not v56.state.vrActive and l_Roact_0.createElement(v32, {
            LayoutOrder = v60(), 
            canOpen = v56.props.canCaptureFocus, 
            canCaptureFocus = v56.props.canGamepadCaptureFocus
        }), 
        VolumeEntry = l_Roact_0.createElement(v34, {
            LayoutOrder = v60(), 
            buttonRef = v56.volumeButton, 
            canCaptureFocus = v56.props.canCaptureFocus and v56.props.canGamepadCaptureFocus, 
            isMenuOpen = v56.props.isMenuOpen
        }), 
        HapticsToggle = if l_GetFFlagAddHapticsToggle_0() then l_Roact_0.createElement(v24, {
            LayoutOrder = v60(), 
            labelKey = "Feature.Accessibility.Header.Haptics", 
            instance = l_UserGameSettings_0, 
            valueKey = "HapticStrength", 
            onValue = 1, 
            offValue = 0
        }) else nil, 
        InputDevice = v59 and l_Roact_0.createElement(v30, {
            LayoutOrder = v60(), 
            deviceType = v30.DeviceType.Input, 
            isMenuOpen = v56.props.isMenuOpen, 
            canOpen = v56.props.canCaptureFocus, 
            canCaptureFocus = v56.props.canGamepadCaptureFocus
        }), 
        OutputDevice = v59 and l_Roact_0.createElement(v30, {
            LayoutOrder = v60(), 
            deviceType = v30.DeviceType.Output, 
            isMenuOpen = v56.props.isMenuOpen, 
            canOpen = v56.props.canCaptureFocus, 
            canCaptureFocus = v56.props.canGamepadCaptureFocus
        }), 
        ControlsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v60(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        GraphicsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v60(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle"
        }), 
        GraphicsQualityEntry = l_Roact_0.createElement(v31, {
            LayoutOrder = v60(), 
            canCaptureFocus = v56.props.canCaptureFocus and v56.props.canGamepadCaptureFocus, 
            isMenuOpen = v56.props.isMenuOpen
        }), 
        FullScreen = not v56.state.vrActive and l_Roact_0.createElement(v33, {
            LayoutOrder = v60(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen", 
            checked = v56.state.fullScreenEnabled, 
            onToggled = function() --[[ Line: 359 ]] --[[ Name: onToggled ]]
                -- upvalues: l_GuiService_0 (ref), v35 (ref), v36 (ref)
                l_GuiService_0:ToggleFullscreen();
                v35(v36.AnalyticsSettingsChangeName, nil, {}, true);
            end
        }), 
        GraphicsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v60(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        AdvancedSettings = l_Roact_0.createElement("TextButton", {
            LayoutOrder = v60(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            SelectionImageObject = v57(l_CursorKind_0.Square), 
            [l_Roact_0.Event.Activated] = v56.props.switchToAdvancedPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
            })(function(v74) --[[ Line: 378 ]]
                -- upvalues: l_Roact_0 (ref), v20 (ref)
                return l_Roact_0.createElement(v20, {
                    Text = v74.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }), 
        AdvancedDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v60(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        ShiftLockEnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 409 ]] --[[ Name: callback ]]
                -- upvalues: v56 (copy), l_LocalPlayer_0 (ref)
                v56:setState({
                    shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock
                });
            end
        }), 
        FullScreenListener = l_Roact_0.createElement(v18, {
            event = l_UserGameSettings_0.FullscreenChanged, 
            callback = function(v75) --[[ Line: 417 ]] --[[ Name: callback ]]
                -- upvalues: v56 (copy), v35 (ref), v36 (ref)
                v56:setState({
                    fullScreenEnabled = v75
                });
                v35(v36.AnalyticsInGameMenuName, v36.AnalyticsFullscreenModeName, {
                    enabled = v75
                });
            end
        }), 
        CameraYInvertedListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 429 ]] --[[ Name: callback ]]
                -- upvalues: v56 (copy), l_UserGameSettings_0 (ref)
                v56:setState({
                    invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted
                });
            end
        }), 
        VRActiveListener = l_Roact_0.createElement(v18, {
            event = v56.props.vrService:GetPropertyChangedSignal("VREnabled"), 
            callback = function() --[[ Line: 437 ]] --[[ Name: callback ]]
                -- upvalues: v56 (copy), l_UserGameSettings_0 (ref)
                if v56.props.vrService.VREnabled then
                    l_UserGameSettings_0.HasEverUsedVR = true;
                end;
                v56:setState({
                    vrActive = v56.props.vrService.VREnabled
                });
            end
        }), 
        VREnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_1, 
            callback = function() --[[ Line: 448 ]] --[[ Name: callback ]]
                -- upvalues: v56 (copy), l_UserGameSettings_0 (ref)
                v56:setState({
                    vrEnabled = l_UserGameSettings_0.VREnabled
                });
            end
        })
    });
    return l_createElement_0(l_v19_0, v65, v66);
end;
v47.render = function(v76) --[[ Line: 458 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v77) --[[ Line: 459 ]]
        -- upvalues: v76 (copy)
        return v76:renderWithSelectionCursor(v77);
    end);
end;
v47.didMount = function(v78) --[[ Line: 464 ]] --[[ Name: didMount ]]
    -- upvalues: l_RobloxGui_0 (copy)
    spawn(function() --[[ Line: 465 ]]
        -- upvalues: l_RobloxGui_0 (ref), v78 (copy)
        require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function() --[[ Line: 470 ]]
            -- upvalues: v78 (ref)
            v78:setState({
                voiceChatEnabled = true
            });
        end):catch(function() --[[ Line: 475 ]]

        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v79) --[[ Line: 479 ]]
    -- upvalues: v36 (copy), v42 (copy)
    local v80 = false;
    if v79.menuPage == "GameSettings" then
        v80 = v79.isMenuOpen and not v79.respawn.dialogOpen;
    end;
    local v81 = false;
    if v79.displayOptions.inputType == v36.InputType.Gamepad then
        v81 = v79.currentZone == 1;
    end;
    local v82 = nil;
    if v42() then
        v82 = v79.currentZone;
    end;
    return {
        isMenuOpen = v79.isMenuOpen, 
        currentPage = v79.menuPage, 
        currentZone = v82, 
        canCaptureFocus = v80, 
        canGamepadCaptureFocus = v81
    };
end, function(v83) --[[ Line: 497 ]]
    -- upvalues: v23 (copy), v36 (copy)
    return {
        switchToAdvancedPage = function() --[[ Line: 499 ]] --[[ Name: switchToAdvancedPage ]]
            -- upvalues: v83 (copy), v23 (ref), v36 (ref)
            v83(v23(v36.advancedSettingsPageKey));
        end, 
        switchToVRComfortSettingsPage = function() --[[ Line: 502 ]] --[[ Name: switchToVRComfortSettingsPage ]]
            -- upvalues: v83 (copy), v23 (ref), v36 (ref)
            v83(v23(v36.vrComfortSettingsPageKey));
        end
    };
end)(v47);