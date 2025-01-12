local l_CorePackages_0 = game:GetService("CorePackages");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local v3 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v4 = require(script.Parent.Parent.Flags.GetFFlagSelfieViewFixMigration);
local l_GetFFlagSelfieViewMoreFixMigration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfieViewMoreFixMigration;
local v6 = require(script.Parent.Parent.Flags.GetFFlagSelfieViewGyroMigration);
local v7 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
local function v9(v8) --[[ Line: 30 ]] --[[ Name: getFaceControls ]]
    if v8 == nil then
        return;
    else
        return (v8:FindFirstChildWhichIsA("FaceControls", true));
    end;
end;
local function v17(v10, v11) --[[ Line: 37 ]] --[[ Name: getNeck ]]
    -- upvalues: v6 (copy)
    if v10 == nil or v11 == nil then
        return nil;
    else
        local l_v10_Descendants_0 = v10:GetDescendants();
        for _, v14 in l_v10_Descendants_0 do
            if v14:IsA("Motor6D") and (v14.Part1 == v11 or v14.Name == "Neck") then
                return v14;
            end;
        end;
        if v6() then
            for _, v16 in l_v10_Descendants_0 do
                if v16:IsA("AnimationConstraint") and v16.Parent == v11 and (v16.Attachment0.Name == "NeckRigAttachment" or v16.Name == "Neck") then
                    return v16;
                end;
            end;
        end;
        return nil;
    end;
end;
local function v23(v18, v19, v20) --[[ Line: 64 ]] --[[ Name: findObjectOfNameAndTypeName ]]
    -- upvalues: l_GetFFlagSelfieViewMoreFixMigration_0 (copy)
    if l_GetFFlagSelfieViewMoreFixMigration_0() and v20 == nil then
        return nil;
    else
        for _, v22 in (v20:GetDescendants()) do
            if l_GetFFlagSelfieViewMoreFixMigration_0() then
                if v22:IsA(v19) and v22.Name == v18 then
                    return v22;
                end;
            elseif v22.Name == v18 and v22:IsA(v19) then
                return v22;
            end;
        end;
        return nil;
    end;
end;
local function v27(v24) --[[ Line: 83 ]] --[[ Name: getHead ]]
    -- upvalues: v4 (copy), v23 (copy)
    if not v24 then
        return nil;
    else
        local v25 = nil;
        local v26 = if v24 == nil then nil else v24:FindFirstChildWhichIsA("FaceControls", true);
        if v26 ~= nil then
            if v4() then
                if v26.Parent and (v26.Parent.ClassName == "MeshPart" or v26.Parent.ClassName == "Part") then
                    v25 = v26.Parent;
                end;
            else
                v25 = v26.Parent;
            end;
        end;
        if not v25 then
            v25 = v23("Head", "MeshPart", v24);
        end;
        if not v25 then
            v25 = v23("Head", "Part", v24);
        end;
        return v25;
    end;
end;
local function v34(v28, v29) --[[ Line: 120 ]] --[[ Name: getAnimator ]]
    -- upvalues: v3 (copy), l_GetFFlagSelfieViewMoreFixMigration_0 (copy)
    local v30 = nil;
    local v31 = nil;
    if v29 > 0 then
        if v3 then
            if l_GetFFlagSelfieViewMoreFixMigration_0() then
                local v32 = v28:WaitForChild("Humanoid", v29);
                v31 = if v32 then if v32:IsA("Humanoid") then v32 else v28:FindFirstChildWhichIsA("Humanoid") else v28:FindFirstChildWhichIsA("Humanoid");
            else
                local v33 = v28:WaitForChild("Humanoid", v29);
                v31 = if v33:IsA("Humanoid") then v33 else v28:FindFirstChildWhichIsA("Humanoid");
            end;
        else
            v31 = v28:WaitForChild("Humanoid", v29);
        end;
    else
        v31 = if v3 then v28:FindFirstChildWhichIsA("Humanoid") else v28:FindFirstChild("Humanoid");
    end;
    if v31 ~= nil then
        v30 = if v29 > 0 then v31:WaitForChild("Animator", v29) else v31:FindFirstChild("Animator");
    end;
    if v30 == nil then
        v30 = v28:FindFirstChildWhichIsA("Animator", true);
    end;
    return v30;
end;
local v35 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local function v40(v36, v37) --[[ Line: 191 ]] --[[ Name: updateTransparency ]]
    -- upvalues: v35 (copy), l_GetFFlagSelfieViewMoreFixMigration_0 (copy), l_CollectionService_0 (copy)
    for _, v39 in ipairs(v36:GetDescendants()) do
        if v39:IsA("Decal") then
            v39.Transparency = 0;
        elseif v39:IsA("MeshPart") then
            if v39.Parent and v39.Parent:IsA("Accessory") or table.find(v35, v39.Name) then
                if not table.find(v37, v39.MeshId) then
                    v37[v39.MeshId] = v39.Transparency;
                else
                    v39.Transparency = v37[v39.MeshId];
                end;
            end;
        elseif v39:IsA("Part") then
            if v39.Parent and v39.Parent:IsA("Accessory") or table.find(v35, v39.Name) then
                v39.Transparency = 0;
            end;
            if l_GetFFlagSelfieViewMoreFixMigration_0() and l_CollectionService_0:HasTag(v39, "__RBX__LOCKED_TRANSPARENT") then
                v39.Transparency = 1;
            end;
        end;
    end;
