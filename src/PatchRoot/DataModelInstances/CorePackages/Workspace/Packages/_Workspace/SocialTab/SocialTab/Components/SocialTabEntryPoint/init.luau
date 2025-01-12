local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_script_FirstAncestor_0.Analytics);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_memoize_0 = v1.memoize;
local l_RetrievalStatus_0 = v1.RetrievalStatus;
local v10 = require(l_script_FirstAncestor_0.SocialTabContext);
local v11 = require(l_script_FirstAncestor_0.Navigators.getSocialTabNavigator);
local v12 = require(l_script_FirstAncestor_0.EnumScreens);
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local v15 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapStateToProps);
local v16 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapDispatchToProps);
local l_getFFlagAppChatPersistentEventReceivers_0 = v1.AppChat.Flags.getFFlagAppChatPersistentEventReceivers;
local v18 = l_Roact_0.PureComponent:extend("SocialTabEntryPoint");
v18.defaultProps = {
    logger = nil
};
v18.getDerivedStateFromProps = function(v19, _) --[[ Line: 40 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v21 = nil;
    if v19.retrievalStatus == l_RetrievalStatus_0.Done then
        v21 = true;
    end;
    return {
        wasEverDoneRetrieving = v21
    };
end;
v18.init = function(v22) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v12 (copy), l_RoactNavigation_0 (copy), l_memoize_0 (copy), v11 (copy), v3 (copy), v1 (copy), v10 (copy), l_Roact_0 (copy), l_RetrievalStatus_1 (copy), l_RetrievalStatus_0 (copy), l_LoadingStateContainer_0 (copy)
    if v22.props.logger then
        v2:setParent(v22.props.logger);
    end;
    v22.connectSocTabExternalDispatch = function(v23) --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v12 (ref), l_RoactNavigation_0 (ref)
        if v22.props.updateExternalNavigationForScreen then
            local l_RoactChat_0 = v12.RoactChat;
            v22.props.updateExternalNavigationForScreen(function(v25) --[[ Line: 60 ]]
                -- upvalues: v23 (copy), l_RoactNavigation_0 (ref), v12 (ref), v22 (ref)
                v23(l_RoactNavigation_0.Actions.navigate({
                    routeName = v12.RoactChat
                }));
                v22.props.navigateIntoChat({
                    screen = "ChatConversation", 
                    params = v25
                });
            end, l_RoactChat_0);
            return function() --[[ Line: 70 ]]
                -- upvalues: v22 (ref), l_RoactChat_0 (copy)
                v22.props.updateExternalNavigationForScreen(nil, l_RoactChat_0);
            end;
        else
            return function() --[[ Line: 74 ]]

            end;
        end;
    end;
    v22._performanceTesting = v22.props.performanceTesting;
    v22.androidBackButtonSignal = {
        [v12.SocialTab] = v22.props.signal.new(), 
        [v12.RoactChat] = v22.props.signal.new()
    };
    v22.getAppContainer = l_memoize_0(function(v26, v27) --[[ Line: 85 ]]
        -- upvalues: v12 (ref), v11 (ref), v22 (copy), l_RoactNavigation_0 (ref)
        local v28 = {
            [v12.RoactChat] = v26, 
            [v12.FriendsLanding] = v27
        };
        local v29 = v11(v28, {
            setTabBarVisible = v22.props.setTabBarVisible, 
            androidBackButtonSignal = v22.androidBackButtonSignal, 
            connectToAndroidBackButton = v22.props.androidBackButtonConnection.connect, 
            disconnectFromAndroidBackButton = v22.props.androidBackButtonConnection.disconnect, 
            androidBackButtonConnection = v22.props.androidBackButtonConnection, 
            initialRouteName = v22.props.initialRouteName
        });
        return l_RoactNavigation_0.createAppContainer(v29);
    end);
    v22.getAnalytics = l_memoize_0(function(v30) --[[ Line: 103 ]]
        -- upvalues: v3 (ref), v1 (ref)
        return v3.Class.new(v1.AnalyticsService, v30.localUserId);
    end);
    v22.fetchChatSettings = function(v31) --[[ Line: 107 ]]
        -- upvalues: v22 (copy)
        return v22.props.fetchChatSettings(v31);
    end;
    v22.renderRoactChat = function() --[[ Line: 111 ]]
        -- upvalues: v22 (copy), v10 (ref), l_Roact_0 (ref)
        if v22.props.debug_mockRenderRoactChat then
            return v22.props.debug_mockRenderRoactChat();
        else
            return v10.with(function(v32) --[[ Line: 115 ]]
                -- upvalues: l_Roact_0 (ref), v22 (ref)
                return v32.wasEverVisible and l_Roact_0.createElement(v22.props.roactChatEntryPoint, v32) or nil;
            end);
        end;
    end;
    v22.renderAppContainer = function(v33, v34) --[[ Line: 122 ]]
        -- upvalues: v22 (copy), l_Roact_0 (ref)
        if v22.props.debug_mockRenderAppContainer then
            return v22.props.debug_mockRenderAppContainer();
        else
            local l_connectSocTabExternalDispatch_0 = v22.connectSocTabExternalDispatch;
            return l_Roact_0.createElement(v33, {
                externalDispatchConnector = l_connectSocTabExternalDispatch_0, 
                androidBackButtonHandlerDisabled = v34.androidBackButtonHandlerDisabled
            });
        end;
    end;
    v22.getLoadingState = function() --[[ Line: 134 ]]
        -- upvalues: l_RetrievalStatus_1 (ref), v22 (copy), l_RetrievalStatus_0 (ref), l_Roact_0 (ref), l_LoadingStateContainer_0 (ref)
        local v36 = l_RetrievalStatus_1.fromRawValue(v22.props.retrievalStatus);
        if v22.state.wasEverDoneRetrieving then
            v36 = l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done);
        end;
        return l_Roact_0.createElement(l_LoadingStateContainer_0, {
            dataStatus = v36, 
            onRetry = v22.fetchChatSettings, 
            renderOnLoaded = v22.renderOnLoaded
        });
    end;
    v22.renderOnLoaded = function() --[[ Line: 147 ]]
        -- upvalues: v10 (ref), v22 (copy), l_Roact_0 (ref), v3 (ref)
        return v10.with(function(v37) --[[ Line: 148 ]]
            -- upvalues: v22 (ref), l_Roact_0 (ref), v3 (ref)
            local v38 = v22.getAppContainer(v37.roactChatEntryPoint, v37.getFriendsLandingEntryPoint);
            return l_Roact_0.createElement(v3.Context.Provider, {
                value = v22.getAnalytics(v37)
            }, {
                appContainer = v22.renderAppContainer(v38, v37)
            });
        end);
    end;
end;
v18.didMount = function(v39) --[[ Line: 159 ]] --[[ Name: didMount ]]
    -- upvalues: l_getFFlagAppChatPersistentEventReceivers_0 (copy), l_RetrievalStatus_0 (copy), v12 (copy)
    spawn(function() --[[ Line: 160 ]]
        -- upvalues: v39 (copy)
        v39.props.fetchUnreadConversationCount();
    end);
    if not l_getFFlagAppChatPersistentEventReceivers_0() and v39.props.retrievalStatus == l_RetrievalStatus_0.NotStarted then
        v39.fetchChatSettings(v39.props.setAppLoaded);
    end;
    if v39.props.isVisible and v39.props.toggleChatPaused ~= nil then
        v39.props.toggleChatPaused(false);
    end;
    if v39.androidBackButtonSignal then
        v39.androidBackButtonSignal[v12.SocialTab]:connect(function() --[[ Line: 177 ]]
            -- upvalues: v39 (copy)
            if v39.props.isVisible then
                v39.props.androidBackButtonConnection.showExitDialog();
            end;
        end);
    end;
end;
v18.didUpdate = function(v40, v41, _) --[[ Line: 185 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if not v41.chatLoaded and v40.props.chatLoaded then
        v40.props.notificationService:ActionEnabled(Enum.AppShellActionType.TapConversationEntry);
    end;
    if v40.props.retrievalStatus == l_RetrievalStatus_0.NotStarted then
        v40.fetchChatSettings(v40.props.setAppLoaded);
    end;
end;
v18.render = function(v43) --[[ Line: 195 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_Roact_0 (copy), v3 (copy)
    return v10.with(function(v44) --[[ Line: 196 ]]
        -- upvalues: l_Roact_0 (ref), v3 (ref), v43 (copy)
        return l_Roact_0.createElement(v3.Context.Provider, {
            value = v43.getAnalytics(v44)
        }, {
            LoadingState = v43.getLoadingState()
        });
    end);
end;
v18 = l_RoactRodux_0.connect(v15, v16)(v18);
return (v10.connect(function(v45) --[[ Line: 206 ]]
    return {
        fetchUnreadConversationCount = v45.fetchUnreadConversationCount, 
        setAppLoaded = v45.setAppLoaded, 
        roactChatEntryPoint = v45.roactChatEntryPoint, 
        notificationService = v45.notificationService, 
        config = v45.config, 
        toggleChatPaused = v45.toggleChatPaused, 
        performanceTesting = v45.performanceTesting, 
        notificationType = v45.notificationType, 
        updateExternalNavigationForScreen = v45.updateExternalNavigationForScreen
    };
end)(v18));