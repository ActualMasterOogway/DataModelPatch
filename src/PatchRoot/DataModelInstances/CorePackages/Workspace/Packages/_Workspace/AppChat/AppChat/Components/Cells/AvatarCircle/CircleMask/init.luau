local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = {
    Size36x36 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png", 
    Size48x48 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
};
return function(v3) --[[ Line: 23 ]] --[[ Name: CircleMask ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2[v3.overlaySize or "Size36x36"];
    return v1.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v3.circleInteriorBackgroundColor3, 
        BackgroundTransparency = v3.circleInteriorBackgroundTransparency, 
        BorderSizePixel = 0, 
        Image = "", 
        AutoButtonColor = false, 
        ClipsDescendants = true, 
        [v1.Event.Activated] = v3.onActivated
    }, {
        imageMask = v1.createElement("ImageLabel", {
            Image = v4, 
            ImageColor3 = v3.circleColor3, 
            ImageTransparency = v3.circleTransparency, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, v3.renderAboveMask)
    }, v3.children);
end;