local v0 = {};
local v1 = "rbxasset://textures/ui/traildot.png";
local v2 = "rbxasset://textures/ui/waypoint.png";
local v3 = false;
local v4 = UDim2.new(0, 42, 0, 50);
local v5 = Vector2.new(0, 0.5);
local v6 = Vector2.new(0, 1);
local v7 = Vector2.new(0, 0.5);
local v8 = Vector2.new(0.1, 0.5);
local v9 = Vector2.new(-0.1, 0.5);
local v10 = Vector2.new(1.5, 1.5);
local v11 = RaycastParams.new();
v11.FilterType = Enum.RaycastFilterType.Exclude;
local v12 = Vector3.yAxis * 2.5;
local v13 = Vector3.yAxis * -10;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v19 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function v32() --[[ Line: 55 ]] --[[ Name: CreateWaypointTemplates ]]
    -- upvalues: v10 (ref), v3 (ref), v1 (ref), v4 (copy), v5 (copy), v2 (ref), v7 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = Vector3.new(1, 1, 1, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Name = "TrailDot";
    l_Part_0.Transparency = 1;
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Name = "TrailDotImage";
    l_ImageHandleAdornment_0.Size = v10;
    l_ImageHandleAdornment_0.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_0.AlwaysOnTop = v3;
    l_ImageHandleAdornment_0.Image = v1;
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Parent = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Size = Vector3.new(2, 2, 2, 0);
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.Name = "EndWaypoint";
    l_Part_1.Transparency = 1;
    local l_ImageHandleAdornment_1 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_1.Name = "TrailDotImage";
    l_ImageHandleAdornment_1.Size = v10;
    l_ImageHandleAdornment_1.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_1.AlwaysOnTop = v3;
    l_ImageHandleAdornment_1.Image = v1;
    l_ImageHandleAdornment_1.Adornee = l_Part_1;
    l_ImageHandleAdornment_1.Parent = l_Part_1;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "EndWaypointBillboard";
    l_BillboardGui_0.Size = v4;
    l_BillboardGui_0.LightInfluence = 0;
    l_BillboardGui_0.SizeOffset = v5;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Adornee = l_Part_1;
    l_BillboardGui_0.Parent = l_Part_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = v2;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Parent = l_BillboardGui_0;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Size = Vector3.new(2, 2, 2, 0);
    l_Part_2.Anchored = true;
    l_Part_2.CanCollide = false;
    l_Part_2.Name = "FailureWaypoint";
    l_Part_2.Transparency = 1;
    local l_ImageHandleAdornment_2 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_2.Name = "TrailDotImage";
    l_ImageHandleAdornment_2.Size = v10;
    l_ImageHandleAdornment_2.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_2.AlwaysOnTop = v3;
    l_ImageHandleAdornment_2.Image = v1;
    l_ImageHandleAdornment_2.Adornee = l_Part_2;
    l_ImageHandleAdornment_2.Parent = l_Part_2;
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    l_BillboardGui_1.Name = "FailureWaypointBillboard";
    l_BillboardGui_1.Size = v4;
    l_BillboardGui_1.LightInfluence = 0;
    l_BillboardGui_1.SizeOffset = v7;
    l_BillboardGui_1.AlwaysOnTop = true;
    l_BillboardGui_1.Adornee = l_Part_2;
    l_BillboardGui_1.Parent = l_Part_2;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Parent = l_BillboardGui_1;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Image = v2;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Position = UDim2.new(0, -v4.X.Offset / 2, 0, -v4.Y.Offset);
    l_ImageLabel_1.Size = v4;
    l_ImageLabel_1.Parent = l_Frame_0;
    return l_Part_0, l_Part_1, l_Part_2;
end;
local v33, v34, v35 = v32();
local function _() --[[ Line: 141 ]] --[[ Name: getTrailDotParent ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local l_ClickToMoveDisplay_0 = l_CurrentCamera_0:FindFirstChild("ClickToMoveDisplay");
    if not l_ClickToMoveDisplay_0 then
        l_ClickToMoveDisplay_0 = Instance.new("Model");
        l_ClickToMoveDisplay_0.Name = "ClickToMoveDisplay";
        l_ClickToMoveDisplay_0.Parent = l_CurrentCamera_0;
    end;
    return l_ClickToMoveDisplay_0;
end;
local function v50(v39, v40) --[[ Line: 152 ]] --[[ Name: placePathWaypoint ]]
    -- upvalues: v19 (copy), v11 (copy), l_Workspace_0 (copy), l_LocalPlayer_0 (copy), v12 (copy), v13 (copy)
    if v19 then
        v11.FilterDescendantsInstances = {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        };
        local v41 = l_Workspace_0:Raycast(v40 + v12, v13, v11);
        if v41 then
            v39.CFrame = CFrame.lookAlong(v41.Position, v41.Normal);
            local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_1 = l_CurrentCamera_1:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_1 then
                l_ClickToMoveDisplay_1 = Instance.new("Model");
                l_ClickToMoveDisplay_1.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_1.Parent = l_CurrentCamera_1;
            end;
            v39.Parent = l_ClickToMoveDisplay_1;
            return;
        end;
    else
        local v44 = Ray.new(v40 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
        local l_l_Workspace_0_PartOnRayWithIgnoreList_0, v46, v47 = l_Workspace_0:FindPartOnRayWithIgnoreList(v44, {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        });
        if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
            v39.CFrame = CFrame.new(v46, v46 + v47);
            local l_CurrentCamera_2 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_2 = l_CurrentCamera_2:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_2 then
                l_ClickToMoveDisplay_2 = Instance.new("Model");
                l_ClickToMoveDisplay_2.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_2.Parent = l_CurrentCamera_2;
            end;
            v39.Parent = l_ClickToMoveDisplay_2;
        end;
    end;
end;
local v51 = {};
v51.__index = v51;
v51.Destroy = function(v52) --[[ Line: 177 ]] --[[ Name: Destroy ]]
    v52.DisplayModel:Destroy();
end;
v51.NewDisplayModel = function(_, v54) --[[ Line: 181 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v33 (ref), v50 (copy)
    local v55 = v33:Clone();
    v50(v55, v54);
    return v55;
end;
v51.new = function(v56, v57) --[[ Line: 187 ]] --[[ Name: new ]]
    -- upvalues: v51 (copy)
    local v58 = setmetatable({}, v51);
    v58.DisplayModel = v58:NewDisplayModel(v56);
    v58.ClosestWayPoint = v57;
    return v58;
end;
local v59 = {};
v59.__index = v59;
v59.Destroy = function(v60) --[[ Line: 199 ]] --[[ Name: Destroy ]]
    v60.Destroyed = true;
    v60.Tween:Cancel();
    v60.DisplayModel:Destroy();
end;
v59.NewDisplayModel = function(_, v62) --[[ Line: 205 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v34 (ref), v50 (copy)
    local v63 = v34:Clone();
    v50(v63, v62);
    return v63;
end;
v59.CreateTween = function(v64) --[[ Line: 211 ]] --[[ Name: CreateTween ]]
    -- upvalues: l_TweenService_0 (copy), v6 (copy)
    local v65 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true);
    local v66 = l_TweenService_0:Create(v64.DisplayModel.EndWaypointBillboard, v65, {
        SizeOffset = v6
    });
    v66:Play();
    return v66;
end;
v59.TweenInFrom = function(v67, v68) --[[ Line: 222 ]] --[[ Name: TweenInFrom ]]
    -- upvalues: l_TweenService_0 (copy)
    local v69 = v68 - v67.DisplayModel.Position;
    v67.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, v69.Y, 0);
    local v70 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v71 = l_TweenService_0:Create(v67.DisplayModel.EndWaypointBillboard, v70, {
        StudsOffset = Vector3.new(0, 0, 0, 0)
    });
    v71:Play();
    return v71;
end;
v59.new = function(v72, v73, v74) --[[ Line: 236 ]] --[[ Name: new ]]
    -- upvalues: v59 (copy)
    local v75 = setmetatable({}, v59);
    v75.DisplayModel = v75:NewDisplayModel(v72);
    v75.Destroyed = false;
    if v74 and (v74 - v72).Magnitude > 5 then
        v75.Tween = v75:TweenInFrom(v74);
        coroutine.wrap(function() --[[ Line: 243 ]]
            -- upvalues: v75 (copy)
            v75.Tween.Completed:Wait();
            if not v75.Destroyed then
                v75.Tween = v75:CreateTween();
            end;
        end)();
    else
        v75.Tween = v75:CreateTween();
    end;
    v75.ClosestWayPoint = v73;
    return v75;
end;
local v76 = {};
v76.__index = v76;
v76.Hide = function(v77) --[[ Line: 260 ]] --[[ Name: Hide ]]
    v77.DisplayModel.Parent = nil;
end;
v76.Destroy = function(v78) --[[ Line: 264 ]] --[[ Name: Destroy ]]
    v78.DisplayModel:Destroy();
end;
v76.NewDisplayModel = function(_, v80) --[[ Line: 268 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v35 (ref), v50 (copy), v19 (copy), v11 (copy), l_Workspace_0 (copy), l_LocalPlayer_0 (copy), v12 (copy), v13 (copy)
    local v81 = v35:Clone();
    v50(v81, v80);
    if v19 then
        v11.FilterDescendantsInstances = {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        };
        local v82 = l_Workspace_0:Raycast(v80 + v12, v13, v11);
        if v82 then
            v81.CFrame = CFrame.lookAlong(v82.Position, v82.Normal);
            local l_CurrentCamera_3 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_3 = l_CurrentCamera_3:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_3 then
                l_ClickToMoveDisplay_3 = Instance.new("Model");
                l_ClickToMoveDisplay_3.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_3.Parent = l_CurrentCamera_3;
            end;
            v81.Parent = l_ClickToMoveDisplay_3;
            return v81;
        end;
    else
        local v85 = Ray.new(v80 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
        local l_l_Workspace_0_PartOnRayWithIgnoreList_1, v87, v88 = l_Workspace_0:FindPartOnRayWithIgnoreList(v85, {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        });
        if l_l_Workspace_0_PartOnRayWithIgnoreList_1 then
            v81.CFrame = CFrame.new(v87, v87 + v88);
            local l_CurrentCamera_4 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_4 = l_CurrentCamera_4:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_4 then
                l_ClickToMoveDisplay_4 = Instance.new("Model");
                l_ClickToMoveDisplay_4.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_4.Parent = l_CurrentCamera_4;
            end;
            v81.Parent = l_ClickToMoveDisplay_4;
        end;
    end;
    return v81;
end;
v76.RunFailureTween = function(v91) --[[ Line: 292 ]] --[[ Name: RunFailureTween ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy), v9 (copy), v7 (copy)
    wait(0.125);
    local v92 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v93 = l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard, v92, {
        SizeOffset = v8
    });
    v93:Play();
    l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard.Frame, v92, {
        Rotation = 10
    }):Play();
    v93.Completed:wait();
    v92 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    local v94 = l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard, v92, {
        SizeOffset = v9
    });
    v94:Play();
    v92 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v92, {
        ImageColor3 = Color3.new(0.75, 0.75, 0.75)
    }):Play();
    l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard.Frame, v92, {
        Rotation = -10
    }):Play();
    v94.Completed:wait();
    v92 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v95 = l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard, v92, {
        SizeOffset = v7
    });
    v95:Play();
    l_TweenService_0:Create(v91.DisplayModel.FailureWaypointBillboard.Frame, v92, {
        Rotation = 0
    }):Play();
    v95.Completed:wait();
    wait(0.125);
end;
v76.new = function(v96) --[[ Line: 341 ]] --[[ Name: new ]]
    -- upvalues: v76 (copy)
    local v97 = setmetatable({}, v76);
    v97.DisplayModel = v97:NewDisplayModel(v96);
    return v97;
end;
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.AnimationId = "rbxassetid://2874840706";
local v99 = nil;
local function _(v100) --[[ Line: 355 ]] --[[ Name: getFailureAnimationTrack ]]
    -- upvalues: v99 (ref), l_Animation_0 (copy)
    if v100 == nil then
        return v99;
    else
        v99 = v100:LoadAnimation(l_Animation_0);
        assert(v99, "");
        v99.Priority = Enum.AnimationPriority.Action;
        v99.Looped = false;
        return v99;
    end;
end;
local function _() --[[ Line: 366 ]] --[[ Name: findPlayerHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 then
        return l_Character_0:FindFirstChildOfClass("Humanoid");
    else
        return;
    end;
end;
local function v113(v104, v105) --[[ Line: 373 ]] --[[ Name: createTrailDots ]]
    -- upvalues: v51 (copy), v59 (copy)
    local v106 = {};
    local v107 = 1;
    for v108 = 1, #v104 - 1 do
        local v109 = (v104[v108].Position - v104[#v104].Position).Magnitude < 3;
        local v110 = false;
        if v108 % 2 == 0 then
            v110 = not v109;
        end;
        if v110 then
            v106[v107] = v51.new(v104[v108].Position, v108);
            v107 = v107 + 1;
        end;
    end;
    table.insert(v106, (v59.new(v104[#v104].Position, #v104, v105)));
    local v111 = {};
    v107 = 1;
    for v112 = #v106, 1, -1 do
        v111[v107] = v106[v112];
        v107 = v107 + 1;
    end;
    return v111;
end;
local function _(v114, v115) --[[ Line: 398 ]] --[[ Name: getTrailDotScale ]]
    return v115 * (1 + 1.5 * (math.clamp(v114 - 10, 0, 90) / 90));
end;
local v117 = 0;
v0.CreatePathDisplay = function(v118, v119) --[[ Line: 407 ]] --[[ Name: CreatePathDisplay ]]
    -- upvalues: v117 (ref), v113 (copy), l_RunService_0 (copy), l_Workspace_0 (copy), v10 (ref)
    v117 = v117 + 1;
    local v120 = v113(v118, v119);
    local function v124(v121) --[[ Line: 411 ]] --[[ Name: removePathBeforePoint ]]
        -- upvalues: v120 (copy)
        for v122 = #v120, 1, -1 do
            local v123 = v120[v122];
            if v123.ClosestWayPoint <= v121 then
                v123:Destroy();
                v120[v122] = nil;
            else
                break;
            end;
        end;
    end;
    local v125 = "ClickToMoveResizeTrail" .. v117;
    local function v130() --[[ Line: 425 ]] --[[ Name: resizeTrailDots ]]
        -- upvalues: v120 (copy), l_RunService_0 (ref), v125 (copy), l_Workspace_0 (ref), v10 (ref)
        if #v120 == 0 then
            l_RunService_0:UnbindFromRenderStep(v125);
            return;
        else
            local l_p_0 = l_Workspace_0.CurrentCamera.CFrame.p;
            for v127 = 1, #v120 do
                local l_TrailDotImage_0 = v120[v127].DisplayModel:FindFirstChild("TrailDotImage");
                if l_TrailDotImage_0 then
                    local l_Magnitude_0 = (v120[v127].DisplayModel.Position - l_p_0).Magnitude;
                    l_TrailDotImage_0.Size = v10 * (1 + 1.5 * (math.clamp(l_Magnitude_0 - 10, 0, 90) / 90));
                end;
            end;
            return;
        end;
    end;
    l_RunService_0:BindToRenderStep(v125, Enum.RenderPriority.Camera.Value - 1, v130);
    return function() --[[ Line: 441 ]] --[[ Name: removePath ]]
        -- upvalues: v124 (copy), v118 (copy)
        v124(#v118);
    end, v124;
end;
local v131 = nil;
v0.DisplayFailureWaypoint = function(v132) --[[ Line: 449 ]] --[[ Name: DisplayFailureWaypoint ]]
    -- upvalues: v131 (ref), v76 (copy)
    if v131 then
        v131:Hide();
    end;
    local v133 = v76.new(v132);
    v131 = v133;
    coroutine.wrap(function() --[[ Line: 455 ]]
        -- upvalues: v133 (ref)
        v133:RunFailureTween();
        v133:Destroy();
        v133 = nil;
    end)();
end;
v0.CreateEndWaypoint = function(v134) --[[ Line: 462 ]] --[[ Name: CreateEndWaypoint ]]
    -- upvalues: v59 (copy)
    return v59.new(v134);
end;
v0.PlayFailureAnimation = function() --[[ Line: 466 ]] --[[ Name: PlayFailureAnimation ]]
    -- upvalues: l_LocalPlayer_0 (copy), v99 (ref), l_Animation_0 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v136 = if l_Character_1 then l_Character_1:FindFirstChildOfClass("Humanoid") else nil;
    if v136 then
        if v136 == nil then
            l_Character_1 = v99;
        else
            v99 = v136:LoadAnimation(l_Animation_0);
            assert(v99, "");
            v99.Priority = Enum.AnimationPriority.Action;
            v99.Looped = false;
            l_Character_1 = v99;
        end;
        l_Character_1:Play();
    end;
end;
v0.CancelFailureAnimation = function() --[[ Line: 474 ]] --[[ Name: CancelFailureAnimation ]]
    -- upvalues: v99 (ref)
    if v99 ~= nil and v99.IsPlaying then
        v99:Stop();
    end;
end;
v0.SetWaypointTexture = function(v137) --[[ Line: 480 ]] --[[ Name: SetWaypointTexture ]]
    -- upvalues: v1 (ref), v33 (ref), v34 (ref), v35 (ref), v32 (copy)
    v1 = v137;
    local v138, v139, v140 = v32();
    v33 = v138;
    v34 = v139;
    v35 = v140;
end;
v0.GetWaypointTexture = function() --[[ Line: 485 ]] --[[ Name: GetWaypointTexture ]]
    -- upvalues: v1 (ref)
    return v1;
end;
v0.SetWaypointRadius = function(v141) --[[ Line: 489 ]] --[[ Name: SetWaypointRadius ]]
    -- upvalues: v10 (ref), v33 (ref), v34 (ref), v35 (ref), v32 (copy)
    v10 = Vector2.new(v141, v141);
    local v142, v143, v144 = v32();
    v33 = v142;
    v34 = v143;
    v35 = v144;
end;
v0.GetWaypointRadius = function() --[[ Line: 494 ]] --[[ Name: GetWaypointRadius ]]
    -- upvalues: v10 (ref)
    return v10.X;
end;
v0.SetEndWaypointTexture = function(v145) --[[ Line: 498 ]] --[[ Name: SetEndWaypointTexture ]]
    -- upvalues: v2 (ref), v33 (ref), v34 (ref), v35 (ref), v32 (copy)
    v2 = v145;
    local v146, v147, v148 = v32();
    v33 = v146;
    v34 = v147;
    v35 = v148;
end;
v0.GetEndWaypointTexture = function() --[[ Line: 503 ]] --[[ Name: GetEndWaypointTexture ]]
    -- upvalues: v2 (ref)
    return v2;
end;
v0.SetWaypointsAlwaysOnTop = function(v149) --[[ Line: 507 ]] --[[ Name: SetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref), v33 (ref), v34 (ref), v35 (ref), v32 (copy)
    v3 = v149;
    local v150, v151, v152 = v32();
    v33 = v150;
    v34 = v151;
    v35 = v152;
end;
v0.GetWaypointsAlwaysOnTop = function() --[[ Line: 512 ]] --[[ Name: GetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref)
    return v3;
end;
return v0;