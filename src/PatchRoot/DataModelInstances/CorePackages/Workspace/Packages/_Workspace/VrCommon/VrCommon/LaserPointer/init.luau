local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v8 = require(l_script_FirstAncestor_0.VRUtil);
require(l_script_FirstAncestor_0.Panel3D);
local v9 = game:DefineFastFlag("VRFixCursorJitterLua", false);
local v10 = game:DefineFastFlag("EnableUserInputCFrameLogging", false);
local v11 = game:DefineFastFlag("EnableUpdateduserInputCFrameUpdate", false);
local v12 = game:DefineFastFlag("VRLaserPointerRaycastChange", false);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.Changed:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local function _(v14) --[[ Line: 34 ]] --[[ Name: fromLinearRGB ]]
    return Color3.new(v14.r ^ 2.2, v14.g ^ 2.2, v14.b ^ 2.2);
end;
local function v22(...) --[[ Line: 38 ]] --[[ Name: addPartsToGame ]]
    -- upvalues: l_GuiService_0 (copy)
    local v16 = {
        ...
    };
    local l_CoreEffectFolder_0 = l_GuiService_0.CoreEffectFolder;
    if not l_CoreEffectFolder_0 then
        coroutine.wrap(function() --[[ Line: 44 ]]
            -- upvalues: l_GuiService_0 (ref), v16 (copy), l_CoreEffectFolder_0 (copy)
            while l_GuiService_0.Changed:wait() ~= "CoreEffectFolder" and l_GuiService_0.CoreEffectFolder == nil do

            end;
            for _, v19 in pairs(v16) do
                v19.Parent = l_CoreEffectFolder_0;
                v19.CanTouch = false;
                v19.CanCollide = false;
                v19.CanQuery = false;
            end;
        end)();
        return;
    else
        for _, v21 in pairs(v16) do
            v21.Parent = l_CoreEffectFolder_0;
            v21.CanTouch = false;
            v21.CanCollide = false;
            v21.CanQuery = false;
        end;
        return;
    end;
end;
local function v25(...) --[[ Line: 65 ]] --[[ Name: removePartsFromGame ]]
    for _, v24 in pairs({
        ...
    }) do
        v24.Parent = nil;
    end;
