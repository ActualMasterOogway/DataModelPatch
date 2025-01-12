local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local _ = require(l_Parent_0.React);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local v8 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local v14 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local l_useFocusGuiObject_0 = v1.useFocusGuiObject;
local l_RefreshScrollingFrame_0 = v1.SocialLibraries.Components.RefreshScrollingFrame;
local l_memoize_0 = v1.memoize;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_VerticalScrollViewWithMargin_0 = l_UIBlox_0.App.Container.VerticalScrollViewWithMargin;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v26 = require(l_script_FirstAncestor_0.EnumScreens);
local v27 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v28 = require(l_script_FirstAncestor_0.Friends.filterFriends);
local v29 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local v30 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v31 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v33 = require(l_script_FirstAncestor_0.Components.FilterByButton);
local v34 = require(l_script_FirstAncestor_0.Components.FriendTile);
local v35 = require(l_script_FirstAncestor_0.Components.EmptyResultsView);
local v36 = require(l_script_FirstAncestor_0.Components.NoFriendsView);
local v37 = require(script.Parent.FriendsListHeader);
local v38 = require(l_script_FirstAncestor_0.Flags.getFIntFriendsLandingFriendPruningUpsellMinFriends);
local v39 = require(l_script_FirstAncestor_0.Flags.getFIntFriendsLandingFriendPruningUpsellMinInactiveFriends);
local l_FFlagCalculateFriendsTileSize_0 = require(l_Parent_0.SharedFlags).FFlagCalculateFriendsTileSize;
local function v41() --[[ Line: 56 ]]

