local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v6 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v16 = l_Images_0["icons/actions/previewExpand"];
local v17 = l_Images_0["component_assets/dropshadow_25"];
local v18 = require(script.Parent.Parent.Parent.FFlagFixPublishAvatarVRViewports);
local v19 = UDim2.new(0.4, 50, 0.15, 10);
local v20 = UDim2.new(0.5, 0, 1, 0);
local v21 = v2.PureComponent:extend("ObjectViewport");
v21.validateProps = v6.strictInterface({
    model = v6.optional(v6.instanceOf("Model")), 
    fieldOfView = v6.optional(v6.number), 
    isLoading = v6.optional(v6.boolean), 
    useFullBodyCameraSettings = v6.optional(v6.boolean), 
    openPreviewView = v6.optional(v6.callback), 
    LayoutOrder = v6.optional(v6.number)
});
v21.createCamera = function(v22) --[[ Line: 47 ]] --[[ Name: createCamera ]]
    -- upvalues: v18 (copy)
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = v22.worldModelRef:getValue();
    if v18 then
        l_Camera_0.HeadLocked = true;
        l_Camera_0.VRTiltAndRollEnabled = true;
    end;
    return l_Camera_0;
end;
v21.init = function(v24) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v24.worldModelRef = v2.createRef();
    local v25, v26 = v2.createBinding(nil);
    v24.camera = v25;
    v24.updateCamera = v26;
    v24.isMounted = false;
end;
v21.setupViewport = function(v27) --[[ Line: 65 ]] --[[ Name: setupViewport ]]
    -- upvalues: l_EmoteUtility_0 (copy), l_RunService_0 (copy), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), l_CameraUtility_0 (copy)
    local v28 = v27.props.model:Clone();
    assert(v28.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera");
    v28.Parent = v27.worldModelRef:getValue();
    v28:MoveTo((Vector3.new(0, 0, 0, 0)));
    local l_useFullBodyCameraSettings_0 = v27.props.useFullBodyCameraSettings;
    if l_useFullBodyCameraSettings_0 then
        l_EmoteUtility_0.SetPlayerCharacterPoseWithMoodFallback(v28);
        l_RunService_0.PostSimulation:Wait();
        if not v27.isMounted then
            return;
        end;
    end;
    local v30 = v27:createCamera();
    local v31 = nil;
    if l_useFullBodyCameraSettings_0 then
        local v32 = l_CFrameUtility_0.CalculateTargetCFrame(v28.Head.CFrame);
        v31 = v32 - v32.Position + v28.PrimaryPart.CFrame.Position;
    else
        v31 = v28.PrimaryPart.CFrame;
    end;
    local v33, v34 = l_CharacterUtility_0.CalculateModelExtents(v28, v31);
    local v35 = {
        optFieldOfView = if v27.props.fieldOfView then v27.props.fieldOfView else 30, 
        targetCFrame = v31, 
        minExtent = v33, 
        maxExtent = v34, 
        extentScale = 1
    };
    if l_useFullBodyCameraSettings_0 then
        v35.optCameraXRot = l_CameraUtility_0.XRotForFullBody;
        v35.optCameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody;
        v35.extentScale = l_CameraUtility_0.DefaultBodyMarginScale;
    else
        v35.optCameraYRot = 25;
    end;
    l_CameraUtility_0.SetupCamera(v30, v35);
    v27.updateCamera(v30);
end;
v21.didMount = function(v36) --[[ Line: 109 ]] --[[ Name: didMount ]]
    v36.isMounted = true;
    task.spawn(function() --[[ Line: 111 ]]
        -- upvalues: v36 (copy)
        if not v36.props.isLoading then
            v36:setupViewport();
        end;
    end);
end;
v21.didUpdate = function(v37, v38) --[[ Line: 118 ]] --[[ Name: didUpdate ]]
    if v38.isLoading and not v37.props.isLoading then
        task.spawn(function() --[[ Line: 121 ]]
            -- upvalues: v37 (copy)
            v37:setupViewport();
        end);
    end;
end;
v21.render = function(v39) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v9 (copy), l_IconButton_0 (copy), v16 (copy), l_IconSize_0 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v17 (copy), v19 (copy), l_ShimmerPanel_0 (copy)
    return l_withStyle_0(function(v40) --[[ Line: 128 ]]
        -- upvalues: v39 (copy), v2 (ref), v9 (ref), l_IconButton_0 (ref), v16 (ref), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), v20 (ref), v17 (ref), v19 (ref), l_ShimmerPanel_0 (ref)
        local l_Theme_0 = v40.Theme;
        if not v39.props.isLoading then
            return v2.createElement("Frame", {
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v39.props.LayoutOrder
            }, {
                ViewportFrame = v2.createElement("ViewportFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    LightColor = v9.ViewportLightColor, 
                    Ambient = v9.ViewportLightAmbient, 
                    LightDirection = v9.ViewportLightDirection, 
                    CurrentCamera = v39.camera
                }, {
                    WorldModel = v2.createElement("WorldModel", {
                        [v2.Ref] = v39.worldModelRef
                    })
                }), 
                ExpandPreviewButton = v39.props.openPreviewView and v2.createElement(l_IconButton_0, {
                    position = UDim2.new(1, -v9.PromptSidePadding, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    icon = v16, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v39.props.openPreviewView
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundMuted.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.7, 0.75), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }), 
                DropShadow = v2.createElement(l_ImageSetLabel_0, {
                    Position = v20, 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Image = v17, 
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0.5, 
                    Size = v19, 
                    ZIndex = 0
                })
            });
        else
            return v2.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v39.props.LayoutOrder
            });
        end;
    end);
end;
v21.willUnmount = function(v42) --[[ Line: 194 ]] --[[ Name: willUnmount ]]
    v42.isMounted = false;
end;
return v21;