local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Rodux);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(script.Components.AvatarEditorPromptsApp);
local v9 = require(script.Reducer);
local v10 = require(script.Thunks.GetGameName);
local v11 = require(script.AvatarEditorPromptsPolicy);
local v12 = require(script.RoactGlobalConfig);
local v13 = require(script.ConnectAvatarEditorServiceEvents);
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), v12 (copy), v4 (copy), v5 (copy), v9 (copy), v10 (copy), v6 (copy), v11 (copy), v3 (copy), v8 (copy), l_CoreGui_0 (copy), v13 (copy)
    local v15 = setmetatable({}, v14);
    if v12.propValidation then
        v4.setGlobalConfig({
            propValidation = true
        });
    end;
    if v12.elementTracing then
        v4.setGlobalConfig({
            elementTracing = true
        });
    end;
    v15.store = v5.Store.new(v9, nil, {
        v5.thunkMiddleware
    });
    v15.store:dispatch(v10);
    v15.root = v4.createElement(v6.StoreProvider, {
        store = v15.store
    }, {
        PolicyProvider = v4.createElement(v11.Provider, {
            policy = {
                v11.Mapper
            }
        }, {
            ThemeProvider = v3({
                AvatarEditorPromptsApp = v4.createElement(v8)
            })
        })
    });
    v15.element = v4.mount(v15.root, l_CoreGui_0, "AvatarEditorPrompts");
    v15.serviceConnections = v13(v15.store);
    return v15;
end;
return v14.new();