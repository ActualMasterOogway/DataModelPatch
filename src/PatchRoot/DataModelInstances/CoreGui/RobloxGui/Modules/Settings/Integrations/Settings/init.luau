local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local v1 = require(l_script_FirstAncestor_0.Resources.SharedSettingsService);
local v2 = require(l_script_FirstAncestor_0.Integrations.Constants);
local l_SettingFields_0 = l_script_FirstAncestor_0.Integrations.SettingFields;
local v4 = require(l_SettingFields_0.Fullscreen);
local v5 = require(l_SettingFields_0.ShiftLock);
return (v1:registerPage({
    id = v2.GAMESETTINGS.PAGE_ID, 
    settingsFields = {
        v4, 
        v5
    }
}));