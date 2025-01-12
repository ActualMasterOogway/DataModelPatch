local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_ShimmerPanel_0 = v10.App.Loading.ShimmerPanel;
local l_EmptyState_0 = v10.App.Indicator.EmptyState;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Button_0 = v10.App.Button.Button;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v10.App.Button.Enum.StandardButtonSize;
local l_ShortcutBar_0 = v10.App.Navigation.ShortcutBar;
local l_InputType_0 = v10.Core.Enums.InputType;
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_InputTypeConstants_0 = require(l_CorePackages_0.Workspace.Packages.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v25 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v26 = require(script.Parent.InteractionFrame);
local v27 = require(script.Parent.Parent.Parent.Constants);
local l_Images_0 = v10.App.ImageSet.Images;
local v29 = l_Images_0["icons/actions/previewShrink"];
local v30 = l_Images_0["icons/actions/reset"];
local v31 = require(script.Parent.Parent.Parent.FFlagPublishAvatarPromptEnabled);
local v32 = require(script.Parent.Parent.Parent.FFlagFixPublishAvatarVRViewports);
local v33 = v31 and 0.8 or 1;
local v34 = {
    LOADING = "loading", 
    SUCCESSFULLY_LOADED = "successfullyLoaded", 
    FAILED_TO_LOAD = "failedToLoad"
};
local v35 = v8.PureComponent:extend("PreviewViewport");
v35.validateProps = v9.strictInterface({
    asset = v9.union(v9.instanceOf("Model"), v9.instanceIsA("AnimationClip")), 
    closePreviewView = v9.callback
});
local function _(v36) --[[ Line: 77 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy)
    return l_getInputGroup_0(v36) == l_InputTypeConstants_0.Gamepad;
end;
v35.init = function(v38) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: v34 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy), v31 (copy), v8 (copy), v33 (copy)
    local v39 = {
        loadingState = v34.LOADING
    };
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v39.isGamepad = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == l_InputTypeConstants_0.Gamepad;
    v39.cameraMoved = not v31 and nil;
    v38:setState(v39);
    v38.ref = v8.createRef();
    v38.zoomFactor = v33;
    v38.cameraDegreesAngle = Vector2.new(0, 0);
    v38.cameraPanInPixels = Vector2.new(0, 0);
    v38.cameraRef = v8.createRef();
    v38.worldModelRef = v8.createRef();
    local v41, v42 = v8.createBinding(CFrame.new());
    v38.cameraCFrameBinding = v41;
    v38.updateCameraCFrameBinding = v42;
    v41, v42 = v8.createBinding(CFrame.new());
    v38.cameraFocusBinding = v41;
    v38.updateCameraFocusBinding = v42;
    v38.panByPixels = function(v43) --[[ Line: 100 ]]
        -- upvalues: v38 (copy), v31 (ref)
        v38.cameraPanInPixels = v38.cameraPanInPixels + v43;
        v38:clampOffsets();
        v38:updateCameraPosition();
        if v31 and not v38.state.cameraMoved then
            v38:setState({
                cameraMoved = true
            });
        end;
    end;
    v38.rotateByPixels = function(v44) --[[ Line: 109 ]]
        -- upvalues: v38 (copy), v31 (ref)
        v38.cameraDegreesAngle = Vector2.new(v38.cameraDegreesAngle.X - v44.Y, v38.cameraDegreesAngle.Y - v44.X);
        v38:clampOffsets();
        v38:updateCameraPosition();
        if v31 and not v38.state.cameraMoved then
            v38:setState({
                cameraMoved = true
            });
        end;
    end;
    v38.storeInput = function(_, v46, v47) --[[ Line: 122 ]]
        -- upvalues: v38 (copy)
        v38.inputState = v46;
        v38.inputObject = v47;
        return Enum.ContextActionResult.Sink;
    end;
    v38.rotateByRadians = function(v48) --[[ Line: 130 ]]
        -- upvalues: v38 (copy), v31 (ref)
        if not v38.model:FindFirstChild("HumanoidRootPart") then
            return;
        else
            local v49 = -v48 * 180 / 3.141592653589793;
            v38.cameraDegreesAngle = Vector2.new(v38.cameraDegreesAngle.X % 360, (v38.cameraDegreesAngle.Y + v49) % 360);
            v38:updateCameraPosition();
            if v31 and not v38.state.cameraMoved then
                v38:setState({
                    cameraMoved = true
                });
            end;
            return;
        end;
    end;
    v38.setAngularVelocityByPixels = function(_) --[[ Line: 149 ]]

    end;
    v38.zoomToPoint = function(v51, v52) --[[ Line: 152 ]]
        -- upvalues: v38 (copy), v31 (ref)
        local v53 = 0.9 ^ v51;
        local v54 = v38.zoomFactor * v53;
        if v54 ~= math.clamp(v54, 0.3, 10) then
            return;
        else
            v38.zoomFactor = v54;
            if not v31 or v52 then
                local v55 = (v52 - (v38.absolutePosition + v38.absoluteSize / 2)) * Vector2.new(1, -1) * -1;
                v38.cameraPanInPixels = v55 - (v55 - v38.cameraPanInPixels) * v53;
            end;
            v38:clampOffsets();
            v38:updateCameraPosition();
            if v31 and not v38.state.cameraMoved then
                v38:setState({
                    cameraMoved = true
                });
            end;
            return;
        end;
    end;
    v38.onRetryLoading = function() --[[ Line: 177 ]]
        -- upvalues: v38 (copy)
        v38:processAsset();
    end;
    v38.onResetButtonPressed = function() --[[ Line: 181 ]]
        -- upvalues: v38 (copy)
        v38:resetCameraPosition();
    end;
end;
v35.setLoadingState = function(v56, v57) --[[ Line: 186 ]] --[[ Name: setLoadingState ]]
    v56:setState({
        loadingState = v57
    });
end;
v35.clampOffsets = function(v58) --[[ Line: 192 ]] --[[ Name: clampOffsets ]]
    v58.zoomFactor = math.clamp(v58.zoomFactor, 0.3, 10);
    local v59 = -80;
    if v58.props.asset and v58.props.asset:IsA("AnimationClip") then
        v59 = v58:angleToMakeBasePlateParallel();
    end;
    v58.cameraDegreesAngle = Vector2.new(math.clamp(v58.cameraDegreesAngle.X, v59, 80), v58.cameraDegreesAngle.Y);
    local v60 = math.max(v58.zoomFactor * v58.modelExtentsSize.X / 2 / v58:pointsToPixelsFactor(), v58.absoluteSize.X / 2);
    local v61 = math.max(v58.zoomFactor * v58.modelExtentsSize.Y / 2 / v58:pointsToPixelsFactor(), v58.absoluteSize.Y / 2);
    v58.cameraPanInPixels = Vector2.new(math.clamp(v58.cameraPanInPixels.X, -v60, v60), (math.clamp(v58.cameraPanInPixels.Y, -v61, v61)));
end;
v35.angleToMakeBasePlateParallel = function(v62) --[[ Line: 218 ]] --[[ Name: angleToMakeBasePlateParallel ]]
    local v63 = v62.cameraDistance / v62.zoomFactor;
    local v64 = v62:pointsToPixelsFactor() / v62.zoomFactor * v62.cameraPanInPixels.Y;
    return -math.deg((math.asin((math.clamp((v62.modelExtentsSize.Y / 2 + v64) / v63, -0.99, 0.99)))));
end;
v35.processAsset = function(v65) --[[ Line: 237 ]] --[[ Name: processAsset ]]
    -- upvalues: v34 (copy), l_Players_0 (copy), l_AnimationClipProvider_0 (copy)
    local l_asset_0 = v65.props.asset;
    if not l_asset_0 then
        return;
    elseif l_asset_0:IsA("AnimationClip") then
        v65:setLoadingState(v34.LOADING);
        task.spawn(function() --[[ Line: 246 ]]
            -- upvalues: l_Players_0 (ref), v65 (copy), l_asset_0 (copy), v34 (ref), l_AnimationClipProvider_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 247 ]]
                -- upvalues: l_Players_0 (ref)
                return (l_Players_0:GetHumanoidDescriptionFromOutfitId(1342485078));
            end);
            local v69 = nil;
            if l_status_0 then
                v69 = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
            end;
            if not v65.isMounted or l_asset_0 ~= v65.props.asset then
                return;
            elseif not v69 then
                v65:setLoadingState(v34.FAILED_TO_LOAD);
                return;
            else
                v65.model = v69;
                v65:addModelToViewportIfNeeded();
                local v70 = l_AnimationClipProvider_0:RegisterActiveAnimationClip(l_asset_0);
                v65.animation = Instance.new("Animation");
                v65.animation.AnimationId = v70;
                local l_Humanoid_0 = v65.model:FindFirstChildWhichIsA("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0:LoadAnimation(v65.animation):Play();
                end;
                v65:setLoadingState(v34.SUCCESSFULLY_LOADED);
                return;
            end;
        end);
        return;
    else
        if l_asset_0:IsA("Model") then
            v65.model = l_asset_0:Clone();
            v65.model.Parent = nil;
            v65:addModelToViewportIfNeeded();
            v65:setLoadingState(v34.SUCCESSFULLY_LOADED);
        end;
        return;
    end;
