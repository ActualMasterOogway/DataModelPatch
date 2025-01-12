local l_Value_0 = Enum.ContextActionPriority.High.Value;
local v1 = {
    0.10999999999999999, 
    0.30000000000000004, 
    0.4, 
    0.5, 
    0.6, 
    0.7, 
    0.75
};
local v2 = #v1;
local v3 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v10 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickMoveOverButtons2");
end);
v10 = l_status_0 and l_result_0;
l_status_0 = nil;
local v13;
l_result_0, v13 = pcall(function() --[[ Line: 44 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
l_status_0 = l_result_0 and v13;
l_result_0 = l_Players_0.LocalPlayer;
if not l_result_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_result_0 = l_Players_0.LocalPlayer;
end;
v13 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v14 = setmetatable({}, v13);
v14.__index = v14;
v14.new = function() --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v14 (copy)
    local v15 = setmetatable(v13.new(), v14);
    v15.moveTouchObject = nil;
    v15.moveTouchLockedIn = false;
    v15.moveTouchFirstChanged = false;
    v15.moveTouchStartPosition = nil;
    v15.startImage = nil;
    v15.endImage = nil;
    v15.middleImages = {};
    v15.startImageFadeTween = nil;
    v15.endImageFadeTween = nil;
    v15.middleImageFadeTweens = {};
    v15.isFirstTouch = true;
    v15.thumbstickFrame = nil;
    v15.onRenderSteppedConn = nil;
    v15.fadeInAndOutBalance = 0.5;
    v15.fadeInAndOutHalfDuration = 0.3;
    v15.hasFadedBackgroundInPortrait = false;
    v15.hasFadedBackgroundInLandscape = false;
    v15.tweenInAlphaStart = nil;
    v15.tweenOutAlphaStart = nil;
    return v15;
end;
v14.GetIsJumping = function(v16) --[[ Line: 96 ]] --[[ Name: GetIsJumping ]]
    local l_isJumping_0 = v16.isJumping;
    v16.isJumping = false;
    return l_isJumping_0;
end;
v14.Enable = function(v18, v19, v20) --[[ Line: 102 ]] --[[ Name: Enable ]]
    -- upvalues: v10 (ref), l_ContextActionService_0 (copy)
    if v19 == nil then
        return false;
    else
        v19 = v19 and true or false;
        if v18.enabled == v19 then
            return true;
        else
            if v19 then
                if not v18.thumbstickFrame then
                    v18:Create(v20);
                end;
                v18:BindContextActions();
            else
                if v10 then
                    v18:UnbindContextActions();
                else
                    l_ContextActionService_0:UnbindAction("DynamicThumbstickAction");
                end;
                v18:OnInputEnded();
            end;
            v18.enabled = v19;
            v18.thumbstickFrame.Visible = v19;
            return nil;
        end;
    end;
end;
v14.OnInputEnded = function(v21) --[[ Line: 131 ]] --[[ Name: OnInputEnded ]]
    v21.moveTouchObject = nil;
    v21.moveVector = Vector3.new(0, 0, 0, 0);
    v21:FadeThumbstick(false);
end;
v14.FadeThumbstick = function(v22, v23) --[[ Line: 137 ]] --[[ Name: FadeThumbstick ]]
    -- upvalues: l_TweenService_0 (copy), v3 (copy), v1 (copy)
    if not v23 and v22.moveTouchObject then
        return;
    elseif v22.isFirstTouch then
        return;
    else
        if v22.startImageFadeTween then
            v22.startImageFadeTween:Cancel();
        end;
        if v22.endImageFadeTween then
            v22.endImageFadeTween:Cancel();
        end;
        for v24 = 1, #v22.middleImages do
            if v22.middleImageFadeTweens[v24] then
                v22.middleImageFadeTweens[v24]:Cancel();
            end;
        end;
        if v23 then
            v22.startImageFadeTween = l_TweenService_0:Create(v22.startImage, v3, {
                ImageTransparency = 0
            });
            v22.startImageFadeTween:Play();
            v22.endImageFadeTween = l_TweenService_0:Create(v22.endImage, v3, {
                ImageTransparency = 0.2
            });
            v22.endImageFadeTween:Play();
            for v25 = 1, #v22.middleImages do
                v22.middleImageFadeTweens[v25] = l_TweenService_0:Create(v22.middleImages[v25], v3, {
                    ImageTransparency = v1[v25]
                });
                v22.middleImageFadeTweens[v25]:Play();
            end;
            return;
        else
            v22.startImageFadeTween = l_TweenService_0:Create(v22.startImage, v3, {
                ImageTransparency = 1
            });
            v22.startImageFadeTween:Play();
            v22.endImageFadeTween = l_TweenService_0:Create(v22.endImage, v3, {
                ImageTransparency = 1
            });
            v22.endImageFadeTween:Play();
            for v26 = 1, #v22.middleImages do
                v22.middleImageFadeTweens[v26] = l_TweenService_0:Create(v22.middleImages[v26], v3, {
                    ImageTransparency = 1
                });
                v22.middleImageFadeTweens[v26]:Play();
            end;
            return;
        end;
    end;
end;
v14.FadeThumbstickFrame = function(v27, v28, v29) --[[ Line: 180 ]] --[[ Name: FadeThumbstickFrame ]]
    v27.fadeInAndOutHalfDuration = v28 * 0.5;
    v27.fadeInAndOutBalance = v29;
    v27.tweenInAlphaStart = tick();
end;
v14.InputInFrame = function(v30, v31) --[[ Line: 186 ]] --[[ Name: InputInFrame ]]
    local l_AbsolutePosition_0 = v30.thumbstickFrame.AbsolutePosition;
    local v33 = l_AbsolutePosition_0 + v30.thumbstickFrame.AbsoluteSize;
    local l_Position_0 = v31.Position;
    if l_Position_0.X >= l_AbsolutePosition_0.X and l_Position_0.Y >= l_AbsolutePosition_0.Y and l_Position_0.X <= v33.X and l_Position_0.Y <= v33.Y then
        return true;
    else
        return false;
    end;
end;
v14.DoFadeInBackground = function(v35) --[[ Line: 198 ]] --[[ Name: DoFadeInBackground ]]
    -- upvalues: l_result_0 (ref)
    local l_PlayerGui_0 = l_result_0:FindFirstChildOfClass("PlayerGui");
    local v37 = false;
    if l_PlayerGui_0 then
        if l_PlayerGui_0.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or l_PlayerGui_0.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight then
            v37 = v35.hasFadedBackgroundInLandscape;
            v35.hasFadedBackgroundInLandscape = true;
        elseif l_PlayerGui_0.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait then
            v37 = v35.hasFadedBackgroundInPortrait;
            v35.hasFadedBackgroundInPortrait = true;
        end;
    end;
    if not v37 then
        v35.fadeInAndOutHalfDuration = 0.3;
        v35.fadeInAndOutBalance = 0.5;
        v35.tweenInAlphaStart = tick();
    end;
end;
v14.DoMove = function(v38, v39) --[[ Line: 221 ]] --[[ Name: DoMove ]]
    local l_v39_0 = v39;
    if l_v39_0.Magnitude < v38.radiusOfDeadZone then
        l_v39_0 = Vector3.new(0, 0, 0, 0);
    else
        l_v39_0 = l_v39_0.Unit * (1 - math.max(0, (v38.radiusOfMaxSpeed - l_v39_0.Magnitude) / v38.radiusOfMaxSpeed));
        l_v39_0 = Vector3.new(l_v39_0.X, 0, l_v39_0.Y);
    end;
    v38.moveVector = l_v39_0;
end;
v14.LayoutMiddleImages = function(v41, v42, v43) --[[ Line: 239 ]] --[[ Name: LayoutMiddleImages ]]
    -- upvalues: v2 (copy)
    local v44 = v41.thumbstickSize / 2 + v41.middleSize;
    local v45 = v43 - v42;
    local v46 = v45.Magnitude - v41.thumbstickRingSize / 2 - v41.middleSize;
    local l_Unit_0 = v45.Unit;
    local v48 = v41.middleSpacing * v2;
    local l_middleSpacing_0 = v41.middleSpacing;
    if v48 < v46 then
        l_middleSpacing_0 = v46 / v2;
    end;
    for v50 = 1, v2 do
        local v51 = v41.middleImages[v50];
        local v52 = v44 + l_middleSpacing_0 * (v50 - 2);
        local v53 = v44 + l_middleSpacing_0 * (v50 - 1);
        if v52 < v46 then
            local v54 = v43 - l_Unit_0 * v53;
            local v55 = math.clamp(1 - (v53 - v46) / l_middleSpacing_0, 0, 1);
            v51.Visible = true;
            v51.Position = UDim2.new(0, v54.X, 0, v54.Y);
            v51.Size = UDim2.new(0, v41.middleSize * v55, 0, v41.middleSize * v55);
        else
            v51.Visible = false;
        end;
    end;
end;
v14.MoveStick = function(v56, v57) --[[ Line: 270 ]] --[[ Name: MoveStick ]]
    local v58 = Vector2.new(v56.moveTouchStartPosition.X, v56.moveTouchStartPosition.Y) - v56.thumbstickFrame.AbsolutePosition;
    local v59 = Vector2.new(v57.X, v57.Y) - v56.thumbstickFrame.AbsolutePosition;
    v56.endImage.Position = UDim2.new(0, v59.X, 0, v59.Y);
    v56:LayoutMiddleImages(v58, v59);
end;
v14.BindContextActions = function(v60) --[[ Line: 278 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_TweenService_0 (copy), v10 (ref), l_ContextActionService_0 (copy), l_Value_0 (copy), l_UserInputService_0 (copy)
    local function v63(v61) --[[ Line: 279 ]] --[[ Name: inputBegan ]]
        -- upvalues: v60 (copy), l_TweenService_0 (ref)
        if v60.moveTouchObject then
            return Enum.ContextActionResult.Pass;
        elseif not v60:InputInFrame(v61) then
            return Enum.ContextActionResult.Pass;
        else
            if v60.isFirstTouch then
                v60.isFirstTouch = false;
                local v62 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                l_TweenService_0:Create(v60.startImage, v62, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                l_TweenService_0:Create(v60.endImage, v62, {
                    Size = UDim2.new(0, v60.thumbstickSize, 0, v60.thumbstickSize), 
                    ImageColor3 = Color3.new(0, 0, 0)
                }):Play();
            end;
            v60.moveTouchLockedIn = false;
            v60.moveTouchObject = v61;
            v60.moveTouchStartPosition = v61.Position;
            v60.moveTouchFirstChanged = true;
            v60:DoFadeInBackground();
            return Enum.ContextActionResult.Pass;
        end;
    end;
    local function v67(v64) --[[ Line: 311 ]] --[[ Name: inputChanged ]]
        -- upvalues: v60 (copy)
        if v64 == v60.moveTouchObject then
            if v60.moveTouchFirstChanged then
                v60.moveTouchFirstChanged = false;
                local v65 = Vector2.new(v64.Position.X - v60.thumbstickFrame.AbsolutePosition.X, v64.Position.Y - v60.thumbstickFrame.AbsolutePosition.Y);
                v60.startImage.Visible = true;
                v60.startImage.Position = UDim2.new(0, v65.X, 0, v65.Y);
                v60.endImage.Visible = true;
                v60.endImage.Position = v60.startImage.Position;
                v60:FadeThumbstick(true);
                v60:MoveStick(v64.Position);
            end;
            v60.moveTouchLockedIn = true;
            local v66 = Vector2.new(v64.Position.X - v60.moveTouchStartPosition.X, v64.Position.Y - v60.moveTouchStartPosition.Y);
            if math.abs(v66.X) > 0 or math.abs(v66.Y) > 0 then
                v60:DoMove(v66);
                v60:MoveStick(v64.Position);
            end;
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end;
    local function _(v68) --[[ Line: 344 ]] --[[ Name: inputEnded ]]
        -- upvalues: v60 (copy)
        if v68 == v60.moveTouchObject then
            v60:OnInputEnded();
            if v60.moveTouchLockedIn then
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end;
    l_ContextActionService_0:BindActionAtPriority("DynamicThumbstickAction", function(_, v71, v72) --[[ Line: 354 ]] --[[ Name: handleInput ]]
        -- upvalues: v63 (copy), v10 (ref), v60 (copy), v67 (copy)
        if v71 == Enum.UserInputState.Begin then
            return (v63(v72));
        elseif v71 == Enum.UserInputState.Change then
            if v10 then
                if v72 == v60.moveTouchObject then
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            else
                return (v67(v72));
            end;
        elseif v71 == Enum.UserInputState.End then
            if v72 == v60.moveTouchObject then
                v60:OnInputEnded();
                if v60.moveTouchLockedIn then
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        else
            if v71 == Enum.UserInputState.Cancel then
                v60:OnInputEnded();
            end;
            return;
        end;
    end, false, l_Value_0, Enum.UserInputType.Touch);
    if v10 then
        v60.TouchMovedCon = l_UserInputService_0.TouchMoved:Connect(function(v73, _) --[[ Line: 382 ]]
            -- upvalues: v67 (copy)
            v67(v73);
        end);
    end;
end;
v14.UnbindContextActions = function(v75) --[[ Line: 388 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("DynamicThumbstickAction");
    if v75.TouchMovedCon then
        v75.TouchMovedCon:Disconnect();
    end;
end;
v14.Create = function(v76, v77) --[[ Line: 396 ]] --[[ Name: Create ]]
    -- upvalues: l_status_0 (ref), v2 (copy), v1 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_result_0 (ref)
    if v76.thumbstickFrame then
        v76.thumbstickFrame:Destroy();
        v76.thumbstickFrame = nil;
        if v76.onRenderSteppedConn then
            v76.onRenderSteppedConn:Disconnect();
            v76.onRenderSteppedConn = nil;
        end;
        if v76.absoluteSizeChangedConn then
            v76.absoluteSizeChangedConn:Disconnect();
            v76.absoluteSizeChangedConn = nil;
        end;
    end;
    local v78 = l_status_0 and 100 or 0;
    local function v80(v79) --[[ Line: 411 ]] --[[ Name: layoutThumbstickFrame ]]
        -- upvalues: v76 (copy), v78 (copy)
        if v79 then
            v76.thumbstickFrame.Size = UDim2.new(1, v78, 0.4, v78);
            v76.thumbstickFrame.Position = UDim2.new(0, -v78, 0.6, 0);
            return;
        else
            v76.thumbstickFrame.Size = UDim2.new(0.4, v78, 0.6666666666666666, v78);
            v76.thumbstickFrame.Position = UDim2.new(0, -v78, 0.3333333333333333, 0);
            return;
        end;
    end;
    v76.thumbstickFrame = Instance.new("Frame");
    v76.thumbstickFrame.BorderSizePixel = 0;
    v76.thumbstickFrame.Name = "DynamicThumbstickFrame";
    v76.thumbstickFrame.Visible = false;
    v76.thumbstickFrame.BackgroundTransparency = 1;
    v76.thumbstickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    v76.thumbstickFrame.Active = false;
    v80(false);
    v76.startImage = Instance.new("ImageLabel");
    v76.startImage.Name = "ThumbstickStart";
    v76.startImage.Visible = true;
    v76.startImage.BackgroundTransparency = 1;
    v76.startImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
    v76.startImage.ImageRectOffset = Vector2.new(1, 1);
    v76.startImage.ImageRectSize = Vector2.new(144, 144);
    v76.startImage.ImageColor3 = Color3.new(0, 0, 0);
    v76.startImage.AnchorPoint = Vector2.new(0.5, 0.5);
    v76.startImage.ZIndex = 10;
    v76.startImage.Parent = v76.thumbstickFrame;
    v76.endImage = Instance.new("ImageLabel");
    v76.endImage.Name = "ThumbstickEnd";
    v76.endImage.Visible = true;
    v76.endImage.BackgroundTransparency = 1;
    v76.endImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
    v76.endImage.ImageRectOffset = Vector2.new(1, 1);
    v76.endImage.ImageRectSize = Vector2.new(144, 144);
    v76.endImage.AnchorPoint = Vector2.new(0.5, 0.5);
    v76.endImage.ZIndex = 10;
    v76.endImage.Parent = v76.thumbstickFrame;
    for v81 = 1, v2 do
        v76.middleImages[v81] = Instance.new("ImageLabel");
        v76.middleImages[v81].Name = "ThumbstickMiddle";
        v76.middleImages[v81].Visible = false;
        v76.middleImages[v81].BackgroundTransparency = 1;
        v76.middleImages[v81].Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v76.middleImages[v81].ImageRectOffset = Vector2.new(1, 1);
        v76.middleImages[v81].ImageRectSize = Vector2.new(144, 144);
        v76.middleImages[v81].ImageTransparency = v1[v81];
        v76.middleImages[v81].AnchorPoint = Vector2.new(0.5, 0.5);
        v76.middleImages[v81].ZIndex = 9;
        v76.middleImages[v81].Parent = v76.thumbstickFrame;
    end;
    local function v83() --[[ Line: 467 ]] --[[ Name: ResizeThumbstick ]]
        -- upvalues: v77 (copy), v76 (copy), v78 (copy)
        local l_AbsoluteSize_0 = v77.AbsoluteSize;
        if math.min(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) > 500 then
            v76.thumbstickSize = 90;
            v76.thumbstickRingSize = 40;
            v76.middleSize = 20;
            v76.middleSpacing = 28;
            v76.radiusOfDeadZone = 4;
            v76.radiusOfMaxSpeed = 40;
        else
            v76.thumbstickSize = 45;
            v76.thumbstickRingSize = 20;
            v76.middleSize = 10;
            v76.middleSpacing = 14;
            v76.radiusOfDeadZone = 2;
            v76.radiusOfMaxSpeed = 20;
        end;
        v76.startImage.Position = UDim2.new(0, v76.thumbstickRingSize * 3.3 + v78, 1, -v76.thumbstickRingSize * 2.8 - v78);
        v76.startImage.Size = UDim2.new(0, v76.thumbstickRingSize * 3.7, 0, v76.thumbstickRingSize * 3.7);
        v76.endImage.Position = v76.startImage.Position;
        v76.endImage.Size = UDim2.new(0, v76.thumbstickSize * 0.8, 0, v76.thumbstickSize * 0.8);
    end;
    v83();
    v76.absoluteSizeChangedConn = v77:GetPropertyChangedSignal("AbsoluteSize"):Connect(v83);
    local v84 = nil;
    local function v91() --[[ Line: 505 ]] --[[ Name: onCurrentCameraChanged ]]
        -- upvalues: v84 (ref), v80 (copy)
        if v84 then
            v84:Disconnect();
            v84 = nil;
        end;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            local function v88() --[[ Line: 512 ]] --[[ Name: onViewportSizeChanged ]]
                -- upvalues: l_CurrentCamera_0 (copy), v80 (ref)
                local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
                local v87 = l_ViewportSize_0.X < l_ViewportSize_0.Y;
                v80(v87);
            end;
            v84 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v88);
            local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
            local v90 = l_ViewportSize_1.X < l_ViewportSize_1.Y;
            v80(v90);
        end;
    end;
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v91);
    if workspace.CurrentCamera then
        v91();
    end;
    v76.moveTouchStartPosition = nil;
    v76.startImageFadeTween = nil;
    v76.endImageFadeTween = nil;
    v76.middleImageFadeTweens = {};
    v76.onRenderSteppedConn = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 532 ]]
        -- upvalues: v76 (copy)
        if v76.tweenInAlphaStart ~= nil then
            local v92 = tick() - v76.tweenInAlphaStart;
            local v93 = v76.fadeInAndOutHalfDuration * 2 * v76.fadeInAndOutBalance;
            v76.thumbstickFrame.BackgroundTransparency = 1 - 0.35 * math.min(v92 / v93, 1);
            if v93 < v92 then
                v76.tweenOutAlphaStart = tick();
                v76.tweenInAlphaStart = nil;
                return;
            end;
        elseif v76.tweenOutAlphaStart ~= nil then
            local v94 = tick() - v76.tweenOutAlphaStart;
            local v95 = v76.fadeInAndOutHalfDuration * 2 - v76.fadeInAndOutHalfDuration * 2 * v76.fadeInAndOutBalance;
            v76.thumbstickFrame.BackgroundTransparency = 0.65 + 0.35 * math.min(v94 / v95, 1);
            if v95 < v94 then
                v76.tweenOutAlphaStart = nil;
            end;
        end;
    end);
    v76.onTouchEndedConn = l_UserInputService_0.TouchEnded:connect(function(v96) --[[ Line: 551 ]]
        -- upvalues: v76 (copy)
        if v96 == v76.moveTouchObject then
            v76:OnInputEnded();
        end;
    end);
    l_GuiService_0.MenuOpened:connect(function() --[[ Line: 557 ]]
        -- upvalues: v76 (copy)
        if v76.moveTouchObject then
            v76:OnInputEnded();
        end;
    end);
    local l_PlayerGui_1 = l_result_0:FindFirstChildOfClass("PlayerGui");
    while not l_PlayerGui_1 do
        l_result_0.ChildAdded:wait();
        l_PlayerGui_1 = l_result_0:FindFirstChildOfClass("PlayerGui");
    end;
    local v98 = nil;
    local v99 = true;
    if l_PlayerGui_1.CurrentScreenOrientation ~= Enum.ScreenOrientation.LandscapeLeft then
        v99 = l_PlayerGui_1.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight;
    end;
    local function _() --[[ Line: 573 ]] --[[ Name: longShowBackground ]]
        -- upvalues: v76 (copy)
        v76.fadeInAndOutHalfDuration = 2.5;
        v76.fadeInAndOutBalance = 0.05;
        v76.tweenInAlphaStart = tick();
    end;
    v98 = l_PlayerGui_1:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 579 ]]
        -- upvalues: v99 (copy), l_PlayerGui_1 (ref), v98 (ref), v76 (copy)
        if v99 and l_PlayerGui_1.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait or not v99 and l_PlayerGui_1.CurrentScreenOrientation ~= Enum.ScreenOrientation.Portrait then
            v98:disconnect();
            v76.fadeInAndOutHalfDuration = 2.5;
            v76.fadeInAndOutBalance = 0.05;
            v76.tweenInAlphaStart = tick();
            if v99 then
                v76.hasFadedBackgroundInPortrait = true;
                return;
            else
                v76.hasFadedBackgroundInLandscape = true;
            end;
        end;
    end);
    v76.thumbstickFrame.Parent = v77;
    if game:IsLoaded() then
        v76.fadeInAndOutHalfDuration = 2.5;
        v76.fadeInAndOutBalance = 0.05;
        v76.tweenInAlphaStart = tick();
    else
        coroutine.wrap(function() --[[ Line: 599 ]]
            -- upvalues: v76 (copy)
            game.Loaded:Wait();
            v76.fadeInAndOutHalfDuration = 2.5;
            v76.fadeInAndOutBalance = 0.05;
            v76.tweenInAlphaStart = tick();
        end)();
    end;
end;
return v14;