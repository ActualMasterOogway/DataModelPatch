local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v4 = settings():FindFirstChild("Game Options") or error("Game Options does not exist", 0);
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local v10 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local v11 = require(l_CorePackages_0.Workspace.Packages.VideoProtocol);
local l_Roact_0 = v10.Roact;
local l_RoactRodux_0 = v10.RoactRodux;
local l_UIBlox_0 = v10.UIBlox;
local l_t_0 = v10.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local l_KeyLabel_0 = l_UIBlox_0.App.Menu.KeyLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v23 = require(l_Parent_0.Localization.withLocalization);
local v24 = require(l_Parent_0.Actions.SetRespawning);
local v25 = require(l_Parent_0.Thunks.CloseMenu);
local v26 = require(l_Parent_0.Resources.Assets);
local v27 = require(l_Parent_0.Actions.SetCurrentPage);
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v29 = require(l_Parent_0.Resources.Constants);
local v30 = require(l_Parent_0.Enums.Direction);
local v31 = require(script.Parent.PageNavigation);
local v32 = require(script.Parent.GameIconHeader);
local v33 = require(script.Parent.ZonePortal);
local l_Flags_0 = l_Parent_0.Flags;
local v35 = require(l_Flags_0.FFlagRecordRecording);
local v36 = game:DefineFastFlag("TakeAScreenshotOfThis", false);
local v37 = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false);
local v38 = game:DefineFastFlag("UseVRSpecificLeaveButton", false);
local v39 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v40 = require(l_Flags_0.GetFFlagSideNavControllerBar);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v42 = require(script.Parent.Connection.FocusHandler);
local v43 = require(script.Parent.IGMMainPageControllerBar);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v45 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.R, 
    [v29.InputType.Gamepad] = Enum.KeyCode.ButtonY
};
local v46 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.F12
};
local v47 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.L, 
    [v29.InputType.Gamepad] = Enum.KeyCode.ButtonX
};
local v48 = l_Roact_0.PureComponent:extend("MainPage");
local function _() --[[ Line: 82 ]] --[[ Name: areCapturesAllowed ]]
    -- upvalues: l_VRService_0 (copy), v36 (copy), l_CoreGui_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif not v36 then
        return true;
    else
        local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
        return not require(l_RobloxGui_1.Modules.Common:WaitForChild("PolicyService")):IsSubjectToChinaPolicies();
    end;
