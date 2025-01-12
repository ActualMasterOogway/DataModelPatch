local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.t);
local _ = require(l_Parent_0.GameTile);
local v6 = require(l_Parent_0.DiscoveryTypes);
local l_GameSortGroups_0 = v6.GameSortGroups;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_parseBooleanString_0 = require(l_Parent_0.DiscoveryUtils).parseBooleanString;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.Personalization.Games.GameCollectionCarousel);
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableChartsSubtitleLink_0 = require(l_Parent_0.SharedFlags).FFlagEnableChartsSubtitleLink;
local v19 = game:DefineFastFlag("LuaAppForceLowResMural", false);
local v20 = require(l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v23 = v2.PureComponent:extend("GameCarouselFeedItem");
v23.validateProps = v4.strictInterface({
    [v15.key] = v15.interface, 
    sortIndex = v4.number, 
    isOmni = v4.boolean, 
    topicLayoutData = v4.optional(v4.table), 
    formFactor = v4.string, 
    sortName = v4.string, 
    itemRowData = v4.optional(v4.table)
});
v23.render = function(v24) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v14 (copy), l_FFlagEnableChartsSubtitleLink_0 (copy), l_mutedError_0 (copy), v19 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_parseBooleanString_0 (copy), l_AppPage_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v2 (copy), v13 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v20 (copy)
    local l_sortIndex_0 = v24.props.sortIndex;
    local l_sortName_0 = v24.props.sortName;
    local l_formFactor_0 = v24.props.formFactor;
    local l_scrollViewPositionChangedSignal_0 = v24.props[v15.key].scrollViewPositionChangedSignal;
    local l_appPage_0 = v24.props[v15.key].appPage;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = "Narrow";
    if v24.props.topicLayoutData then
        v32 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.ComponentType];
        if v32 then
            if v32 == v14.ComponentTypeDataKeys.EventTile then
                v36 = "Event";
            elseif v32 == v14.ComponentTypeDataKeys.GridTile then
                v36 = "Wide";
            end;
            local v37 = true;
            if v36 ~= "Wide" then
                v37 = v36 == "Event";
            end;
            v30 = v37;
        end;
        v33 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.LinkPath];
        v34 = if l_FFlagEnableChartsSubtitleLink_0 then v24.props.topicLayoutData[v14.TopicLayoutDataKeys.SubtitleLinkPath] else nil;
        v31 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.PlayerCountStyle];
        v35 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.PlayButtonStyle];
    end;
    local v38 = nil;
    if v24.props.topicLayoutData then
        local v39 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v40 = false;
        if v39 ~= nil then
            v40 = v39 == "true";
        end;
        v38 = v40;
    end;
    local v41 = nil;
    if v24.props.topicLayoutData then
        local v42 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.HideSeeAll];
        local v43 = false;
        if v42 ~= nil then
            v43 = v42 == "true";
        end;
        v41 = v43;
    end;
    local v44 = if v24.props.topicLayoutData then v24.props.topicLayoutData[v14.TopicLayoutDataKeys.InfoText] else nil;
    local v45 = nil;
    if v24.props.topicLayoutData then
        local v46 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.EndTimestamp];
        if v46 then
            v45 = tonumber(v46);
            if v45 == nil then
                l_mutedError_0(string.format("Unable to convert `endTimestamp` to number with value: %s", v46));
            end;
        end;
    end;
    local v47 = nil;
    if v24.props.topicLayoutData then
        v47 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.CountdownString];
        if v47 ~= nil and v47 ~= "" and (not v47:find("{hours}") or not v47:find("{minutes}")) then
            l_mutedError_0(string.format("Invalid `countdownString` missing placeholder strings {hours} or {minutes}: %s", v47));
            v47 = nil;
        end;
    end;
    local v48 = nil;
    if v24.props.topicLayoutData then
        local v49 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.BackgroundImageAssetId];
        if v49 and v49 ~= "" then
            v48 = if v19 then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v49) else ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format(v49);
        end;
    end;
    local v50 = nil;
    if l_FFlagLuaAppHeaderButtonText_0 and v24.props.topicLayoutData then
        v50 = v24.props.topicLayoutData[v14.TopicLayoutDataKeys.HeaderButtonText];
    end;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    if v24.props.topicLayoutData then
        v51 = l_parseBooleanString_0(v24.props.topicLayoutData[v14.TopicLayoutDataKeys.HideTileMetadata]);
        v52 = l_parseBooleanString_0(v24.props.topicLayoutData[v14.TopicLayoutDataKeys.HideTileTitle]);
        v53 = l_parseBooleanString_0(v24.props.topicLayoutData[v14.TopicLayoutDataKeys.ContainedTile]);
    end;
    local v54 = nil;
    if l_appPage_0 == l_AppPage_0.Home then
        v54 = true;
    end;
    local v55 = nil;
    v55 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    return v2.createElement(v13, {
        gameSortId = l_sortName_0, 
        sortIndex = l_sortIndex_0, 
        pageContext = l_appPage_0, 
        scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
        friendFooterEnabled = true, 
        isHoverSupportEnabled = v54 or l_appPage_0 == l_AppPage_0.Games and v30, 
        gridSupportAllowed = v54, 
        useGridTiles = v30, 
        playerCountStyle = v31, 
        isSponsoredFooterAllowed = v38, 
        componentType = v32, 
        linkPath = v33, 
        subtitleLinkPath = if l_FFlagEnableChartsSubtitleLink_0 then v34 else nil, 
        hideSeeAll = v41, 
        gameTileLayoutType = v36, 
        infoText = v44, 
        endTimestamp = v45, 
        countdownString = v47, 
        itemRowData = v24.props.itemRowData, 
        playButtonStyle = v35, 
        sideMargin = v55, 
        backgroundMuralUrl = v48, 
        headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v50 else nil, 
        shouldHideTileMetadata = v51, 
        shouldHideTileTitle = v52, 
        containedTile = v53, 
        shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then l_appPage_0 == l_AppPage_0.SearchLandingPage else nil, 
        layoutOverrides = if l_FFlagSearchOmniAutocompletePage_0 then if l_appPage_0 == l_AppPage_0.SearchLandingPage then {
            sideMargin = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else v20
        } else nil else nil
    });
