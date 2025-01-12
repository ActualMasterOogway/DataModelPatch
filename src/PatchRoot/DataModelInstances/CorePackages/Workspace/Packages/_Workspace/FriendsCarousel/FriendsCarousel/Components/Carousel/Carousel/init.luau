local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_1.React);
local l_Roact_0 = v2.Roact;
local l_llama_0 = v2.llama;
local l_withLocalization_0 = v2.withLocalization;
local l_useDesignTokens_0 = v2.Hooks.useDesignTokens;
local l_useUiModeInfo_0 = v2.Hooks.useUiModeInfo;
local l_UiMode_0 = v2.RobloxAppEnums.UiMode;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v11 = require(l_Parent_0.Components.FindFriendsTile);
local v12 = require(l_Parent_0.Components.FindFriendsHint);
local v13 = require(l_Parent_0.Components.CarouselUserTile);
local v14 = require(l_Parent_0.Components.LoadingTile);
local v15 = require(l_Parent_0.Components.ButtonTileCircular);
local _ = require(l_Parent_0.Components.PaginatedCarousel.useCarouselList);
local v17 = require(l_Parent_0.Components.useCreateCarouselList);
local v18 = require(l_Parent_0.Components.useFreezableList);
local _ = require(l_Parent_0.Common.LocalTypes);
local v20 = require(l_Parent_0.Common.TextKeys);
local v21 = require(l_Parent_0.Analytics.UILoadingEvents);
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_1.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local v23 = game:DefineFastFlag("FriendsCarouseCINavigationUpdate", false);
local l_FFlagLuaAppPropagateFriendsCarouselHeader_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader;
local v25 = require(l_Parent_0.Flags.FFlagFriendsCarouselSmallerUIExperiment);
local v26 = require(l_Parent_0.Flags.FFlagFriendsCarouselSmallerUIEnabledForAll);
local v27 = require(l_Parent_0.Flags.FFlagFriendsCarouselNewPresenceUIEnabledForAll);
local l_FFlagRefactorButtonTileCircular_0 = require(l_Parent_1.SharedFlags).FFlagRefactorButtonTileCircular;
local v29 = l_Roact_0.Component:extend("Carousel");
v29.defaultProps = {};
v29.init = function(v30) --[[ Line: 116 ]] --[[ Name: init ]]
    -- upvalues: v21 (copy), l_withLocalization_0 (copy), v20 (copy), l_Roact_0 (copy), v11 (copy), l_FFlagEnableNewFriendRequestsBadge_0 (copy), l_FFlagRefactorButtonTileCircular_0 (copy), v25 (copy), v26 (copy), v12 (copy), v14 (copy), l_llama_0 (copy), v27 (copy), v13 (copy), v15 (copy)
    v30.reportNonFriendsElements = function(v31) --[[ Line: 117 ]]
        -- upvalues: v30 (copy), v21 (ref)
        local l_props_0 = v30.props;
        if l_props_0.onSuccessfulRender then
            l_props_0.onSuccessfulRender((("%*%*"):format(v31, if l_props_0.paginatedCarouselEnabled then v21.ExperimentSuffix else "")));
        end;
    end;
    v30.renderFindFriendsTile = function(v33) --[[ Line: 126 ]]
        -- upvalues: v30 (copy), l_withLocalization_0 (ref), v20 (ref), l_Roact_0 (ref), v11 (ref), l_FFlagEnableNewFriendRequestsBadge_0 (ref), v21 (ref), l_FFlagRefactorButtonTileCircular_0 (ref), v25 (ref), v26 (ref)
        local l_props_1 = v30.props;
        local l_data_0 = v33.data;
        return l_withLocalization_0({
            newTextBadge = v20.NewText
        })(function(v36) --[[ Line: 133 ]]
            -- upvalues: l_Roact_0 (ref), v11 (ref), l_props_1 (copy), l_FFlagEnableNewFriendRequestsBadge_0 (ref), v30 (ref), v21 (ref), l_FFlagRefactorButtonTileCircular_0 (ref), l_data_0 (copy), v25 (ref), v26 (ref)
            return l_Roact_0.createElement(v11, {
                onActivated = l_props_1.onFindFriendsTileActivated, 
                badgeValue = if l_FFlagEnableNewFriendRequestsBadge_0 then nil else if l_props_1.showNewBadge then v36.newTextBadge else nil, 
                tileSize = l_props_1.designTokens.tileSize, 
                onDidMount = v30.reportNonFriendsElements(v21.AddFriendsBtn), 
                backgroundColor = if l_FFlagRefactorButtonTileCircular_0 then nil else l_data_0.backgroundColor, 
                noBorder = if l_FFlagRefactorButtonTileCircular_0 then nil else l_data_0.backgroundColor and true or false, 
                icon = if l_FFlagRefactorButtonTileCircular_0 then nil else l_data_0.icon, 
                iconColor = if l_FFlagRefactorButtonTileCircular_0 then nil else l_data_0.iconColor, 
                friendsCarouselSmallerUI = if not v25 or v26 then nil else l_props_1.friendsCarouselSmallerUI
            });
        end);
    end;
    v30.renderFindFriendsHint = function(v37) --[[ Line: 161 ]]
        -- upvalues: v30 (copy), l_Roact_0 (ref), v12 (ref), v21 (ref)
        local l_props_2 = v30.props;
        return l_Roact_0.createElement(v12, {
            layoutOrder = v37.layoutOrder, 
            tileHeight = l_props_2.designTokens.tileSize, 
            onDidMount = v30.reportNonFriendsElements(v21.EmptyHint)
        });
    end;
    v30.renderUserTile = function(v39) --[[ Line: 172 ]]
        -- upvalues: v30 (copy), l_Roact_0 (ref), v14 (ref), l_llama_0 (ref), v25 (ref), v27 (ref), v13 (ref)
        local l_props_3 = v30.props;
        if v39.data.isLoading then
            local v41 = {
                layoutOrder = v39.layoutOrder, 
                tileSize = l_props_3.designTokens.tileSize, 
                tileInfoHeight = v39.tileInfoHeight
            };
            return l_Roact_0.createElement(v14, v41);
        else
            local v42 = l_llama_0.Dictionary.join(v39, {
                user = v39.data, 
                tileSize = l_props_3.designTokens.tileSize, 
                tileInfoHeight = v39.tileInfoHeight, 
                onActivated = l_props_3.onUserTileActivated, 
                showToast = l_props_3.showToast, 
                userSeen = l_props_3.userSeen, 
                setListFrozen = l_props_3.setListFrozen, 
                showNewPresenceIndicator = if not v25 or v27 then nil else l_props_3.showNewPresenceIndicator, 
                reportRender = l_props_3.onSuccessfulRender
            });
            return l_Roact_0.createElement(v13, v42);
        end;
    end;
    v30.renderItem = function(v43) --[[ Line: 208 ]]
        -- upvalues: v30 (copy), l_Roact_0 (ref), v15 (ref)
        local l_props_4 = v30.props;
        local l_data_1 = v43.data;
        if l_data_1.isCustomBtn then
            return l_Roact_0.createElement(v15, {
                layoutOrder = v43.layoutOrder, 
                title = l_data_1.text, 
                icon = l_data_1.icon, 
                iconColor = l_data_1.iconColor, 
                backgroundColor = l_data_1.backgroundColor, 
                noBorder = l_data_1.backgroundColor and true or false, 
                onActivated = l_data_1.onActivated, 
                tileSize = l_props_4.designTokens.tileSize
            });
        elseif l_data_1.isAddButton then
            return v30.renderFindFriendsTile(v43);
        elseif l_data_1.isEmptyHint then
            return v30.renderFindFriendsHint(v43);
        else
            return v30.renderUserTile(v43);
        end;
    end;
