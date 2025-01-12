local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v6 = require(l_script_FirstAncestor_0.VRUtil);
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v8 = game:DefineFastFlag("VRFreeUIPanel", false);
local v9 = game:DefineFastFlag("VRHeadLockedFixUIPosition", false);
local v10 = "Panel3DRenderStep-" .. game:GetService("HttpService"):GenerateGUID();
local v11 = Vector2.new(0, 0);
local v12 = CFrame.new(0, -0.5, -5.5);
local v13 = CFrame.new(0, 0, -3);
local v14 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.141592653589793, 0);
local v15 = nil;
local v16 = nil;
local v17 = 1e999;
local v18 = nil;
local l_v11_0 = v11;
local v20 = {};
local v21 = l_Create_0("ImageLabel")({
    Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
    ImageColor3 = Color3.new(0, 1, 0), 
    BackgroundTransparency = 1, 
    ZIndex = 1000000000
});
local v22 = l_Create_0("Folder")({
    Name = "VRCorePanelParts", 
    Archivable = false
});
local v23 = l_Create_0("Folder")({
    Name = "VRCoreEffectParts", 
    Archivable = false
});
pcall(function() --[[ Line: 60 ]]
    -- upvalues: l_GuiService_0 (copy), v22 (copy), v23 (copy)
    l_GuiService_0.CoreGuiFolder = v22;
    l_GuiService_0.CoreEffectFolder = v23;
end);
local v58 = {
    Type = {
        None = 0, 
        Standard = 1, 
        Fixed = 2, 
        HorizontalFollow = 3, 
        FixedToHead = 4, 
        NewStandard = 5, 
        WristView = 6, 
        PositionLocked = 7, 
        UIManagerManaged = 8
    }, 
    OnPanelClosed = l_Create_0("BindableEvent")({
        Name = "OnPanelClosed"
    }), 
    GetHeadLookXZ = function(v24) --[[ Line: 84 ]] --[[ Name: GetHeadLookXZ ]]
        -- upvalues: l_VRService_0 (copy)
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local l_lookVector_0 = l_l_VRService_0_UserCFrame_0.lookVector;
        local v27 = math.atan2(-l_lookVector_0.Z, l_lookVector_0.X) - 1.5707963267948966;
        local v28 = CFrame.Angles(0, v27, 0);
        if v24 then
            v28 = v28 + l_l_VRService_0_UserCFrame_0.p;
        end;
        return v28;
    end, 
    FindContainerOf = function(v29) --[[ Line: 96 ]] --[[ Name: FindContainerOf ]]
        -- upvalues: v20 (copy)
        for _, v31 in pairs(v20) do
            if v31.gui and v31.gui:IsAncestorOf(v29) then
                return v31;
            else
                for _, v33 in pairs(v31.subpanels) do
                    if v33.gui and v33.gui:IsAncestorOf(v29) then
                        return v31;
                    end;
                end;
            end;
        end;
        return nil;
    end, 
    SetModalPanel = function(v34) --[[ Line: 110 ]] --[[ Name: SetModalPanel ]]
        -- upvalues: v15 (ref), v16 (ref)
        if v15 == v34 then
            return;
        else
            if v15 then
                v15:OnModalChanged(false);
            end;
            if v34 then
                v34:OnModalChanged(true);
            end;
            v16 = v15;
            v15 = v34;
            return;
        end;
    end, 
    RaycastOntoPanel = function(v35, v36, v37, v38) --[[ Line: 124 ]] --[[ Name: RaycastOntoPanel ]]
        -- upvalues: v6 (copy)
        local l_Size_0 = v35.Size;
        local l_Z_0 = l_Size_0.Z;
        local l_X_0 = l_Size_0.X;
        local l_Y_0 = l_Size_0.Y;
        local l_v35_RenderCFrame_0 = v35:GetRenderCFrame();
        local l_lookVector_1 = l_v35_RenderCFrame_0.lookVector;
        local v45 = l_v35_RenderCFrame_0.p + l_lookVector_1 * l_Z_0 * 0.5;
        local v46 = v6.RayPlaneIntersection(v38, l_lookVector_1, v45);
        if v46 then
            local l_X_1 = v36.AbsoluteSize.X;
            local l_Y_1 = v36.AbsoluteSize.Y;
            local v49 = l_v35_RenderCFrame_0:pointToObjectSpace(v46) * Vector3.new(-1, 1, 1, 0) + Vector3.new(l_X_0 / 2, -l_Y_0 / 2, 0);
            local v50 = Vector2.new(v49.X / l_X_0 * l_X_1, v49.Y / l_Y_0 * -l_Y_1);
            local l_X_2 = v50.X;
            local l_Y_2 = v50.Y;
            local l_X_3 = v37.AbsolutePosition.X;
            local l_Y_3 = v37.AbsolutePosition.Y;
            local l_X_4 = v37.AbsoluteSize.X;
            local l_Y_4 = v37.AbsoluteSize.Y;
            local v57 = false;
            if v36.Enabled and l_X_3 <= l_X_2 and l_X_2 <= l_X_3 + l_X_4 and l_Y_3 <= l_Y_2 and l_Y_2 <= l_Y_3 + l_Y_4 then
                v57 = true;
            end;
            return v46, v49, v50, v57;
        else
            return nil, nil, nil, false;
        end;
    end
};
local v59 = {};
v59.__index = v59;
v59.new = function(v60) --[[ Line: 172 ]] --[[ Name: new ]]
    -- upvalues: v58 (copy), v20 (copy), v59 (copy)
    local v61 = {
        name = v60, 
        part = false, 
        gui = false, 
        width = 1, 
        height = 1, 
        isVisible = false, 
        isEnabled = false, 
        panelType = v58.Type.None, 
        pixelScale = 1, 
        showCursor = true, 
        canFade = true, 
        shouldFindLookAtGuiElement = false, 
        ignoreModal = false, 
        needsPositionUpdate = false, 
        alwaysUpdatePosition = false, 
        linkedTo = false, 
        subpanels = {}, 
        transparency = 0, 
        forceShowUntilLookedAt = false, 
        forceShowUntilTick = 0, 
        isLookedAt = false, 
        isWristHeldUp = false, 
        isOffscreen = true, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookAtDistance = 1e999, 
        lookAtGuiElement = false, 
        isClosest = true, 
        localCF = CFrame.new(), 
        originCF = CFrame.new(), 
        angleFromHorizon = false, 
        angleFromForward = false, 
        distance = 0, 
        lerpTime = 0, 
        lerpInitialCF = nil, 
        lerpScaleSize = Vector2.new(0, 0), 
        lerpInitialSize = Vector2.new(0, 0), 
        FollowView = true, 
        LastFollowCF = nil, 
        LastCameraPos = Vector3.new(0, 0, 0, 0), 
        followYawView = CFrame.new(), 
        userHeadRecentered = false, 
        lastHeadYaw = 0, 
        wristTargetPosition = Vector3.new()
    };
    if v20[v60] then
        error("A panel by the name of " .. v60 .. " already exists.");
    end;
    v20[v60] = v61;
    return (setmetatable(v61, v59));
