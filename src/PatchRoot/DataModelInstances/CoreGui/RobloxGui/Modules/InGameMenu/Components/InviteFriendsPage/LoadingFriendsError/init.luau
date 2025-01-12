local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Resources.Assets);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local v14 = require(l_Parent_0.Components.Connection.FocusHandler);
local v15 = require(l_Parent_0.Components.Connection.RootedConnection);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local v18 = l_Roact_0.PureComponent:extend("LoadingFriendsError");
v18.validateProps = l_t_0.strictInterface({
    onRetry = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v18.init = function(v19) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v19.buttonRef = l_Roact_0.createRef();
    v19.state = {
        buttonIsInitialized = false
    };
end;
v18.render = function(v20) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), l_TextService_0 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v12 (copy), v13 (copy), v15 (copy), v14 (copy), l_GuiService_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_ControlState_0 (copy)
    local l_props_0 = v20.props;
    return l_withStyle_0(function(v22) --[[ Line: 50 ]]
        -- upvalues: v11 (ref), l_TextService_0 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v12 (ref), v13 (ref), v15 (ref), v14 (ref), l_props_0 (copy), v20 (copy), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_ControlState_0 (ref)
        return v11({
            errorOccured = "CoreScripts.InGameMenu.InviteFriends.ErrorOccured"
        })(function(v23) --[[ Line: 53 ]]
            -- upvalues: v22 (copy), l_TextService_0 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v12 (ref), v13 (ref), v15 (ref), v14 (ref), l_props_0 (ref), v20 (ref), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_ControlState_0 (ref)
            local l_Font_0 = v22.Font.Body.Font;
            local v25 = v22.Font.Body.RelativeSize * v22.Font.BaseSize;
            local l_Y_0 = l_TextService_0:GetTextSize(v23.errorOccured, v25, l_Font_0, Vector2.new(304, 1e999)).Y;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 304, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v12.Images.Friends, 
                    Size = UDim2.new(0, 64, 0, 64), 
                    ImageTransparency = 0.5, 
                    LayoutOrder = 1
                }), 
                TextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_Y_0 + 36), 
                    LayoutOrder = 2
                }, {
                    Text = l_Roact_0.createElement(v13, {
                        fontKey = "Body", 
                        themeKey = "TextEmphasis", 
                        Text = v23.errorOccured, 
                        Position = UDim2.new(0, 0, 0, 10), 
                        Size = UDim2.new(1, 0, 1, -36), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    })
                }), 
                RootedConnection = l_Roact_0.createElement(v15, {
                    render = function(v27) --[[ Line: 103 ]] --[[ Name: render ]]
                        -- upvalues: l_Roact_0 (ref), v14 (ref), l_props_0 (ref), v20 (ref), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v12 (ref), l_ControlState_0 (ref)
                        return l_Roact_0.createElement(v14, {
                            isFocused = l_props_0.canCaptureFocus and v20.state.buttonIsInitialized and v27, 
                            didFocus = function() --[[ Line: 107 ]] --[[ Name: didFocus ]]
                                -- upvalues: l_GuiService_0 (ref), v20 (ref)
                                l_GuiService_0.SelectedCoreObject = v20.buttonRef:getValue();
                            end
                        }, {
                            RetryButton = v27 and l_Roact_0.createElement(l_Button_0, {
                                buttonType = l_ButtonType_0.Secondary, 
                                layoutOrder = 3, 
                                size = UDim2.new(1, 0, 0, 48), 
                                icon = v12.Images.RetryIcon, 
                                onActivated = l_props_0.onRetry, 
                                buttonRef = v20.buttonRef, 
                                onStateChanged = function(_, v29) --[[ Line: 119 ]] --[[ Name: onStateChanged ]]
                                    -- upvalues: v20 (ref), l_ControlState_0 (ref)
                                    if not v20.state.buttonIsInitialized and v29 ~= l_ControlState_0.Initialize then
                                        v20:setState({
                                            buttonIsInitialized = true
                                        });
                                    end;
                                end
                            }) or nil
                        });
                    end
                })
            });
        end);
    end);
end;
return v18;