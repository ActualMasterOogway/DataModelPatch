local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local l_FullPageModal_0 = v12.App.Dialog.Modal.FullPageModal;
local l_Overlay_0 = v12.App.Dialog.Overlay;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v18 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v20 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_Parent_0 = script.Parent;
local v23 = require(l_Parent_0.Common.LabeledTextBox);
local v24 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local v25 = require(script.Parent.Parent.Actions.SetPromptVisibility);
local v26 = require(script.Parent.LeaveCreationAlert);
local v27 = require(script.Parent.Parent.Constants);
local v28 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local v29 = require(l_Parent_0.Common.PreviewViewport);
local v30 = require(l_Parent_0.ValidationErrorModal);
local l_PublishAssetAnalytics_0 = require(l_RobloxGui_0.Modules.PurchasePrompt).PublishAssetAnalytics;
local v32 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptPublishPromptModal);
local l_TopBarHeight_0 = v28.TopBarHeight;
local v34 = v7.PureComponent:extend("BasePublishPrompt");
local v35 = UDim.new(1.5, 0);
local function _(v36) --[[ Line: 69 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v20 (copy)
    return l_getInputGroup_0(v36) == v20.InputTypeConstants.Gamepad;
end;
v34.validateProps = v9.strictInterface({
    screenSize = v9.Vector2, 
    nameLabel = v9.string, 
    defaultName = v9.string, 
    promptBody = v9.any, 
    titleText = v9.string, 
    showingPreviewView = v9.boolean, 
    closePreviewView = v9.callback, 
    asset = v9.optional(v9.union(v9.instanceOf("Model"), v9.instanceIsA("AnimationClip"))), 
    onNameUpdated = v9.callback, 
    canSubmit = v9.callback, 
    onSubmit = v9.callback, 
    enableInputDelayed = v9.optional(v9.boolean), 
    isDelayedInput = v9.optional(v9.boolean), 
    delayInputSeconds = v9.optional(v9.number), 
    priceInRobux = v9.optional(v9.number), 
    showTopScrim = v9.optional(v9.boolean), 
    guid = v9.any, 
    scopes = v9.any, 
    errorMessage = v9.optional(v9.string), 
    promptVisible = v9.optional(v9.boolean), 
    closePrompt = v9.callback, 
    SetPromptVisibility = v9.callback
});
v34.init = function(v38) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v32 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v20 (copy), l_PublishAssetAnalytics_0 (copy), l_ExperienceAuthService_0 (copy)
    v38.swipeScrollingFrameRef = v7.createRef();
    v38.inputState = nil;
    v38.inputObject = nil;
    v38.connection = nil;
    v38.storeInput = function(_, v40, v41) --[[ Line: 113 ]]
        -- upvalues: v38 (copy)
        v38.inputState = v40;
        v38.inputObject = v41;
        return Enum.ContextActionResult.Sink;
    end;
    local v42 = {
        showUnsavedDataWarning = false
    };
    local v43;
    if v32 then
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        v43 = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == v20.InputTypeConstants.Gamepad;
    else
        v43 = nil;
    end;
    v42.isGamepad = v43;
    v38:setState(v42);
    v38.closePrompt = function() --[[ Line: 129 ]]
        -- upvalues: v38 (copy)
        v38.props.closePrompt();
        v38.props.SetPromptVisibility(false);
    end;
    v38.showUnsavedDataWarning = function() --[[ Line: 134 ]]
        -- upvalues: v38 (copy), l_PublishAssetAnalytics_0 (ref)
        v38:setState({
            showUnsavedDataWarning = true
        });
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.X);
    end;
    v38.cancelClosePrompt = function() --[[ Line: 142 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showUnsavedDataWarning = false
        });
    end;
    v38.denyAndClose = function() --[[ Line: 148 ]]
        -- upvalues: l_ExperienceAuthService_0 (ref), v38 (copy)
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v38.props.guid, v38.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v38.closePrompt();
    end;
    v38.confirmAndUpload = function() --[[ Line: 159 ]]
        -- upvalues: v38 (copy)
        if v38.props.canSubmit() then
            v38.props.onSubmit();
        end;
    end;
end;
v34.setUpGamepad = function(v45) --[[ Line: 166 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_ContextActionService_0 (copy), l_RunService_0 (copy), l_GamepadUtils_0 (copy), v35 (copy)
    if l_UserInputService_0.GamepadEnabled then
        l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
        l_ContextActionService_0:BindCoreAction("ScrollPrompt", v45.storeInput, false, Enum.KeyCode.Thumbstick2);
        v45.connection = l_RunService_0.RenderStepped:Connect(function(v46) --[[ Line: 170 ]]
            -- upvalues: v45 (copy), l_GamepadUtils_0 (ref), v35 (ref)
            if v45.inputState == Enum.UserInputState.Change and v45.inputObject then
                local l_Position_0 = v45.inputObject.Position;
                local l_current_0 = v45.swipeScrollingFrameRef.current;
                local v49 = l_current_0.CanvasPosition.Y + v46 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
                if v49 <= l_current_0.AbsoluteSize.Y * v35.Scale + v35.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v49);
                end;
            end;
        end);
        l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
        l_ContextActionService_0:BindCoreAction("ClosePrompt", v45.storeInput, false, Enum.KeyCode.ButtonB);
    end;
end;
v34.cleanupGamepad = function(v50) --[[ Line: 190 ]] --[[ Name: cleanupGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
    l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
    if v50.connection then
        v50.connection:Disconnect();
    end;
end;
v34.overrideMouseIconBehavior = function(v51) --[[ Line: 198 ]] --[[ Name: overrideMouseIconBehavior ]]
    -- upvalues: v18 (copy)
    local v52 = if v51.state.isGamepad then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow;
    v18.push("BasePublishPromptOverrideKey", v52);
end;
v34.removeMouseIconBehaviorOverride = function(_) --[[ Line: 206 ]] --[[ Name: removeMouseIconBehaviorOverride ]]
    -- upvalues: v18 (copy)
    v18.pop("BasePublishPromptOverrideKey");
end;
v34.didMount = function(v54) --[[ Line: 210 ]] --[[ Name: didMount ]]
    -- upvalues: v32 (copy)
    v54:setUpGamepad();
    v54.props.SetPromptVisibility(true);
    if v32 then
        v54:overrideMouseIconBehavior();
    end;
end;
v34.didUpdate = function(v55, v56, v57) --[[ Line: 221 ]] --[[ Name: didUpdate ]]
    -- upvalues: v32 (copy)
    if v56.promptVisible ~= v55.props.promptVisible and v55.props.promptVisible == false then
        v55.closePrompt();
    end;
    if v32 and v55.state.isGamepad ~= v57.isGamepad then
        v55:overrideMouseIconBehavior();
    end;
end;
v34.renderMiddle = function(v58, v59) --[[ Line: 237 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), v27 (copy), v23 (copy)
    return l_withStyle_0(function(v60) --[[ Line: 238 ]]
        -- upvalues: v7 (ref), v58 (copy), v27 (ref), v23 (ref), v59 (copy)
        local l_Font_0 = v60.Font;
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local l_Theme_0 = v60.Theme;
        local l_Footer_0 = l_Font_0.Footer;
        local l_Color_0 = l_Theme_0.TextDefault.Color;
        return v7.createFragment({
            ScrollingFrame = v7.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -50), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Selectable = false, 
                [v7.Ref] = v58.swipeScrollingFrameRef
            }, {
                layout = v7.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v27.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v27.PromptSidePadding)
                }), 
                NameInput = v7.createElement(v23, {
                    LayoutOrder = 1, 
                    labelText = v58.props.nameLabel, 
                    topPadding = 24, 
                    defaultText = v58.props.defaultName, 
                    onTextUpdated = v58.props.onNameUpdated, 
                    textBoxHeight = 30
                }), 
                PromptBody = v7.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, v58.props.promptBody)
            }), 
            BottomGradient = v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 5), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, -50), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = v7.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(0.5, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            DisclaimerContainer = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 50), 
                Position = UDim2.new(0, 0, 1, -50)
            }, {
                padding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v27.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v27.PromptSidePadding)
                }), 
                Disclaimer = v7.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v59.disclaimer, 
                    Font = l_Footer_0.Font, 
                    TextSize = l_BaseSize_0 * l_Footer_0.RelativeSize, 
                    TextColor3 = l_Color_0, 
                    BackgroundTransparency = 1, 
                    TextWrapped = true
                })
            })
        });
    end);