end;
v29.render = function(v46) --[[ Line: 234 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_llama_0 (copy), v23 (copy), v25 (copy), v26 (copy), v27 (copy)
    local l_props_5 = v46.props;
    return l_Roact_0.createElement(l_props_5.carousel, l_llama_0.Dictionary.join(l_props_5.carouselProps, {
        friendCount = l_props_5.friendCount, 
        items = l_props_5.carouselList, 
        renderItem = v46.renderItem, 
        sideMargin = l_props_5.designTokens.horizontalMargin, 
        friendThumbnailSize = l_props_5.designTokens.tileSize, 
        headerPadding = l_props_5.designTokens.headerPadding, 
        cardPadding = l_props_5.designTokens.cardPadding, 
        fetchNext = v46.props.fetchNext, 
        title = l_props_5.headerTitle, 
        onActivateHeader = l_props_5.onSeeAllFriends, 
        _propToUpdateFindFriendsTile = if v23 then l_props_5.onFindFriendsTileActivated else nil, 
        _propToUpdateFindFriendsTile2 = l_props_5.addFriendsBtn, 
        _friendsCarouselSmallerUI = if not v25 or v26 then nil else l_props_5.friendsCarouselSmallerUI, 
        _showNewPresenceIndicator = if not v25 or v27 then nil else l_props_5.showNewPresenceIndicator
    }));
end;
return function(v48) --[[ Line: 277 ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), v25 (copy), v26 (copy), v17 (copy), v18 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppPropagateFriendsCarouselHeader_0 (copy), l_llama_0 (copy), v3 (copy), v29 (copy)
    local v49 = l_useUiModeInfo_0();
    local v51 = l_useDesignTokens_0(function(v50) --[[ Line: 280 ]]
        -- upvalues: v49 (copy), l_UiMode_0 (ref), v25 (ref), v48 (copy), v26 (ref)
        if v49.uiMode == l_UiMode_0.TenFoot then
            return {
                horizontalMargin = v50.Global.Space_800, 
                tileSize = v50.Global.Size_1200, 
                headerPadding = v50.Global.Space_200, 
                cardPadding = v50.Global.Space_300
            };
        else
            return {
                horizontalMargin = nil, 
                headerPadding = nil, 
                tileSize = (v25 and v48.friendsCarouselSmallerUI or v26) and 70 or 96, 
                cardPadding = (v25 and v48.friendsCarouselSmallerUI or v26) and 12 or 10
            };
        end;
    end);
    local v52 = v17({
        users = v48.users or {}, 
        friendCount = v48.friendCount, 
        socialOnboardingBtns = v48.socialOnboardingBtns, 
        includeAddFriendsBtn = true, 
        addFriendsBtn = v48.addFriendsBtn, 
        includeEmptyHint = true
    });
    local v53, v54 = v18(v52);
    local v55 = v48.friendCount == 0 and "CommonUI.Features.Label.Friends" or {
        "Feature.Home.HeadingFriends"; 
        friendCount = v48.friendCount
    };
    local v56 = nil;
    local v57 = l_useLocalization_0({
        headerTitle = v55
    });
    v56 = if l_FFlagLuaAppPropagateFriendsCarouselHeader_0 then if v48.title ~= nil and v48.title ~= "" then v57.headerTitle else nil else v57.headerTitle;
    local v58 = l_llama_0.Dictionary.join(v48, {
        designTokens = v51, 
        carouselList = v53, 
        setListFrozen = v54, 
        headerTitle = v56
    });
    return v3.createElement(v29, v58);
end;