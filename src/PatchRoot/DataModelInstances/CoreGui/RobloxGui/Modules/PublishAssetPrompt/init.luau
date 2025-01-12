local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.Rodux);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(script.Components.PublishAssetPromptApp);
local v10 = require(script.Reducer);
local v11 = require(script.ConnectAssetServiceEvents);
local v12 = require(script.FFlagPublishAvatarPromptEnabled);
local v13 = {};
v13.__index = v13;
v13.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v6 (copy), v9 (copy), v7 (copy), v10 (copy), v8 (copy), v3 (copy), v12 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_CoreGui_0 (copy), v11 (copy)
    local v14 = setmetatable({}, v13);
    local v15 = v6.createElement(v9);
    v14.store = v7.Store.new(v10, nil, {
        v7.thunkMiddleware
    });
    v14.root = v6.createElement(v8.StoreProvider, {
        store = v14.store
    }, {
        ThemeProvider = v3({
            LocalizationProvider = if v12 then v6.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                PublishAssetPromptApp = v15
            }) else nil, 
            PublishAssetPromptApp = if not v12 then v15 else nil
        })
    });
    v14.element = v6.mount(v14.root, l_CoreGui_0, "PublishAssetPrompt");
    v14.serviceConnections = v11(v14.store);
    return v14;
end;
return v13.new();