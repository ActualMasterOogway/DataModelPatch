local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_TextService_0 = v2.TextService;
local l_UIBlox_0 = v2.UIBlox;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_validateImage_0 = l_UIBlox_0.Core.ImageSet.Validator.validateImage;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_FFlagUIBloxUseNewInteractable_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxUseNewInteractable;
local function v24(v19, v20, v21) --[[ Line: 32 ]]
    -- upvalues: l_ControlState_0 (copy)
    local v22 = v19[v20] or v19[l_ControlState_0.Default];
    local v23 = {
        Color = v21.Theme[v22].Color, 
        Transparency = v21.Theme[v22].Transparency
    };
    if v20 == l_ControlState_0.Disabled or v20 == l_ControlState_0.Pressed then
        v23.Transparency = 0.5 * v23.Transparency + 0.5;
    end;
    return v23;
end;
local v25 = l_Roact_0.PureComponent:extend("Pill");
v25.validateProps = l_t_0.strictInterface({
    text = l_t_0.optional(l_t_0.string), 
    isSelected = l_t_0.optional(l_t_0.boolean), 
    isDisabled = l_t_0.optional(l_t_0.boolean), 
    isLoading = l_t_0.optional(l_t_0.boolean), 
    icon = l_t_0.union(l_t_0.string, l_validateImage_0), 
    onActivated = l_t_0.callback
});
v25.init = function(v26) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy)
    v26.state = {
        controlState = l_ControlState_0.Initialize
    };
    v26.onStateChanged = function(_, v28) --[[ Line: 65 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            controlState = v28
        });
    end;
end;
v25.render = function(v29) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_ControlState_0 (copy), v24 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_TextService_0 (copy), l_Roact_0 (copy), l_Interactable_0 (copy), l_FFlagUIBloxUseNewInteractable_0 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy), l_Badge_0 (copy), l_BadgeStates_0 (copy), l_ShimmerPanel_0 (copy)
    return l_withStyle_0(function(v30) --[[ Line: 73 ]]
        -- upvalues: v29 (copy), l_ControlState_0 (ref), v24 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), l_Roact_0 (ref), l_Interactable_0 (ref), l_FFlagUIBloxUseNewInteractable_0 (ref), l_ImageSetLabel_0 (ref), l_StyledTextLabel_0 (ref), l_Badge_0 (ref), l_BadgeStates_0 (ref), l_ShimmerPanel_0 (ref)
        local l_Font_0 = v30.Font;
        local l_isSelected_0 = v29.props.isSelected;
        local l_isDisabled_0 = v29.props.isDisabled;
        local l_isLoading_0 = v29.props.isLoading;
        local l_icon_0 = v29.props.icon;
        local l_text_0 = v29.props.text;
        local l_onActivated_0 = v29.props.onActivated;
        local v38 = {
            [l_ControlState_0.Default] = l_isSelected_0 and "SystemPrimaryContent" or "IconDefault", 
            [l_ControlState_0.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "IconEmphasis"
        };
        local v39 = {
            [l_ControlState_0.Default] = l_isSelected_0 and "SystemPrimaryContent" or "TextDefault", 
            [l_ControlState_0.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "TextEmphasis"
        };
        local v40 = {
            [l_ControlState_0.Default] = l_isSelected_0 and "SystemPrimaryDefault" or "BackgroundUIDefault", 
            [l_ControlState_0.Hover] = l_isSelected_0 and "SystemPrimaryOnHover" or "BackgroundUIDefault"
        };
        local v41 = v24(v38, v29.state.controlState, v30);
        local v42 = v24(v39, v29.state.controlState, v30);
        local v43 = v24(v40, v29.state.controlState, v30);
        local v44 = l_getIconSize_0(l_IconSize_0.Small);
        local v45 = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize;
        local l_X_0 = l_TextService_0:GetTextSize(l_text_0, v45, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
        local v47 = l_X_0 + 24;
        local v48 = 240 - (32 + v44 + 12);
        if l_isLoading_0 then
            return nil;
        else
            local l_createElement_0 = l_Roact_0.createElement;
            local l_l_Interactable_0_0 = l_Interactable_0;
            local v53 = {
                Size = UDim2.new(0, v47 + 8 + v44 + 12, 0, 28), 
                BackgroundColor3 = v43.Color, 
                BackgroundTransparency = v43.Transparency, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                isDisabled = l_isDisabled_0, 
                [l_Roact_0.Event.Activated] = not l_isLoading_0 and l_onActivated_0 or nil, 
                onStateChanged = if l_FFlagUIBloxUseNewInteractable_0 then v29.onStateChanged else function(_, v52) --[[ Line: 121 ]]
                    -- upvalues: v29 (ref)
                    v29:setState({
                        controlState = v52
                    });
                end
            };
            local v54 = {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })
            };
            local l_createElement_1 = l_Roact_0.createElement;
            local v56 = "Frame";
            local v57 = {
                Size = UDim2.new(0, l_X_0 + 8 + v44 + 12, 1, 0), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            };
            local v58 = {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(v44, v44), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Image = l_icon_0, 
                    ImageColor3 = v41.Color, 
                    ImageTransparency = v41.Transparency
                })
            };
            local v59 = false;
            if string.len(l_text_0) > 0 then
                v59 = l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromOffset(l_X_0, v45), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    PillText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        text = l_text_0, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        colorStyle = v42, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        size = UDim2.fromOffset(v48, v45), 
                        [l_Roact_0.Ref] = v29.PillText
                    }); 
                    l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v48, 28)
                    })
                });
            end;
            v58.TextArea = v59;
            v58.BadgeFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(12, 12), 
                LayoutOrder = 4, 
                BackgroundTransparency = 1
            }, {
                Badge = l_Roact_0.createElement(l_Badge_0, {
                    value = l_BadgeStates_0.isEmpty
                })
            });
            v58.UISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(216, 28)
            });
            v54.Content = l_createElement_1(v56, v57, v58);
            v54.UICorner = l_Roact_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            v54.UISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(240, 28)
            });
            return l_createElement_0(l_l_Interactable_0_0, v53, v54) or l_Roact_0.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(0, v47 + 4 + v44, 0, 28), 
                cornerRadius = UDim.new(1, 0)
            });
        end;
    end);
end;
return v25;