local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local v3 = l_FlagUtil_0.getUserFlag("UserFixCameraFPError");
local v4 = {};
v4.__index = v4;
local v5 = CFrame.new();
local function v9(v6) --[[ Line: 17 ]] --[[ Name: cframeToAxis ]]
    local v7, v8 = v6:ToAxisAngle();
    return v7 * v8;
end;
local l_v5_0 = v5 --[[ copy: 5 -> 9 ]];
local function _(v11) --[[ Line: 22 ]] --[[ Name: axisToCFrame ]]
    -- upvalues: l_v5_0 (copy)
    local l_Magnitude_0 = v11.Magnitude;
    if l_Magnitude_0 > 1.0E-5 then
        return CFrame.fromAxisAngle(v11, l_Magnitude_0);
    else
        return l_v5_0;
    end;
end;
local _ = function(v14) --[[ Line: 30 ]] --[[ Name: extractRotation ]]
    local _, _, _, v18, v19, v20, v21, v22, v23, v24, v25, v26 = v14:GetComponents();
    return CFrame.new(0, 0, 0, v18, v19, v20, v21, v22, v23, v24, v25, v26);
end;
v4.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        lastCFrame = nil
    }, v4));
end;
v4.Step = function(v28, v29, v30) --[[ Line: 41 ]] --[[ Name: Step ]]
    -- upvalues: l_v5_0 (copy)
    local v31 = v28.lastCFrame or v30;
    v28.lastCFrame = v30;
    local l_Position_0 = v30.Position;
    local l_v30_Components_0, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44 = v30:GetComponents();
    local v45 = CFrame.new(0, 0, 0, v36, v37, v38, v39, v40, v41, v42, v43, v44);
    l_v30_Components_0 = v31.p;
    local v46, v47;
    v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v46, v47 = v31:GetComponents();
    v34 = CFrame.new(0, 0, 0, v38, v39, v40, v41, v42, v43, v44, v46, v47);
    v35 = (l_Position_0 - l_v30_Components_0) / v29;
    v39, v40 = (v45 * v34:inverse()):ToAxisAngle();
    v36 = v39 * v40 / v29;
    return {
        extrapolate = function(v48) --[[ Line: 56 ]] --[[ Name: extrapolate ]]
            -- upvalues: v35 (copy), l_Position_0 (copy), v36 (copy), l_v5_0 (ref), v45 (copy)
            local v49 = v35 * v48 + l_Position_0;
            local v50 = v36 * v48;
            local l_Magnitude_1 = v50.Magnitude;
            return (if l_Magnitude_1 > 1.0E-5 then CFrame.fromAxisAngle(v50, l_Magnitude_1) else l_v5_0) * v45 + v49;
        end, 
        posVelocity = v35, 
        rotVelocity = v36
    };
end;
v4.Reset = function(v52) --[[ Line: 69 ]] --[[ Name: Reset ]]
    v52.lastCFrame = nil;
end;
v5 = require(script.Parent:WaitForChild("BaseOcclusion"));
v9 = setmetatable({}, v5);
v9.__index = v9;
v9.new = function() --[[ Line: 79 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy)
    local v53 = setmetatable(v5.new(), v9);
    v53.focusExtrapolator = v4.new();
    return v53;
end;
v9.GetOcclusionMode = function(_) --[[ Line: 85 ]] --[[ Name: GetOcclusionMode ]]
    return Enum.DevCameraOcclusionMode.Zoom;
end;
v9.Enable = function(v55, _) --[[ Line: 89 ]] --[[ Name: Enable ]]
    v55.focusExtrapolator:Reset();
end;
v9.Update = function(v57, v58, v59, v60, _) --[[ Line: 93 ]] --[[ Name: Update ]]
    -- upvalues: v3 (copy), l_ZoomController_0 (copy)
    local v62 = nil;
    v62 = if v3 then CFrame.lookAlong(v60.p, -v59.LookVector) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1) else CFrame.new(v60.p, v59.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1);
    local v63 = v57.focusExtrapolator:Step(v58, v62);
    local v64 = l_ZoomController_0.Update(v58, v62, v63);
    return v62 * CFrame.new(0, 0, v64), v60;
end;
v9.CharacterAdded = function(_, _, _) --[[ Line: 117 ]] --[[ Name: CharacterAdded ]]

end;
v9.CharacterRemoving = function(_, _, _) --[[ Line: 121 ]] --[[ Name: CharacterRemoving ]]

end;
v9.OnCameraSubjectChanged = function(_, _) --[[ Line: 124 ]] --[[ Name: OnCameraSubjectChanged ]]

end;
return v9;