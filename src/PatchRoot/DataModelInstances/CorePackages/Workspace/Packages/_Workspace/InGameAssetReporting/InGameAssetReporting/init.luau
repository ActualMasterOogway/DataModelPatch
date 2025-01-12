local l_Parent_0 = script.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v11 = require(script.Analysis.SceneAnalysis);
local v12 = require(script.InGameAssetReportUI.Components.InGameAssetReportMode);
return {
    interpretAnnotation = v11.interpretAnnotation, 
    extractItemsFromInterpretations = v11.extractItemsFromInterpretations, 
    __setRandomGenerator = v11.__setRandomGenerator, 
    initialize = function() --[[ Line: 26 ]]
        -- upvalues: v4 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v12 (copy), l_ExperienceStateCaptureService_0 (copy), l_CoreGui_0 (copy)
        local v15 = v4.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            LayerCollectorProvider = v4.createElement(l_LayerCollectorProvider_0, {}, {
                FoundationProvider = v4.createElement(l_FoundationProvider_0, {
                    theme = "Dark"
                }, {
                    LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {
                            withDarkTheme = true
                        }, {
                            InGameAssetReportUI = v5.createElement(v12, {
                                backAction = function() --[[ Line: 43 ]] --[[ Name: backAction ]]
                                    -- upvalues: l_ExperienceStateCaptureService_0 (ref)
                                    l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                                end, 
                                onReportComplete = function() --[[ Line: 46 ]] --[[ Name: onReportComplete ]]
                                    -- upvalues: l_ExperienceStateCaptureService_0 (ref)
                                    l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                                end, 
                                getIsSmallPortraitMode = function(v13) --[[ Line: 49 ]] --[[ Name: getIsSmallPortraitMode ]]
                                    local v14 = false;
                                    if v13.X < v13.Y then
                                        v14 = v13.X < 800;
                                    end;
                                    return v14;
                                end
                            })
                        })
                    })
                })
            })
        });
        if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
            l_ExperienceStateCaptureService_0.HiddenSelectionEnabled = true;
        end;
        v5.mount(v15, l_CoreGui_0, "InGameAssetReportMode");
    end, 
    ["jest.config"] = script["jest.config"]
};