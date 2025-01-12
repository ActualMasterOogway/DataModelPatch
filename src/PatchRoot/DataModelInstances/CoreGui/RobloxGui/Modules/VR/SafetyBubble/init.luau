local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v5 = {};
v5.__index = v5;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v8 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleRadius);
local v9 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleTransparencyPercent) * 0.01;
v5.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), l_Create_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v10 = setmetatable({}, v5);
    v10.subjects = {};
    v10.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
    v10.enabled = v10.mode ~= Enum.VRSafetyBubbleMode.Anyone;
    v10.updateCadence = 0.2;
    v10.Toggled = l_Create_0("BindableEvent")({
        Name = "SafetyBubbleToggled"
    });
    l_UserGameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 39 ]]
        -- upvalues: v10 (copy), l_UserGameSettings_0 (ref), l_RbxAnalyticsService_0 (ref)
        v10.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
        local v11 = v10.mode ~= Enum.VRSafetyBubbleMode.Anyone;
        if v10.enabled ~= v11 then
            v10.enabled = v11;
            v10.Toggled:Fire();
            local v12 = v11 and "On" or "Off";
            l_RbxAnalyticsService_0:ReportCounter("VR-SafetyBubble-" .. v12);
        end;
    end);
    return v10;
end;
v5.ToggleEnabled = function(v13) --[[ Line: 54 ]] --[[ Name: ToggleEnabled ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    l_UserGameSettings_0.VRSafetyBubbleMode = v13.enabled and Enum.VRSafetyBubbleMode.Anyone or Enum.VRSafetyBubbleMode.NoOne;
end;
v5.HasToolAncestor = function(v14, v15) --[[ Line: 58 ]] --[[ Name: HasToolAncestor ]]
    if v15 == nil or v15.Parent == nil then
        return false;
    else
        return v15.Parent:IsA("Tool") or v14:HasToolAncestor(v15.Parent);
    end;
end;
v5.IsValidPartToModify = function(v16, v17) --[[ Line: 65 ]] --[[ Name: IsValidPartToModify ]]
    if v17:IsA("BasePart") or v17:IsA("Decal") then
        return not v16:HasToolAncestor(v17);
    else
        return false;
    end;
end;
v5.CachePartsRecursive = function(v18, v19, v20) --[[ Line: 72 ]] --[[ Name: CachePartsRecursive ]]
    if v19 then
        if v18:IsValidPartToModify(v19) then
            v18.subjects[v20].cachedParts[v19] = true;
            v18.subjects[v20].transparencyDirty = true;
        end;
        for _, v22 in pairs(v19:GetChildren()) do
            v18:CachePartsRecursive(v22, v20);
        end;
    end;
end;
v5.TeardownTransparency = function(v23, v24) --[[ Line: 84 ]] --[[ Name: TeardownTransparency ]]
    for v25, _ in pairs(v23.subjects[v24].cachedParts) do
        v25.LocalTransparencyModifier = 0;
    end;
    v23.subjects[v24].cachedParts = {};
    v23.subjects[v24].transparencyDirty = true;
    v23.subjects[v24].lastTransparency = nil;
    if v23.subjects[v24].descendantAddedConn then
        v23.subjects[v24].descendantAddedConn:disconnect();
        v23.subjects[v24].descendantAddedConn = nil;
    end;
    if v23.subjects[v24].descendantRemovingConn then
        v23.subjects[v24].descendantRemovingConn:disconnect();
        v23.subjects[v24].descendantRemovingConn = nil;
    end;
    for v27, v28 in pairs(v23.subjects[v24].toolDescendantAddedConns) do
        v28:Disconnect();
        v23.subjects[v24].toolDescendantAddedConns[v27] = nil;
    end;
    for v29, v30 in pairs(v23.subjects[v24].toolDescendantRemovingConns) do
        v30:Disconnect();
        v23.subjects[v24].toolDescendantRemovingConns[v29] = nil;
    end;
end;
v5.GetSubjectIndex = function(v31, v32) --[[ Line: 110 ]] --[[ Name: GetSubjectIndex ]]
    local v33 = #v31.subjects;
    local v34 = 1;
    while true do
        if v34 <= v33 then
            if v31.subjects[v34].character == v32 then
                return v34;
            else
                v34 = v34 + 1;
            end;
        else
            return 0;
        end;
    end;
end;
v5.SubjectExists = function(v35, v36) --[[ Line: 124 ]] --[[ Name: SubjectExists ]]
    return v35:GetSubjectIndex(v36) > 0;
end;
v5.SetupTransparency = function(v37, v38) --[[ Line: 130 ]] --[[ Name: SetupTransparency ]]
    local l_v37_SubjectIndex_0 = v37:GetSubjectIndex(v38);
    if l_v37_SubjectIndex_0 == 0 then
        return;
    else
        if v37.subjects[l_v37_SubjectIndex_0].descendantAddedConn then
            v37.subjects[l_v37_SubjectIndex_0].descendantAddedConn:disconnect();
        end;
        v37.subjects[l_v37_SubjectIndex_0].descendantAddedConn = v38.DescendantAdded:Connect(function(v40) --[[ Line: 137 ]]
            -- upvalues: l_v37_SubjectIndex_0 (ref), v37 (copy), v38 (copy)
            l_v37_SubjectIndex_0 = v37:GetSubjectIndex(v38);
            if l_v37_SubjectIndex_0 == 0 then
                return;
            else
                if v37:IsValidPartToModify(v40) then
                    v37.subjects[l_v37_SubjectIndex_0].cachedParts[v40] = true;
                    v37.subjects[l_v37_SubjectIndex_0].transparencyDirty = true;
                end;
                return;
            end;
        end);
        if v37.descendantRemovingConn then
            v37.descendantRemovingConn:disconnect();
        end;
        v37.descendantRemovingConn = v38.DescendantRemoving:connect(function(v41) --[[ Line: 151 ]]
            -- upvalues: l_v37_SubjectIndex_0 (ref), v37 (copy), v38 (copy)
            l_v37_SubjectIndex_0 = v37:GetSubjectIndex(v38);
            if l_v37_SubjectIndex_0 == 0 then
                return;
            else
                if v37.subjects[l_v37_SubjectIndex_0] and v37.subjects[l_v37_SubjectIndex_0].cachedParts[v41] then
                    v37.subjects[l_v37_SubjectIndex_0].cachedParts[v41] = nil;
                    v41.LocalTransparencyModifier = 0;
                end;
                return;
            end;
        end);
        v37:CachePartsRecursive(v38, l_v37_SubjectIndex_0);
        return;
    end;
end;
v5.AddSubject = function(v42, v43) --[[ Line: 167 ]] --[[ Name: AddSubject ]]
    local v44 = #v42.subjects;
    local v45 = 1;
    while true do
        if v45 <= v44 then
            if v42.subjects[v45].character == v43 then
                return;
            else
                v45 = v45 + 1;
            end;
        else
            local v46 = {
                transparencyDirty = false, 
                lastTransparency = nil, 
                descendantAddedConn = nil, 
                descendantRemovingConn = nil, 
                toolDescendantAddedConns = {}, 
                toolDescendantRemovingConns = {}, 
                cachedParts = {}, 
                character = nil
            };
            table.insert(v42.subjects, v46);
            v42.subjects[v45].character = v43;
            v42:SetupTransparency(v43);
            return;
        end;
    end;
end;
v5.update = function(v47, v48) --[[ Line: 197 ]] --[[ Name: update ]]
    -- upvalues: v8 (copy), l_VRService_0 (copy), l_Players_0 (copy), v9 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return;
    elseif not v47.enabled then
        if v47.subjects and #v47.subjects > 0 then
            for v50 = 1, #v47.subjects do
                v47:TeardownTransparency(v50);
            end;
            v47.subjects = {};
        end;
        return;
    else
        local v51 = math.max(v8 * l_CurrentCamera_0.HeadScale, 0.1);
        local v52 = nil;
        local v53 = v51 + 3;
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v55 = l_CurrentCamera_0.CFrame * l_l_VRService_0_UserCFrame_0;
        v47.updateCadence = v47.updateCadence - v48;
        if v47.updateCadence <= 0 then
            v47.updateCadence = 0.2;
            for _, v57 in pairs(l_Players_0:GetPlayers()) do
                if v57.Character and v57 ~= l_Players_0.LocalPlayer then
                    if v47.mode == Enum.VRSafetyBubbleMode.OnlyFriends and l_Players_0.LocalPlayer:IsFriendsWith(v57.UserId) then
                        local l_v47_SubjectIndex_0 = v47:GetSubjectIndex(v57.Character);
                        if l_v47_SubjectIndex_0 > 0 then
                            v47:TeardownTransparency(l_v47_SubjectIndex_0);
                            table.remove(v47.subjects, l_v47_SubjectIndex_0);
                        end;
                    elseif not v47:SubjectExists(v57.Character) and v57.Character then
                        local l_BoundingBox_0, v60 = v57.Character:GetBoundingBox();
                        local v61 = (l_BoundingBox_0.Position - v55.Position).Magnitude - v60.Z;
                        if v61 < v53 then
                            v53 = v61;
                            v52 = v57.Character;
                        end;
                    end;
                end;
            end;
            if v52 then
                v47:AddSubject(v52);
            end;
        end;
        if not v47.subjects or #v47.subjects == 0 then
            return;
        else
            local v62 = #v47.subjects;
            while v62 > 0 do
                local l_BoundingBox_1, v64 = v47.subjects[v62].character:GetBoundingBox();
                if (l_BoundingBox_1.Position - v55.Position).Magnitude - v64.Z > v51 * 2 then
                    v47:TeardownTransparency(v62);
                    table.remove(v47.subjects, v62);
                end;
                v62 = v62 - 1;
            end;
            local v65 = #v47.subjects;
            v62 = 1;
            while v62 <= v65 do
                local v66 = 0;
                local l_character_0 = v47.subjects[v62].character;
                local v68 = 0;
                if l_character_0.PrimaryPart then
                    v68 = (Vector3.new(l_character_0:GetPrimaryPartCFrame().p.x, v55.Position.Y, l_character_0:GetPrimaryPartCFrame().p.z) - v55.Position).Magnitude;
                else
                    local l_l_character_0_BoundingBox_0, v70 = l_character_0:GetBoundingBox();
                    v68 = (l_l_character_0_BoundingBox_0.Position - v55.Position).Magnitude - v70.Z;
                end;
                if v68 < v51 then
                    if v65 > 3 then
                        v66 = 1;
                    else
                        local v71 = v51 * 0.75;
                        v66 = if v68 < v71 then v9 else (1 - (v68 - v71) / (v51 - v71)) * v9;
                    end;
                end;
                if not v47.subjects[v62].lastTransparency then
                    v47.subjects[v62].transparencyDirty = true;
                end;
                v66 = math.clamp(v66, 0, 1);
                if v47.subjects[v62].transparencyDirty or v47.subjects[v62].lastTransparency ~= v66 then
                    for v72, _ in pairs(v47.subjects[v62].cachedParts) do
                        v72.LocalTransparencyModifier = v66;
                    end;
                    v47.subjects[v62].transparencyDirty = false;
                    v47.subjects[v62].lastTransparency = v66;
                end;
                local l_Tool_0 = l_character_0:FindFirstChildOfClass("Tool");
                if l_Tool_0 then
                    for _, v76 in pairs(l_Tool_0:GetChildren()) do
                        if v76:IsA("BasePart") then
                            v76.LocalTransparencyModifier = v66;
                        end;
                    end;
                end;
                v62 = v62 + 1;
            end;
            return;
        end;
    end;
end;
return v5;