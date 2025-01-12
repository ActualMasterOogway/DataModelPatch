local l_Parent_0 = script:FindFirstAncestor("TenFootUiTesting").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.UIBlox);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local v9 = require(l_Parent_0.t);
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local l_Constants_0 = v6.App.Style.Constants;
local v12 = require(l_Parent_0.Foundation);
local l_GetFFlagUIBloxFoundationProvider_0 = require(l_Parent_0.SharedFlags).GetFFlagUIBloxFoundationProvider;
local l_MockContentProvider_0 = v6.UnitTestHelpers.MockContentProvider;
local v15 = v9.strictInterface({
    includeStoreProvider = v9.optional(v9.boolean), 
    store = v9.optional(v9.table), 
    topLevelReducer = v9.optional(v9.callback), 
    initialStoreState = v9.optional(v9.table), 
    includeStyleProvider = v9.optional(v9.boolean), 
    includeFoundationProvider = v9.optional(v9.boolean), 
    includeLocalizationProvider = v9.optional(v9.boolean), 
    includeNavigationProvider = v9.optional(v9.boolean), 
    includeAppPolicyProvider = v9.optional(v9.boolean), 
    includeFocusControllerProvider = v9.optional(v9.boolean), 
    middlewareList = v9.optional(v9.table), 
    appStyle = v9.optional(v9.table), 
    appPolicy = v9.optional(v9.table), 
    policyFactory = v9.optional(v9.union(v9.callback, v9.table)), 
    focusController = v9.optional(v9.table), 
    captureFocusOnMount = v9.optional(v9.boolean), 
    includeContentProvider = v9.optional(v9.boolean), 
    localization = v9.optional(v9.table), 
    navigation = v9.optional(v9.table)
});
local function v16() --[[ Line: 43 ]] --[[ Name: getDefaultArgs ]]
    -- upvalues: l_Constants_0 (copy)
    return {
        includeStoreProvider = false, 
        store = nil, 
        topLevelReducer = nil, 
        initialStoreState = nil, 
        includeStyleProvider = true, 
        includeFoundationProvider = false, 
        includeLocalizationProvider = true, 
        includeNavigationProvider = false, 
        includeAppPolicyProvider = true, 
        includeFocusControllerProvider = false, 
        focusController = nil, 
        captureFocusOnMount = false, 
        includeContentProvider = false, 
        middlewareList = nil, 
        policyFactory = nil, 
        appPolicy = nil, 
        appStyle = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham
        }, 
        localization = {}, 
        navigation = {
            isFocused = function() --[[ Line: 67 ]] --[[ Name: isFocused ]]
                return false;
            end, 
            addListener = function() --[[ Line: 70 ]] --[[ Name: addListener ]]
                return {
                    remove = function() --[[ Line: 72 ]] --[[ Name: remove ]]

                    end
                };
            end, 
            getParam = function() --[[ Line: 75 ]] --[[ Name: getParam ]]
                return nil;
            end, 
            navigate = function() --[[ Line: 78 ]] --[[ Name: navigate ]]

            end, 
            state = {
                routeName = "DummyRoute"
            }
        }
    };
end;
assert(v15((v16())));
local function v18(v17) --[[ Line: 89 ]] --[[ Name: staticReducer ]]
    return v17;
end;
return function(v19, v20) --[[ Line: 100 ]] --[[ Name: mockProviders ]]
    -- upvalues: v16 (copy), v15 (copy), v1 (copy), v5 (copy), v18 (copy), v2 (copy), v4 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_AppStyleProvider_0 (copy), l_GetFFlagUIBloxFoundationProvider_0 (copy), v12 (copy), l_Constants_0 (copy), v3 (copy), v6 (copy), l_MockContentProvider_0 (copy)
    assert(v19, "Expected a map of components, received none");
    local v21 = v16();
    if v20 then
        assert(v15(v20));
        v21 = v1.join(v21, v20);
    end;
    if v21.includeStoreProvider then
        local v22 = {
            v5.thunkMiddleware
        };
        if v21.middlewareList then
            v1.append(v22, v21.middlewareList);
        end;
        local v23 = v21.topLevelReducer or v18;
        local v24 = nil;
        v24 = if v21.store then v21.store else if v21.initialStoreState then v5.Store.new(v23, v21.initialStoreState, v22) else v5.Store.new(v23, nil, v22);
        v19 = {
            StoreProvider = v2.createElement(v4.StoreProvider, {
                store = v24
            }, v19)
        };
    end;
    if v21.includeAppPolicyProvider then
        v19 = {
            PolicyProvider = v2.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0, 
                    v21.policyFactory or function() --[[ Line: 138 ]]
                        return {};
                    end
                }, 
                policyData = v21.appPolicy
            }, v19)
        };
    end;
    if v21.includeStyleProvider then
        v19 = {
            StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                style = v21.appStyle
            }, v19)
        };
    end;
    if v21.includeFoundationProvider or l_GetFFlagUIBloxFoundationProvider_0() and v21.includeStyleProvider then
        v19 = {
            FoundationProvider = v2.createElement(v12.FoundationProvider, {
                theme = if v21.appStyle.themeName == l_Constants_0.ThemeName.Dark then v12.Enums.Theme.Dark else v12.Enums.Theme.Light, 
                device = v12.Enums.Device.Desktop
            }, v19)
        };
    end;
    if v21.includeNavigationProvider then
        v19 = {
            NavigationProvider = v2.createElement(v3.Provider, {
                value = v21.navigation
            }, v19)
        };
    end;
    local v25 = v2.createElement("Folder", {}, v19);
    if v21.includeContentProvider then
        v25 = v2.createElement(v6.App.Context.ContentProvider.Provider, {
            value = l_MockContentProvider_0.new()
        }, v25);
    end;
    return v25;
end;