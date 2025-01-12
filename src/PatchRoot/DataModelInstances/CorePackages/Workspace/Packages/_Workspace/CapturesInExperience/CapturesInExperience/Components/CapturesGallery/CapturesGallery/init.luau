local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_Parent_0.Constants);
local v10 = require(l_Parent_0.Components.CapturesGallery.GalleryGridView);
return function(v11) --[[ Line: 26 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), v9 (copy), l_useLocalization_0 (copy), v3 (copy), v10 (copy)
    local v12 = l_useStyle_0();
    local v14 = l_useSelector_0(function(v13) --[[ Line: 29 ]]
        -- upvalues: v9 (ref)
        return v13[v9.RoduxKey].Captures;
    end);
    local v15 = next(v14) == nil;
    local v16 = l_useLocalization_0({
        nothingHereYet = "Feature.Captures.Label.NothingHereYet", 
        title = "Feature.Captures.Title.Gallery"
    });
    local v17 = v11.Size or UDim2.fromScale(1, 1);
    local l_Color_0 = v12.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v12.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v12.Theme.TextMuted.Color;
    local l_Font_0 = v12.Font.CaptionBody.Font;
    local v22 = v12.Font.BaseSize * v12.Font.CaptionBody.RelativeSize;
    local l_Transparency_1 = v12.Theme.TextMuted.Transparency;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v11.LayoutOrder, 
        Size = v17
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        NothingHereYet = v15 and v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0, 
            Size = UDim2.new(1, -12, 1, 12), 
            Text = v16.nothingHereYet, 
            TextColor3 = l_Color_1, 
            TextSize = v22, 
            TextTransparency = l_Transparency_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center
        }, {
            MaxSize = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(312, 1e999)
            })
        }), 
        GalleryGridView = not v15 and v3.createElement(v10, {
            captures = v14, 
            Size = UDim2.new(1, -12, 1, -12)
        })
    });
end;