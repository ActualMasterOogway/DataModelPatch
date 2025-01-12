local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Constants);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.SnoozeToastNotificationsButton);
local v5 = require(l_script_FirstAncestor_0.TopBarContext);
local v6 = require(l_Parent_0.ArgCheck);
local v7 = require(l_Parent_0.Roact);
local v8 = require(l_Parent_0.RoactNavigation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v10 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v10.App.Button.IconButton;
local l_Images_0 = v10.App.ImageSet.Images;
local l_Badge_0 = v10.App.Indicator.Badge;
local l_BadgeVariant_0 = v10.App.Indicator.Enum.BadgeVariant;
local v15 = require(script.Parent.SearchTopBar);
local v16 = require(script.Parent.ChatLandingContainer);
local v17 = require(script.Parent.Logger);
local v18 = require(script.Parent.Utils.getCurrentRoute);
local v19 = require(script.Parent.ChatSearchBox);
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v22 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local l_StreamNotificationsBellIcon_0 = require(l_Parent_0.StreamNotifications).StreamNotificationsBellIcon;
local v24 = game:DefineFastFlag("LuaAppNewStreamNotificationsEnabledForChat", false);
local v25 = game:DefineFastFlag("AppChatHeaderRenameToConnect2", false);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppChatInExperience;
local v27 = require(l_script_FirstAncestor_0.App.InExperienceAppChatExperimentation);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v29 = v7.PureComponent:extend("ChatLandingScreen");
v29.defaultProps = {
    navigation = nil
};
local function v34() --[[ Line: 46 ]]
    -- upvalues: v7 (copy), v5 (copy), v3 (copy), v6 (copy), l_withLocalization_0 (copy), v15 (copy)
    return v7.createElement(v5.Consumer, {
        render = function(v30) --[[ Line: 48 ]] --[[ Name: render ]]
            -- upvalues: v3 (ref), v6 (ref), l_withLocalization_0 (ref), v7 (ref), v15 (ref)
            local v31 = v30.getScreenTopBar(v3.ChatLanding);
            v6.isType(v31, "table", "screenTopBar");
            return l_withLocalization_0({
                searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
                cancelText = "Feature.Chat.Action.Cancel"
            })(function(v32) --[[ Line: 55 ]]
                -- upvalues: v7 (ref), v15 (ref), v31 (copy), v30 (copy), v3 (ref)
                return v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    filterBox = v7.createElement(v15, {
                        initialInputText = v31.filterText, 
                        cancelText = v32.cancelText, 
                        searchPlaceholderText = v32.searchPlaceholderText, 
                        captureFocusOnMount = v31.shouldAutoFocusCenter, 
                        onSelectCallback = v31.closeInputBar or function() --[[ Line: 65 ]]

                        end, 
                        resetOnMount = function() --[[ Line: 67 ]] --[[ Name: resetOnMount ]]
                            -- upvalues: v30 (ref), v3 (ref)
                            v30.setScreenTopBar(v3.ChatLanding, {
                                shouldAutoFocusCenter = false
                            });
                        end, 
                        cancelCallback = function() --[[ Line: 73 ]] --[[ Name: cancelCallback ]]
                            -- upvalues: v30 (ref), v3 (ref)
                            v30.setScreenTopBar(v3.ChatLanding, {
                                shouldRenderCenter = false, 
                                filterText = ""
                            });
                        end, 
                        textChangedCallback = function(v33) --[[ Line: 80 ]] --[[ Name: textChangedCallback ]]
                            -- upvalues: v30 (ref), v3 (ref)
                            v30.setScreenTopBar(v3.ChatLanding, {
                                filterText = v33
                            });
                        end
                    })
                });
            end);
        end
    });
