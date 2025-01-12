local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v4.ValueChangedSignal;
local l_AvailabilitySignal_0 = v4.AvailabilitySignal;
local l_FieldType_0 = v4.FieldType;
local v8 = require(l_script_FirstAncestor_0.Integrations.Constants);
local v9 = require(l_script_FirstAncestor_0.Integrations.Utils);
local l_LAYOUT_ORDER_0 = v8.GAMESETTINGS.LAYOUT_ORDER;
local v11 = l_ValueChangedSignal_0.new(l_GameSettings_0:InFullScreen());
v11:connect(function(v12) --[[ Line: 25 ]]
    -- upvalues: l_GameSettings_0 (copy), l_GuiService_0 (copy)
    if v12 == l_GameSettings_0:InFullScreen() then
        return;
    else
        l_GuiService_0:ToggleFullscreen();
        return;
    end;
end, true);
local function _() --[[ Line: 33 ]] --[[ Name: initAvailability ]]
    -- upvalues: v9 (copy)
    local v13 = true;
    if v9.getDeviceType() ~= v9.DeviceTypes.Desktop then
        v13 = v9.getDeviceType() == v9.DeviceTypes.Unknown;
    end;
    return v13;
end;
local l_new_0 = l_AvailabilitySignal_0.new;
local v16 = true;
if v9.getDeviceType() ~= v9.DeviceTypes.Desktop then
    v16 = v9.getDeviceType() == v9.DeviceTypes.Unknown;
end;
l_new_0 = l_new_0(v16);
return {
    id = "fullscreen", 
    field_type = l_FieldType_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.FullScreen", 
    layoutOrder = l_LAYOUT_ORDER_0.FullScreenFrame, 
    onChanged = v11, 
    alreadyLocalized = false, 
    availability = l_new_0
};