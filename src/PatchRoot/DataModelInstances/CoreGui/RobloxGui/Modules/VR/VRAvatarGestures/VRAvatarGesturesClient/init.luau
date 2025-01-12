local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ConnectionUtil_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).ConnectionUtil;
local v8 = require(l_RobloxGui_0.Modules.Common.AvatarUtil);
local v9 = game:DefineFastFlag("DebugImmersionModeNonVR", false);
local v10 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0);
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_ConnectionUtil_0 (copy), l_VRService_0 (copy)
    local v12 = setmetatable({}, v11);
    v12.partCFrameMap = {};
    v12.connections = l_ConnectionUtil_0.new();
    v12.analyticsSendEnabled = true;
    v12.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 60 ]]
        -- upvalues: v12 (copy)
        v12:onAvatarGesturesChanged();
    end);
    if l_VRService_0.AvatarGestures then
        v12:onAvatarGesturesChanged();
    end;
    return v12;
end;
v11.onCharacterChanged = function(v13, v14) --[[ Line: 65 ]] --[[ Name: onCharacterChanged ]]
    -- upvalues: l_VRService_0 (copy)
    local l_Humanoid_0 = v14:FindFirstChild("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        for _, v17 in pairs({
            "TrackedIKLeftHand", 
            "TrackedIKRightHand", 
            "TrackedIKHead"
        }) do
            local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v17);
            if l_l_Humanoid_0_FirstChild_0 then
                l_l_Humanoid_0_FirstChild_0.SmoothTime = 0;
            end;
        end;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return;
        else
            local function v24(v20) --[[ Line: 86 ]] --[[ Name: updateSeated ]]
                -- upvalues: l_CurrentCamera_0 (copy), l_Humanoid_0 (copy)
                local v21 = l_CurrentCamera_0.CameraSubject and l_CurrentCamera_0.CameraSubject:IsA("VehicleSeat");
                local v22 = (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5;
                local l_TrackedIKHead_0 = l_Humanoid_0:FindFirstChild("TrackedIKHead");
                if l_TrackedIKHead_0 then
                    if v20 and not v21 and v22 then
                        l_TrackedIKHead_0.Type = Enum.IKControlType.Transform;
                        return;
                    else
                        l_TrackedIKHead_0.Type = Enum.IKControlType.Rotation;
                    end;
                end;
            end;
            v24(l_Humanoid_0.Sit);
            v13.connections:connect("Seated", l_Humanoid_0.Seated, function(v25) --[[ Line: 102 ]]
                -- upvalues: v24 (copy), l_CurrentCamera_0 (copy), l_VRService_0 (ref)
                v24(v25);
                if v25 and (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5 then
                    l_VRService_0:RecenterUserHeadCFrame();
                end;
            end);
            return;
        end;
    end;
end;
v11.onAvatarGesturesChanged = function(v26) --[[ Line: 111 ]] --[[ Name: onAvatarGesturesChanged ]]
    -- upvalues: l_VRService_0 (copy), v9 (copy), l_RobloxReplicatedStorage_0 (copy), v8 (copy), l_Players_0 (copy), l_RbxAnalyticsService_0 (copy), v10 (copy)
    if l_VRService_0.AvatarGestures then
        if l_VRService_0.VREnabled or v9 then
            local v27 = l_RobloxReplicatedStorage_0:WaitForChild("AvatarGesturesVRPlayer", 5);
            if not v27 then
                warn("VRService.AvatarGestures failed to connect to server");
                return;
            else
                v27:FireServer(true);
                v26:connectInputCFrames();
                if not v26.avatarUtil then
                    v26.avatarUtil = v8.new();
                    v26.avatarUtil:connectLocalCharacterChanges(function(v28) --[[ Line: 128 ]]
                        -- upvalues: v26 (copy)
                        v26:onCharacterChanged(v28);
                    end);
                elseif l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character then
                    v26:onCharacterChanged(l_Players_0.LocalPlayer.Character);
                end;
                if v26.analyticsSendEnabled then
                    v26.analyticsSendEnabled = nil;
                    l_RbxAnalyticsService_0:ReportInfluxSeries("VRAvatarGestures", {
                        placeId = game.PlaceId, 
                        calledFrom = "ClientJoined"
                    }, v10);
                    return;
                end;
            end;
        end;
    else
        if l_VRService_0.VREnabled or v9 then
            local l_AvatarGesturesVRPlayer_0 = l_RobloxReplicatedStorage_0:FindFirstChild("AvatarGesturesVRPlayer");
            if l_AvatarGesturesVRPlayer_0 then
                l_AvatarGesturesVRPlayer_0:FireServer(false);
            end;
        end;
        v26.connections:disconnectAll();
        v26.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 157 ]]
            -- upvalues: v26 (copy)
            v26:onAvatarGesturesChanged();
        end);
    end;
