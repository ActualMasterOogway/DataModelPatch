local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v4 = require(l_Modules_0.Settings.Flags.FFlagRefactorInExpGameSettings);
local v5 = require(l_Modules_0.Settings.Integrations);
local l_Utils_0 = v5.Utils;
local l_Constants_0 = v5.Constants;
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.ReactRoblox);
local v10 = require(l_Modules_0.Settings.Resources.SharedSettingsService);
local l_SettingReactView_0 = require(l_CorePackages_0.Workspace.Packages.SettingReactView).SettingReactView;
local v12 = require(l_Modules_0.Settings.SettingsPageFactory);
local v13 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v14 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v14.FoundationProvider;
local function v19() --[[ Line: 34 ]] --[[ Name: createGameSettings ]]
    -- upvalues: v12 (copy), l_Constants_0 (copy), v13 (copy), v8 (copy), l_FoundationProvider_0 (copy), v14 (copy), l_Utils_0 (copy), l_SettingReactView_0 (copy), v10 (copy), v9 (copy)
    local l_v12_NewPage_0 = v12:CreateNewPage();
    l_v12_NewPage_0.TabHeader.Name = l_Constants_0.GAMESETTINGS.TAB_HEADER.NAME;
    local v17 = v13.Images[l_Constants_0.GAMESETTINGS.TAB_HEADER.ICON];
    l_v12_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v17.ImageRectOffset;
    l_v12_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v17.ImageRectSize;
    l_v12_NewPage_0.TabHeader.TabLabel.Icon.Image = v17.Image;
    l_v12_NewPage_0.TabHeader.TabLabel.Title.Text = l_Constants_0.GAMESETTINGS.TAB_HEADER.TEXT;
    l_v12_NewPage_0.Page:ClearAllChildren();
    l_v12_NewPage_0.PageOpen = false;
    l_v12_NewPage_0.OpenSettingsPage = function() --[[ Line: 49 ]]
        -- upvalues: l_v12_NewPage_0 (copy)
        l_v12_NewPage_0.PageOpen = true;
    end;
    l_v12_NewPage_0.CloseSettingsPage = function() --[[ Line: 52 ]]
        -- upvalues: l_v12_NewPage_0 (copy)
        l_v12_NewPage_0.PageOpen = false;
    end;
    local v18 = v8.createElement(l_FoundationProvider_0, {
        theme = v14.Enums.Theme.Dark, 
        device = l_Utils_0.getDeviceType()
    }, {
        Child = v8.createElement(l_SettingReactView_0, {
            service = v10, 
            pageId = l_Constants_0.GAMESETTINGS.PAGE_ID
        })
    });
    v9.createRoot(l_v12_NewPage_0.Page):render(v18);
    return l_v12_NewPage_0;
end;
if v4() then
    return (v19());
else
    return require(l_Modules_0.Settings.Pages.GameSettings);
end;