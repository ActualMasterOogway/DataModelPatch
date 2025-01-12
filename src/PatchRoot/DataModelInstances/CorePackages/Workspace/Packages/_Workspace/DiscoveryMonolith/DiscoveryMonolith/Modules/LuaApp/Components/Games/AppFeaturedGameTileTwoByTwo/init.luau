local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.t);
local l_withGridConfig_DEPRECATED_0 = require(l_Parent_0.UIBlox).Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local v8 = require(l_Parent_0.GameTile);
local l_SponsoredGamesRecordClick_0 = v8.SponsoredGamesRecordClick;
local l_AppExperienceActionRow_0 = v8.AppExperienceActionRow;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_BigGameIconReducer_0 = require(l_Parent_0.GameIconRodux).BigGameIcons.BigGameIconReducer;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v16 = require(l_Parent_0.DiscoveryTypes);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v18 = require(l_Parent_0.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v21 = require(l_Modules_0.LuaApp.getRatingText);
local v22 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedTile);
local v23 = require(l_Modules_0.LuaApp.Components.Games.FeaturedContentPanel);
local v24 = require(l_Modules_0.LuaApp.Components.Games.FeaturedStaticPanel);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_FFlagLuaAppEmphasisOfficial_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEmphasisOfficial;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_GAME_GRID_CHILD_PADDING_0 = v16.Constants.GAME_GRID_CHILD_PADDING;
local v30 = v16.Constants.GAME_GRID_CHILD_PADDING * 2;
local v31 = v2.PureComponent:extend("AppFeaturedGameTileTwoByTwo");
v31.validateProps = v4.strictInterface({
    entry = v4.table, 
    index = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    reportGameDetailOpened = v4.optional(v4.callback), 
    reportExperienceLaunched = v4.optional(v4.callback), 
    size = v4.optional(v4.Vector2), 
    position = v4.optional(v4.Vector2), 
    source = v4.optional(v4.string), 
    referralSource = v4.optional(v4.string), 
    hasBackground = v4.optional(v4.boolean), 
    hasActionRow = v4.optional(v4.boolean), 
    isDynamic = v4.optional(v4.boolean), 
    impressionsTag = v4.optional(v4.string), 
    launchExperienceEventContext = v4.optional(v4.string), 
    universeId = v4.optional(v4.string), 
    name = v4.optional(v4.string), 
    creatorName = v4.optional(v4.string), 
    placeId = v4.optional(v4.string), 
    totalUpVotes = v4.optional(v4.number), 
    totalDownVotes = v4.optional(v4.number), 
    gameDetail = v4.optional(v4.table), 
    thumbnail = v4.optional(v4.table), 
    openGameDetails = v4.callback, 
    fetchGameDetails = v4.callback, 
    navigation = v4.any, 
    networking = v4.callback, 
    shouldShowFeaturedTileCreatorName = v4.optional(v4.boolean)
});
v31.init = function(v32) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_SponsoredGamesRecordClick_0 (copy), l_AppExperienceActionRow_0 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_FFlagLuaAppEmphasisOfficial_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v21 (copy), v23 (copy), v24 (copy), l_withGridConfig_DEPRECATED_0 (copy)
    v32.isMounted = false;
    v32.gameTileRef = v2.createRef();
    v32.onActivated = function() --[[ Line: 91 ]]
        -- upvalues: v32 (copy), l_SponsoredGamesRecordClick_0 (ref)
        if not v32.isMounted then
            return;
        else
            local l_universeId_0 = v32.props.universeId;
            local v34 = {
                source = v32.props.source, 
                index = v32.props.index, 
                onPeekViewClosed = v32.props.onPeekViewClosed
            };
            v32.props.openGameDetails(l_universeId_0, v34, v32.props.navigation);
            local l_index_0 = v32.props.index;
            local l_reportGameDetailOpened_0 = v32.props.reportGameDetailOpened;
            if l_index_0 and l_reportGameDetailOpened_0 then
                l_reportGameDetailOpened_0(l_index_0);
            end;
            local l_networking_0 = v32.props.networking;
            local l_entry_0 = v32.props.entry;
            if l_entry_0.isSponsored then
                l_SponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
            end;
            return;
        end;
    end;
    v32.renderActionRow = function() --[[ Line: 121 ]]
        -- upvalues: v2 (ref), l_AppExperienceActionRow_0 (ref), v32 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (ref)
        return v2.createElement(l_AppExperienceActionRow_0, {
            universeId = v32.props.universeId, 
            referralSource = v32.props.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = v32.props.reportExperienceLaunched, 
            openGameDetails = v32.onActivated, 
            entry = v32.props.entry, 
            launchExperienceEventContext = v32.props.launchExperienceEventContext, 
            showButtonText = l_FFlagLuaAppPlayButtonUpdates_0 and true or nil
        });
    end;
    v32.renderBottomPanel = function() --[[ Line: 134 ]]
        -- upvalues: v32 (copy), l_FFlagLuaAppEmphasisOfficial_0 (ref), l_FFlagLuaAppFiatPaidAccess_0 (ref), v21 (ref), v2 (ref), v23 (ref), v24 (ref), l_withGridConfig_DEPRECATED_0 (ref)
        local l_entry_1 = v32.props.entry;
        local l_name_0 = v32.props.name;
        local l_totalUpVotes_0 = v32.props.totalUpVotes;
        local l_totalDownVotes_0 = v32.props.totalDownVotes;
        local l_gameDetail_0 = v32.props.gameDetail;
        local v44 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.hasVerifiedBadge;
        local v45 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.id;
        local v46 = l_gameDetail_0 and l_gameDetail_0.description or "";
        local l_shouldShowFeaturedTileCreatorName_0 = v32.props.shouldShowFeaturedTileCreatorName;
        local l_isDynamic_0 = v32.props.isDynamic;
        if l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0 then
            local v49 = if l_FFlagLuaAppEmphasisOfficial_0 and l_gameDetail_0 then l_gameDetail_0.licenseDescription else nil;
            local v50 = if l_FFlagLuaAppFiatPaidAccess_0 and l_gameDetail_0 then l_gameDetail_0.localizedFiatPrice else nil;
            local v51 = {
                hasBackground = v32.props.hasBackground, 
                padding = 8, 
                title = l_name_0, 
                creatorName = if l_shouldShowFeaturedTileCreatorName_0 then v32.props.creatorName else nil, 
                creatorVerified = v44, 
                creatorId = v45, 
                description = v46, 
                licenseDescription = v49, 
                paidAccessDescription = v50, 
                footerData = {
                    rating = v21(l_totalUpVotes_0, l_totalDownVotes_0), 
                    playingCount = l_entry_1.playerCount
                }
            };
            if l_isDynamic_0 then
                return v2.createElement(v23, v51);
            else
                return v2.createElement(v24, v51);
            end;
        else
            return l_withGridConfig_DEPRECATED_0({
                featuredContentRows = 4
            })(function(v52) --[[ Line: 179 ]]
                -- upvalues: v32 (ref), l_isDynamic_0 (copy), l_name_0 (copy), l_shouldShowFeaturedTileCreatorName_0 (copy), v44 (copy), v45 (copy), v46 (copy), v21 (ref), l_totalUpVotes_0 (copy), l_totalDownVotes_0 (copy), l_entry_1 (copy), v2 (ref), v23 (ref), v24 (ref)
                local v53 = {
                    hasBackground = v32.props.hasBackground, 
                    contentRows = if l_isDynamic_0 then v52.featuredContentRows else nil, 
                    padding = 8, 
                    title = l_name_0, 
                    creatorName = if l_shouldShowFeaturedTileCreatorName_0 then v32.props.creatorName else nil, 
                    creatorVerified = v44, 
                    creatorId = v45, 
                    description = v46, 
                    footerData = {
                        rating = v21(l_totalUpVotes_0, l_totalDownVotes_0), 
                        playingCount = l_entry_1.playerCount
                    }
                };
                if l_isDynamic_0 then
                    return v2.createElement(v23, v53);
                else
                    return v2.createElement(v24, v53);
                end;
            end);
        end;
    end;
