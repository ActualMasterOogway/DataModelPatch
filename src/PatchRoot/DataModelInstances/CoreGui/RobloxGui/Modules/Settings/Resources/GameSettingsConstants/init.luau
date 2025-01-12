local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules;
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local v2 = require(l_Modules_0.Settings.Flags.GetFStringInExperienceMenuIXPLayer);
local v3 = require(l_Modules_0.Settings.Flags.GetFStringInExperienceMenuIXPVar);
local v4 = require(l_Modules_0.Settings.Flags.FFlagInExperienceMenuReorderFirstVariant1);
local v5 = require(l_Modules_0.Settings.Flags.FFlagOverrideInExperienceMenuReorderFirstVariant1);
local v6 = require(l_Modules_0.Common.IXPServiceWrapper);
local v7 = {
    OverscanAdjustButton = 1, 
    ShiftLockFrame = 10, 
    CameraModeFrame = 11, 
    MovementModeFrame = 12, 
    FramerateCap = 13, 
    GamepadSensitivityFrame = 14, 
    CameraInvertedFrame = 90, 
    CameraDeviceFrame = 91, 
    MouseAdvancedFrame = 50, 
    VoiceConnectFrame = 18, 
    VoiceDisconnectFrame = 19, 
    LanguageSelectorFrame = 20, 
    FeedbackModeButton = 30, 
    ChatTranslationFrame = 40, 
    ChatLanguageSelectorFrame = 41, 
    ChatTranslationToggleFrame = 42, 
    DeviceFrameInput = 60, 
    DeviceFrameOutput = 61, 
    VolumeFrame = 62
};
if l_game_EngineFeature_0 then
    v7.PartyVoiceVolumeFrame = 63;
end;
v7.HapticsFrame = l_game_EngineFeature_0 and 64 or 63;
v7.FullScreenFrame = 70;
v7.GraphicsEnablerFrame = 71;
v7.GraphicsQualityFrame = 72;
v7.ReducedMotionFrame = 73;
v7.PreferredTransparencyFrame = 74;
v7.PreferredTextSizeFrame = 75;
v7.UiNavigationKeyBindEnabledFrame = 76;
v7.PerformanceStatsFrame = 80;
v7.MicroProfilerFrame = 81;
v7.VREnabledFrame = 100;
v7.DeveloperConsoleButton = 101;
v7.UiToggleRow = 200;
v7.UiToggleRowCustom = 200;
v7.UiToggleRowBillboards = 201;
v7.UiToggleRowNameplates = 202;
v7.FreecamToggleRow = 203;
v7.InformationFrame = 999;
local v8 = {
    OverscanAdjustButton = 1, 
    VolumeFrame = 10
};
if l_game_EngineFeature_0 then
    v8.PartyVoiceVolumeFrame = 11;
end;
v8.VoiceConnectFrame = 20;
v8.VoiceDisconnectFrame = 21;
v8.MouseAdvancedFrame = 40;
v8.GamepadSensitivityFrame = 41;
v8.ShiftLockFrame = 45;
v8.CameraModeFrame = 46;
v8.MovementModeFrame = 47;
v8.CameraInvertedFrame = 48;
v8.GraphicsEnablerFrame = 60;
v8.GraphicsQualityFrame = 61;
v8.FramerateCap = 65;
v8.LanguageSelectorFrame = 80;
v8.ChatTranslationFrame = 81;
v8.ChatTranslationToggleFrame = 82;
v8.ChatLanguageSelectorFrame = 83;
v8.FeedbackModeButton = 84;
v8.PreferredTransparencyFrame = 95;
v8.ReducedMotionFrame = 96;
v8.HapticsFrame = 97;
v8.UiNavigationKeyBindEnabledFrame = 98;
v8.PreferredTextSizeFrame = 99;
v8.CameraDeviceFrame = 110;
v8.FullScreenFrame = 111;
v8.DeviceFrameOutput = 112;
v8.DeviceFrameInput = 113;
v8.VREnabledFrame = 120;
v8.PerformanceStatsFrame = 130;
v8.MicroProfilerFrame = 131;
v8.DeveloperConsoleButton = 132;
v8.UiToggleRow = 200;
v8.UiToggleRowCustom = 200;
v8.UiToggleRowBillboards = 201;
v8.UiToggleRowNameplates = 202;
v8.FreecamToggleRow = 203;
v8.InformationFrame = 999;
local function v23() --[[ Line: 133 ]] --[[ Name: LayoutReOrderIXP ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v4 (copy), v8 (copy), v7 (copy)
    local v9 = {
        ixp_variant = -1, 
        variants = {
            DEFAULT = 1, 
            VARIANT = 2
        }
    };
    local function _() --[[ Line: 142 ]] --[[ Name: fetchSettingReorderIXPVariant ]]
        -- upvalues: v2 (ref), v3 (ref), v6 (ref), v9 (copy)
        local v10 = v2();
        local v11 = v3();
        local l_v6_LayerData_0 = v6:GetLayerData(v10);
        local l_DEFAULT_0 = v9.variants.DEFAULT;
        if l_v6_LayerData_0 ~= nil and l_v6_LayerData_0[v11] ~= nil then
            l_DEFAULT_0 = l_v6_LayerData_0[v11];
            v6:LogUserLayerExposure(v10);
        end;
        return l_DEFAULT_0;
    end;
    v9.__index = function(_, v16) --[[ Line: 154 ]]
        -- upvalues: v9 (copy), v2 (ref), v3 (ref), v6 (ref), v4 (ref), v8 (ref), v7 (ref)
        if v9.ixp_variant == -1 then
            local l_v9_0 = v9;
            local v18 = v2();
            local v19 = v3();
            local l_v6_LayerData_1 = v6:GetLayerData(v18);
            local l_DEFAULT_1 = v9.variants.DEFAULT;
            if l_v6_LayerData_1 ~= nil and l_v6_LayerData_1[v19] ~= nil then
                l_DEFAULT_1 = l_v6_LayerData_1[v19];
                v6:LogUserLayerExposure(v18);
            end;
            l_v9_0.ixp_variant = l_DEFAULT_1;
        end;
        if v4 and v9.ixp_variant == v9.variants.VARIANT then
            return v8[v16];
        else
            return v7[v16];
        end;
    end;
    local v22 = {};
    setmetatable(v22, v9);
    return v22;
end;
local _ = function() --[[ Line: 173 ]] --[[ Name: getLayoutOrder ]]
    -- upvalues: v5 (copy), v8 (copy), v4 (copy), v23 (copy), v7 (copy)
    local _ = {};
    if v5 then
        return v8;
    elseif v4 then
        return (v23());
    else
        return v7;
    end;
end;
local v26 = {};
local _ = {};
v26.SETTINGS_MENU_LAYOUT_ORDER = if v5 then v8 else if v4 then v23() else v7;
return v26;