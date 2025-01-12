local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.usePanel3DRenderStep);
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v7 = require(l_Parent_3.React);
local v8 = require(l_Parent_3.Roact);
local l_Object_0 = require(l_Parent_3.LuauPolyfill).Object;
local v10 = require(l_Parent_2.Core.Utility.GetEngineFeatureSafe);
local v11 = require(l_Parent_1.Spatial.SurfaceGuiWithAdornee);
local v12 = require(l_Parent_2.UIBloxConfig);
local v13 = v10("CurvedSurfaceGuisEnabled");
local v14 = {
    partSize = Vector2.new(10, 10), 
    virtualScreenSize = Vector2.new(10, 10), 
    offset = CFrame.new(0, 0, 0), 
    lerp = false, 
    tilt = 0, 
    anchoring = v2.AnchoringTypes.World, 
    faceCamera = false, 
    panelName = "PanelBase", 
    movementUpdateEvent = l_RunService_0.RenderStepped, 
    vrService = game:GetService("VRService"), 
    alwaysOnTop = true, 
    parent = workspace, 
    hidden = false, 
    curvature = 1, 
    zOffset = 0, 
    connectPanelManagerFunction = nil
};
return function(v15) --[[ Line: 44 ]] --[[ Name: Panel3D ]]
    -- upvalues: l_Object_0 (copy), v14 (copy), v12 (copy), v7 (copy), v3 (copy), v2 (copy), v11 (copy), v13 (copy), v8 (copy)
    local v16 = l_Object_0.assign({}, v14, v15);
    if v12.refactorPanel3D then
        local v17 = v7.useRef(nil);
        local v18, v19 = v3(v16, nil);
        if v12.enablePanelManagedAnchoring then
            v7.useEffect(function() --[[ Line: 53 ]]
                -- upvalues: v16 (copy), v2 (ref), v17 (copy)
                if v16.anchoring ~= v2.AnchoringTypes.PanelManaged then
                    return function() --[[ Line: 55 ]]

                    end;
                elseif v16.connectPanelManagerFunction == nil then
                    return function() --[[ Line: 59 ]]

                    end;
                elseif v17 ~= nil and v16.connectPanelManagerFunction then
                    v16.connectPanelManagerFunction(v17);
                    return function() --[[ Line: 65 ]]
                        -- upvalues: v16 (ref)
                        v16.connectPanelManagerFunction(nil);
                    end;
                else
                    return function() --[[ Line: 70 ]]

                    end;
                end;
            end, {
                v17, 
                v16.anchoring, 
                v16.connectPanelManagerFunction
            });
        end;
        return v7.createElement(v11, {
            name = v16.panelName, 
            detached = true, 
            adorneeProps = {
                Size = v18, 
                CFrame = v19, 
                Parent = v16.parent
            }, 
            ref = v17, 
            surfaceGuiProps = {
                Enabled = not v16.hidden, 
                CanvasSize = v16.virtualScreenSize, 
                Shape = if v13 and v16.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil, 
                HorizontalCurvature = if v13 then v16.curvature else nil, 
                ZOffset = v16.zOffset
            }
        }, v16.children);
    else
        local v20 = v7.useRef(nil);
        local v21 = v7.useRef(nil);
        local v22 = v7.useRef(nil);
        v3(v16, v20);
        if v12.enablePanelManagedAnchoring then
            v7.useEffect(function() --[[ Line: 102 ]]
                -- upvalues: v16 (copy), v2 (ref), v21 (copy)
                if v16.anchoring ~= v2.AnchoringTypes.PanelManaged then
                    return function() --[[ Line: 104 ]]

                    end;
                elseif v16.connectPanelManagerFunction == nil then
                    return function() --[[ Line: 108 ]]

                    end;
                elseif v21 ~= nil and v16.connectPanelManagerFunction then
                    v16.connectPanelManagerFunction(v21);
                    return function() --[[ Line: 114 ]]
                        -- upvalues: v16 (ref)
                        v16.connectPanelManagerFunction(nil);
                    end;
                else
                    return function() --[[ Line: 119 ]]

                    end;
                end;
            end, {
                v21, 
                v16.anchoring, 
                v16.connectPanelManagerFunction
            });
        end;
        return (v7.createElement("Folder", {
            ref = v22, 
            Archivable = false
        }, {
            WorkspacePortal = v7.createElement(v8.Portal, {
                target = v16.parent
            }, {
                GUIPart = if v16.hidden then nil else v7.createElement("Part", {
                    Name = v16.panelName .. "_Part", 
                    ref = v20, 
                    Anchored = true, 
                    CFrame = v16.offset * CFrame.Angles(math.rad(v16.tilt), 0, 0), 
                    Size = Vector3.new(v16.partSize.X, v16.partSize.Y, 0.05), 
                    Transparency = 1, 
                    Color = Color3.new(0, 0, 0), 
                    CanCollide = false, 
                    CanTouch = false
                })
            }), 
            AppUI = v7.createElement("SurfaceGui", {
                Name = v16.panelName .. "_SurfaceGui", 
                ref = v21, 
                Adornee = v20, 
                Active = true, 
                Enabled = not v16.hidden, 
                CanvasSize = v16.virtualScreenSize, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                LightInfluence = 0, 
                children = v16.children, 
                AlwaysOnTop = v16.alwaysOnTop, 
                Shape = if v13 and v16.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil, 
                HorizontalCurvature = if v13 then v16.curvature else nil, 
                ZOffset = v16.zOffset
            })
        }));
    end;
end;