local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryTestHelpers").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.RoactRodux);
local v7 = require(l_Parent_0.Style);
local l_AppStyleProvider_0 = v7.AppStyleProvider;
local l_DesignTokenProvider_0 = v7.DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local v13 = require(l_Parent_0.UniversalAppPolicy);
local l_RoactAppPolicy_0 = v13.RoactAppPolicy;
local l_AppFeaturePolicies_0 = v13.AppFeaturePolicies;
local v16 = require(l_Parent_0.RoactNavigation);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppInteractionFeedbackProvider_0 = require(l_Parent_0.AppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
return function(v20, v21, v22, v23, v24, v25, v26) --[[ Line: 25 ]] --[[ Name: wrapWithAppProviders ]]
    -- upvalues: v3 (copy), v6 (copy), v4 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_FoundationProvider_0 (copy), l_AppStyleProvider_0 (copy), l_DesignTokenProvider_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_RoactServices_0 (copy), v2 (copy), l_RoactNetworking_0 (copy), v5 (copy), v16 (copy)
    return (v3.createElement(v6.StoreProvider, {
        store = v21 or v4.Store.new(function(v27) --[[ Line: 35 ]]
            return v27;
        end, {
            ScreenSize = Vector2.new(1920, 1080)
        }, {})
    }, {
        RoactAppPolicy = v3.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0
            }, 
            policyData = v24
        }, {
            FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                theme = "Dark"
            }, {
                AppStyleProvider = v3.createElement(l_AppStyleProvider_0, {
                    style = {
                        themeName = "dark", 
                        fontName = "gotham", 
                        deviceType = "Desktop"
                    }
                }, {
                    DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = v26 or {}
                    }, {
                        LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                        }, {
                            AppInteractionFeedbackProvider = v3.createElement(l_AppInteractionFeedbackProvider_0, {}, {
                                RoactServices = v3.createElement(l_RoactServices_0.ServiceProvider, {
                                    services = v2.Dictionary.join({
                                        [l_RoactNetworking_0] = function(...) --[[ Line: 66 ]]
                                            -- upvalues: v5 (ref), v23 (copy)
                                            return v5.resolve(if v23 then v23(...) else {
                                                responseBody = ""
                                            });
                                        end
                                    }, v22 or {})
                                }, {
                                    NavigationProvider = v3.createElement(v16.Provider, {
                                        value = {
                                            isFocused = function() --[[ Line: 77 ]] --[[ Name: isFocused ]]
                                                return true;
                                            end, 
                                            addListener = function() --[[ Line: 80 ]] --[[ Name: addListener ]]
                                                return {
                                                    remove = function() --[[ Line: 82 ]] --[[ Name: remove ]]

                                                    end
                                                };
                                            end, 
                                            getParam = function(_, v29) --[[ Line: 85 ]] --[[ Name: getParam ]]
                                                return v29;
                                            end, 
                                            navigate = function() --[[ Line: 88 ]] --[[ Name: navigate ]]

                                            end, 
                                            goBack = function() --[[ Line: 89 ]] --[[ Name: goBack ]]

                                            end, 
                                            state = {
                                                routeName = v25 or "DummyRoute"
                                            }
                                        }
                                    }, v20)
                                })
                            })
                        })
                    })
                })
            })
        })
    }));
end;