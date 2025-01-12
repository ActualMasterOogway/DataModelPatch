local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Logger);
local l_t_0 = v2.t;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_memoize_0 = v2.memoize;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ChatEntryPointNames_0 = v2.SocialCommon.Enums.ChatEntryPointNames;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Promise_0 = v2.Promise;
local l_UserSearchBarButton_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBarButton;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Components");
local v22 = require(l_script_FirstAncestor_1.ChatTile);
local v23 = require(l_script_FirstAncestor_1.GroupsTile);
local v24 = require(l_script_FirstAncestor_1.ProfileEntry);
local l_RefreshScrollingFrame_0 = v2.SocialLibraries.Components.RefreshScrollingFrame;
local l_EntryPoints_0 = v2.DiscoverabilityModal.Analytics.EntryPoints;
local l_getFStringSocialConnectTabLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialConnectTabLayer;
local v28 = 24;
local v29 = 22;
local v30 = require(l_script_FirstAncestor_0.EnumScreens);
local v31 = require(l_script_FirstAncestor_0.User);
local l_StreamNotificationsBellIcon_0 = v2.StreamNotifications.StreamNotificationsBellIcon;
local v33 = l_Roact_0.PureComponent:extend("SocialTabPage");
v33.TileCellSize = {
    Wide = UDim2.fromOffset(176, 176), 
    Compact = UDim2.fromOffset(158, 158)
};
v33.TileHorizontalAlignment = {
    Wide = Enum.HorizontalAlignment.Left, 
    Compact = Enum.HorizontalAlignment.Center
};
v33.defaultProps = {
    topBarHeight = 56, 
    navigation = nil, 
    wideMode = false, 
    unreadConversationCount = 0, 
    numberOfNotifications = 0, 
    localUser = {}, 
    enableDisplayNamePolicy = false, 
    socialText = "[LOCALIZE] TITLE", 
    chatsText = "[LOCALIZE] CHATS", 
    groupsText = "[LOCALIZE] GROUPS", 
    renderUserCarousel = function(v34) --[[ Line: 74 ]] --[[ Name: renderUserCarousel ]]
        -- upvalues: l_Roact_0 (copy)
        return l_Roact_0.createElement("TextLabel", {
            Text = "User Carousel PlaceHolder", 
            Size = UDim2.new(1, 0, 0, 40), 
            LayoutOrder = v34.LayoutOrder
        });
    end, 
    refreshPageData = function() --[[ Line: 82 ]] --[[ Name: refreshPageData ]]
        -- upvalues: l_Promise_0 (copy)
        return l_Promise_0.resolve();
    end, 
    shouldShowGroupsTilePolicy = false, 
    enableNotificationsPolicy = false, 
    disableWebViewSupport = false, 
    enteredChatFromEntryPoint = function() --[[ Line: 88 ]] --[[ Name: enteredChatFromEntryPoint ]]

    end
};
v33.validateProps = l_t_0.interface({
    topBarHeight = l_t_0.optional(l_t_0.number), 
    showTopBar = l_t_0.optional(l_t_0.boolean), 
    analytics = l_t_0.table, 
    wideMode = l_t_0.optional(l_t_0.boolean), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    navigation = l_t_0.optional(l_t_0.table), 
    localUser = v31.validateUser, 
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    enableNotificationsPolicy = l_t_0.optional(l_t_0.boolean), 
    renderUserCarousel = l_t_0.callback, 
    socialText = l_t_0.optional(l_t_0.string), 
    chatsText = l_t_0.optional(l_t_0.string), 
    groupsText = l_t_0.optional(l_t_0.string), 
    numberOfNotifications = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    refreshPageData = l_t_0.optional(l_t_0.callback), 
    shouldShowGroupsTilePolicy = l_t_0.optional(l_t_0.boolean), 
    luaAddFriendsPageEnabled = l_t_0.optional(l_t_0.boolean), 
    isLuaProfilePageEnabled = l_t_0.optional(l_t_0.boolean), 
    replaceSearchEntry = l_t_0.optional(l_t_0.boolean), 
    enteredChatFromEntryPoint = l_t_0.optional(l_t_0.callback)
});
v33.init = function(v35) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v28 (ref), v29 (ref), v3 (copy), l_ChatEntryPointNames_0 (copy), v30 (copy), l_Sources_0 (copy), l_EntryPoints_0 (copy), l_AppPage_0 (copy), l_FormFactor_0 (copy), l_memoize_0 (copy), l_Roact_0 (copy), l_StreamNotificationsBellIcon_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v22 (copy), v23 (copy)
    if v35.props.replaceSearchEntry then
        v28 = 16;
        v29 = 16;
    end;
    v35.gridButtons = v35:getGridItems();
    v35.goToChat = function() --[[ Line: 124 ]]
        -- upvalues: v3 (ref), v35 (copy), l_ChatEntryPointNames_0 (ref), v30 (ref)
        v3:info("Going to Chats");
        v35.props.analytics:buttonClick("Chats");
        v35.props.analytics:navigate("Chats");
        v35.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SocialTab);
        v35.props.navigation.navigate(v30.RoactChat);
    end;
    v35.goToGroups = function() --[[ Line: 134 ]]
        -- upvalues: v3 (ref), v35 (copy), v30 (ref)
        v3:info("Going to Groups");
        v35.props.analytics:buttonClick("Groups");
        v35.props.analytics:navigate("Groups");
        v35.props.navigateToLuaAppPages[v30.Groups]();
    end;
    v35.goToUserProfile = function() --[[ Line: 141 ]]
        -- upvalues: v3 (ref), v35 (copy), v30 (ref), l_Sources_0 (ref), l_EntryPoints_0 (ref)
        v3:info("Going to User Profile");
        v35.props.analytics:buttonClick("LoggedInUserIdentity");
        v35.props.analytics:navigate("LoggedInUserIdentity");
        if v35.props.discoverabilityUpsellOnProfileSelfViewEnabled and v35.props.isPhoneVerified and v35.props.isDiscoverabilityUnset then
            v35.props.navigateToLuaAppPages[v30.DiscoverabilityModal]({
                isStandaloneDiscoverabilityModal = true, 
                showToast = v35.props.showToast, 
                openLearnMoreLink = v35.props.openLearnMoreLink, 
                navigateOnActivated = function() --[[ Line: 154 ]] --[[ Name: navigateOnActivated ]]
                    -- upvalues: v35 (ref), v30 (ref), l_Sources_0 (ref)
                    v35.props.navigateToLuaAppPages[v30.ViewUserProfile](v35.props.localUser.id, {
                        profilePeekViewProps = {
                            source = l_Sources_0.SocialTab
                        }
                    });
                end, 
                entryPoint = l_EntryPoints_0.SocialTabProfile, 
                onClose = v35.props.closeCentralOverlay
            });
            return;
        else
            v35.props.navigateToLuaAppPages[v30.ViewUserProfile](v35.props.localUser.id, {
                profilePeekViewProps = {
                    source = l_Sources_0.SocialTab
                }
            });
            return;
        end;
    end;
    v35.goToFriendsLanding = function() --[[ Line: 173 ]]
        -- upvalues: v35 (copy), v30 (ref)
        if v35.props.navigatingFromSocialTabEvent then
            v35.props.navigatingFromSocialTabEvent(v30.FriendsLanding);
        end;
        v35.props.navigation.navigate(v30.FriendsLanding);
    end;
    v35.goToAddFriends = function() --[[ Line: 180 ]]
        -- upvalues: v35 (copy), v30 (ref)
        v35.props.navigation.navigate(v30.FriendsLanding, {
            EntryPage = "AddFriendsPage"
        });
    end;
    v35.goToUserSearch = function() --[[ Line: 184 ]]
        -- upvalues: l_AppPage_0 (ref), l_Sources_0 (ref), v35 (copy), v30 (ref), l_FormFactor_0 (ref)
        local v36 = {
            EntryPage = l_AppPage_0.SearchPage, 
            shouldShowUserSearchLandingPage = true, 
            userSearchSource = l_Sources_0.SocialTab, 
            screenTopBarParams = {
                shouldRenderCenter = true, 
                shouldAutoFocusCenter = true
            }
        };
        v35.props.navigation.navigate(v30.FriendsLanding, v36);
        v35.props.analytics:buttonClick("peopleSearchBar", {
            formFactor = v35.props.wideMode and l_FormFactor_0.WIDE or l_FormFactor_0.COMPACT
        });
        v35.props.analytics:openPlayerSearch();
    end;
    v35.renderTopBarButtons = l_memoize_0(function(v37, _) --[[ Line: 201 ]]
        -- upvalues: l_Roact_0 (ref), l_StreamNotificationsBellIcon_0 (ref), v35 (copy), l_IconButton_0 (ref), l_Images_0 (ref), v3 (ref), v30 (ref)
        local function _() --[[ Line: 202 ]]
            -- upvalues: l_Roact_0 (ref), l_StreamNotificationsBellIcon_0 (ref), v37 (copy), v35 (ref)
            return l_Roact_0.createElement(l_StreamNotificationsBellIcon_0, {
                notificationCount = v37, 
                compactWidth = not v35.props.wideMode, 
                layoutOrder = 3
            });
        end;
        local v40 = nil;
        v40 = if v35.props.enableNotificationsPolicy then l_Roact_0.createElement(l_StreamNotificationsBellIcon_0, {
            notificationCount = v37, 
            compactWidth = not v35.props.wideMode, 
            layoutOrder = 3
        }) else nil;
        if v35.props.disableWebViewSupport then
            return function() --[[ Line: 218 ]]
                -- upvalues: l_Roact_0 (ref)
                return l_Roact_0.createFragment({});
            end;
        else
            return function() --[[ Line: 222 ]]
                -- upvalues: l_Roact_0 (ref), v35 (ref), l_IconButton_0 (ref), l_Images_0 (ref), v3 (ref), v30 (ref), v40 (ref)
                return l_Roact_0.createFragment({
                    filter = if v35.props.replaceSearchEntry then nil else l_Roact_0.createElement(l_IconButton_0, {
                        size = UDim2.fromOffset(0, 0), 
                        icon = l_Images_0["icons/common/search"], 
                        layoutOrder = 1, 
                        onActivated = function() --[[ Line: 231 ]] --[[ Name: onActivated ]]
                            -- upvalues: v3 (ref), v35 (ref), v30 (ref)
                            v3:info("Going to AddFriends");
                            v35.props.analytics:buttonClick("SearchFriends");
                            v35.props.analytics:navigate("SearchFriends");
                            v35.props.navigateToLuaAppPages[v30.AddFriends]();
                        end
                    }), 
                    notifications = v40
                });
            end;
        end;
    end);
    v35.renderButtonGridItem = l_memoize_0(function(v41) --[[ Line: 244 ]]
        -- upvalues: l_Roact_0 (ref), v22 (ref), v35 (copy), v23 (ref)
        return function(v42, v43) --[[ Line: 245 ]]
            -- upvalues: l_Roact_0 (ref), v22 (ref), v41 (copy), v35 (ref), v23 (ref)
            if v42 == "Chats" then
                return l_Roact_0.createElement(v22, {
                    unreadConversationCount = v41, 
                    LayoutOrder = v43, 
                    title = v35.props.chatsText, 
                    onActivated = v35.goToChat
                });
            elseif v42 == "Groups" then
                return l_Roact_0.createElement(v23, {
                    LayoutOrder = v43, 
                    title = v35.props.groupsText, 
                    onActivated = v35.goToGroups
                });
            else
                return nil;
            end;
        end;
    end);
    v35.getButtonGridItemHeight = function(v44) --[[ Line: 265 ]]
        return v44;
    end;
    local v45, v46 = l_Roact_0.createBinding(0);
    v35.contentHeight = v45;
    v35.updateContentHeight = v46;