end;
v34.renderAlertLocalized = function(v66, v67) --[[ Line: 329 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: l_GuiService_0 (copy), l_withStyle_0 (copy), v7 (copy), v32 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v20 (copy), l_Overlay_0 (copy), l_TopBarHeight_0 (copy), l_FullPageModal_0 (copy), l_ButtonType_0 (copy), v26 (copy), v30 (copy), v29 (copy)
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    local v70 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
    local v71 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
    return l_withStyle_0(function(v72) --[[ Line: 334 ]]
        -- upvalues: v66 (copy), v67 (copy), v7 (ref), v32 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), l_getInputGroup_0 (ref), v20 (ref), v70 (copy), v71 (copy), l_Overlay_0 (ref), l_TopBarHeight_0 (ref), l_FullPageModal_0 (ref), l_ButtonType_0 (ref), v26 (ref), v30 (ref), v29 (ref)
        local l_Theme_1 = v72.Theme;
        local v74 = if v66.props.priceInRobux and v66.props.priceInRobux > 0 then string.format("%s %i", "\238\128\130", v66.props.priceInRobux) else v67.submit;
        return v7.createFragment({
            LastInputTypeConnection = v32 and v7.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v75) --[[ Line: 345 ]] --[[ Name: callback ]]
                    -- upvalues: v66 (ref), l_getInputGroup_0 (ref), v20 (ref)
                    v66:setState({
                        isGamepad = l_getInputGroup_0(v75) == v20.InputTypeConstants.Gamepad
                    });
                end
            }), 
            BottomScrim = v7.createElement("Frame", {
                Position = v70, 
                Size = v71, 
                ZIndex = -1, 
                BackgroundTransparency = 1
            }, {
                Overlay = v7.createElement(l_Overlay_0, {
                    showGradient = false
                }), 
                InputSink = v7.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Modal = v32 and true or nil
                })
            }), 
            PublishPrompt = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -l_TopBarHeight_0), 
                Position = UDim2.fromOffset(0, l_TopBarHeight_0), 
                Visible = not v66.state.showUnsavedDataWarning and not v66.props.showingPreviewView and not v66.props.showTopScrim
            }, {
                FullPageModal = v7.createElement(l_FullPageModal_0, {
                    title = v66.props.titleText, 
                    onCloseClicked = v66.showUnsavedDataWarning, 
                    distanceFromTop = 4, 
                    marginSize = 0, 
                    screenSize = v66.props.screenSize, 
                    buttonStackProps = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = not v66.props.canSubmit(), 
                                    isDelayedInput = v66.props.isDelayedInput, 
                                    enableInputDelayed = v66.props.enableInputDelayed, 
                                    delayInputSeconds = v66.props.delayInputSeconds, 
                                    onActivated = v66.confirmAndUpload, 
                                    text = v74, 
                                    isLoading = not v66.props.priceInRobux
                                }
                            }
                        }, 
                        disableRoactGamepadButtonSelection = true
                    }
                }, {
                    middleContent = v66:renderMiddle(v67)
                })
            }), 
            LeaveCreationAlert = if v66.state.showUnsavedDataWarning then v7.createElement(v26, {
                screenSize = v66.props.screenSize, 
                closePrompt = v66.denyAndClose, 
                cancelClosePrompt = v66.cancelClosePrompt
            }) else nil, 
            ValidationErrorAlert = if v66.props.errorMessage then v7.createElement(v30, {
                screenSize = v66.props.screenSize, 
                closePrompt = v66.closePrompt
            }) else nil, 
            PreviewFrame = v66.props.showingPreviewView and v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = l_Theme_1.BackgroundUIDefault.Transparency
            }, {
                PreviewViewport = v7.createElement(v29, {
                    asset = v66.props.asset, 
                    closePreviewView = v66.props.closePreviewView
                })
            }) or nil, 
            TopScrim = v7.createElement("Frame", {
                Position = v70, 
                Size = v71, 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                Visible = v66.props.showTopScrim
            }, {
                InputSink = v7.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Text = ""
                })
            })
        });
    end);
