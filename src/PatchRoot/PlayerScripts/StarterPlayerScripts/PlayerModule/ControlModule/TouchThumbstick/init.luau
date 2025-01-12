local _ = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = UserSettings():GetService("UserGameSettings");
local v4 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
    return UserSettings():IsUserFeatureEnabled("UserClampClassicThumbstick");
end);
v4 = l_status_0 and l_result_0;
l_status_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
l_result_0 = setmetatable({}, l_status_0);
l_result_0.__index = l_result_0;
l_result_0.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: l_status_0 (copy), l_result_0 (copy)
    local v7 = setmetatable(l_status_0.new(), l_result_0);
    v7.isFollowStick = false;
    v7.thumbstickFrame = nil;
    v7.moveTouchObject = nil;
    v7.onTouchMovedConn = nil;
    v7.onTouchEndedConn = nil;
    v7.screenPos = nil;
    v7.stickImage = nil;
    v7.thumbstickSize = nil;
    return v7;
end;
l_result_0.Enable = function(v8, v9, v10) --[[ Line: 41 ]] --[[ Name: Enable ]]
    if v9 == nil then
        return false;
    else
        v9 = v9 and true or false;
        if v8.enabled == v9 then
            return true;
        else
            v8.moveVector = Vector3.new(0, 0, 0, 0);
            v8.isJumping = false;
            if v9 then
                if not v8.thumbstickFrame then
                    v8:Create(v10);
                end;
                v8.thumbstickFrame.Visible = true;
            else
                v8.thumbstickFrame.Visible = false;
                v8:OnInputEnded();
            end;
            v8.enabled = v9;
            return;
        end;
    end;
end;
l_result_0.OnInputEnded = function(v11) --[[ Line: 62 ]] --[[ Name: OnInputEnded ]]
    v11.thumbstickFrame.Position = v11.screenPos;
    v11.stickImage.Position = UDim2.new(0, v11.thumbstickFrame.Size.X.Offset / 2 - v11.thumbstickSize / 4, 0, v11.thumbstickFrame.Size.Y.Offset / 2 - v11.thumbstickSize / 4);
    v11.moveVector = Vector3.new(0, 0, 0, 0);
    v11.isJumping = false;
    v11.thumbstickFrame.Position = v11.screenPos;
    v11.moveTouchObject = nil;
