local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_validateImage_0 = v5.Core.ImageSet.Validator.validateImage;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local _ = script.Parent.Parent.Parent.Parent.Parent.InGameMenu;
local v12 = v3.PureComponent:extend("ButtonHint");
v12.validateProps = v4.strictInterface({
    layoutOrder = v4.optional(v4.integer), 
    localizationKey = v4.string, 
    keyImage = l_validateImage_0
});
v12.render = function(v13) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v10 (copy), l_TextService_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy)
    return l_withStyle_0(function(v14) --[[ Line: 32 ]]
        -- upvalues: v10 (ref), v13 (copy), l_TextService_0 (ref), v3 (ref), l_ImageSetLabel_0 (ref)
        local l_Theme_0 = v14.Theme;
        local l_Font_0 = v14.Font;
        local v17 = v10:FormatByKey(v13.props.localizationKey);
        local v18 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize or l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local l_X_0 = l_TextService_0:GetTextSize(v17, v18, l_Font_0.Header2.Font, Vector2.new(1000, 1000)).X;
        local v20 = 44 + l_X_0;
        return v3.createElement("Frame", {
            LayoutOrder = v13.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v20, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            Icon = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(36, 36), 
                Image = v13.props.keyImage, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            }), 
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_X_0, 0, 1), 
                LayoutOrder = 2, 
                Font = l_Font_0.Header2.Font, 
                Text = v17, 
                TextSize = v18, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v12;