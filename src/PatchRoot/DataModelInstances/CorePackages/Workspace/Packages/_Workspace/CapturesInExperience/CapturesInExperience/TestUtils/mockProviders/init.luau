local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dev.JestGlobals);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactRodux);
local v7 = require(l_Parent_1.Dev.UnitTestHelpers);
local l_LocalizationProvider_0 = v3.LocalizationProvider;
local l_Mock_0 = v4.Mock;
local l_jest_0 = v2.jest;
local v11 = require(l_Parent_0.App.CapturesPolicy);
local v12 = require(l_Parent_0.Context.CapturesContext);
local v13 = require(l_Parent_0.TestUtils.createStore);
local v14 = require(l_Parent_0.TestUtils.mockAnalytics);
local v15 = {
    EligibleForCapturesFeature = true, 
    EnableCapturesBulkManagement = true, 
    EnableShareCaptureCTA = true
};
return function(v16, v17) --[[ Line: 27 ]]
    -- upvalues: l_Mock_0 (copy), v14 (copy), l_jest_0 (copy), v13 (copy), v5 (copy), v6 (copy), v11 (copy), v15 (copy), v12 (copy), v7 (copy), l_LocalizationProvider_0 (copy)
    local v18 = l_Mock_0.MagicMock.new({
        name = "Localization"
    });
    v18.Format = function(_, v20, _) --[[ Line: 29 ]]
        return v20;
    end;
    local v22 = v14({}, l_jest_0);
    local v23 = v13();
    if v17 then
        if v17.analytics then
            v22 = v17.analytics;
        end;
        if v17.store then
            v23 = v17.store;
        end;
    end;
    return v5.createElement(v6.StoreProvider, {
        store = v23
    }, {
        PolicyProvider = v5.createElement(v11.Provider, {
            policy = {
                v11.Mapper
            }, 
            policyData = v17 and v17.policyData or v15
        }, {
            ContextProvider = v5.createElement(v12.Provider, {
                value = {
                    fireAnalyticsEvent = v22.fireAnalyticsEvent, 
                    chromeEnabled = v17 and v17.chromeEnabled or nil
                }
            }, {
                StyleProvider = v7.createStyleProvider({
                    localizationProvider = v5.createElement(l_LocalizationProvider_0, {
                        localization = v18
                    }, {
                        child = v16
                    })
                })
            })
        })
    });
end;