end;
v29.navigationOptions = function(v35) --[[ Line: 92 ]]
    -- upvalues: v25 (copy), v2 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v27 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v34 (copy), l_default_0 (copy), v22 (copy), v7 (copy), v5 (copy), v3 (copy), v6 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v20 (copy), v24 (copy), l_StreamNotificationsBellIcon_0 (copy), v17 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy), v4 (copy)
    local l_navigation_0 = v35.navigation;
    local v37 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
    local v38 = if v25 then l_navigation_0.getScreenProps("topBarUseConnectHeader", false) else nil;
    local v39 = l_navigation_0.getScreenProps("wideMode", false);
    local l_v2_IconButtonWidth_0 = v2:GetIconButtonWidth(v39);
    local v41 = l_navigation_0.getScreenProps("isInExperience", false);
    local v42 = v37 and true or false;
    local v43 = l_GetFFlagEnableAppChatInExperience_0() and v41 and v27.getShowPlatformChatInChrome();
    return {
        headerText = if l_GetFFlagAppChatRebrandStringUpdates_0() then {
            raw = "Feature.Squads.Label.Party", 
            shouldLocalize = true
        } else if v25 and v38 then {
            raw = "Feature.Chat.Label.Connect", 
            shouldLocalize = true
        } else {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        }, 
        backButtonEnabled = not v43 and v42, 
        closeButtonEnabled = v43 and v42, 
        tabBarVisible = not v37 or nil, 
        isRoot = true, 
        isTitleLeftAligned = true, 
        renderCenter = v34, 
        shouldBoldHeader = l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() and true or nil, 
        renderRight = function() --[[ Line: 138 ]] --[[ Name: renderRight ]]
            -- upvalues: v22 (ref), v7 (ref), v5 (ref), v3 (ref), v6 (ref), l_navigation_0 (copy), l_IconButton_0 (ref), l_v2_IconButtonWidth_0 (copy), l_Images_0 (ref), v20 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), v24 (ref), l_StreamNotificationsBellIcon_0 (ref), v39 (copy), v17 (ref), l_Badge_0 (ref), l_BadgeVariant_0 (ref), v4 (ref)
            return v22(function(v44) --[[ Line: 139 ]]
                -- upvalues: v7 (ref), v5 (ref), v3 (ref), v6 (ref), l_navigation_0 (ref), l_IconButton_0 (ref), l_v2_IconButtonWidth_0 (ref), l_Images_0 (ref), v20 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), v24 (ref), l_StreamNotificationsBellIcon_0 (ref), v39 (ref), v17 (ref), l_Badge_0 (ref), l_BadgeVariant_0 (ref), v4 (ref)
                return v7.createElement(v5.Consumer, {
                    render = function(v45) --[[ Line: 141 ]] --[[ Name: render ]]
                        -- upvalues: v3 (ref), v6 (ref), l_navigation_0 (ref), v7 (ref), l_IconButton_0 (ref), l_v2_IconButtonWidth_0 (ref), l_Images_0 (ref), v44 (copy), v20 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), v24 (ref), l_StreamNotificationsBellIcon_0 (ref), v39 (ref), v17 (ref), l_Badge_0 (ref), l_BadgeVariant_0 (ref), v4 (ref)
                        local v46 = v45.getScreenTopBar(v3.ChatLanding);
                        v6.isType(v46, "table", "screenTopBar");
                        local v47 = l_navigation_0.getScreenProps("notificationCount", 0);
                        local v48 = l_navigation_0.getScreenProps("topBarShowSearch", false);
                        local v49 = l_navigation_0.getScreenProps("topBarShowCreateChatGroup", false);
                        local v50 = l_navigation_0.getScreenProps("topBarShowNotifications", false);
                        local v51 = l_navigation_0.getScreenProps("topBarShowSnoozeNotifications", false);
                        if v46.shouldRenderCenter then
                            return nil;
                        else
                            local l_createFragment_0 = v7.createFragment;
                            local v53 = {
                                filter = v48 and v7.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v2_IconButtonWidth_0, 1, 0), 
                                    icon = l_Images_0["icons/common/search"], 
                                    layoutOrder = 1, 
                                    onActivated = function() --[[ Line: 162 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v45 (copy), v3 (ref), v44 (ref), v20 (ref)
                                        v45.setScreenTopBar(v3.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true
                                        });
                                        if v44 then
                                            v44.fireAnalyticsEvent(v20.ChatLandingSearchBtnClicked);
                                        end;
                                    end
                                }), 
                                createNewChat = v49 and v7.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v2_IconButtonWidth_0, 1, 0), 
                                    icon = if l_GetFFlagAppChatRebrandStringUpdates_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                    layoutOrder = 2, 
                                    onActivated = function() --[[ Line: 180 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v3 (ref), v44 (ref), v20 (ref)
                                        l_navigation_0.navigate(v3.CreateNewChat);
                                        if v44 then
                                            v44.fireAnalyticsEvent(v20.ChatLandingComposeBtnClicked);
                                        end;
                                    end
                                })
                            };
                            local l_v50_0 = v50;
                            if l_v50_0 then
                                if v24 then
                                    l_v50_0 = v7.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v47, 
                                        compactWidth = not v39, 
                                        layoutOrder = 3
                                    });
                                else
                                    l_v50_0 = v7.createElement;
                                    local l_l_IconButton_0_0 = l_IconButton_0;
                                    local v57 = {
                                        size = UDim2.new(0, l_v2_IconButtonWidth_0, 1, 0), 
                                        icon = l_Images_0["icons/common/notificationOn"], 
                                        layoutOrder = 3, 
                                        onActivated = function() --[[ Line: 200 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v3 (ref), v17 (ref), v44 (ref), v20 (ref)
                                            local v56 = l_navigation_0.getScreenProps("navigateToLuaAppPages", {})[v3.Notifications];
                                            if v56 then
                                                v17:info("Navigate To Notifications from {screen}");
                                                v56();
                                            else
                                                v17:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
                                            end;
                                            if v44 then
                                                v44.fireAnalyticsEvent(v20.ChatLandingNotifBtnClicked);
                                            end;
                                        end
                                    };
                                    local v58 = {};
                                    local v59 = false;
                                    if v47 > 0 then
                                        v59 = v7.createElement(l_Badge_0, {
                                            position = UDim2.new(0.5, 0, 0.5, 0), 
                                            anchorPoint = Vector2.new(0, 1), 
                                            value = v47, 
                                            badgeVariant = l_BadgeVariant_0.Alert
                                        });
                                    end;
                                    v58.notificationBadge = v59;
                                    l_v50_0 = l_v50_0(l_l_IconButton_0_0, v57, v58);
                                end;
                            end;
                            v53.notifications = l_v50_0;
                            v53.snoozeChatNotifications = if v51 then v7.createElement(v4, {
                                layoutOrder = 4, 
                                size = UDim2.new(0, l_v2_IconButtonWidth_0, 1, 0)
                            }) else nil;
                            return l_createFragment_0(v53);
                        end;
                    end
                });
            end);
        end
    };