end;
local v42 = l_Roact_0.PureComponent:extend("FriendsLandingPage");
local v43 = l_Images_0["icons/actions/friends/friendRemove"];
v42.defaultProps = {
    friends = {}, 
    totalFilteredFriends = 0, 
    totalFriendCount = 0, 
    isLocalUserSoothsayer = false, 
    isLuobu = false, 
    renderShowMore = v41, 
    analytics = nil, 
    navigateToLuaAppPages = nil, 
    refreshPage = v41, 
    filter = v27.All, 
    unfriendTargetUser = v41, 
    devForceFriendPruningUpsellOn = false, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
    gridHorizontalSpacing = 12, 
    gridVerticalSpacing = 12
};
v42.init = function(v44) --[[ Line: 138 ]] --[[ Name: init ]]
    -- upvalues: l_AppStorageService_0 (copy), v38 (copy), v39 (copy), l_memoize_0 (copy), l_convertUserPresenceTypeToString_0 (copy), v26 (copy), v30 (copy), v31 (copy), v28 (copy), v29 (copy), v43 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), v34 (copy), v27 (copy), l_FFlagCalculateFriendsTileSize_0 (copy), v41 (copy)
    local v45 = if game:GetEngineFeature("UniversalAppPruningAlertStorageKey") then l_AppStorageService_0:GetItem("FriendPruningAlertSeen") == "true" else false;
    local v46 = v44.props.devForceFriendPruningUpsellOn or not v45 and (v44.props.totalFriendCount >= v38() and v44.props.totalInactiveFriends >= v39() or v44.props.isLocalUserSoothsayer);
    v44.state = {
        showFriendPruningAlert = v46, 
        showFriendPruningTooltip = v46
    };
    v44.openPlayerContextualMenu = l_memoize_0(function(v47) --[[ Line: 160 ]]
        -- upvalues: v44 (copy), l_convertUserPresenceTypeToString_0 (ref)
        return function() --[[ Line: 161 ]]
            -- upvalues: v44 (ref), v47 (copy), l_convertUserPresenceTypeToString_0 (ref)
            v44.props.openPlayerContextualMenu({
                subjectUserId = v47.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v47.lastLocation, 
                    locationPlaceId = v47.placeId, 
                    locationRootPlaceId = v47.rootPlaceId, 
                    locationUniverseId = v47.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v47.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end);
    v44.openPlayerProfile = l_memoize_0(function(v48, v49, v50, v51, v52) --[[ Line: 177 ]]
        -- upvalues: v44 (copy), v26 (ref), v30 (ref), v31 (ref)
        return function() --[[ Line: 178 ]]
            -- upvalues: v44 (ref), v26 (ref), v30 (ref), v48 (copy), v49 (copy), v50 (copy), v51 (copy), v52 (copy), v31 (ref)
            v44.props.analytics:navigate(v26.ViewUserProfile);
            v44.props.analytics:buttonClick(v30.PlayerTile, {
                friendId = v48, 
                position = v49 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            local v53 = {
                user = v50, 
                positionIndex = v49 or 0, 
                absolutePosition = (v49 or 0) + 1, 
                onOpen = function() --[[ Line: 190 ]] --[[ Name: onOpen ]]

                end, 
                onClose = function() --[[ Line: 191 ]] --[[ Name: onClose ]]

                end, 
                anchorSpaceSize = v51, 
                anchorSpacePosition = v52
            };
            local v54 = {
                openJoinable = true, 
                contextualMenuProps = v53, 
                source = v31.FriendsLandingPageSourceName
            };
            v44.props.navigateToLuaAppPages[v26.ViewUserProfile](v48, v54);
        end;
    end);
    v44.pageLoadingTimeReport = function() --[[ Line: 204 ]]
        -- upvalues: v44 (copy)
        v44.props.analytics:pageLoadingTimeReport();
    end;
    v44.filterFriends = l_memoize_0(v28);
    v44.onFewestInteractionsSelection = function() --[[ Line: 210 ]]
        -- upvalues: v44 (copy), l_AppStorageService_0 (ref)
        v44:setState({
            showFriendPruningAlert = false, 
            showFriendPruningTooltip = false
        });
        if game:GetEngineFeature("UniversalAppPruningAlertStorageKey") then
            pcall(function() --[[ Line: 216 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                l_AppStorageService_0:SetItem("FriendPruningAlertSeen", "true");
                l_AppStorageService_0:Flush();
            end);
        end;
    end;
    v44.onTooltipDismissal = function() --[[ Line: 223 ]]
        -- upvalues: v44 (copy)
        v44:setState({
            showFriendPruningTooltip = false
        });
    end;
    v44.onUnfriend = l_memoize_0(function(v55, v56) --[[ Line: 229 ]]
        -- upvalues: v44 (copy), v26 (ref)
        v44.props.navigation.navigate(v26.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v55, 
                    iconImage = v56
                }
            }
        });
    end);
    v44.onUnfriendButtonActivated = function(v57, v58, v59) --[[ Line: 240 ]]
        -- upvalues: v44 (copy), v30 (ref), v29 (ref), v43 (ref)
        return function() --[[ Line: 241 ]]
            -- upvalues: v59 (copy), v44 (ref), v30 (ref), v29 (ref), v57 (copy), v43 (ref), v58 (copy)
            if v59.id ~= nil then
                v44.props.analytics:buttonClick(v30.FriendTileUnfriendButton, {
                    friendCount = tostring(v44.props.totalFriendCount), 
                    inactiveFriendCount = tostring(v44.props.totalFilteredFriends), 
                    presence = tostring(v29(v59)), 
                    unfriendUserId = v59.id
                });
                v44.props.unfriendTargetUser({
                    targetUserId = v59.id, 
                    currentUserId = v44.props.localUserId
                }):andThen(function() --[[ Line: 251 ]]
                    -- upvalues: v44 (ref), v57 (ref), v43 (ref)
                    v44.onUnfriend(v57, v43);
                end):catch(function() --[[ Line: 254 ]]
                    -- upvalues: v44 (ref), v58 (ref)
                    v44.onUnfriend(v58);
                end);
            end;
            if v44.props.navigation then
                v44.props.navigation.goBack();
            end;
        end;
    end;
    v44.renderItem = function(v60, v61) --[[ Line: 264 ]]
        -- upvalues: l_withLocalization_0 (ref), v44 (copy), v26 (ref), l_Roact_0 (ref), v34 (ref), v27 (ref), v43 (ref)
        return l_withLocalization_0({
            successText = "Feature.Friends.Action.FriendRemoved", 
            errorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
        })(function(v62) --[[ Line: 268 ]]
            -- upvalues: v44 (ref), v26 (ref), l_Roact_0 (ref), v34 (ref), v60 (copy), v61 (copy), v27 (ref), v43 (ref)
            local function v63() --[[ Line: 269 ]]
                -- upvalues: v44 (ref), v26 (ref), v62 (copy)
                return function() --[[ Line: 270 ]]
                    -- upvalues: v44 (ref), v26 (ref), v62 (ref)
                    v44.props.navigation.navigate(v26.GenericToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = v62.errorText
                            }
                        }
                    });
                end;
            end;
            return l_Roact_0.createElement(v34, {
                user = v60, 
                index = v61, 
                openPlayerProfile = if v44.props.isPlayerContextualMenuEnabled then if v44.props.openPlayerContextualMenu == nil then v63 else v44.openPlayerContextualMenu else v44.openPlayerProfile, 
                isPlayerContextualMenuEnabled = v44.props.isPlayerContextualMenuEnabled, 
                isLuobu = v44.props.isLuobu, 
                pageLoadingTimeReport = v44.pageLoadingTimeReport, 
                buttons = if v44.props.filter == v27.Inactive then {
                    {
                        icon = v43, 
                        isSecondary = false, 
                        onActivated = v44.onUnfriendButtonActivated(v62.successText, v62.errorText, v60)
                    }
                } else nil, 
                selected = v61 == v44.props.selectedItemIndex, 
                focusGuiObject = v44.props.focusGuiObject
            });
        end);
    end;
    v44.getItemHeight = function(v64) --[[ Line: 309 ]]
        -- upvalues: l_FFlagCalculateFriendsTileSize_0 (ref), v44 (copy)
        if l_FFlagCalculateFriendsTileSize_0 then
            return v64 + v44.props.tileHeightOffset;
        else
            return v64 + 80;
        end;
    end;
    v44.filterButtonOnActivated = function(v65) --[[ Line: 315 ]]
        -- upvalues: v44 (copy), v30 (ref), v26 (ref), v41 (ref), v27 (ref)
        return function() --[[ Line: 316 ]]
            -- upvalues: v44 (ref), v30 (ref), v26 (ref), v65 (copy), v41 (ref), v27 (ref)
            v44.props.analytics:buttonClick(v30.FriendFilterPill);
            if v44.props.navigation then
                v44.props.navigation.navigate(v26.FilterByModal, {
                    showFriendPruningAlert = v65 and v44.state.showFriendPruningAlert, 
                    onFewestInteractionsSelection = if v65 then v44.onFewestInteractionsSelection else v41, 
                    friendCount = v44.props.totalFilteredFriends, 
                    inactiveFriendCount = #v44.filterFriends(v44.props.friends, v27.Inactive), 
                    showInactiveFilterOption = v65
                });
            end;
        end;
    end;
    v44.refreshPage = function() --[[ Line: 332 ]]
        -- upvalues: v44 (copy)
        return v44.props.refreshPage({
            errorMessage = v44.props.localizedStrings.pageError
        });
    end;
    v44.generateScrollingElementProps = l_memoize_0(function() --[[ Line: 338 ]]
        -- upvalues: v31 (ref), v44 (copy)
        return {
            size = UDim2.new(1, 0, 1, -v31.TOP_BAR_HEIGHT), 
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(1, 1), 
            Selectable = false, 
            CanvasPosition = v44.props.canvasPositionBinding, 
            onSelectionChanged = v44.props.onSelectionChanged, 
            ScrollingEnabled = v44.props.ScrollingEnabled, 
            paddingHorizontal = if v44.props.safeAreaMargin.X > 0 then v44.props.safeAreaMargin.X else nil
        };
    end);
    v44.openAddFriendsPage = function() --[[ Line: 353 ]]
        -- upvalues: v44 (copy), v30 (ref), v26 (ref)
        v44.props.analytics:buttonClick(v30.AddFriendsNoFriendsEmptyView);
        v44.props.analytics:navigate(v26.AddFriends);
        v44.props.navigation.navigate(v26.AddFriends);
    end;