end;
v59.GetPart = function(v62) --[[ Line: 239 ]] --[[ Name: GetPart ]]
    -- upvalues: l_Create_0 (copy), v22 (copy)
    if not v62.part then
        v62.part = l_Create_0("Part")({
            Name = v62.name, 
            Parent = v22, 
            Transparency = 1, 
            CanCollide = false, 
            CanTouch = false, 
            Anchored = true, 
            Size = Vector3.new(1, 1, 0.20000000298023224, 0)
        });
    end;
    return v62.part;
end;
v59.GetGUI = function(v63) --[[ Line: 257 ]] --[[ Name: GetGUI ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    if not v63.gui then
        local l_v63_Part_0 = v63:GetPart();
        v63.gui = l_Create_0("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Name = v63.name, 
            Archivable = false, 
            Adornee = l_v63_Part_0, 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v63.CanvasSize or Vector2.new(1000, 1000), 
            Enabled = v63.isEnabled, 
            AlwaysOnTop = true
        });
    end;
    return v63.gui;
end;
v59.FindHoveredGuiElement = function(v65, v66) --[[ Line: 275 ]] --[[ Name: FindHoveredGuiElement ]]
    local l_X_5 = v65.lookAtPixel.X;
    local l_Y_5 = v65.lookAtPixel.Y;
    for v69, v70 in pairs(v66) do
        local l_AbsolutePosition_0 = v70.AbsolutePosition;
        local v72 = v70.AbsolutePosition + v70.AbsoluteSize;
        if l_AbsolutePosition_0.X <= l_X_5 and l_X_5 <= v72.X and l_AbsolutePosition_0.Y <= l_Y_5 and l_Y_5 <= v72.Y then
            return v70, v69;
        end;
    end;
end;
v59.SetPartCFrame = function(v73, v74) --[[ Line: 289 ]] --[[ Name: SetPartCFrame ]]
    -- upvalues: v14 (copy)
    v73:GetPart().CFrame = v74 * v14;
end;
v59.SetEnabled = function(v75, v76) --[[ Line: 293 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v22 (copy)
    if v75.isEnabled == v76 then
        return;
    else
        v75.isEnabled = v76;
        if v76 then
            v75:GetPart().Parent = v22;
            v75:GetGUI().Enabled = true;
            for _, v78 in pairs(v75.subpanels) do
                v78:SetEnabled(v78:GetEnabled());
            end;
        else
            v75:GetPart().Parent = nil;
            v75:GetGUI().Enabled = false;
            for _, v80 in pairs(v75.subpanels) do
                v80:SetEnabled(v80:GetEnabled());
            end;
        end;
        v75:OnEnabled(v76);
        return;
    end;
end;
v59.StartLerp = function(v81, v82) --[[ Line: 316 ]] --[[ Name: StartLerp ]]
    -- upvalues: v58 (copy)
    if v81.panelType == v58.Type.UIManagerManaged then
        return;
    else
        v81.lerpInitialCF = v81:GetPart().CFrame * CFrame.new(0, -1.5, 0);
        v81.lerpTime = 1;
        v81.lerpInitialSize = Vector2.new(v81.width, v81.height);
        v81.lerpScaleSize = v82 and v82 or Vector2.new(0, 0);
        return;
    end;
end;
v59.EvaluatePositioning = function(v83, v84, v85, v86, v87) --[[ Line: 327 ]] --[[ Name: EvaluatePositioning ]]
    -- upvalues: v58 (copy), v12 (copy), l_VRService_0 (copy), v13 (copy), v6 (copy), v8 (copy), v9 (copy)
    if v83.panelType == v58.Type.UIManagerManaged then
        return;
    else
        if v83.panelType == v58.Type.Fixed then
            v83:SetPartCFrame(v84 * (v83.localCF - v83.localCF.p + v83.localCF.p * workspace.CurrentCamera.HeadScale));
        elseif v83.panelType == v58.Type.HorizontalFollow then
            local l_lookVector_2 = v86.lookVector;
            v83:SetPartCFrame(v84 * (CFrame.new(v86.p, v86.p + l_lookVector_2 * Vector3.new(1, 0, 1, 0)) * v83.angleFromForward * v83.angleFromHorizon * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -v83.distance)));
        elseif v83.panelType == v58.Type.FixedToHead then
            v83:SetPartCFrame(v85 * (v83.localCF - v83.localCF.p + v83.localCF.p * workspace.CurrentCamera.HeadScale));
        elseif v83.panelType == v58.Type.Standard then
            if v83.needsPositionUpdate or v83.alwaysUpdatePosition then
                v83.needsPositionUpdate = false;
                local v89 = v58.GetHeadLookXZ(true);
                local v90 = v12.Position * workspace.CurrentCamera.HeadScale;
                v83.originCF = v89 * CFrame.new(v90);
            end;
            v83:SetPartCFrame(v84 * v83.originCF * v83.localCF);
        elseif v83.panelType == v58.Type.NewStandard then
            if v83.needsPositionUpdate or v83.alwaysUpdatePosition then
                v83.needsPositionUpdate = false;
                local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local v92 = v13.Position * workspace.CurrentCamera.HeadScale;
                v83.originCF = l_l_VRService_0_UserCFrame_1 * CFrame.new(v92);
            end;
            v83:SetPartCFrame(v84 * v83.originCF * v83.localCF);
        elseif v83.panelType == v58.Type.WristView then
            if l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
                if v83.needsPositionUpdate or v83.alwaysUpdatePosition then
                    v83.needsPositionUpdate = false;
                    local v93 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale;
                    v83.originCF = CFrame.new(v93);
                end;
                local v94 = v84 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local l_Position_0 = (v84 * v83.originCF).Position;
                if v83.distance > 0 then
                    l_Position_0 = Vector3.new(l_Position_0.x, v94.Position.y - 0.33, l_Position_0.z);
                    local v96 = math.clamp((l_Position_0 - v94.Position).Magnitude, v83.distance - 0.5, v83.distance + 0.5);
                    local v97 = (l_Position_0 - v94.Position).Unit * v96;
                    l_Position_0 = v94.Position + v97;
                end;
                local v98 = Vector3.new(v94.Position.x, l_Position_0.y, v94.Position.z);
                local v99 = CFrame.new(l_Position_0, v98);
                v83:GetPart().CFrame = v99;
            else
                v83:SetPartCFrame(v84 * (v83.localCF - v83.localCF.p + v83.localCF.p * workspace.CurrentCamera.HeadScale));
            end;
        elseif v83.panelType == v58.Type.PositionLocked then
            local v100 = v6.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            if v8 then
                local v101 = nil;
                if v9 and not workspace.CurrentCamera.HeadLocked then
                    v101 = v84 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse();
                    v101 = v101 - v101.p;
                else
                    v101 = v84 - v84.p;
                end;
                local _, v103, _ = (v100 * v101:Inverse()):ToEulerAnglesYXZ();
                local v105 = CFrame.fromEulerAnglesYXZ(0, v103, 0);
                if v83.userHeadRecentered then
                    local v106 = v103 - v83.lastHeadYaw;
                    local _, v108, _ = v83.followYawView:ToEulerAnglesYXZ();
                    v108 = v108 + v106;
                    v83.followYawView = CFrame.fromEulerAnglesYXZ(0, v108, 0);
                    v83.userHeadRecentered = false;
                end;
                if v83.followYawView.LookVector:Dot(v105.LookVector) < 0.85 then
                    v83.FollowView = true;
                elseif v83.followYawView.LookVector:Dot(v105.LookVector) > 0.99 then
                    v83.FollowView = false;
                end;
                if v83.FollowView then
                    v83.followYawView = v83.followYawView:Lerp(v105, v87 * 3);
                end;
                local v110 = v101 * v83.followYawView;
                local v111 = v110 + (v100.Position + v110.LookVector * (v83.distance * workspace.CurrentCamera.HeadScale) - v110.UpVector * (0.5 * workspace.CurrentCamera.HeadScale));
                v83:SetPartCFrame(v111);
                v83.LastFollowCF = v111;
                v83.lastHeadYaw = v103;
            else
                if not v83.LastFollowCF then
                    v83.LastFollowCF = v100;
                end;
                if (v83.LastCameraPos - v84.Position).Magnitude > 0.1 then
                    v83.LastFollowCF = v100;
                end;
                v83.LastCameraPos = v84.Position;
                if v83.LastFollowCF.LookVector:Dot(v100.LookVector) < 0.85 then
                    v83.FollowView = true;
                elseif v83.LastFollowCF.LookVector:Dot(v100.LookVector) > 0.99 then
                    v83.FollowView = false;
                end;
                if v83.FollowView then
                    v83.LastFollowCF = v83.LastFollowCF:Lerp(v100, 0.1);
                end;
                local v112 = v100.Position + v83.LastFollowCF.LookVector * (v83.distance * workspace.CurrentCamera.HeadScale + 0.1);
                v112 = Vector3.new(v112.X, v100.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, v112.Z);
                local v113 = Vector3.new(v100.Position.x, v112.y, v100.Position.z);
                local v114 = CFrame.new(v112, v113);
                v83:GetPart().CFrame = v114;
            end;
        end;
        if v83.lerpInitialCF and v83.lerpTime > 0 then
            local l_CFrame_0 = v83:GetPart().CFrame;
            v83.lerpTime = v83.lerpTime - v87 * 4;
            local v116 = math.clamp(1 - v83.lerpTime, 0, 1);
            l_CFrame_0 = v83.lerpInitialCF:Lerp(l_CFrame_0, v116);
            v83:GetPart().CFrame = l_CFrame_0;
            if v83.lerpScaleSize.x > 0 or v83.lerpScaleSize.y > 0 then
                local v117 = v83.lerpInitialSize:Lerp(v83.lerpScaleSize, v116);
                v83:ResizeStuds(v117.x, v117.y, v83.pixelsPerStud);
            end;
        end;
        return;
    end;
end;
v59.OnRecentered = function(v118) --[[ Line: 514 ]] --[[ Name: OnRecentered ]]
    v118.userHeadRecentered = true;
end;
v59.SetLookedAt = function(v119, v120) --[[ Line: 518 ]] --[[ Name: SetLookedAt ]]
    if not v119.isLookedAt and v120 then
        v119.isLookedAt = true;
        v119:OnMouseEnter(v119.lookAtPixel.X, v119.lookAtPixel.Y);
        if v119.forceShowUntilLookedAt then
            v119.forceShowUntilLookedAt = false;
            return;
        end;
    elseif v119.isLookedAt and not v120 then
        v119.isLookedAt = false;
        v119:OnMouseLeave(v119.lookAtPixel.X, v119.lookAtPixel.Y);
    end;
end;
v59.EvaluateGaze = function(v121, v122, v123, _, _, v126) --[[ Line: 531 ]] --[[ Name: EvaluateGaze ]]
    -- upvalues: v11 (copy), v58 (copy), l_v11_0 (ref), v18 (ref), l_VRService_0 (copy), v17 (ref)
    v121.isClosest = false;
    v121.lookAtPixel = v11;
    v121.lookAtDistance = 1e999;
    local v127 = nil;
    local v128 = 0;
    for _, v130 in pairs(v121.subpanels) do
        if v130.part and v130.guiElement then
            local v131, _, v133, v134 = v58.RaycastOntoPanel(v130.part, v130.gui, v130.guiElement, v126);
            if v131 then
                v130.lookAtPixel = v133;
                v130.cursorPos = v133;
                if v134 and v128 < v130.depthOffset then
                    v127 = v130;
                    v128 = v130.depthOffset;
                end;
            end;
        end;
    end;
    if v127 and v127.depthOffset > 0 then
        l_v11_0 = v127.cursorPos;
        v18 = v127;
        for _, v136 in pairs(v121.subpanels) do
            if v136 ~= v127 then
                v136:SetLookedAt(false);
            end;
        end;
        v127:SetLookedAt(true);
    end;
    if v121.panelType == v58.Type.WristView then
        v121.isWristHeldUp = false;
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local v138 = l_l_VRService_0_UserCFrame_2.Position * workspace.CurrentCamera.HeadScale;
        local v139 = v122 * CFrame.new(v138);
        if v121.distance == 0 then
            local v140 = v122 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            local l_Position_1 = v139.Position;
            l_Position_1 = Vector3.new(l_Position_1.x, v140.Position.y - 0.33, l_Position_1.z);
            local v142 = math.clamp((l_Position_1 - v140.Position).Magnitude, 0.5, 1);
            local v143 = (l_Position_1 - v140.Position).Unit * v142;
            v121.isWristHeldUp = (v140.Position + v143 - v139.Position).Magnitude < 0.25;
        else
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
            local v145 = l_l_VRService_0_UserCFrame_2.Position - l_l_VRService_0_UserCFrame_3.Position;
            local v146 = l_l_VRService_0_UserCFrame_3.LookVector:Dot(v145);
            local v147 = l_l_VRService_0_UserCFrame_3.Position + l_l_VRService_0_UserCFrame_3.LookVector * v146;
            if (l_l_VRService_0_UserCFrame_2.Position - v147).Magnitude < 0.5 then
                v121.isWristHeldUp = true;
            end;
        end;
    end;
    local l_v121_GUI_0 = v121:GetGUI();
    local v149, _, v151, v152 = v58.RaycastOntoPanel(v121:GetPart(), l_v121_GUI_0, l_v121_GUI_0, v126);
    if v149 then
        v121.isOffscreen = false;
        v121.lookAtPixel = v151;
        v121.cursorPos = v151;
        v121:SetLookedAt(v152);
        v121.lookAtDistance = (v149 - v123.p).magnitude;
        if v121.isLookedAt and v121.lookAtDistance < v17 and v121.showCursor then
            v17 = v121.lookAtDistance;
            v18 = v121;
            if not v127 then
                l_v11_0 = v121.cursorPos;
                return;
            end;
        end;
    else
        v121.isOffscreen = true;
        if v121.lookedAt then
            v121.lookedAt = false;
            v121:OnMouseLeave(v121.lookAtPixel.X, v121.lookAtPixel.Y);
        end;
    end;
end;
v59.EvaluateTransparency = function(v153) --[[ Line: 637 ]] --[[ Name: EvaluateTransparency ]]
    -- upvalues: v58 (copy)
    if v153.panelType == v58.Type.UIManagerManaged then
        v153.transparency = 0;
        return;
    elseif v153.forceShowUntilLookedAt or not v153.canFade or v153.forceShowUntilTick > tick() then
        v153.transparency = 0;
        return;
    elseif v153.isLookedAt then
        v153.transparency = 0;
        return;
    elseif v153.isOffscreen then
        v153.transparency = 1;
        return;
    else
        v153.transparency = v153:CalculateTransparency();
        return;
    end;
end;
v59.Update = function(v154, v155, v156, v157, v158, v159, v160) --[[ Line: 663 ]] --[[ Name: Update ]]
    -- upvalues: v15 (ref)
    if (v154.forceShowUntilLookedAt or v154.forceShowUntilTick > tick()) and not v154.part then
        v154:GetPart();
        v154:GetGUI();
    end;
    if not v154.part then
        return;
    else
        local v161 = v15 == v154 or v154.linkedTo and v154.linkedTo == v15;
        if v15 and not v161 then
            v154:SetEnabled(false);
            return;
        else
            v154:PreUpdate(v155, v156, v157, v158, v160);
            if v154.isVisible then
                v154:EvaluatePositioning(v155, v156, v157, v160);
                for _, v163 in pairs(v154.subpanels) do
                    v163:Update();
                end;
                v154:EvaluateGaze(v155, v156, v157, v158, v159);
                v154:EvaluateTransparency(v155, v156);
                return;
            else
                if v154.alwaysUpdatePosition then
                    v154:EvaluatePositioning(v155, v156, v157, v160);
                end;
                return;
            end;
        end;
    end;
end;
v59.PreUpdate = function(_, _, _, _, _, _) --[[ Line: 700 ]] --[[ Name: PreUpdate ]]

end;
v59.OnUpdate = function(_, _) --[[ Line: 703 ]] --[[ Name: OnUpdate ]]

end;
v59.OnMouseEnter = function(_, _, _) --[[ Line: 706 ]] --[[ Name: OnMouseEnter ]]

end;
v59.OnMouseLeave = function(_, _, _) --[[ Line: 709 ]] --[[ Name: OnMouseLeave ]]

end;
v59.OnEnabled = function(_, _) --[[ Line: 712 ]] --[[ Name: OnEnabled ]]

end;
v59.OnModalChanged = function(_, _) --[[ Line: 715 ]] --[[ Name: OnModalChanged ]]

end;
v59.OnVisibilityChanged = function(_, _) --[[ Line: 718 ]] --[[ Name: OnVisibilityChanged ]]

end;
v59.CalculateTransparency = function(v184) --[[ Line: 721 ]] --[[ Name: CalculateTransparency ]]
    if not v184.canFade then
        return 0;
    else
        local l_X_6 = v184.gui.AbsoluteSize.X;
        local l_Y_6 = v184.gui.AbsoluteSize.Y;
        local l_X_7 = v184.lookAtPixel.X;
        local l_Y_7 = v184.lookAtPixel.Y;
        local v189 = l_X_7 < 0 and -l_X_7 or l_X_7 - l_X_6;
        local v190 = l_Y_7 < 0 and -l_Y_7 or l_Y_7 - l_Y_6;
        if l_X_7 > 0 and l_X_7 < l_X_6 then
            v189 = 0;
        end;
        if l_Y_7 > 0 and l_Y_7 < l_Y_6 then
            v190 = 0;
        end;
        return (math.max(0, (math.min(1, (math.sqrt(v189 ^ 2 + v190 ^ 2) - 10) / 20))));
    end;
end;
v59.ResizeStuds = function(v191, v192, v193, v194) --[[ Line: 751 ]] --[[ Name: ResizeStuds ]]
    -- upvalues: v58 (copy)
    if v191.panelType == v58.Type.UIManagerManaged then
        return;
    else
        v194 = v194 or 64;
        v191.width = v192;
        v191.height = v193;
        v191.pixelScale = v194 / 64;
        local l_v191_Part_0 = v191:GetPart();
        l_v191_Part_0.Size = Vector3.new(v191.width * workspace.CurrentCamera.HeadScale, v191.height * workspace.CurrentCamera.HeadScale, 0.2);
        local l_v191_GUI_0 = v191:GetGUI();
        l_v191_GUI_0.CanvasSize = Vector2.new(v194 * v191.width, v194 * v191.height);
        for _, v198 in pairs(v191.subpanels) do
            if v198.part then
                v198.part.Size = l_v191_Part_0.Size;
            end;
            if v198.gui then
                v198.gui.CanvasSize = l_v191_GUI_0.CanvasSize;
            end;
        end;
        return;
    end;
end;
v59.ResizePixels = function(v199, v200, v201, v202) --[[ Line: 782 ]] --[[ Name: ResizePixels ]]
    v202 = v202 or 64;
    v199:ResizeStuds(v200 / v202, v201 / v202, v202);
end;
v59.OnHeadScaleChanged = function(v203) --[[ Line: 790 ]] --[[ Name: OnHeadScaleChanged ]]
    local v204 = v203.pixelScale * 64;
    v203:ResizeStuds(v203.width, v203.height, v204);
end;
v59.SetType = function(v205, v206, v207) --[[ Line: 795 ]] --[[ Name: SetType ]]
    -- upvalues: v58 (copy)
    v205.panelType = v206;
    v205.localCF = CFrame.new();
    v205.angleFromHorizon = false;
    v205.angleFromForward = false;
    v205.distance = 0;
    if not v207 then
        v207 = {};
    end;
    if v206 == v58.Type.None then
        return;
    elseif v206 == v58.Type.Standard then
        v205.localCF = v207.CFrame or CFrame.new();
        return;
    elseif v206 == v58.Type.Fixed then
        v205.localCF = v207.CFrame or CFrame.new();
        return;
    elseif v206 == v58.Type.HorizontalFollow then
        v205.angleFromHorizon = CFrame.Angles(v207.angleFromHorizon or 0, 0, 0);
        v205.angleFromForward = CFrame.Angles(0, v207.angleFromForward or 0, 0);
        v205.distance = v207.distance or 5;
        return;
    elseif v206 == v58.Type.FixedToHead then
        v205.localCF = v207.CFrame or CFrame.new();
        return;
    elseif v206 == v58.Type.NewStandard then
        v205.localCF = v207.CFrame or CFrame.new();
        return;
    elseif v206 == v58.Type.WristView then
        v205.localCF = v207.CFrame or CFrame.new();
        v205.distance = 0;
        return;
    elseif v206 == v58.Type.PositionLocked then
        v205.localCF = v207.CFrame or CFrame.new();
        return;
    elseif v206 == v58.Type.UIManagerManaged then
        v205.part = v207.uiManagerPanelPart;
        return;
    else
        error("Invalid Panel type");
        return;
    end;
end;
v59.IsUIManagerManagedType = function(v208) --[[ Line: 837 ]] --[[ Name: IsUIManagerManagedType ]]
    -- upvalues: v58 (copy)
    return v208.panelType == v58.Type.UIManagerManaged;
end;
v59.IsPositionLockedType = function(v209) --[[ Line: 841 ]] --[[ Name: IsPositionLockedType ]]
    -- upvalues: v58 (copy)
    return v209.panelType == v58.Type.PositionLocked;
end;
v59.SetVisible = function(v210, v211, v212) --[[ Line: 845 ]] --[[ Name: SetVisible ]]
    -- upvalues: v58 (copy), l_VRService_0 (copy), v13 (copy), v15 (ref), v16 (ref)
    if v211 ~= v210.isVisible then
        v210:OnVisibilityChanged(v211);
        if not v211 then
            v58.OnPanelClosed:Fire(v210.name);
        else
            v210.needsPositionUpdate = true;
            if v210.panelType == v58.Type.WristView then
                v210.originCF = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head) * v13;
            end;
        end;
    end;
    v210.isVisible = v211;
    v210:SetEnabled(v211);
    if v211 and v212 then
        v58.SetModalPanel(v210);
    end;
    if not v211 and v15 == v210 then
        if v212 then
            v58.SetModalPanel(v16);
        else
            v58.SetModalPanel(nil);
            if v16 == v210 then
                v16 = nil;
            end;
        end;
    end;
    if not v211 and v210.forceShowUntilLookedAt then
        v210.forceShowUntilLookedAt = false;
    end;
end;
v59.IsVisible = function(v213) --[[ Line: 885 ]] --[[ Name: IsVisible ]]
    return v213.isVisible;
end;
v59.LinkTo = function(v214, v215) --[[ Line: 889 ]] --[[ Name: LinkTo ]]
    -- upvalues: v58 (copy)
    if type(v215) == "string" then
        v214.linkedTo = v58.Get(v215);
        return;
    else
        v214.linkedTo = v215;
        return;
    end;
end;
v59.ForceShowUntilLookedAt = function(v216, v217) --[[ Line: 897 ]] --[[ Name: ForceShowUntilLookedAt ]]
    v216:GetPart();
    v216:GetGUI();
    v216:SetVisible(true, v217);
    v216:RequestPositionUpdate();
    v216.forceShowUntilLookedAt = true;
end;
v59.ForceShowForSeconds = function(v218, v219) --[[ Line: 907 ]] --[[ Name: ForceShowForSeconds ]]
    v218:GetPart();
    v218:GetGUI();
    v218:SetVisible(true);
    if v218.forceShowUntilTick < tick() then
        v218:RequestPositionUpdate();
    end;
    v218.forceShowUntilTick = tick() + v219;
end;
v59.SetCanFade = function(v220, v221) --[[ Line: 918 ]] --[[ Name: SetCanFade ]]
    v220.canFade = v221;
end;
v59.RequestPositionUpdate = function(v222) --[[ Line: 922 ]] --[[ Name: RequestPositionUpdate ]]
    v222.needsPositionUpdate = true;
end;
v59.ForcePositionUpdate = function(v223, v224) --[[ Line: 926 ]] --[[ Name: ForcePositionUpdate ]]
    v223.alwaysUpdatePosition = v224;
end;
v59.GetGuiPositionInPanelSpace = function(v225, v226) --[[ Line: 930 ]] --[[ Name: GetGuiPositionInPanelSpace ]]
    local v227 = Vector2.new(v225.part.Size.X, v225.part.Size.Y);
    local l_AbsoluteSize_0 = v225.gui.AbsoluteSize;
    local v229 = (v226 - l_AbsoluteSize_0 / 2) / l_AbsoluteSize_0 * v227;
    return (Vector3.new(v229.X, v229.Y, 0.1));
end;
v59.GetCFrameInCameraSpace = function(v230) --[[ Line: 941 ]] --[[ Name: GetCFrameInCameraSpace ]]
    -- upvalues: v58 (copy)
    if v230.panelType == v58.Type.Standard or v230.panelType == v58.Type.NewStandard then
        return v230.originCF * v230.localCF;
    else
        return v230.localCF or CFrame.new();
    end;
end;
local v231 = {};
v231.__index = v231;
v231.new = function(v232, v233) --[[ Line: 952 ]] --[[ Name: new ]]
    -- upvalues: v231 (copy)
    local v234 = {
        parentPanel = v232, 
        guiElement = v233, 
        lastParent = v233.Parent, 
        ancestryConn = nil, 
        changedConn = nil, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookedAt = false, 
        isEnabled = true, 
        part = nil, 
        gui = nil, 
        guiSurrogate = nil, 
        depthOffset = 0
    };
    setmetatable(v234, v231);
    v234:GetGUI();
    v234:UpdateSurrogate();
    v234:WatchParent(v234.lastParent);
    v233.Parent = v234.guiSurrogate;
    local function v235(_, v237) --[[ Line: 980 ]] --[[ Name: ancestryCallback ]]
        -- upvalues: v234 (copy), v233 (copy), v235 (copy)
        v234:GetGUI().Enabled = v234.parentPanel:GetGUI():IsAncestorOf(v234.lastParent);
        if not v234:GetGUI().Enabled then
            v234:GetPart().Parent = nil;
        else
            v234:GetPart().Parent = workspace.CurrentCamera;
        end;
        if v237 == v233 then
            v234.ancestryConn:disconnect();
            v234.lastParent = v233.Parent;
            v233.Parent = v234.guiSurrogate;
            v234:WatchParent(v234.lastParent);
            v234.ancestryConn = v233.AncestryChanged:connect(v235);
        end;
    end;
    v234.ancestryConn = v233.AncestryChanged:connect(v235);
    return v234;
end;
v231.Cleanup = function(v238) --[[ Line: 1004 ]] --[[ Name: Cleanup ]]
    v238.guiElement.Parent = v238.lastParent;
    if v238.part then
        v238.part:Destroy();
        v238.part = nil;
    end;
    spawn(function() --[[ Line: 1010 ]]
        -- upvalues: v238 (copy)
        wait();
        if v238.gui then
            v238.gui:Destroy();
            v238.gui = nil;
        end;
    end);
    if v238.ancestryConn then
        v238.ancestryConn:disconnect();
        v238.ancestryConn = nil;
    end;
    if v238.changedConn then
        v238.changedConn:disconnect();
        v238.changedConn = nil;
    end;
    v238.lastParent = nil;
    v238.parentPanel = nil;
    v238.guiElement = nil;
    v238.guiSurrogate = nil;
end;
v231.OnMouseEnter = function(_, _, _) --[[ Line: 1031 ]] --[[ Name: OnMouseEnter ]]

end;
v231.OnMouseLeave = function(_, _, _) --[[ Line: 1032 ]] --[[ Name: OnMouseLeave ]]

end;
v231.SetLookedAt = function(v245, v246) --[[ Line: 1034 ]] --[[ Name: SetLookedAt ]]
    if v246 and not v245.lookedAt then
        v245:OnMouseEnter(v245.lookAtPixel.X, v245.lookAtPixel.Y);
    elseif not v246 and v245.lookedAt then
        v245:OnMouseLeave(v245.lookAtPixel.X, v245.lookAtPixel.Y);
    end;
    v245.lookedAt = v246;
end;
v231.WatchParent = function(v247, v248) --[[ Line: 1043 ]] --[[ Name: WatchParent ]]
    if v247.changedConn then
        v247.changedConn:disconnect();
    end;
    v247.changedConn = v248.Changed:connect(function(v249) --[[ Line: 1047 ]]
        -- upvalues: v247 (copy)
        if v249 == "AbsolutePosition" or v249 == "AbsoluteSize" or v249 == "Parent" then
            v247:UpdateSurrogate();
        end;
    end);
end;
v231.UpdateSurrogate = function(v250) --[[ Line: 1054 ]] --[[ Name: UpdateSurrogate ]]
    local l_lastParent_0 = v250.lastParent;
    v250.guiSurrogate.Position = UDim2.new(0, l_lastParent_0.AbsolutePosition.X, 0, l_lastParent_0.AbsolutePosition.Y);
    v250.guiSurrogate.Size = UDim2.new(0, l_lastParent_0.AbsoluteSize.X, 0, l_lastParent_0.AbsoluteSize.Y);
end;
v231.GetPart = function(v252) --[[ Line: 1060 ]] --[[ Name: GetPart ]]
    -- upvalues: v22 (copy)
    if v252.part then
        return v252.part;
    else
        v252.part = v252.parentPanel:GetPart():Clone();
        v252.part.Parent = v22;
        return v252.part;
    end;
end;
v231.GetGUI = function(v253) --[[ Line: 1070 ]] --[[ Name: GetGUI ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    if v253.gui then
        return v253.gui;
    else
        v253.gui = l_Create_0("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Adornee = v253:GetPart(), 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v253.parentPanel:GetGUI().CanvasSize, 
            Enabled = v253.parentPanel.isEnabled, 
            AlwaysOnTop = true
        });
        v253.guiSurrogate = l_Create_0("Frame")({
            Parent = v253.gui, 
            Active = false, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        });
        return v253.gui;
    end;
end;
v231.SetDepthOffset = function(v254, v255) --[[ Line: 1097 ]] --[[ Name: SetDepthOffset ]]
    v254.depthOffset = v255;
end;
v231.Update = function(v256) --[[ Line: 1101 ]] --[[ Name: Update ]]
    local l_v256_Part_0 = v256:GetPart();
    local l_Part_0 = v256.parentPanel:GetPart();
    if l_v256_Part_0 and l_Part_0 then
        l_v256_Part_0.CFrame = l_Part_0.CFrame * CFrame.new(0, 0, -v256.depthOffset);
    end;
end;
v231.SetEnabled = function(v259, v260) --[[ Line: 1110 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v22 (copy)
    v259.isEnabled = v260;
    if v260 and v259.parentPanel.isEnabled then
        v259:GetPart().Parent = v22;
        v259:GetGUI().Enabled = true;
        return;
    else
        v259:GetPart().Parent = nil;
        v259:GetGUI().Enabled = false;
        return;
    end;
end;
v231.GetEnabled = function(v261) --[[ Line: 1123 ]] --[[ Name: GetEnabled ]]
    return v261.isEnabled;
end;
v231.GetPixelScale = function(v262) --[[ Line: 1127 ]] --[[ Name: GetPixelScale ]]
    return v262.parentPanel:GetPixelScale();
end;
v59.GetPixelScale = function(v263) --[[ Line: 1130 ]] --[[ Name: GetPixelScale ]]
    return v263.pixelScale;
end;
v59.AddSubpanel = function(v264, v265) --[[ Line: 1134 ]] --[[ Name: AddSubpanel ]]
    -- upvalues: v231 (copy)
    local v266 = v231.new(v264, v265);
    v264.subpanels[v265] = v266;
    return v266;
end;
v59.RemoveSubpanel = function(v267, v268) --[[ Line: 1140 ]] --[[ Name: RemoveSubpanel ]]
    local v269 = v267.subpanels[v268];
    if v269 then
        v269:Cleanup();
    end;
    v267.subpanels[v268] = nil;
end;
v59.SetSubpanelDepth = function(v270, v271, v272) --[[ Line: 1148 ]] --[[ Name: SetSubpanelDepth ]]
    local v273 = v270.subpanels[v271];
    if v272 == 0 then
        if v273 then
            v270:RemoveSubpanel(v271);
        end;
        return nil;
    else
        if not v273 then
            v273 = v270:AddSubpanel(v271);
        end;
        v273:SetDepthOffset(v272);
        return v273;
    end;
end;
v58.Get = function(v274) --[[ Line: 1170 ]] --[[ Name: Get ]]
    -- upvalues: v20 (copy), v59 (copy)
    local v275 = v20[v274];
    if not v20[v274] then
        v20[v274] = v59.new(v274);
        v275 = v20[v274];
    end;
    return v275;
end;
local v276 = tick();
local function v300() --[[ Line: 1182 ]] --[[ Name: onRenderStep ]]
    -- upvalues: l_VRService_0 (copy), v276 (ref), v18 (ref), v17 (ref), v20 (copy), v15 (ref), l_v11_0 (ref), v21 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        local v277 = tick();
        local v278 = v277 - v276;
        v276 = v277;
        v18 = nil;
        v17 = 1e999;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_1 = l_CurrentCamera_0.CFrame;
        local l_l_CurrentCamera_0_RenderCFrame_0 = l_CurrentCamera_0:GetRenderCFrame();
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v283 = Ray.new(l_l_CurrentCamera_0_RenderCFrame_0.p, l_l_CurrentCamera_0_RenderCFrame_0.lookVector);
        local l_GuiInputUserCFrame_0 = l_VRService_0.GuiInputUserCFrame;
        local v285 = l_CFrame_1 * l_VRService_0:GetUserCFrame(l_GuiInputUserCFrame_0);
        local v286 = Ray.new(v285.p, v285.lookVector);
        for _, v288 in pairs(v20) do
            v288:Update(l_CFrame_1, l_l_CurrentCamera_0_RenderCFrame_0, l_l_VRService_0_UserCFrame_4, v283, v286, v278);
        end;
        local v289 = {};
        for _, v291 in pairs(v20) do
            if not v289[v291] and v291.linkedTo and v291.isVisible and v291.linkedTo.isVisible then
                v289[v291] = true;
                v289[v291.linkedTo] = true;
                local v292 = math.min(v291.transparency, v291.linkedTo.transparency);
                v291.transparency = v292;
                v291.linkedTo.transparency = v292;
            end;
        end;
        for _, v294 in pairs(v20) do
            if v294.part and v294.gui then
                local v295 = v15 == v294 or v294.linkedTo and v294.linkedTo == v15;
                local l_isVisible_0 = v294.isVisible;
                if not v295 and v15 then
                    l_isVisible_0 = false;
                end;
                if v294.transparency >= 1 then
                    l_isVisible_0 = false;
                end;
                if v294.forceShowUntilLookedAt then
                    l_isVisible_0 = true;
                end;
                if not v294.canFade and v294.isVisible then
                    l_isVisible_0 = true;
                end;
                v294:SetEnabled(l_isVisible_0);
            end;
            v294:OnUpdate(v278);
        end;
        if v18 then
            local l_X_8 = l_v11_0.X;
            local l_Y_8 = l_v11_0.Y;
            local l_v18_PixelScale_0 = v18:GetPixelScale();
            v21.Size = UDim2.new(0, 3 * l_v18_PixelScale_0, 0, 3 * l_v18_PixelScale_0);
            v21.Position = UDim2.new(0, l_X_8 - v21.AbsoluteSize.x * 0.5, 0, l_Y_8 - v21.AbsoluteSize.y * 0.5);
            return;
        else
            v21.Parent = nil;
            return;
        end;
    end;
end;
local v301 = true;
local function _(v302) --[[ Line: 1268 ]] --[[ Name: putFoldersIn ]]
    -- upvalues: v22 (copy), v23 (copy)
    v22.Parent = v302;
    v23.Parent = v302;
end;
local v304 = nil;
local function v307() --[[ Line: 1274 ]] --[[ Name: onHeadScaleChanged ]]
    -- upvalues: v20 (copy)
    for _, v306 in pairs(v20) do
        v306:OnHeadScaleChanged();
    end;
end;
local v308 = nil;
local function v319() --[[ Line: 1281 ]] --[[ Name: onCameraCFrameChanged ]]
    -- upvalues: l_VRService_0 (copy), v20 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local l_CFrame_2 = l_CurrentCamera_1.CFrame;
    local l_l_CurrentCamera_1_RenderCFrame_0 = l_CurrentCamera_1:GetRenderCFrame();
    local l_l_VRService_0_UserCFrame_5 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v313 = Ray.new(l_l_CurrentCamera_1_RenderCFrame_0.p, l_l_CurrentCamera_1_RenderCFrame_0.lookVector);
    local l_GuiInputUserCFrame_1 = l_VRService_0.GuiInputUserCFrame;
    local v315 = l_CFrame_2 * l_VRService_0:GetUserCFrame(l_GuiInputUserCFrame_1);
    local v316 = Ray.new(v315.p, v315.lookVector);
    for _, v318 in pairs(v20) do
        v318:Update(l_CFrame_2, l_l_CurrentCamera_1_RenderCFrame_0, l_l_VRService_0_UserCFrame_5, v313, v316, 0);
    end;
end;
local function v323() --[[ Line: 1297 ]] --[[ Name: onCurrentCameraChanged ]]
    -- upvalues: v20 (copy), v304 (ref), v307 (copy), v308 (ref), v319 (copy), l_VRService_0 (copy), v301 (ref), v22 (copy), v23 (copy)
    for _, v321 in pairs(v20) do
        v321:OnHeadScaleChanged();
    end;
    if v304 then
        v304:disconnect();
    end;
    v304 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(v307);
    if v308 then
        v308:disconnect();
    end;
    v308 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v319);
    if l_VRService_0.VREnabled and v301 then
        local l_CurrentCamera_2 = workspace.CurrentCamera;
        v22.Parent = l_CurrentCamera_2;
        v23.Parent = l_CurrentCamera_2;
    end;
end;
local v324 = nil;
local v325 = false;
local v326 = nil;
local function v332() --[[ Line: 1321 ]] --[[ Name: onVREnabledChanged ]]
    -- upvalues: l_VRService_0 (copy), v301 (ref), v323 (copy), v324 (ref), v22 (copy), v23 (copy), v325 (ref), l_RunService_0 (copy), v10 (copy), v300 (copy), v8 (copy), v326 (ref), v20 (copy)
    if l_VRService_0.VREnabled then
        while not v301 do
            wait();
        end;
        if workspace.CurrentCamera then
            v323();
        end;
        v324 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v323);
        local l_CurrentCamera_3 = workspace.CurrentCamera;
        v22.Parent = l_CurrentCamera_3;
        v23.Parent = l_CurrentCamera_3;
        if not v325 then
            l_RunService_0:BindToRenderStep(v10, Enum.RenderPriority.Last.Value, v300);
            v325 = true;
        end;
        if v8 then
            v326 = l_VRService_0.UserCFrameChanged:Connect(function(v328, _) --[[ Line: 1341 ]]
                -- upvalues: v20 (ref)
                if v328 == Enum.UserCFrame.Floor then
                    for _, v331 in pairs(v20) do
                        v331:OnRecentered();
                    end;
                end;
            end);
            return;
        end;
    else
        if v324 then
            v324:disconnect();
            v324 = nil;
        end;
        if v8 and v326 then
            v326:disconnect();
            v326 = nil;
        end;
        v22.Parent = nil;
        v23.Parent = nil;
        if v325 then
            l_RunService_0:UnbindFromRenderStep(v10);
            v325 = false;
        end;
    end;
end;
l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v332);
spawn(v332);
coroutine.wrap(function() --[[ Line: 1369 ]]
    -- upvalues: v301 (ref)
    while true do
        if not workspace.CurrentCamera then
            wait();
            continue;
        end;
        if workspace.CurrentCamera.CameraSubject == nil and workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
            workspace.CurrentCamera.Changed:Wait();
        else
            break;
        end;
    end;
    v301 = true;
end)();
return v58;