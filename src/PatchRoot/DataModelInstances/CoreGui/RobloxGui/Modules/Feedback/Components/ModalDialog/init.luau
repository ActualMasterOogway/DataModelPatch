local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.Components.PortedComponents.Divider);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments);
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local v18 = v16() and 60 or 48;
local v19 = v2.Component:extend("ModalDialog");
v19.validateProps = v4.strictInterface({
    visible = v4.boolean, 
    screenSize = v4.Vector2, 
    titleText = v4.optional(v4.string), 
    showCloseButton = v4.optional(v4.boolean), 
    headerBar = v4.optional(v4.table), 
    contents = v4.optional(v4.table), 
    actionButtons = v4.optional(v4.table), 
    onDismiss = v4.optional(v4.callback), 
    onBackButtonActivated = v4.optional(v4.callback), 
    maxHeight = v4.optional(v4.number), 
    maxWidth = v4.optional(v4.number)
});
v19.init = function(v20) --[[ Line: 52 ]] --[[ Name: init ]]
    v20.onOverlayActivated = function() --[[ Line: 53 ]]
        -- upvalues: v20 (copy)
        v20.props.onDismiss();
    end;
end;
v19.renderHeaderBarLeft = function(v21) --[[ Line: 58 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), l_makeBackButton_0 (copy), l_HeaderBar_0 (copy)
    local l_props_0 = v21.props;
    if l_props_0.showCloseButton then
        return function() --[[ Line: 62 ]]
            -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_props_0 (copy)
            return v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/close"], 
                onActivated = l_props_0.onDismiss
            });
        end;
    elseif l_props_0.onBackButtonActivated ~= nil then
        if l_GetFFlagUIBloxUseNewHeaderBar_0() then
            return (l_makeBackButton_0(l_props_0.onBackButtonActivated));
        else
            return (l_HeaderBar_0.renderLeft.backButton(l_props_0.onBackButtonActivated));
        end;
    else
        return function() --[[ Line: 76 ]]
            return nil;
        end;
    end;
end;
v19.renderHeaderBarRight = function(_) --[[ Line: 82 ]] --[[ Name: renderHeaderBarRight ]]
    return function() --[[ Line: 84 ]]
        return nil;
    end;
end;
v19.render = function(v24) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), l_withStyle_0 (copy), v2 (copy), l_ImageSetButton_0 (copy), v6 (copy), l_HeaderBar_0 (copy), v7 (copy)
    local l_props_1 = v24.props;
    local v26 = math.min(l_props_1.screenSize.Y, 645);
    if l_props_1.maxHeight then
        v26 = math.min(v26, l_props_1.maxHeight);
    end;
    local v27 = math.min(l_props_1.screenSize.X, 540);
    if l_props_1.maxWidth then
        v27 = math.min(v27, l_props_1.maxWidth);
    end;
    local v28 = Vector2.new(v27, v26);
    local v29 = nil;
    local v30 = nil;
    if l_props_1.screenSize.X < 540 then
        v29 = Vector2.new(0.5, 1);
        v30 = UDim2.fromScale(0.5, 1);
    else
        v29 = Vector2.new(0.5, 0.5);
        v30 = UDim2.fromScale(0.5, 0.5);
    end;
    local v31 = math.min(600, v28.Y - 49 - v18);
    if not l_props_1.actionButtons then
        v31 = v31 + v18;
    end;
    return l_withStyle_0(function(v32) --[[ Line: 125 ]]
        -- upvalues: v2 (ref), l_props_1 (copy), v24 (copy), l_ImageSetButton_0 (ref), v29 (ref), v6 (ref), v30 (ref), v28 (copy), l_HeaderBar_0 (ref), v7 (ref), v31 (ref), v18 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_1.visible
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v32.Theme.Overlay.Color, 
                BackgroundTransparency = v32.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                [v2.Event.Activated] = v24.onOverlayActivated
            }), 
            Dialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                AnchorPoint = v29, 
                BackgroundTransparency = 1, 
                Image = v6.Images.RoundedRect.Image, 
                ImageColor3 = v32.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v32.Theme.BackgroundUIDefault.Transparency, 
                Position = v30, 
                ScaleType = v6.Images.RoundedRect.ScaleType, 
                Size = UDim2.fromOffset(v28.X, v28.Y), 
                SliceCenter = v6.Images.RoundedRect.SliceCenter
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderBar = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48)
                }, {
                    Bar = l_props_1.headerBar or v2.createElement(l_HeaderBar_0, {
                        backgroundTransparency = 1, 
                        barHeight = 48, 
                        renderLeft = v24:renderHeaderBarLeft(), 
                        renderRight = v24:renderHeaderBarRight(), 
                        title = l_props_1.titleText
                    }) or nil
                }), 
                Divider = v2.createElement(v7, {
                    LayoutOrder = 2
                }), 
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v31), 
                    ZIndex = 10
                }, {
                    Contents = l_props_1.contents
                }), 
                ActionBar = l_props_1.actionButtons and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v18)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8), 
                        PaddingBottom = UDim.new(0, 2), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    ActionButtons = l_props_1.actionButtons
                }) or nil
            })
        });
    end);
end;
v19.bindActions = function(v33) --[[ Line: 199 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("ModalDialogDismiss", function(v34) --[[ Line: 200 ]] --[[ Name: dismissFunc ]]
        -- upvalues: v33 (copy)
        if v34 == Enum.UserInputState.Begin then
            v33.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v19.unbindActions = function(_) --[[ Line: 208 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ModalDialogDismiss");
end;
v19.didMount = function(v36) --[[ Line: 212 ]] --[[ Name: didMount ]]
    if v36.props.visible then
        v36:bindActions();
    end;
end;
v19.didUpdate = function(v37) --[[ Line: 218 ]] --[[ Name: didUpdate ]]
    if v37.props.visible then
        v37:bindActions();
        return;
    else
        v37:unbindActions();
        return;
    end;
end;
v19.willUnmount = function(v38) --[[ Line: 226 ]] --[[ Name: willUnmount ]]
    v38:unbindActions();
end;
return v19;