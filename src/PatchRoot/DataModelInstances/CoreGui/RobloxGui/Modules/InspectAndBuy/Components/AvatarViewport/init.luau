local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.CharacterModelPool);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = v5.PureComponent:extend("AvatarViewport");
v11.init = function(v12) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v12.viewportFrameRef = v5.createRef();
    v12.worldModelRef = v5.createRef();
    v12.connections = {};
    v12.xRotation = 0;
    v12.yRotation = 0;
    v12.rotationDeltaX = 0;
    v12.rotationDeltaY = 0;
    v12.mouseOrTouchDown = false;
    v12.delta = 0;
    v12.keys = {};
    v12.lastPosition = Vector3.new(0, 0, 0, 0);
    v12.viewportCamera = Instance.new("Camera");
    v12.viewportCamera.CameraType = Enum.CameraType.Scriptable;
    v12.model = v12.props.model;
    v12.lastInputTime = 2;
    v12.initialHrpPosition = v12.props.model ~= nil and v12.props.model.HumanoidRootPart.Position or nil;
end;
v11.didMount = function(v13) --[[ Line: 41 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    if v13.props.humanoidDescription and v13.model then
        v13.viewportCamera.Parent = v13.viewportFrameRef.current;
        v13.viewportFrameRef.current.CurrentCamera = v13.viewportCamera;
        v13:setRotation();
        local l_RigType_0 = v13.model.Humanoid.RigType;
        v13.characterModelPool = v9.new(v13.worldModelRef, v13.initialHrpPosition, l_RigType_0);
    end;
    v13.isMounted = true;
    v13:handleSpin();
    v13:setUpGamepad();
end;
v11.didUpdate = function(v15, v16, _) --[[ Line: 56 ]] --[[ Name: didUpdate ]]
    if v15.props.visible and v15.props.humanoidDescription ~= v16.humanoidDescription and v15.model then
        coroutine.wrap(function() --[[ Line: 58 ]]
            -- upvalues: v15 (copy)
            v15.characterModelPool:maybeUpdateCharacter(v15.props.humanoidDescription);
        end)();
    end;
    v15.gamepadRotating = false;
    v15.viewportCamera.Parent = v15.viewportFrameRef.current;
    v15.viewportFrameRef.current.CurrentCamera = v15.viewportCamera;
    if v15.props.gamepadEnabled ~= v16.gamepadEnabled then
        if v15.props.gamepadEnabled then
            v15:setUpGamepad();
            return;
        else
            v15:unbindActions();
        end;
    end;
end;
v11.setRotation = function(v18) --[[ Line: 77 ]] --[[ Name: setRotation ]]
    local l_model_0 = v18.model;
    local l_view_0 = v18.props.view;
    local v21 = nil;
    v21 = v18.props.views[l_view_0];
    if l_model_0 then
        local l_HumanoidRootPart_0 = l_model_0.HumanoidRootPart;
        local v23 = v18.initialHrpPosition or l_HumanoidRootPart_0.Position;
        local l_DefaultCameraOffset_0 = v21.DefaultCameraOffset;
        if v18.model:FindFirstChildOfClass("Tool") then
            l_DefaultCameraOffset_0 = v21.ToolOffset;
        end;
        local l_p_0 = (CFrame.new(v23) * CFrame.Angles(0, -v18.yRotation, 0) * CFrame.Angles(v18.xRotation, 0, 0) * l_DefaultCameraOffset_0).p;
        v18.viewportCamera.CFrame = CFrame.new(l_p_0, v23);
    end;
end;
v11.render = function(v26) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v8 (copy), l_UserInputService_0 (copy)
    local l_size_0 = v26.props.size;
    local l_position_0 = v26.props.position;
    local l_visible_0 = v26.props.visible;
    local l_backgroundTransparency_0 = v26.props.backgroundTransparency;
    local l_setScrollingEnabled_0 = v26.props.setScrollingEnabled;
    return v5.createElement("ViewportFrame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = l_position_0, 
        Size = l_size_0, 
        BackgroundTransparency = l_backgroundTransparency_0, 
        BackgroundColor3 = v8.Graphite, 
        BorderSizePixel = 0, 
        Active = true, 
        Visible = l_visible_0, 
        [v5.Ref] = v26.viewportFrameRef, 
        [v5.Event.InputBegan] = function(_, v33) --[[ Line: 120 ]]
            -- upvalues: v26 (copy), l_setScrollingEnabled_0 (copy), l_UserInputService_0 (ref)
            if v33.UserInputState == Enum.UserInputState.Begin then
                v26.mouseOrTouchDown = true;
                v26.lastPosition = v33.Position;
                l_setScrollingEnabled_0(false);
                local v37 = l_UserInputService_0.InputChanged:connect(function(v34, _) --[[ Line: 126 ]]
                    -- upvalues: v26 (ref)
                    if v34.UserInputType == Enum.UserInputType.MouseMovement and v26.mouseOrTouchDown or v34.UserInputType == Enum.UserInputType.Touch then
                        local v36 = v34.Position - v26.lastPosition;
                        v26.lastPosition = v34.Position;
                        v26.yRotation = v26.yRotation + v36.x * 0.0065;
                        v26.xRotation = v26.xRotation + v36.y * 0.0065;
                        v26.lastInputTime = tick();
                    end;
                end);
                local v40 = l_UserInputService_0.InputEnded:connect(function(v38, _) --[[ Line: 139 ]]
                    -- upvalues: v26 (ref), l_setScrollingEnabled_0 (ref)
                    if v38.UserInputType == Enum.UserInputType.MouseButton1 or v38.UserInputType == Enum.UserInputType.Touch then
                        if v26.mouseOrTouchDown then
                            v26.mouseOrTouchDown = false;
                            v26.lastInputTime = tick();
                            v26:removeConnections();
                        end;
                        l_setScrollingEnabled_0(true);
                    end;
                end);
                table.insert(v26.connections, v37);
                table.insert(v26.connections, v40);
            end;
        end
    }, {
        WorldModel = v5.createElement("WorldModel", {
            [v5.Ref] = v26.worldModelRef
        })
    });
end;
v11.handleSpin = function(v41) --[[ Line: 166 ]] --[[ Name: handleSpin ]]
    -- upvalues: l_RunService_0 (copy)
    local v42 = false;
    spawn(function() --[[ Line: 168 ]]
        -- upvalues: v41 (copy), v42 (ref), l_RunService_0 (ref)
        local v43 = false;
        while v41.isMounted do
            if tick() - v41.lastInputTime > 2 and not v41.mouseOrTouchDown and not v41.gamepadRotating then
                v42 = true;
            else
                v42 = false;
            end;
            local function _(v44, v45) --[[ Line: 181 ]] --[[ Name: returnToDefaultPosition ]]
                v44 = v44 % 6.283185307179586;
                if v44 > 3.141592653589793 then
                    v44 = v44 + v45;
                    if v44 > 6.283185307179586 then
                        return 0;
                    end;
                else
                    v44 = v44 - v45;
                    if v44 < 0 then
                        return 0;
                    end;
                end;
                return v44;
            end;
            if v42 then
                local l_v41_0 = v41;
                local v48 = v41.xRotation % 6.283185307179586;
                local v49;
                if v48 > 3.141592653589793 then
                    v48 = v48 + 0.03490658503988659;
                    if v48 > 6.283185307179586 then
                        v49 = 0;
                        v43 = true;
                    end;
                else
                    v48 = v48 - 0.03490658503988659;
                    if v48 < 0 then
                        v49 = 0;
                        v43 = true;
                    end;
                end;
                if not v43 then
                    if not v43 then
                        v49 = v48;
                    end;
                end;
                v43 = false;
                l_v41_0.xRotation = v49;
                v41.yRotation = v41.yRotation + 0.012217304763960306;
            elseif v41.gamepadRotating then
                v41.yRotation = v41.yRotation + v41.delta * v41.rotationDeltaY;
                v41.xRotation = v41.xRotation + v41.delta * v41.rotationDeltaX;
            end;
            v41:setRotation();
            v41.delta = l_RunService_0.RenderStepped:wait();
        end;
    end);
end;
v11.setUpGamepad = function(v50) --[[ Line: 211 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_ContextActionService_0 (copy)
    if l_UserInputService_0.GamepadEnabled then
        local v51 = Vector2.new(0, 0);
        l_ContextActionService_0:UnbindCoreAction("RotateModel");
        do
            local l_v51_0 = v51;
            l_ContextActionService_0:BindCoreAction("RotateModel", function(_, v54, v55) --[[ Line: 216 ]]
                -- upvalues: l_v51_0 (ref), v50 (copy)
                if v54 == Enum.UserInputState.Change then
                    l_v51_0 = v55.Position or l_v51_0;
                    l_v51_0 = Vector2.new(l_v51_0.X, l_v51_0.Y);
                    if math.abs(l_v51_0.X) > 0.2 or math.abs(l_v51_0.Y) > 0.2 then
                        v50.lastInputTime = tick();
                        v50.gamepadRotating = true;
                        v50.rotationDeltaY = 3 * l_v51_0.X;
                        v50.rotationDeltaX = 3 * l_v51_0.Y;
                    else
                        v50.gamepadRotating = false;
                    end;
                end;
                return Enum.ContextActionResult.Sink;
            end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA);
        end;
    end;
end;
v11.unbindActions = function(_) --[[ Line: 235 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("RotateModel");
end;
v11.removeConnections = function(v57) --[[ Line: 239 ]] --[[ Name: removeConnections ]]
    for _, v59 in pairs(v57.connections) do
        v59:disconnect();
    end;
end;
v11.willUnmount = function(v60) --[[ Line: 245 ]] --[[ Name: willUnmount ]]
    v60.isMounted = false;
    if v60.characterModelPool then
        v60.characterModelPool:onDestroy();
    end;
    v60:unbindActions();
    v60:removeConnections();
end;
return v6.UNSTABLE_connect2(function(v61, _) --[[ Line: 264 ]]
    return {
        view = v61.view, 
        tryingOnInfo = v61.tryingOnInfo, 
        gamepadEnabled = v61.gamepadEnabled
    };
end)(function(v63) --[[ Line: 255 ]] --[[ Name: AvatarViewportWrapper ]]
    -- upvalues: v5 (copy), v10 (copy), v7 (copy), v11 (copy)
    return v5.createElement(v10.Consumer, {
        render = function(v64) --[[ Line: 257 ]] --[[ Name: render ]]
            -- upvalues: v7 (ref), v63 (copy), v5 (ref), v11 (ref)
            local v65 = v7.Dictionary.join(v63, {
                views = v64
            });
            return v5.createElement(v11, v65);
        end
    });
end);