local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.RoactUtils);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v10 = l_Images_0["icons/navigation/close"];
return function(v11) --[[ Line: 26 ]]
    -- upvalues: l_useSelector_0 (copy), l_useTopBarHeight_0 (copy), l_useStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v10 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy)
    local v13 = l_useSelector_0(function(v12) --[[ Line: 27 ]]
        return v12.TopBar.statusBarHeight;
    end);
    local v14 = l_useTopBarHeight_0();
    local v15 = l_useStyle_0();
    local v16 = v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        v11.navigateBack();
    end, {
        v11.navigateBack
    });
    return v1.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v14), 
        BackgroundTransparency = 0, 
        Active = true, 
        BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    }, {
        LeftNavigationButton = v1.createElement("TextButton", {
            Position = UDim2.new(0, 15, 0, v13), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v1.Event.Activated] = v16
        }, {
            CloseButtonImage = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v10, 
                ImageColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v15.Theme.IconEmphasis.Color else v15.Theme.SystemPrimaryDefault.Color, 
                ImageTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v15.Theme.IconEmphasis.Transparency else v15.Theme.SystemPrimaryDefault.Transparency, 
                BackgroundTransparency = 1
            })
        })
    });
end;