end;
v31.didMount = function(v54) --[[ Line: 206 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v54.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v54.gameTileRef, v54.props.impressionsTag, v54.props.index);
    local l_networking_1 = v54.props.networking;
    local l_universeId_1 = v54.props.universeId;
    v54.props.fetchGameDetails(l_networking_1, l_universeId_1);
end;
v31.willUnmount = function(v57) --[[ Line: 216 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v57.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v57.gameTileRef, v57.props.impressionsTag, v57.props.index);
end;
v31.didUpdate = function(v58, v59) --[[ Line: 221 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v59.impressionsTag ~= v58.props.impressionsTag or v59.index ~= v58.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v58.gameTileRef, v59.impressionsTag, v59.index);
        l_ImpressionsTagUtility_0.AddTag(v58.gameTileRef, v58.props.impressionsTag, v58.props.index);
    end;
end;
v31.render = function(v60) --[[ Line: 228 ]] --[[ Name: render ]]
    -- upvalues: l_GAME_GRID_CHILD_PADDING_0 (copy), v30 (copy), v2 (copy), v22 (copy)
    local l_layoutOrder_0 = v60.props.layoutOrder;
    local l_size_0 = v60.props.size;
    local l_position_0 = v60.props.position;
    local l_thumbnail_0 = v60.props.thumbnail;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local v65 = if l_size_0 then l_size_0.X else nil;
    local v66 = if l_size_0 then l_size_0.Y else nil;
    local v67 = if l_size_0 then v65 * 2 + l_GAME_GRID_CHILD_PADDING_0 else nil;
    local v68 = if l_size_0 then v66 * 2 + v30 else nil;
    local l_hasBackground_0 = v60.props.hasBackground;
    local l_hasActionRow_0 = v60.props.hasActionRow;
    local v71 = v2.createElement(v22, {
        hasBackground = l_hasBackground_0, 
        hasOutline = l_hasBackground_0, 
        thumbnail = l_thumbnail_0, 
        renderActionRow = if l_hasActionRow_0 then v60.renderActionRow else nil, 
        renderBottomPanel = v60.renderBottomPanel, 
        onActivated = v60.onActivated
    });
    return v2.createElement("Frame", {
        Position = if l_size_0 and l_position_0 then UDim2.fromOffset(l_position_0.X, l_position_0.Y) else nil, 
        Size = if l_size_0 then UDim2.new(0, v65, 0, v66) else UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        ref = v60.gameTileRef
    }, {
        FeaturedTile = if l_size_0 then v2.createElement("Frame", {
            Size = UDim2.new(0, v67, 0, v68), 
            Position = UDim2.new(0, 0, 0, -v66 - v30), 
            BackgroundTransparency = 1
        }, {
            Tile = v71
        }) else v71
    });
end;
v31 = l_withNavigation_0((v3.connect(function(v72, v73) --[[ Line: 274 ]]
    -- upvalues: l_GameInfosReducer_0 (copy), l_BigGameIconReducer_0 (copy)
    local l_universeId_2 = v73.entry.universeId;
    local v75 = v72.Personalization[l_GameInfosReducer_0.key][l_universeId_2];
    return {
        universeId = l_universeId_2, 
        name = v75.name, 
        creatorName = v75.creatorName, 
        placeId = v75.placeId, 
        totalUpVotes = v75.totalUpVotes, 
        totalDownVotes = v75.totalDownVotes, 
        gameDetail = v72.GameDetails[l_universeId_2], 
        thumbnail = v72[l_BigGameIconReducer_0.key][l_universeId_2]
    };
end, function(v76) --[[ Line: 287 ]]
    -- upvalues: l_OpenGameDetails_0 (copy), l_ApiFetchGameDetails_0 (copy)
    return {
        openGameDetails = function(v77, v78, v79) --[[ Line: 289 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v76 (copy), l_OpenGameDetails_0 (ref)
            v76(l_OpenGameDetails_0(v77, v79, v78));
        end, 
        fetchGameDetails = function(v80, v81) --[[ Line: 292 ]] --[[ Name: fetchGameDetails ]]
            -- upvalues: v76 (copy), l_ApiFetchGameDetails_0 (ref)
            v76(l_ApiFetchGameDetails_0.Fetch(v80, {
                v81
            }));
        end
    };
end)(v31)));
v31 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v31);
return (v18.connectUserLayer({
    v25() and l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer or nil
}, function(v82, _) --[[ Line: 306 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        shouldShowFeaturedTileCreatorName = (v82[l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
    };
end)(v31));