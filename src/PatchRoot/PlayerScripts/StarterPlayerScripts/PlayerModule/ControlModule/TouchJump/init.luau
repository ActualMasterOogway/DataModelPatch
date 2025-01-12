local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v3 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserUpdateTouchJump3");
local v4 = nil;
local v5 = nil;
if v3 then
    v4 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
    v5 = require(l_CommonUtils_0:WaitForChild("CharacterUtil"));
end;
local v6 = {
    HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED", 
    HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER", 
    HUMANOID = "HUMANOID", 
    JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED", 
    MENU_OPENED = "MENU_OPENED"
};
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v8 = setmetatable({}, l_BaseCharacterController_0);
v8.__index = v8;
v8.new = function() --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v8 (copy), v3 (copy), v4 (ref)
    local v9 = setmetatable(l_BaseCharacterController_0.new(), v8);
    v9.parentUIFrame = nil;
    v9.jumpButton = nil;
    if not v3 then
        v9.characterAddedConn = nil;
        v9.humanoidStateEnabledChangedConn = nil;
        v9.humanoidJumpPowerConn = nil;
        v9.humanoidParentConn = nil;
        v9.jumpPower = 0;
        v9.jumpStateEnabled = true;
        v9.humanoid = nil;
    end;
    v9.externallyEnabled = false;
    v9.isJumping = false;
    if v3 then
        v9._active = false;
        v9._connectionUtil = v4.new();
    end;
    return v9;
end;
if v3 then
    v8._reset = function(v10) --[[ Line: 83 ]] --[[ Name: _reset ]]
        v10.isJumping = false;
        v10.touchObject = nil;
        if v10.jumpButton then
            v10.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
    end;
end;
v8.EnableButton = function(v11, v12) --[[ Line: 94 ]] --[[ Name: EnableButton ]]
    -- upvalues: v3 (copy), v6 (copy), l_GuiService_0 (copy), l_Players_0 (copy)
    if v3 then
        if v12 == v11._active then
            v11:_reset();
            return;
        else
            if v12 then
                if not v11.jumpButton then
                    v11:Create();
                end;
                v11.jumpButton.Visible = true;
                v11._connectionUtil:trackConnection(v6.JUMP_INPUT_ENDED, v11.jumpButton.InputEnded:Connect(function(v13) --[[ Line: 111 ]]
                    -- upvalues: v11 (copy)
                    if v13 == v11.touchObject then
                        v11:_reset();
                    end;
                end));
                v11._connectionUtil:trackConnection(v6.MENU_OPENED, l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 121 ]]
                    -- upvalues: v11 (copy)
                    if v11.touchObject then
                        v11:_reset();
                    end;
                end));
            else
                if v11.jumpButton then
                    v11.jumpButton.Visible = false;
                end;
                v11._connectionUtil:disconnect(v6.JUMP_INPUT_ENDED);
                v11._connectionUtil:disconnect(v6.MENU_OPENED);
            end;
            v11:_reset();
            v11._active = v12;
            return;
        end;
    else
        if v12 then
            if not v11.jumpButton then
                v11:Create();
            end;
            local v14 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
            if v14 and v11.externallyEnabled and v11.externallyEnabled and v14.JumpPower > 0 then
                v11.jumpButton.Visible = true;
                return;
            end;
        else
            v11.jumpButton.Visible = false;
            v11.touchObject = nil;
            v11.isJumping = false;
            v11.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
        return;
    end;
end;
v8.UpdateEnabled = function(v15) --[[ Line: 158 ]] --[[ Name: UpdateEnabled ]]
    -- upvalues: v3 (copy), v5 (ref)
    if v3 then
        local v16 = v5.getChild("Humanoid", "Humanoid");
        if v16 and v15.externallyEnabled and v16.JumpPower > 0 and v16:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
            v15:EnableButton(true);
            return;
        else
            v15:EnableButton(false);
            return;
        end;
    elseif v15.jumpPower > 0 and v15.jumpStateEnabled then
        v15:EnableButton(true);
        return;
    else
        v15:EnableButton(false);
        return;
    end;
