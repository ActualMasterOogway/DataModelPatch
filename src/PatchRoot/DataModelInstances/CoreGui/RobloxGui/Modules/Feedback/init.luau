local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v8 = require(script.GlobalConfig);
local v9 = require(script.Reducers);
local v10 = require(script.Components.FeedbackApp);
return {
    initialize = function() --[[ Line: 23 ]] --[[ Name: initialize ]]
        -- upvalues: v8 (copy), v3 (copy), v4 (copy), v9 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v10 (copy), l_CoreGui_0 (copy)
        if v8.propValidation then
            v3.setGlobalConfig({
                propValidation = true
            });
        end;
        if v8.elementTracing then
            v3.setGlobalConfig({
                elementTracing = true
            });
        end;
        local v11 = {
            v4.thunkMiddleware
        };
        if v8.logStore then
            table.insert(v11, v4.loggerMiddleware);
        end;
        local v12 = v4.Store.new(v9, nil, v11);
        local v13 = v3.createElement(v5.StoreProvider, {
            store = v12
        }, {
            LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                Feedback = v3.createElement(v10)
            })
        });
        v3.mount(v13, l_CoreGui_0, "Feedback");
    end
};