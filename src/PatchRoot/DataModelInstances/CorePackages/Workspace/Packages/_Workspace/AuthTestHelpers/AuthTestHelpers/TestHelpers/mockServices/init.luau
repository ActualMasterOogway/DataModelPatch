local l_Parent_0 = script:FindFirstAncestor("AuthTestHelpers").Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(l_Parent_0.React);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.UIBlox);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Provider_0 = require(l_Parent_0.RoactAppExperiment).Provider;
local l_FocusControllerProvider_0 = require(l_Parent_0.UnitTestHelpers).FocusControllerProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_MockIXPService_0 = require(l_Parent_0.RoactAppExperiment).MockIXPService;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v15 = require(l_Parent_0.Cryo);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_mockHttpResponse_0 = require(l_Parent_0.UnitTestHelpers).mockHttpResponse;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v19 = require(l_Parent_0.Promise);
local v20 = require(l_Parent_0.Foundation);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_GetFFlagUIBloxFoundationProvider_0 = require(l_Parent_0.SharedFlags).GetFFlagUIBloxFoundationProvider;
local v27 = v1.strictInterface({
    includeTopBarSearchSignalProvider = v1.optional(v1.boolean), 
    includeIXPServiceProvider = v1.optional(v1.boolean), 
    includeABTestServiceProvider = v1.optional(v1.boolean), 
    browserTrackerABTests = v1.optional(v1.table), 
    userABTests = v1.optional(v1.table), 
    browserTrackerLayers = v1.optional(v1.table), 
    userLayers = v1.optional(v1.table), 
    includeStoreProvider = v1.optional(v1.boolean), 
    store = v1.optional(v1.table), 
    initialStoreState = v1.optional(v1.table), 
    includeAppGridProvider = v1.optional(v1.boolean), 
    includeStyleProvider = v1.optional(v1.boolean), 
    includeDesignTokenProvider = v1.optional(v1.boolean), 
    tokenMappers = v1.optional(v1.table), 
    includeThemeProvider = v1.optional(v1.boolean), 
    includeAppPolicyProvider = v1.optional(v1.boolean), 
    includeLocalizationProvider = v1.optional(v1.boolean), 
    includeNavigationProvider = v1.optional(v1.boolean), 
    includeFocusControllerProvider = v1.optional(v1.boolean), 
    includeApolloProvider = v1.optional(v1.boolean), 
    includeCursorProvider = v1.optional(v1.boolean), 
    includeRootRNAppContainer = v1.optional(v1.boolean), 
    middlewareList = v1.optional(v1.table), 
    focusController = v1.optional(v1.table), 
    captureFocusOnMount = v1.optional(v1.boolean), 
    includeContentProvider = v1.optional(v1.boolean), 
    includeFoundationProvider = v1.optional(v1.boolean), 
    theme = v1.optional(v1.table), 
    appPolicy = v1.optional(v1.table), 
    themeName = v1.optional(v1.string), 
    appStyle = v1.optional(v1.table), 
    appGridConfig = v1.optional(v1.table), 
    localization = v1.optional(v1.table), 
    navigation = v1.optional(v1.table), 
    extraServices = v1.optional(v1.map(v1.table, v1.any)), 
    apolloClient = v1.optional(v1.table)
});
local function v30() --[[ Line: 75 ]]
    -- upvalues: l_Constants_0 (copy), l_Localization_0 (copy)
    return {
        includeTopBarSearchSignalProvider = false, 
        includeABTestServiceProvider = false, 
        includeIXPServiceProvider = true, 
        browserTrackerABTests = {}, 
        userABTests = {}, 
        browserTrackerLayers = {}, 
        userLayers = {}, 
        includeStoreProvider = false, 
        store = {}, 
        initialStoreState = nil, 
        includeStyleProvider = true, 
        includeAppGridProvider = false, 
        includeDesignTokenProvider = false, 
        tokenMappers = {}, 
        includeThemeProvider = true, 
        includeAppPolicyProvider = false, 
        includeLocalizationProvider = true, 
        includeNavigationProvider = true, 
        includeFocusControllerProvider = false, 
        includeApolloProvider = false, 
        includeCursorProvider = false, 
        includeRootRNAppContainer = false, 
        apolloClient = nil, 
        focusController = nil, 
        captureFocusOnMount = false, 
        includeContentProvider = true, 
        includeFoundationProvider = false, 
        middlewareList = nil, 
        appPolicy = {}, 
        appStyle = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham, 
            deviceType = "Desktop"
        }, 
        appGridConfig = nil, 
        localization = l_Localization_0.new("en-us"), 
        navigation = {
            isFocused = function() --[[ Line: 114 ]] --[[ Name: isFocused ]]
                return false;
            end, 
            addListener = function() --[[ Line: 117 ]] --[[ Name: addListener ]]
                return {
                    remove = function() --[[ Line: 119 ]] --[[ Name: remove ]]

                    end
                };
            end, 
            getParam = function(_, v29) --[[ Line: 122 ]] --[[ Name: getParam ]]
                return v29;
            end, 
            navigate = function() --[[ Line: 125 ]] --[[ Name: navigate ]]

            end, 
            state = {
                routeName = "DummyRoute"
            }
        }, 
        extraServices = nil
    };
end;
local _ = function(v31) --[[ Line: 134 ]] --[[ Name: simpleSuccessRequest ]]
    -- upvalues: v19 (copy), l_mockHttpResponse_0 (copy), l_StatusCodes_0 (copy)
    assert(v31 ~= nil, "Expected responseBody not to be nil");
    return function(v32, _) --[[ Line: 138 ]]
        -- upvalues: v19 (ref), l_mockHttpResponse_0 (ref), v31 (copy), l_StatusCodes_0 (ref)
        return v19.resolve(l_mockHttpResponse_0.new(v32, v31, 0, l_StatusCodes_0.OK));
    end;
