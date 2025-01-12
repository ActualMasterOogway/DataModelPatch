local l_Parent_0 = script:FindFirstAncestor("TenFootUiTesting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Style);
local v4 = require(l_Parent_0.UIBlox);
local l_AppNotificationService_0 = require(l_Parent_0.RoactServiceTags).AppNotificationService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v7 = require(l_Parent_0.AppCommonLib);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v9 = require(l_Parent_0.RoactServices);
local v10 = require(l_Parent_0.Dev.JestGlobals);
local v11 = require(script.Parent.mockProviders);
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local _ = require(l_Parent_0.TenFootUiCommon);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SwitchTab_0 = require(l_Parent_0.RobloxAppEnums).SwitchTab;
local l_Constants_0 = v4.App.Style.Constants;
local l_Images_0 = v4.App.ImageSet.Images;
local v19 = require(l_Parent_0.RoactNavigation);
local v20 = require(l_Parent_0.NavigationRodux);
local l_FFlagGlobalNavImageIcon_0 = require(l_Parent_0.SharedFlags).FFlagGlobalNavImageIcon;
local l_jest_0 = v10.jest;
local l_Signal_0 = v7.Signal;
local l_DesignTokenProvider_0 = v3.DesignTokenProvider;
local v25 = {
    AuthenticationStatus = {
        status = l_LoginStatus_0.LOGGED_IN
    }, 
    Startup = {
        Preloading = false
    }, 
    CrossPlaySettings = {
        Status = {
            isEnabled = true, 
            isSystemPrivilegeEnabled = true
        }, 
        SystemPrivileges = {}, 
        NetworkStatus = {}, 
        LuaError = nil, 
        HttpError = nil, 
        SystemError = nil
    }
};
local v26 = {
    tabs = {
        {
            titleLocalizationKey = "CommonUI.Features.Label.Home", 
            page = l_SwitchTab_0.HomeTab, 
            icon = if l_FFlagGlobalNavImageIcon_0 then nil else "icons/menu/home_on", 
            iconImage = if l_FFlagGlobalNavImageIcon_0 then l_Images_0["icons/menu/home_on"] else nil, 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.Discover", 
            page = l_SwitchTab_0.GamesTab, 
            icon = if l_FFlagGlobalNavImageIcon_0 then nil else "icons/menu/games_on", 
            iconImage = if l_FFlagGlobalNavImageIcon_0 then l_Images_0["icons/menu/games_on"] else nil, 
            actionType = Enum.AppShellActionType.TapGamePageTab
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
            page = l_SwitchTab_0.AvatarExperienceTab, 
            iconComponent = function() --[[ Line: 76 ]] --[[ Name: iconComponent ]]
                -- upvalues: v2 (copy)
                return v2.createElement("Frame");
            end, 
            actionType = Enum.AppShellActionType.TapAvatarTab
        }
    }, 
    options = {
        {
            titleLocalizationKey = "Feature.Catalog.Label.Search", 
            page = l_AppPage_0.SearchPage, 
            icon = "icons/common/search", 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "Feature.Home.Robux", 
            page = l_AppPage_0.PurchaseRobux, 
            icon = "icons/common/goldrobux", 
            actionType = nil
        }
    }
};
local function _(v27) --[[ Line: 98 ]] --[[ Name: createDummyStackNavigator ]]
    -- upvalues: v19 (copy)
    return v19.createNavigator(v19.RobloxSwitchView, v19.StackRouter(v27), {});
end;
local function v39(v29, v30) --[[ Line: 106 ]] --[[ Name: makeTenFootUiContextMocks ]]
    -- upvalues: l_Signal_0 (copy), l_jest_0 (copy), l_AppNotificationService_0 (copy), v19 (copy)
    local v31 = {
        ReloadPage = l_Signal_0.new(), 
        ReportMutedError = l_Signal_0.new()
    };
    v31.ReloadPage.fire = l_jest_0.fn();
    v31.ReportMutedError.fire = l_jest_0.fn();
    local v32 = newproxy(true);
    local v33 = {
        EventStream = {}
    };
    local v34 = {
        [l_AppNotificationService_0] = v30, 
        [v32] = v33
    };
    local v36 = l_jest_0.fn().mockImplementation(function(v35) --[[ Line: 122 ]]
        -- upvalues: v34 (copy)
        return v34[v35];
    end);
    local v37 = {
        LuaAppEvents = v31, 
        RoactAnalytics = v32, 
        buttonClick = l_jest_0.fn(), 
        globalNavConfig = v29, 
        useRoactService = v36
    };
    local v38 = {
        {
            Foo = function() --[[ Line: 133 ]] --[[ Name: Foo ]]
                return nil;
            end
        }
    };
    v37.RootNavigator = v19.createNavigator(v19.RobloxSwitchView, v19.StackRouter(v38), {});
    return v37;
end;
local function _() --[[ Line: 141 ]] --[[ Name: makeMockNotificationService ]]
    -- upvalues: l_jest_0 (copy)
    return {
        ActionTaken = l_jest_0.fn()
    };
end;
local function v41() --[[ Line: 145 ]] --[[ Name: makeMockLoggingService ]]
    -- upvalues: l_jest_0 (copy)
    return {
        logEventWithTimestamp = l_jest_0.fn(), 
        logEvent = l_jest_0.fn(), 
        logEventOnce = l_jest_0.fn(), 
        getTimestamp = l_jest_0.fn(), 
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logEphemeralCounterEvent = l_jest_0.fn(), 
        logEphemeralStatEvent = l_jest_0.fn()
    };
end;
local function v43(v42) --[[ Line: 157 ]] --[[ Name: makeMockGlobalNavConfig ]]
    -- upvalues: v26 (copy)
    return v42 or v26;
end;
local function v50(v44) --[[ Line: 168 ]] --[[ Name: makeMockNavigation ]]
    -- upvalues: l_AppPage_0 (copy), l_SwitchTab_0 (copy), v1 (copy), v20 (copy), l_jest_0 (copy)
    v44 = v44 or {};
    local v45 = {
        {
            key = "Landing", 
            routeName = l_AppPage_0.Landing
        }, 
        {
            key = "Startup", 
            routeName = l_AppPage_0.Startup
        }, 
        {
            key = "Home", 
            routeName = l_SwitchTab_0.HomeTab
        }, 
        {
            key = "Games", 
            routeName = l_SwitchTab_0.GamesTab
        }, 
        {
            key = "AvatarExperienceRoot", 
            routeName = l_SwitchTab_0.AvatarExperienceTab
        }, 
        {
            key = "SearchPage", 
            routeName = l_AppPage_0.SearchPage
        }, 
        {
            key = "PurchaseRobux", 
            routeName = l_AppPage_0.PurchaseRobux
        }
    };
    local v46 = {
        state = v1.Dictionary.join({
            index = 1, 
            routes = v45, 
            routeName = v20.Constants.TempRnSwitchNavigatorName
        }, v44), 
        isFocused = l_jest_0.fn().mockReturnValue(false), 
        addListener = l_jest_0.fn().mockImplementation(function() --[[ Line: 188 ]]
            -- upvalues: l_jest_0 (ref)
            return {
                remove = l_jest_0.fn()
            };
        end), 
        dispatch = l_jest_0.fn(), 
        getParam = l_jest_0.fn()
    };
    v46.navigate = l_jest_0.fn().mockImplementation(function(v47) --[[ Line: 195 ]]
        -- upvalues: v1 (ref), v46 (copy)
        local v49 = v1.List.findWhere(v46.state.routes, function(v48) --[[ Line: 196 ]]
            -- upvalues: v47 (copy)
            return v48.routeName == v47;
        end);
        if v49 ~= nil then
            v46.state = v1.Dictionary.join(v46.state, {
                index = v49
            });
            return;
        else
            error("No navigated route [" .. v47 .. "] has been mocked");
            return;
        end;
    end);
    v46.getChildNavigation = l_jest_0.fn();
    v46.router = {
        getScreenOptions = l_jest_0.fn()
    };
    return v46;
end;
local v51 = {};
v51.__index = v51;
v51.new = function(v52) --[[ Line: 230 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v51 (copy)
    local v53 = {
        locale = v52, 
        changed = l_Signal_0.new()
    };
    setmetatable(v53, v51);
    return v53;
end;
v51.SetLocale = function(v54, v55) --[[ Line: 239 ]] --[[ Name: SetLocale ]]
    if v54.locale ~= v55 then
        v54.locale = v55;
        v54.changed:fire();
    end;
end;
v51.GetLocale = function(v56) --[[ Line: 246 ]] --[[ Name: GetLocale ]]
    return v56.locale;
end;
v51.Format = function(_, v58, _) --[[ Line: 250 ]] --[[ Name: Format ]]
    return "Localized:" .. v58;
end;
makeMockLocalization = function() --[[ Line: 254 ]] --[[ Name: makeMockLocalization ]]
    -- upvalues: v51 (copy)
    return v51.new("en-us");
end;
local function v72(v60) --[[ Line: 270 ]]
    -- upvalues: v26 (copy), l_jest_0 (copy), v41 (copy), v50 (copy), v39 (copy), v11 (copy), l_Constants_0 (copy), v2 (copy), l_DesignTokenProvider_0 (copy), l_LocalizationProvider_0 (copy), l_TenFootUiContext_0 (copy), v9 (copy), l_AppLogging_0 (copy)
    v60 = v60 or {};
    assert(v60, "Config must not be nil");
    local v61 = makeMockLocalization();
    local v62 = v60.globalNavConfig or v26;
    local v63 = {
        ActionTaken = l_jest_0.fn()
    };
    local v64 = v41();
    local v65 = v50(v60.navigationState);
    local v66 = v39(v62, v63);
    return {
        function(v67) --[[ Line: 282 ]]
            -- upvalues: v11 (ref), v60 (ref), v65 (copy), l_Constants_0 (ref)
            return v11(v67.children, {
                includeStoreProvider = true, 
                includeStyleProvider = true, 
                includeNavigationProvider = true, 
                includeAppPolicyProvider = true, 
                store = v60.store, 
                initialStoreState = v60.initialStoreState or {}, 
                navigation = v65, 
                appStyle = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham, 
                    deviceType = "Console"
                }, 
                policyFactory = v60.policyFactory, 
                appPolicy = v60.appPolicy
            });
        end, 
        function(v68) --[[ Line: 300 ]]
            -- upvalues: v2 (ref), l_DesignTokenProvider_0 (ref), v60 (ref)
            return v2.createElement(l_DesignTokenProvider_0, {
                tokenMappers = v60.tokenMappers or {}, 
                uiModeInfo = {
                    deviceType = "Console", 
                    uiMode = "TenFoot"
                }
            }, v68.children);
        end, 
        function(v69) --[[ Line: 309 ]]
            -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v61 (copy)
            return v2.createElement(l_LocalizationProvider_0, {
                localization = v61
            }, v69.children);
        end, 
        function(v70) --[[ Line: 314 ]]
            -- upvalues: v2 (ref), l_TenFootUiContext_0 (ref), v60 (ref), v66 (copy)
            return v2.createElement(l_TenFootUiContext_0.Provider, {
                value = v60.tenFootUiContext or v66
            }, v70.children);
        end, 
        function(v71) --[[ Line: 323 ]]
            -- upvalues: v2 (ref), v9 (ref), l_AppLogging_0 (ref), v64 (copy)
            return v2.createElement(v9.RoactServices.ServiceProvider, {
                services = {
                    [l_AppLogging_0] = v64
                }
            }, v71.children);
        end
    }, {
        globalNavConfig = v62, 
        mockNavigation = v65, 
        mockTenFootUiContext = v66, 
        mockNotificationService = v63, 
        mockLogging = v64
    };
end;
local function v81(v73) --[[ Line: 343 ]] --[[ Name: makeMockNavigationObject ]]
    return {
        state = v73, 
        dispatch = function() --[[ Line: 346 ]] --[[ Name: dispatch ]]

        end, 
        getParam = function(...) --[[ Line: 347 ]] --[[ Name: getParam ]]

        end, 
        addListener = function(_, _) --[[ Line: 350 ]] --[[ Name: addListener ]]
            return {
                remove = function() --[[ Line: 351 ]] --[[ Name: remove ]]

                end
            };
        end, 
        getChildNavigation = function(_) --[[ Line: 353 ]] --[[ Name: getChildNavigation ]]
            return nil;
        end, 
        router = {
            getScreenOptions = function(_, _) --[[ Line: 357 ]] --[[ Name: getScreenOptions ]]
                return {};
            end, 
            getStateForAction = function(_, v80) --[[ Line: 360 ]] --[[ Name: getStateForAction ]]
                return v80;
            end
        }, 
        _dangerouslyGetParent = function() --[[ Line: 364 ]] --[[ Name: _dangerouslyGetParent ]]
            return nil;
        end
    };
end;
return {
    makeMockGlobalNavConfig = v43, 
    makeMockProviders = v72, 
    makeMockDescriptor = function(v82, v83, v84) --[[ Line: 370 ]] --[[ Name: makeMockDescriptor ]]
        -- upvalues: v2 (copy), v81 (copy)
        local v85 = nil;
        local v86 = nil;
        local v87 = v2.Component:extend("TestComponent");
        v87.render = function(v88) --[[ Line: 373 ]] --[[ Name: render ]]
            -- upvalues: v85 (ref), v86 (ref)
            v85 = v88.props.navigation;
            v86 = v88.props.screenProps;
            return nil;
        end;
        return {
            getComponent = function() --[[ Line: 379 ]] --[[ Name: getComponent ]]
                -- upvalues: v87 (copy)
                return v87;
            end, 
            key = v82, 
            options = {
                screenKind = v84
            }, 
            navigation = v81(v83), 
            state = v83
        }, v85, v86;
    end, 
    makeMockLocalization = makeMockLocalization, 
    makeTenFootUiContextMocks = v39, 
    mockCrossPlayState = v25
};