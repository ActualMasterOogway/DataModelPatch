local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v9 = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v11 = RaycastParams.new();
v11.FilterType = Enum.RaycastFilterType.Exclude;
local v12 = l_FlagUtil_0.getUserFlag("UserRaycastPerformanceImprovements");
local function _(v13) --[[ Line: 42 ]] --[[ Name: IsFinite ]]
    local v14 = false;
    if v13 == v13 then
        v14 = false;
        if v13 ~= 1e999 then
            v14 = v13 ~= -1e999;
        end;
    end;
    return v14;
end;
local function _(v16) --[[ Line: 46 ]] --[[ Name: IsFiniteVector3 ]]
    local l_x_0 = v16.x;
    local v18 = false;
    if l_x_0 == l_x_0 then
        v18 = false;
        if l_x_0 ~= 1e999 then
            v18 = l_x_0 ~= -1e999;
        end;
    end;
    if v18 then
        l_x_0 = v16.y;
        v18 = false;
        if l_x_0 == l_x_0 then
            v18 = false;
            if l_x_0 ~= 1e999 then
                v18 = l_x_0 ~= -1e999;
            end;
        end;
        if v18 then
            l_x_0 = v16.z;
            v18 = false;
            if l_x_0 == l_x_0 then
                v18 = false;
                if l_x_0 ~= 1e999 then
                    v18 = l_x_0 ~= -1e999;
                end;
            end;
        end;
    end;
    return v18;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "MovementUpdate";
l_BindableEvent_0.Parent = script;
coroutine.wrap(function() --[[ Line: 54 ]]
    -- upvalues: v9 (ref)
    local l_PathDisplay_0 = script.Parent:WaitForChild("PathDisplay");
    if l_PathDisplay_0 then
        v9 = require(l_PathDisplay_0);
    end;
end)();
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v23 = setmetatable({}, l_BaseCharacterController_0);
v23.__index = v23;
v23.new = function(v24) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v23 (copy)
    local v25 = setmetatable(l_BaseCharacterController_0.new(), v23);
    v25.CONTROL_ACTION_PRIORITY = v24;
    v25.navigationRequestedConn = nil;
    v25.heartbeatConn = nil;
    v25.currentDestination = nil;
    v25.currentPath = nil;
    v25.currentPoints = nil;
    v25.currentPointIdx = 0;
    v25.expectedTimeToNextPoint = 0;
    v25.timeReachedLastPoint = tick();
    v25.moving = false;
    v25.isJumpBound = false;
    v25.moveLatch = false;
    v25.userCFrameEnabledConn = nil;
    return v25;
end;
v23.SetLaserPointerMode = function(_, v27) --[[ Line: 92 ]] --[[ Name: SetLaserPointerMode ]]
    -- upvalues: l_StarterGui_0 (copy)
    pcall(function() --[[ Line: 93 ]]
        -- upvalues: l_StarterGui_0 (ref), v27 (copy)
        l_StarterGui_0:SetCore("VRLaserPointerMode", v27);
    end);
