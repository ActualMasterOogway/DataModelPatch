local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_1.UIBloxConfig);
local function v10(v6, v7) --[[ Line: 13 ]] --[[ Name: GetUserCFrameWorldSpace ]]
    local l_v7_UserCFrame_0 = v7:GetUserCFrame(v6);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0.HeadLocked then
        l_v7_UserCFrame_0 = v7:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_v7_UserCFrame_0;
    end;
    return l_CurrentCamera_0.CFrame * (CFrame.new(l_v7_UserCFrame_0.p * l_CurrentCamera_0.HeadScale) * (l_v7_UserCFrame_0 - l_v7_UserCFrame_0.p));
end;
return function(v11, v12) --[[ Line: 25 ]] --[[ Name: usePanel3DRenderStep ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v10 (copy)
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if v5.enablePanelManagedAnchoring and v11.anchoring == v4.AnchoringTypes.PanelManaged and v11.connectPanelManagerFunction then
        return v13, v15;
    else
        if v5.refactorPanel3D then
            local v17, v18 = v3.useBinding((Vector3.new(v11.partSize.X, v11.partSize.Y, 0.05)));
            v13 = v17;
            v14 = v18;
            v17, v18 = v3.useBinding(v11.offset * CFrame.Angles(math.rad(v11.tilt), 0, 0));
            v15 = v17;
            v16 = v18;
        end;
        local v19 = v3.useRef(v11.offset);
        local v20 = v3.useRef(nil);
        local v21 = v3.useRef(false);
        local l_vrService_0 = v11.vrService;
        v3.useEffect(function() --[[ Line: 46 ]]
            -- upvalues: v19 (copy), v11 (copy)
            v19.current = v11.offset;
        end, {});
        local v39 = v3.useCallback(function(v23) --[[ Line: 50 ]]
            -- upvalues: v11 (copy), v4 (ref), l_vrService_0 (copy), v10 (ref), v20 (copy), v21 (copy), v19 (copy), v5 (ref), v16 (ref), v14 (ref), v12 (copy)
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            local v25 = nil;
            local l_CFrame_0 = l_CurrentCamera_1.CFrame;
            local l_HeadScale_0 = l_CurrentCamera_1.HeadScale;
            local v28 = nil;
            if v11.anchoring == v4.AnchoringTypes.Head then
                v28 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local v29 = v10(Enum.UserCFrame.Head, l_vrService_0);
                if v20.current == nil then
                    v20.current = v29;
                end;
                assert(v20.current ~= nil, "lastLookCFrame should not be nil.");
                if v20.current.LookVector:Dot(v29.LookVector) < 0.85 then
                    v21.current = true;
                elseif v20.current.LookVector:Dot(v29.LookVector) > 0.99 then
                    v21.current = false;
                end;
                if v21.current then
                    v20.current = v20.current:Lerp(v29, 7.2 * v23);
                end;
                v25 = v29.Position + v20.current.LookVector * l_HeadScale_0 * 2;
                v25 = Vector3.new(v25.X, v29.Position.Y, v25.Z);
                local l_alignedPanel_0 = v11.alignedPanel;
                if l_alignedPanel_0 then
                    local l_l_alignedPanel_0_Part_0 = l_alignedPanel_0:GetPart();
                    if l_l_alignedPanel_0_Part_0 and l_alignedPanel_0:IsPositionLockedType() and (l_alignedPanel_0:IsVisible() or l_alignedPanel_0.alwaysUpdatePosition) then
                        v25 = Vector3.new(l_l_alignedPanel_0_Part_0.Position.X, v29.Position.Y - 0.4 * l_HeadScale_0, l_l_alignedPanel_0_Part_0.Position.Z);
                    end;
                end;
            elseif v11.anchoring == v4.AnchoringTypes.Wrist then
                if l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l_vrService_0.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
                    v28 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
                elseif l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
                    v28 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
                end;
                if not v28 then
                    v28 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
                end;
                local v32 = v28.Position * l_HeadScale_0;
                v25 = (l_CFrame_0 * CFrame.new(v32)).Position;
            else
                return;
            end;
            if v11.offsetCallback then
                v25 = v11.offsetCallback({
                    finalPosition = v25, 
                    cameraHeadScale = l_HeadScale_0
                });
            end;
            if v11.lerp and v19.current ~= nil then
                v19.current = v19.current:Lerp(v11.offset, 7.2 * v23);
            else
                v19.current = v11.offset;
            end;
            local v33 = nil;
            if v19.current ~= nil then
                if v11.faceCamera then
                    local v34 = v10(Enum.UserCFrame.Head, l_vrService_0);
                    v33 = CFrame.new(v25 + v19.current.Position * l_HeadScale_0, v34.Position);
                else
                    local v35, v36, v37 = v28:ToOrientation();
                    local v38 = CFrame.new(v19.current.Position * l_HeadScale_0);
                    v33 = CFrame.new(v25) * CFrame.Angles(-v35, v36, -v37) * v38;
                end;
            end;
            if v11.tiltCallback then
                v33 = v11.tiltCallback({
                    panelCFrame = v33, 
                    cameraHeadScale = l_HeadScale_0
                });
            end;
            if v5.refactorPanel3D then
                v16(v33);
                v14((Vector3.new(v11.partSize.X * l_HeadScale_0, v11.partSize.Y * l_HeadScale_0, 0.05)));
                return;
            else
                if v12.current ~= nil then
                    v12.current.CFrame = v33;
                    v12.current.Size = Vector3.new(v11.partSize.X * l_HeadScale_0, v11.partSize.Y * l_HeadScale_0, 0.05);
                end;
                return;
            end;
        end, {
            v11.anchoring, 
            v11.faceCamera, 
            v11.lerp, 
            v11.offset, 
            v11.partSize, 
            v11.alignedPanel, 
            v11.offsetCallback, 
            v11.tiltCallback
        });
        v3.useEffect(function() --[[ Line: 180 ]]
            -- upvalues: v11 (copy), v4 (ref), v39 (copy)
            if v11.anchoring ~= v4.AnchoringTypes.World then
                local v40 = nil;
                local v41 = nil;
                local v42 = nil;
                local function v43() --[[ Line: 185 ]] --[[ Name: onCurrentCameraChanged ]]
                    -- upvalues: v40 (ref), v39 (ref)
                    if v40 then
                        v40:Disconnect();
                    end;
                    if workspace.CurrentCamera then
                        v40 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 192 ]]
                            -- upvalues: v39 (ref)
                            v39(0);
                        end);
                    end;
                end;
                v42 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v43);
                v43();
                if v11.alignedPanel then
                    local l_Part_0 = v11.alignedPanel:GetPart();
                    if l_Part_0 then
                        v41 = l_Part_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 205 ]]
                            -- upvalues: v39 (ref)
                            v39(0);
                        end);
                    end;
                end;
                local v45 = v11.movementUpdateEvent:Connect(v39);
                return function() --[[ Line: 213 ]]
                    -- upvalues: v45 (copy), v42 (ref), v40 (ref), v41 (ref)
                    v45:Disconnect();
                    v42:Disconnect();
                    if v40 then
                        v40:Disconnect();
                    end;
                    if v41 then
                        v41:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 224 ]]

                end;
            end;
        end, {
            v11.anchoring, 
            v39
        });
        return v13, v15;
    end;
end;