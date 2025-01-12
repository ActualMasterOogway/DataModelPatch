local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v7 = l_FlagUtil_0.getUserFlag("UserFixCameraOffsetJitter2");
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), l_GameSettings_0 (copy), l_Players_0 (copy)
    local v9 = setmetatable({}, v8);
    v9.isMouseLocked = false;
    v9.savedMouseCursor = nil;
    v9.boundKeys = {
        Enum.KeyCode.LeftShift, 
        Enum.KeyCode.RightShift
    };
    v9.mouseLockToggledEvent = Instance.new("BindableEvent");
    local l_BoundKeys_0 = script:FindFirstChild("BoundKeys");
    if not l_BoundKeys_0 or not l_BoundKeys_0:IsA("StringValue") then
        if l_BoundKeys_0 then
            l_BoundKeys_0:Destroy();
        end;
        l_BoundKeys_0 = Instance.new("StringValue");
        assert(l_BoundKeys_0, "");
        l_BoundKeys_0.Name = "BoundKeys";
        l_BoundKeys_0.Value = "LeftShift,RightShift";
        l_BoundKeys_0.Parent = script;
    end;
    if l_BoundKeys_0 then
        l_BoundKeys_0.Changed:Connect(function(v11) --[[ Line: 57 ]]
            -- upvalues: v9 (copy)
            v9:OnBoundKeysObjectChanged(v11);
        end);
        v9:OnBoundKeysObjectChanged(l_BoundKeys_0.Value);
    end;
    l_GameSettings_0.Changed:Connect(function(v12) --[[ Line: 64 ]]
        -- upvalues: v9 (copy)
        if v12 == "ControlMode" or v12 == "ComputerMovementMode" then
            v9:UpdateMouseLockAvailability();
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v9 (copy)
        v9:UpdateMouseLockAvailability();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 76 ]]
        -- upvalues: v9 (copy)
        v9:UpdateMouseLockAvailability();
    end);
    v9:UpdateMouseLockAvailability();
    return v9;
end;
v8.GetIsMouseLocked = function(v13) --[[ Line: 85 ]] --[[ Name: GetIsMouseLocked ]]
    return v13.isMouseLocked;
end;
v8.GetBindableToggleEvent = function(v14) --[[ Line: 89 ]] --[[ Name: GetBindableToggleEvent ]]
    return v14.mouseLockToggledEvent.Event;
end;
v8.GetMouseLockOffset = function(_) --[[ Line: 93 ]] --[[ Name: GetMouseLockOffset ]]
    -- upvalues: v7 (copy)
    if v7 then
        return (Vector3.new(1.75, 0, 0, 0));
    else
        local l_CameraOffset_0 = script:FindFirstChild("CameraOffset");
        if l_CameraOffset_0 and l_CameraOffset_0:IsA("Vector3Value") then
            return l_CameraOffset_0.Value;
        else
            if l_CameraOffset_0 then
                l_CameraOffset_0:Destroy();
            end;
            l_CameraOffset_0 = Instance.new("Vector3Value");
            assert(l_CameraOffset_0, "");
            l_CameraOffset_0.Name = "CameraOffset";
            l_CameraOffset_0.Value = Vector3.new(1.75, 0, 0, 0);
            l_CameraOffset_0.Parent = script;
            if l_CameraOffset_0 and l_CameraOffset_0.Value then
                return l_CameraOffset_0.Value;
            else
                return (Vector3.new(1.75, 0, 0, 0));
            end;
        end;
    end;
end;
v8.UpdateMouseLockAvailability = function(v17) --[[ Line: 120 ]] --[[ Name: UpdateMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v19 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v20 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v21 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    local v22 = l_DevEnableMouseLock_0 and v20 and not v21 and not v19;
    if v22 ~= v17.enabled then
        v17:EnableMouseLock(v22);
    end;
end;
v8.OnBoundKeysObjectChanged = function(v23, v24) --[[ Line: 132 ]] --[[ Name: OnBoundKeysObjectChanged ]]
    v23.boundKeys = {};
    for v25 in string.gmatch(v24, "[^%s,]+") do
        for _, v27 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v25 == v27.Name then
                v23.boundKeys[#v23.boundKeys + 1] = v27;
                break;
            end;
        end;
    end;
    v23:UnbindContextActions();
    v23:BindContextActions();
end;
v8.OnMouseLockToggled = function(v28) --[[ Line: 147 ]] --[[ Name: OnMouseLockToggled ]]
    -- upvalues: l_CameraUtils_0 (copy)
    v28.isMouseLocked = not v28.isMouseLocked;
    if v28.isMouseLocked then
        local l_CursorImage_0 = script:FindFirstChild("CursorImage");
        if l_CursorImage_0 and l_CursorImage_0:IsA("StringValue") and l_CursorImage_0.Value then
            l_CameraUtils_0.setMouseIconOverride(l_CursorImage_0.Value);
        else
            if l_CursorImage_0 then
                l_CursorImage_0:Destroy();
            end;
            l_CursorImage_0 = Instance.new("StringValue");
            assert(l_CursorImage_0, "");
            l_CursorImage_0.Name = "CursorImage";
            l_CursorImage_0.Value = "rbxasset://textures/MouseLockedCursor.png";
            l_CursorImage_0.Parent = script;
            l_CameraUtils_0.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png");
        end;
    else
        l_CameraUtils_0.restoreMouseIcon();
    end;
    v28.mouseLockToggledEvent:Fire();
end;
v8.DoMouseLockSwitch = function(v30, _, v32, _) --[[ Line: 172 ]] --[[ Name: DoMouseLockSwitch ]]
    if v32 == Enum.UserInputState.Begin then
        v30:OnMouseLockToggled();
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v8.BindContextActions = function(v34) --[[ Line: 180 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_Value_0 (copy)
    l_ContextActionService_0:BindActionAtPriority("MouseLockSwitchAction", function(v35, v36, v37) --[[ Line: 181 ]]
        -- upvalues: v34 (copy)
        return v34:DoMouseLockSwitch(v35, v36, v37);
    end, false, l_Value_0, unpack(v34.boundKeys));
end;
v8.UnbindContextActions = function(_) --[[ Line: 186 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("MouseLockSwitchAction");
end;
v8.IsMouseLocked = function(v39) --[[ Line: 190 ]] --[[ Name: IsMouseLocked ]]
    return v39.enabled and v39.isMouseLocked;
end;
v8.EnableMouseLock = function(v40, v41) --[[ Line: 194 ]] --[[ Name: EnableMouseLock ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v41 ~= v40.enabled then
        v40.enabled = v41;
        if v40.enabled then
            v40:BindContextActions();
            return;
        else
            l_CameraUtils_0.restoreMouseIcon();
            v40:UnbindContextActions();
            if v40.isMouseLocked then
                v40.mouseLockToggledEvent:Fire();
            end;
            v40.isMouseLocked = false;
        end;
    end;
end;
return v8;