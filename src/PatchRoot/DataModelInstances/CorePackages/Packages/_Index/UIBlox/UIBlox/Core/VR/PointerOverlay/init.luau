local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.Roact);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local _ = require(l_Parent_0.Constants);
local v9 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v10 = {
    VRService = game:GetService("VRService"), 
    UpdateEvent = l_RunService_0.Heartbeat
};
local function v13(v11, v12) --[[ Line: 47 ]] --[[ Name: setLaserPointerModeBasedOnUserCFrame ]]
    if v12:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and v12:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v11.current:setMode(v11.current.Mode.DualPointer);
        return;
    elseif not v12:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and not v12:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v11.current:setMode(v11.current.Mode.Disabled);
        return;
    else
        v11.current:setMode(v11.current.Mode.Pointer);
        return;
    end;
end;
return function(v14) --[[ Line: 63 ]] --[[ Name: PointerOverlay ]]
    -- upvalues: l_Object_0 (copy), v10 (copy), v4 (copy), v9 (copy), v13 (copy), l_ContextActionService_0 (copy), v5 (copy), l_EventConnection_0 (copy)
    local v15 = l_Object_0.assign({}, v10, v14);
    local l_LaserPointer_0 = v15.LaserPointer;
    local l_VRControllerModel_0 = v15.VRControllerModel;
    local l_VRService_0 = v15.VRService;
    local v19 = v4.useRef(nil);
    local v20 = v4.useRef(nil);
    local v21 = v4.useRef(nil);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 76 ]]
        -- upvalues: l_VRService_0 (copy)
        return l_VRService_0:GetPropertyChangedSignal("VRSessionState");
    end);
    local v24 = v4.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy), l_LaserPointer_0 (copy), v9 (ref), v13 (ref), l_VRService_0 (copy), v20 (copy), l_VRControllerModel_0 (copy), v21 (copy), l_ContextActionService_0 (ref)
        if not v19.current then
            v19.current = l_LaserPointer_0.new();
            if v9.enableBetterLaserPointerMode then
                v13(v19, l_VRService_0);
            else
                v19.current:setMode(v19.current.Mode.DualPointer);
            end;
            v19.current:setEnableAmbidexterousPointer(true);
            v20.current = l_VRControllerModel_0.new(Enum.UserCFrame.LeftHand);
            v21.current = l_VRControllerModel_0.new(Enum.UserCFrame.RightHand);
        end;
        v20.current:setEnabled(l_VRService_0.VREnabled);
        v21.current:setEnabled(l_VRService_0.VREnabled);
        if l_VRService_0.VREnabled then
            l_ContextActionService_0:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        end;
    end, {
        v20, 
        v21, 
        v19, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v25 = nil;
    v25 = v4.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: v20 (copy), v21 (copy), v19 (copy), v9 (ref), l_ContextActionService_0 (ref)
        if v20.current then
            v20.current:setEnabled(false);
        end;
        if v21.current then
            v21.current:setEnabled(false);
        end;
        if v19.current then
            if v9.fixLaserPointerDisable then
                v19.current:disableComponent();
            else
                v19.current:setMode(v19.current.Mode.Disabled);
            end;
        end;
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
    end, {
        v20, 
        v21, 
        v19, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v28 = v4.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: l_VRService_0 (copy), v19 (copy), v9 (ref), v13 (ref), v20 (copy), v21 (copy)
        local v26 = true;
        if l_VRService_0.VRSessionState ~= Enum.VRSessionState.Idle then
            v26 = l_VRService_0.VRSessionState == Enum.VRSessionState.Visible;
        end;
        local v27 = not v26;
        if v19.current then
            if v27 then
                if v9.enableBetterLaserPointerMode then
                    v13(v19, l_VRService_0);
                else
                    v19.current:setMode(v19.current.Mode.DualPointer);
                end;
            else
                v19.current:setMode(v19.current.Mode.Disabled);
            end;
        end;
        if v20.current then
            v20.current:setEnabled(v27);
        end;
        if v21.current then
            v21.current:setEnabled(v27);
        end;
    end, {
        v20, 
        v21, 
        v19, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v29 = v4.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v13 (ref), v19 (copy), l_VRService_0 (copy)
        v13(v19, l_VRService_0);
    end, {
        v19
    });
    v4.useEffect(function() --[[ Line: 154 ]]
        -- upvalues: l_VRService_0 (copy), v24 (copy), v25 (ref)
        if l_VRService_0.VREnabled then
            v24();
        end;
        return v25;
    end, {});
    return v4.createElement(v5.Portal, {
        target = workspace
    }, {
        UserCFrameChangedConnection = v4.createElement(l_EventConnection_0, {
            event = v15.UpdateEvent, 
            callback = function() --[[ Line: 166 ]] --[[ Name: callback ]]
                -- upvalues: v19 (copy), v20 (copy), v21 (copy)
                if v19.current then
                    v19.current:update();
                end;
                if v20.current then
                    v20.current:update();
                end;
                if v21.current then
                    v21.current:update();
                end;
            end
        }), 
        VREnabledConnection = v4.createElement(l_EventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v24
        }), 
        VRUserCFrameEnabledConnection = if v9.enableBetterLaserPointerMode then v4.createElement(l_EventConnection_0, {
            event = l_VRService_0.UserCFrameEnabled, 
            callback = v29
        }) else nil, 
        VRSessionStateConnection = if l_status_0 then v4.createElement(l_EventConnection_0, {
            event = l_result_0, 
            callback = v28
        }) else nil
    });
end;