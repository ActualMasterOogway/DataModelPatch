local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Logger_0 = v1.Logger;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_llama_0 = v1.llama;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Navigator);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local v11 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_memoize_0 = v1.memoize;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_BottomInsetBackground_0 = v1.SocialCommon.Components.BottomInsetBackground;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v16 = require(script.mapStateToProps);
local v17 = require(script.mapDispatchToProps);
local l_withLocalization_0 = v1.withLocalization;
local v19 = require(l_script_FirstAncestor_0.Components.FriendsLandingEventListener);
local v20 = l_Roact_0.PureComponent:extend("FriendsLandingEntryPoint");
local function v21() --[[ Line: 22 ]]

end;
local l_getFStringSocialAddFriendsPageLayer_0 = v1.getFStringSocialAddFriendsPageLayer;
v20.defaultProps = {
    renderAndroidBackButtonNavigationHandler = nil, 
    luaAppPages = {}, 
    isLuobu = false, 
    logger = nil, 
    debug_willUnmount = nil
};
v20.init = function(v23) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v11 (copy), v10 (copy), l_llama_0 (copy), v21 (copy), l_memoize_0 (copy), v8 (copy)
    if v23.props.logger then
        l_Logger_0:setParent(v23.props.logger);
    end;
    v23.state = {
        filter = v11.All, 
        topBar = {
            [v10.FriendsLanding] = {
                shouldRenderCenter = false
            }
        }
    };
    v23.localization = {
        pageError = "CommonUI.Messages.Response.PageError"
    };
    v23.setFilterKeys = function(v24) --[[ Line: 56 ]]
        -- upvalues: v23 (copy)
        assert(type(v24) == "string", "Expected value to be a string");
        v23:setState({
            filter = v24
        });
    end;
    v23.getScreenTopBar = function(v25) --[[ Line: 61 ]]
        -- upvalues: v23 (copy)
        return v23.state.topBar[v25] or {};
    end;
    v23.setScreenTopBar = function(v26, v27) --[[ Line: 65 ]]
        -- upvalues: v23 (copy), l_llama_0 (ref)
        v23:setState(function(v28) --[[ Line: 66 ]]
            -- upvalues: l_llama_0 (ref), v26 (copy), v27 (copy), v23 (ref)
            local v29 = l_llama_0.Dictionary.join(v28.topBar[v26] or {}, v27);
            return {
                topBar = l_llama_0.Dictionary.join(v23.state.topBar, {
                    [v26] = v29
                })
            };
        end);
    end;
    v23.showErrorToast = function(v30) --[[ Line: 77 ]]
        -- upvalues: v23 (copy), v10 (ref)
        v23.props.navigation.navigate(v10.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v30
                }
            }
        });
    end;
    v23.refreshPage = function(v31) --[[ Line: 87 ]]
        -- upvalues: v23 (copy), l_Logger_0 (ref), v21 (ref)
        return v23.props.refreshPageData({
            localUserId = v23.props.localUserId, 
            inactiveFriendsNetworkRequestStatus = v23.props.inactiveFriendsNetworkRequestStatus, 
            onError = function() --[[ Line: 91 ]] --[[ Name: onError ]]
                -- upvalues: v23 (ref), v31 (copy), l_Logger_0 (ref)
                v23.showErrorToast(v31.errorMessage);
                l_Logger_0:info("Refreshing FriendsLanding data failed");
            end, 
            onResolve = v31.onResolve or v21
        });
    end;
    v23.getAnalytics = l_memoize_0(function(v32) --[[ Line: 99 ]]
        -- upvalues: v8 (ref), v23 (copy)
        return v8.Class.new({
            Diag = v23.props.diagService, 
            EventStream = v23.props.eventIngestService
        }, v32, v23.props.getLoadingTimeInfo);
    end);