end;
return (v3.connect(function(v56, v57) --[[ Line: 210 ]]
    -- upvalues: v15 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_mutedError_0 (copy)
    local v58 = v57[v15.key];
    local l_appPage_1 = v58.appPage;
    local v60 = nil;
    local v61 = nil;
    if v57.isOmni then
        assert(l_appPage_1 == l_AppPage_0.Home, "Omni only on Home Page");
        local v62 = v56.OmniRecommendations[l_appPage_1];
        local v63 = (v62 and v62.sorts or {})[v57.sortIndex];
        if v63 and v63.topicId then
            v60 = tostring(v63.topicId);
        end;
    else
        local v64 = nil;
        if l_appPage_1 == l_AppPage_0.Home then
            v64 = l_GameSortGroups_0.HomeGames;
        elseif l_appPage_1 == l_AppPage_0.Games then
            v64 = l_GameSortGroups_0.Games;
        elseif l_FFlagSearchOmniAutocompletePage_0 and l_appPage_1 == l_AppPage_0.SearchLandingPage then
            v64 = l_GameSortGroups_0.SearchLandingPage;
        else
            l_mutedError_0("Unsupported page for GameCarouselFeedItem data: " .. tostring(l_appPage_1));
        end;
        v60 = v56.GameSortGroups[v64].sorts[v57.sortIndex];
    end;
    v61 = (v56.Personalization.OmniItemsRowData[l_appPage_1] or {})[v58.feedItemPosition];
    return {
        sortName = v60, 
        itemRowData = v61, 
        formFactor = v56.FormFactor
    };
end)(v23));