end;
if v3 then
    v8._setupConfigurations = function(v17) --[[ Line: 176 ]] --[[ Name: _setupConfigurations ]]
        -- upvalues: v5 (ref), v6 (copy)
        local function v18() --[[ Line: 177 ]] --[[ Name: update ]]
            -- upvalues: v17 (copy)
            v17:UpdateEnabled();
        end;
        local v22 = v5.onChild("Humanoid", "Humanoid", function(v19) --[[ Line: 182 ]]
            -- upvalues: v17 (copy), v6 (ref), v18 (copy)
            v17:UpdateEnabled();
            v17._connectionUtil:trackConnection(v6.HUMANOID_JUMP_POWER, v19:GetPropertyChangedSignal("JumpPower"):Connect(v18));
            v17._connectionUtil:trackConnection(v6.HUMANOID_STATE_ENABLED_CHANGED, v19.StateEnabledChanged:Connect(function(v20, v21) --[[ Line: 190 ]]
                -- upvalues: v17 (ref)
                if v20 == Enum.HumanoidStateType.Jumping and v21 ~= v17._active then
                    v17:UpdateEnabled();
                end;
            end));
        end);
        v17._connectionUtil:trackConnection(v6.HUMANOID, v22);
    end;
end;
if not v3 then
    v8.HumanoidChanged = function(v23, v24) --[[ Line: 204 ]] --[[ Name: HumanoidChanged ]]
        -- upvalues: l_Players_0 (copy)
        local v25 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
        if v25 then
            if v24 == "JumpPower" then
                v23.jumpPower = v25.JumpPower;
                v23:UpdateEnabled();
                return;
            elseif v24 == "Parent" and not v25.Parent then
                v23.humanoidChangeConn:Disconnect();
            end;
        end;
    end;
    v8.HumanoidStateEnabledChanged = function(v26, v27, v28) --[[ Line: 219 ]] --[[ Name: HumanoidStateEnabledChanged ]]
        if v27 == Enum.HumanoidStateType.Jumping then
            v26.jumpStateEnabled = v28;
            v26:UpdateEnabled();
        end;
    end;
    v8.CharacterAdded = function(v29, v30) --[[ Line: 226 ]] --[[ Name: CharacterAdded ]]
        if v29.humanoidChangeConn then
            v29.humanoidChangeConn:Disconnect();
            v29.humanoidChangeConn = nil;
        end;
        v29.humanoid = v30:FindFirstChildOfClass("Humanoid");
        while not v29.humanoid do
            v30.ChildAdded:wait();
            v29.humanoid = v30:FindFirstChildOfClass("Humanoid");
        end;
        v29.humanoidJumpPowerConn = v29.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 238 ]]
            -- upvalues: v29 (copy)
            v29.jumpPower = v29.humanoid.JumpPower;
            v29:UpdateEnabled();
        end);
        v29.humanoidParentConn = v29.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 243 ]]
            -- upvalues: v29 (copy)
            if not v29.humanoid.Parent then
                v29.humanoidJumpPowerConn:Disconnect();
                v29.humanoidJumpPowerConn = nil;
                v29.humanoidParentConn:Disconnect();
                v29.humanoidParentConn = nil;
            end;
        end);
        v29.humanoidStateEnabledChangedConn = v29.humanoid.StateEnabledChanged:Connect(function(v31, v32) --[[ Line: 252 ]]
            -- upvalues: v29 (copy)
            v29:HumanoidStateEnabledChanged(v31, v32);
        end);
        v29.jumpPower = v29.humanoid.JumpPower;
        v29.jumpStateEnabled = v29.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping);
        v29:UpdateEnabled();
    end;
    v8.SetupCharacterAddedFunction = function(v33) --[[ Line: 261 ]] --[[ Name: SetupCharacterAddedFunction ]]
        -- upvalues: l_Players_0 (copy)
        v33.characterAddedConn = l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v34) --[[ Line: 262 ]]
            -- upvalues: v33 (copy)
            v33:CharacterAdded(v34);
        end);
        if l_Players_0.LocalPlayer.Character then
            v33:CharacterAdded(l_Players_0.LocalPlayer.Character);
        end;
    end;
