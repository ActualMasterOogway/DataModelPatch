local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.Text.GetTextSize);
local v6 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v7 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v8 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v9 = require(l_Parent_0.Core.Style.Validator.validateColorToken);
local v10 = require(l_Parent_0.Core.Style.withStyle);
local v11 = require(l_Parent_0.UIBloxConfig);
local v12 = v2.PureComponent:extend("GenericTextLabel");
v12.validateProps = v4.interface({
    maxSize = v4.optional(v4.Vector2), 
    fontStyle = v4.union(v6, v7), 
    colorStyle = v4.union(v8, v9), 
    fluidSizing = v4.optional(v4.boolean), 
    openTypeFeatures = v4.optional(v4.string)
});
v12.defaultProps = {
    maxSize = Vector2.new(10000, 10000), 
    fluidSizing = false, 
    openTypeFeatures = nil
};
v12.render = function(v13) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v11 (copy), v5 (copy), v3 (copy), v2 (copy)
    local l_Text_0 = v13.props.Text;
    local l_fluidSizing_0 = v13.props.fluidSizing;
    return v10(function(v16) --[[ Line: 52 ]]
        -- upvalues: v13 (copy), l_Text_0 (copy), v11 (ref), v5 (ref), v3 (ref), v2 (ref), l_fluidSizing_0 (copy)
        local l_fontStyle_0 = v13.props.fontStyle;
        local l_colorStyle_0 = v13.props.colorStyle;
        local v19 = l_colorStyle_0.Color or l_colorStyle_0.Color3;
        local l_Transparency_0 = l_colorStyle_0.Transparency;
        local l_RichText_0 = v13.props.RichText;
        local l_BaseSize_0 = v16.Font.BaseSize;
        local v23 = if l_fontStyle_0.RelativeMinSize then l_BaseSize_0 * l_fontStyle_0.RelativeMinSize else l_fontStyle_0.FontSize;
        local v24 = if l_fontStyle_0.RelativeSize then l_BaseSize_0 * l_fontStyle_0.RelativeSize else l_fontStyle_0.FontSize;
        local l_Font_0 = l_fontStyle_0.Font;
        local l_Size_0 = v13.props.Size;
        if l_Size_0 == nil then
            local l_l_Text_0_0 = l_Text_0;
            if v13.props.TextTruncate == Enum.TextTruncate.AtEnd then
                l_l_Text_0_0 = l_l_Text_0_0 .. "...";
            end;
            local l_maxSize_0 = v13.props.maxSize;
            local v29 = if v11.fixGenericTextLabelTextBound and v13.props.LineHeight then v24 * v13.props.LineHeight else v24;
            local v30 = v5(l_l_Text_0_0, v29, l_Font_0, l_maxSize_0);
            l_Size_0 = UDim2.new(0, v30.X, 0, v30.Y);
        end;
        local v31 = if not (v13.props.AutomaticSize ~= nil) or v13.props.AutomaticSize == Enum.AutomaticSize.None then l_Size_0 else nil;
        local v32 = v13.props.TextSize or v24;
        local v33 = v13.props.AutomaticSize or nil;
        local v34 = v3.Dictionary.join(v13.props, {
            [v2.Children] = v3.None, 
            fluidSizing = v3.None, 
            fontStyle = v3.None, 
            openTypeFeatures = v3.None, 
            colorStyle = v3.None, 
            maxSize = v3.None, 
            Size = v31, 
            Text = l_Text_0, 
            Font = l_Font_0, 
            TextSize = v32, 
            AutomaticSize = v33, 
            TextColor3 = v19, 
            TextTransparency = l_Transparency_0, 
            TextWrapped = v13.props.TextWrapped == nil or v13.props.TextWrapped, 
            TextScaled = l_fluidSizing_0, 
            BackgroundTransparency = 1, 
            RichText = l_RichText_0
        });
        if v11.enableOpenTypeSupport and v13.props.openTypeFeatures then
            v34 = v3.Dictionary.join(v34, {
                OpenTypeFeatures = v13.props.openTypeFeatures
            });
        end;
        return v2.createElement("TextLabel", v34, v3.Dictionary.join({
            UITextSizeConstraint = l_fluidSizing_0 and v2.createElement("UITextSizeConstraint", {
                MaxTextSize = v24, 
                MinTextSize = v23
            } or nil)
        }, v13.props[v2.Children] or {}));
    end);
end;
return v12;