end;
v42.didMount = function(v66) --[[ Line: 361 ]] --[[ Name: didMount ]]
    v66.props.analytics:pageMountingTimeReport();
end;
v42.didUpdate = function(v67) --[[ Line: 365 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AppStorageService_0 (copy), v38 (copy), v39 (copy)
    local v68 = if game:GetEngineFeature("UniversalAppPruningAlertStorageKey") then l_AppStorageService_0:GetItem("FriendPruningAlertSeen") == "true" else false;
    local v69 = v67.props.devForceFriendPruningUpsellOn or not v68 and (v67.props.totalFriendCount >= v38() and v67.props.totalInactiveFriends >= v39() or v67.props.isLocalUserSoothsayer);
    v67:setState({
        showFriendPruningAlert = v69, 
        showFriendPruningTooltip = v69
    });
end;
v42.render = function(v70) --[[ Line: 387 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), l_RefreshScrollingFrame_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), v37 (copy), v33 (copy), v27 (copy), v41 (copy), l_StyledTextLabel_0 (copy), v35 (copy), l_DefaultMetricsGridView_0 (copy), v36 (copy)
    local l_props_0 = v70.props;
    local l_getItemMetrics_0 = v70.props.getItemMetrics;
    local l_gridHorizontalSpacing_0 = v70.props.gridHorizontalSpacing;
    local l_gridVerticalSpacing_0 = v70.props.gridVerticalSpacing;
    local v75 = l_props_0.totalFriendCount == 0;
    local v76 = false;
    if l_props_0.totalFilteredFriends == 0 then
        v76 = l_props_0.totalFriendCount > 0;
    end;
    local v77 = not v75 and not v76;
    return l_withStyle_0(function(v78) --[[ Line: 398 ]]
        -- upvalues: l_withLocalization_0 (ref), l_Roact_0 (ref), v70 (copy), l_RefreshScrollingFrame_0 (ref), l_VerticalScrollViewWithMargin_0 (ref), v37 (ref), v33 (ref), v27 (ref), v41 (ref), l_StyledTextLabel_0 (ref), v76 (copy), v35 (ref), v77 (copy), l_DefaultMetricsGridView_0 (ref), l_getItemMetrics_0 (copy), l_gridHorizontalSpacing_0 (copy), l_gridVerticalSpacing_0 (copy), v75 (copy), v36 (ref), l_props_0 (copy)
        return l_withLocalization_0({
            inactiveFilterExplanation = "Feature.Friends.Label.FewestInteractionsExplanation"
        })(function(v79) --[[ Line: 401 ]]
            -- upvalues: l_Roact_0 (ref), v70 (ref), l_RefreshScrollingFrame_0 (ref), l_VerticalScrollViewWithMargin_0 (ref), v37 (ref), v33 (ref), v27 (ref), v41 (ref), l_StyledTextLabel_0 (ref), v78 (copy), v76 (ref), v35 (ref), v77 (ref), l_DefaultMetricsGridView_0 (ref), l_getItemMetrics_0 (ref), l_gridHorizontalSpacing_0 (ref), l_gridVerticalSpacing_0 (ref), v75 (ref), v36 (ref), l_props_0 (ref)
            return l_Roact_0.createFragment({
                page = l_Roact_0.createElement("Frame", {
                    [l_Roact_0.Ref] = v70.props.eventHandlerRef, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v70.props.BackgroundColor, 
                    BackgroundTransparency = v70.props.BackgroundTransparency
                }, {
                    gridFrame = l_Roact_0.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1
                    }, {
                        ScrollView = l_Roact_0.createElement(l_RefreshScrollingFrame_0, {
                            ScrollingElement = l_VerticalScrollViewWithMargin_0, 
                            scrollingElementProps = v70.generateScrollingElementProps(), 
                            refresh = v70.refreshPage
                        }, {
                            layout = l_Roact_0.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Vertical
                            }), 
                            pulldownSpacing = l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 1), 
                                LayoutOrder = 0, 
                                BackgroundTransparency = 1
                            }) or nil, 
                            friendsListHeader = if v70.props.isScrollViewHeaderEnabled then l_Roact_0.createElement(v37, {
                                friendCount = v70.props.totalFilteredFriends, 
                                LayoutOrder = 1
                            }) else nil, 
                            filterByButton = if v70.props.isFilterByButtonDisabled then nil else l_Roact_0.createElement(v33, {
                                analytics = v70.props.analytics, 
                                filter = v70.props.filter, 
                                friendCount = v70.props.totalFilteredFriends, 
                                inactiveFriendCount = #v70.filterFriends(v70.props.friends, v27.Inactive), 
                                isDisabled = v70.props.totalFriendCount == 0, 
                                layoutOrder = 2, 
                                onActivated = v70.filterButtonOnActivated(v70.props.friendPruningEnabled), 
                                showFriendPruningAlert = v70.props.friendPruningEnabled and v70.state.showFriendPruningAlert, 
                                initialShowFriendPruningTooltip = v70.props.friendPruningEnabled and v70.state.showFriendPruningTooltip, 
                                onTooltipDismissal = if v70.props.friendPruningEnabled then v70.onTooltipDismissal else v41
                            }), 
                            inactiveFilterExplanationTopPadding = if v70.props.friendPruningEnabled and v70.props.filter == v27.Inactive then l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 4), 
                                LayoutOrder = 3, 
                                BackgroundTransparency = 1
                            }) else nil, 
                            inactiveFilterExplanation = if v70.props.friendPruningEnabled and v70.props.filter == v27.Inactive then l_Roact_0.createElement(l_StyledTextLabel_0, {
                                automaticSize = Enum.AutomaticSize.Y, 
                                size = UDim2.fromScale(1, 0), 
                                text = v79.inactiveFilterExplanation, 
                                fontStyle = v78.Font.CaptionBody, 
                                colorStyle = v78.Theme.TextDefault, 
                                textXAlignment = Enum.TextXAlignment.Left, 
                                textYAlignment = Enum.TextYAlignment.Top, 
                                lineHeight = 1, 
                                layoutOrder = 4
                            }) else nil, 
                            inactiveFilterExplanationBottomPadding = if v70.props.friendPruningEnabled and v70.props.filter == v27.Inactive then l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                LayoutOrder = 5, 
                                BackgroundTransparency = 1
                            }) else nil, 
                            NoResultsView = if v76 then l_Roact_0.createElement(v35, {
                                layoutOrder = 6
                            }) else nil, 
                            FriendsGridView = if v77 then l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
                                getItemHeight = v70.getItemHeight, 
                                items = v70.props.friends, 
                                getItemMetrics = l_getItemMetrics_0, 
                                renderItem = v70.renderItem, 
                                itemPadding = Vector2.new(l_gridHorizontalSpacing_0, l_gridVerticalSpacing_0), 
                                maxHeight = 1e999, 
                                defaultChildIndex = 1, 
                                LayoutOrder = 6
                            }) else nil, 
                            NoFriendsView = if v75 then l_Roact_0.createElement(v36, {
                                layoutOrder = 6, 
                                pageLoadingTimeReport = v70.pageLoadingTimeReport, 
                                openAddFriendsPage = v70.openAddFriendsPage
                            }) else nil, 
                            showMoreContainer = v70.props.renderShowMore(7), 
                            BottomWhitespace = if l_props_0.hasBottomWhitespace then l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 3000), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1000
                            }) else nil
                        })
                    })
                })
            });
        end);
    end);