end;
v29.init = function(v60) --[[ Line: 242 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v3 (copy), v18 (copy), v8 (copy), v6 (copy)
    v60.navigateToConversation = function(v61) --[[ Line: 243 ]]
        -- upvalues: v17 (ref), v60 (copy), v3 (ref)
        v17:info("Navigate To Conversation: {} from {screen}", v61);
        v60.props.navigation.navigate(v3.ChatConversation, {
            conversationId = v61
        });
        v60.resetScreenTopBar();
    end;
    v60.navigateToCreateChat = function() --[[ Line: 249 ]]
        -- upvalues: v17 (ref), v60 (copy), v3 (ref)
        v17:info("Navigate To CreateNewChat from {screen}");
        v60.props.navigation.push(v3.CreateNewChat);
    end;
    v60.navigateToToast = function(v62) --[[ Line: 254 ]]
        -- upvalues: v17 (ref), v60 (copy), v3 (ref)
        v17:info("Navigate To Toast from {screen}");
        v60.props.navigation.navigate(v3.RoactChatToast, v62);
    end;
    v60.navigateToPrivacy = function() --[[ Line: 259 ]]
        -- upvalues: v60 (copy), v3 (ref), v17 (ref)
        local v63 = v60.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v3.PrivacySettings];
        if v63 then
            v17:info("Navigate To PrivacySettings from {screen}");
            v63();
            return;
        else
            v17:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v60.navigateToSquadLobby = function(v64) --[[ Line: 270 ]]
        -- upvalues: v17 (ref), v18 (ref), v60 (copy), v3 (ref), v8 (ref)
        v17:info("Navigate To SquadLobby from {screen}");
        local v65 = v18(v60.props.navigation.state);
        if v65 and v65.params and v65.params.conversationId == v64 and v65.routeName == v3.ChatConversation then
            v60.props.navigation.navigate(v3.SquadLobby, {
                conversationId = v64
            });
            return;
        else
            v60.props.navigation.reset({
                v8.Actions.navigate({
                    routeName = v3.ChatLanding
                }), 
                v8.Actions.navigate({
                    routeName = v3.ChatConversation, 
                    params = {
                        conversationId = v64
                    }
                }), 
                v8.Actions.navigate({
                    routeName = v3.SquadLobby, 
                    params = {
                        conversationId = v64
                    }
                })
            }, 3);
            return;
        end;
    end;
    v60.setScreenTopBar = function(v66) --[[ Line: 298 ]]
        -- upvalues: v60 (copy), v6 (ref), v3 (ref)
        local v67 = v60.props.navigation.getScreenProps("setScreenTopBar", nil);
        v6.isNotNil(v67, "setScreenTopBar in screenProps");
        v67(v3.ChatLanding, v66);
    end;
    v60.resetScreenTopBar = function() --[[ Line: 304 ]]
        -- upvalues: v6 (ref), v60 (copy), v3 (ref)
        local v68 = v6.isNotNil(v60.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(v3.ChatLanding);
        if v68.filterText == "" and v68.shouldRenderCenter then
            v60.setScreenTopBar({
                shouldRenderCenter = false
            });
        end;
    end;
end;
v29.render = function(v69) --[[ Line: 318 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v6 (copy), v7 (copy), v5 (copy), v3 (copy), v16 (copy), v25 (copy), l_default_0 (copy), v19 (copy)
    v17:info("{screen} render");
    local v70 = v6.isNotNil(v69.props.navigation, "navigation in ChatLandingScreen");
    local v71 = v70 and v70.getParam("key", "") or "";
    local v72 = v70.getScreenProps("showSearchRow", true);
    local v73 = v70.getScreenProps("topBarHeight", 0);
    return v7.createElement(v5.Consumer, {
        render = function(v74) --[[ Line: 326 ]] --[[ Name: render ]]
            -- upvalues: v3 (ref), v6 (ref), v7 (ref), v16 (ref), v70 (copy), v25 (ref), l_default_0 (ref), v69 (copy), v71 (copy), v72 (copy), v19 (ref), v73 (copy)
            local v75 = v74.getScreenTopBar(v3.ChatLanding);
            v6.isType(v75, "table", "screenTopBar");
            local v76 = v7.createElement(v16, {
                isShowingFilterBox = v75.shouldRenderCenter, 
                filterText = v75.filterText, 
                topBarHeight = v70.getScreenProps("topBarHeight", 0), 
                pageHeaderText = if v25 then nil else "CommonUI.Features.Label.Chat", 
                navigateToAddFriends = if l_default_0.isEnabled() then v69.props.navigation.getScreenProps("navigateToAddFriends", {}) else nil, 
                navigateToConversation = v69.navigateToConversation, 
                navigateToCreateChat = v69.navigateToCreateChat, 
                navigateToPrivacy = v69.navigateToPrivacy, 
                navigateToSquadLobby = v69.navigateToSquadLobby, 
                navigateToToast = v69.navigateToToast, 
                key = "ChatLanding" .. v71
            });
            if v72 then
                return v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        VerticalFlex = Enum.UIFlexAlignment.Fill, 
                        Padding = UDim.new(0, 0)
                    }), 
                    ChatSearchBox = v7.createElement(v19, {
                        height = v73, 
                        initialText = v75.filterText, 
                        onFilter = function(v77) --[[ Line: 361 ]] --[[ Name: onFilter ]]
                            -- upvalues: v74 (copy), v3 (ref)
                            v74.setScreenTopBar(v3.ChatLanding, {
                                filterText = v77
                            });
                        end
                    }); 
                    v76
                });
            else
                return v76;
            end;
        end
    });
end;
v29.didMount = function(v78) --[[ Line: 376 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    v17:info("{screen} mounted");
    v78.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v29;