local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.FitFrame);
local l_FitFrameVertical_0 = v6.FitFrameVertical;
local l_FitTextLabel_0 = v6.FitTextLabel;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_withStyle_0 = v9.Core.Style.withStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v16 = require(l_Modules_0.RobloxTranslator);
local v17 = require(l_Modules_0.InGameMenuConstants);
local v18 = l_Images_0["icons/status/alert"];
local v19 = v4.PureComponent:extend("DisconnectedDialog");
v19.validateProps = v5.strictInterface({
    visible = v5.boolean, 
    onConfirm = v5.callback, 
    screenSize = v5.Vector2, 
    guiService = v5.optional(v5.union(v5.instanceOf("GuiService"), v5.table))
});
v19.defaultProps = {
    guiService = l_GuiService_0
};
v19.init = function(v20) --[[ Line: 50 ]] --[[ Name: init ]]
    v20.guiService = v20.props.guiService;
    v20.onConfirmBindingAction = function(_, v22, _) --[[ Line: 53 ]]
        -- upvalues: v20 (copy)
        if v22 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v20.props.onConfirm();
            return Enum.ContextActionResult.Sink;
        end;
    end;
end;
v19.render = function(v24) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v16 (copy), v4 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), v18 (copy), l_FitTextLabel_0 (copy), l_ButtonType_0 (copy), l_CoreGui_0 (copy), v17 (copy)
    return l_withStyle_0(function(v25) --[[ Line: 65 ]]
        -- upvalues: v16 (ref), v4 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v18 (ref), l_FitTextLabel_0 (ref), l_ButtonType_0 (ref), v24 (copy), l_CoreGui_0 (ref), v17 (ref)
        local l_Theme_0 = v25.Theme;
        local l_Font_0 = v25.Font;
        local v28 = v16:FormatByKey("InGame.ConnectionError.Heading.VRDisconnected");
        local v29 = v16:FormatByKey("InGame.ConnectionError.Message.RestartApp");
        local v30 = v16:FormatByKey("InGame.ConnectionError.Action.Restart");
        local v31 = v4.createElement(l_InteractiveAlert_0, {
            title = v28, 
            middleContent = function() --[[ Line: 75 ]] --[[ Name: middleContent ]]
                -- upvalues: v4 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v18 (ref), l_FitTextLabel_0 (ref), l_Font_0 (copy), v29 (copy), l_Theme_0 (copy)
                return v4.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24)
                }, {
                    Icon = v4.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.fromOffset(40, 40), 
                        Image = v18, 
                        ImageTransparency = 0
                    }), 
                    BodyText = v4.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Body.Font, 
                        Text = v29, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v24.props.onConfirm, 
                            text = v30
                        }
                    }
                }
            }, 
            screenSize = v24.props.screenSize
        });
        return v4.createElement(v4.Portal, {
            target = l_CoreGui_0
        }, {
            HeadsetDisconnectedDialog = v4.createElement("ScreenGui", {
                DisplayOrder = v17.DisplayOrder.HeadsetDisconnectedDialog, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = true, 
                Enabled = v24.props.visible, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = v4.createElement("Frame", {
                    Active = true, 
                    BackgroundColor3 = l_Theme_0.Overlay.Color, 
                    BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Alert = v31
                })
            })
        });
    end);
end;
v19.bindActions = function(v32) --[[ Line: 144 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ Line: 148 ]]

    end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape);
    l_ContextActionService_0:BindCoreAction("TopBarDialogConfirm", v32.onConfirmBindingAction, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA);
end;
v19.unbindActions = function(_) --[[ Line: 163 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadDisableMenuShortcut");
    l_ContextActionService_0:UnbindCoreAction("TopBarDialogConfirm");
end;
v19.didMount = function(v34) --[[ Line: 168 ]] --[[ Name: didMount ]]
    if v34.props.visible then
        v34:bindActions();
        v34.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog");
    end;
end;
v19.didUpdate = function(v35, v36, _) --[[ Line: 175 ]] --[[ Name: didUpdate ]]
    if v35.props.visible ~= v36.visible then
        if v35.props.visible then
            v35:bindActions();
            v35.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog");
            return;
        else
            v35:unbindActions();
            v35.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog");
        end;
    end;
end;
v19.willUnmount = function(v38) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
    v38:unbindActions();
    v38.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog");
end;
return v19;