end;
v23.GetLocalHumanoid = function(_) --[[ Line: 98 ]] --[[ Name: GetLocalHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        for _, v31 in pairs(l_Character_0:GetChildren()) do
            if v31:IsA("Humanoid") then
                return v31;
            end;
        end;
        return nil;
    end;
end;
v23.HasBothHandControllers = function(_) --[[ Line: 112 ]] --[[ Name: HasBothHandControllers ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v23.HasAnyHandControllers = function(_) --[[ Line: 116 ]] --[[ Name: HasAnyHandControllers ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v23.IsMobileVR = function(_) --[[ Line: 120 ]] --[[ Name: IsMobileVR ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.TouchEnabled;
end;
v23.HasGamepad = function(_) --[[ Line: 124 ]] --[[ Name: HasGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.GamepadEnabled;
end;
v23.ShouldUseNavigationLaser = function(v36) --[[ Line: 128 ]] --[[ Name: ShouldUseNavigationLaser ]]
    if v36:IsMobileVR() then
        return true;
    elseif v36:HasBothHandControllers() then
        return false;
    elseif not v36:HasAnyHandControllers() then
        return not v36:HasGamepad();
    else
        return true;
    end;
end;
v23.StartFollowingPath = function(v37, v38) --[[ Line: 150 ]] --[[ Name: StartFollowingPath ]]
    -- upvalues: l_BindableEvent_0 (copy)
    currentPath = v38;
    currentPoints = currentPath:GetPointCoordinates();
    currentPointIdx = 1;
    moving = true;
    timeReachedLastPoint = tick();
    local l_v37_LocalHumanoid_0 = v37:GetLocalHumanoid();
    if l_v37_LocalHumanoid_0 and l_v37_LocalHumanoid_0.Torso and #currentPoints >= 1 then
        expectedTimeToNextPoint = (currentPoints[1] - l_v37_LocalHumanoid_0.Torso.Position).magnitude / l_v37_LocalHumanoid_0.WalkSpeed;
    end;
    l_BindableEvent_0:Fire("targetPoint", v37.currentDestination);
end;
v23.GoToPoint = function(v40, v41) --[[ Line: 167 ]] --[[ Name: GoToPoint ]]
    -- upvalues: l_BindableEvent_0 (copy)
    currentPath = true;
    currentPoints = {
        v41
    };
    currentPointIdx = 1;
    moving = true;
    local l_v40_LocalHumanoid_0 = v40:GetLocalHumanoid();
    local v43 = (l_v40_LocalHumanoid_0.Torso.Position - v41).magnitude / l_v40_LocalHumanoid_0.WalkSpeed;
    timeReachedLastPoint = tick();
    expectedTimeToNextPoint = v43;
    l_BindableEvent_0:Fire("targetPoint", v41);
end;
v23.StopFollowingPath = function(v44) --[[ Line: 183 ]] --[[ Name: StopFollowingPath ]]
    currentPath = nil;
    currentPoints = nil;
    currentPointIdx = 0;
    moving = false;
    v44.moveVector = Vector3.new(0, 0, 0, 0);
end;
v23.TryComputePath = function(_, v46, v47) --[[ Line: 191 ]] --[[ Name: TryComputePath ]]
    -- upvalues: l_PathfindingService_0 (copy)
    local v48 = 0;
    local v49 = nil;
    while true do
        if not v49 and v48 < 5 then
            v49 = l_PathfindingService_0:ComputeSmoothPathAsync(v46, v47, 200);
            v48 = v48 + 1;
            if v49.Status == Enum.PathStatus.ClosestNoPath or v49.Status == Enum.PathStatus.ClosestOutOfRange then
                return nil;
            else
                if v49 and v49.Status == Enum.PathStatus.FailStartNotEmpty then
                    v46 = v46 + (v47 - v46).Unit;
                    v49 = nil;
                end;
                if v49 and v49.Status == Enum.PathStatus.FailFinishNotEmpty then
                    v47 = v47 + Vector3.new(0, 1, 0, 0);
                    v49 = nil;
                end;
            end;
        else
            return v49;
        end;
    end;
end;
v23.OnNavigationRequest = function(v50, v51, _) --[[ Line: 218 ]] --[[ Name: OnNavigationRequest ]]
    -- upvalues: v9 (ref)
    local l_Position_0 = v51.Position;
    local l_currentDestination_0 = v50.currentDestination;
    local l_x_1 = l_Position_0.x;
    local v56 = false;
    if l_x_1 == l_x_1 then
        v56 = false;
        if l_x_1 ~= 1e999 then
            v56 = l_x_1 ~= -1e999;
        end;
    end;
    if v56 then
        l_x_1 = l_Position_0.y;
        v56 = false;
        if l_x_1 == l_x_1 then
            v56 = false;
            if l_x_1 ~= 1e999 then
                v56 = l_x_1 ~= -1e999;
            end;
        end;
        if v56 then
            l_x_1 = l_Position_0.z;
            v56 = false;
            if l_x_1 == l_x_1 then
                v56 = false;
                if l_x_1 ~= 1e999 then
                    v56 = l_x_1 ~= -1e999;
                end;
            end;
        end;
    end;
    if not v56 then
        return;
    else
        v50.currentDestination = l_Position_0;
        v56 = v50:GetLocalHumanoid();
        if not v56 or not v56.Torso then
            return;
        else
            l_x_1 = v56.Torso.Position;
            if (v50.currentDestination - l_x_1).magnitude < 12 then
                v50:GoToPoint(v50.currentDestination);
                return;
            else
                if not l_currentDestination_0 or (v50.currentDestination - l_currentDestination_0).magnitude > 4 then
                    local v57 = v50:TryComputePath(l_x_1, v50.currentDestination);
                    if v57 then
                        v50:StartFollowingPath(v57);
                        if v9 then
                            v9.setCurrentPoints(v50.currentPoints);
                            v9.renderPath();
                            return;
                        end;
                    else
                        v50:StopFollowingPath();
                        if v9 then
                            v9.clearRenderedPath();
                            return;
                        end;
                    end;
                elseif moving then
                    v50.currentPoints[#currentPoints] = v50.currentDestination;
                    return;
                else
                    v50:GoToPoint(v50.currentDestination);
                end;
                return;
            end;
        end;
    end;
end;
v23.OnJumpAction = function(v58, _, v60, _) --[[ Line: 264 ]] --[[ Name: OnJumpAction ]]
    if v60 == Enum.UserInputState.Begin then
        v58.isJumping = true;
    end;
    return Enum.ContextActionResult.Sink;
end;
v23.BindJumpAction = function(v62, v63) --[[ Line: 270 ]] --[[ Name: BindJumpAction ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v63 then
        if not v62.isJumpBound then
            v62.isJumpBound = true;
            l_ContextActionService_0:BindActionAtPriority("VRJumpAction", function() --[[ Line: 274 ]]
                -- upvalues: v62 (copy)
                return v62:OnJumpAction();
            end, false, v62.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
            return;
        end;
    elseif v62.isJumpBound then
        v62.isJumpBound = false;
        l_ContextActionService_0:UnbindAction("VRJumpAction");
    end;
end;
v23.ControlCharacterGamepad = function(v64, _, v66, v67) --[[ Line: 285 ]] --[[ Name: ControlCharacterGamepad ]]
    -- upvalues: v9 (ref), l_BindableEvent_0 (copy)
    if v67.KeyCode ~= Enum.KeyCode.Thumbstick1 then
        return;
    elseif v66 == Enum.UserInputState.Cancel then
        v64.moveVector = Vector3.new(0, 0, 0, 0);
        return;
    else
        if v66 ~= Enum.UserInputState.End then
            v64:StopFollowingPath();
            if v9 then
                v9.clearRenderedPath();
            end;
            if v64:ShouldUseNavigationLaser() then
                v64:BindJumpAction(true);
                v64:SetLaserPointerMode("Hidden");
            end;
            if v67.Position.magnitude > 0.22 then
                v64.moveVector = Vector3.new(v67.Position.X, 0, -v67.Position.Y);
                if v64.moveVector.magnitude > 0 then
                    v64.moveVector = v64.moveVector.unit * math.min(1, v67.Position.magnitude);
                end;
                v64.moveLatch = true;
            end;
        else
            v64.moveVector = Vector3.new(0, 0, 0, 0);
            if v64:ShouldUseNavigationLaser() then
                v64:BindJumpAction(false);
                v64:SetLaserPointerMode("Navigation");
            end;
            if v64.moveLatch then
                v64.moveLatch = false;
                l_BindableEvent_0:Fire("offtrack");
            end;
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
v23.OnHeartbeat = function(v68, v69) --[[ Line: 328 ]] --[[ Name: OnHeartbeat ]]
    -- upvalues: v9 (ref), v12 (copy), v11 (copy), l_BindableEvent_0 (copy)
    local l_moveVector_0 = v68.moveVector;
    local l_v68_LocalHumanoid_0 = v68:GetLocalHumanoid();
    if not l_v68_LocalHumanoid_0 or not l_v68_LocalHumanoid_0.Torso then
        return;
    else
        if v68.moving and v68.currentPoints then
            local l_Position_1 = l_v68_LocalHumanoid_0.Torso.Position;
            local v73 = (currentPoints[1] - l_Position_1) * Vector3.new(1, 0, 1, 0);
            local l_magnitude_0 = v73.magnitude;
            local v75 = v73 / l_magnitude_0;
            if l_magnitude_0 < 1 then
                local v76 = 0;
                local v77 = currentPoints[1];
                for v78, v79 in pairs(currentPoints) do
                    if v78 ~= 1 then
                        local l_magnitude_1 = (v79 - v77).magnitude;
                        v77 = v79;
                        v76 = v76 + l_magnitude_1 / l_v68_LocalHumanoid_0.WalkSpeed;
                    end;
                end;
                table.remove(currentPoints, 1);
                currentPointIdx = currentPointIdx + 1;
                if #currentPoints == 0 then
                    v68:StopFollowingPath();
                    if v9 then
                        v9.clearRenderedPath();
                    end;
                    return;
                else
                    if v9 then
                        v9.setCurrentPoints(currentPoints);
                        v9.renderPath();
                    end;
                    expectedTimeToNextPoint = (currentPoints[1] - l_Position_1).magnitude / l_v68_LocalHumanoid_0.WalkSpeed;
                    timeReachedLastPoint = tick();
                end;
            else
                if v12 then
                    v11.FilterDescendantsInstances = {
                        game.Players.LocalPlayer.Character, 
                        workspace.CurrentCamera
                    };
                    local v81 = workspace:Raycast(l_Position_1 - Vector3.yAxis, v75 * 3, v11);
                    if v81 then
                        local v82 = workspace:Raycast(v81.Position + v75 * 0.5 + Vector3.new(0, 100, 0, 0), -Vector3.new(0, 100, 0, 0), v11).Position.Y - l_Position_1.Y;
                        if v82 < 6 and v82 > -2 then
                            l_v68_LocalHumanoid_0.Jump = true;
                        end;
                    end;
                else
                    local v83 = {
                        game.Players.LocalPlayer.Character, 
                        workspace.CurrentCamera
                    };
                    local v84 = Ray.new(l_Position_1 - Vector3.new(0, 1, 0, 0), v75 * 3);
                    local l_workspace_PartOnRayWithIgnoreList_0, v86, _ = workspace:FindPartOnRayWithIgnoreList(v84, v83);
                    if l_workspace_PartOnRayWithIgnoreList_0 then
                        local v88 = Ray.new(v86 + v75 * 0.5 + Vector3.new(0, 100, 0, 0), -Vector3.new(0, 100, 0, 0));
                        local _, v90, _ = workspace:FindPartOnRayWithIgnoreList(v88, v83);
                        local v92 = v90.Y - l_Position_1.Y;
                        if v92 < 6 and v92 > -2 then
                            l_v68_LocalHumanoid_0.Jump = true;
                        end;
                    end;
                end;
                if tick() - timeReachedLastPoint > expectedTimeToNextPoint + 2 then
                    v68:StopFollowingPath();
                    if v9 then
                        v9.clearRenderedPath();
                    end;
                    l_BindableEvent_0:Fire("offtrack");
                end;
                l_moveVector_0 = v68.moveVector:Lerp(v75, v69 * 10);
            end;
        end;
        local l_l_moveVector_0_0 = l_moveVector_0;
        local l_x_2 = l_l_moveVector_0_0.x;
        local v95 = false;
        if l_x_2 == l_x_2 then
            v95 = false;
            if l_x_2 ~= 1e999 then
                v95 = l_x_2 ~= -1e999;
            end;
        end;
        if v95 then
            l_x_2 = l_l_moveVector_0_0.y;
            v95 = false;
            if l_x_2 == l_x_2 then
                v95 = false;
                if l_x_2 ~= 1e999 then
                    v95 = l_x_2 ~= -1e999;
                end;
            end;
            if v95 then
                l_x_2 = l_l_moveVector_0_0.z;
                v95 = false;
                if l_x_2 == l_x_2 then
                    v95 = false;
                    if l_x_2 ~= 1e999 then
                        v95 = l_x_2 ~= -1e999;
                    end;
                end;
            end;
        end;
        if v95 then
            v68.moveVector = l_moveVector_0;
        end;
        return;
    end;
end;
v23.OnUserCFrameEnabled = function(v96) --[[ Line: 426 ]] --[[ Name: OnUserCFrameEnabled ]]
    if v96:ShouldUseNavigationLaser() then
        v96:BindJumpAction(false);
        v96:SetLaserPointerMode("Navigation");
        return;
    else
        v96:BindJumpAction(true);
        v96:SetLaserPointerMode("Hidden");
        return;
    end;
end;
v23.Enable = function(v97, v98) --[[ Line: 436 ]] --[[ Name: Enable ]]
    -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), l_ContextActionService_0 (copy)
    v97.moveVector = Vector3.new(0, 0, 0, 0);
    v97.isJumping = false;
    if v98 then
        v97.navigationRequestedConn = l_VRService_0.NavigationRequested:Connect(function(v99, v100) --[[ Line: 442 ]]
            -- upvalues: v97 (copy)
            v97:OnNavigationRequest(v99, v100);
        end);
        v97.heartbeatConn = l_RunService_0.Heartbeat:Connect(function(v101) --[[ Line: 443 ]]
            -- upvalues: v97 (copy)
            v97:OnHeartbeat(v101);
        end);
        l_ContextActionService_0:BindAction("MoveThumbstick", function(v102, v103, v104) --[[ Line: 445 ]]
            -- upvalues: v97 (copy)
            return v97:ControlCharacterGamepad(v102, v103, v104);
        end, false, v97.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
        l_ContextActionService_0:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        v97.userCFrameEnabledConn = l_VRService_0.UserCFrameEnabled:Connect(function() --[[ Line: 449 ]]
            -- upvalues: v97 (copy)
            v97:OnUserCFrameEnabled();
        end);
        v97:OnUserCFrameEnabled();
        l_VRService_0:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick);
        l_VRService_0:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY);
        v97.enabled = true;
        return;
    else
        v97:StopFollowingPath();
        l_ContextActionService_0:UnbindAction("MoveThumbstick");
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        v97:BindJumpAction(false);
        v97:SetLaserPointerMode("Disabled");
        if v97.navigationRequestedConn then
            v97.navigationRequestedConn:Disconnect();
            v97.navigationRequestedConn = nil;
        end;
        if v97.heartbeatConn then
            v97.heartbeatConn:Disconnect();
            v97.heartbeatConn = nil;
        end;
        if v97.userCFrameEnabledConn then
            v97.userCFrameEnabledConn:Disconnect();
            v97.userCFrameEnabledConn = nil;
        end;
        v97.enabled = false;
        return;
    end;
end;
return v23;