end;
v11.updateCFrames = function(_, v31, v32) --[[ Line: 161 ]] --[[ Name: updateCFrames ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_Players_0.LocalPlayer then
        return;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_LocalPlayer_0.Character then
            return;
        else
            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v31);
            if not l_l_Character_0_FirstChild_0 then
                return;
            else
                local l_CurrentCamera_1 = workspace.CurrentCamera;
                if not l_CurrentCamera_1 then
                    return;
                elseif not l_l_Character_0_FirstChild_0:FindFirstChild(v31 .. "Attachment") then
                    return;
                else
                    local l_l_l_Character_0_FirstChild_0_FirstChild_0 = l_l_Character_0_FirstChild_0:FindFirstChild(v31 .. "AlignPosition");
                    if not l_l_l_Character_0_FirstChild_0_FirstChild_0 then
                        return;
                    else
                        local l_l_l_Character_0_FirstChild_0_FirstChild_1 = l_l_Character_0_FirstChild_0:FindFirstChild(v31 .. "AlignOrientation");
                        if not l_l_l_Character_0_FirstChild_0_FirstChild_1 then
                            return;
                        else
                            if l_VRService_0.VREnabled then
                                v32 = v32.Rotation + v32.Position * l_CurrentCamera_1.HeadScale;
                                local v39 = l_CurrentCamera_1.CFrame * v32;
                                local l_Head_0 = l_Character_0:FindFirstChild("Head");
                                if (l_CurrentCamera_1.CFrame.Position - l_CurrentCamera_1.Focus.Position).Magnitude > 5 and l_Head_0 then
                                    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                                    l_l_VRService_0_UserCFrame_0 = l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_1.HeadScale;
                                    local v42 = l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_0 * CFrame.new(0, 0, 0.5);
                                    if v31 ~= "TrackedHead" then
                                        local v43 = l_Head_0.CFrame:ToWorldSpace(v42:ToObjectSpace(v39));
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v43.Position;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v43 * CFrame.Angles(1.5707963267948966, 0, 0);
                                    else
                                        local l_CFrame_0 = l_Character_0.PrimaryPart.CFrame;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = (l_CFrame_0 * CFrame.new(0, l_CFrame_0.Position.Y * 0.25, -l_CFrame_0.Position.Y * 0.125)).Position;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = l_CFrame_0 * v32;
                                    end;
                                else
                                    l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v39.Position;
                                    if v31 ~= "TrackedHead" then
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v39 * CFrame.Angles(1.5707963267948966, 0, 0);
                                    else
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v39;
                                    end;
                                end;
                            else
                                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                local v46 = nil;
                                v46 = if v31 ~= "TrackedHead" then l_HumanoidRootPart_0.CFrame * v32 * CFrame.Angles(0, 0, (math.rad(time() * 30))) * CFrame.new(1, 0, -0.5) else l_HumanoidRootPart_0.CFrame * v32;
                                if l_HumanoidRootPart_0 then
                                    l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v46.Position;
                                    l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v46;
                                end;
                            end;
                            l_l_Character_0_FirstChild_0.CFrame = CFrame.new(l_l_l_Character_0_FirstChild_0_FirstChild_0.Position) * l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame.Rotation;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v11.steppedCframes = function(v47) --[[ Line: 253 ]] --[[ Name: steppedCframes ]]
    for v48, v49 in pairs(v47.partCFrameMap) do
        v47:updateCFrames(v48, v49);
    end;
end;
v11.connectInputCFrames = function(v50) --[[ Line: 259 ]] --[[ Name: connectInputCFrames ]]
    -- upvalues: l_VRService_0 (copy), v9 (copy), l_RunService_0 (copy)
    if l_VRService_0.VREnabled then
        v50.connections:connect("UserCFrameChanged", l_VRService_0.UserCFrameChanged, function(v51, v52) --[[ Line: 261 ]]
            -- upvalues: v50 (copy)
            if v51 == Enum.UserCFrame.LeftHand then
                v50.partCFrameMap.TrackedLeftHand = v52;
                return;
            elseif v51 == Enum.UserCFrame.RightHand then
                v50.partCFrameMap.TrackedRightHand = v52;
                return;
            else
                if v51 == Enum.UserCFrame.Head then
                    v50.partCFrameMap.TrackedHead = v52;
                end;
                return;
            end;
        end);
    elseif v9 then
        v50.connections:connect("NonVRSimulateInput", l_RunService_0.RenderStepped, function(_) --[[ Line: 271 ]]
            -- upvalues: v50 (copy)
            v50.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5);
            v50.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5);
            v50.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0);
        end);
    end;
    if l_VRService_0.VREnabled or v9 then
        v50.connections:connect("RenderStepped", l_RunService_0.RenderStepped, function(_) --[[ Line: 279 ]]
            -- upvalues: v50 (copy)
            v50:steppedCframes();
        end);
    end;
end;
return v11.new();