end;
v33.getGridItems = function(v47) --[[ Line: 272 ]] --[[ Name: getGridItems ]]
    local v48 = {
        "Chats"
    };
    if v47.props.shouldShowGroupsTilePolicy and not v47.props.disableWebViewSupport then
        table.insert(v48, "Groups");
    end;
    return v48;
end;
v33.render = function(v49) --[[ Line: 282 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), l_HeaderBar_0 (copy), l_UserSearchBarButton_0 (copy), l_RefreshScrollingFrame_0 (copy), l_HorizontalPageMargin_0 (copy), v28 (ref), v24 (copy), v29 (ref), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy)
    return l_UIBlox_0.Style.withStyle(function(_) --[[ Line: 283 ]]
        -- upvalues: l_Roact_0 (ref), v49 (copy), l_HeaderBar_0 (ref), l_UserSearchBarButton_0 (ref), l_RefreshScrollingFrame_0 (ref), l_HorizontalPageMargin_0 (ref), v28 (ref), v24 (ref), v29 (ref), l_DefaultMetricsGridView_0 (ref), l_GridMetrics_0 (ref)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, if v49.props.replaceSearchEntry then v49.props.topBarHeight + 48 else v49.props.topBarHeight), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Header = l_Roact_0.createElement(l_HeaderBar_0, {
                    barHeight = v49.props.topBarHeight, 
                    title = v49.props.socialText, 
                    renderRight = v49.renderTopBarButtons(v49.props.numberOfNotifications, v49.props.enableNotificationsPolicy)
                }), 
                UserSearchBarButton = if v49.props.replaceSearchEntry then l_Roact_0.createElement(l_UserSearchBarButton_0, {
                    onActivated = v49.goToUserSearch
                }) else nil
            }), 
            gridFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ScrollView = l_Roact_0.createElement(l_RefreshScrollingFrame_0, {
                    scrollingElementProps = {
                        Size = UDim2.new(1, 0, 1, if v49.props.replaceSearchEntry then -(v49.props.topBarHeight + 48) else -v49.props.topBarHeight), 
                        ScrollBarThickness = 0, 
                        BackgroundTransparency = 1, 
                        CanvasSize = UDim2.new(1, 0, 1, if v49.props.replaceSearchEntry then -(v49.props.topBarHeight + 48) + 1 else -v49.props.topBarHeight + 1), 
                        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                        ScrollingDirection = Enum.ScrollingDirection.Y
                    }, 
                    refresh = v49.props.refreshPageData
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    pageMargin = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
                        size = UDim2.new(1, 0, 0, 0), 
                        useAutomaticSizing = true, 
                        layoutOrder = 1, 
                        backgroundTransparency = 1
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        spacerTopBar = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v28), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1
                        }), 
                        profileEntry = l_Roact_0.createElement(v24, {
                            userText = v49.props.enableDisplayNamePolicy and v49.props.localUser.displayName or v49.props.localUser.username, 
                            avatarImage = v49.props.localUser.thumbnail, 
                            isPremium = v49.props.localUser.isPremium, 
                            navigateToLuaAppPages = v49.props.navigateToLuaAppPages, 
                            hasVerifiedBadge = v49.props.localUser.hasVerifiedBadge, 
                            onActivated = v49.goToUserProfile, 
                            layoutOrder = 2
                        }), 
                        spacerProfile = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v29), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3
                        }), 
                        friendsCarousel = v49.props.renderUserCarousel({
                            LayoutOrder = 4, 
                            wideMode = v49.props.wideMode, 
                            navigateToLuaAppPages = v49.props.navigateToLuaAppPages, 
                            goToFriendsLanding = v49.goToFriendsLanding, 
                            goToAddFriends = v49.goToAddFriends, 
                            luaAddFriendsPageEnabled = v49.props.luaAddFriendsPageEnabled
                        }), 
                        spacerFriends = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 36), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }), 
                        buttonGrid = l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
                            LayoutOrder = 6, 
                            renderItem = v49.renderButtonGridItem(v49.props.unreadConversationCount), 
                            getItemHeight = v49.getButtonGridItemHeight, 
                            getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
                            itemPadding = Vector2.new(12, 12), 
                            items = v49.gridButtons
                        })
                    })
                })
            })
        });
    end);
end;
v33.didMount = function(v51) --[[ Line: 415 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy)
    v3:info("SocialTabPage mounted");
    v51.props.analytics:pageLoaded();
end;
return (l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialConnectTabLayer_0()
}, function(v52, _) --[[ Line: 422 ]]
    -- upvalues: l_getFStringSocialConnectTabLayer_0 (copy)
    return {
        replaceSearchEntry = (v52[l_getFStringSocialConnectTabLayer_0()] or {}).replace_search_entry
    };
end)(v33));