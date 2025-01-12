local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Resources.Constants);
local l_InputTypeMap_0 = v3.InputTypeMap;
return function(v5, v6, v7, v8, v9) --[[ Line: 9 ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_UserInputService_0 (copy), v3 (copy), l_InputTypeMap_0 (copy)
    if v9 == nil then
        v9 = l_RbxAnalyticsService_0;
    end;
    local function v12() --[[ Line: 15 ]] --[[ Name: reportSettingsForAnalytics ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_GameSettings_0 = UserSettings().GameSettings;
        local v11 = {};
        if l_UserInputService_0.TouchEnabled then
            v11.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
        else
            v11.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
        end;
        if l_UserInputService_0.TouchEnabled then
            v11.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
        else
            v11.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
        end;
        if l_UserInputService_0.MouseEnabled then
            v11.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
        end;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v11.camera_sensitivity_gamepad = string.format("%.2f", l_GameSettings_0.GamepadCameraSensitivity);
        end;
        if l_UserInputService_0.MouseEnabled then
            v11.camera_sensitivity_mouse = string.format("%.2f", l_GameSettings_0.MouseSensitivityFirstPerson.X);
        end;
        v11.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
        v11.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
        v11.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
        v11.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
        v11.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
        v11.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
        v11.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
        return v11;
    end;
    if v8 == true then
        v7 = v12();
        v6 = v3.AnalyticsSettingsChangeName;
        v5 = v3.AnalyticsInGameMenuName;
    end;
    if not v7 then
        v7 = {};
    end;
    v7.universeid = tostring(game.GameId);
    v7.inputDevice = tostring(l_InputTypeMap_0[l_UserInputService_0:GetLastInputType()] or l_UserInputService_0:GetLastInputType());
    v9:SetRBXEventStream(v3.AnalyticsTargetName, v5, v6, v7);
end;