end;
local function v42(v41) --[[ Line: 220 ]] --[[ Name: shouldMarkCloneDirtyForDescendant ]]
    -- upvalues: v7 (copy)
    if v41:IsA("MeshPart") or v41:IsA("Part") or v41:IsA("Decal") then
        if v41.Transparency < 1 then
            return true;
        end;
    elseif v7[v41.ClassName] then
        return true;
    end;
    return false;
end;
local function v46(v43) --[[ Line: 233 ]] --[[ Name: resetPartOrientation ]]
    for _, v45 in ipairs(v43:GetDescendants()) do
        if v45:IsA("Motor6D") then
            v45.C0 = CFrame.new(v45.C0.Position);
            v45.C1 = CFrame.new(v45.C1.Position);
        end;
    end;
end;
local function _(v47, v48) --[[ Line: 242 ]] --[[ Name: removeChild ]]
    local l_v47_FirstChild_0 = v47:FindFirstChild(v48);
    if l_v47_FirstChild_0 then
        l_v47_FirstChild_0:Destroy();
    end;
end;
local function v55(v51) --[[ Line: 248 ]] --[[ Name: removeScripts ]]
    local l_Animate_0 = v51:FindFirstChild("Animate");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    l_Animate_0 = v51:FindFirstChild("Health");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    for _, v54 in pairs(v51:GetDescendants()) do
        if v54:IsA("BaseScript") then
            v54:Destroy();
        end;
    end;
end;
local function v65(v56) --[[ Line: 259 ]] --[[ Name: removeTags ]]
    -- upvalues: l_CollectionService_0 (copy), v4 (copy)
    local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v56);
    for _, v59 in ipairs(l_l_CollectionService_0_Tags_0) do
        if v4() then
            if v59 ~= "NoFace" then
                l_CollectionService_0:RemoveTag(v56, v59);
            end;
        else
            l_CollectionService_0:RemoveTag(v56, v59);
        end;
    end;
    for _, v61 in ipairs(v56:GetDescendants()) do
        local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v61);
        for _, v64 in ipairs(l_l_CollectionService_0_Tags_1) do
            if v4() then
                if v64 ~= "NoFace" then
                    l_CollectionService_0:RemoveTag(v61, v64);
                end;
            else
                l_CollectionService_0:RemoveTag(v61, v64);
            end;
        end;
    end;
    l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v56);
end;
local v66 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = l_game_EngineFeature_0 and "AnimationConstraint" or nil, 
    BallSocketConstraint = l_game_EngineFeature_0 and "BallSocketConstraint" or nil, 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink", 
    Folder = v4() and "Folder" or nil, 
    RigidConstraint = v4() and "RigidConstraint" or nil
};
local function v67(v68) --[[ Line: 323 ]] --[[ Name: disableScripts ]]
    -- upvalues: v67 (copy)
    for _, v70 in v68:GetChildren() do
        if v70:IsA("Script") then
            v70.Disabled = true;
            v70.Parent = nil;
        end;
        v67(v70);
    end;
end;
local function v71(v72) --[[ Line: 333 ]] --[[ Name: removeUI ]]
    -- upvalues: v71 (copy)
    for _, v74 in v72:GetChildren() do
        if v74:IsA("GuiObject") or v74:IsA("ScreenGui") or v74:IsA("BillboardGui") or v74:IsA("AdGui") or v74:IsA("SurfaceGui") then
            v74.Parent = nil;
        end;
        v71(v74);
    end;
end;
local function v75(v76) --[[ Line: 348 ]] --[[ Name: removeInstancesStrict ]]
    -- upvalues: v66 (copy), v75 (copy)
    for _, v78 in v76:GetChildren() do
        if not v66[v78.ClassName] then
            v78.Parent = nil;
        end;
        v75(v78);
    end;
end;
return {
    getFaceControls = v9, 
    getNeck = v17, 
    getHead = v27, 
    getAnimator = v34, 
    updateTransparency = v40, 
    shouldMarkCloneDirtyForDescendant = v42, 
    resetPartOrientation = v46, 
    removeScripts = v55, 
    removeTags = v65, 
    sanitizeCharacter = function(v79) --[[ Line: 357 ]] --[[ Name: sanitizeCharacter ]]
        -- upvalues: v75 (copy)
        if not v79 then
            return;
        else
            v75(v79);
            return;
        end;
    end, 
    isValidAvatar = function(v80) --[[ Line: 365 ]] --[[ Name: isValidAvatar ]]
        -- upvalues: v34 (copy), v27 (copy)
        if not v34(v80, 10) then
            return false;
        elseif not v27(v80) then
            return false;
        else
            return true;
        end;
    end, 
    hasDynamicHead = function(v81) --[[ Line: 379 ]] --[[ Name: hasDynamicHead ]]
        return (if v81 == nil then nil else v81:FindFirstChildWhichIsA("FaceControls", true)) ~= nil;
    end
};