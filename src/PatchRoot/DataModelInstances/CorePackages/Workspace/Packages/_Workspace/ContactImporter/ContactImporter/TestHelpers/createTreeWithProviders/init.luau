local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dev.JestGlobals);
local l_createTreeWithProviders_0 = require(l_Parent_1.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_0.TestHelpers.mockAnalytics);
local v7 = require(l_Parent_0.Analytics);
local l_Roact_0 = v5.Roact;
local l_React_0 = v5.React;
local l_RoactExperimentProvider_0 = v5.RoactExperimentProvider;
local l_MagicMock_0 = v4.Mock.MagicMock;
local l_RoactNavigation_0 = v5.RoactNavigation;
local v13 = require(l_Parent_1.RoactRodux);
local v14 = require(l_Parent_1.Rodux);
local l_UniversalAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy;
local v16 = v14.Store.new(function() --[[ Line: 20 ]]
    return {};
end, {}, {
    v14.thunkMiddleware
});
return function(v17, v18) --[[ Line: 23 ]]
    -- upvalues: v6 (copy), v2 (copy), l_Roact_0 (copy), l_RoactNavigation_0 (copy), l_MagicMock_0 (copy), l_UniversalAppPolicy_0 (copy), v13 (copy), v16 (copy), l_React_0 (copy), l_RoactExperimentProvider_0 (copy), v7 (copy), l_createTreeWithProviders_0 (copy)
    local v19 = v6({
        uid = "123"
    }, v2.jest);
    return l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
        value = v18.navigation or l_MagicMock_0.new()
    }, {
        policyProvider = l_Roact_0.createElement(l_UniversalAppPolicy_0.Provider, {
            policy = {
                function() --[[ Line: 42 ]]
                    -- upvalues: v18 (copy)
                    return {
                        getShouldHideContactImporterUpsell = function() --[[ Line: 44 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
                            -- upvalues: v18 (ref)
                            return v18.policy or false;
                        end, 
                        getContactImporterEnabled = function() --[[ Line: 47 ]] --[[ Name: getContactImporterEnabled ]]
                            -- upvalues: v18 (ref)
                            return v18.policy or false;
                        end, 
                        getContactsToastEnabled = function() --[[ Line: 50 ]] --[[ Name: getContactsToastEnabled ]]
                            -- upvalues: v18 (ref)
                            return v18.policy or false;
                        end, 
                        getUpsellVoiceForPhoneVerification = function() --[[ Line: 53 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
                            -- upvalues: v18 (ref)
                            return v18.policy or false;
                        end
                    };
                end
            }
        }, {
            storeProvider = l_Roact_0.createElement(v13.StoreProvider, {
                store = v18.store or v16
            }, {
                l_React_0.createElement(l_RoactExperimentProvider_0, {
                    value = if v18.experiment then v18.experiment else l_MagicMock_0.new()
                }, {
                    Element = l_Roact_0.createElement(v7.Context.Provider, {
                        value = if v18.mockAnalytics then v18.mockAnalytics else v19.value
                    }, {
                        Element = l_createTreeWithProviders_0(v17, v18)
                    })
                })
            })
        })
    }), v19;
end;