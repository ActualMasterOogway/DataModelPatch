local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v7 = require(l_script_FirstAncestor_0.Http.openWebview);
local v8 = require(l_Parent_0.RoactRodux);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v16 = require(l_Parent_0.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v21 = require(l_Parent_0.UIBlox);
local l_SelectionCursorProvider_0 = v21.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v21.App.SelectionCursor.CursorProvider;
local v24 = require(l_Parent_0.Rodux);
local l_CountryCodeList_0 = require(l_Parent_0.AuthCommon).Reducers.CountryCodeList;
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v27 = require(l_Parent_0.Cryo);
local v28 = {
    reducer = {}
};
return function(v29) --[[ Line: 41 ]] --[[ Name: InGameContainer ]]
    -- upvalues: v27 (copy), v28 (copy), v5 (copy), v24 (copy), l_CountryCodeList_0 (copy), l_FetchingStatus_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v8 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v16 (copy), l_IXPService_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_RoactServices_0 (copy), l_RoactAnalytics_0 (copy), l_Analytics_0 (copy), l_RoactNetworking_0 (copy), l_ChallengeRequestWrapper_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy), l_ProviderContainer_0 (copy), v7 (copy)
    local v30 = v27.Dictionary.union(v28, v29);
    local v31 = v5.Children.only(v30.children);
    local v32 = {
        v24.thunkMiddleware
    };
    local v35 = v24.Store.new(v24.combineReducers(v27.Dictionary.join({
        CountryCodeList = l_CountryCodeList_0, 
        FetchingStatus = l_FetchingStatus_0, 
        ScreenSize = function(_, _) --[[ Line: 53 ]] --[[ Name: ScreenSize ]]
            return Vector2.new(400, 400);
        end
    }, v30.reducer)), nil, v32);
    local v36 = {};
    table.insert(v36, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v36, {
        class = v8.StoreProvider, 
        props = {
            store = v35
        }
    });
    table.insert(v36, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }
    });
    table.insert(v36, {
        class = v16.Provider, 
        props = {
            value = l_IXPService_0
        }
    });
    table.insert(v36, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0
            }
        }
    });
    table.insert(v36, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [l_RoactAnalytics_0] = l_Analytics_0.new(), 
                [l_RoactNetworking_0] = l_ChallengeRequestWrapper_0(l_requestInternalWrapper_0(l_HttpService_0))
            }
        }
    });
    table.insert(v36, {
        class = l_SelectionCursorProvider_0
    });
    table.insert(v36, {
        class = l_CursorProvider_0
    });
    return v5.createElement(l_ProviderContainer_0, {
        providers = v36
    }, {
        Child = v5.cloneElement(v31, {
            showWebpage = v7
        })
    });
end;