local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local l_MannequinUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).MannequinUtility;
local v6 = require(script.Parent.Parent.Parent.Parent.Constants);
local v7 = require(script.Parent.Parent.Parent.Parent.FFlagFixPublishAvatarVRViewports);
local v8 = v1.PureComponent:extend("AvatarPartViewport");
v8.validateProps = v2.strictInterface({
    LayoutOrder = v2.optional(v2.number), 
    asset = v2.union(v2.table, v2.instanceOf("MeshPart"), v2.instanceOf("Accessory")), 
    viewportSize = v2.optional(v2.Vector2)
});
v8.init = function(v9) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v9.camera = nil;
    v9.modelRef = v1.createRef();
    local v10, v11 = v1.createBinding(nil);
    v9.camera = v10;
    v9.updateCamera = v11;
end;
v8.createViewportCamera = function(v12) --[[ Line: 42 ]] --[[ Name: createViewportCamera ]]
    -- upvalues: v7 (copy)
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Parent = v12.modelRef:getValue();
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    if v7 then
        l_Camera_0.HeadLocked = true;
        l_Camera_0.VRTiltAndRollEnabled = true;
    end;
    return l_Camera_0;
end;
v8.addBodyPartMannequinToViewport = function(v14) --[[ Line: 54 ]] --[[ Name: addBodyPartMannequinToViewport ]]
    -- upvalues: l_MannequinUtility_0 (copy), l_CameraUtility_0 (copy)
    local v15, v16, v17 = l_MannequinUtility_0.CreateBodyPartMannequin(v14.props.asset, false);
    local v18, v19 = l_MannequinUtility_0.SetupBodyPartMannequin(v15, v16, v17, v14.props.asset);
    v17.Parent = v14.modelRef:getValue();
    local v20 = v14:createViewportCamera();
    l_CameraUtility_0.SetupBodyPartCamera(v17, v18, v19, v20);
    v14.updateCamera(v20);
end;
v8.addHeadModelToViewport = function(v21) --[[ Line: 66 ]] --[[ Name: addHeadModelToViewport ]]
    -- upvalues: l_MannequinUtility_0 (copy), l_CameraUtility_0 (copy)
    local v22 = l_MannequinUtility_0.CreateHeadModel(v21.props.asset);
    v22.Parent = v21.modelRef:getValue();
    local v23 = v21:createViewportCamera();
    l_CameraUtility_0.SetupHeadCamera(v22, v23);
    v21.updateCamera(v23);
end;
v8.addAccessoryToViewport = function(v24) --[[ Line: 75 ]] --[[ Name: addAccessoryToViewport ]]
    -- upvalues: l_CameraUtility_0 (copy)
    local l_asset_0 = v24.props.asset;
    local l_Model_0 = Instance.new("Model");
    l_asset_0.Parent = l_Model_0;
    l_Model_0.Parent = v24.modelRef:getValue();
    local v27 = v24:createViewportCamera();
    l_CameraUtility_0.SetupAccessoryCamera(l_Model_0, v27);
    v24.updateCamera(v27);
end;
v8.didMount = function(v28) --[[ Line: 85 ]] --[[ Name: didMount ]]
    local l_asset_1 = v28.props.asset;
    if typeof(l_asset_1) == "Instance" then
        if l_asset_1:IsA("MeshPart") then
            v28:addHeadModelToViewport();
            return;
        else
            v28:addAccessoryToViewport();
            return;
        end;
    else
        v28:addBodyPartMannequinToViewport();
        return;
    end;
end;
v8.render = function(v30) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v1 (copy)
    return l_withStyle_0(function(v31) --[[ Line: 99 ]]
        -- upvalues: v30 (copy), v6 (ref), v1 (ref)
        local l_Theme_0 = v31.Theme;
        local v33 = if v30.props.viewportSize then v30.props.viewportSize else v6.ItemCardWidthLandscape;
        return v1.createElement("Frame", {
            LayoutOrder = v30.props.LayoutOrder, 
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(v33, v33), 
            ZIndex = 0
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), 
            AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.FitWithinMaxSize, 
                DominantAxis = Enum.DominantAxis.Width
            }), 
            ViewportFrame = v1.createElement("ViewportFrame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1, 
                LightColor = v6.ViewportLightColor, 
                Ambient = v6.ViewportLightAmbient, 
                LightDirection = v6.ViewportLightDirection, 
                CurrentCamera = v30.camera
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), 
                WorldModel = v1.createElement("WorldModel", {
                    [v1.Ref] = v30.modelRef
                })
            })
        });
    end);
end;
return v8;