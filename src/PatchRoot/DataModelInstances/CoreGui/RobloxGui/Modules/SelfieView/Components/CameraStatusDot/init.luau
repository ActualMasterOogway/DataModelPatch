local l_Packages_0 = game:GetService("CorePackages").Packages;
local v1 = require(l_Packages_0.React);
local l_useStyle_0 = require(l_Packages_0.UIBlox).Core.Style.useStyle;
local v3 = require(script.Parent.Parent.Flags.GetFFlagSelfieViewRedStatusDot);
local v4 = UDim2.fromOffset(4, 4);
local v5 = Vector2.new(0.5, 0.5);
local v6 = UDim2.fromScale(0.8, 0.8);
return function(v7) --[[ Line: 20 ]] --[[ Name: CameraStatusDot ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v5 (copy), v4 (copy), v3 (copy), v6 (copy)
    local v8 = l_useStyle_0();
    return v1.createElement("Frame", {
        AnchorPoint = v7.AnchorPoint or v5, 
        Size = if v7.Size then v7.Size else v4, 
        BackgroundColor3 = if v3() then v8.Theme.Alert.Color else v8.Theme.OnlineStatus.Color, 
        Position = v7.Position or v6, 
        ZIndex = v7.ZIndex
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;