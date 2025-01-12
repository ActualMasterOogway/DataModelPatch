local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(script.Parent.triggerFeedback);
local v2 = require(script.Parent.InteractionFeedbackContext);
local v3 = require(l_Parent_0.RoactUtils);
local l_useInputType_0 = v3.Hooks.useInputType;
local l_useLaserPointerHand_0 = v3.Hooks.useLaserPointerHand;
local v6 = require(l_Parent_0.React);
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local function v10() --[[ Line: 14 ]] --[[ Name: useHapticMotors ]]
    -- upvalues: l_useInputType_0 (copy), l_useLaserPointerHand_0 (copy), v6 (copy), l_IsVRAppBuild_0 (copy)
    local v8 = l_useInputType_0();
    local v9 = l_useLaserPointerHand_0();
    return (v6.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: l_IsVRAppBuild_0 (ref), v9 (copy), v8 (copy)
        if l_IsVRAppBuild_0() then
            if v9 == "Right" then
                return {
                    Enum.VibrationMotor.RightHand
                };
            elseif v9 == "Left" then
                return {
                    Enum.VibrationMotor.LeftHand
                };
            else
                return {};
            end;
        elseif v8 == "Touch" then
            return {
                Enum.VibrationMotor.Large
            };
        elseif v8 == "Gamepad" then
            return {
                Enum.VibrationMotor.Large, 
                Enum.VibrationMotor.Small
            };
        else
            return {};
        end;
    end, {
        v8, 
        v9
    }));
end;
return function() --[[ Line: 47 ]] --[[ Name: useTriggerFeedback ]]
    -- upvalues: v6 (copy), v2 (copy), v10 (copy), v1 (copy)
    local v11 = v6.useContext(v2);
    local v12 = v10();
    if not v11 then
        error("useTriggerFeedback must be used within an InteractionFeedbackProvider");
    end;
    return (v6.useCallback(function(v13, v14) --[[ Line: 55 ]]
        -- upvalues: v1 (ref), v11 (copy), v12 (copy)
        return v1(v13, v14, v11, v12);
    end, {
        v11, 
        v12
    }));
end;