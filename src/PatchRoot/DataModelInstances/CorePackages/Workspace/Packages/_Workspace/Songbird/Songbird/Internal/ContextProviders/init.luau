local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Parent.Style);
local v6 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v7 = require(l_script_FirstAncestor_0.Parent.ReactSceneUnderstanding);
local l_Localization_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_script_FirstAncestor_0.Parent.Localization).LocalizationProvider;
local v10 = require(l_script_FirstAncestor_0.Components.ReportAudioPopupContext);
local v11 = {
    theme = v6.Enums.Theme.Dark, 
    isReportAudioPopupVisible = true
};
return function(v12) --[[ Line: 28 ]] --[[ Name: ContextProviders ]]
    -- upvalues: v2 (copy), v11 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy), v7 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v10 (copy)
    local v13 = v2.Dictionary.join(v11, v12);
    return v3.createElement(v6.FoundationProvider, {
        theme = v13.theme
    }, {
        AppStyleProvider = v3.createElement(v5.AppStyleProvider, {
            style = {
                themeName = v13.theme, 
                fontName = "Gotham"
            }
        }, {
            ContextStack = v3.createElement(v4.ContextStack, {
                providers = {
                    v3.createElement(v7.SceneAnalysisProvider), 
                    v3.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                    }), 
                    v3.createElement(v10.Provider, {
                        value = {
                            isVisible = v13.isReportAudioPopupVisible
                        }
                    })
                }
            }, v13.children)
        })
    });
end;