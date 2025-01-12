local l_Parent_0 = script.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = game:DefineFastFlag("SwitchCSRootProviderTranslationsPackage", false);
local v4 = nil;
v4 = if v3 then require(l_Parent_0.InExperienceLocales).Localization else require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.Rodux);
local v10 = require(l_Parent_0.RoactRodux);
local v11 = require(l_Parent_0.UIBlox);
local v12 = require(l_Parent_0.Foundation);
local l_SelectionCursorProvider_0 = v11.App.SelectionImage.SelectionCursorProvider;
local v14 = require(l_Parent_0.RobloxAppEnums);
local v15 = require(l_Parent_0.ReactFocusNavigation);
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_DeviceType_0 = v14.DeviceType;
local l_GamepadDisconnectTokenMapper_0 = require(l_Parent_0.InputUi).Gamepad.GamepadDisconnectTokenMapper;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local l_GetFFlagEnableUISoundAndHaptics_1 = require(l_Parent_0.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_Parent_0.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_Parent_0.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local v23 = v15.FocusNavigationService.new(v15.EngineInterface.CoreGui);
local v24 = {
    themeName = "dark", 
    fontName = "gotham", 
    deviceType = if l_GuiService_0:IsTenFootInterface() then l_DeviceType_0.Console else l_DeviceType_0.Desktop
};
return function(v25) --[[ Line: 63 ]] --[[ Name: CoreScriptsRootProvider ]]
    -- upvalues: v7 (copy), v24 (copy), v8 (copy), v10 (copy), v9 (copy), v11 (copy), l_DesignTokenProvider_0 (copy), l_GamepadDisconnectTokenMapper_0 (copy), l_SelectionCursorProvider_0 (copy), l_LocalizationProvider_0 (copy), v4 (ref), l_LocalizationService_0 (copy), v15 (copy), v23 (copy), l_Provider_0 (copy), l_GetFFlagEnableUISoundAndHaptics_0 (copy), v12 (copy), l_DeviceType_0 (copy), l_GetFFlagEnableUISoundAndHaptics_1 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy)
    local v26 = v7.Dictionary.join(v24, v25.styleOverride or {});
    local v28 = v8.createElement(v10.StoreProvider, {
        store = v9.Store.new(function(v27) --[[ Line: 67 ]]
            return v27;
        end, {}, {})
    }, {
        AppStyleProvider = v8.createElement(v11.App.Style.AppStyleProvider, {
            style = v26
        }, {
            DesignTokenProvider = v8.createElement(l_DesignTokenProvider_0, {
                tokenMappers = {
                    GamepadDisconnect = l_GamepadDisconnectTokenMapper_0
                }
            }, {
                CursorProvider = v8.createElement(l_SelectionCursorProvider_0, {}, {
                    LocalizationProvider = v8.createElement(l_LocalizationProvider_0, {
                        localization = v4.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        FocusNavigationProvider = v8.createElement(v15.FocusNavigationContext.Provider, {
                            value = v23
                        }, {
                            FocusNavigationRegistryProvider = v8.createElement(l_Provider_0, nil, v25.children)
                        })
                    })
                })
            })
        })
    });
    if l_GetFFlagEnableUISoundAndHaptics_0() then
        v28 = v8.createElement(v12.FoundationProvider, {
            theme = if v26.themeName == "dark" then v12.Enums.Theme.Dark else v12.Enums.Theme.Light, 
            device = if v26.deviceType == l_DeviceType_0.Console then v12.Enums.Device.Console else v12.Enums.Device.Desktop
        }, {
            tree = v28
        });
    end;
    if l_GetFFlagEnableUISoundAndHaptics_1() then
        v28 = v8.createElement(l_AppInteractionFeedbackProvider_0, {}, {
            tree = v8.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, {
                tree = v28
            })
        });
    end;
    return v28;
end;