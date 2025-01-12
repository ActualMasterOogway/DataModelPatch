local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.cameras = require(script:WaitForChild("CameraModule"));
    v1.controls = require(script:WaitForChild("ControlModule"));
    return v1;
end;
v0.GetCameras = function(v2) --[[ Line: 19 ]] --[[ Name: GetCameras ]]
    return v2.cameras;
end;
v0.GetControls = function(v3) --[[ Line: 23 ]] --[[ Name: GetControls ]]
    return v3.controls;
end;
v0.GetClickToMoveController = function(v4) --[[ Line: 27 ]] --[[ Name: GetClickToMoveController ]]
    return v4.controls:GetClickToMoveController();
end;
return v0.new();