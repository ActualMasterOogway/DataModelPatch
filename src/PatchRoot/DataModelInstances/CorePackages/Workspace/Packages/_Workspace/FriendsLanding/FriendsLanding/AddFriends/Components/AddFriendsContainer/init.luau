local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_script_FirstAncestor_0.AddFriends.Analytics);
local l_setupFireEvent_0 = v3.setupFireEvent;
local l_AnalyticsSetup_0 = v3.AnalyticsSetup;
local l_EventNames_0 = v3.EventNames;
local l_Namespaces_0 = v3.Namespaces;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v9 = require(l_AddFriends_0.dependencies);
local l_SocialLibraries_0 = v9.SocialLibraries;
local l_SocialCommon_0 = v9.SocialCommon;
local l_Promise_0 = v9.Promise;
local l_Roact_0 = v9.Roact;
local l_RoactRodux_0 = v9.RoactRodux;
local l_RoactAppExperiment_0 = v9.RoactAppExperiment;
local l_UIBlox_0 = v9.UIBlox;
local l_FormFactor_0 = v9.FormFactor;
local l_Dash_0 = v9.Dash;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v21 = require(l_script_FirstAncestor_0.EnumScreens);
local v22 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v23 = require(script.Parent.AddFriendsPage);
local v24 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v25 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v26 = require(script.mapStateToProps);
local v27 = require(script.mapDispatchToProps);
local l_AddFriendsPageLoadAnalytics_0 = v24.AddFriendsPageLoadAnalytics;
local l_AddFriendsSearchbarPressedEvent_0 = v24.AddFriendsSearchbarPressedEvent;
local v30 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local v31 = require(l_AddFriends_0.Utils.contactImporterTooltip);
local v32 = require(l_AddFriends_0.Utils.getShowNewAddFriendsPageVariant);
local l_SocialLuaAnalytics_0 = v9.SocialLuaAnalytics;
local l_Contexts_0 = l_SocialLuaAnalytics_0.Analytics.Enums.Contexts;
local l_EntityTypes_0 = l_SocialLuaAnalytics_0.Analytics.Enums.EntityTypes;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_reportPromiseLoadingTimeWrapper_0 = l_SocialLuaAnalytics_0.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_DefaultAnalyticsService_0 = l_SocialLuaAnalytics_0.Analytics.DefaultAnalyticsService;
local _ = require(l_Parent_0.PlayerContextualMenu);
local _ = require(script.Parent.AddFriendsTile.getFriendRequestHandlersExtraProps);
local l_getFStringSocialFriendsLayer_0 = v9.getFStringSocialFriendsLayer;
local l_FFlagFixContactRecsFriendRequestLogging_0 = require(l_Parent_0.SharedFlags).FFlagFixContactRecsFriendRequestLogging;
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local v45 = l_Roact_0.PureComponent:extend("AddFriendsContainer");
v45.init = function(v46) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_AnalyticsSetup_0 (copy), l_setupFireEvent_0 (copy), l_DefaultAnalyticsService_0 (copy), v21 (copy), l_EventNames_0 (copy), l_AddFriendsPageLoadAnalytics_0 (copy), l_Dash_0 (copy), l_Promise_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v31 (copy), l_AppStorageService_0 (copy), l_EntityTypes_0 (copy), l_Namespaces_0 (copy), v22 (copy), l_Contexts_0 (copy), l_Images_0 (copy), l_FFlagFixContactRecsFriendRequestLogging_0 (copy), l_ContextualInfoTypes_0 (copy), v30 (copy), l_AddFriendsSearchbarPressedEvent_0 (copy), l_FormFactor_0 (copy)
    v46.state = {
        visibleRows = 6
    };
    v46.fireAnalyticsEvent = if l_FFlagAddFriendsMigrateAnalytics_0 then l_AnalyticsSetup_0({
        infoForAllEvents = {
            uid = v46.props.localUserId, 
            recommendationSessionId = v46.props.friendRecommendationsSessionId
        }
    }).fireAnalyticsEvent else l_setupFireEvent_0({
        infoForAllEvents = {
            uid = v46.props.localUserId, 
            recommendationSessionId = v46.props.friendRecommendationsSessionId
        }, 
        analytics = {
            Diag = v46.props.diagService, 
            EventStream = v46.props.eventIngestService, 
            Telemetry = l_DefaultAnalyticsService_0.Telemetry
        }
    });
    v46.getLimitPerPage = function() --[[ Line: 90 ]]
        -- upvalues: v46 (copy)
        if v46.props.wideMode then
            return 50;
        else
            return 25;
        end;
    end;
    v46.showToast = function(v47) --[[ Line: 94 ]]
        -- upvalues: v46 (copy), v21 (ref)
        if not v47 then
            return;
        else
            v46.props.navigation.navigate(v21.GenericToast, {
                toastProps = {
                    toastContent = v47
                }
            });
            return;
        end;
    end;
    v46.fireAddFriendsPageLoadEvents = function(_, v49, v50) --[[ Line: 106 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref), l_AddFriendsPageLoadAnalytics_0 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_Dash_0 (ref)
        v46.fireAnalyticsEvent(l_EventNames_0.AddFriendsPageLoadingTime, {
            status = v49.status, 
            loadingTime = v50, 
            statValue = v50
        });
        local v51 = v49.result and v49.result[2];
        local v52 = l_AddFriendsPageLoadAnalytics_0(v51);
        local v53 = nil;
        if v46.props.shouldShowPYMKSection then
            local v54 = if v46.props.shouldShowPYMKSection then v49.result[3] else nil;
            local l_data_0 = v54.responseBody.data;
            v53 = l_data_0 and #l_data_0 or 0;
            if not l_FFlagAddFriendsMigrateAnalytics_0 then
                v46.fireAnalyticsEvent(l_EventNames_0.PageLoad, l_Dash_0.join(v52, {
                    recommendationSessionId = v54.responseBody.recommendationRequestId, 
                    recommendationCount = v53, 
                    status = v49.status
                }));
            end;
        elseif not l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.PageLoad, l_Dash_0.join(v52, {
                status = v49.status
            }));
        end;
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.PageLoad, {
                recommendationCount = v53, 
                status = v49.status
            });
        end;
    end;
    local function _(v56, v57) --[[ Line: 150 ]]
        -- upvalues: v46 (copy)
        return function(...) --[[ Line: 151 ]]
            -- upvalues: v56 (copy), v46 (ref), v57 (copy)
            return v56(...):andThen(function() --[[ Line: 153 ]]
                -- upvalues: v46 (ref), v57 (ref)
                v46.showToast(v57);
            end):catch(function() --[[ Line: 156 ]]
                -- upvalues: v46 (ref)
                v46.showToast({
                    toastTitle = v46.props.localized.networkErrorText
                });
            end);
        end;
    end;
    local v59 = l_reportPromiseLoadingTimeWrapper_0(function() --[[ Line: 162 ]]
        -- upvalues: l_Promise_0 (ref), v46 (copy)
        return l_Promise_0.all({
            v46.props.getFriendRequestsCount(v46.props.localUserId), 
            v46.props.getFriendRequests({
                isRefresh = true, 
                localUserId = v46.props.localUserId, 
                limit = v46.getLimitPerPage()
            }), 
            if v46.props.shouldShowPYMKSection then v46.props.getFriendRecommendations({
                localUserId = v46.props.localUserId
            }) else nil
        });
    end, function() --[[ Line: 176 ]]
        return {
            fetch = "add_friends_page_load"
        };
    end, {
        fireEvent = v46.fireAddFriendsPageLoadEvents
    })();
    local function v64() --[[ Line: 180 ]]
        -- upvalues: v59 (copy), v46 (copy), l_Promise_0 (ref)
        return v59:andThen(function(v60) --[[ Line: 181 ]]
            -- upvalues: v46 (ref), l_Promise_0 (ref)
            local v61 = if v46.props.shouldShowPYMKSection then v60[3] else nil;
            if v46.props.shouldShowPYMKSection then
                local l_data_1 = v61.responseBody.data;
                local v63 = l_data_1 and #l_data_1 or 0;
                v46:setState({
                    visibleRows = if v63 > 0 then v46.props.initialRequestsRows else 6
                });
            else
                v46:setState({
                    visibleRows = 6
                });
            end;
            return l_Promise_0.resolve(v60);
        end);
    end;
    local v65 = nil;
    local l_v64_0 = v64 --[[ copy: 5 -> 7 ]];
    local l_v65_0 = v65 --[[ copy: 6 -> 8 ]];
    v46.refreshPage = function(...) --[[ Line: 151 ]]
        -- upvalues: l_v64_0 (copy), v46 (copy), l_v65_0 (copy)
        return l_v64_0(...):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v46 (ref), l_v65_0 (ref)
            v46.showToast(l_v65_0);
        end):catch(function() --[[ Line: 156 ]]
            -- upvalues: v46 (ref)
            v46.showToast({
                toastTitle = v46.props.localized.networkErrorText
            });
        end);
    end;
    v46.contactImporterWarningSeen = function() --[[ Line: 202 ]]
        -- upvalues: v31 (ref), l_AppStorageService_0 (ref)
        v31.updateKey(l_AppStorageService_0, true);
    end;
    v64 = function(_, v69, v70) --[[ Line: 206 ]]
        -- upvalues: v46 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_EventNames_0 (ref), l_EntityTypes_0 (ref), l_Namespaces_0 (ref), v22 (ref), l_Dash_0 (ref), l_Contexts_0 (ref)
        v46.contactImporterWarningSeen();
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            local v71 = v70 or {};
            v46.fireAnalyticsEvent(l_EventNames_0.AcceptFriendshipBtnClick, {
                targetUserId = v69, 
                absolutePosition = v71.absolutePosition, 
                rank = v71.recommendationRank, 
                contextType = v71.contextualInfoType, 
                entityType = if v71.isContact then l_EntityTypes_0.Contact else nil, 
                namespace = if v71.isRecommendation then l_Namespaces_0.PYMK else l_Namespaces_0.FriendRequests
            });
        else
            v46.props.analytics:buttonClick(v22.AcceptFriendship, l_Dash_0.join(v70, {
                targetUserId = v69, 
                contextOverride = l_Contexts_0.AddFriends, 
                recommendationSessionId = v46.props.friendRecommendationsSessionId
            }));
        end;
        return v46.props.acceptFriendRequest({
            currentUserId = v46.props.localUserId, 
            targetUserId = v69
        }):andThen(function() --[[ Line: 235 ]]
            -- upvalues: v46 (ref)
            v46.props.getFriendRequestsCount(v46.props.localUserId);
        end);
    end;
    v65 = {
        toastTitle = v46.props.localized.friendAddedText, 
        iconImage = l_Images_0["icons/actions/friends/friendAdd"]
    };
    local l_v64_1 = v64 --[[ copy: 5 -> 9 ]];
    local l_v65_1 = v65 --[[ copy: 6 -> 10 ]];
    v46.handleAcceptFriendRequest = function(...) --[[ Line: 151 ]]
        -- upvalues: l_v64_1 (copy), v46 (copy), l_v65_1 (copy)
        return l_v64_1(...):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v46 (ref), l_v65_1 (ref)
            v46.showToast(l_v65_1);
        end):catch(function() --[[ Line: 156 ]]
            -- upvalues: v46 (ref)
            v46.showToast({
                toastTitle = v46.props.localized.networkErrorText
            });
        end);
    end;
    v64 = function(_, v75, v76) --[[ Line: 240 ]]
        -- upvalues: v46 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_EventNames_0 (ref), l_EntityTypes_0 (ref), l_Namespaces_0 (ref), v22 (ref), l_Dash_0 (ref), l_Contexts_0 (ref)
        v46.contactImporterWarningSeen();
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            local v77 = v76 or {};
            v46.fireAnalyticsEvent(l_EventNames_0.DeclineFriendshipBtnClick, {
                targetUserId = v75, 
                absolutePosition = v77.absolutePosition, 
                contextType = v77.contextualInfoType, 
                entityType = if v77.isContact then l_EntityTypes_0.Contact else nil, 
                namespace = if v77.isRecommendation then l_Namespaces_0.PYMK else l_Namespaces_0.FriendRequests
            });
        else
            v46.props.analytics:buttonClick(v22.DeclineFriendship, l_Dash_0.join(v76, {
                targetUserId = v75, 
                contextOverride = l_Contexts_0.AddFriends
            }));
        end;
        return v46.props.declineFriendRequest({
            currentUserId = v46.props.localUserId, 
            targetUserId = v75
        }):andThen(function() --[[ Line: 267 ]]
            -- upvalues: v46 (ref)
            v46.props.getFriendRequestsCount(v46.props.localUserId);
        end);
    end;
    v65 = {
        toastTitle = v46.props.localized.requestIgnoredText, 
        iconImage = l_Images_0["icons/actions/reject"]
    };
    local l_v64_2 = v64 --[[ copy: 5 -> 11 ]];
    local l_v65_2 = v65 --[[ copy: 6 -> 12 ]];
    v46.handleDeclineFriendRequest = function(...) --[[ Line: 151 ]]
        -- upvalues: l_v64_2 (copy), v46 (copy), l_v65_2 (copy)
        return l_v64_2(...):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v46 (ref), l_v65_2 (ref)
            v46.showToast(l_v65_2);
        end):catch(function() --[[ Line: 156 ]]
            -- upvalues: v46 (ref)
            v46.showToast({
                toastTitle = v46.props.localized.networkErrorText
            });
        end);
    end;
    v46.handleIgnoreAllFriendsRequests = function() --[[ Line: 275 ]]
        -- upvalues: v46 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_EventNames_0 (ref), v22 (ref), l_Images_0 (ref)
        v46.contactImporterWarningSeen();
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.IgnoreAllBtnClick);
        else
            v46.props.analytics:buttonClick(v22.IgnoreAllButton, {
                contextOverride = "friendRequestsPage"
            });
        end;
        return v46.props.ignoreAllFriendsRequests({
            currentUserId = v46.props.localUserId
        }):andThen(function(v80) --[[ Line: 290 ]]
            -- upvalues: v46 (ref), l_Images_0 (ref)
            v46.props.getFriendRequestsCount(v46.props.localUserId);
            v46.showToast({
                toastTitle = if v80 and v80.responseBody and v80.responseBody.backgrounded then v46.props.localized.allRequestsIgnoredBackgroundedText else v46.props.localized.allRequestsIgnoredText, 
                iconImage = l_Images_0["icons/actions/reject"]
            });
        end);
    end;
    v64 = function(_, v82, v83, v84) --[[ Line: 304 ]]
        -- upvalues: v46 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_EventNames_0 (ref), l_EntityTypes_0 (ref), l_Namespaces_0 (ref), v22 (ref), l_Dash_0 (ref), l_FFlagFixContactRecsFriendRequestLogging_0 (ref), l_ContextualInfoTypes_0 (ref), l_Contexts_0 (ref)
        v46.contactImporterWarningSeen();
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            local v85 = v84 or {};
            v46.fireAnalyticsEvent(l_EventNames_0.RequestFriendshipBtnClick, {
                targetUserId = v82, 
                absolutePosition = v85.absolutePosition, 
                contextType = v85.contextualInfoType, 
                rank = v85.recommendationRank, 
                entityType = if v85.isContact then l_EntityTypes_0.Contact else nil, 
                namespace = if v85.isRecommendation then l_Namespaces_0.PYMK else l_Namespaces_0.FriendRequests
            });
        else
            v46.props.analytics:buttonClick(v22.RequestFriendship, l_Dash_0.join(v84, {
                targetUserId = v82, 
                contactId = if l_FFlagFixContactRecsFriendRequestLogging_0 and v84 and v84.contextType == l_ContextualInfoTypes_0.Contacts then v82 else nil, 
                contextOverride = l_Contexts_0.AddFriends, 
                recommendationSessionId = v46.props.friendRecommendationsSessionId
            }));
        end;
        return v46.props.requestFriendship({
            currentUserId = v46.props.localUserId, 
            targetUserId = v82, 
            friendshipOriginSourceType = v83, 
            isContact = if l_FFlagAddFriendsMigrateAnalytics_0 then v84 and v84.isContact else nil, 
            contextType = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else if v84 then v84.contextType else nil, 
            contactId = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else if v84 and v84.contextType == l_ContextualInfoTypes_0.Contacts then v82 else nil
        }):andThen(function() --[[ Line: 348 ]]
            -- upvalues: v46 (ref)
            v46.props.getFriendRequestsCount(v46.props.localUserId);
        end);
    end;
    v65 = {
        toastTitle = v46.props.localized.requestSentText, 
        iconImage = l_Images_0["icons/actions/friends/friendAdd"]
    };
    local l_v64_3 = v64 --[[ copy: 5 -> 13 ]];
    local l_v65_3 = v65 --[[ copy: 6 -> 14 ]];
    v46.handleRequestFriendship = function(...) --[[ Line: 151 ]]
        -- upvalues: l_v64_3 (copy), v46 (copy), l_v65_3 (copy)
        return l_v64_3(...):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v46 (ref), l_v65_3 (ref)
            v46.showToast(l_v65_3);
        end):catch(function() --[[ Line: 156 ]]
            -- upvalues: v46 (ref)
            v46.showToast({
                toastTitle = v46.props.localized.networkErrorText
            });
        end);
    end;
    v46.getNextVisibleRows = function(v88, v89, v90) --[[ Line: 358 ]]
        -- upvalues: v46 (copy)
        v46.contactImporterWarningSeen();
        local l_friendRequests_0 = v89.friendRequests;
        local l_receivedCount_0 = v89.receivedCount;
        local l_visibleRows_0 = v88.visibleRows;
        local v94 = #l_friendRequests_0;
        local v95 = math.min(l_receivedCount_0, v90 * (l_visibleRows_0 + 6));
        local v96 = math.ceil(v95 / v90);
        if v95 <= v94 then
            return {
                visibleRows = v96
            };
        else
            return nil;
        end;
    end;
    v64 = function(v97, v98) --[[ Line: 378 ]]
        -- upvalues: v46 (copy)
        return v46.props.getFriendRequests({
            limit = v46.getLimitPerPage(), 
            cursor = v97
        }):andThen(function() --[[ Line: 384 ]]
            -- upvalues: v46 (ref), v98 (copy)
            v46:setState(function(v99, v100) --[[ Line: 385 ]]
                -- upvalues: v46 (ref), v98 (ref)
                return v46.getNextVisibleRows(v99, v100, v98) or {
                    visibleRows = math.ceil(#v100.friendRequests / v98)
                };
            end);
        end, function() --[[ Line: 393 ]]
            -- upvalues: v46 (ref), v98 (copy)
            v46:setState(function(_, v102) --[[ Line: 394 ]]
                -- upvalues: v98 (ref)
                return {
                    visibleRows = math.ceil(#v102.friendRequests / v98)
                };
            end);
        end);
    end;
    v65 = nil;
    v46.handleGetFriendRequests = function(...) --[[ Line: 151 ]]
        -- upvalues: v64 (copy), v46 (copy), v65 (copy)
        return v64(...):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v46 (ref), v65 (ref)
            v46.showToast(v65);
        end):catch(function() --[[ Line: 156 ]]
            -- upvalues: v46 (ref)
            v46.showToast({
                toastTitle = v46.props.localized.networkErrorText
            });
        end);
    end;
    v46.handleLoadMoreRequests = function(v103) --[[ Line: 402 ]]
        -- upvalues: v46 (copy)
        v46.contactImporterWarningSeen();
        v46:setState(function(v104, v105) --[[ Line: 405 ]]
            -- upvalues: v46 (ref), v103 (copy)
            local v106 = v46.getNextVisibleRows(v104, v105, v103);
            if v106 then
                return v106;
            else
                if v105.nextPageCursor then
                    v46.handleGetFriendRequests(v105.nextPageCursor, v103);
                end;
                return nil;
            end;
        end);
    end;
    v46.fireOnShowMore = l_FFlagAddFriendsMigrateAnalytics_0 and function(v107) --[[ Line: 419 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref), l_Namespaces_0 (ref)
        v46.fireAnalyticsEvent(l_EventNames_0.ShowMoreBtnClick, {
            namespace = if v107 == l_Namespaces_0.FriendRequests then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK
        });
    end or nil;
    v46.openPlayerContextualMenu = function(v108) --[[ Line: 428 ]]
        -- upvalues: v46 (copy)
        v46.props.openPlayerContextualMenu(v108);
    end;
    v46.handleNavigateDownToViewUserProfile = function(v109, v110) --[[ Line: 432 ]]
        -- upvalues: v46 (copy), v21 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_EventNames_0 (ref), l_EntityTypes_0 (ref), l_Namespaces_0 (ref), l_Dash_0 (ref), v22 (ref)
        v46.contactImporterWarningSeen();
        local l_navigateToLuaAppPages_0 = v46.props.navigateToLuaAppPages;
        if l_navigateToLuaAppPages_0 and l_navigateToLuaAppPages_0[v21.ViewUserProfile] then
            local v112 = v110 and v110.profilePeekViewProps or {};
            v112.recommendationSessionId = v46.props.friendRecommendationsSessionId;
            if l_FFlagAddFriendsMigrateAnalytics_0 then
                v46.fireAnalyticsEvent(l_EventNames_0.PlayerTileClick, {
                    targetUserId = v109, 
                    absolutePosition = v112.absolutePosition, 
                    rank = v112.rank, 
                    contextType = v112.contextualInfoType, 
                    entityType = if v112.isContact then l_EntityTypes_0.Contact else nil, 
                    friendStatus = v112.friendStatus, 
                    namespace = if v112.isRecommendation then l_Namespaces_0.PYMK else l_Namespaces_0.FriendRequests
                });
            else
                local v113 = l_Dash_0.join(v112, {
                    contextOverride = "friendRequestsPage", 
                    subPage = "peekView", 
                    page = "playerProfile", 
                    targetUserId = v109, 
                    contextualInfoDisplay = l_Dash_0.None, 
                    source = l_Dash_0.None
                });
                v46.props.analytics:buttonClick(v22.PlayerTile, v113);
                v46.props.analytics:navigate("ViewUserProfileAddFriends");
            end;
            l_navigateToLuaAppPages_0[v21.ViewUserProfile](v109, {
                profilePeekViewProps = v112
            });
        end;
    end;
    v46.handleOpenLearnMore = function() --[[ Line: 470 ]]
        -- upvalues: v46 (copy), v21 (ref)
        v46.contactImporterWarningSeen();
        local l_navigateToLuaAppPages_1 = v46.props.navigateToLuaAppPages;
        if l_navigateToLuaAppPages_1 then
            l_navigateToLuaAppPages_1[v21.LearnMore]();
        end;
    end;
    v46.handleOpenPhoneVerificationLinkWebview = function(v115) --[[ Line: 479 ]]
        -- upvalues: v46 (copy), v21 (ref)
        local l_navigateToLuaAppPages_2 = v46.props.navigateToLuaAppPages;
        if l_navigateToLuaAppPages_2 then
            l_navigateToLuaAppPages_2[v21.PhoneVerification](v115);
        end;
    end;
    v46.fireContactImporterAnalyticsEvents = function() --[[ Line: 486 ]]
        -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v46 (copy), l_EventNames_0 (ref), v22 (ref), l_Contexts_0 (ref)
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.CIBtnClick);
            return;
        else
            v46.props.analytics:navigate("ConnectWithFriends");
            v46.props.analytics:buttonClick(v22.ConnectWithFriends, {
                contextOverride = l_Contexts_0.AddFriends
            });
            return;
        end;
    end;
    v46.fireContactImporterSeenEvent = function() --[[ Line: 497 ]]
        -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v46 (copy), l_EventNames_0 (ref), v30 (ref)
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.CIBtnImpression);
            return;
        else
            v46.props.analytics:impressionEvent(v30.ContactImporterBannerSeen);
            return;
        end;
    end;
    v46.fireSearchbarPressedEvent = function() --[[ Line: 505 ]]
        -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v46 (copy), l_EventNames_0 (ref), l_AddFriendsSearchbarPressedEvent_0 (ref), l_FormFactor_0 (ref)
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.UserSearchClick);
        else
            l_AddFriendsSearchbarPressedEvent_0(v46.props.analytics, {
                formFactor = v46.props.wideMode and l_FormFactor_0.WIDE or l_FormFactor_0.COMPACT
            });
        end;
        v46.fireAnalyticsEvent(l_EventNames_0.OpenUserSearch);
    end;
    v46.fireProfileQRCodeBannerSeenEvent = function() --[[ Line: 517 ]]
        -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v46 (copy), l_EventNames_0 (ref), v30 (ref)
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.QRCodeBtnImpression);
            return;
        else
            v46.props.analytics:impressionEvent(v30.ProfileQRCodeBannerSeen);
            return;
        end;
    end;
    v46.fireProfileQRCodeBannerPressedEvent = function() --[[ Line: 525 ]]
        -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v46 (copy), l_EventNames_0 (ref), v22 (ref), l_Contexts_0 (ref)
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            v46.fireAnalyticsEvent(l_EventNames_0.QRCodeBtnClick);
            return;
        else
            v46.props.analytics:navigate("ProfileQRCodePage");
            v46.props.analytics:buttonClick(v22.ProfileQRCode, {
                contextOverride = l_Contexts_0.AddFriends
            });
            return;
        end;
    end;
