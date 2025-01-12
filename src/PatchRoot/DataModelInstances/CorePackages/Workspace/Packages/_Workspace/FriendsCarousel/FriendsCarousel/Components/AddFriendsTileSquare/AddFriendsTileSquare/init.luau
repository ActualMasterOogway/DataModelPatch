local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_memoize_0 = v1.memoize;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v14 = require(l_script_FirstAncestor_0.Utils.getTextHeight);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v17 = l_Images_0["icons/graphic/findfriends_large"];
local function _(v18, v19) --[[ Line: 43 ]]
    return 1 - (1 - v18) / v19;
end;
local v21 = l_Roact_0.PureComponent:extend("AddFriendsTileSquare");
v21.defaultProps = {
    badgeValue = nil, 
    tileSize = 100, 
    labelText = ""
};
v21.validateProps = l_t_0.strictInterface({
    badgeValue = l_t_0.optional(l_t_0.union(l_t_0.string, l_t_0.integer)), 
    onActivated = l_t_0.callback, 
    tileSize = l_t_0.number, 
    labelText = l_t_0.string
});
v21.init = function(v22) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy), l_memoize_0 (copy), v14 (copy)
    v22.state = {};
    v22.onStateChanged = function(v23, v24, v25) --[[ Line: 65 ]]
        -- upvalues: l_ControlState_0 (ref), v22 (copy)
        local l_Transparency_0 = v24.Transparency;
        local l_Transparency_1 = v25.Transparency;
        if v23 == l_ControlState_0.Pressed then
            l_Transparency_0 = 1 - (1 - v24.Transparency) / 2;
            l_Transparency_1 = 1 - (1 - v25.Transparency) / 2;
        elseif v23 == l_ControlState_0.Hover then
            l_Transparency_0 = 1 - (1 - v24.Transparency) / 2;
            l_Transparency_1 = 1 - (1 - v25.Transparency) / 2;
        end;
        v22:setState({
            iconTransparency = l_Transparency_0, 
            backgroundTransparency = l_Transparency_1
        });
    end;
    v22.onStateChangedSetup = l_memoize_0(function(v28, v29) --[[ Line: 81 ]]
        -- upvalues: v22 (copy)
        return function(_, v31) --[[ Line: 82 ]]
            -- upvalues: v22 (ref), v28 (copy), v29 (copy)
            v22.onStateChanged(v31, v28, v29);
        end;
    end);
    v22.getTextHeight = l_memoize_0(function(v32, v33, v34) --[[ Line: 87 ]]
        -- upvalues: v14 (ref)
        return v14(v32, v33, v34);
    end);
end;
v21.render = function(v35) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_Colors_0 (copy), v17 (copy), l_IconSize_0 (copy), l_Badge_0 (copy), l_StyledTextLabel_0 (copy)
    local l_state_0 = v35.state;
    local l_props_0 = v35.props;
    local l_backgroundTransparency_0 = l_state_0.backgroundTransparency;
    local l_iconTransparency_0 = l_state_0.iconTransparency;
    return l_withStyle_0(function(v40) --[[ Line: 98 ]]
        -- upvalues: v35 (copy), l_props_0 (copy), l_Roact_0 (ref), l_Interactable_0 (ref), l_backgroundTransparency_0 (copy), l_ImageSetLabel_0 (ref), l_iconTransparency_0 (copy), l_Colors_0 (ref), v17 (ref), l_IconSize_0 (ref), l_Badge_0 (ref), l_StyledTextLabel_0 (ref)
        local l_Theme_0 = v40.Theme;
        local l_Font_0 = v40.Font;
        local l_IconEmphasis_0 = l_Theme_0.IconEmphasis;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        local v45 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v46 = v35.getTextHeight(l_props_0.labelText, l_Font_0.CaptionHeader.Font, v45);
        return l_Roact_0.createFragment({
            AddFriendsTileSquare = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(l_props_0.tileSize, 0), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                AddFriendButton = l_Roact_0.createElement(l_Interactable_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(l_props_0.tileSize, l_props_0.tileSize), 
                    BackgroundTransparency = 1, 
                    onStateChanged = v35.onStateChangedSetup(l_IconEmphasis_0, l_BackgroundUIDefault_0), 
                    [l_Roact_0.Event.Activated] = l_props_0.onActivated
                }, {
                    Background = l_Roact_0.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = l_backgroundTransparency_0, 
                        BackgroundColor3 = l_BackgroundUIDefault_0.Color
                    }, {
                        UICorner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            ImageTransparency = l_iconTransparency_0, 
                            ImageColor3 = l_Colors_0.White, 
                            Image = v17, 
                            Size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large), 
                            Position = UDim2.fromScale(0.5, 0.5)
                        }), 
                        Badge = l_props_0.badgeValue and l_Roact_0.createElement(l_Badge_0, {
                            anchorPoint = Vector2.new(1, 0), 
                            position = UDim2.fromOffset(l_props_0.tileSize - 8, 8), 
                            value = l_props_0.badgeValue
                        })
                    })
                }), 
                AddFriendsLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = l_props_0.labelText, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    size = UDim2.fromOffset(l_props_0.tileSize, v46 * 2), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1
                })
            })
        });
    end);
end;
return v21;