local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v6 = v1.PureComponent:extend("Checkbox");
v6.defaultProps = {
    activated = false
};
v6.render = function(v7) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return v2.Style.withStyle(function(v8) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v1 (ref), l_GetFFlagLuaAppEnableFoundationColors_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        local v9 = nil;
        local v10 = nil;
        local v11 = nil;
        if v7.props.activated then
            v9 = "rbxasset://textures/ui/LuaChat/graphic/ic-checkbox-on.png";
            v10 = Color3.fromRGB(255, 255, 255);
            v11 = 0;
        else
            v9 = "rbxasset://textures/ui/LuaChatV2/actions_checkbox.png";
            v10 = v8.Theme.IconEmphasis.Color;
            v11 = v8.Theme.IconEmphasis.Transparency;
        end;
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 64, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            image = if l_GetFFlagLuaAppEnableFoundationColors_0() then v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                BackgroundTransparency = 1, 
                Image = if v7.props.activated then l_Images_0["squircles/fill"] else l_Images_0["squircles/hollow"], 
                ImageColor3 = if v7.props.activated then v8.Tokens.Global.Color.Blue.Color3 else v8.Theme.IconEmphasis.Color, 
                ImageTransparency = v7.props.activated and 0 or v8.Theme.IconEmphasis.Transparency
            }, {
                FillImage = if v7.props.activated then v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromOffset(10, 10), 
                    Image = l_Images_0["icons/status/success_small"]
                }) else nil
            }) else v1.createElement("ImageLabel", {
                Size = UDim2.new(0, 20, 0, 20), 
                BackgroundTransparency = 1, 
                Image = v9, 
                ImageColor3 = v10, 
                ImageTransparency = v11
            })
        });
    end);
end;
return v6;