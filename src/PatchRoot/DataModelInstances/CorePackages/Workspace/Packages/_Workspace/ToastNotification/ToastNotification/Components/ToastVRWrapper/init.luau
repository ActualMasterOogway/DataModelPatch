local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_VRConstants_0 = require(l_Parent_0.VrCompatibility).VRConstants;
local l_GetFFlagAdjustVRFloor_0 = require(l_Parent_0.SharedFlags).GetFFlagAdjustVRFloor;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_Constants_0 = v3.Core.VR.Constants;
local v8 = game:DefineFastFlag("RepositionInExperienceVRToasts", false);
return function(v9) --[[ Line: 30 ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy), l_VRConstants_0 (copy), l_GetFFlagAdjustVRFloor_0 (copy), v8 (copy), l_Constants_0 (copy), l_Panel3D_0 (copy)
    local l_isConfirmModalOpen_0 = v9.isConfirmModalOpen;
    local l_isToastOpen_0 = v9.isToastOpen;
    local l_isCoreScript_0 = v9.isCoreScript;
    local l_ToastComponent_0 = v9.ToastComponent;
    local l_ConfirmationModalComponent_0 = v9.ConfirmationModalComponent;
    local v15 = v2.useRef(nil);
    local v16 = l_GuiService_0.CoreGuiFolder and l_GuiService_0.CoreGuiFolder:FindFirstChild(l_VRConstants_0.PositionLockedPanelName);
    if v16 then
        v15.current = v16;
    else
        v16 = v15.current;
    end;
    local v17 = if v16 then v16.Size.Y else 2.45;
    local v18 = {
        partSize = l_VRConstants_0.ToastSize, 
        offset = l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.ToastPosition or CFrame.lookAt(l_VRConstants_0.ToastPosition, l_VRConstants_0.DefaultCameraPosition), 
        virtualScreenSize = l_VRConstants_0.ToastResolution, 
        curvature = l_VRConstants_0.ToastCurvature, 
        panelName = "ToastNotifications", 
        hidden = not l_isToastOpen_0
    };
    if l_isCoreScript_0 then
        local v20 = v2.useCallback(function(v19) --[[ Line: 65 ]]
            -- upvalues: v16 (ref), v8 (ref), v17 (copy)
            if v16 then
                if v8 then
                    return v16.CFrame * CFrame.new(0, v17 * -0.53, v17 * -0.15) * CFrame.Angles(0.25, 0, 0);
                else
                    return v16.CFrame * CFrame.new(0, v17 * -0.45, v17 * -0.15) * CFrame.Angles(0.2, 0, 0);
                end;
            else
                return v19.panelCFrame;
            end;
        end, {
            v16, 
            v17
        });
        v18 = {
            panelName = "ToastNotifications", 
            partSize = if v8 then Vector3.new(1, 0.5, 0, 0) else Vector3.new(1.2000000476837158, 0.6000000238418579, 0, 0), 
            virtualScreenSize = Vector2.new(300, 150), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isToastOpen_0, 
            tiltCallback = v20
        };
    end;
    local v22 = v2.useCallback(function(v21) --[[ Line: 96 ]]
        -- upvalues: v16 (ref)
        if v16 then
            return v16.CFrame * CFrame.new(0, 0, -0.1);
        else
            return v21.panelCFrame;
        end;
    end, {
        v16
    });
    return v2.createElement(v2.Fragment, nil, {
        v2.createElement(l_Panel3D_0, v18, {
            Toast = l_ToastComponent_0
        }), 
        v2.createElement(l_Panel3D_0, {
            panelName = "ConfirmationModal", 
            partSize = Vector3.new(3, 3, 0, 0), 
            virtualScreenSize = Vector2.new(600, 600), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isConfirmModalOpen_0, 
            tiltCallback = v22
        }, {
            DeeplinkConfirmationModal = l_ConfirmationModalComponent_0
        })
    });
end;