end;
return function(v80) --[[ Line: 526 ]] --[[ Name: FriendsLandingPageContainer ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useFocusGuiObject_0 (copy), l_UiMode_0 (copy), v14 (copy), v26 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_FFlagCalculateFriendsTileSize_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_Roact_0 (copy), v42 (copy), v8 (copy)
    local v81 = l_useDesignTokens_0();
    local v82 = l_useUiModeInfo_0();
    local v83 = l_useFocusGuiObject_0();
    local v84 = v82.uiMode == l_UiMode_0.TenFoot;
    if not v84 then
        v83 = nil;
    end;
    local v86 = v14.onRelease(function(v85) --[[ Line: 538 ]]
        -- upvalues: v80 (copy), v26 (ref)
        v85:cancel();
        v80.navigateToLuaAppPages[v26.SearchPage]();
    end);
    local v87 = v13.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v86);
    local v88 = nil;
    if l_FFlagCalculateFriendsTileSize_0 then
        v88 = if v84 then v81.Global.Space_800 else v81.Global.Space_1000;
    end;
    local l_ScrollAnimationConfig_0 = v81.LuaApps.App.Page.ScrollAnimationConfig;
    local v90, v91 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v81.Global.Space_1000, l_ScrollAnimationConfig_0);
    return l_Roact_0.createElement(v42, v8.Dictionary.join({
        BackgroundColor = v81.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v81.LuaApps.App.Page.BackgroundTransparency, 
        isFilterByButtonDisabled = v84, 
        isScrollViewHeaderEnabled = v84, 
        eventHandlerRef = v87, 
        isPlayerContextualMenuEnabled = v84, 
        focusGuiObject = v83, 
        tileHeightOffset = v88, 
        canvasPositionBinding = v90, 
        onSelectionChanged = v91, 
        ScrollingEnabled = not v84, 
        hasBottomWhitespace = v84 and v80.totalFriendCount ~= 0, 
        safeAreaMargin = v81.LuaApps.App.Page.SafeAreaMargin
    }, v80));
end;