end;
v45.didMount = function(v117) --[[ Line: 537 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnableNewFriendRequestsBadge_0 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_AnalyticsSetup_0 (copy), l_setupFireEvent_0 (copy), l_DefaultAnalyticsService_0 (copy)
    v117.refreshPage();
    if l_FFlagEnableNewFriendRequestsBadge_0 then
        v117.props.clearNewFriendRequests(v117.props.localUserId);
    end;
    v117.fireAnalyticsEvent = if l_FFlagAddFriendsMigrateAnalytics_0 then l_AnalyticsSetup_0({
        infoForAllEvents = {
            uid = v117.props.localUserId, 
            recommendationSessionId = v117.props.friendRecommendationsSessionId
        }
    }).fireAnalyticsEvent else l_setupFireEvent_0({
        infoForAllEvents = {
            uid = v117.props.localUserId, 
            recommendationSessionId = v117.props.friendRecommendationsSessionId
        }, 
        analytics = {
            Diag = v117.props.diagService, 
            EventStream = v117.props.eventIngestService, 
            Telemetry = l_DefaultAnalyticsService_0.Telemetry
        }
    });
end;
v45.didUpdate = function(v118, v119, _) --[[ Line: 562 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_AnalyticsSetup_0 (copy), l_setupFireEvent_0 (copy), l_DefaultAnalyticsService_0 (copy)
    if l_FFlagAddFriendsMigrateAnalytics_0 then
        if v119.friendRecommendationsSessionId ~= v118.props.friendRecommendationsSessionId then
            v118.fireAnalyticsEvent = l_AnalyticsSetup_0({
                infoForAllEvents = {
                    uid = v118.props.localUserId, 
                    recommendationSessionId = v118.props.friendRecommendationsSessionId
                }
            }).fireAnalyticsEvent;
            return;
        end;
    elseif v119.recommendationSessionId ~= v118.props.recommendationSessionId then
        v118.fireAnalyticsEvent = l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v118.props.localUserId, 
                recommendationSessionId = v118.props.friendRecommendationsSessionId
            }, 
            analytics = {
                Diag = v118.props.diagService, 
                EventStream = v118.props.eventIngestService, 
                Telemetry = l_DefaultAnalyticsService_0.Telemetry
            }
        });
    end;
end;
v45.render = function(v121) --[[ Line: 589 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v23 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy)
    local l_contactImporterAndPYMKEnabled_0 = v121.props.contactImporterAndPYMKEnabled;
    local l_addFriendsPageSearchbarEnabled_0 = v121.props.addFriendsPageSearchbarEnabled;
    local l_showNewAddFriendsPageVariant_0 = v121.props.showNewAddFriendsPageVariant;
    local v125 = v121.props.friendRecommendations and #v121.props.friendRecommendations or 0;
    return l_Roact_0.createElement(v23, {
        navigateToLuaAppPages = v121.props.navigateToLuaAppPages, 
        screenSize = v121.props.screenSize, 
        globalGuiInset = v121.props.globalGuiInset, 
        friendRecommendations = v121.props.friendRecommendations, 
        friendRecommendationsCount = v125, 
        friendRecommendationsSessionId = v121.props.friendRecommendationsSessionId, 
        friendRequests = v121.props.friendRequests, 
        friendRequestsCount = v121.props.receivedCount, 
        contactImporterWarningSeen = v121.contactImporterWarningSeen, 
        analytics = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v121.props.analytics, 
        visibleRows = v121.state.visibleRows, 
        amIFollowingUser = v121.props.amIFollowingUser, 
        isUserFollowingMe = v121.props.isUserFollowingMe, 
        getFriendshipRequestSentFromExperience = v121.props.getFriendshipRequestSentFromExperience, 
        handleAcceptFriendRequest = v121.handleAcceptFriendRequest, 
        handleDeclineFriendRequest = v121.handleDeclineFriendRequest, 
        handleIgnoreAllFriendsRequests = v121.handleIgnoreAllFriendsRequests, 
        handleRequestFriendship = v121.handleRequestFriendship, 
        handleLoadMoreRequests = v121.handleLoadMoreRequests, 
        openPlayerContextualMenu = v121.openPlayerContextualMenu, 
        refreshPage = v121.refreshPage, 
        handleNavigateDownToViewUserProfile = v121.handleNavigateDownToViewUserProfile, 
        handleOpenLearnMoreLink = if l_contactImporterAndPYMKEnabled_0 then v121.handleOpenLearnMore else nil, 
        navigation = v121.props.navigation, 
        contactImporterAndPYMKEnabled = l_contactImporterAndPYMKEnabled_0, 
        localUserId = if l_contactImporterAndPYMKEnabled_0 then v121.props.localUserId else nil, 
        shouldShowContactImporterFeature = if l_contactImporterAndPYMKEnabled_0 then v121.props.shouldShowContactImporterFeature else nil, 
        fireContactImporterAnalyticsEvents = v121.fireContactImporterAnalyticsEvents, 
        fireContactImporterSeenEvent = v121.fireContactImporterSeenEvent, 
        shouldShowContactImporterUpsellModal = if l_contactImporterAndPYMKEnabled_0 then v121.props.shouldShowContactImporterUpsellModal else nil, 
        isPhoneVerified = if l_contactImporterAndPYMKEnabled_0 then v121.props.isPhoneVerified else nil, 
        hasOSPermissions = if l_contactImporterAndPYMKEnabled_0 then v121.props.hasOSPermissions else nil, 
        canUploadContacts = if l_contactImporterAndPYMKEnabled_0 then v121.props.canUploadContacts else nil, 
        isDiscoverabilityUnset = v121.props.isDiscoverabilityUnset, 
        getUserSettingsMetadata = v121.props.getUserSettingsMetadata, 
        showTooltip = v121.props.showTooltip, 
        setScreenTopBar = v121.props.setScreenTopBar, 
        addFriendsPageSearchbarEnabled = l_addFriendsPageSearchbarEnabled_0, 
        fireSearchbarPressedEvent = v121.fireSearchbarPressedEvent, 
        openProfilePeekView = v121.props.openProfilePeekView, 
        showNewAddFriendsPageVariant = l_showNewAddFriendsPageVariant_0, 
        fireProfileQRCodeBannerSeenEvent = v121.fireProfileQRCodeBannerSeenEvent, 
        fireProfileQRCodeBannerPressedEvent = v121.fireProfileQRCodeBannerPressedEvent, 
        shouldShowPYMKSection = v121.props.shouldShowPYMKSection, 
        pymkEnabledForConsole = v121.props.pymkEnabledForConsole, 
        fireOnShowMore = if l_FFlagAddFriendsMigrateAnalytics_0 then v121.fireOnShowMore else nil
    });
end;
v45.willUnmount = function(v126) --[[ Line: 650 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableNewFriendRequestsBadge_0 (copy)
    v126.props.getFriendRequestsCount(v126.props.localUserId);
    if l_FFlagEnableNewFriendRequestsBadge_0 then
        v126.props.clearNewFriendRequests(v126.props.localUserId);
    end;
end;
v45 = if l_FFlagAddFriendsMigrateAnalytics_0 then l_compose_0(l_RoactRodux_0.connect(v26, v27), v25.connect(function(v127) --[[ Line: 660 ]]
    return {
        wideMode = v127.wideMode, 
        openPlayerContextualMenu = v127.openPlayerContextualMenu, 
        setScreenTopBar = v127.setScreenTopBar
    };
end))(v45) else l_compose_0(l_RoactRodux_0.connect(v26, v27), v24.connect(function(v128) --[[ Line: 671 ]]
    return {
        analytics = v128
    };
end), v25.connect(function(v129) --[[ Line: 676 ]]
    return {
        wideMode = v129.wideMode, 
        openPlayerContextualMenu = v129.openPlayerContextualMenu, 
        setScreenTopBar = v129.setScreenTopBar
    };
end))(v45);
return (l_compose_0(l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialFriendsLayer_0()
}, function(v130, _) --[[ Line: 688 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v32 (copy)
    local v132 = v130[l_getFStringSocialFriendsLayer_0()] or {};
    return {
        showNewAddFriendsPageVariant = v32(v132)
    };
end))(v45));