end;
local function _() --[[ Line: 450 ]] --[[ Name: GetLocalizedStrings ]]
    -- upvalues: v11 (copy)
    return {
        submit = v11:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"), 
        disclaimer = v11:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
    };
end;
v34.render = function(v77) --[[ Line: 458 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy)
    return v77:renderAlertLocalized({
        submit = v11:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"), 
        disclaimer = v11:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
    });
end;
v34.willUnmount = function(v78) --[[ Line: 463 ]] --[[ Name: willUnmount ]]
    -- upvalues: v32 (copy)
    if v32 then
        v78:removeMouseIconBehaviorOverride();
    end;
    v78:cleanupGamepad();
    v78.props.SetPromptVisibility(false);
end;
return v8.connect(function(v79) --[[ Line: 474 ]] --[[ Name: mapStateToProps ]]
    return {
        guid = v79.promptRequest.promptInfo.guid, 
        scopes = v79.promptRequest.promptInfo.scopes, 
        errorMessage = v79.promptRequest.promptInfo.errorMessage, 
        promptVisible = v79.promptRequest.promptInfo.promptVisible
    };
end, function(v80) --[[ Line: 483 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v25 (copy)
    return {
        closePrompt = function() --[[ Line: 485 ]] --[[ Name: closePrompt ]]
            -- upvalues: v80 (copy), v24 (ref)
            return v80(v24());
        end, 
        SetPromptVisibility = function(v81) --[[ Line: 488 ]] --[[ Name: SetPromptVisibility ]]
            -- upvalues: v80 (copy), v25 (ref)
            return v80(v25(v81));
        end
    };
end)(v34);