end;
v35.addModelToViewportIfNeeded = function(v72) --[[ Line: 292 ]] --[[ Name: addModelToViewportIfNeeded ]]
    if v72.model ~= nil and v72.model.Parent ~= nil then
        return;
    else
        if v72.worldModelRef:getValue() and v72.model ~= nil then
            v72.model.Parent = v72.worldModelRef:getValue();
            v72:resetCameraPosition();
            if v72.props.asset and v72.props.asset:IsA("AnimationClip") then
                v72.baseplate = Instance.new("Part");
                v72.baseplate.Size = Vector3.new(8, 0.5, 8, 0);
                v72.baseplate.Transparency = 0.6;
                v72.baseplate.Parent = v72.worldModelRef:getValue();
                local v73 = v72.modelCFrame.Position + Vector3.new(0, -v72.modelExtentsSize.Y / 2, 0);
                v72.baseplate.Position = v73 + Vector3.new(0, -0.25, 0, 0);
            end;
        end;
        return;
    end;
end;
local function _(v74, v75) --[[ Line: 314 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v75.X;
    local l_Y_0 = v75.Y;
    local l_Z_0 = v75.Z;
    local v79 = math.max(l_X_0, l_Y_0);
    local v80 = 1 / math.tan(math.rad(v74) / 2);
    return v79 / 2 * v80 + l_Z_0 / 2;
end;
local function _(v82, v83, v84) --[[ Line: 324 ]] --[[ Name: rotateVectorAround ]]
    return CFrame.fromAxisAngle(v84, v83):VectorToWorldSpace(v82);
end;
v35.resetCameraPosition = function(v86) --[[ Line: 328 ]] --[[ Name: resetCameraPosition ]]
    -- upvalues: v33 (copy), v31 (copy)
    if not v86.model then
        return;
    else
        v86.modelCFrame = v86.model:GetModelCFrame();
        v86.initialLookVector = v86.modelCFrame.lookVector;
        local l_HumanoidRootPart_0 = v86.model:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            v86.initialLookVector = l_HumanoidRootPart_0.CFrame.lookVector;
        end;
        v86.modelExtentsSize = v86.model:GetExtentsSize();
        local l_modelExtentsSize_0 = v86.modelExtentsSize;
        local l_X_1 = l_modelExtentsSize_0.X;
        local l_Y_1 = l_modelExtentsSize_0.Y;
        local l_Z_1 = l_modelExtentsSize_0.Z;
        v86.cameraDistance = math.max(l_X_1, l_Y_1) / 2 * 3.7320508075688776 + l_Z_1 / 2;
        if v86.props.asset and v86.props.asset:IsA("AnimationClip") then
            v86.cameraDegreesAngle = Vector2.new(0, 0);
            v86.zoomFactor = 0.75;
        else
            v86.cameraDegreesAngle = Vector2.new(5, 20);
            v86.zoomFactor = v33;
        end;
        v86.cameraPanInPixels = Vector2.new(0, 0);
        v86:updateCameraPosition();
        if v31 and v86.state.cameraMoved then
            v86:setState({
                cameraMoved = false
            });
        end;
        return;
    end;
end;
v35.pointsToPixelsFactor = function(v92) --[[ Line: 362 ]] --[[ Name: pointsToPixelsFactor ]]
    if v92.absoluteSize == nil or v92.modelExtentsSize == nil or v92.absoluteSize.Y == 0 or v92.modelExtentsSize.Y == 0 or v92.modelExtentsSize.X == 0 then
        return 1;
    else
        return math.max(v92.modelExtentsSize.X, v92.modelExtentsSize.Y) / v92.absoluteSize.Y;
    end;
end;
v35.updateCameraPosition = function(v93) --[[ Line: 377 ]] --[[ Name: updateCameraPosition ]]
    if v93.absoluteSize == nil or v93.cameraDistance == nil then
        return;
    else
        local v94 = v93.cameraDistance / v93.zoomFactor;
        local l_initialLookVector_0 = v93.initialLookVector;
        local v96 = math.rad(v93.cameraDegreesAngle.X);
        local v97 = math.rad(v93.cameraDegreesAngle.Y);
        local v98 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0, 0), v96):VectorToWorldSpace(l_initialLookVector_0);
        l_initialLookVector_0 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v97):VectorToWorldSpace(v98);
        v98 = CFrame.new(v93.modelCFrame.p + l_initialLookVector_0 * v94, v93.modelCFrame.p);
        local v99 = v93:pointsToPixelsFactor() / v93.zoomFactor;
        v98 = v98 + v98.UpVector * v99 * v93.cameraPanInPixels.Y + v98.RightVector * v99 * v93.cameraPanInPixels.X;
        v93.updateCameraCFrameBinding(v98);
        v93.updateCameraFocusBinding(v93.modelCFrame);
        return;
    end;
