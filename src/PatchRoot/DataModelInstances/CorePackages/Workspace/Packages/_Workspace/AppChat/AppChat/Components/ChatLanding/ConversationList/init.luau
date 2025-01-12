local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(script.Parent.ConversationEntry);
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.Cryo);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v9 = require(script.Parent.ConversationGroupsEntry);
local v10 = require(script.Parent.UnfilteredThreads.PhoneVerificationUpsellContainer);
local v11 = require(script.Parent.UnfilteredThreads.UnfilteredAccessContainer);
local v12 = require(script.Parent.UnfilteredThreads.JoinPartyUpsellContainer);
local v13 = require(script.Parent.ChatLandingModal.ChatLandingModalContainer);
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupSetting);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v17 = game:DefineFastFlag("AppChatChatLandingInitialFetch", false);
local v18 = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30);
local v19 = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5);
local v20 = require(script.Parent.Logger):new(script.Name);
local v21 = v2.PureComponent:extend("ConversationList");
v21.defaultProps = {
    focusIndex = 1, 
    focusLock = {}, 
    itemList = {}, 
    loadNext = nil, 
    loadPrevious = nil, 
    onActivated = nil, 
    navigateToSquadLobby = function() --[[ Line: 38 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    isDebugEnabled = false, 
    Size = UDim2.fromScale(1, 1), 
    LayoutOrder = 1, 
    onScrollUpdate = function() --[[ Line: 42 ]] --[[ Name: onScrollUpdate ]]

    end, 
    entryHeight = 64, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowUnfilteredAccessFtux = false, 
    shouldShowPartyUpsellFtux = false, 
    dismissUnfilteredThreadsFtux = function() --[[ Line: 47 ]] --[[ Name: dismissUnfilteredThreadsFtux ]]

    end
};
v21.init = function(v22) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v21 (copy), l_default_0 (copy), v16 (copy), v2 (copy), v13 (copy), v10 (copy), v11 (copy), v12 (copy), v9 (copy), v4 (copy)
    v21.ENTRY_HEIGHT = if l_default_0.isEnabled() then v22.props.entryHeight else 64;
    v22.onScrollUpdate = function(v23) --[[ Line: 52 ]]
        -- upvalues: v22 (copy)
        v22.currentAnchor = math.floor(v23.CanvasPosition.Y / 64);
        v22.props.onScrollUpdate(v23);
    end;
    v22.focusLock = v22.props.focusLock;
    v22.identifier = function(v24) --[[ Line: 59 ]]
        if not v24 then
            return nil;
        else
            return v24.id .. tostring(v24.unixTime);
        end;
    end;
    v22.renderItem = function(v25, _) --[[ Line: 67 ]]
        -- upvalues: v16 (ref), v2 (ref), v13 (ref), v10 (ref), v22 (copy), v11 (ref), v12 (ref), l_default_0 (ref), v9 (ref), v4 (ref)
        local l_item_0 = v25.item;
        if v16() then
            if l_item_0.isChatLandingModal then
                return v2.createElement(v13, {});
            end;
        elseif l_item_0.isPhoneVerificationUpsell then
            return v2.createElement(v10, {
                dismissUpsell = v22.props.dismissUnfilteredThreadsFtux
            });
        elseif l_item_0.isUnfilteredAccessFtux then
            return v2.createElement(v11, {
                dismissUpsell = v22.props.dismissUnfilteredThreadsFtux
            });
        elseif l_item_0.isJoinPartyUpsellFtux then
            return v2.createElement(v12, {
                dismissUpsell = v22.props.dismissUnfilteredThreadsFtux
            });
        end;
        if l_default_0.isEnabled() and l_item_0.isGroupLink then
            return v2.createElement(v9, {
                entryHeight = v22.ENTRY_HEIGHT, 
                navigateToGroups = function() --[[ Line: 96 ]] --[[ Name: navigateToGroups ]]

                end, 
                key = "ConversationGroupsEntry"
            });
        else
            return v2.createElement(v4, {
                boldTitle = false, 
                entryHeight = v22.ENTRY_HEIGHT, 
                conversation = l_item_0, 
                onActivated = v22.props.onActivated, 
                onSquadJoinButtonActivated = v22.props.navigateToSquadLobby, 
                key = "ConversationEntry" .. tostring(l_item_0.id)
            }, v22.props.isDebugEnabled and {
                debugCell = v2.createElement("StringValue", {
                    Value = tostring(l_item_0.id)
                })
            });
        end;
    end;
    v22.ref = v2.createRef();
    v22.viewRef = v2.createRef();
    v22.initialFetchesAttempted = 0;
end;
v21.willUpdate = function(v28, v29, _) --[[ Line: 117 ]] --[[ Name: willUpdate ]]
    -- upvalues: v17 (copy), v19 (copy), v18 (copy), v20 (copy)
    if v29.filterText and v29.filterText ~= "" and v29.filterText ~= v28.props.filterText then
        v28.focusLock = v29.filterText;
    elseif v29.itemList[1] and v28.props.itemList[1] and v29.itemList[1].id ~= v28.props.itemList[1].id and v28.currentAnchor == 1 then
        v28.focusLock = {};
    end;
    if v17 and v29.itemList and v28.props.itemList ~= v29.itemList and v28.initialFetchesAttempted < v19 and #v29.itemList < v18 then
        v28.initialFetchesAttempted = v28.initialFetchesAttempted + 1;
        v20:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #v29.itemList, v18, v28.initialFetchesAttempted, v19);
        v28.props.loadNext();
    end;
end;
v21.render = function(v31) --[[ Line: 150 ]] --[[ Name: render ]]
    -- upvalues: l_default_0 (copy), v7 (copy), v16 (copy), v15 (copy), v2 (copy), l_BidirectionalFlatList_0 (copy), v14 (copy), v20 (copy), v6 (copy), l_withStyle_0 (copy)
    local l_itemList_0 = v31.props.itemList;
    local v33 = true;
    if v31.props.filterText ~= "" then
        v33 = v31.props.filterText == nil;
    end;
    local l_showGroupsLink_0 = v31.props.showGroupsLink;
    if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() and v33 and l_showGroupsLink_0 then
        l_itemList_0 = v7.List.join({
            {
                id = "ConversationGroupsEntry", 
                isGroupLink = true
            }
        }, l_itemList_0);
    end;
    if (v16() and true or v31.props.shouldShowPhoneVerificationUpsell or v31.props.shouldShowUnfilteredAccessFtux or v31.props.shouldShowPartyUpsellFtux) and v33 then
        l_itemList_0 = v7.List.join({
            {
                id = "UnfilteredThreadsFtux", 
                isChatLandingModal = v16() and true or nil, 
                isPhoneVerificationUpsell = if v16() then nil else v31.props.shouldShowPhoneVerificationUpsell, 
                isUnfilteredAccessFtux = if v16() then nil else v31.props.shouldShowUnfilteredAccessFtux, 
                isJoinPartyUpsellFtux = if v16() then nil else v31.props.shouldShowPartyUpsellFtux
            }
        }, l_itemList_0);
    end;
    local function v47(v35) --[[ Line: 193 ]] --[[ Name: renderScroller ]]
        -- upvalues: v15 (ref), v2 (ref), v31 (copy), l_BidirectionalFlatList_0 (ref), l_itemList_0 (ref), v14 (ref), l_default_0 (ref), v20 (ref), v6 (ref)
        if v15() then
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = v31.props.Size, 
                [v2.Ref] = v31.viewRef
            }, {
                scroller = v2.createElement(l_BidirectionalFlatList_0, {
                    data = l_itemList_0, 
                    renderItem = v31.renderItem, 
                    getItemLayout = function(_, v37) --[[ Line: 203 ]] --[[ Name: getItemLayout ]]
                        -- upvalues: v31 (ref)
                        return {
                            length = v31.ENTRY_HEIGHT, 
                            offset = v31.ENTRY_HEIGHT * (v37 - 1), 
                            index = v37
                        };
                    end, 
                    style = {
                        BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = if v14() then v35.Tokens.Global.Color.None.Transparency else v35.Theme.BackgroundDefault.Transparency, 
                        ScrollBarThickness = 0, 
                        BorderSizePixel = l_default_0.isEnabled() and 0 or nil
                    }, 
                    contentContainerStyle = {
                        BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = if v14() then v35.Tokens.Global.Color.None.Transparency else v35.Theme.BackgroundDefault.Transparency, 
                        BorderSizePixel = l_default_0.isEnabled() and 0 or nil
                    }, 
                    windowSize = 2, 
                    initialNumToRender = 15, 
                    onScroll = v31.onScrollUpdate, 
                    onContentSizeChange = function(_, v39) --[[ Line: 229 ]] --[[ Name: onContentSizeChange ]]
                        -- upvalues: v31 (ref), v20 (ref)
                        local l_current_0 = v31.viewRef.current;
                        if l_current_0 then
                            v20:debug("onContentSizeChange - Window height: {} vs Content height: {}", l_current_0.AbsoluteSize.Y, v39);
                            if v39 <= l_current_0.AbsoluteSize.Y then
                                v20:info("Not enough content to fill the view, loading more conversations");
                                v31.props.loadNext();
                            end;
                        end;
                    end, 
                    onEndReached = function() --[[ Line: 243 ]] --[[ Name: onEndReached ]]
                        -- upvalues: v20 (ref), v31 (ref), v6 (ref)
                        v20:debug("onEndReached - Loading more conversations");
                        v31.props.loadNext();
                        return v6.resolve();
                    end, 
                    onStartReached = function() --[[ Line: 248 ]] --[[ Name: onStartReached ]]
                        -- upvalues: v20 (ref), v31 (ref), v6 (ref)
                        v20:debug("onStartReached - Loading previous conversations");
                        if v31.props.loadPrevious then
                            v31.props.loadPrevious();
                        end;
                        return v6.resolve();
                    end, 
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasSize = UDim2.fromScale(0, 0), 
                    onEndReachedThreshold = v31.ENTRY_HEIGHT * 4, 
                    onStartReachedThreshold = v31.ENTRY_HEIGHT * 4, 
                    compareItemData = function(v41, v42) --[[ Line: 259 ]] --[[ Name: compareItemData ]]
                        return v41.id == v42.id;
                    end, 
                    [v2.Ref] = v31.ref, 
                    autoscrollToTopThreshold = 33, 
                    enableAutoscrollToTop = true
                })
            });
        else
            return v2.createElement(l_BidirectionalFlatList_0, {
                data = l_itemList_0, 
                renderItem = v31.renderItem, 
                getItemLayout = function(_, v44) --[[ Line: 271 ]] --[[ Name: getItemLayout ]]
                    -- upvalues: v31 (ref)
                    return {
                        length = v31.ENTRY_HEIGHT, 
                        offset = v31.ENTRY_HEIGHT * (v44 - 1), 
                        index = v44
                    };
                end, 
                style = {
                    BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = if v14() then v35.Tokens.Global.Color.None.Transparency else v35.Theme.BackgroundDefault.Transparency, 
                    ScrollBarThickness = 0, 
                    BorderSizePixel = l_default_0.isEnabled() and 0 or nil
                }, 
                contentContainerStyle = {
                    BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = if v14() then v35.Tokens.Global.Color.None.Transparency else v35.Theme.BackgroundDefault.Transparency, 
                    BorderSizePixel = l_default_0.isEnabled() and 0 or nil
                }, 
                windowSize = 2, 
                initialNumToRender = 15, 
                onScroll = v31.onScrollUpdate, 
                onEndReached = function() --[[ Line: 297 ]] --[[ Name: onEndReached ]]
                    -- upvalues: v31 (ref), v6 (ref)
                    v31.props.loadNext();
                    return v6.resolve();
                end, 
                onStartReached = function() --[[ Line: 301 ]] --[[ Name: onStartReached ]]
                    -- upvalues: v31 (ref), v6 (ref)
                    if v31.props.loadPrevious then
                        v31.props.loadPrevious();
                    end;
                    return v6.resolve();
                end, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromScale(0, 0), 
                onEndReachedThreshold = v31.ENTRY_HEIGHT * 4, 
                onStartReachedThreshold = v31.ENTRY_HEIGHT * 4, 
                compareItemData = function(v45, v46) --[[ Line: 311 ]] --[[ Name: compareItemData ]]
                    return v45.id == v46.id;
                end, 
                [v2.Ref] = v31.ref, 
                autoscrollToTopThreshold = 33, 
                enableAutoscrollToTop = true
            });
        end;
    end;
    return l_withStyle_0(function(v48) --[[ Line: 321 ]]
        -- upvalues: l_itemList_0 (ref), v2 (ref), v31 (copy), v14 (ref), v47 (copy)
        if #l_itemList_0 == 0 then
            return v2.createElement("Frame", {
                Size = v31.props.Size, 
                BackgroundColor3 = v48.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if v14() then v48.Tokens.Global.Color.None.Transparency else v48.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v31.props.LayoutOrder
            });
        else
            return v47(v48);
        end;
    end);
end;
return v21;