local l_Parent_0 = script.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_Parent_0.Properties);
local v7 = require(l_Parent_0.Interface);
local v8 = game:DefineFastFlag("ResetVCThumbstickOnDisable", false);
local v9 = {};
local v10 = Vector2.new();
local v11 = Vector2.new();
local v12 = false;
local v13 = nil;
local function v20(v14) --[[ Line: 25 ]] --[[ Name: processThumbstickInput ]]
    -- upvalues: v6 (copy)
    local v15 = 0;
    local v16 = 0;
    if v14.Magnitude >= v6.ThumbstickDeadzone then
        local v17 = math.atan2(v14.y, v14.x);
        local v18 = math.abs(math.cos(v17) * v6.ThumbstickDeadzone);
        local v19 = math.abs(math.sin(v17) * v6.ThumbstickDeadzone);
        v15 = math.max(math.abs(v14.x) - v18, 0) / (1 - v18) * math.sign(v14.x);
        v16 = math.max(math.abs(v14.y) - v19, 0) / (1 - v19) * math.sign(v14.y);
    end;
    return Vector2.new(v15, -v16);
end;
local function v24(_, v22, v23) --[[ Line: 38 ]] --[[ Name: onThumbstick2Input ]]
    -- upvalues: v11 (ref)
    if v22 == Enum.UserInputState.Change then
        v11 = Vector2.new(v23.Position.x, v23.Position.y * -1);
        return Enum.ContextActionResult.Sink;
    else
        v11 = Vector2.new();
        return Enum.ContextActionResult.Pass;
    end;
end;
l_UserInputService_0.InputBegan:Connect(function(v25) --[[ Line: 49 ]]
    -- upvalues: v12 (ref), l_GuiService_0 (copy), v7 (copy)
    if not v12 then
        return;
    else
        if v25.UserInputType == Enum.UserInputType.Gamepad1 and v25.KeyCode == Enum.KeyCode.ButtonA and (l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject) then
            v7:PlayCursorTweenActivate();
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v26) --[[ Line: 60 ]]
    -- upvalues: v12 (ref), v7 (copy)
    if not v12 then
        return;
    else
        if v26.UserInputType == Enum.UserInputType.Gamepad1 and v26.KeyCode == Enum.KeyCode.ButtonA then
            v7:PlayCursorTweenDefault();
        end;
        return;
    end;
end);
v9.GetThumbstickVector = function(_) --[[ Line: 69 ]] --[[ Name: GetThumbstickVector ]]
    -- upvalues: v10 (ref)
    return v10;
end;
v9.GetThumbstick2Vector = function(_) --[[ Line: 73 ]] --[[ Name: GetThumbstick2Vector ]]
    -- upvalues: v11 (ref)
    return v11;
end;
v9.EnableInput = function(_) --[[ Line: 77 ]] --[[ Name: EnableInput ]]
    -- upvalues: v13 (ref), l_GamepadService_0 (copy), v10 (ref), v20 (copy), l_ContextActionService_0 (copy), v24 (copy), v12 (ref)
    v13 = l_GamepadService_0.GamepadThumbstick1Changed:Connect(function(v30) --[[ Line: 78 ]]
        -- upvalues: v10 (ref), v20 (ref)
        v10 = v20(v30);
    end);
    l_ContextActionService_0:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) --[[ Line: 82 ]]

    end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1);
    l_ContextActionService_0:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", v24, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2);
    v12 = true;
end;
v9.DisableInput = function(_) --[[ Line: 90 ]] --[[ Name: DisableInput ]]
    -- upvalues: v13 (ref), v8 (copy), v10 (ref), v11 (ref), l_ContextActionService_0 (copy), v12 (ref)
    v13:Disconnect();
    v13 = nil;
    if v8 then
        v10 = Vector2.new();
        v11 = Vector2.new();
    end;
    l_ContextActionService_0:UnbindCoreAction("VirtualCursorThumbstick1Movement");
    l_ContextActionService_0:UnbindCoreAction("VirtualCursorThumbstick2Movement");
    if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
        v11 = Vector2.new((nil).Position.x, (nil).Position.y * -1);
        local _ = Enum.ContextActionResult.Sink;
    else
        v11 = Vector2.new();
        local _ = Enum.ContextActionResult.Pass;
    end;
    v12 = false;
end;
return v9;