end;
l_result_0.Create = function(v12, v13) --[[ Line: 71 ]] --[[ Name: Create ]]
    -- upvalues: v4 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v12.thumbstickFrame then
        v12.thumbstickFrame:Destroy();
        v12.thumbstickFrame = nil;
        if v12.onTouchMovedConn then
            v12.onTouchMovedConn:Disconnect();
            v12.onTouchMovedConn = nil;
        end;
        if v12.onTouchEndedConn then
            v12.onTouchEndedConn:Disconnect();
            v12.onTouchEndedConn = nil;
        end;
        if v12.absoluteSizeChangedConn then
            v12.absoluteSizeChangedConn:Disconnect();
            v12.absoluteSizeChangedConn = nil;
        end;
    end;
    v12.thumbstickFrame = Instance.new("Frame");
    v12.thumbstickFrame.Name = "ThumbstickFrame";
    v12.thumbstickFrame.Active = true;
    v12.thumbstickFrame.Visible = false;
    v12.thumbstickFrame.BackgroundTransparency = 1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "OuterImage";
    l_ImageLabel_0.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    l_ImageLabel_0.ImageRectOffset = Vector2.new();
    l_ImageLabel_0.ImageRectSize = Vector2.new(220, 220);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    v12.stickImage = Instance.new("ImageLabel");
    v12.stickImage.Name = "StickImage";
    v12.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    v12.stickImage.ImageRectOffset = Vector2.new(220, 0);
    v12.stickImage.ImageRectSize = Vector2.new(111, 111);
    v12.stickImage.BackgroundTransparency = 1;
    v12.stickImage.ZIndex = 2;
    local function v16() --[[ Line: 111 ]] --[[ Name: ResizeThumbstick ]]
        -- upvalues: v13 (copy), v12 (copy), l_ImageLabel_0 (copy)
        local v15 = math.min(v13.AbsoluteSize.X, v13.AbsoluteSize.Y) <= 500;
        v12.thumbstickSize = v15 and 70 or 120;
        v12.screenPos = v15 and UDim2.new(0, v12.thumbstickSize / 2 - 10, 1, -v12.thumbstickSize - 20) or UDim2.new(0, v12.thumbstickSize / 2, 1, -v12.thumbstickSize * 1.75);
        v12.thumbstickFrame.Size = UDim2.new(0, v12.thumbstickSize, 0, v12.thumbstickSize);
        v12.thumbstickFrame.Position = v12.screenPos;
        l_ImageLabel_0.Size = UDim2.new(0, v12.thumbstickSize, 0, v12.thumbstickSize);
        v12.stickImage.Size = UDim2.new(0, v12.thumbstickSize / 2, 0, v12.thumbstickSize / 2);
        v12.stickImage.Position = UDim2.new(0, v12.thumbstickSize / 2 - v12.thumbstickSize / 4, 0, v12.thumbstickSize / 2 - v12.thumbstickSize / 4);
    end;
    v16();
    v12.absoluteSizeChangedConn = v13:GetPropertyChangedSignal("AbsoluteSize"):Connect(v16);
    l_ImageLabel_0.Parent = v12.thumbstickFrame;
    v12.stickImage.Parent = v12.thumbstickFrame;
    local v17 = nil;
    local function v21(v18) --[[ Line: 133 ]] --[[ Name: DoMove ]]
        -- upvalues: v12 (copy), v4 (ref)
        local v19 = v18 / (v12.thumbstickSize / 2);
        local l_magnitude_0 = v19.magnitude;
        if l_magnitude_0 < 0.05 then
            v19 = Vector3.new();
        else
            v19 = if v4 then v19.unit * math.min(1, (l_magnitude_0 - 0.05) / 0.95) else v19.unit * ((l_magnitude_0 - 0.05) / 0.95);
            v19 = Vector3.new(v19.X, 0, v19.Y);
        end;
        v12.moveVector = v19;
    end;
    local function v27(v22) --[[ Line: 155 ]] --[[ Name: MoveStick ]]
        -- upvalues: v17 (ref), v12 (copy)
        local v23 = Vector2.new(v22.X - v17.X, v22.Y - v17.Y);
        local l_magnitude_1 = v23.magnitude;
        local v25 = v12.thumbstickFrame.AbsoluteSize.X / 2;
        if v12.isFollowStick and v25 < l_magnitude_1 then
            local v26 = v23.unit * v25;
            v12.thumbstickFrame.Position = UDim2.new(0, v22.X - v12.thumbstickFrame.AbsoluteSize.X / 2 - v26.X, 0, v22.Y - v12.thumbstickFrame.AbsoluteSize.Y / 2 - v26.Y);
        else
            l_magnitude_1 = math.min(l_magnitude_1, v25);
            v23 = v23.unit * l_magnitude_1;
        end;
        v12.stickImage.Position = UDim2.new(0, v23.X + v12.stickImage.AbsoluteSize.X / 2, 0, v23.Y + v12.stickImage.AbsoluteSize.Y / 2);
    end;
    v12.thumbstickFrame.InputBegan:Connect(function(v28) --[[ Line: 172 ]]
        -- upvalues: v12 (copy), v17 (ref)
        if v12.moveTouchObject or v28.UserInputType ~= Enum.UserInputType.Touch or v28.UserInputState ~= Enum.UserInputState.Begin then
            return;
        else
            v12.moveTouchObject = v28;
            v12.thumbstickFrame.Position = UDim2.new(0, v28.Position.X - v12.thumbstickFrame.Size.X.Offset / 2, 0, v28.Position.Y - v12.thumbstickFrame.Size.Y.Offset / 2);
            v17 = Vector2.new(v12.thumbstickFrame.AbsolutePosition.X + v12.thumbstickFrame.AbsoluteSize.X / 2, v12.thumbstickFrame.AbsolutePosition.Y + v12.thumbstickFrame.AbsoluteSize.Y / 2);
            local _ = Vector2.new(v28.Position.X - v17.X, v28.Position.Y - v17.Y);
            return;
        end;
    end);
    v12.onTouchMovedConn = l_UserInputService_0.TouchMoved:Connect(function(v30, _) --[[ Line: 187 ]]
        -- upvalues: v12 (copy), v17 (ref), v21 (copy), v27 (copy)
        if v30 == v12.moveTouchObject then
            v17 = Vector2.new(v12.thumbstickFrame.AbsolutePosition.X + v12.thumbstickFrame.AbsoluteSize.X / 2, v12.thumbstickFrame.AbsolutePosition.Y + v12.thumbstickFrame.AbsoluteSize.Y / 2);
            local v32 = Vector2.new(v30.Position.X - v17.X, v30.Position.Y - v17.Y);
            v21(v32);
            v27(v30.Position);
        end;
    end);
    v12.onTouchEndedConn = l_UserInputService_0.TouchEnded:Connect(function(v33, _) --[[ Line: 197 ]]
        -- upvalues: v12 (copy)
        if v33 == v12.moveTouchObject then
            v12:OnInputEnded();
        end;
    end);
    l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 203 ]]
        -- upvalues: v12 (copy)
        if v12.moveTouchObject then
            v12:OnInputEnded();
        end;
    end);
    v12.thumbstickFrame.Parent = v13;
end;
return l_result_0;