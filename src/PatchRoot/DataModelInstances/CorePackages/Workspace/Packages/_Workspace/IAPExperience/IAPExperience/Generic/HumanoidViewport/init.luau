local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_CharacterUtility_0 = require(l_Parent_1.Thumbnailing).CharacterUtility;
local l_CameraUtility_0 = require(l_Parent_1.Thumbnailing).CameraUtility;
local l_CFrameUtility_0 = require(l_Parent_1.Thumbnailing).CFrameUtility;
local l_EmoteUtility_0 = require(l_Parent_1.Thumbnailing).EmoteUtility;
local v8 = require(l_Parent_0.Flags.getFFlagIAPHumanoidViewportVRFix);
return function(v9) --[[ Line: 27 ]] --[[ Name: HumanoidViewport ]]
    -- upvalues: v3 (copy), l_EmoteUtility_0 (copy), l_RunService_0 (copy), v8 (copy), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), l_CameraUtility_0 (copy)
    local v10 = v3.useRef(nil);
    local v11, v12 = v3.useBinding(nil);
    local v13 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v13 (copy)
        v13.current = true;
        return function() --[[ Line: 34 ]]
            -- upvalues: v13 (ref)
            v13.current = false;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), v10 (copy), l_EmoteUtility_0 (ref), l_RunService_0 (ref), v13 (copy), v8 (ref), l_CFrameUtility_0 (ref), l_CharacterUtility_0 (ref), l_CameraUtility_0 (ref), v12 (copy)
        task.spawn(function() --[[ Line: 41 ]]
            -- upvalues: v9 (ref), v10 (ref), l_EmoteUtility_0 (ref), l_RunService_0 (ref), v13 (ref), v8 (ref), l_CFrameUtility_0 (ref), l_CharacterUtility_0 (ref), l_CameraUtility_0 (ref), v12 (ref)
            local v14 = v9.model:Clone();
            assert(v14.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera");
            v14.Parent = v10.current;
            v14:MoveTo((Vector3.new(0, 0, 0, 0)));
            l_EmoteUtility_0.SetPlayerCharacterPoseWithMoodFallback(v14);
            l_RunService_0.PostSimulation:Wait();
            if not v13.current then
                return;
            else
                local l_Camera_0 = Instance.new("Camera");
                l_Camera_0.CameraType = Enum.CameraType.Scriptable;
                l_Camera_0.Parent = v10.current;
                if v8() then
                    l_Camera_0.HeadLocked = true;
                    l_Camera_0.VRTiltAndRollEnabled = true;
                end;
                local v16 = nil;
                local v17 = l_CFrameUtility_0.CalculateTargetCFrame(v14.Head.CFrame);
                v16 = v17 - v17.Position + v14.PrimaryPart.CFrame.Position;
                local v18, v19 = l_CharacterUtility_0.CalculateModelExtents(v14, v16);
                local v20 = {
                    optFieldOfView = 30, 
                    targetCFrame = v16, 
                    minExtent = v18, 
                    maxExtent = v19, 
                    extentScale = 1, 
                    optCameraXRot = l_CameraUtility_0.XRotForFullBody, 
                    optCameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody, 
                    extentScale = l_CameraUtility_0.DefaultBodyMarginScale
                };
                l_CameraUtility_0.SetupCamera(l_Camera_0, v20);
                v12(l_Camera_0);
                return;
            end;
        end);
    end, {});
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v9.Size, 
        Position = v9.Position, 
        LayoutOrder = v9.LayoutOrder
    }, {
        ViewportFrame = v3.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            Ambient = Color3.fromRGB(160, 160, 160), 
            LightDirection = Vector3.new(9.5, -12, 7.5, 0), 
            CurrentCamera = v11
        }, {
            WorldModel = v3.createElement("WorldModel", {
                ref = v10
            })
        })
    });
end;