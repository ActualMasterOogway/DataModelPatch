local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local v2 = Vector3.new();
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v2 (copy), l_ConnectionUtil_0 (copy)
    local v4 = setmetatable({}, v3);
    v4.enabled = false;
    v4.moveVector = v2;
    v4.moveVectorIsCameraRelative = true;
    v4.isJumping = false;
    v4._connectionUtil = l_ConnectionUtil_0.new();
    return v4;
end;
v3.GetMoveVector = function(v5) --[[ Line: 45 ]] --[[ Name: GetMoveVector ]]
    return v5.moveVector;
end;
v3.IsMoveVectorCameraRelative = function(v6) --[[ Line: 49 ]] --[[ Name: IsMoveVectorCameraRelative ]]
    return v6.moveVectorIsCameraRelative;
end;
v3.GetIsJumping = function(v7) --[[ Line: 53 ]] --[[ Name: GetIsJumping ]]
    return v7.isJumping;
end;
v3.Enable = function(_, _) --[[ Line: 59 ]] --[[ Name: Enable ]]
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.");
    return false;
end;
return v3;