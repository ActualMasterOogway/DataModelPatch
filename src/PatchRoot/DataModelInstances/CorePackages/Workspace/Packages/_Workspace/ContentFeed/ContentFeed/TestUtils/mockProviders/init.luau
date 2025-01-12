local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).AppFeaturePolicies;
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v6 = require(l_Parent_1.React);
local l_RoactAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_Parent_1.RoactNavigation);
local v9 = require(l_Parent_1.RoactRodux);
local v10 = require(l_Parent_1.Dev.UnitTestHelpers);
local l_LocalizationProvider_0 = v4.LocalizationProvider;
local l_Mock_0 = v5.Mock;
local l_mockFoundation_0 = v10.mockFoundation;
local v14 = require(l_Parent_0.TestUtils.createMockNavigation);
local v15 = require(l_Parent_0.TestUtils.createMockStore);
local v16 = require(l_Parent_0.App.FeedContext);
local v17 = {
    navigateBack = v3.noop, 
    navigateToReportPage = v3.noop
};
local v18 = {
    EligibleForExternalContentSharing = true
};
return function(v19, v20) --[[ Line: 31 ]]
    -- upvalues: l_Mock_0 (copy), v17 (copy), v14 (copy), v18 (copy), v15 (copy), v3 (copy), v6 (copy), v9 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), v10 (copy), v16 (copy), v8 (copy), l_LocalizationProvider_0 (copy), l_mockFoundation_0 (copy)
    local v21 = l_Mock_0.MagicMock.new({
        name = "Localization"
    });
    v21.Format = function(_, v23, _) --[[ Line: 33 ]]
        return v23;
    end;
    local l_v17_0 = v17;
    local v26 = v14();
    local l_v18_0 = v18;
    local v28 = v15();
    local v29 = true;
    if v20 then
        if v20.context then
            l_v17_0 = v3.join(l_v17_0, v20.context);
        end;
        if v20.store then
            v28 = v20.store;
        end;
        if v20.navigation then
            v26 = v14(v20.navigation);
        end;
        if v20.policyData then
            l_v18_0 = v20.policyData;
        end;
        if v20.shouldMockFoundation ~= nil then
            v29 = v20.shouldMockFoundation;
        end;
    end;
    local v30 = v6.createElement(v9.StoreProvider, {
        store = v28
    }, {
        PolicyProvider = v6.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0
            }, 
            policyData = l_v18_0
        }, {
            StyleProvider = v10.createStyleProvider({
                ContextProvider = v6.createElement(v16.Provider, {
                    value = l_v17_0
                }, {
                    NavigationProvider = v6.createElement(v8.Provider, {
                        value = v26
                    }, {
                        localizationProvider = v6.createElement(l_LocalizationProvider_0, {
                            localization = v21
                        }, v19)
                    })
                })
            })
        })
    });
    if v29 then
        return l_mockFoundation_0(v30);
    else
        return v30;
    end;
end;