local l_Parent_0 = script.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local _ = game:GetService("CorePackages");
local l_CorePackages_1 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_1.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local l_Rodux_0 = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local l_LocaleProvider_0 = require(l_CorePackages_1.Workspace.Packages.IAPExperience).Locale.LocaleProvider;
local v9 = require(l_Parent_0.Components.Connection.LayoutValuesProvider);
local v10 = require(l_Parent_0.Components.Connection.LocalizationContextProvider);
local v11 = require(l_Parent_0.Localization.getLocalizationContext);
local v12 = require(l_Parent_0.Reducers.Reducer);
local v13 = require(l_Parent_0.Services.LayoutValues);
local l_StyleProviderWithDefaultTheme_0 = require(l_CorePackages_1.Workspace.Packages.Style).StyleProviderWithDefaultTheme;
local v15 = l_Roact_0.Component:extend("UnitTestContainer");
v15.init = function(v16) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), l_Rodux_0 (copy), v12 (copy), l_LocalizationService_0 (copy), v11 (copy)
    v16.layoutValues = v13.new(false).layout;
    v16.store = v16.props.overrideStore or l_Rodux_0.Store.new(v12, {});
    local v17 = v16.props.overrideLocale or l_LocalizationService_0.RobloxLocaleId;
    v16.localizationContext = v11(v17);
end;
v15.render = function(v18) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_RoactRodux_0 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v10 (copy), v9 (copy)
    local v19 = false;
    if v18.props[l_Roact_0.Children] ~= nil then
        v19 = #v18.props[l_Roact_0.Children] > 0;
    end;
    assert(v19, "UnitTestContainer: no children provided, nothing will be tested");
    return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
        store = v18.store
    }, {
        LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, {
            StyleProvider = l_Roact_0.createElement(l_StyleProviderWithDefaultTheme_0, {
                LocalizationContextProvider = l_Roact_0.createElement(v10, {
                    localizationContext = v18.localizationContext, 
                    render = function() --[[ Line: 50 ]] --[[ Name: render ]]
                        -- upvalues: l_Roact_0 (ref), v9 (ref), v18 (copy)
                        return l_Roact_0.createElement(v9, {
                            isTenFootInterface = false, 
                            render = function() --[[ Line: 53 ]] --[[ Name: render ]]
                                -- upvalues: l_Roact_0 (ref), v18 (ref)
                                return l_Roact_0.createElement("ScreenGui", {
                                    AutoLocalize = false, 
                                    IgnoreGuiInset = true
                                }, v18.props[l_Roact_0.Children]);
                            end
                        });
                    end
                })
            })
        })
    });
end;
return v15;