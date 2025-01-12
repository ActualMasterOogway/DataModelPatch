local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_withLocalization_0 = v1.withLocalization;
local l_memoize_0 = v1.memoize;
local l_Text_0 = v1.Text;
local v6 = require(script.Parent.getUserRecommendationContext);
local v7 = require(script.Parent.getCorrectUserPresence);
local v8 = require(script.Parent.getUserPresenceIcon);
local v9 = require(l_Parent_0.Utils.getUserPresenceLabel);
local _ = require(l_Parent_0.Common.LocalTypes);
local l_UIBlox_0 = v1.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v17 = l_Roact_0.PureComponent:extend("CarouselUserContextualInfo");
v17.defaultProps = {
    maxNumberOfLines = 2
};
v17.init = function(v18) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_Text_0 (copy), v7 (copy), v8 (copy), v9 (copy), v6 (copy)
    v18.getTextHeight = l_memoize_0(function(v19, v20, v21) --[[ Line: 38 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight(v19, v20, v21);
    end);
    v18.getContextualIconAndText = l_memoize_0(function(v22, v23, v24) --[[ Line: 43 ]]
        -- upvalues: v7 (ref), v8 (ref), v9 (ref), v6 (ref)
        if v22.isFriendWithUser then
            local v25 = v7(v22);
            return v8({
                presence = v25, 
                theme = v23
            }), (v9({
                presence = v25, 
                lastLocation = v22.lastLocation, 
                font = v24, 
                theme = v23
            }));
        else
            return v6(v22);
        end;
    end);
end;
v17.render = function(v26) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), l_IconSize_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy)
    local l_props_0 = v26.props;
    return l_withStyle_0(function(v28) --[[ Line: 73 ]]
        -- upvalues: v26 (copy), l_props_0 (copy), l_withLocalization_0 (ref), l_Roact_0 (ref), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_StyledTextLabel_0 (ref)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        local v31, v32 = v26.getContextualIconAndText(l_props_0.user, l_Theme_0, l_Font_0);
        return l_withLocalization_0({
            labelText = v32.textKey
        })(function(v33) --[[ Line: 81 ]]
            -- upvalues: v32 (copy), l_Font_0 (copy), l_Roact_0 (ref), l_props_0 (ref), v31 (copy), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_Theme_0 (copy), l_StyledTextLabel_0 (ref), v26 (ref)
            local v34 = if v32.textKey then v33.labelText else v32.text;
            if v32.formatter then
                v34 = v32.formatter(v34);
            end;
            local v35 = v32.font or l_Font_0.CaptionBody;
            return l_Roact_0.createElement("Frame", {
                LayoutOrder = l_props_0.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                IconFrame = v31 and v31.path and l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                    BackgroundTransparency = 1
                }, {
                    layout = l_Roact_0.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    PresenceIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0[v31.path], 
                        ImageColor3 = v31.color or l_Theme_0.IconDefault.Color, 
                        ImageTransparency = v31.transparency or l_Theme_0.IconDefault.Transparency, 
                        Size = v31.size or UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5)
                    })
                }) or nil, 
                ContextualText = v34 and l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    size = UDim2.fromOffset(v31 and l_props_0.tileSize - (l_IconSize_0.Small + 2) or l_props_0.tileSize, v26.getTextHeight(v34, v35.Font, l_Font_0.BaseSize * v35.RelativeSize) * l_props_0.maxNumberOfLines), 
                    lineHeight = 1, 
                    text = v34, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    fontStyle = v35, 
                    colorStyle = v32.colorStyle or l_Theme_0.SecondaryContent, 
                    fluidSizing = false, 
                    richText = false
                }) or nil
            });
        end);
    end);
end;
return v17;