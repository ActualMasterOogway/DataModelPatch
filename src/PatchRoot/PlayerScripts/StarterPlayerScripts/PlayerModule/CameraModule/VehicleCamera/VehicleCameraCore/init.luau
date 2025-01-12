local v0 = require(script.Parent.Parent.CameraUtils);
local v1 = require(script.Parent.VehicleCameraConfig);
local l_map_0 = v0.map;
local l_mapClamp_0 = v0.mapClamp;
local l_sanitizeAngle_0 = v0.sanitizeAngle;
local _ = function(v5) --[[ Line: 10 ]] --[[ Name: getYaw ]]
    -- upvalues: l_sanitizeAngle_0 (copy)
    local _, v7 = v5:toEulerAnglesYXZ();
    return l_sanitizeAngle_0(v7);
end;
local function _(v9) --[[ Line: 16 ]] --[[ Name: getPitch ]]
    -- upvalues: l_sanitizeAngle_0 (copy)
    local v10 = v9:toEulerAnglesYXZ();
    return l_sanitizeAngle_0(v10);
end;
local function _(v12, v13, v14, v15, v16) --[[ Line: 22 ]] --[[ Name: stepSpringAxis ]]
    -- upvalues: l_sanitizeAngle_0 (copy)
    local v17 = l_sanitizeAngle_0(v15 - v14);
    local v18 = math.exp(-v13 * v12);
    return l_sanitizeAngle_0((v17 * (1 + v13 * v12) + v16 * v12) * v18 + v14), (v16 * (1 - v13 * v12) - v17 * (v13 * v13 * v12)) * v18;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22, v23) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy)
    return (setmetatable({
        fRising = v21, 
        fFalling = v22, 
        g = v23, 
        p = v23, 
        v = v23 * 0
    }, v20));
end;
v20.step = function(v24, v25) --[[ Line: 46 ]] --[[ Name: step ]]
    local l_fRising_0 = v24.fRising;
    local l_fFalling_0 = v24.fFalling;
    local l_g_0 = v24.g;
    local l_p_0 = v24.p;
    local l_v_0 = v24.v;
    local v31 = 6.283185307179586 * (l_v_0 > 0 and l_fRising_0 or l_fFalling_0);
    local v32 = l_p_0 - l_g_0;
    local v33 = math.exp(-v31 * v25);
    local v34 = (v32 * (1 + v31 * v25) + l_v_0 * v25) * v33 + l_g_0;
    local v35 = (l_v_0 * (1 - v31 * v25) - v32 * (v31 * v31 * v25)) * v33;
    v24.p = v34;
    v24.v = v35;
    return v34;
end;
local v36 = {};
v36.__index = v36;
v36.new = function(v37) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: l_sanitizeAngle_0 (copy), v20 (copy), v1 (copy), v36 (copy)
    assert(typeof(v37) == "CFrame");
    local v38 = {};
    local v39, v40 = v37:toEulerAnglesYXZ();
    v38.yawG = l_sanitizeAngle_0(v40);
    v39, v40 = v37:toEulerAnglesYXZ();
    v38.yawP = l_sanitizeAngle_0(v40);
    v38.yawV = 0;
    v39 = v37:toEulerAnglesYXZ();
    v38.pitchG = l_sanitizeAngle_0(v39);
    v39 = v37:toEulerAnglesYXZ();
    v38.pitchP = l_sanitizeAngle_0(v39);
    v38.pitchV = 0;
    v38.fSpringYaw = v20.new(v1.yawReponseDampingRising, v1.yawResponseDampingFalling, 0);
    v38.fSpringPitch = v20.new(v1.pitchReponseDampingRising, v1.pitchResponseDampingFalling, 0);
    return (setmetatable(v38, v36));
end;
v36.setGoal = function(v41, v42) --[[ Line: 99 ]] --[[ Name: setGoal ]]
    -- upvalues: l_sanitizeAngle_0 (copy)
    assert(typeof(v42) == "CFrame");
    local v43, v44 = v42:toEulerAnglesYXZ();
    v41.yawG = l_sanitizeAngle_0(v44);
    v43 = v42:toEulerAnglesYXZ();
    v41.pitchG = l_sanitizeAngle_0(v43);
