local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local _ = UserSettings():GetService("UserGameSettings");
local _ = require(script.Parent:WaitForChild("CameraInput"));
local _ = require(script.Parent:WaitForChild("CameraUtils"));
local l_VRBaseCamera_0 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v6 = setmetatable({}, l_VRBaseCamera_0);
v6.__index = v6;
v6.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: l_VRBaseCamera_0 (copy), v6 (copy), l_Players_0 (copy)
    local v7 = setmetatable(l_VRBaseCamera_0.new(), v6);
    v7.lastUpdate = tick();
    v7.focusOffset = CFrame.new();
    v7:Reset();
    v7.controlModule = require(l_Players_0.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"));
    v7.savedAutoRotate = true;
    return v7;
end;
v6.Reset = function(v8) --[[ Line: 41 ]] --[[ Name: Reset ]]
    -- upvalues: l_VRBaseCamera_0 (copy)
    v8.needsReset = true;
    v8.needsBlackout = true;
    v8.motionDetTime = 0;
    v8.blackOutTimer = 0;
    v8.lastCameraResetPosition = nil;
    l_VRBaseCamera_0.Reset(v8);
end;
v6.Update = function(v9, v10) --[[ Line: 50 ]] --[[ Name: Update ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local _ = v9:GetHumanoid();
    local _ = l_CurrentCamera_0.CameraSubject;
    if v9.lastUpdate == nil or v10 > 1 then
        v9.lastCameraTransform = nil;
    end;
    v9:UpdateFadeFromBlack(v10);
    v9:UpdateEdgeBlur(l_LocalPlayer_0, v10);
    local l_lastSubjectPosition_0 = v9.lastSubjectPosition;
    local l_v9_SubjectPosition_0 = v9:GetSubjectPosition();
    if v9.needsBlackout then
        v9:StartFadeFromBlack();
        local v19 = math.clamp(v10, 1.0E-4, 0.1);
        v9.blackOutTimer = v9.blackOutTimer + v19;
        if v9.blackOutTimer > 0.1 and game:IsLoaded() then
            v9.needsBlackout = false;
            v9.needsReset = true;
        end;
    end;
    if l_v9_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        l_Focus_0 = v9:GetVRFocus(l_v9_SubjectPosition_0, v10);
        if v9:IsInFirstPerson() then
            if l_VRService_0.AvatarGestures then
                local v20, v21 = v9:UpdateImmersionCamera(v10, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v9_SubjectPosition_0);
                l_CFrame_0 = v20;
                l_Focus_0 = v21;
            else
                local v22, v23 = v9:UpdateFirstPersonTransform(v10, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v9_SubjectPosition_0);
                l_CFrame_0 = v22;
                l_Focus_0 = v23;
            end;
        elseif l_VRService_0.ThirdPersonFollowCamEnabled then
            local v24, v25 = v9:UpdateThirdPersonFollowTransform(v10, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v9_SubjectPosition_0);
            l_CFrame_0 = v24;
            l_Focus_0 = v25;
        else
            local v26, v27 = v9:UpdateThirdPersonComfortTransform(v10, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v9_SubjectPosition_0);
            l_CFrame_0 = v26;
            l_Focus_0 = v27;
        end;
        v9.lastCameraTransform = l_CFrame_0;
        v9.lastCameraFocus = l_Focus_0;
    end;
    v9.lastUpdate = tick();
    return l_CFrame_0, l_Focus_0;
end;
v6.GetAvatarFeetWorldYValue = function(_) --[[ Line: 112 ]] --[[ Name: GetAvatarFeetWorldYValue ]]
    local l_CameraSubject_1 = workspace.CurrentCamera.CameraSubject;
    if not l_CameraSubject_1 then
        return nil;
    elseif l_CameraSubject_1:IsA("Humanoid") and l_CameraSubject_1.RootPart then
        local l_RootPart_0 = l_CameraSubject_1.RootPart;
        return l_RootPart_0.Position.Y - l_RootPart_0.Size.Y / 2 - l_CameraSubject_1.HipHeight;
    else
        return nil;
    end;
end;
v6.UpdateFirstPersonTransform = function(v31, v32, _, v34, v35, v36) --[[ Line: 127 ]] --[[ Name: UpdateFirstPersonTransform ]]
    -- upvalues: l_Players_0 (copy)
    if v31.needsReset then
        v31:StartFadeFromBlack();
        v31.needsReset = false;
    end;
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if (v35 - v36).magnitude > 0.01 then
        v31:StartVREdgeBlur(l_LocalPlayer_1);
    end;
    local l_p_0 = v34.p;
    local l_v31_CameraLookVector_0 = v31:GetCameraLookVector();
    l_v31_CameraLookVector_0 = Vector3.new(l_v31_CameraLookVector_0.X, 0, l_v31_CameraLookVector_0.Z).Unit;
    local v40 = v31:getRotation(v32);
    local v41 = v31:CalculateNewLookVectorFromArg(l_v31_CameraLookVector_0, Vector2.new(v40, 0));
    return CFrame.new(l_p_0 - 0.5 * v41, l_p_0), v34;
end;
v6.UpdateImmersionCamera = function(v42, v43, v44, _, _, v47) --[[ Line: 153 ]] --[[ Name: UpdateImmersionCamera ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_v42_SubjectCFrame_0 = v42:GetSubjectCFrame();
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local l_Character_0 = l_Players_0.LocalPlayer.Character;
    local l_v42_Humanoid_0 = v42:GetHumanoid();
    if not l_v42_Humanoid_0 then
        return l_CurrentCamera_1.CFrame, l_CurrentCamera_1.Focus;
    else
        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return l_CurrentCamera_1.CFrame, l_CurrentCamera_1.Focus;
        else
            v42.characterOrientation = l_HumanoidRootPart_0:FindFirstChild("CharacterAlignOrientation");
            if not v42.characterOrientation then
                local l_RootAttachment_0 = l_HumanoidRootPart_0:FindFirstChild("RootAttachment");
                if not l_RootAttachment_0 then
                    return;
                else
                    v42.characterOrientation = Instance.new("AlignOrientation");
                    v42.characterOrientation.Name = "CharacterAlignOrientation";
                    v42.characterOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment;
                    v42.characterOrientation.Attachment0 = l_RootAttachment_0;
                    v42.characterOrientation.RigidityEnabled = true;
                    v42.characterOrientation.Parent = l_HumanoidRootPart_0;
                end;
            end;
            if v42.characterOrientation.Enabled == false then
                v42.characterOrientation.Enabled = true;
            end;
            if v42.needsReset then
                v42.needsReset = false;
                v42.savedAutoRotate = l_v42_Humanoid_0.AutoRotate;
                l_v42_Humanoid_0.AutoRotate = false;
                if v42.NoRecenter then
                    v42.NoRecenter = false;
                    l_VRService_0:RecenterUserHeadCFrame();
                end;
                v42:StartFadeFromBlack();
                v44 = l_v42_SubjectCFrame_0;
            elseif l_v42_Humanoid_0.Sit then
                v44 = l_v42_SubjectCFrame_0;
                if (v44.Position - l_CurrentCamera_1.CFrame.Position).Magnitude > 0.01 then
                    v42:StartVREdgeBlur(l_Players_0.LocalPlayer);
                end;
            else
                local l_EstimatedVRTorsoFrame_0 = v42.controlModule:GetEstimatedVRTorsoFrame();
                v42.characterOrientation.CFrame = l_CurrentCamera_1.CFrame * l_EstimatedVRTorsoFrame_0;
                if v42.controlModule.inputMoveVector.Magnitude > 0 then
                    v42.motionDetTime = 0.1;
                end;
                if v42.controlModule.inputMoveVector.Magnitude > 0 or v42.motionDetTime > 0 then
                    v42.motionDetTime = v42.motionDetTime - v43;
                    v42:StartVREdgeBlur(l_Players_0.LocalPlayer);
                    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                    l_l_VRService_0_UserCFrame_0 = l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_1.HeadScale;
                    local l_HumanoidRootPart_1 = l_Character_0.HumanoidRootPart;
                    local v57 = -0.7 * l_HumanoidRootPart_1.Size.Y / 2;
                    local v58 = l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_0 * CFrame.new(0, v57, 0);
                    local l_LookVector_0 = l_HumanoidRootPart_1.CFrame.LookVector;
                    local v60 = v47 - (v58 - Vector3.new(l_LookVector_0.X, 0, l_LookVector_0.Z).Unit * l_HumanoidRootPart_1.Size.Y * 0.125).Position + l_CurrentCamera_1.CFrame.Position;
                    v60 = Vector3.new(v60.X, v47.Y, v60.Z);
                    v44 = l_CurrentCamera_1.CFrame.Rotation + v60;
                else
                    v44 = l_CurrentCamera_1.CFrame.Rotation + Vector3.new(l_CurrentCamera_1.CFrame.Position.X, v47.Y, l_CurrentCamera_1.CFrame.Position.Z);
                end;
                local v61 = v42:getRotation(v43);
                if math.abs(v61) > 0 then
                    local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                    l_l_VRService_0_UserCFrame_1 = l_l_VRService_0_UserCFrame_1.Rotation + l_l_VRService_0_UserCFrame_1.Position * l_CurrentCamera_1.HeadScale;
                    local v63 = v44 * l_l_VRService_0_UserCFrame_1;
                    v44 = CFrame.new(v63.Position) * CFrame.Angles(0, -math.rad(v61 * 90), 0) * v63.Rotation * l_l_VRService_0_UserCFrame_1:Inverse();
                end;
            end;
            return v44, v44 * CFrame.new(0, 0, -0.5);
        end;
    end;
end;
v6.UpdateThirdPersonComfortTransform = function(v64, v65, v66, v67, v68, v69) --[[ Line: 265 ]] --[[ Name: UpdateThirdPersonComfortTransform ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_v64_CameraToSubjectDistance_0 = v64:GetCameraToSubjectDistance();
    if l_v64_CameraToSubjectDistance_0 < 0.5 then
        l_v64_CameraToSubjectDistance_0 = 0.5;
    end;
    if v68 ~= nil and v64.lastCameraFocus ~= nil then
        local _ = l_Players_0.LocalPlayer;
        local v72 = v68 - v69;
        local l_MoveVector_0 = v64.controlModule:GetMoveVector();
        local v74 = true;
        if v72.magnitude <= 0.01 then
            v74 = l_MoveVector_0.magnitude > 0.01;
        end;
        if v74 then
            v64.motionDetTime = 0.1;
        end;
        v64.motionDetTime = v64.motionDetTime - v65;
        if v64.motionDetTime > 0 then
            v74 = true;
        end;
        if v74 and not v64.needsReset then
            v67 = v64.lastCameraFocus;
            v64.VRCameraFocusFrozen = true;
            return v66, v67;
        else
            local v75 = true;
            if v64.lastCameraResetPosition ~= nil then
                v75 = (v69 - v64.lastCameraResetPosition).Magnitude > 1;
            end;
            local v76 = v64:getRotation(v65);
            if math.abs(v76) > 0 then
                local v77 = v67:ToObjectSpace(v66);
                v66 = v67 * CFrame.Angles(0, -v76, 0) * v77;
            end;
            if v64.VRCameraFocusFrozen and v75 or v64.needsReset then
                l_VRService_0:RecenterUserHeadCFrame();
                v64.VRCameraFocusFrozen = false;
                v64.needsReset = false;
                v64.lastCameraResetPosition = v69;
                v64:ResetZoom();
                v64:StartFadeFromBlack();
                local l_v64_Humanoid_0 = v64:GetHumanoid();
                local v79 = l_v64_Humanoid_0.Torso and l_v64_Humanoid_0.Torso.CFrame.lookVector or Vector3.new(1, 0, 0, 0);
                local v80 = Vector3.new(v79.X, 0, v79.Z);
                local v81 = v67.Position - v80 * l_v64_CameraToSubjectDistance_0;
                local v82 = Vector3.new(v67.Position.X, v81.Y, v67.Position.Z);
                v66 = CFrame.new(v81, v82);
            end;
        end;
    end;
    return v66, v67;
end;
v6.UpdateThirdPersonFollowTransform = function(v83, v84, v85, v86, v87, v88) --[[ Line: 332 ]] --[[ Name: UpdateThirdPersonFollowTransform ]]
    -- upvalues: l_VRService_0 (copy), l_Players_0 (copy)
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local l_v83_CameraToSubjectDistance_0 = v83:GetCameraToSubjectDistance();
    local l_v83_VRFocus_0 = v83:GetVRFocus(v88, v84);
    if v83.needsReset then
        v83.needsReset = false;
        l_VRService_0:RecenterUserHeadCFrame();
        v83:ResetZoom();
        v83:StartFadeFromBlack();
    end;
    if v83.recentered then
        local l_v83_SubjectCFrame_0 = v83:GetSubjectCFrame();
        if not l_v83_SubjectCFrame_0 then
            return l_CurrentCamera_2.CFrame, l_CurrentCamera_2.Focus;
        else
            v85 = l_v83_VRFocus_0 * l_v83_SubjectCFrame_0.Rotation * CFrame.new(0, 0, l_v83_CameraToSubjectDistance_0);
            v83.focusOffset = l_v83_VRFocus_0:ToObjectSpace(v85);
            v83.recentered = false;
            return v85, l_v83_VRFocus_0;
        end;
    else
        local v93 = l_v83_VRFocus_0:ToWorldSpace(v83.focusOffset);
        local _ = l_Players_0.LocalPlayer;
        local v95 = v87 - v88;
        local l_controlModule_0 = v83.controlModule;
        local l_l_controlModule_0_MoveVector_0 = l_controlModule_0:GetMoveVector();
        if v95.magnitude > 0.01 or l_l_controlModule_0_MoveVector_0.magnitude > 0 then
            local l_l_controlModule_0_EstimatedVRTorsoFrame_0 = l_controlModule_0:GetEstimatedVRTorsoFrame();
            l_l_controlModule_0_EstimatedVRTorsoFrame_0 = l_l_controlModule_0_EstimatedVRTorsoFrame_0.Rotation + l_l_controlModule_0_EstimatedVRTorsoFrame_0.Position * l_CurrentCamera_2.HeadScale;
            local v99 = l_CurrentCamera_2.CFrame * l_l_controlModule_0_EstimatedVRTorsoFrame_0;
            local l_LookVector_1 = v99.LookVector;
            local v101 = Vector3.new(l_LookVector_1.X, 0, l_LookVector_1.Z).Unit * l_v83_CameraToSubjectDistance_0;
            local v102 = l_v83_VRFocus_0.Position - v101;
            v85 = v93:Lerp(CFrame.new(l_CurrentCamera_2.CFrame.Position + v102 - v99.Position) * v93.Rotation, 0.01);
        else
            v85 = v93;
        end;
        local v103 = v83:getRotation(v84);
        if math.abs(v103) > 0 then
            local v104 = l_v83_VRFocus_0:ToObjectSpace(v85);
            v85 = l_v83_VRFocus_0 * CFrame.Angles(0, -v103, 0) * v104;
        end;
        v83.focusOffset = l_v83_VRFocus_0:ToObjectSpace(v85);
        v86 = v85 * CFrame.new(0, 0, -l_v83_CameraToSubjectDistance_0);
        if (v86.Position - l_CurrentCamera_2.Focus.Position).Magnitude > 0.01 then
            v83:StartVREdgeBlur(l_Players_0.LocalPlayer);
        end;
        return v85, v86;
    end;
end;
v6.LeaveFirstPerson = function(v105) --[[ Line: 410 ]] --[[ Name: LeaveFirstPerson ]]
    -- upvalues: l_VRBaseCamera_0 (copy)
    l_VRBaseCamera_0.LeaveFirstPerson(v105);
    v105.needsReset = true;
    if v105.VRBlur then
        v105.VRBlur.Visible = false;
    end;
    if v105.characterOrientation then
        v105.characterOrientation.Enabled = false;
    end;
    local l_v105_Humanoid_0 = v105:GetHumanoid();
    if l_v105_Humanoid_0 then
        l_v105_Humanoid_0.AutoRotate = v105.savedAutoRotate;
    end;
end;
return v6;