end;
local function v29() --[[ Line: 72 ]] --[[ Name: getLocalHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        for _, v28 in pairs(l_Character_0:GetChildren()) do
            if v28:IsA("Humanoid") then
                return v28;
            end;
        end;
        return;
    end;
end;
local function _(v30, v31) --[[ Line: 86 ]] --[[ Name: applyExpCurve ]]
    local v32 = v30 ^ v31;
    if v32 ~= v32 then
        v32 = math.abs(v30) ^ v31;
    end;
    return v32;
end;
local v34 = {
    Disabled = 0, 
    Pointer = 1, 
    Navigation = 2, 
    Hidden = 3, 
    DualPointer = 4
};
local v35 = {
    Right = 0, 
    Left = 1
};
local v36 = {
    MODE_ENABLED = true
};
local v37 = Color3.fromRGB(0, 162, 255);
v36.ARC_COLOR_GOOD = Color3.new(v37.r ^ 2.2, v37.g ^ 2.2, v37.b ^ 2.2);
v37 = Color3.fromRGB(253, 68, 72);
v36.ARC_COLOR_BAD = Color3.new(v37.r ^ 2.2, v37.g ^ 2.2, v37.b ^ 2.2);
v36.ARC_THICKNESS = 0.0125;
v36.PLOP_GOOD = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png";
v36.PLOP_BAD = "rbxasset://textures/ui/VR/VRPointerDiscRed.png";
v36.PLOP_BALL_COLOR_GOOD = BrickColor.new("Bright green");
v36.PLOP_BALL_COLOR_BAD = BrickColor.new("Bright red");
v36.PLOP_BALL_SIZE = 0.5;
v36.PLOP_SIZE = 2;
v36.PLOP_PULSE_MIN_SIZE = 0;
v36.PLOP_PULSE_MAX_SIZE = 2;
v36.MAX_VALID_DISTANCE = 100;
v36.BUTTON_DOWN_THRESHOLD = 0.95;
v36.BUTTON_UP_THRESHOLD = 0.5;
v36.MIN_VELOCITY = 10;
v36.RANGE_T_EXP = 2;
v36.G = 10;
v36.PULSE_DURATION = 0.8;
v36.PULSE_PERIOD = 1;
v36.PULSE_EXP = 2;
v36.PULSE_SIZE_0 = 0.25;
v36.PULSE_SIZE_1 = 2;
v36.BALL_WAVE_PERIOD = 2;
v36.BALL_WAVE_AMPLITUDE = 0.5;
v36.BALL_WAVE_START = 0.25;
v36.BALL_WAVE_EXP = 0.8;
v36.FLOOR_OFFSET = 4.5;
v36.FADE_OUT_DURATION = 0.125;
v36.FADE_IN_DURATION = 0.125;
v36.TRANSITION_DURATION = 0.25;
local v38 = {
    MODE_ENABLED = true, 
    ARC_COLOR_GOOD = v36.ARC_COLOR_GOOD, 
    ARC_COLOR_BAD = v36.ARC_COLOR_BAD
};
local v39 = Color3.fromRGB(0, 255, 162);
v38.ARC_COLOR_HIT = Color3.new(v39.r ^ 2.2, v39.g ^ 2.2, v39.b ^ 2.2);
v38.ARC_THICKNESS = 0.01;
v38.MAX_DISTANCE = 50;
v38.G = 0;
v38.SWITCH_AIM_THRESHOLD = 0.2617993877991494;
v38.TRANSITION_DURATION = 0.075;
v37 = Vector2.new(0, 0);
v39 = Vector2.new(1, 1);
local v40 = {};
v40.__index = v40;
v40.Mode = v34;
v40.new = function(_) --[[ Line: 185 ]] --[[ Name: new ]]
    -- upvalues: v40 (copy), l_VRService_0 (copy), v35 (copy), l_Create_0 (copy), l_CoreGui_0 (copy), v36 (copy), v39 (copy), v37 (copy), l_GuiService_0 (copy), v9 (copy), v11 (copy)
    local v42 = setmetatable({}, v40);
    v42.laserMaxDistance = l_VRService_0.LaserDistance;
    v42.laserHand = v35.Right;
    v42.inputUserCFrame = Enum.UserCFrame.RightHand;
    v42.equippedTool = false;
    v42.lastLaserModeHit = tick();
    v42.guiMenuIsOpen = false;
    v42.externalForcePointer = false;
    v42.forceDotActive = true;
    v42.navHitPoint = Vector3.new(0, 0, 0, 0);
    v42.navHitNormal = Vector3.new(0, 1, 0, 0);
    v42.navHitPart = nil;
    v42.navigationIsValid = false;
    v42.lastNavigationValidityChangeTime = tick();
    v42.plopBallBounceStart = tick();
    v42.buttonPressStart = 0;
    v42.showPlopBallOnPointer = false;
    v42.parabola = l_Create_0("ParabolaAdornment")({
        Name = "LaserPointerParabola", 
        Parent = l_CoreGui_0, 
        A = -1, 
        B = 2, 
        C = 0, 
        Color3 = nil, 
        Thickness = v36.ARC_THICKNESS, 
        Visible = false
    });
    v42.originPart = l_Create_0("Part")({
        Name = "LaserPointerOrigin", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v42.parabola.Adornee = v42.originPart;
    v42.parabolaOffhand = l_Create_0("ParabolaAdornment")({
        Name = "LaserPointerparabolaOffhand", 
        Parent = l_CoreGui_0, 
        A = 0, 
        B = 1.0E-6, 
        C = 0, 
        Color3 = Color3.new(1, 1, 1), 
        Transparency = 0.5, 
        Thickness = v36.ARC_THICKNESS, 
        Visible = false
    });
    v42.originPartOffhand = l_Create_0("Part")({
        Name = "LaserPointerOriginOffhand", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v42.parabolaOffhand.Adornee = v42.originPartOffhand;
    v42.plopPart = l_Create_0("Part")({
        Name = "LaserPointerTeleportPlop", 
        Anchored = true, 
        CanCollide = false, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v42.plopBall = l_Create_0("Part")({
        Name = "LaserPointerTeleportPlopBall", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.Neon, 
        BrickColor = v36.PLOP_BALL_COLOR_GOOD, 
        Shape = Enum.PartType.Ball, 
        Size = Vector3.new(1, 1, 1, 0) * v36.PLOP_BALL_SIZE
    });
    v42.plopAdorn = l_Create_0("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdorn", 
        Parent = v42.plopPart, 
        Adornee = v42.plopPart, 
        Size = v39 * v36.PLOP_SIZE, 
        Image = v36.PLOP_GOOD
    });
    v42.plopAdornPulse = l_Create_0("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdornPulse", 
        Parent = v42.plopPart, 
        Adornee = v42.plopPart, 
        Size = v37, 
        Image = v36.PLOP_GOOD, 
        Transparency = 0.5
    });
    v42.cursorPart = l_Create_0("Part")({
        Name = "Cursor", 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false, 
        Anchored = true, 
        Transparency = 1
    });
    v42.cursorSurfaceGui = l_Create_0("SurfaceGui")({
        Name = "CursorSurfaceGui", 
        Active = false, 
        AlwaysOnTop = true, 
        Enabled = false, 
        ZOffset = 10, 
        Parent = v42.cursorPart
    });
    v42.cursorImage = l_Create_0("ImageLabel")({
        Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
        ImageColor3 = Color3.new(0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v42.cursorSurfaceGui, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    });
    v42.connections = {};
    table.insert(v42.connections, l_VRService_0:GetPropertyChangedSignal("LaserPointer"):Connect(function() --[[ Line: 323 ]]
        -- upvalues: v42 (copy)
        v42:onModeChanged();
    end));
    v42:onModeChanged();
    l_GuiService_0.MenuOpened:connect(function() --[[ Line: 330 ]]
        -- upvalues: v42 (copy)
        v42.guiMenuIsOpen = true;
    end);
    l_GuiService_0.MenuClosed:connect(function() --[[ Line: 333 ]]
        -- upvalues: v42 (copy)
        v42.guiMenuIsOpen = false;
    end);
    v42.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
    l_VRService_0.Changed:connect(function(v43) --[[ Line: 338 ]]
        -- upvalues: v42 (copy), l_VRService_0 (ref), v9 (ref), v11 (ref)
        if v43 == "GuiInputUserCFrame" then
            v42.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
            return;
        elseif v9 and (v43 == "PointerHitCFrame" or v43 == "DidPointerHit") then
            v42:cursorInputsChanged();
            return;
        else
            if v11 and v43 == "VRSessionState" and l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
                v42:updateInputUserCFrame();
            end;
            return;
        end;
    end);
    l_VRService_0.LaserPointerTriggered:connect(function(v44) --[[ Line: 352 ]]
        -- upvalues: v42 (copy), v35 (ref)
        if game:GetEngineFeature("ImprovedTriggerFire") and v44.UserInputState ~= Enum.UserInputState.End then
            return;
        elseif (v44.KeyCode == Enum.KeyCode.ButtonR1 or v44.KeyCode == Enum.KeyCode.ButtonR2 or v44.KeyCode == Enum.KeyCode.ButtonR3 or v44.KeyCode == Enum.KeyCode.ButtonA or v44.KeyCode == Enum.KeyCode.ButtonB) and v42.laserHand ~= v35.Right then
            v42.laserHand = v35.Right;
            v42:updateInputUserCFrame();
            return;
        else
            if (v44.KeyCode == Enum.KeyCode.ButtonL1 or v44.KeyCode == Enum.KeyCode.ButtonL2 or v44.KeyCode == Enum.KeyCode.ButtonL3 or v44.KeyCode == Enum.KeyCode.ButtonX or v44.KeyCode == Enum.KeyCode.ButtonY) and v42.laserHand ~= v35.Left then
                v42.laserHand = v35.Left;
                v42:updateInputUserCFrame();
            end;
            return;
        end;
    end);
    if v11 then
        l_VRService_0.UserCFrameEnabled:Connect(function(_, _) --[[ Line: 382 ]]
            -- upvalues: v42 (copy)
            v42:updateInputUserCFrame();
        end);
    end;
    v42:updateInputUserCFrame();
    return v42;
end;
v40.hasAnyHandController = function() --[[ Line: 392 ]] --[[ Name: hasAnyHandController ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v40.getModeName = function(v47) --[[ Line: 397 ]] --[[ Name: getModeName ]]
    -- upvalues: v34 (copy)
    for v48, v49 in pairs(v34) do
        if v47 == v49 then
            return v48;
        end;
    end;
    return "unknown";
end;
v40.updateInputUserCFrame = function(v50) --[[ Line: 407 ]] --[[ Name: updateInputUserCFrame ]]
    -- upvalues: v10 (copy), l_VRService_0 (copy), v35 (copy)
    local v51 = nil;
    if v10 then
        v51 = l_VRService_0.GuiInputUserCFrame;
    end;
    if l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and v50.laserHand == v35.Right then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) and v50.laserHand == v35.Left then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
    else
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.Head;
    end;
    if v10 and v51 ~= l_VRService_0.GuiInputUserCFrame then
        print("Updated GuiInputUserCFrame is: " .. tostring(l_VRService_0.GuiInputUserCFrame));
    end;
end;
v40.onModeChanged = function(v52, _) --[[ Line: 428 ]] --[[ Name: onModeChanged ]]
    -- upvalues: l_VRService_0 (copy), v22 (copy), v25 (copy)
    v52:updateInputUserCFrame();
    if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Disabled then
        v22(v52.originPart, v52.cursorPart);
        v25(v52.plopPart, v52.plopBall, v52.originPartOffhand);
        v52.forceDotActive = true;
        v52.parabola.Visible = false;
        v52.parabolaOffhand.Visible = false;
        v52:setNavigationActionEnabled(false);
        return;
    elseif l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Pointer then
        v22(v52.originPart, v52.cursorPart);
        v25(v52.plopPart, v52.plopBall, v52.originPartOffhand);
        v52.parabola.Visible = true;
        v52.parabolaOffhand.Visible = false;
        v52:setNavigationActionEnabled(false);
        v52.forceDotActive = false;
        return;
    else
        if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
            v22(v52.originPart, v52.originPartOffhand, v52.cursorPart);
            v25(v52.plopPart, v52.plopBall);
            v52.parabola.Visible = true;
            v52.parabolaOffhand.Visible = true;
            v52:setNavigationActionEnabled(false);
            v52.forceDotActive = false;
        end;
        return;
    end;
end;
v40.setMode = function(_, v55) --[[ Line: 462 ]] --[[ Name: setMode ]]
    -- upvalues: v34 (copy), l_VRService_0 (copy)
    if v55 == v34.Disabled or v55 == v34.Hidden then
        l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.Disabled;
        return;
    elseif v55 == v34.Pointer or v55 == v34.Navigation then
        l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.Pointer;
        return;
    else
        if v55 == v34.DualPointer then
            l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.DualPointer;
        end;
        return;
    end;
end;
v40.setEnableAmbidexterousPointer = function(_, _) --[[ Line: 472 ]] --[[ Name: setEnableAmbidexterousPointer ]]

end;
v40.calculateLaunchVelocity = function(_, v59, v60, v61) --[[ Line: 476 ]] --[[ Name: calculateLaunchVelocity ]]
    return -(math.sqrt(v59 / 0.7071067811865476) * v60) / math.sqrt(2 * v61 * 0.7071067811865476 + 2 * v60 * 0.7071067811865476);
end;
v40.isHeadMounted = function(_) --[[ Line: 485 ]] --[[ Name: isHeadMounted ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0.GuiInputUserCFrame == Enum.UserCFrame.Head;
end;
v40.shouldForcePointer = function(v63) --[[ Line: 489 ]] --[[ Name: shouldForcePointer ]]
    return v63.externalForcePointer or v63.guiMenuIsOpen;
end;
v40.setForcePointer = function(v64, v65) --[[ Line: 493 ]] --[[ Name: setForcePointer ]]
    v64.externalForcePointer = v65;
end;
v40.getNavigationOrigin = function(_) --[[ Line: 497 ]] --[[ Name: getNavigationOrigin ]]
    -- upvalues: v29 (copy)
    local v67 = v29();
    if not v67 then
        return;
    else
        local l_Torso_0 = v67.Torso;
        if not l_Torso_0 then
            return;
        else
            local l_HipHeight_0 = v67.HipHeight;
            if v67.RigType == Enum.HumanoidRigType.R6 then
                l_HipHeight_0 = 2;
            end;
            local v70 = l_Torso_0.Size.Y / 2;
            return l_Torso_0.Position + Vector3.new(0, -v70 - l_HipHeight_0, 0);
        end;
    end;
end;
v40.horzDistanceFromCharacter = function(_, v72) --[[ Line: 516 ]] --[[ Name: horzDistanceFromCharacter ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_1 = l_LocalPlayer_0.Character;
    if not l_Character_1 then
        return 1e999;
    else
        local l_HumanoidRootPart_0 = l_Character_1:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return 1e999;
        else
            return ((l_HumanoidRootPart_0:GetRenderCFrame().p - v72) * Vector3.new(1, 0, 1, 0)).magnitude;
        end;
    end;
end;
v40.onNavigateAction = function(v75, _, v77, _) --[[ Line: 529 ]] --[[ Name: onNavigateAction ]]
    -- upvalues: l_VRService_0 (copy)
    if v77 == Enum.UserInputState.Begin then
        l_VRService_0:RequestNavigation(CFrame.new(v75.navHitPoint, v75.navHitPoint + v75.navHitNormal) * CFrame.Angles(1.5707963267948966, 0, 0), v75.inputUserCFrame);
    end;
end;
v40.setNavigationActionEnabled = function(v79, v80) --[[ Line: 538 ]] --[[ Name: setNavigationActionEnabled ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v80 then
        l_ContextActionService_0:BindCoreAction("LaserPointerNavigate", function(...) --[[ Line: 540 ]]
            -- upvalues: v79 (copy)
            v79:onNavigateAction(...);
        end, false, Enum.KeyCode.ButtonA);
        return;
    else
        l_ContextActionService_0:UnbindCoreAction("LaserPointerNavigate");
        return;
    end;
end;
v40.setArcLaunchParams = function(v81, v82, v83, v84, v85) --[[ Line: 548 ]] --[[ Name: setArcLaunchParams ]]
    local v86 = math.cos(v82) * v83;
    local v87 = math.sin(v82) * v83;
    if v86 == 0 then
        v86 = 1.0E-6;
    end;
    v81.parabola.A = -(0.5 * v84) * (1 / v86 ^ 2);
    v81.parabola.B = v87 / v86;
    v81.parabola.C = 0;
    v81.parabola.Range = v85 * 1.5;
end;
v40.renderAsParabola = function(v88, v89, v90) --[[ Line: 563 ]] --[[ Name: renderAsParabola ]]
    local v91 = v90 * Vector3.new(1, 0, 1, 0);
    v88.originPart.CFrame = CFrame.new(v89, v89 + v91) * CFrame.Angles(0, 1.5707963267948966, 0);
end;
v40.renderAsLaser = function(v92, v93, v94) --[[ Line: 568 ]] --[[ Name: renderAsLaser ]]
    v92.originPart.CFrame = CFrame.new(v93, v94) * CFrame.Angles(0, 1.5707963267948966, 0);
    v92.parabola.A = 0;
    v92.parabola.B = 1.0E-6;
    v92.parabola.C = 0;
    v92.parabola.Range = (v94 - v93).magnitude;
end;
v40.renderOffhandLaser = function(v95, v96, v97) --[[ Line: 576 ]] --[[ Name: renderOffhandLaser ]]
    v95.originPartOffhand.CFrame = CFrame.new(v96, v97) * CFrame.Angles(0, 1.5707963267948966, 0);
    v95.parabolaOffhand.Range = (v97 - v96).magnitude;
end;
if not v12 then
    v40.getLaserHit = function(v98, v99, v100, v101) --[[ Line: 582 ]] --[[ Name: getLaserHit ]]
        local v102 = Ray.new(v99, v100 * v98.laserMaxDistance);
        local l_workspace_PartOnRayWithIgnoreList_0, v104, v105, _ = workspace:FindPartOnRayWithIgnoreList(v102, v101);
        return l_workspace_PartOnRayWithIgnoreList_0, v104, v105, (v104 - v99).magnitude / math.max(v98.laserMaxDistance, 0.1);
    end;
end;
v40.canNavigateTo = function(_, v108, _, v110) --[[ Line: 591 ]] --[[ Name: canNavigateTo ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_2 = l_LocalPlayer_0.Character;
    if not l_Character_2 then
        return false;
    elseif not l_Character_2:FindFirstChild("HumanoidRootPart") then
        return false;
    elseif not v108 then
        return false;
    elseif v110.Y < -1.0E-6 then
        return false;
    else
        return true;
    end;
end;
v40.checkHeadMountedMode = function(v112, v113) --[[ Line: 614 ]] --[[ Name: checkHeadMountedMode ]]
    -- upvalues: v34 (copy), l_GuiService_0 (copy)
    if v112:shouldForcePointer() then
        v112:setMode(v34.Pointer);
        return;
    else
        local l_CoreGuiFolder_0 = l_GuiService_0.CoreGuiFolder;
        if v113 and v113:IsDescendantOf(l_CoreGuiFolder_0) then
            v112:setMode(v34.Pointer);
            return;
        else
            v112:setMode(v34.Navigation);
            return;
        end;
    end;
end;
v40.setNavigationValidState = function(v115, v116) --[[ Line: 628 ]] --[[ Name: setNavigationValidState ]]
    -- upvalues: v36 (copy)
    if v116 == v115.navigationIsValid then
        return;
    else
        v115.navigationIsValid = v116;
        v115.lastNavigationValidityChangeTime = tick();
        if v116 then
            v115.plopBallBounceStart = tick();
            v115.parabola.Color3 = v36.ARC_COLOR_GOOD;
            v115.plopAdorn.Visible = true;
            v115.plopAdorn.Image = v36.PLOP_GOOD;
            v115.plopAdornPulse.Visible = true;
            v115.plopAdornPulse.Image = v36.PLOP_GOOD;
            v115.plopBall.BrickColor = v36.PLOP_BALL_COLOR_GOOD;
            return;
        else
            v115.parabola.Color3 = v36.ARC_COLOR_BAD;
            v115.plopAdorn.Visible = false;
            v115.plopAdorn.Image = v36.PLOP_BAD;
            v115.plopAdornPulse.Visible = false;
            v115.plopAdornPulse.Image = v36.PLOP_BAD;
            v115.plopBall.BrickColor = v36.PLOP_BALL_COLOR_BAD;
            return;
        end;
    end;
end;
v40.updateNavPlop = function(v117, v118, v119) --[[ Line: 653 ]] --[[ Name: updateNavPlop ]]
    -- upvalues: v36 (copy), v39 (copy), v37 (copy)
    local v120 = tick() - v117.plopBallBounceStart;
    local v121 = CFrame.new(v118, v118 + v119);
    local v122 = 0;
    if v117.navigationIsValid then
        local v123 = math.sin(v120 * 2 * 3.141592653589793 / v36.BALL_WAVE_PERIOD);
        local l_BALL_WAVE_EXP_0 = v36.BALL_WAVE_EXP;
        local v125 = v123 ^ l_BALL_WAVE_EXP_0;
        if v125 ~= v125 then
            v125 = math.abs(v123) ^ l_BALL_WAVE_EXP_0;
        end;
        v122 = v36.BALL_WAVE_START + v125 * v36.BALL_WAVE_AMPLITUDE;
    end;
    v117.plopPart.CFrame = v121;
    v117.plopBall.CFrame = v121 * CFrame.new(0, 0, -v122);
    local v126 = v120 % v36.PULSE_PERIOD;
    if v126 > 0 then
        local v127 = v126 / v36.PULSE_DURATION;
        if v127 < 1 then
            v117.plopAdornPulse.Visible = true;
            local l_plopAdornPulse_0 = v117.plopAdornPulse;
            local l_v39_0 = v39;
            local l_PULSE_SIZE_0_0 = v36.PULSE_SIZE_0;
            local l_PULSE_EXP_0 = v36.PULSE_EXP;
            local v132 = v127 ^ l_PULSE_EXP_0;
            if v132 ~= v132 then
                v132 = math.abs(v127) ^ l_PULSE_EXP_0;
            end;
            l_plopAdornPulse_0.Size = l_v39_0 * (l_PULSE_SIZE_0_0 + v132 * (v36.PULSE_SIZE_1 - v36.PULSE_SIZE_0));
            v117.plopAdornPulse.Transparency = 0.5 + v127 * 0.5;
            return;
        else
            v117.plopAdornPulse.Visible = false;
            v117.plopAdornPulse.Size = v37;
            v117.pulseStartTime = tick() + v36.PULSE_PERIOD;
        end;
    end;
end;
v40.updateNavigationMode = function(v133, v134, v135, v136) --[[ Line: 691 ]] --[[ Name: updateNavigationMode ]]
    v133.navHitPoint = v134;
    v133.navHitNormal = v135;
    v133.navHitPart = v136;
    v133:updateNavPlop(v134, v135);
    v133:setNavigationValidState(v133:canNavigateTo(v133.navHitPart, v133.navHitPoint, v133.navHitNormal));
end;
v40.showHitBallOnLaserPointer = function(v137, v138) --[[ Line: 700 ]] --[[ Name: showHitBallOnLaserPointer ]]
    -- upvalues: v22 (copy), v25 (copy)
    if v138 then
        if not v137.showPlopBallOnPointer then
            v137.showPlopBallOnPointer = true;
            v22(v137.plopBall);
            return;
        end;
    elseif v137.showPlopBallOnPointer then
        v25(v137.plopBall);
        v137.showPlopBallOnPointer = false;
    end;
end;
v40.cursorInputsChanged = function(v139) --[[ Line: 714 ]] --[[ Name: cursorInputsChanged ]]
    -- upvalues: l_VRService_0 (copy), v8 (copy)
    local l_DidPointerHit_0 = l_VRService_0.DidPointerHit;
    v139.cursorSurfaceGui.Enabled = l_DidPointerHit_0;
    if l_DidPointerHit_0 then
        local l_PointerHitCFrame_0 = l_VRService_0.PointerHitCFrame;
        local l_magnitude_0 = (v8.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position - l_PointerHitCFrame_0.Position).magnitude;
        local v143 = 1;
        local v144 = l_magnitude_0 * 0.01;
        if v144 < 0.05 then
            v143 = v144 / 0.05;
            v144 = 0.05;
        end;
        v139.cursorPart.Size = Vector3.new(v144, v144, v144);
        local v145 = CFrame.new(0, 0, v144 * 0.5);
        v139.cursorPart.CFrame = l_PointerHitCFrame_0 * v145;
        v139.cursorImage.Size = UDim2.new(v143, 0, v143, 0);
    end;
end;
v40.updateCursor_DEPRECATED = function(v146) --[[ Line: 739 ]] --[[ Name: updateCursor_DEPRECATED ]]
    -- upvalues: l_VRService_0 (copy), v8 (copy)
    if l_VRService_0.DidPointerHit then
        local l_PointerHitCFrame_1 = l_VRService_0.PointerHitCFrame;
        local v148 = v8.GetUserCFrameWorldSpace(v146.inputUserCFrame);
        if v146:isHeadMounted() then
            v148 = v8.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
        end;
        local l_p_0 = v148.p;
        local l_lookVector_0 = v148.lookVector;
        local l_Position_0 = l_PointerHitCFrame_1.Position;
        local l_lookVector_1 = l_PointerHitCFrame_1.lookVector;
        local v153 = l_lookVector_1:Dot(l_lookVector_0);
        if math.abs(v153) > 0.001 then
            l_Position_0 = l_p_0 + (l_Position_0 - l_p_0):Dot(l_lookVector_1) / v153 * l_lookVector_0;
            l_PointerHitCFrame_1 = l_PointerHitCFrame_1.Rotation + l_Position_0;
        end;
        local l_magnitude_1 = (workspace.CurrentCamera.CFrame.Position - l_PointerHitCFrame_1.Position).magnitude;
        local v155 = 1;
        local v156 = l_magnitude_1 * 0.01;
        if v156 < 0.05 then
            v155 = v156 / 0.05;
            v156 = 0.05;
        end;
        v146.cursorPart.Size = Vector3.new(v156, v156, v156);
        local v157 = CFrame.new(0, 0, v156 * 0.5);
        v146.cursorPart.CFrame = l_PointerHitCFrame_1 * v157;
        v146.cursorImage.Size = UDim2.new(v155, 0, v155, 0);
    end;
    v146.cursorSurfaceGui.Enabled = l_VRService_0.DidPointerHit;
end;
v40.disableComponent = function(v158) --[[ Line: 781 ]] --[[ Name: disableComponent ]]
    -- upvalues: v25 (copy)
    v25(v158.parabola, v158.parabolaOffhand, v158.originPart, v158.originPartOffhand, v158.plopPart, v158.plopBall, v158.cursorPart);
    v158:setNavigationActionEnabled(false);
    for _, v160 in pairs(v158.connections) do
        v160:Disconnect();
    end;
    v158.connections = {};
end;
v40.update = function(v161, _) --[[ Line: 798 ]] --[[ Name: update ]]
    -- upvalues: l_VRService_0 (copy), v38 (copy), l_LocalPlayer_0 (ref), v8 (copy)
    if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Disabled then
        return;
    else
        v161.parabola.Thickness = v38.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
        v161.parabolaOffhand.Thickness = v38.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
        if l_LocalPlayer_0 and l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChildOfClass("Tool") then
            v161.parabola.Color3 = v38.ARC_COLOR_BAD;
        else
            v161.parabola.Color3 = l_VRService_0.DidPointerHit and v38.ARC_COLOR_HIT or v38.ARC_COLOR_GOOD;
        end;
        local v163 = v8.GetUserCFrameWorldSpace(v161.inputUserCFrame);
        local l_p_1 = v163.p;
        local l_lookVector_2 = v163.lookVector;
        local v166 = nil;
        v166 = if l_VRService_0.DidPointerHit then l_p_1 + l_lookVector_2 * (l_VRService_0.PointerHitCFrame.Position - l_p_1).magnitude else l_p_1 + l_lookVector_2 * v161.laserMaxDistance;
        if v161:isHeadMounted() then
            v161.parabola.Visible = false;
        else
            v161.parabola.Visible = true;
            v161:renderAsLaser(l_p_1, v166);
        end;
        if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
            if v161:isHeadMounted() then
                v161.parabolaOffhand.Visible = false;
                return;
            else
                v161.parabolaOffhand.Visible = true;
                local v167 = if v161.inputUserCFrame == Enum.UserCFrame.RightHand then Enum.UserCFrame.LeftHand else Enum.UserCFrame.RightHand;
                local v168 = v8.GetUserCFrameWorldSpace(v167);
                local l_p_2 = v168.p;
                v161:renderOffhandLaser(l_p_2, l_p_2 + v168.lookVector * 3);
            end;
        end;
        return;
    end;
end;
return v40;