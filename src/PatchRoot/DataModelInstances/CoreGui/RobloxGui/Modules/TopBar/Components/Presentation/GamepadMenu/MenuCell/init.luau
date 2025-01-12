local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = v2.PureComponent:extend("MenuCell");
v9.validateProps = v3.strictInterface({
    layoutOrder = v3.integer, 
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    iconComponent = v3.optional(v3.table), 
    localizationKey = v3.string, 
    height = v3.numberPositive, 
    hasDivider = v3.boolean, 
    isSelected = v3.boolean
});
v9.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v8 (copy), v2 (copy), l_ImageSetLabel_0 (copy)
    return l_withStyle_0(function(v11) --[[ Line: 35 ]]
        -- upvalues: v8 (ref), v10 (copy), v2 (ref), l_ImageSetLabel_0 (ref)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        local v14 = v8:FormatByKey(v10.props.localizationKey);
        local l_createElement_0 = v2.createElement;
        local v16 = "Frame";
        local v17 = {
            LayoutOrder = v10.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v10.props.height)
        };
        local v18 = {
            SelectedFrame = v10.props.isSelected and v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 4, 1, 4), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                TopBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                LeftBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                RightBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                BottomBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                })
            })
        };
        local l_createElement_1 = v2.createElement;
        local v20 = "Frame";
        local v21 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        };
        local v22 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            })
        };
        local l_createElement_2 = v2.createElement;
        local v24 = "Frame";
        local v25 = {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(36, 36)
        };
        local v26 = {};
        local v27 = false;
        if v10.props.icon ~= nil then
            v27 = v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v10.props.icon, 
                Size = UDim2.fromScale(1, 1), 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            });
        end;
        v26.IconLabel = v27;
        v27 = false;
        if v10.props.iconComponent ~= nil then
            v27 = v2.createElement(v10.props.iconComponent);
        end;
        v26.IconComponent = v27;
        v22.IconFrame = l_createElement_2(v24, v25, v26);
        v22.Text = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -48, 1, 0), 
            Text = v14, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
        v18.CellContents = l_createElement_1(v20, v21, v22);
        v18.Divider = v10.props.hasDivider and v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BackgroundColor3 = l_Theme_0.Divider.Color
        });
        return l_createElement_0(v16, v17, v18);
    end);
end;
return v9;