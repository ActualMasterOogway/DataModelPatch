local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = nil;
local v3 = require(l_Parent_0.RobloxTranslator):FormatByKey("Feature.NativeAds.Label.Ad");
local v4 = require(script.Parent.Flags);
local v5 = nil;
local v6 = nil;
if v4.GetEnableAdGuiUiBloxImages() then
    local v7 = require(l_Parent_0.UIBlox);
    v2 = v7.Core.ImageSet.ImageSetButton;
    local l_Images_0 = v7.App.ImageSet.Images;
    v5 = l_Images_0["icons/menu/more_on"];
    v6 = l_Images_0["icons/menu/more_off"];
else
    v5 = v4.GetFStringAdsEudsaPromptActiveImageLua();
    v6 = v4.GetFStringAdsEudsaPromptInactiveImageLua();
end;
local v9 = v1.Component:extend("AdLabel");
v9.render = function(v10) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v2 (ref), v5 (ref), v6 (ref)
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0.995, 0.995), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(1, 1), 
        Size = UDim2.fromScale(0.11447368421, 0.10108771929), 
        Visible = v10.props.Visible
    }, {
        Label = v1.createElement("TextLabel", {
            LayoutOrder = 1, 
            Text = v3, 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Font = Enum.Font.Gotham, 
            TextSize = 100, 
            TextScaled = true, 
            TextWrapped = false, 
            Position = UDim2.fromScale(0.134084726, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.fromScale(0.40808394869, 0.77610536218)
        }), 
        MenuButton = v1.createElement(if v4.GetEnableAdGuiUiBloxImages() then v2 else "ImageButton", {
            LayoutOrder = 2, 
            Image = v10.props.isMenuOpen and v5 or v6, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(v4.GetEnableAdGuiUiBloxImages() and 0.4 or 0.25, 0), 
            Position = UDim2.fromScale(v4.GetEnableAdGuiUiBloxImages() and 0.76 or 0.63513019821, 0.5), 
            AnchorPoint = Vector2.new(v4.GetEnableAdGuiUiBloxImages() and 0.5 or 0, 0.5), 
            [v1.Event.Activated] = v10.props.onActivated
        }, {
            UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.ScaleWithParentSize
            })
        })
    });
end;
return v9;