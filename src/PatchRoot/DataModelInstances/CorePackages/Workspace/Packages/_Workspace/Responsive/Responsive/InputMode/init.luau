local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v4 = {
    Pointer = "Pointer", 
    Touch = "Touch", 
    Directional = "Directional"
};
local v5 = {
    [Enum.UserInputType.MouseButton1] = v4.Pointer, 
    [Enum.UserInputType.MouseButton2] = v4.Pointer, 
    [Enum.UserInputType.MouseButton3] = v4.Pointer, 
    [Enum.UserInputType.MouseWheel] = v4.Pointer, 
    [Enum.UserInputType.MouseMovement] = v4.Pointer, 
    [Enum.UserInputType.Keyboard] = v4.Pointer, 
    [Enum.UserInputType.TextInput] = v4.Pointer, 
    [Enum.UserInputType.Gamepad1] = v4.Directional, 
    [Enum.UserInputType.Gamepad2] = v4.Directional, 
    [Enum.UserInputType.Gamepad3] = v4.Directional, 
    [Enum.UserInputType.Gamepad4] = v4.Directional, 
    [Enum.UserInputType.Gamepad5] = v4.Directional, 
    [Enum.UserInputType.Gamepad6] = v4.Directional, 
    [Enum.UserInputType.Gamepad7] = v4.Directional, 
    [Enum.UserInputType.Gamepad8] = v4.Directional, 
    [Enum.UserInputType.Touch] = v4.Touch, 
    [Enum.UserInputType.None] = v4.Pointer
};
local v6 = l_Signal_0.new();
local v7 = {
    preferred = nil, 
    last = nil
};
local v8 = {
    [Enum.Platform.XBoxOne] = true, 
    [Enum.Platform.XBox360] = true, 
    [Enum.Platform.WiiU] = true, 
    [Enum.Platform.PS3] = true, 
    [Enum.Platform.PS4] = true, 
    [Enum.Platform.PS5] = true, 
    [Enum.Platform.Ouya] = true, 
    [Enum.Platform.AndroidTV] = true
};
local v9 = {
    [Enum.Platform.IOS] = true, 
    [Enum.Platform.Android] = true
};
getPreferredInput = function() --[[ Line: 59 ]] --[[ Name: getPreferredInput ]]
    -- upvalues: l_UserInputService_0 (copy), l_VRService_0 (copy), v8 (copy), v9 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local l_VREnabled_0 = l_VRService_0.VREnabled;
    local v12 = v8[l_l_UserInputService_0_Platform_0] or false;
    local v13 = v9[l_l_UserInputService_0_Platform_0] or false;
    if l_VREnabled_0 then
        return v4.Pointer;
    elseif v12 then
        return v4.Directional;
    elseif v13 then
        return v4.Touch;
    else
        return v4.Pointer;
    end;
end;
updatePreferredInput = function() --[[ Line: 76 ]] --[[ Name: updatePreferredInput ]]
    -- upvalues: v7 (copy), v6 (copy)
    local v14 = getPreferredInput();
    if v14 ~= v7.preferred then
        v7.preferred = v14;
        if v7.last == nil then
            v7.last = v7.preferred;
        end;
        v6:fire();
    end;
end;
updateLastInput = function() --[[ Line: 87 ]] --[[ Name: updateLastInput ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), v7 (copy), v6 (copy)
    local v15 = v5[l_UserInputService_0:GetLastInputType()];
    if v15 and v15 ~= v7.last then
        v7.last = v15;
        v6:fire();
    end;
end;
init = function() --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.GamepadConnected:Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("TouchEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("GamepadEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0.LastInputTypeChanged:Connect(updateLastInput);
    updateLastInput();
    updatePreferredInput();
end;
init();
local v16 = {
    {
        Key = v4.Directional, 
        preferredInput = v4.Directional
    }, 
    {
        Key = v4.Pointer, 
        preferredInput = v4.Pointer
    }, 
    {
        Key = v4.Touch, 
        preferredInput = v4.Touch
    }
};
local v17 = {
    {
        Key = v4.Directional, 
        lastInput = v4.Directional
    }, 
    {
        Key = v4.Pointer, 
        lastInput = v4.Pointer
    }, 
    {
        Key = v4.Touch, 
        lastInput = v4.Touch
    }
};
return {
    Enum = v4, 
    preferredInputRules = v16, 
    lastInputRules = v17, 
    connect = function(v18) --[[ Line: 124 ]] --[[ Name: connect ]]
        -- upvalues: v6 (copy)
        return v6:connect(v18);
    end, 
    preferred = function() --[[ Line: 127 ]] --[[ Name: preferred ]]
        -- upvalues: v7 (copy)
        return v7.preferred;
    end, 
    last = function() --[[ Line: 130 ]] --[[ Name: last ]]
        -- upvalues: v7 (copy)
        return v7.last;
    end
};