end;
v48.renderButtonModels = function(v51, v52, v53) --[[ Line: 95 ]] --[[ Name: renderButtonModels ]]
    -- upvalues: l_VRService_0 (copy), v36 (copy), l_CoreGui_0 (copy), l_Images_0 (copy), l_RunService_0 (copy), v4 (copy), v35 (copy), v46 (copy), v26 (copy), v45 (copy)
    local v54 = {};
    local l_inputType_0 = v51.props.inputType;
    local v56;
    if l_VRService_0.VREnabled then
        v56 = false;
    elseif not v36 then
        v56 = true;
    else
        local l_RobloxGui_2 = l_CoreGui_0:WaitForChild("RobloxGui");
        v56 = not require(l_RobloxGui_2.Modules.Common:WaitForChild("PolicyService")):IsSubjectToChinaPolicies();
    end;
    if v56 then
        if v36 then
            table.insert(v54, {
                icon = l_Images_0["icons/controls/screenshot"], 
                text = v53.screenCapture, 
                onActivated = function() --[[ Line: 109 ]] --[[ Name: onActivated ]]
                    -- upvalues: v51 (copy), l_RunService_0 (ref), l_CoreGui_0 (ref)
                    v51:setState({
                        modalOpen = false
                    });
                    v51.props.closeMenu();
                    l_RunService_0.RenderStepped:Wait();
                    l_RunService_0.RenderStepped:Wait();
                    l_CoreGui_0:TakeScreenshot();
                end
            });
        end;
        if v4.VideoCaptureEnabled and v35 then
            v56 = v53.recordVideo;
            local v58 = nil;
            if v51.props.recording then
                local v59 = os.date("*t", v51.state.recordingDuration);
                local v60 = ("%d:%02d"):format(v59.min, v59.sec);
                v56 = v53.recording:gsub("{DURATION}", v60);
                v58 = v52.Theme.Alert.Color;
            end;
            table.insert(v54, {
                icon = l_Images_0["icons/controls/screenrecord"], 
                text = v56, 
                onActivated = function() --[[ Line: 137 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_CoreGui_0 (ref), v51 (copy)
                    l_CoreGui_0:ToggleRecording();
                    v51:setState({
                        modalOpen = false
                    });
                end, 
                keyCodeLabel = v46[l_inputType_0], 
                iconColorOverride = v58, 
                textColorOverride = v58
            });
        end;
    end;
    if v51.props.respawnButtonVisible then
        table.insert(v54, {
            icon = v26.Images.RespawnIcon, 
            text = v53.respawnCharacter, 
            onActivated = function() --[[ Line: 155 ]] --[[ Name: onActivated ]]
                -- upvalues: v51 (copy)
                v51:setState({
                    modalOpen = false
                });
                v51.props.startRespawning();
            end, 
            keyCodeLabel = v45[l_inputType_0]
        });
    end;
    return v54;
end;
v48.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.optional(l_t_0.boolean), 
    respawnButtonVisible = l_t_0.boolean, 
    startLeavingGame = l_t_0.callback, 
    startRespawning = l_t_0.callback, 
    setMainPageMoreMenuOpen = l_t_0.optional(l_t_0.callback), 
    closeMenu = l_t_0.callback, 
    recording = l_t_0.boolean, 
    screenSize = l_t_0.Vector2, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    inputType = l_t_0.optional(l_t_0.string), 
    setFirstItemRef = l_t_0.optional(l_t_0.callback), 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    currentZone = v39() and l_t_0.optional(l_t_0.number) or nil, 
    isMainPageInForeground = v40() and l_t_0.optional(l_t_0.boolean) or nil
});
v48.init = function(v61) --[[ Line: 187 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy)
    v61.moreMenuFrameRef = nil;
    v61.moreMenuFirstItemFrameRef = nil;
    v61.moreMenuButtonRef = l_Roact_0.createRef();
    v61.mainPageFirstButtonRef = l_Roact_0.createRef();
    v61.setMoreMenuRef = function(v62) --[[ Line: 193 ]]
        -- upvalues: v61 (copy)
        v61.moreMenuFrameRef = v62;
    end;
    v61.setMoreMenuFirstItemRef = function(v63) --[[ Line: 197 ]]
        -- upvalues: v61 (copy)
        v61.moreMenuFirstItemFrameRef = v63;
    end;
    v61.getRecordingDuration = function() --[[ Line: 202 ]]
        -- upvalues: v11 (ref)
        local v64 = v11.default:getRecordingDuration();
        return v64 and v64.recordingDuration or 0;
    end;
    v61.state = {
        modalOpen = false, 
        recordingDuration = 0
    };
end;
v48.getDerivedStateFromProps = function(v65) --[[ Line: 215 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v40 (copy)
    if v40() then
        if not v65.isMainPageInForeground then
            return {
                modalOpen = false
            };
        end;
    elseif not v65.canCaptureFocus then
        return {
            modalOpen = false
        };
    end;
    return nil;
end;
v48.renderMainPageFocusHandler = function(v66) --[[ Line: 232 ]] --[[ Name: renderMainPageFocusHandler ]]
    -- upvalues: v39 (copy), l_Roact_0 (copy), v42 (copy), v40 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    local v67 = v66.canGamepadCaptureFocus(v66.props);
    local v68 = nil;
    if v39() then
        local l_modalOpen_0 = v66.state.modalOpen;
        v67 = v66.canGamepadCaptureFocus(v66.props) and not l_modalOpen_0;
        v68 = not v66.props.open or v66.props.currentZone == 0;
    end;
    return l_Roact_0.createElement(v42, {
        isFocused = v67, 
        shouldForgetPreviousSelection = v68, 
        didFocus = v39() and function(v70) --[[ Line: 247 ]]
            -- upvalues: v40 (ref), l_ContextActionService_0 (ref), v66 (copy), l_GuiService_0 (ref)
            if not v40() then
                l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v72) --[[ Line: 251 ]]
                    -- upvalues: v66 (ref)
                    if v72 == Enum.UserInputState.End then
                        v66:setState({
                            modalOpen = true
                        });
                        return Enum.ContextActionResult.Sink;
                    else
                        return Enum.ContextActionResult.Pass;
                    end;
                end, false, Enum.KeyCode.ButtonL3);
            end;
            l_GuiService_0.SelectedCoreObject = v70 or v66.mainPageFirstButtonRef:getValue();
        end or function() --[[ Line: 266 ]]
            -- upvalues: l_ContextActionService_0 (ref), v66 (copy)
            l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v74) --[[ Line: 267 ]]
                -- upvalues: v66 (ref)
                if v74 == Enum.UserInputState.End then
                    v66:setState({
                        modalOpen = not v66.state.modalOpen
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonL3);
        end, 
        didBlur = function() --[[ Line: 278 ]] --[[ Name: didBlur ]]
            -- upvalues: v40 (ref), l_ContextActionService_0 (ref)
            if not v40() then
                l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
            end;
        end
    });
end;
v48.renderMoreMenuFocusHandler = function(v75) --[[ Line: 286 ]] --[[ Name: renderMoreMenuFocusHandler ]]
    -- upvalues: v40 (copy), v29 (copy), l_Roact_0 (copy), v42 (copy), v39 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    local v76 = nil;
    v76 = if v40() then v75.props.isMainPageInForeground and v75.props.inputType == v29.InputType.Gamepad else v75.canGamepadCaptureFocus(v75.props);
    local l_modalOpen_1 = v75.state.modalOpen;
    return l_Roact_0.createElement(v42, {
        isFocused = v76 and l_modalOpen_1, 
        didFocus = function() --[[ Line: 298 ]] --[[ Name: didFocus ]]
            -- upvalues: v75 (copy), v39 (ref), l_ContextActionService_0 (ref), l_GuiService_0 (ref)
            local function v80(_, v79) --[[ Line: 299 ]]
                -- upvalues: v75 (ref)
                if v79 == Enum.UserInputState.End then
                    v75:setState({
                        modalOpen = false
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end;
            if v39() then
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v80, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3);
            else
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v80, false, Enum.KeyCode.ButtonB);
            end;
            if v75.moreMenuFrameRef ~= nil then
                l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
            end;
            l_GuiService_0:AddSelectionParent("MainPageMoreMenu", v75.moreMenuFrameRef);
            l_GuiService_0.SelectedCoreObject = v75.moreMenuFirstItemFrameRef;
        end, 
        didBlur = function() --[[ Line: 334 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
        end
    });
end;
v48.render = function(v81) --[[ Line: 340 ]] --[[ Name: render ]]
    -- upvalues: v40 (copy), v29 (copy), l_withStyle_0 (copy), v23 (copy), l_Roact_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v26 (copy), v37 (copy), l_VRService_0 (copy), v38 (copy), v47 (copy), v43 (copy), v28 (copy), l_Players_0 (copy), l_default_0 (copy), v33 (copy), v30 (copy), v32 (copy), v31 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_KeyLabel_0 (copy)
    local v82 = nil;
    v82 = if v40() then v81.props.isMainPageInForeground and v81.props.inputType == v29.InputType.Gamepad else v81.canGamepadCaptureFocus(v81.props);
    return l_withStyle_0(function(v83) --[[ Line: 348 ]]
        -- upvalues: v23 (ref), l_Roact_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v81 (copy), v26 (ref), v37 (ref), l_VRService_0 (ref), v38 (ref), v47 (ref), v43 (ref), v82 (ref), v28 (ref), l_Players_0 (ref), l_default_0 (ref), v33 (ref), v30 (ref), v32 (ref), v31 (ref), v29 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_KeyLabel_0 (ref)
        return v23({
            leaveGame = "CoreScripts.InGameMenu.LeaveGame", 
            respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter", 
            recordVideo = "CoreScripts.InGameMenu.Record.StartRecording", 
            recording = "CoreScripts.InGameMenu.Record.Duration", 
            screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
        })(function(v84) --[[ Line: 355 ]]
            -- upvalues: l_Roact_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v81 (ref), v26 (ref), v83 (copy), v37 (ref), l_VRService_0 (ref), v38 (ref), v47 (ref), v43 (ref), v82 (ref), v28 (ref), l_Players_0 (ref), l_default_0 (ref), v33 (ref), v30 (ref), v32 (ref), v31 (ref), v29 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_KeyLabel_0 (ref)
            local v85 = l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromOffset(44, 44), 
                onActivated = function() --[[ Line: 359 ]] --[[ Name: onActivated ]]
                    -- upvalues: v81 (ref)
                    v81:setState({
                        modalOpen = true
                    });
                end, 
                icon = v26.Images.MoreActions, 
                [l_Roact_0.Ref] = v81.moreMenuButtonRef
            });
            local v86 = v81:renderButtonModels(v83, v84);
            local l_respawnButtonVisible_0 = v81.props.respawnButtonVisible;
            if v37 then
                l_respawnButtonVisible_0 = #v86 > 0;
            end;
            local l_inputType_1 = v81.props.inputType;
            local v89 = if l_VRService_0.VREnabled and v38 then Enum.KeyCode.ButtonX else v47[l_inputType_1];
            local v90 = l_respawnButtonVisible_0 and -56 or 0;
            local l_modalOpen_2 = v81.state.modalOpen;
            local v92 = l_Roact_0.createElement(v43, {
                canCaptureFocus = v82, 
                isMainPageMoreMenuOpen = l_modalOpen_2
            });
            local v93 = nil;
            if v81.props.voiceEnabled then
                v93 = l_Roact_0.createElement(v28, {
                    size = UDim2.fromOffset(44, 44), 
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight", 
                    onClicked = function() --[[ Line: 393 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref)
                        l_default_0:ToggleMic("VRInGameMenuMainPage");
                    end
                });
                v90 = v90 - 56;
            end;
            return l_Roact_0.createElement("TextButton", {
                Size = UDim2.new(0, 400, 1, 0), 
                BackgroundColor3 = v83.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v83.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Visible = v81.props.open, 
                Text = "", 
                AutoButtonColor = false, 
                Selectable = false
            }, {
                MoreMenuFocusHandler = v81:renderMoreMenuFocusHandler(), 
                MainPageFocusHandler = not l_VRService_0.VREnabled and v81:renderMainPageFocusHandler() or nil, 
                ControllerBar = v92, 
                ZonePortal = l_Roact_0.createElement(v33, {
                    targetZone = 0, 
                    direction = v30.Left
                }), 
                GameIconHeader = l_Roact_0.createElement(v32), 
                PageNavigation = l_Roact_0.createElement(v31, {
                    Position = UDim2.new(0, v29.Zone.ContentOffset, 0, 148), 
                    mainPageFirstButtonRef = v81.mainPageFirstButtonRef
                }), 
                ContextualMenu = l_Roact_0.createElement(l_ContextualMenu_0, {
                    buttonProps = v86, 
                    setFrameRef = v81.setMoreMenuRef, 
                    setFirstItemRef = v81.setMoreMenuFirstItemRef, 
                    open = l_modalOpen_2, 
                    menuDirection = l_MenuDirection_0.Up, 
                    openPositionY = UDim.new(1, -84), 
                    closeBackgroundVisible = true, 
                    screenSize = v81.props.screenSize, 
                    onDismiss = function() --[[ Line: 435 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v81 (ref)
                        v81:setState({
                            modalOpen = false
                        });
                    end
                }), 
                BottomButtons = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 84), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    LeaveGame = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, v90, 0, 44), 
                        Position = UDim2.fromScale(1, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        LayoutOrder = 1
                    }, {
                        Button = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = UDim2.fromScale(1, 1), 
                            onActivated = v81.props.startLeavingGame, 
                            text = v84.leaveGame
                        }), 
                        KeyLabel = v89 and l_Roact_0.createElement(l_KeyLabel_0, {
                            keyCode = v89, 
                            iconThemeKey = "UIDefault", 
                            textThemeKey = "SystemPrimaryContent", 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Position = UDim2.new(1, -16, 0.5, 0), 
                            LayoutOrder = 2, 
                            ZIndex = 2
                        }) or nil
                    }), 
                    VoiceChatMuteButton = v93, 
                    MoreButton = l_respawnButtonVisible_0 and v85
                })
            });
        end);
    end);