end;
local v100 = {
    resetViewButtonText = v25:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"), 
    loadingFailedText = v25:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
};
v35.render = function(v101) --[[ Line: 411 ]] --[[ Name: render ]]
    -- upvalues: l_InputType_0 (copy), l_Images_0 (copy), v25 (copy), v8 (copy), l_GuiService_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy), v31 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v30 (copy), v29 (copy), v34 (copy), l_StandardButtonSize_0 (copy), v100 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_ShortcutBar_0 (copy), l_ShimmerPanel_0 (copy), l_EmptyState_0 (copy), v26 (copy), v27 (copy), v32 (copy)
    local l_loadingState_0 = v101.state.loadingState;
    local v103 = {
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/scroll"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSVertical"]
            }, 
            text = v25:FormatByKey("CoreScripts.PublishAvatarPrompt.Zoom")
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickLeft"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSHorizontal"]
            }, 
            text = v25:FormatByKey("CoreScripts.PublishAvatarPrompt.Rotate")
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickRight"]
            }, 
            text = v25:FormatByKey("CoreScripts.PublishAvatarPrompt.Pan")
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxY"]
            }, 
            text = v25:FormatByKey("CoreScripts.PublishAvatarPrompt.ResetView")
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxB"]
            }, 
            text = v25:FormatByKey("CoreScripts.PublishAvatarPrompt.Close")
        }
    };
    local v104 = v101.state.cameraMoved and not v101.state.isGamepad;
    local l_createElement_0 = v8.createElement;
    local v106 = "Frame";
    local v110 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v8.Ref] = v101.ref, 
        [v8.Change.AbsoluteSize] = function(v107) --[[ Line: 456 ]]
            -- upvalues: v101 (copy)
            v101.absoluteSize = v107.AbsoluteSize;
            v101:updateCameraPosition();
        end, 
        [v8.Change.AbsolutePosition] = function(v108) --[[ Line: 460 ]]
            -- upvalues: l_GuiService_0 (ref), v101 (copy)
            local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
            v101.absolutePosition = v108.absolutePosition + l_l_GuiService_0_GuiInset_0;
        end
    };
    local v112 = {
        LastInputTypeConnection = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v111) --[[ Line: 467 ]] --[[ Name: callback ]]
                -- upvalues: v101 (copy), l_getInputGroup_0 (ref), l_InputTypeConstants_0 (ref)
                v101:setState({
                    isGamepad = l_getInputGroup_0(v111) == l_InputTypeConstants_0.Gamepad
                });
            end
        }) or nil, 
        ButtonFrame = if v31 then v8.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1
        }, {
            UIPadding = v8.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 24), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            ResetViewButton = if v104 then v8.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromOffset(36, 36), 
                position = UDim2.fromScale(0, 1), 
                anchorPoint = Vector2.new(0, 1), 
                icon = v30, 
                onActivated = v101.onResetButtonPressed
            }) else nil, 
            ShrinkPreviewButton = v8.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.fromOffset(36, 36), 
                icon = v29, 
                position = UDim2.fromScale(1, 1), 
                anchorPoint = Vector2.new(1, 1), 
                onActivated = v101.props.closePreviewView
            })
        }) else nil, 
        ResetViewButton = if not v31 then l_loadingState_0 == v34.SUCCESSFULLY_LOADED and not v101.state.isGamepad and v8.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            position = UDim2.new(0, 20, 1, -20), 
            anchorPoint = Vector2.new(0, 1), 
            text = v100.resetViewButtonText, 
            onActivated = function() --[[ Line: 518 ]] --[[ Name: onActivated ]]
                -- upvalues: v101 (copy)
                v101:resetCameraPosition();
            end
        }) else nil, 
        ShrinkPreviewButton = if not v31 then v8.createElement(l_IconButton_0, {
            position = UDim2.new(1, -20, 1, -20), 
            anchorPoint = Vector2.new(1, 1), 
            icon = v29, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = function() --[[ Line: 531 ]] --[[ Name: onActivated ]]
                -- upvalues: v101 (copy)
                v101.props.closePreviewView();
            end
        }) else nil, 
        TooltipHint = if v31 and v101.props.asset:IsA("Model") then v8.createElement(l_ShortcutBar_0, {
            position = UDim2.fromScale(0.5, 0.9), 
            anchorPoint = Vector2.new(0.5, 1), 
            transitionDelaySeconds = 2, 
            items = v103
        }) else nil
    };
    local v113 = false;
    if l_loadingState_0 == v34.LOADING then
        v113 = v8.createElement(l_ShimmerPanel_0, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
    v112.ShimmerFrame = v113;
    v113 = false;
    if l_loadingState_0 == v34.FAILED_TO_LOAD then
        v113 = v8.createElement(l_EmptyState_0, {
            text = v100.loadingFailedText, 
            size = UDim2.fromScale(1, 1), 
            onActivated = v101.onRetryLoading
        });
    end;
    v112.LoadingFailed = v113;
    v112.InteractionFrame = v8.createElement(v26, {
        ZIndex = -1, 
        Size = UDim2.fromScale(1, 1), 
        Visible = l_loadingState_0 == v34.SUCCESSFULLY_LOADED, 
        panByPixels = v101.panByPixels, 
        rotateByPixels = v101.rotateByPixels, 
        setAngularVelocityByPixels = v101.setAngularVelocityByPixels, 
        zoomToPoint = v101.zoomToPoint
    }, {
        ViewportFrame = v8.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = v27.ViewportLightColor, 
            Ambient = v27.ViewportLightAmbient, 
            LightDirection = v27.ViewportLightDirection, 
            CurrentCamera = v101.cameraRef
        }, {
            Camera = v8.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 30, 
                HeadLocked = v32 and true or nil, 
                VRTiltAndRollEnabled = v32 and true or nil, 
                CFrame = v101.cameraCFrameBinding, 
                Focus = v101.cameraFocusBinding, 
                [v8.Ref] = v101.cameraRef
            }), 
            WorldModel = v8.createElement("WorldModel", {
                [v8.Ref] = v101.worldModelRef
            })
        })
    });
    return l_createElement_0(v106, v110, v112);
