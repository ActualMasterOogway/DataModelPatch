local _ = game:GetService("Players");
local _ = game:GetService("UserInputService");
local _ = UserSettings():GetService("UserGameSettings");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v6 = false;
local v7 = tick();
local v8 = false;
local v9 = false;
local v10 = false;
l_CameraUI_0.setCameraModeToastEnabled(false);
return function(v11) --[[ Line: 20 ]]
    -- upvalues: l_CameraInput_0 (copy), v6 (ref), v8 (ref), v7 (ref), l_CameraUI_0 (copy), v10 (ref), v9 (ref), l_CameraUtils_0 (copy)
    local v12 = l_CameraInput_0.getTogglePan();
    if v11 and v12 ~= v6 then
        v8 = true;
    end;
    if v6 ~= v12 or tick() - v7 > 3 then
        local v13 = v12 and tick() - v7 < 3;
        l_CameraUI_0.setCameraModeToastOpen(v13);
        if v12 then
            v8 = false;
        end;
        v7 = tick();
        v6 = v12;
    end;
    if v11 ~= v10 then
        if v11 then
            v9 = l_CameraInput_0.getTogglePan();
            l_CameraInput_0.setTogglePan(true);
        elseif not v8 then
            l_CameraInput_0.setTogglePan(v9);
        end;
    end;
    if v11 then
        if l_CameraInput_0.getTogglePan() then
            l_CameraUtils_0.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
            l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
        else
            l_CameraUtils_0.restoreMouseIcon();
            l_CameraUtils_0.restoreMouseBehavior();
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
        end;
    elseif l_CameraInput_0.getTogglePan() then
        l_CameraUtils_0.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
        l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
        l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.MovementRelative);
    elseif l_CameraInput_0.getHoldPan() then
        l_CameraUtils_0.restoreMouseIcon();
        l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
        l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.MovementRelative);
    else
        l_CameraUtils_0.restoreMouseIcon();
        l_CameraUtils_0.restoreMouseBehavior();
        l_CameraUtils_0.restoreRotationType();
    end;
    v10 = v11;
end;