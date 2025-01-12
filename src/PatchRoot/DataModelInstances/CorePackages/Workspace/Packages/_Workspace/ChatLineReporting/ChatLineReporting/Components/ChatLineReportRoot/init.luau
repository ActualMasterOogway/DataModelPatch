local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v10 = require(l_script_FirstAncestor_0.Components.ChatLineReportStepHandler);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v12 = nil;
local function v13() --[[ Line: 21 ]]
    -- upvalues: v12 (ref), v7 (copy)
    if v12 then
        v7.unmount(v12);
    end;
end;
return {
    initialize = function(v14) --[[ Line: 27 ]]
        -- upvalues: v6 (copy), l_LayerCollectorProvider_0 (copy), v7 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_FoundationProvider_0 (copy), v10 (copy), v13 (copy), v12 (ref), l_CoreGui_0 (copy)
        local v15 = v6.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            LayerCollector = v6.createElement(l_LayerCollectorProvider_0, {}, {
                LocalizationProvider = v7.createElement(l_LocalizationProvider_0, {
                    localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                }, {
                    StyleProvider = v6.createElement(l_StyleProviderWithDefaultTheme_0, {
                        withDarkTheme = true
                    }, {
                        FoundationProvider = v6.createElement(l_FoundationProvider_0, {
                            theme = "Dark"
                        }, {
                            ChatLineReportStepHandler = v6.createElement(v10, {
                                unmount = v13, 
                                messages = v14
                            })
                        })
                    })
                })
            })
        });
        v12 = v7.mount(v15, l_CoreGui_0, "ChatLineReportRoot");
    end
};