local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_1.CapturesCommon);
local v5 = require(l_Parent_1.Http);
local v6 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v7 = require(l_Parent_1.NavigationRodux);
local v8 = require(l_Parent_1.React);
local l_RoactAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Parent_1.RoactRodux);
local v11 = require(l_Parent_1.RoactUtils);
local v12 = require(l_Parent_1.RobloxAppEnums);
local v13 = require(l_Parent_1.Style);
local v14 = require(l_Parent_0.Analytics.AnalyticsService);
local l_AppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).AppFeaturePolicies;
local l_AppPage_0 = v12.AppPage;
local v17 = require(l_Parent_0.Constants);
local v18 = require(l_Parent_0.createStore);
local v19 = require(l_Parent_0.Components.Feed);
local v20 = require(l_Parent_0.App.FeedContext);
local l_getDeepValue_0 = v6.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_GetExperiencesDetails_0 = require(l_Parent_0.App.Networking).NetworkingGames.GetExperiencesDetails;
local v23 = require(l_Parent_0.Utils.getUniverseIds);
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_NavigateBack_0 = v7.Thunks.NavigateBack;
local l_NavigateDown_0 = v7.Thunks.NavigateDown;
local v28 = require(l_Parent_0.App.Networking);
local l_onViewportSizeChanged_0 = v4.Utils.onViewportSizeChanged;
local v30 = require(l_Parent_0.Thunks.OpenAppItemDetails);
local v31 = require(l_Parent_1.RobloxAppNavigation);
local v32 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v33 = require(l_Parent_0.Analytics.setupFireEvent);
local l_StyleProviderWithDefaultTheme_0 = v13.StyleProviderWithDefaultTheme;
local _ = require(l_Parent_0.Types);
local l_Url_0 = v5.Url;
local v37 = require(l_Parent_1.Foundation);
local l_FoundationProvider_0 = v37.FoundationProvider;
local l_useCallback_0 = v8.useCallback;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v8.useEffect;
local l_useNavigationProps_0 = v31.useNavigationProps;
local l_useState_0 = v8.useState;
local v44 = require(l_Parent_0.Flags.FIntContentFeedInitialPostLoadLimit);
local l_FFlagContentFeedPinchToZoomEnabled_0 = v4.Flags.FFlagContentFeedPinchToZoomEnabled;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_1.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v47 = v18();
return function() --[[ Line: 57 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), l_useNavigationProps_0 (copy), l_useEffect_0 (copy), v47 (copy), v28 (copy), v44 (copy), l_getDeepValue_0 (copy), v23 (copy), l_GetExperiencesDetails_0 (copy), l_onViewportSizeChanged_0 (copy), v32 (copy), l_useCallback_0 (copy), v33 (copy), v14 (copy), v17 (copy), v8 (copy), l_NavigateBack_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v30 (copy), v10 (copy), v20 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FoundationProvider_0 (copy), v37 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v19 (copy)
    local v48 = l_useDispatch_0();
    local v49, v50 = l_useState_0(false);
    local v51, v52 = l_useState_0(false);
    local v56 = l_useNavigationProps_0(function(_, v54, _) --[[ Line: 63 ]]
        return {
            onNavigateBackCallback = v54.onNavigateBackCallback, 
            postId = v54.postId, 
            userId = tostring(v54.userId)
        };
    end);
    l_useEffect_0(function() --[[ Line: 71 ]]
        -- upvalues: v47 (ref), v28 (ref), v44 (ref), v56 (copy), l_getDeepValue_0 (ref), v23 (ref), l_GetExperiencesDetails_0 (ref), v50 (copy)
        v47:dispatch(v28.ContentSharingNetworking.GetPostsByPostId.API({
            limit = v44, 
            postId = v56.postId, 
            userId = v56.userId
        })):andThen(function() --[[ Line: 78 ]]
            -- upvalues: l_getDeepValue_0 (ref), v47 (ref), v56 (ref), v23 (ref), l_GetExperiencesDetails_0 (ref)
            local v57 = l_getDeepValue_0(v47:getState(), "ContentSharing.byUserId." .. v56.userId .. ".posts") or {};
            local v58 = v23(v57);
            v47:dispatch(l_GetExperiencesDetails_0.API(v58));
        end):catch(function() --[[ Line: 86 ]]
            -- upvalues: v50 (ref)
            v50(true);
        end);
    end, {
        v56.postId, 
        v56.userId
    });
    l_useEffect_0(function() --[[ Line: 92 ]]
        -- upvalues: l_onViewportSizeChanged_0 (ref), v47 (ref), v32 (ref)
        return (l_onViewportSizeChanged_0(function(v59) --[[ Line: 93 ]]
            -- upvalues: v47 (ref), v32 (ref)
            v47:dispatch(v32(v59));
        end));
    end, {});
    local v60 = l_useCallback_0(v33({
        analytics = v14, 
        infoForAllEvents = {
            creatorUserId = v56.userId, 
            source = v17.AnalyticsSource
        }
    }), {
        v56.userId
    });
    local v62 = v8.useCallback(function(v61) --[[ Line: 111 ]]
        -- upvalues: v56 (copy), v48 (copy), l_NavigateBack_0 (ref)
        if v56.onNavigateBackCallback ~= nil then
            v56.onNavigateBackCallback(v61);
        end;
        v48(l_NavigateBack_0());
    end, {
        v56.onNavigateBackCallback
    });
    local v64 = v8.useCallback(function(v63) --[[ Line: 118 ]]
        -- upvalues: v48 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (ref), l_Url_0 (ref), l_HttpService_0 (ref)
        v48(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = string.format(v17.AbuseReportUrl, l_Url_0.BASE_URL, l_HttpService_0:UrlEncode(v63)), 
            extraProps = {
                titleKey = "Feature.Catalog.Action.Report"
            }
        }, nil));
    end, {});
    local v66 = v8.useCallback(function(v65) --[[ Line: 128 ]]
        -- upvalues: v48 (copy), v30 (ref)
        v48(v30(v65));
    end, {});
    return v8.createElement(v10.StoreProvider, {
        store = v47
    }, {
        ContextProvider = v8.createElement(v20.Provider, {
            value = {
                fireAnalyticsEvent = v60, 
                isZooming = if l_FFlagContentFeedPinchToZoomEnabled_0 then v51 else nil, 
                navigateBack = v62, 
                navigateToItemDetailPage = v66, 
                navigateToReportPage = v64, 
                setIsZooming = if l_FFlagContentFeedPinchToZoomEnabled_0 then v52 else nil
            }
        }, {
            PolicyProvider = v8.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }, {
                StyleProvider = v8.createElement(l_StyleProviderWithDefaultTheme_0, {
                    withDarkTheme = true
                }, {
                    LocalizationProvider = v8.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        FoundationProvider = v8.createElement(l_FoundationProvider_0, {
                            theme = v37.Enums.Theme.Dark, 
                            DONOTUSE_colorUpdate = l_GetFFlagLuaAppEnableFoundationColors_0()
                        }, {
                            Feed = v8.createElement(v19, {
                                creatorUserId = v56.userId, 
                                initialPostId = v56.postId, 
                                initialPostsCallFailed = v49
                            })
                        })
                    })
                })
            })
        })
    });
end;