end;
v35.setUpGamepad = function(v114) --[[ Line: 598 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy), l_RunService_0 (copy), l_GamepadUtils_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    l_ContextActionService_0:BindCoreAction("PreviewViewportClose", v114.props.closePreviewView, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("PreviewViewportReset", function() --[[ Line: 609 ]]
        -- upvalues: v114 (copy)
        v114:resetCameraPosition();
    end, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("PreviewViewportRotateAndZoom", v114.storeInput, false, Enum.KeyCode.Thumbstick2);
    v114.gamePadConnection = l_RunService_0.RenderStepped:Connect(function(v115) --[[ Line: 619 ]]
        -- upvalues: v114 (copy), l_GamepadUtils_0 (ref)
        if v114.inputState == Enum.UserInputState.Change and v114.inputObject then
            l_GamepadUtils_0.rotateAndZoom(v114.inputObject, v115, v114.setAngularVelocityByPixels, v114.rotateByRadians, v114.zoomToPoint);
        end;
    end);
end;
v35.didMount = function(v116) --[[ Line: 632 ]] --[[ Name: didMount ]]
    -- upvalues: l_GuiService_0 (copy), v31 (copy)
    local l_l_GuiService_0_GuiInset_1 = l_GuiService_0:GetGuiInset();
    v116.isMounted = true;
    v116.absolutePosition = v116.ref.current.AbsolutePosition + l_l_GuiService_0_GuiInset_1;
    v116:processAsset();
    if v31 then
        v116:setUpGamepad();
    end;
end;
v35.cleanupGamepad = function(v118) --[[ Line: 642 ]] --[[ Name: cleanupGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    if v118.gamePadConnection then
        v118.gamePadConnection:Disconnect();
    end;
end;
v35.willUnmount = function(v119) --[[ Line: 651 ]] --[[ Name: willUnmount ]]
    -- upvalues: v31 (copy)
    v119.isMounted = false;
    if v31 then
        v119:cleanupGamepad();
    end;
end;
v35.didUpdate = function(v120, v121) --[[ Line: 658 ]] --[[ Name: didUpdate ]]
    if v120.props.asset ~= v121.asset then
        if v120.model ~= nil then
            v120.model.Parent = nil;
            v120.model = nil;
        end;
        if v120.baseplate ~= nil then
            v120.baseplate.Parent = nil;
            v120.baseplate:Destroy();
        end;
        v120:processAsset();
    end;
end;
return v35;