end;
v48.willUnmount = function(v94) --[[ Line: 491 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GuiService_0 (copy), v40 (copy), l_ContextActionService_0 (copy)
    v94.recording = false;
    l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
    if v40() then
        l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
    end;
end;
v48.canGamepadCaptureFocus = function(v95) --[[ Line: 500 ]] --[[ Name: canGamepadCaptureFocus ]]
    -- upvalues: v29 (copy)
    return v95.canCaptureFocus and v95.inputType == v29.InputType.Gamepad;
end;
v48.didUpdate = function(v96, v97, v98) --[[ Line: 504 ]] --[[ Name: didUpdate ]]
    -- upvalues: v39 (copy), l_GuiService_0 (copy), v40 (copy), v29 (copy), l_ContextActionService_0 (copy), v35 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy)
    local l_modalOpen_3 = v96.state.modalOpen;
    local l_modalOpen_4 = v98.modalOpen;
    if not v39() and v96.canGamepadCaptureFocus(v96.props) and not l_modalOpen_3 then
        if l_modalOpen_4 then
            l_GuiService_0.SelectedCoreObject = v96.moreMenuButtonRef:getValue();
        elseif not v96.canGamepadCaptureFocus(v97) then
            l_GuiService_0.SelectedCoreObject = v96.mainPageFirstButtonRef:getValue();
        end;
    end;
    if v40() then
        local function _(v101, v102) --[[ Line: 520 ]] --[[ Name: gamepadCanToggleMoreMenu ]]
            -- upvalues: v29 (ref)
            return v101.isMainPageInForeground and v101.inputType == v29.InputType.Gamepad and not v102;
        end;
        local l_props_0 = v96.props;
        if l_props_0.isMainPageInForeground and l_props_0.inputType == v29.InputType.Gamepad and not l_modalOpen_3 and not (v97.isMainPageInForeground and v97.inputType == v29.InputType.Gamepad and not l_modalOpen_4) then
            l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v106) --[[ Line: 530 ]]
                -- upvalues: v96 (copy)
                if v106 == Enum.UserInputState.End then
                    v96:setState({
                        modalOpen = true
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonL3);
        else
            l_props_0 = v96.props;
            if not (l_props_0.isMainPageInForeground and l_props_0.inputType == v29.InputType.Gamepad and not l_modalOpen_3) and v97.isMainPageInForeground and v97.inputType == v29.InputType.Gamepad and not l_modalOpen_4 then
                l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
            end;
        end;
    end;
    if v35 then
        if v96.props.recording then
            if not v97.recording then
                v96.recording = true;
                local v107 = tick() - v96.getRecordingDuration();
                local function v108() --[[ Line: 554 ]] --[[ Name: loop ]]
                    -- upvalues: v96 (copy), v108 (copy), v107 (copy)
                    if v96.recording then
                        delay(0.2, v108);
                    end;
                    v96:setState({
                        recordingDuration = tick() - v107
                    });
                end;
                v96:setState({
                    recordingDuration = 0
                });
                delay(0.2, v108);
            end;
        else
            v96.recording = false;
        end;
    end;
    if l_VRService_0.VREnabled then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v109, _) --[[ Line: 577 ]]
    -- upvalues: v40 (copy), v29 (copy), v39 (copy)
    local v111 = nil;
    if v40() then
        v111 = v109.isMenuOpen and not v109.respawn.dialogOpen and v109.menuPage == v29.MainPagePageKey;
    end;
    local v112 = nil;
    if v39() then
        v112 = v109.currentZone;
    end;
    local v113 = false;
    if v109.menuPage == v29.MainPagePageKey then
        v113 = v109.isMenuOpen and not v109.respawn.dialogOpen and v109.currentZone == 1;
    end;
    return {
        open = v109.isMenuOpen, 
        respawnButtonVisible = v109.respawn.enabled, 
        recording = v109.recording, 
        screenSize = v109.screenSize, 
        voiceEnabled = v109.voiceState.voiceEnabled, 
        canCaptureFocus = v113, 
        currentZone = v112, 
        inputType = v109.displayOptions.inputType, 
        isMainPageInForeground = v111
    };
end, function(v114) --[[ Line: 606 ]]
    -- upvalues: v27 (copy), v29 (copy), v24 (copy), v25 (copy)
    return {
        startLeavingGame = function() --[[ Line: 608 ]] --[[ Name: startLeavingGame ]]
            -- upvalues: v114 (copy), v27 (ref), v29 (ref)
            v114(v27(v29.LeaveGamePromptPageKey));
        end, 
        startRespawning = function() --[[ Line: 611 ]] --[[ Name: startRespawning ]]
            -- upvalues: v114 (copy), v24 (ref)
            v114(v24(true));
        end, 
        closeMenu = function() --[[ Line: 614 ]] --[[ Name: closeMenu ]]
            -- upvalues: v114 (copy), v25 (ref)
            v114(v25);
        end
    };
end)(v48);