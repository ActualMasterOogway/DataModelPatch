local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local l_searchFilterPredicate_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.searchFilterPredicate;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v8 = require(script.Parent.ConversationList);
local v9 = require(l_script_FirstAncestor_0.LegacyAnalytics.withAnalytics);
local v10 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v11 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v12 = v3.PureComponent:extend("ConversationListWithTopBar");
v12.defaultProps = {
    filterText = nil, 
    isDebugEnabled = false, 
    itemList = {}, 
    navigateToSquadLobby = function() --[[ Line: 24 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    topBarHeight = 0, 
    entryHeight = 64
};
v12.getDerivedStateFromProps = function(v13) --[[ Line: 29 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v2 (copy), l_searchFilterPredicate_0 (copy)
    local l_filterText_0 = v13.filterText;
    local l_itemList_0 = v13.itemList;
    return {
        filteredItemList = v2.List.filterMap(l_itemList_0, function(v16) --[[ Line: 34 ]]
            -- upvalues: l_searchFilterPredicate_0 (ref), l_filterText_0 (copy)
            local l_title_0 = v16.title;
            if l_searchFilterPredicate_0(l_filterText_0, l_title_0) then
                return v16;
            else
                return nil;
            end;
        end)
    };
end;
v12.init = function(v18) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_RoactPaginator_0 (copy), v2 (copy), v11 (copy)
    v18.showErrorToast = function(v19) --[[ Line: 47 ]]
        -- upvalues: v18 (copy)
        v18.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v19
                }
            }
        });
    end;
    v18.reportAnalytics = function(v20) --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        if not v18.props.conversationsIsFetching and not v18.props.oldestConversationIsFetched then
            v20:userFetchedOlderConversations(v18.props.localUserId);
        end;
    end;
    v18.loadNext = l_memoize_0(function(v21) --[[ Line: 63 ]]
        -- upvalues: v18 (copy), l_RoactPaginator_0 (ref)
        return function(v22) --[[ Line: 64 ]]
            -- upvalues: v18 (ref), l_RoactPaginator_0 (ref), v21 (copy)
            if v18.props[l_RoactPaginator_0.loadNext] then
                v18.reportAnalytics(v21);
                v18.props[l_RoactPaginator_0.loadNext](v22);
            end;
        end;
    end);
    v18.isFiltered = v18.props.filterText and v18.props.filterText:match("%S");
    v18.indexOfList = l_memoize_0(function(v23, v24) --[[ Line: 75 ]]
        -- upvalues: v2 (ref)
        local v26 = table.find(v2.List.map(v23, function(v25) --[[ Line: 77 ]]
            return v25.id;
        end), v24);
        if v26 then
            return v26;
        else
            return 0;
        end;
    end);
    v18.fireClickEvent = function(v27, v28) --[[ Line: 88 ]]
        -- upvalues: v11 (ref), v18 (copy)
        if v28 then
            local l_id_0 = v27.id;
            v28.fireAnalyticsEvent(v11.ChatLandingConversationClicked, {
                isFiltered = v18.isFiltered ~= nil, 
                conversationListCount = #v18.state.filteredItemList, 
                selectedConversationId = l_id_0, 
                selectedIndex = v18.indexOfList(v18.state.filteredItemList, l_id_0), 
                hasUnreadMessages = v27.hasUnreadMessages, 
                selectedConversationModerationType = if v27 then v27.moderationType else nil, 
                selectedConversationUserPendingStatus = if v27 then v27.userPendingStatus else nil
            });
        end;
    end;
    v18.onActivated = l_memoize_0(function(_, v31) --[[ Line: 103 ]]
        -- upvalues: v18 (copy)
        return function(v32) --[[ Line: 104 ]]
            -- upvalues: v18 (ref), v31 (copy)
            v18.props.navigateToConversation(v32.id);
            v18.fireClickEvent(v32, v31);
        end;
    end);
end;
v12.render = function(v33) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v9 (copy), l_withLocalization_0 (copy), v3 (copy), v8 (copy)
    return v10(function(v34) --[[ Line: 113 ]]
        -- upvalues: v9 (ref), l_withLocalization_0 (ref), v33 (copy), v3 (ref), v8 (ref)
        return v9(function(v35) --[[ Line: 114 ]]
            -- upvalues: l_withLocalization_0 (ref), v33 (ref), v3 (ref), v8 (ref), v34 (copy)
            return l_withLocalization_0({
                somethingWrongText = "Feature.Toast.NetworkingError.SomethingIsWrong"
            })(function(v36) --[[ Line: 117 ]]
                -- upvalues: v33 (ref), v3 (ref), v8 (ref), v35 (copy), v34 (ref)
                local v37 = v33.props.filterText and v33.props.filterText:match("%S");
                local v38 = v3.createElement(v8, {
                    Size = UDim2.fromScale(1, 1), 
                    itemList = v37 and v33.state.filteredItemList or v33.props.itemList, 
                    loadNext = v33.loadNext(v35), 
                    isDebugEnabled = v33.props.isDebugEnabled, 
                    filterText = v33.props.filterText, 
                    onActivated = v33.onActivated(v36, v34), 
                    entryHeight = v33.props.entryHeight, 
                    navigateToSquadLobby = v33.props.navigateToSquadLobby, 
                    isInExperience = v33.props.isInExperience, 
                    shouldShowPhoneVerificationUpsell = v33.props.shouldShowPhoneVerificationUpsell, 
                    shouldShowUnfilteredAccessFtux = v33.props.shouldShowUnfilteredAccessFtux, 
                    shouldShowPartyUpsellFtux = v33.props.shouldShowPartyUpsellFtux, 
                    dismissUnfilteredThreadsFtux = v33.props.dismissUnfilteredThreadsFtux, 
                    showGroupsLink = v33.props.showGroupsLink
                });
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    conversationList = v38
                });
            end);
        end);
    end);
end;
v12.didMount = function(v39) --[[ Line: 148 ]] --[[ Name: didMount ]]
    v39.isMounted = true;
end;
v12.willUnmount = function(v40) --[[ Line: 152 ]] --[[ Name: willUnmount ]]
    v40.isMounted = false;
end;
return v12;