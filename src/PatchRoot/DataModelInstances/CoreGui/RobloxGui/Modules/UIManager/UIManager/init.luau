local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v3 = require(l_RobloxGui_0.Modules.VR.VRHub);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Constants);
local l_PanelType_0 = v5.PanelType;
local l_SpatialUIType_0 = v5.SpatialUIType;
local v8 = require(script.Parent.createCompatPanel);
local v9 = CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0);
local v10 = workspace.CurrentCamera.HeadScale / 0.3;
local v11 = CFrame.new(-0.14 * v10, -0.24 * v10, -0.64 * v10);
local v12 = Vector2.new(0.8 * v10, 0.56 * v10);
local v13 = v11 * v9;
local _ = function(v14) --[[ Line: 47 ]] --[[ Name: getYAxisStablizedCFrame ]]
    local _, v16, v17 = v14:ToOrientation();
    return CFrame.new(v14.Position) * CFrame.fromOrientation(0, v16, v17);
end;
local function v27(v19) --[[ Line: 52 ]] --[[ Name: getCameraOffsetFromHeadRotationWithZAxisStabl ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CFrame_0 = workspace.CurrentCamera.CFrame;
    local v21, v22, v23 = l_CFrame_0:ToOrientation();
    local v24 = CFrame.new(l_CFrame_0.Position) * CFrame.fromOrientation(0, v22, v23);
    v21 = v24 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v25, v26;
    v23, v25, v26 = v21:ToOrientation();
    v23 = (CFrame.new(v21.Position) * CFrame.fromOrientation(0, v25, v26)):ToWorldSpace(v19);
    v25, v26 = v23:ToOrientation();
    return v24:ToObjectSpace(CFrame.new(v23.Position) * CFrame.fromOrientation(v25, v26, 0));
end;
local function _(v28) --[[ Line: 66 ]] --[[ Name: getPanelPart ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    if v28.uiType == l_SpatialUIType_0.SpatialUI or v28.uiType == l_SpatialUIType_0.SpatialUIRoact then
        return v28.panelObject.Adornee;
    elseif v28.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
        return v28.panelObject;
    else
        return nil;
    end;
end;
local function _(v30) --[[ Line: 77 ]] --[[ Name: panelExistsInSpace ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    local v31 = false;
    if v30 ~= nil then
        v31 = false;
        if v30.panelObject ~= nil then
            v31 = v30.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    return v31;
end;
local v33 = {};
v33.__index = v33;
v33.removeRoactPanel = function(v34, v35) --[[ Line: 93 ]] --[[ Name: removeRoactPanel ]]
    v34.uiElements[v35] = nil;
end;
v33.registerRoactPanel = function(v36, v37, v38) --[[ Line: 97 ]] --[[ Name: registerRoactPanel ]]
    v36.uiElements[v37] = v38;
    v36:updateUIGroupsForCurHeadCFrame();
end;
v33.createUI = function(v39, v40) --[[ Line: 106 ]] --[[ Name: createUI ]]
    -- upvalues: v8 (copy)
    local v41 = v8(v40);
    if v41 == nil then
        return nil;
    else
        v39.uiElements[v40.panelType] = v41;
        v39:updatePanelForCurHeadCFrame(v40.panelType);
        return {
            type = v41.uiType, 
            panelObject = v41.panelObject
        };
    end;
end;
v33.resetUIGroupsHeadRotationToDefault = function(v42) --[[ Line: 119 ]] --[[ Name: resetUIGroupsHeadRotationToDefault ]]
    for _, v44 in pairs(v42.uiGroups) do
        v44.positionProps.uiGroupHeadRotation = v44.positionProps.defaultGroupHeadRotation;
    end;
end;
v33.updateUIGroupForCurHeadCFrame = function(v45, v46) --[[ Line: 125 ]] --[[ Name: updateUIGroupForCurHeadCFrame ]]
    -- upvalues: v27 (copy)
    local v47 = v45.uiGroups[v46];
    local v48 = v27(v47.positionProps.uiGroupHeadRotation);
    v47.positionProps.uiGroupCameraOffSet = v48;
    v45:updatePanelsInUIGroupForCurHeadCFrame(v46);
end;
v33.updateUIGroupsForCurHeadCFrame = function(v49) --[[ Line: 136 ]] --[[ Name: updateUIGroupsForCurHeadCFrame ]]
    for v50, _ in pairs(v49.uiGroups) do
        v49:updateUIGroupForCurHeadCFrame(v50);
    end;
end;
v33.updatePanelForCurHeadCFrame = function(v52, v53) --[[ Line: 142 ]] --[[ Name: updatePanelForCurHeadCFrame ]]
    -- upvalues: l_SpatialUIType_0 (copy), v27 (copy)
    local v54 = v52.uiElements[v53];
    local v55 = false;
    if v54 ~= nil then
        v55 = false;
        if v54.panelObject ~= nil then
            v55 = v54.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    if v55 and v54.panelPositionProps and v54.panelPositionProps.cameraFixedPanelProp then
        v55 = v54.panelPositionProps;
        local l_cameraFixedPanelProp_0 = v55.cameraFixedPanelProp;
        local v57 = v27(v52.uiGroups[v55.uiGroup].positionProps.uiGroupHeadRotation);
        local v58 = if not (v54.uiType ~= l_SpatialUIType_0.SpatialUI) or v54.uiType == l_SpatialUIType_0.SpatialUIRoact then v54.panelObject.Adornee else if v54.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v54.panelObject else nil;
        if v58 == nil then
            return;
        else
            local l_CFrame_1 = workspace.CurrentCamera.CFrame;
            local _, v61, v62 = l_CFrame_1:ToOrientation();
            v58.CFrame = CFrame.new(l_CFrame_1.Position) * CFrame.fromOrientation(0, v61, v62) * v57;
            v58.CFrame = v58.CFrame:ToWorldSpace(l_cameraFixedPanelProp_0.uiGroupElementOffset);
        end;
    end;
end;
v33.updatePanelsInUIGroupForCurHeadCFrame = function(v63, v64) --[[ Line: 164 ]] --[[ Name: updatePanelsInUIGroupForCurHeadCFrame ]]
    for v65, v66 in pairs(v63.uiElements) do
        if v66.panelPositionProps and v66.panelPositionProps.uiGroup == v64 then
            v63:updatePanelForCurHeadCFrame(v65);
        end;
    end;
end;
v33.updatePanelsForCurHeadCFrame = function(v67) --[[ Line: 178 ]] --[[ Name: updatePanelsForCurHeadCFrame ]]
    for v68, _ in pairs(v67.uiElements) do
        v67:updatePanelForCurHeadCFrame(v68);
    end;
end;
v33.setUpUiGroups = function(v70) --[[ Line: 184 ]] --[[ Name: setUpUiGroups ]]
    -- upvalues: v13 (copy), v27 (copy), v12 (copy), v5 (copy)
    local v71 = {
        positionProps = {
            uiGroupHeadRotation = v13, 
            uiGroupCameraOffSet = v27(v13), 
            defaultGroupHeadRotation = v13
        }, 
        uiContainerSize = v12
    };
    v70.uiGroups[v5.SpatialUIGroupType.MainUIGroup] = v71;
end;
v33.step = function(v72) --[[ Line: 197 ]] --[[ Name: step ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy), l_PanelType_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for v73, v74 in pairs(v72.uiElements) do
            local v75 = false;
            if v74 ~= nil then
                v75 = false;
                if v74.panelObject ~= nil then
                    v75 = v74.uiType ~= l_SpatialUIType_0.ScreenUI;
                end;
            end;
            if v75 and v73 == l_PanelType_0.RobloxGui then
                v75 = nil;
                local v76, v77, _ = (if v74.uiType == l_SpatialUIType_0.SpatialUI then v74.panelObject.Adornee else v74.panelObject).CFrame:ToOrientation();
                local v79, v80, _ = (workspace.CurrentCamera.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation();
                if math.abs(v77 - v80) > 1.7453292519943295 or math.abs(v76 - v79) > 1.7453292519943295 then
                    v72:updateUIGroupsForCurHeadCFrame();
                end;
            end;
        end;
        return;
    end;
end;
v33.onShowTopBarChanged = function(v82) --[[ Line: 227 ]] --[[ Name: onShowTopBarChanged ]]
    -- upvalues: l_VRService_0 (copy), v3 (copy), l_SpatialUIType_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    elseif v3.ShowTopBar then
        v82:resetUIGroupsHeadRotationToDefault();
        v82:updateUIGroupsForCurHeadCFrame();
        for _, v84 in pairs(v82.uiElements) do
            if v84.uiType == l_SpatialUIType_0.SpatialUI or v84.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_0 = v84.panelObject;
                l_panelObject_0.Enabled = true;
                l_panelObject_0.Adornee.Parent = workspace;
            elseif v84.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v84.panelObject.Parent = workspace;
            end;
        end;
        return;
    else
        for _, v87 in pairs(v82.uiElements) do
            if v87.uiType == l_SpatialUIType_0.SpatialUI or v87.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_1 = v87.panelObject;
                l_panelObject_1.Enabled = false;
                l_panelObject_1.Adornee.Parent = nil;
            elseif v87.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v87.panelObject.Parent = nil;
            end;
        end;
        return;
    end;
end;
v33.cameraMoved = function(v89) --[[ Line: 260 ]] --[[ Name: cameraMoved ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for _, v91 in pairs(v89.uiElements) do
            local v92 = false;
            if v91 ~= nil then
                v92 = false;
                if v91.panelObject ~= nil then
                    v92 = v91.uiType ~= l_SpatialUIType_0.ScreenUI;
                end;
            end;
            if v92 and v91.panelPositionProps and v91.panelPositionProps.cameraFixedPanelProp then
                v92 = v91.panelPositionProps;
                local l_cameraFixedPanelProp_1 = v92.cameraFixedPanelProp;
                local v94 = if not (v91.uiType ~= l_SpatialUIType_0.SpatialUI) or v91.uiType == l_SpatialUIType_0.SpatialUIRoact then v91.panelObject.Adornee else if v91.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v91.panelObject else nil;
                if v94 == nil then
                    return;
                else
                    local l_CFrame_2 = workspace.CurrentCamera.CFrame;
                    local _, v97, v98 = l_CFrame_2:ToOrientation();
                    v94.CFrame = CFrame.new(l_CFrame_2.Position) * CFrame.fromOrientation(0, v97, v98) * v89.uiGroups[v92.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(l_cameraFixedPanelProp_1.uiGroupElementOffset);
                end;
            end;
        end;
        return;
    end;
end;
v33.new = function() --[[ Line: 285 ]] --[[ Name: new ]]
    -- upvalues: v33 (copy), l_RunService_0 (copy), v3 (copy)
    local v99 = {
        uiElements = {}, 
        uiGroups = {}
    };
    setmetatable(v99, v33);
    v99:setUpUiGroups();
    v99:updateUIGroupsForCurHeadCFrame();
    l_RunService_0:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ Line: 297 ]]
        -- upvalues: v99 (copy)
        v99:step();
    end);
    v3.ShowTopBarChanged.Event:connect(function() --[[ Line: 301 ]]
        -- upvalues: v99 (copy)
        v99:onShowTopBarChanged();
    end);
    workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 306 ]]
        -- upvalues: v99 (copy)
        v99:cameraMoved();
    end);
    return v99;
end;
return v33.new();