end;
v36.getCFrame = function(v45) --[[ Line: 106 ]] --[[ Name: getCFrame ]]
    return CFrame.fromEulerAnglesYXZ(v45.pitchP, v45.yawP, 0);
end;
v36.step = function(v46, v47, v48, v49, v50) --[[ Line: 110 ]] --[[ Name: step ]]
    -- upvalues: l_mapClamp_0 (copy), l_map_0 (copy), v1 (copy), l_sanitizeAngle_0 (copy)
    assert(typeof(v47) == "number");
    assert(typeof(v49) == "number");
    assert(typeof(v48) == "number");
    assert(typeof(v50) == "number");
    local l_fSpringYaw_0 = v46.fSpringYaw;
    local l_fSpringPitch_0 = v46.fSpringPitch;
    l_fSpringYaw_0.g = l_mapClamp_0(l_map_0(v50, 0, 1, v49, 0), math.rad(v1.cutoffMinAngularVelYaw), math.rad(v1.cutoffMaxAngularVelYaw), 1, 0);
    l_fSpringPitch_0.g = l_mapClamp_0(l_map_0(v50, 0, 1, v48, 0), math.rad(v1.cutoffMinAngularVelPitch), math.rad(v1.cutoffMaxAngularVelPitch), 1, 0);
    local v53 = 6.283185307179586 * v1.yawStiffness * l_fSpringYaw_0:step(v47);
    local v54 = 6.283185307179586 * v1.pitchStiffness * l_fSpringPitch_0:step(v47) * l_map_0(v50, 0, 1, 1, v1.firstPersonResponseMul);
    local v55 = v53 * l_map_0(v50, 0, 1, 1, v1.firstPersonResponseMul);
    local l_yawG_0 = v46.yawG;
    local l_yawP_0 = v46.yawP;
    local l_yawV_0 = v46.yawV;
    local v59 = l_sanitizeAngle_0(l_yawP_0 - l_yawG_0);
    local v60 = math.exp(-v55 * v47);
    local v61 = l_sanitizeAngle_0((v59 * (1 + v55 * v47) + l_yawV_0 * v47) * v60 + l_yawG_0);
    local v62 = (l_yawV_0 * (1 - v55 * v47) - v59 * (v55 * v55 * v47)) * v60;
    local l_v61_0 = v61;
    local l_v62_0 = v62;
    v46.yawP = l_v61_0;
    v46.yawV = l_v62_0;
    v55 = v54;
    l_yawG_0 = v46.pitchG;
    l_yawP_0 = v46.pitchP;
    l_yawV_0 = v46.pitchV;
    v59 = l_sanitizeAngle_0(l_yawP_0 - l_yawG_0);
    v60 = math.exp(-v55 * v47);
    v61 = l_sanitizeAngle_0((v59 * (1 + v55 * v47) + l_yawV_0 * v47) * v60 + l_yawG_0);
    v62 = (l_yawV_0 * (1 - v55 * v47) - v59 * (v55 * v55 * v47)) * v60;
    l_v61_0 = v61;
    l_v62_0 = v62;
    v46.pitchP = l_v61_0;
    v46.pitchV = l_v62_0;
    return v46:getCFrame();
end;
local v65 = {};
v65.__index = v65;
v65.new = function(v66) --[[ Line: 167 ]] --[[ Name: new ]]
    -- upvalues: v36 (copy), v65 (copy)
    return (setmetatable({
        vrs = v36.new(v66)
    }, v65));
end;
v65.step = function(v67, v68, v69, v70, v71) --[[ Line: 173 ]] --[[ Name: step ]]
    return v67.vrs:step(v68, v69, v70, v71);
end;
v65.setTransform = function(v72, v73) --[[ Line: 177 ]] --[[ Name: setTransform ]]
    v72.vrs:setGoal(v73);
end;
return v65;