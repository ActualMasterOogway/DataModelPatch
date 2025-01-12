local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Components.VirtualKeyboardMonitor);
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.Divider);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v18 = v2.Component:extend("ModalDialog");
v18.validateProps = v4.strictInterface({
    visible = v4.boolean, 
    screenSize = v4.Vector2, 
    titleText = v4.optional(v4.string), 
    showCloseButton = v4.optional(v4.boolean), 
    headerBar = v4.optional(v4.table), 
    contents = v4.optional(v4.table), 
    actionButtons = v4.optional(v4.table), 
    onDismiss = v4.optional(v4.callback), 
    onBackButtonActivated = v4.optional(v4.callback)
});
v18.init = function(v19) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    v19.virtualKeyboardMonitor = v6.getInstance();
    v19.onOverlayActivated = function() --[[ Line: 49 ]]
        -- upvalues: v19 (copy)
        if v19.virtualKeyboardMonitor:isKeyboardJustOff() then
            return;
        else
            v19.props.onDismiss();
            return;
        end;
    end;
end;
v18.renderHeaderBarLeft = function(v20) --[[ Line: 58 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), l_makeBackButton_0 (copy), l_HeaderBar_0 (copy)
    local l_props_0 = v20.props;
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
v18.renderHeaderBarRight = function(_) --[[ Line: 82 ]] --[[ Name: renderHeaderBarRight ]]
    return function() --[[ Line: 84 ]]
        return nil;
    end;
end;
v18.render = function(v23) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_ImageSetButton_0 (copy), v7 (copy), l_HeaderBar_0 (copy), v9 (copy)
    local l_props_1 = v23.props;
    local v25 = Vector2.new(math.min(l_props_1.screenSize.X, 540), (math.min(l_props_1.screenSize.Y, 375)));
    local v26 = nil;
    local v27 = nil;
    if l_props_1.screenSize.X < 540 then
        v26 = Vector2.new(0.5, 1);
        v27 = UDim2.fromScale(0.5, 1);
    else
        v26 = Vector2.new(0.5, 0.5);
        v27 = UDim2.fromScale(0.5, 0.5);
    end;
    local v28 = math.min(230, v25.Y - 49 - 96);
    if not l_props_1.actionButtons then
        v28 = v28 + 96;
    end;
    return l_withStyle_0(function(v29) --[[ Line: 111 ]]
        -- upvalues: v2 (ref), l_props_1 (copy), v23 (copy), l_ImageSetButton_0 (ref), v26 (ref), v7 (ref), v27 (ref), v25 (copy), l_HeaderBar_0 (ref), v9 (ref), v28 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_1.visible
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v29.Theme.Overlay.Color, 
                BackgroundTransparency = v29.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                ZIndex = -10, 
                [v2.Event.Activated] = v23.onOverlayActivated
            }), 
            Dialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                AnchorPoint = v26, 
                BackgroundTransparency = 1, 
                Image = v7.Images.RoundedRect.Image, 
                ImageColor3 = v29.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v29.Theme.BackgroundUIDefault.Transparency, 
                Position = v27, 
                ScaleType = v7.Images.RoundedRect.ScaleType, 
                Size = UDim2.fromOffset(v25.X, v25.Y), 
                SliceCenter = v7.Images.RoundedRect.SliceCenter
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
                        renderLeft = v23:renderHeaderBarLeft(), 
                        renderRight = v23:renderHeaderBarRight(), 
                        title = l_props_1.titleText
                    }) or nil
                }), 
                Divider = v2.createElement(v9, {
                    LayoutOrder = 2
                }), 
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v28), 
                    ZIndex = 10
                }, {
                    Contents = l_props_1.contents
                }), 
                ActionBar = l_props_1.actionButtons and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 96)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    ActionButtons = l_props_1.actionButtons
                }) or nil
            })
        });
    end);
end;
v18.bindActions = function(v30) --[[ Line: 186 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("ModalDialogDismiss", function(_, v32, _) --[[ Line: 187 ]] --[[ Name: dismissFunc ]]
        -- upvalues: v30 (copy)
        if v32 == Enum.UserInputState.Begin then
            v30.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v18.unbindActions = function(_) --[[ Line: 195 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ModalDialogDismiss");
end;
v18.didMount = function(v35) --[[ Line: 199 ]] --[[ Name: didMount ]]
    if v35.props.visible then
        v35:bindActions();
    end;
end;
v18.didUpdate = function(v36) --[[ Line: 205 ]] --[[ Name: didUpdate ]]
    if v36.props.visible then
        v36:bindActions();
        return;
    else
        v36:unbindActions();
        return;
    end;
end;
v18.willUnmount = function(v37) --[[ Line: 213 ]] --[[ Name: willUnmount ]]
    v37:unbindActions();
end;
return v18;