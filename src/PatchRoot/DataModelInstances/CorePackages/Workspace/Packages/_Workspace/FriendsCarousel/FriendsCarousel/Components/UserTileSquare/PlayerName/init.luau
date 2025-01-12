local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Text_0 = v1.Text;
local l_memoize_0 = v1.memoize;
local l_UIBlox_0 = v1.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v8 = l_Roact_0.PureComponent:extend("PlayerName");
v8.init = function(v9) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_Text_0 (copy)
    v9.getTextHeight = l_memoize_0(function(v10, v11, v12) --[[ Line: 20 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight(v10, v11, v12);
    end);
end;
v8.render = function(v13) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_StyledTextLabel_0 (copy)
    local l_props_0 = v13.props;
    return l_withStyle_0(function(v15) --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), l_props_0 (copy), v13 (copy)
        local l_Theme_0 = v15.Theme;
        local l_Font_0 = v15.Font;
        return l_Roact_0.createElement(l_StyledTextLabel_0, {
            layoutOrder = l_props_0.layoutOrder, 
            text = l_props_0.name, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextEmphasis, 
            size = UDim2.fromOffset(l_props_0.tileSize, v13.getTextHeight(l_props_0.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize)), 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Center, 
            lineHeight = 1, 
            fluidSizing = false, 
            richText = false
        });
    end);
end;
return v8;