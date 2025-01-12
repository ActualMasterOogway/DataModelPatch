local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local l_UIBlox_0 = v1.UIBlox;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v11 = require(l_Parent_0.ReactFocusNavigation);
local v12 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local l_useFocusGuiObject_0 = v1.useFocusGuiObject;
local v20 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v21 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local l_RefreshScrollingFrame_0 = v1.SocialLibraries.Components.RefreshScrollingFrame;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local v24 = require(l_script_FirstAncestor_0.EnumScreens);
local v25 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v26 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v27 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v29 = require(l_script_FirstAncestor_0.Components.FilterByButton);
local v30 = require(l_script_FirstAncestor_0.Components.FriendTile);
local v31 = require(l_script_FirstAncestor_0.Components.EmptyResultsView);
local v32 = require(l_script_FirstAncestor_0.Components.NoFriendsView);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_FFlagCalculateFriendsTileSize_0 = require(l_Parent_0.SharedFlags).FFlagCalculateFriendsTileSize;
local function v36() --[[ Line: 48 ]]

end;
return function(v37) --[[ Line: 100 ]] --[[ Name: FriendsLandingPage ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v20 (copy), v21 (copy), l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useFocusGuiObject_0 (copy), l_UiMode_0 (copy), v12 (copy), v24 (copy), v11 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_FFlagCalculateFriendsTileSize_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_dependencyArray_0 (copy), v26 (copy), v27 (copy), v30 (copy), v36 (copy), v25 (copy), l_GridMetrics_0 (copy), l_useAnimatedScrollToSelection_0 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_RefreshScrollingFrame_0 (copy), v29 (copy), v31 (copy), v32 (copy), l_CollectionGrid_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v38 = l_useLocalization_0({
        pageError = "CommonUI.Messages.Response.PageError", 
        successText = "Feature.Friends.Action.FriendRemoved", 
        errorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friends = "CommonUI.Features.Label.Friends", 
        showMore = "Feature.Avatar.Action.ShowMore"
    });
    local v39 = v3.useContext(v20.Context);
    local v40 = v3.useContext(v21.Context);
    local v41 = l_useNavigation_0();
    local l_navigateToLuaAppPages_0 = v39.navigateToLuaAppPages;
    local v43 = l_useDesignTokens_0();
    local v44 = l_useUiModeInfo_0();
    local v45 = l_useFocusGuiObject_0();
    local v46 = v44.uiMode == l_UiMode_0.TenFoot;
    local v48 = v12.onRelease(function(v47) --[[ Line: 121 ]]
        -- upvalues: l_navigateToLuaAppPages_0 (copy), v24 (ref)
        v47:cancel();
        l_navigateToLuaAppPages_0[v24.SearchPage]();
    end);
    local v49 = v11.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v48);
    local v50 = nil;
    if l_FFlagCalculateFriendsTileSize_0 then
        v50 = if v46 then v43.Global.Space_800 else v43.Global.Space_1000;
    end;
    v3.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v40 (copy)
        v40:pageMountingTimeReport();
    end, {});
    local v52 = v3.useCallback(function(v51) --[[ Line: 142 ]]
        -- upvalues: v39 (copy), l_convertUserPresenceTypeToString_0 (ref)
        return function() --[[ Line: 143 ]]
            -- upvalues: v39 (ref), v51 (copy), l_convertUserPresenceTypeToString_0 (ref)
            v39.openPlayerContextualMenu({
                subjectUserId = v51.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v51.lastLocation, 
                    locationPlaceId = v51.placeId, 
                    locationRootPlaceId = v51.rootPlaceId, 
                    locationUniverseId = v51.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v51.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end, l_dependencyArray_0(v39.openPlayerContextualMenu));
    local v58 = v3.useCallback(function(v53, v54, _, _, _) --[[ Line: 160 ]]
        -- upvalues: v40 (copy), v24 (ref), v26 (ref), v39 (copy), v27 (ref)
        return function() --[[ Line: 161 ]]
            -- upvalues: v40 (ref), v24 (ref), v26 (ref), v53 (copy), v54 (copy), v39 (ref), v27 (ref)
            v40:navigate(v24.ViewUserProfile);
            v40:buttonClick(v26.PlayerTile, {
                friendId = v53, 
                position = v54 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            v39.openProfilePeekView(v53, {
                source = v27.FriendsLandingPageSourceName
            });
        end;
    end, l_dependencyArray_0(v40, v39.openProfilePeekView));
    local function v59() --[[ Line: 176 ]]
        -- upvalues: v40 (copy)
        v40:pageLoadingTimeReport();
    end;
    local v60 = v3.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v41 (copy), v24 (ref), v38 (copy)
        return function() --[[ Line: 181 ]]
            -- upvalues: v41 (ref), v24 (ref), v38 (ref)
            v41.navigate(v24.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v38.errorText
                    }
                }
            });
        end;
    end, l_dependencyArray_0(v41, v38));
    local v63 = v3.useCallback(function(v61, v62) --[[ Line: 191 ]]
        -- upvalues: v3 (ref), v30 (ref), v46 (copy), v52 (copy), v60 (copy), v58 (copy), v59 (copy), v37 (copy), v45 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v62
        }, {
            tile = v3.createElement(v30, {
                user = v61, 
                index = v62, 
                openPlayerProfile = if v46 then if v52 == nil then v60 else v52 else v58, 
                isPlayerContextualMenuEnabled = v46, 
                pageLoadingTimeReport = v59, 
                selected = v62 == v37.selectedItemIndex, 
                focusGuiObject = v45
            })
        }), "FriendTile";
    end, l_dependencyArray_0(v37.selectedItemIndex, v46, v52, v58));
    local v65 = v3.useCallback(function(v64) --[[ Line: 219 ]]
        -- upvalues: l_FFlagCalculateFriendsTileSize_0 (ref), v50 (ref)
        if l_FFlagCalculateFriendsTileSize_0 then
            return v64 + v50;
        else
            return v64 + 80;
        end;
    end, l_dependencyArray_0(v50));
    local v66 = v3.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: v40 (copy), v26 (ref), v41 (copy), v24 (ref), v36 (ref), v37 (copy)
        v40:buttonClick(v26.FriendFilterPill);
        v41.navigate(v24.FilterByModal, {
            onFewestInteractionsSelection = v36, 
            friendCount = v37.totalFriendCount
        });
    end, l_dependencyArray_0(v41, v40));
    local v67 = v3.useCallback(function() --[[ Line: 231 ]]
        -- upvalues: v39 (copy), v38 (copy)
        return v39.refreshPage({
            errorMessage = v38.pageError
        });
    end, l_dependencyArray_0(v39.refreshPage, v38));
    local v68 = v3.useCallback(function() --[[ Line: 237 ]]
        -- upvalues: v40 (copy), v26 (ref), v24 (ref), v41 (copy)
        v40:buttonClick(v26.AddFriendsNoFriendsEmptyView);
        v40:navigate(v24.AddFriends);
        v41.navigate(v24.AddFriends);
    end, l_dependencyArray_0(v40, v41));
    local v69 = v37.friends and #v37.friends or 0;
    local v70 = v37.totalFriendCount or 0;
    local v71 = v70 == 0;
    local v72 = false;
    if v69 == 0 then
        v72 = v70 > 0;
    end;
    local v73 = v37.fetchMoreFriends and not v71 and not v72 and (not v39.filter or v39.filter == v25.All);
    local v74, v75 = v3.useState(true);
    local v76 = v3.useCallback(function() --[[ Line: 254 ]]
        -- upvalues: v37 (copy), v75 (copy)
        v37.fetchMoreFriends();
        v75(false);
    end, {
        v37.fetchMoreFriends
    });
    local v77 = v46 and 24 or 12;
    local v78, v79 = v3.useState(100);
    local v80 = nil;
    local v81 = nil;
    if v46 then
        v80 = v43.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
        v81 = v43.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    else
        v80 = {
            minimumItemsPerRow = 2, 
            minimumItemWidth = 176
        };
        v81 = 12;
    end;
    local v82 = v3.useMemo(function() --[[ Line: 274 ]]
        -- upvalues: l_GridMetrics_0 (ref), v80 (ref)
        return l_GridMetrics_0.makeCustomMetricsGetter(v80);
    end, {
        v80
    });
    local v83 = v3.useMemo(function() --[[ Line: 278 ]]
        -- upvalues: v82 (copy), v78 (copy), v81 (ref)
        return v82(v78, v81);
    end, {
        v82
    });
    local v84 = nil;
    if v37.friends then
        v84 = math.max(math.floor(#v37.friends / v83.itemsPerRow), 1);
    end;
    local v86 = v3.useCallback(function(v85) --[[ Line: 287 ]]
        -- upvalues: v79 (copy)
        v79(v85.X);
    end, {});
    local v87 = v3.useRef({});
    local l_ScrollAnimationConfig_0 = v43.LuaApps.App.Page.ScrollAnimationConfig;
    local v89, v90 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v43.Global.Space_1000, l_ScrollAnimationConfig_0);
    local v91 = nil;
    v91 = if v46 then (v71 or v72) and 8 or 1000 else 8;
    return v3.createElement("Frame", {
        [v4.Ref] = v49, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v43.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v43.LuaApps.App.Page.BackgroundTransparency
    }, {
        HorizontalPageMargin = v3.createElement(l_HorizontalPageMargin_0, {
            Size = UDim2.fromScale(1, 1), 
            backgroundTransparency = 1
        }, {
            scrollView = v3.createElement(l_RefreshScrollingFrame_0, {
                scrollingElementProps = {
                    Size = UDim2.new(1, 0, 1, -v27.TOP_BAR_HEIGHT), 
                    BackgroundTransparency = 1, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasPosition = v89, 
                    [v4.Event.SelectionChanged] = v90
                }, 
                [v4.Ref] = v87, 
                refresh = v67
            }, {
                layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                pulldownSpacing = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1
                }) or nil, 
                filterByButton = if v46 then nil else v3.createElement(v29, {
                    analytics = v40, 
                    filter = v39.filter, 
                    friendCount = if v39.filter == v25.All then v70 else v69, 
                    isDisabled = v70 == 0, 
                    layoutOrder = 2, 
                    onActivated = v66
                }), 
                NoResultsView = if v72 then v3.createElement(v31, {
                    layoutOrder = 6
                }) else nil, 
                NoFriendsView = if v71 then v3.createElement(v32, {
                    layoutOrder = 6, 
                    pageLoadingTimeReport = v59, 
                    openAddFriendsPage = v68
                }) else nil, 
                FriendsGridView = if not not v72 or v71 then nil else v3.createElement(l_CollectionGrid_0, {
                    LayoutOrder = 6, 
                    items = v37.friends, 
                    verticalScrollingFrameRef = v87, 
                    renderItem = v63, 
                    getItemHeight = v65, 
                    numColumns = v83.itemsPerRow, 
                    columnGap = v81, 
                    verticalPadding = v77, 
                    onContainerSizeChanged = v86, 
                    maxNumRows = if v74 then v84 else nil
                }), 
                showMoreFrame = if v73 then v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v27.CTA_BUTTON_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 7
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 2), 
                        PaddingRight = UDim.new(0, 2), 
                        PaddingTop = UDim.new(0, 10)
                    }), 
                    showMoreButton = v3.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        size = UDim2.new(1, 0, 1, 0), 
                        onActivated = v76, 
                        text = v38.showMore
                    })
                }) else nil, 
                additionalPadding = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v91), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8
                })
            })
        })
    });
end;