end;
return function(v35, v36) --[[ Line: 144 ]]
    -- upvalues: v30 (copy), v27 (copy), v15 (copy), l_RoactNetworking_0 (copy), v19 (copy), l_mockHttpResponse_0 (copy), l_StatusCodes_0 (copy), l_RoactAnalytics_0 (copy), l_Analytics_0 (copy), v2 (copy), l_DesignTokenProvider_0 (copy), v5 (copy), l_FetchingStatus_0 (copy), v4 (copy), l_AppStyleProvider_0 (copy), v6 (copy), l_Provider_0 (copy), l_MockIXPService_0 (copy), l_FocusControllerProvider_0 (copy), l_LocalizationProvider_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_GetFFlagUIBloxFoundationProvider_0 (copy), v20 (copy), l_RoactServices_0 (copy)
    local v37 = v30();
    if v36 then
        assert(v27(v36));
        v37 = v15.Dictionary.join(v37, v36);
    end;
    local l_store_0 = v37.store;
    local v39 = {};
    local v40 = {};
    local l_l_RoactNetworking_0_0 = l_RoactNetworking_0;
    local v42 = {};
    assert(v42 ~= nil, "Expected responseBody not to be nil");
    local l_v42_0 = v42 --[[ copy: 8 -> 10 ]];
    v40[l_l_RoactNetworking_0_0] = function(v44, _) --[[ Line: 138 ]]
        -- upvalues: v19 (ref), l_mockHttpResponse_0 (ref), l_v42_0 (copy), l_StatusCodes_0 (ref)
        return v19.resolve(l_mockHttpResponse_0.new(v44, l_v42_0, 0, l_StatusCodes_0.OK));
    end;
    v40[l_RoactAnalytics_0] = l_Analytics_0.mock();
    v39.services = v40;
    if v37.extraServices ~= nil then
        for v46, v47 in pairs(v37.extraServices) do
            assert(type(v46) == "table", "Expected key to be a table");
            v39.services[v46] = v47;
        end;
    end;
    v40 = {
        DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
            tokenMappers = v37.tokenMappers
        }, v35)
    };
    l_l_RoactNetworking_0_0 = {
        v5.thunkMiddleware
    };
    local v52 = v5.combineReducers({
        FetchingStatus = l_FetchingStatus_0, 
        ScreenSize = function(v48, v49) --[[ Line: 178 ]] --[[ Name: ScreenSize ]]
            v48 = v48 or Vector2.new(0, 0);
            assert(v48, "");
            if v49.type == "SetScreenSize" then
                return v49.screenSize;
            else
                return v48;
            end;
        end, 
        CountryCodeList = function(v50, v51) --[[ Line: 188 ]] --[[ Name: CountryCodeList ]]
            v50 = v50 or {};
            if v51.type == "SetCountryCodeList" then
                return v51.countryCodeList;
            else
                return v50;
            end;
        end
    });
    v42 = function(v53, v54) --[[ Line: 197 ]]
        -- upvalues: v52 (copy)
        return v52(v53, v54);
    end;
    if v37.initialStoreState then
        l_store_0 = v5.Store.new(v42, v37.initialStoreState, l_l_RoactNetworking_0_0);
    elseif l_store_0 then
        if getmetatable(l_store_0) == nil then
            l_store_0 = v5.Store.new(v42, l_store_0, l_l_RoactNetworking_0_0);
        end;
    else
        l_store_0 = v5.Store.new(v42, nil, l_l_RoactNetworking_0_0);
    end;
    if v37.includeStoreProvider then
        v40 = {
            StoreProvider = v2.createElement(v4.StoreProvider, {
                store = l_store_0
            }, v40)
        };
    end;
    if v37.includeStyleProvider then
        v40 = {
            StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                style = v37.appStyle
            }, v40)
        };
    end;
    if v37.includeCursorProvider then
        assert(v37.includeStyleProvider, "includeStyleProvider must be set to `true` in order to include CursorProvider");
        v40 = {
            CursorProvider = v2.createElement(v6.App.SelectionCursor.CursorProvider, {}, v40)
        };
    end;
    if v37.includeIXPServiceProvider then
        v40 = {
            IXPServiceProvider = v2.createElement(l_Provider_0, {
                value = l_MockIXPService_0.new(v37.browserTrackerLayers, v37.userLayers, true)
            }, v40)
        };
    end;
    if v37.includeFocusControllerProvider then
        v40 = {
            FocusControllerProvider = v2.createElement(l_FocusControllerProvider_0, {
                captureFocusOnMount = v37.captureFocusOnMount, 
                focusController = v37.focusController
            }, v40)
        };
    end;
    if v37.includeThemeProvider then
        v40 = {
            ThemeProvider = v2.createElement(v6.Style.Provider, {}, v40)
        };
    end;
    if v37.includeLocalizationProvider then
        v40 = {
            LocalizationProvider = v2.createElement(l_LocalizationProvider_0, {
                localization = v37.localization
            }, v40)
        };
    end;
    if v37.includeAppPolicyProvider then
        v40 = {
            AppPolicyProvider = v2.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }, 
                policyData = v37.appPolicy
            }, v40)
        };
    end;
    if v37.includeFoundationProvider or l_GetFFlagUIBloxFoundationProvider_0() and v37.includeStyleProvider then
        v40 = {
            FoundationProvider = v2.createElement(v20.FoundationProvider, {
                device = "Phone", 
                theme = "Dark"
            }, v40)
        };
    end;
    return (v2.createElement(l_RoactServices_0.ServiceProvider, v39, v40));
end;