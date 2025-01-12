local l_Parent_0 = script.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Input_0 = require(l_Parent_0:WaitForChild("Input"));
local l_Interface_0 = require(l_Parent_0:WaitForChild("Interface"));
local l_OnRenderStep_0 = require(l_Parent_0:WaitForChild("OnRenderStep"));
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = false;
local function v14(v13) --[[ Line: 31 ]] --[[ Name: enableVirtualCursor ]]
    -- upvalues: v9 (ref), l_Interface_0 (copy), l_GamepadService_0 (copy), l_Input_0 (copy), l_RunService_0 (copy), v11 (ref), l_GuiService_0 (copy)
    if not v9 then
        return;
    else
        v13 = v13 or v9.CursorPosition;
        v9.Enabled = true;
        v9.CursorPosition = v13;
        l_Interface_0:EnableUI(v13);
        l_GamepadService_0:SetGamepadCursorPosition(v13);
        l_Input_0:EnableInput();
        l_RunService_0:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, v9.OnRenderStep);
        v11 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 44 ]]
            -- upvalues: l_GamepadService_0 (ref)
            l_GamepadService_0.GamepadCursorEnabled = false;
        end);
        return;
    end;
end;
local function v15() --[[ Line: 49 ]] --[[ Name: disableVirtualCursor ]]
    -- upvalues: v9 (ref), v11 (ref), l_Interface_0 (copy), l_Input_0 (copy), l_RunService_0 (copy), l_GuiService_0 (copy)
    if not v9.Enabled then
        return;
    else
        v11:Disconnect();
        v11 = nil;
        v9.PreviouslySelectedObject = nil;
        l_Interface_0:DisableUI();
        l_Input_0:DisableInput();
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        if v9.SelectedObject then
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
            v9.SelectedObject = nil;
        end;
        v9.Enabled = false;
        return;
    end;
end;
local v16 = {};
v16.__index = v16;
v16.GetEnabled = function(v17) --[[ Line: 77 ]] --[[ Name: GetEnabled ]]
    return v17.Enabled;
end;
v16.new = function() --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: l_OnRenderStep_0 (copy), v10 (ref), l_UserInputService_0 (copy), l_GamepadService_0 (copy), v12 (ref), v16 (copy), v9 (ref)
    local v18 = {
        Enabled = false, 
        CursorPosition = Vector2.new(), 
        SelectedObject = nil, 
        PreviouslySelectedObject = nil
    };
    v18.OnRenderStep = function(v19) --[[ Line: 89 ]]
        -- upvalues: l_OnRenderStep_0 (ref), v18 (copy)
        l_OnRenderStep_0(v18, v19);
    end;
    v10 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v20) --[[ Line: 93 ]]
        -- upvalues: l_GamepadService_0 (ref), v12 (ref)
        if v20 ~= Enum.UserInputType.Gamepad1 and v20 ~= Enum.UserInputType.Focus and l_GamepadService_0.GamepadCursorEnabled then
            l_GamepadService_0.GamepadCursorEnabled = false;
            v12 = true;
            return;
        else
            if v20 == Enum.UserInputType.Gamepad1 and v12 then
                l_GamepadService_0.GamepadCursorEnabled = true;
                v12 = false;
            end;
            return;
        end;
    end);
    setmetatable(v18, v16);
    v9 = v18;
    return v18;
end;
l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 110 ]]
    -- upvalues: l_GamepadService_0 (copy), v9 (ref), l_UserInputService_0 (copy), v14 (copy), v15 (copy)
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if v9 then
        if l_GamepadCursorEnabled_0 then
            local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
            v14(l_l_UserInputService_0_MouseLocation_0);
            return;
        else
            v15();
        end;
    end;
end);
return v16.new();