end;
v8.Enable = function(v35, v36, v37) --[[ Line: 271 ]] --[[ Name: Enable ]]
    -- upvalues: v3 (copy)
    if v37 then
        v35.parentUIFrame = v37;
    end;
    v35.externallyEnabled = v36;
    if v3 then
        v35:UpdateEnabled();
        if v36 then
            v35:_setupConfigurations();
            return;
        else
            v35._connectionUtil:disconnectAll();
            return;
        end;
    else
        v35:EnableButton(v36);
        return;
    end;
end;
v8.Create = function(v38) --[[ Line: 289 ]] --[[ Name: Create ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy)
    if not v38.parentUIFrame then
        return;
    else
        if v38.jumpButton then
            v38.jumpButton:Destroy();
            v38.jumpButton = nil;
        end;
        if v38.absoluteSizeChangedConn then
            v38.absoluteSizeChangedConn:Disconnect();
            v38.absoluteSizeChangedConn = nil;
        end;
        v38.jumpButton = Instance.new("ImageButton");
        v38.jumpButton.Name = "JumpButton";
        v38.jumpButton.Visible = false;
        v38.jumpButton.BackgroundTransparency = 1;
        v38.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v38.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        v38.jumpButton.ImageRectSize = Vector2.new(144, 144);
        local function v41() --[[ Line: 312 ]] --[[ Name: ResizeJumpButton ]]
            -- upvalues: v38 (copy)
            local v39 = math.min(v38.parentUIFrame.AbsoluteSize.x, v38.parentUIFrame.AbsoluteSize.y) <= 500;
            local v40 = v39 and 70 or 120;
            v38.jumpButton.Size = UDim2.new(0, v40, 0, v40);
            v38.jumpButton.Position = v39 and UDim2.new(1, -(v40 * 1.5 - 10), 1, -v40 - 20) or UDim2.new(1, -(v40 * 1.5 - 10), 1, -v40 * 1.75);
        end;
        v41();
        v38.absoluteSizeChangedConn = v38.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v41);
        v38.touchObject = nil;
        v38.jumpButton.InputBegan:connect(function(v42) --[[ Line: 326 ]]
            -- upvalues: v38 (copy)
            if v38.touchObject or v42.UserInputType ~= Enum.UserInputType.Touch or v42.UserInputState ~= Enum.UserInputState.Begin then
                return;
            else
                v38.touchObject = v42;
                v38.jumpButton.ImageRectOffset = Vector2.new(146, 146);
                v38.isJumping = true;
                return;
            end;
        end);
        if not v3 then
            local function _() --[[ Line: 340 ]]
                -- upvalues: v38 (copy)
                v38.touchObject = nil;
                v38.isJumping = false;
                v38.jumpButton.ImageRectOffset = Vector2.new(1, 146);
            end;
            v38.jumpButton.InputEnded:connect(function(v44) --[[ Line: 346 ]]
                -- upvalues: v38 (copy)
                if v44 == v38.touchObject then
                    v38.touchObject = nil;
                    v38.isJumping = false;
                    v38.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            l_GuiService_0.MenuOpened:connect(function() --[[ Line: 352 ]]
                -- upvalues: v38 (copy)
                if v38.touchObject then
                    v38.touchObject = nil;
                    v38.isJumping = false;
                    v38.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            if not v38.characterAddedConn then
                v38:SetupCharacterAddedFunction();
            end;
        end;
        v38.jumpButton.Parent = v38.parentUIFrame;
        return;
    end;
end;
return v8;