end;
v20.render = function(v33) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), v8 (copy), v7 (copy), v9 (copy), v19 (copy), l_BottomInsetBackground_0 (copy)
    local v34 = v33.props.renderAndroidBackButtonNavigationHandler and v33.props.renderAndroidBackButtonNavigationHandler(v33.props.navigation) or nil;
    return l_withLocalization_0(v33.localization)(function(v35) --[[ Line: 111 ]]
        -- upvalues: l_Roact_0 (ref), v8 (ref), v33 (copy), v7 (ref), v9 (ref), v19 (ref), v34 (copy), l_BottomInsetBackground_0 (ref)
        return l_Roact_0.createElement(v8.Context.Provider, {
            value = v33.getAnalytics(v33.props.localUserId)
        }, {
            l_Roact_0.createElement(v7.Provider, {
                value = {
                    exitFriendsLanding = v33.props.exitFriendsLanding or nil, 
                    navigateToLuaAppPages = v33.props.navigateToLuaAppPages, 
                    filter = v33.state.filter, 
                    setFilterKeys = v33.setFilterKeys, 
                    screenSize = v33.props.screenSize, 
                    friendRequestCount = v33.props.friendRequestCount, 
                    totalFriendCount = v33.props.totalFriendCount, 
                    wideMode = v33.props.wideMode, 
                    playerSearchPage = v33.props.luaAppPages.playerSearchPage, 
                    diagService = v33.props.diagService, 
                    eventIngestService = v33.props.eventIngestService, 
                    isLuobu = v33.props.isLuobu, 
                    entryPage = v33.props.entryPage, 
                    luaAddFriendsPageEnabled = v33.props.luaAddFriendsPageEnabled, 
                    getScreenTopBar = v33.getScreenTopBar, 
                    setScreenTopBar = v33.setScreenTopBar, 
                    refreshPage = v33.refreshPage, 
                    friendsRequestEventListener = v33.props.friendsRequestEventListener, 
                    robloxEventReceiver = v33.props.robloxEventReceiver, 
                    contactImporterAndPYMKEnabled = v33.props.contactImporterAndPYMKEnabled, 
                    contactImporterExperimentVariant = v33.props.contactImporterExperimentVariant, 
                    addFriendsPageSearchbarEnabled = v33.props.addFriendsPageSearchbarEnabled, 
                    openProfilePeekView = v33.props.openProfilePeekView, 
                    openPlayerContextualMenu = v33.props.openPlayerContextualMenu, 
                    openAmpUpsell = v33.props.openAmpUpsell, 
                    passedNavParams = v33.props.passedNavParams
                }
            }, {
                navigation = l_Roact_0.createElement(v9, {
                    navigation = v33.props.navigation
                }), 
                friendsLandingEventListener = l_Roact_0.createElement(v19, {
                    pageError = v35.pageError, 
                    navigation = v33.props.navigation, 
                    getFriendRequestsCount = v33.props.getFriendRequestsCount
                }), 
                androidBackButtonNavigationHandler = v34, 
                BottomInsetBackground = l_Roact_0.createElement(l_BottomInsetBackground_0)
            })
        });
    end);
end;
v20.didMount = function(_) --[[ Line: 162 ]] --[[ Name: didMount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("FriendsLandingEntryPoint mounted");
end;
v20.willUnmount = function(v37) --[[ Line: 166 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("FriendsLandingEntryPoint unmounted");
    if v37.props.debug_willUnmount then
        v37.props.debug_willUnmount();
    end;
end;
v20 = l_compose_0(l_RoactRodux_0.connect(v16, v17), l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v38, _) --[[ Line: 177 ]]
    -- upvalues: l_getFStringSocialAddFriendsPageLayer_0 (copy)
    return {
        addFriendsPageSearchbarEnabled = (v38[l_getFStringSocialAddFriendsPageLayer_0()] or {}).show_add_friends_page_search_bar
    };
end, false))(v20);
v20.router = v9.router;
return v20;