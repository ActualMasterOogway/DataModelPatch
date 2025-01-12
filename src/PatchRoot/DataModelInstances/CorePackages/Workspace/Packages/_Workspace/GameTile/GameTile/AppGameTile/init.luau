local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local l_GridTileFriendFooter_0 = require(l_script_FirstAncestor_0.Footer.GridTileFriendFooter).GridTileFriendFooter;
local v4 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v5 = require(l_script_FirstAncestor_0.ZoomAnimatedFrame);
local v6 = require(l_script_FirstAncestor_0.SponsoredGamesRecordClick);
local v7 = require(l_script_FirstAncestor_0.Footer.GameStats);
local v8 = require(l_script_FirstAncestor_0.Footer.UserIconList);
local v9 = require(l_script_FirstAncestor_0.Footer.ExperienceFooter);
local v10 = require(l_script_FirstAncestor_0.Footer.GridTileSponsoredFooter);
local v11 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadges);
local v12 = require(l_script_FirstAncestor_0.sortFriendsByPresenceAndRecencyFactory);
local v13 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPlacesList);
local v14 = require(l_script_FirstAncestor_0.GameTileView);
local v15 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local v16 = require(l_script_FirstAncestor_0.GameTileConstants);
local v17 = require(l_script_FirstAncestor_0.OpenSponsoredTooltip);
local v18 = require(l_script_FirstAncestor_0.GameTileTypes);
local v19 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v20 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local v21 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v22 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local v23 = require(l_script_FirstAncestor_0.Overlays.getValidTileBadges);
local v24 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v26 = require(l_Parent_0.React);
local v27 = require(l_Parent_0.Roact);
local v28 = require(l_Parent_0.RoactRodux);
local v29 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v32 = require(l_Parent_0.t);
local v33 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v33.Style.withStyle;
local l_Images_0 = v33.App.ImageSet.Images;
local l_ExperienceTileV3_0 = v33.App.Tile.ExperienceTileV3;
local l_AspectRatioModeEnum_0 = v33.App.Tile.AspectRatioModeEnum;
local l_withGridConfig_DEPRECATED_0 = v33.Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_DiscoveryAppLaunchTracker_0 = require(l_Parent_0.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagUIBloxUseNewInteractable_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxUseNewInteractable;
local l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileIconTextBadgeEnabled;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_game_EngineFeature_0 = game:GetEngineFeature("BatchThumbnailSupports256x144Asset");
local l_game_EngineFeature_1 = game:GetEngineFeature("BatchThumbnailSupports384x216Asset");
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local l_FFlagLuaAppMigrateGameTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileIxp;
local l_FFlagLuaAppTextFooterLegacyTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTextFooterLegacyTile;
local l_FFlagLuaAppLaunchTracker_0 = require(l_Parent_0.AppLaunchTracker).Flags.FFlagLuaAppLaunchTracker;
local v58 = game:DefineFastFlag("LuaAppGameTileConsoleTextSize", false);
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _() --[[ Line: 78 ]] --[[ Name: getHoverDelay ]]
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v60 = v27.PureComponent:extend("AppGameTile");
v60.validateProps = v32.strictInterface({
    entry = v32.table, 
    reportGameDetailOpened = v32.callback, 
    reportExperienceLaunched = v32.optional(v32.callback), 
    Size = v32.optional(v32.union(v32.UDim2, v32.table)), 
    ZIndex = v32.optional(v32.number), 
    useHoverTile = v32.optional(v32.boolean), 
    hasBackground = v32.boolean, 
    useGridTile = v32.boolean, 
    playerCountStyle = v32.optional(v32.string), 
    isSponsoredFooterAllowed = v32.optional(v32.boolean), 
    useExperienceTileMetadata = v32.boolean, 
    hideGameStats = v32.optional(v32.boolean), 
    gameTileLayoutType = v32.optional(v32.string), 
    topicId = v32.optional(v32.string), 
    playButtonStyle = v32.optional(v32.string), 
    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v32.optional(v32.callback) else nil, 
    isDisabled = v32.optional(v32.boolean), 
    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v32.optional(v32.callback) else nil, 
    onSelectionGained = v32.optional(v32.callback), 
    onSelectionLost = v32.optional(v32.callback), 
    friendFooterEnabled = v32.optional(v32.boolean), 
    index = v32.optional(v32.number), 
    layoutOrder = v32.optional(v32.number), 
    source = v32.optional(v32.string), 
    referralSource = v32.optional(v32.string), 
    onPeekViewClosed = v32.optional(v32.callback), 
    rowNum = v32.optional(v32.number), 
    showFriendActivity = v32.boolean, 
    contentTextLineCount = v32.optional(v32.number), 
    thumbnailAspectRatioOverride = v32.optional(v32.string), 
    impressionsTag = v32.optional(v32.string), 
    launchExperienceEventContext = v32.optional(v32.string), 
    navigateToGameDetails = v32.callback, 
    isContained = v32.optional(v32.boolean), 
    hideTitle = v32.optional(v32.boolean), 
    hideMetadata = v32.optional(v32.boolean), 
    textSizeOffset = v32.optional(v32.number), 
    isUnifiedGameTile = if l_FFlagLuaAppMigrateGameTile_0 then v32.optional(v32.boolean) else nil, 
    game = v32.optional(v32.table), 
    universeId = v32.string, 
    navigationUniverseId = v32.optional(v32.string), 
    name = v32.string, 
    totalUpVotes = v32.number, 
    totalDownVotes = v32.number, 
    friendActivityTitle = v32.optional(v32.string), 
    friendVisitedString = v32.optional(v32.string), 
    thumbnail = v32.string, 
    wideThumbnail = v32.optional(v32.string), 
    hasInGameFriends = v32.boolean, 
    users = v32.optional(v32.table), 
    inGameUsersByGame = v32.optional(v32.table), 
    rating = v32.optional(v32.string), 
    showAgeRating = v32.optional(v32.boolean), 
    ageRatingText = v32.optional(v32.string), 
    friendVisits = v32.table, 
    hidePlayButton = v32.boolean, 
    footerLayoutData = v32.optional(v32.table), 
    openContextualMenu = v32.callback, 
    openSponsoredTooltip = v32.callback, 
    networking = v32.callback, 
    hoverRef = v32.table, 
    isHovered = v32.optional(v32.boolean), 
    tileBadges = v32.optional(v32.table)
});
local l_Narrow_0 = v18.GameTileLayoutType.Narrow;
v60.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    gameTileLayoutType = l_Narrow_0, 
    contentTextLineCount = v16.TileTextLines[l_Narrow_0].titleTextLines, 
    hideGameStats = false
};
v60.init = function(v62) --[[ Line: 171 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppLaunchTracker_0 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v20 (copy), v27 (copy), v15 (copy), v6 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_ContentProvider_0 (copy), l_memoize_0 (copy), v12 (copy)
    if l_FFlagLuaAppLaunchTracker_0 and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileInit();
    end;
    v62.state = {
        isHovered = false, 
        canDisplayFriendFooter = false, 
        isSelected = false
    };
    v62.reportExperienceLaunchedFromActionBar = function(...) --[[ Line: 182 ]]
        -- upvalues: v62 (copy), v20 (ref)
        v62.recordSponsoredGameClick();
        if v62.props.isHovered then
            v20.default:reset();
        end;
        if v62.props.reportExperienceLaunched then
            v62.props.reportExperienceLaunched(...);
        end;
    end;
    v62.renderAppExperienceActionRow = function(_) --[[ Line: 193 ]]
        -- upvalues: v27 (ref), v15 (ref), v62 (copy)
        return v27.createElement(v15, {
            universeId = v62.props.navigationUniverseId, 
            referralSource = v62.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = v62.reportExperienceLaunchedFromActionBar, 
            openGameDetails = v62.onActivated, 
            entry = v62.props.entry, 
            launchExperienceEventContext = v62.props.launchExperienceEventContext, 
            horizontalPadding = v62.props.useGridTile and 0 or nil, 
            index = v62.props.index
        });
    end;
    v62.onHoverChanged = function(v64) --[[ Line: 207 ]]
        -- upvalues: v62 (copy)
        v62:setState({
            isHovered = v64
        });
    end;
    v62.gameTileRef = v27.createRef();
    v62.getTilePosition = function() --[[ Line: 215 ]]
        -- upvalues: v62 (copy)
        if v62.gameTileRef.current then
            return v62.gameTileRef.current.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v62.getTileSize = function() --[[ Line: 223 ]]
        -- upvalues: v62 (copy)
        if v62.gameTileRef.current then
            return v62.gameTileRef.current.AbsoluteSize;
        else
            return nil;
        end;
    end;
    v62.recordSponsoredGameClick = function() --[[ Line: 231 ]]
        -- upvalues: v62 (copy), v6 (ref)
        local l_networking_0 = v62.props.networking;
        local l_entry_0 = v62.props.entry;
        if l_entry_0.isSponsored then
            v6(l_networking_0, l_entry_0.adId);
        end;
    end;
    v62.onActivated = function() --[[ Line: 240 ]]
        -- upvalues: v62 (copy), v20 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref)
        if v62.props.isHovered then
            v20.default:reset();
        end;
        if v62.isMounted then
            if l_FFlagLuaAppGameTileInteractionFeedback_0 and v62.props.onActivated then
                v62.props.onActivated();
            end;
            local l_navigationUniverseId_0 = v62.props.navigationUniverseId;
            local v68 = {
                source = v62.props.source, 
                index = v62.props.index, 
                referralSource = v62.props.referralSource, 
                onPeekViewClosed = v62.props.onPeekViewClosed
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            v62.props.navigateToGameDetails(l_navigationUniverseId_0, v68);
            local l_index_0 = v62.props.index;
            v62.props.reportGameDetailOpened(l_index_0, l_navigationUniverseId_0);
            v62.recordSponsoredGameClick();
        end;
    end;
    v62.onFriendFooterActivated = function() --[[ Line: 272 ]]
        -- upvalues: v62 (copy)
        if v62.isMounted then
            local l_game_0 = v62.props.game;
            local v71 = v62.getTileSize();
            v62.props.openContextualMenu(l_game_0, v71, v62.getTilePosition());
        end;
    end;
    v62.onActivateSponsoredTooltip = function() --[[ Line: 280 ]]
        -- upvalues: v62 (copy)
        if v62.isMounted then
            v62.props.openSponsoredTooltip();
        end;
    end;
    v62.loadWideThumbnail = function() --[[ Line: 288 ]]
        -- upvalues: v62 (copy), l_ContentProvider_0 (ref)
        local l_wideThumbnail_0 = v62.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function() --[[ Line: 291 ]]
                -- upvalues: l_ContentProvider_0 (ref), l_wideThumbnail_0 (copy)
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v62.getVisitedFriends = function() --[[ Line: 297 ]]
        -- upvalues: v62 (copy)
        local v73 = {};
        local l_friendVisits_0 = v62.props.friendVisits;
        for v75 = 1, #l_friendVisits_0 do
            local v76 = tostring(l_friendVisits_0[v75].userId);
            if v62.props.users and v62.props.users[v76] then
                local v77 = v62.props.users[v76];
                table.insert(v73, {
                    userId = v76, 
                    displayName = v77.displayName
                });
            end;
        end;
        return v73;
    end;
    v62.getSortedFriends = l_memoize_0(function(v78, v79) --[[ Line: 321 ]]
        -- upvalues: v62 (copy), v12 (ref)
        if not v78 or not v79 then
            return {};
        else
            local v80 = {};
            for _, v82 in pairs(v79) do
                local v83 = v78[v82];
                if v83 and v83.isFriend then
                    if v62.props.useGridTile then
                        table.insert(v80, {
                            userId = v83.id, 
                            displayName = v83.displayName
                        });
                    else
                        table.insert(v80, v83);
                    end;
                end;
            end;
            if v62.props.useGridTile then
                local v84 = v12("displayName");
                table.sort(v80, v84);
                return v80;
            else
                local v85 = v12("name");
                table.sort(v80, v85);
                return v80;
            end;
        end;
    end);
    v62.onSelectionGained = function() --[[ Line: 352 ]]
        -- upvalues: v62 (copy)
        v62:setState({
            isSelected = true
        });
        if v62.props.onSelectionGained then
            v62.props.onSelectionGained(v62.props.entry, v62.props.index, v62.props.navigationUniverseId);
        end;
    end;
    v62.onSelectionLost = function() --[[ Line: 360 ]]
        -- upvalues: v62 (copy)
        v62:setState({
            isSelected = false
        });
        if v62.props.onSelectionLost then
            v62.props.onSelectionLost();
        end;
    end;
end;
local function _(v86) --[[ Line: 372 ]] --[[ Name: getTextLiteralForTextFooter ]]
    if v86 == nil then
        return nil;
    elseif v86.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v86.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v60.renderFooter = function(v89, v90) --[[ Line: 386 ]] --[[ Name: renderFooter ]]
    -- upvalues: l_FFlagLuaAppTextFooterLegacyTile_0 (copy), v58 (copy), v27 (copy), v26 (copy), v4 (copy), v9 (copy), l_FFlagUIBloxUseNewInteractable_0 (copy), v7 (copy), l_withStyle_0 (copy), v8 (copy)
    local _ = nil;
    local l_entry_1 = v89.props.entry;
    local l_isSponsored_0 = l_entry_1.isSponsored;
    local l_inGameUsersByGame_0 = v89.props.inGameUsersByGame;
    local l_playerCount_0 = l_entry_1.playerCount;
    local l_friendActivityTitle_0 = v89.props.friendActivityTitle;
    local l_useExperienceTileMetadata_0 = v89.props.useExperienceTileMetadata;
    local v98 = l_entry_1.isShowSponsoredLabel or v89.props.isSponsoredFooterAllowed;
    if l_FFlagLuaAppTextFooterLegacyTile_0 then
        local l_footerLayoutData_0 = v89.props.footerLayoutData;
        local v100;
        if l_footerLayoutData_0 == nil then
            v100 = nil;
        elseif l_footerLayoutData_0.type ~= "TextLabel" then
            v100 = nil;
        else
            local l_text_1 = l_footerLayoutData_0.text;
            v100 = if l_text_1 == nil then nil else l_text_1.textLiteral;
        end;
        l_footerLayoutData_0 = false;
        if v100 ~= nil then
            l_footerLayoutData_0 = #v100 > 0;
        end;
        local v102 = if v58 then v89.props.useHoverTile else v89.props.useHoverTile or v89.props.useExperienceTileMetadata;
        if l_footerLayoutData_0 then
            local l_Space_250_0 = v90.Tokens.Global.Space_250;
            return v27.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Space_250_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                TextFooter = v26.createElement(v4, {
                    text = v100, 
                    useLargerFont = v102, 
                    Position = UDim2.new(0, 0, 0.5, v102 and 0 or v90.Tokens.Global.Space_75), 
                    AnchorPoint = Vector2.new(0, 0.5)
                })
            });
        end;
    end;
    if v89.props.useHoverTile or l_useExperienceTileMetadata_0 then
        local v104 = (not not v89.state.isHovered or l_useExperienceTileMetadata_0) and v89.props.showAgeRating;
        local l_ageRatingText_0 = v89.props.ageRatingText;
        local v106 = l_friendActivityTitle_0 and v89.props.showFriendActivity and not v89.state.isHovered;
        return (v27.createElement(v9, {
            isSponsored = l_isSponsored_0, 
            isShowSponsoredLabel = v98, 
            isPlayable = true, 
            requiresPurchase = false, 
            rating = v89.props.rating, 
            playingCount = l_playerCount_0, 
            coPlayFriends = l_inGameUsersByGame_0, 
            showAgeRating = v104, 
            localizedAgeRatingTextLabel = l_ageRatingText_0, 
            friendActivityTitle = l_friendActivityTitle_0, 
            showFriendActivity = v106, 
            useExperienceTileMetadata = l_useExperienceTileMetadata_0
        }));
    else
        local l_friendFooterEnabled_0 = v89.props.friendFooterEnabled;
        local l_hasInGameFriends_0 = v89.props.hasInGameFriends;
        local l_totalUpVotes_0 = v89.props.totalUpVotes;
        local l_totalDownVotes_0 = v89.props.totalDownVotes;
        local l_users_0 = v89.props.users;
        local v112 = v89.getSortedFriends(l_users_0, l_inGameUsersByGame_0);
        local v113 = nil;
        v113 = if l_FFlagUIBloxUseNewInteractable_0 then l_friendFooterEnabled_0 and l_hasInGameFriends_0 and v89.state.canDisplayFriendFooter else l_friendFooterEnabled_0 and l_hasInGameFriends_0;
        local v114 = {
            isSponsored = l_isSponsored_0, 
            isShowSponsoredLabel = v98, 
            playerCount = l_playerCount_0, 
            totalUpVotes = l_totalUpVotes_0, 
            totalDownVotes = l_totalDownVotes_0
        };
        if l_isSponsored_0 and v98 then
            return (v27.createElement(v7, {
                stats = v114, 
                hideGameStats = v89.props.hideGameStats, 
                onActivateSponsoredTooltip = v89.onActivateSponsoredTooltip
            }));
        elseif v113 then
            return (l_withStyle_0(function(v115) --[[ Line: 476 ]]
                -- upvalues: v89 (copy), l_FFlagUIBloxUseNewInteractable_0 (ref), v27 (ref), v8 (ref), v112 (copy)
                local v116 = nil;
                local v117 = v89.getTileSize();
                v116 = if l_FFlagUIBloxUseNewInteractable_0 then if v117 then v117.X else 0 else v117.X;
                local l_Color_0 = v115.Theme.BackgroundDefault.Color;
                return v27.createElement("TextButton", {
                    Text = "", 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    [v27.Event.Activated] = v89.onFriendFooterActivated
                }, {
                    UserIconList = v27.createElement(v8, {
                        users = v112, 
                        width = v116, 
                        height = 24, 
                        maskColor = l_Color_0
                    })
                });
            end));
        elseif l_friendActivityTitle_0 and v89.props.showFriendActivity then
            return (l_withStyle_0(function(v119) --[[ Line: 500 ]]
                -- upvalues: v27 (ref), l_friendActivityTitle_0 (copy)
                local l_Font_0 = v119.Font;
                local l_Theme_0 = v119.Theme;
                local l_BaseSize_0 = l_Font_0.BaseSize;
                local l_RelativeSize_0 = l_Font_0.CaptionSubHeader.RelativeSize;
                return v27.createElement("TextLabel", {
                    Text = l_friendActivityTitle_0, 
                    TextColor3 = l_Theme_0.TextMuted.Color, 
                    Font = l_Font_0.CaptionSubHeader.Font, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = l_Theme_0.TextMuted.Transparency, 
                    BackgroundTransparency = 1
                });
            end));
        else
            return (v27.createElement(v7, {
                stats = v114, 
                hideGameStats = v89.props.hideGameStats, 
                onActivateSponsoredTooltip = v89.onActivateSponsoredTooltip
            }));
        end;
    end;
end;
v60.renderGridTilesFooter = function(v124) --[[ Line: 532 ]] --[[ Name: renderGridTilesFooter ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTile_0 (copy), v26 (copy), v10 (copy), v4 (copy), v27 (copy), l_GridTileFriendFooter_0 (copy), v2 (copy), l_Images_0 (copy), v7 (copy), v16 (copy), l_FFlagLuaAppMigrateGameTileIxp_0 (copy)
    local v125 = v124.props.useHoverTile or v124.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_1 = v124.props.friendFooterEnabled;
    local l_hasInGameFriends_1 = v124.props.hasInGameFriends;
    local l_users_1 = v124.props.users;
    local l_inGameUsersByGame_1 = v124.props.inGameUsersByGame;
    local v130 = v124.getSortedFriends(l_users_1, l_inGameUsersByGame_1);
    local v131 = l_friendFooterEnabled_1 and l_hasInGameFriends_1;
    local v132 = v124.props.friendVisits and #v124.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_1 = v124.props.footerLayoutData;
    local v135;
    if l_footerLayoutData_1 == nil then
        v135 = nil;
    elseif l_footerLayoutData_1.type ~= "TextLabel" then
        v135 = nil;
    else
        local l_text_2 = l_footerLayoutData_1.text;
        v135 = if l_text_2 == nil then nil else l_text_2.textLiteral;
    end;
    if v135 == nil and (v124.props.isHovered or v124.state.isSelected) and v124.props.ageRatingText then
        v135 = v124.props.ageRatingText;
    end;
    l_footerLayoutData_1 = false;
    if v135 ~= nil then
        l_footerLayoutData_1 = #v135 > 0;
    end;
    local v137 = nil;
    if l_FFlagLuaAppMigrateGameTile_0 then
        local l_entry_2 = v124.props.entry;
        v137 = l_entry_2.isSponsored and (l_entry_2.isShowSponsoredLabel or v124.props.isSponsoredFooterAllowed);
    else
        local l_entry_3 = v124.props.entry;
        v137 = l_entry_3.isShowSponsoredLabel or l_entry_3.isSponsored or v124.props.isSponsoredFooterAllowed;
    end;
    if v137 then
        return (v26.createElement(v10, {
            useLargerFont = v125, 
            onActivateSponsoredTooltip = v124.onActivateSponsoredTooltip
        }));
    elseif l_footerLayoutData_1 then
        return (v26.createElement(v4, {
            text = v135, 
            useLargerFont = v125
        }));
    elseif v131 then
        return (v27.createElement(l_GridTileFriendFooter_0, {
            showOnlineBorder = true, 
            friends = v130, 
            useLargerFont = v125
        }));
    elseif v124.props.friendVisitedString then
        return (v27.createElement(v2, {
            icon = l_Images_0["icons/menu/recent"], 
            text = v124.props.friendVisitedString, 
            iconSize = v125 and 32 or 24, 
            useLargerFont = v125
        }));
    elseif v132 then
        return (v27.createElement(l_GridTileFriendFooter_0, {
            showOnlineBorder = false, 
            friends = v124.getVisitedFriends(), 
            useLargerFont = v125
        }));
    else
        return (v27.createElement(v7, {
            stats = {
                totalUpVotes = v124.props.totalUpVotes, 
                totalDownVotes = v124.props.totalDownVotes, 
                playerCount = if v124.props.playerCountStyle == v16.PlayerCountStyleValues.Footer then v124.props.entry.playerCount else nil
            }, 
            isGridTile = v124.props.useGridTile, 
            hideGameStats = v124.props.hideGameStats, 
            useLargerFont = v125, 
            isUnifiedGameTile = l_FFlagLuaAppMigrateGameTile_0 and not l_FFlagLuaAppMigrateGameTileIxp_0 or l_FFlagLuaAppMigrateGameTileIxp_0 and v124.props.isUnifiedGameTile or nil
        }));
    end;
end;
v60.renderContent = function(v140, v141, v142) --[[ Line: 616 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTile_0 (copy), l_FFlagLuaAppMigrateGameTileIxp_0 (copy), v16 (copy), v22 (copy), v26 (copy), v7 (copy), v14 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v15 (copy), v27 (copy), v11 (copy), l_withStyle_0 (copy), l_FFlagLuaAppTextFooterLegacyTile_0 (copy), l_IsVRAppBuild_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), v5 (copy), l_ExperienceTileV3_0 (copy)
    local v143 = v140.props.Size or UDim2.fromScale(1, 1);
    local l_useHoverTile_0 = v140.props.useHoverTile;
    local l_hasBackground_0 = v140.props.hasBackground;
    local l_wideThumbnail_1 = v140.props.wideThumbnail;
    local l_thumbnail_0 = v140.props.thumbnail;
    if l_FFlagLuaAppMigrateGameTile_0 and not l_FFlagLuaAppMigrateGameTileIxp_0 or l_FFlagLuaAppMigrateGameTileIxp_0 and v140.props.isUnifiedGameTile or v140.props.useGridTile then
        local v148 = true;
        if v140.props.playerCountStyle ~= v16.PlayerCountStyleValues.Always then
            v148 = v140.props.isHovered and v140.props.playerCountStyle == v16.PlayerCountStyleValues.Hover;
        end;
        local v149 = v22.getImageAspectRatio(v140.props.gameTileLayoutType);
        local v150 = if v140.props.hideMetadata then nil else v140:renderGridTilesFooter();
        local v151 = if v140.props.hideTitle then nil else v140.props.name;
        local v152 = if v148 then v26.createElement(v7, {
            stats = {
                playerCount = v140.props.entry.playerCount, 
                displayConcurrentUsersPill = true
            }
        }) else nil;
        local l_playButtonHeight_0 = v22.getElementSizes(v142.Tokens, v140.props.textSizeOffset, v140.props.contentTextLineCount).playButtonHeight;
        return v26.createElement("Frame", {
            Size = v143, 
            ZIndex = v140.props.ZIndex, 
            BackgroundTransparency = 1, 
            LayoutOrder = v140.props.layoutOrder, 
            ref = v140.gameTileRef
        }, {
            Tile = v26.createElement(v14, {
                hoverPadding = if not l_FFlagLuaAppMigrateGameTile_0 or v140.props.useGridTile then nil else v142.Tokens.Global.Space_100, 
                numLinesForTitle = if l_FFlagLuaAppMigrateGameTile_0 then v140.props.contentTextLineCount else nil, 
                imageAspectRatio = v149, 
                isContained = v140.props.isContained, 
                containmentSidePadding = if l_FFlagLuaAppMigrateGameTile_0 then v22.getContainmentSidePadding(v142.Tokens, v140.props.gameTileLayoutType) else nil, 
                Size = UDim2.fromScale(1, 1), 
                image = l_thumbnail_0, 
                title = v151, 
                isDisabled = v140.props.isDisabled, 
                onActivated = v140.onActivated, 
                onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v140.props.onGuiStateChanged else nil, 
                onSelectionGained = v140.onSelectionGained, 
                onSelectionLost = v140.onSelectionLost, 
                reducedMotion = v141, 
                isHovered = v140.props.isHovered, 
                forwardRef = v140.props.hoverRef, 
                hidePlayButton = v140.props.hidePlayButton, 
                hoverActionRow = if not v140.props.hidePlayButton then v26.createElement(v15, {
                    universeId = v140.props.navigationUniverseId, 
                    referralSource = v140.props.referralSource, 
                    launchSource = "ExperienceTile", 
                    reportExperienceLaunched = v140.reportExperienceLaunchedFromActionBar, 
                    openGameDetails = v140.onActivated, 
                    entry = v140.props.entry, 
                    launchExperienceEventContext = v140.props.launchExperienceEventContext, 
                    fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                    index = v140.props.index, 
                    horizontalPadding = 0, 
                    verticalPadding = 0, 
                    height = l_playButtonHeight_0, 
                    showButtonText = v149 > 1
                }) else nil, 
                thumbnailOverlay = if v140.props.tileBadges then v27.createFragment({
                    SocialFeaturePill = v152, 
                    Badge = v26.createElement(v11, {
                        tileBadgesByPosition = v140.props.tileBadges
                    })
                }) else v152, 
                footerMetadata = v150, 
                textSizeOffset = v140.props.textSizeOffset
            })
        });
    else
        return l_withStyle_0(function(v154) --[[ Line: 712 ]]
            -- upvalues: v140 (copy), l_thumbnail_0 (copy), l_wideThumbnail_1 (copy), l_FFlagLuaAppTextFooterLegacyTile_0 (ref), l_useHoverTile_0 (copy), l_IsVRAppBuild_0 (ref), l_hasBackground_0 (copy), v27 (ref), v143 (copy), l_withGridConfig_DEPRECATED_0 (ref), v5 (ref), v141 (copy), l_ExperienceTileV3_0 (ref)
            local v155 = {
                experienceName = v140.props.name, 
                thumbnail = l_thumbnail_0, 
                wideThumbnail = l_wideThumbnail_1, 
                footer = if l_FFlagLuaAppTextFooterLegacyTile_0 then v140:renderFooter(v154) else v140:renderFooter(), 
                thumbnailAspectRatioOverride = v140.props.thumbnailAspectRatioOverride, 
                contentTextLineCount = v140.props.contentTextLineCount, 
                isDisabled = v140.props.isDisabled, 
                onActivated = v140.onActivated, 
                onSelectionGained = v140.onSelectionGained, 
                onSelectionLost = v140.onSelectionLost, 
                isHoverEnabled = l_useHoverTile_0 and not l_IsVRAppBuild_0(), 
                onHoverChanged = if l_useHoverTile_0 then v140.onHoverChanged else nil, 
                hoverDelay = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                hasBackground = l_hasBackground_0, 
                hasOutline = l_hasBackground_0, 
                renderActionRow = if l_useHoverTile_0 then v140.renderAppExperienceActionRow else nil, 
                styleProps = {
                    bottomContentPadding = {
                        Left = if l_hasBackground_0 then v154.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Leading else 0, 
                        Right = if l_hasBackground_0 then v154.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Trailing else 0, 
                        Top = v154.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                        Bottom = v154.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
                    }
                }
            };
            return (v27.createElement("Frame", {
                Size = v143, 
                BackgroundTransparency = 1, 
                LayoutOrder = v140.props.layoutOrder, 
                ZIndex = v140.props.ZIndex, 
                [v27.Ref] = v140.gameTileRef
            }, {
                Tile = l_withGridConfig_DEPRECATED_0({
                    gutter = 0, 
                    hoverTileTopOffset = 0, 
                    hoverTileBottomOffset = 0, 
                    hoverTileHorizontalOffset = 0
                })(function(v156) --[[ Line: 756 ]]
                    -- upvalues: v27 (ref), v5 (ref), v140 (ref), v141 (ref), l_ExperienceTileV3_0 (ref), v155 (copy)
                    return v27.createElement(v5, {
                        isZoomEnabled = v140.state.isHovered, 
                        expansionOffsetX = v156.gutter + v156.hoverTileHorizontalOffset, 
                        expansionOffsetTop = v156.hoverTileTopOffset, 
                        expansionOffsetBottom = v156.hoverTileBottomOffset, 
                        reducedMotion = v141
                    }, {
                        BaseTile = v27.createElement(l_ExperienceTileV3_0, v155)
                    });
                end)
            }));
        end);
    end;
end;
v60.render = function(v157) --[[ Line: 771 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppLaunchTracker_0 (copy), l_DiscoveryAppLaunchTracker_0 (copy), l_withStyle_0 (copy)
    if l_FFlagLuaAppLaunchTracker_0 and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileRender();
    end;
    if v157.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v158) --[[ Line: 781 ]]
            -- upvalues: v157 (copy)
            local l_ReducedMotion_0 = v158.Settings.ReducedMotion;
            return v157:renderContent(l_ReducedMotion_0, v158);
        end);
    end;
end;
v60.didMount = function(v160) --[[ Line: 787 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy), l_FFlagUIBloxUseNewInteractable_0 (copy)
    v160.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v160.gameTileRef, v160.props.impressionsTag, v160.props.index);
    if l_FFlagUIBloxUseNewInteractable_0 and not v160.props.useGridTile and v160.props.friendFooterEnabled and v160.props.hasInGameFriends then
        v160:setState({
            canDisplayFriendFooter = true
        });
    end;
    if v160.props.useGridTile then
        v160.loadWideThumbnail();
    end;
end;
v60.willUnmount = function(v161) --[[ Line: 804 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v161.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v161.gameTileRef, v161.props.impressionsTag, v161.props.index);
end;
v60.didUpdate = function(v162, v163) --[[ Line: 809 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy), l_FFlagUIBloxUseNewInteractable_0 (copy)
    if v163.impressionsTag ~= v162.props.impressionsTag or v163.index ~= v162.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v162.gameTileRef, v163.impressionsTag, v163.index);
        l_ImpressionsTagUtility_0.AddTag(v162.gameTileRef, v162.props.impressionsTag, v162.props.index);
    end;
    if v162.props.useGridTile and v163.universeId ~= v162.props.universeId then
        v162.loadWideThumbnail();
    end;
    if l_FFlagUIBloxUseNewInteractable_0 and not v162.props.useGridTile and (v163.friendFooterEnabled ~= v162.props.friendFooterEnabled or v163.hasInGameFriends ~= v162.props.hasInGameFriends) and v162.props.friendFooterEnabled and v162.props.hasInGameFriends then
        v162:setState({
            canDisplayFriendFooter = true
        });
    end;
end;
local v170 = l_memoize_0(function(v164, v165, v166) --[[ Line: 836 ]]
    if not v164 or not v165 or not v166 then
        return false;
    else
        for _, v168 in pairs(v166) do
            if v168 ~= v164 then
                local v169 = v165[v168];
                if v169 and v169.isFriend then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end);
local function _(v171, v172) --[[ Line: 852 ]] --[[ Name: formatRating ]]
    if v171 + v172 == 0 then
        return "--";
    else
        return tostring((math.floor(v171 / (v171 + v172) * 100 + 0.5))) .. "%";
    end;
end;
local function _(v174, v175) --[[ Line: 860 ]] --[[ Name: getWideThumbnail ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_game_EngineFeature_0 (copy)
    if v174 and v174 ~= "0" then
        if l_game_EngineFeature_1 then
            return (("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v174));
        elseif l_game_EngineFeature_0 then
            return (("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(v174));
        end;
    end;
    return (("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(v175));
end;
local function _(v177, v178) --[[ Line: 871 ]] --[[ Name: getSquareGameIcon ]]
    if v177 then
        return v177;
    else
        return (("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(v178));
    end;
end;
v60 = v28.connect(function(v180, v181) --[[ Line: 881 ]]
    -- upvalues: l_GameInfosReducer_0 (copy), v16 (copy), v21 (copy), l_game_EngineFeature_1 (copy), l_game_EngineFeature_0 (copy), l_GameIconReducer_0 (copy), v23 (copy), v170 (copy), l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 (copy)
    local l_universeId_0 = v181.entry.universeId;
    local v183 = if v181.entry.navigationUniverseId and v181.entry.navigationUniverseId ~= "" and v181.entry.navigationUniverseId ~= "0" then v181.entry.navigationUniverseId else v181.entry.universeId;
    local v184 = v180.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    local v185 = v184 and v184.totalUpVotes or 0;
    local v186 = v184 and v184.totalDownVotes or 0;
    local v187 = v184 and v184.friendActivityTitle or nil;
    local v188 = nil;
    local v189 = nil;
    local v190 = v184 and v184.minimumAge or 0;
    local v191 = v184 and v184.ageRecommendationDisplayName or "";
    local v192 = nil;
    v192 = if v181.gameTileLayoutType == "Event" then v181.playButtonStyle ~= v16.PlayButtonStyleValues.Enabled else v181.gameTileLayoutType == "Wide" and v181.playButtonStyle == v16.PlayButtonStyleValues.Disabled;
    if v192 then
        v188 = false;
    elseif v190 ~= 0 and v191 ~= "" then
        v188 = true;
        v189 = v191;
    else
        v188 = false;
    end;
    local v193 = v21(v184, v181.topicId);
    local v194 = v193 and v193.primaryMediaAsset and v193.primaryMediaAsset.wideImageAssetId or v184 and v184.primaryWideAssetId or nil;
    local l_placeId_0 = v181.entry.placeId;
    local v196 = if v194 and v194 ~= "0" then if l_game_EngineFeature_1 then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v194) else if l_game_EngineFeature_0 then ("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(v194) else ("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(l_placeId_0) else ("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(l_placeId_0);
    l_placeId_0 = v180[l_GameIconReducer_0.key][l_universeId_0] and v180[l_GameIconReducer_0.key][l_universeId_0].url or nil;
    local v197 = if v181.useGridTile then v196 else l_placeId_0 or ("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(l_universeId_0);
    local v198 = if not not v181.useHoverTile or v181.useExperienceTileMetadata then v185 + v186 == 0 and "--" or tostring((math.floor(v185 / (v185 + v186) * 100 + 0.5))) .. "%" else nil;
    local v199 = v184 and v184.friendVisits or {};
    local v200 = if v184 and v184.friendVisitedString ~= "" then v184.friendVisitedString else nil;
    local v201 = v193 and v193.footer or nil;
    local v202 = v193 and v193.title or v184 and v184.name or "";
    local v203 = if v193 and v193.tileBadgesByPosition then v23(v193.tileBadgesByPosition) else nil;
    return {
        game = v184, 
        universeId = l_universeId_0, 
        navigationUniverseId = v183, 
        name = v202, 
        totalUpVotes = v185, 
        totalDownVotes = v186, 
        thumbnail = v197, 
        wideThumbnail = v196, 
        friendActivityTitle = v187, 
        hasInGameFriends = v170(v180.LocalUserId, v180.Users, v180.InGameUsersByGame[l_universeId_0]), 
        users = v180.Users, 
        inGameUsersByGame = v180.InGameUsersByGame[l_universeId_0], 
        rating = v198, 
        showAgeRating = v188, 
        ageRatingText = v189, 
        friendVisits = v199, 
        friendVisitedString = v200, 
        hidePlayButton = v192, 
        footerLayoutData = v201, 
        tileBadges = if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then nil else v203
    };
end, function(v204) --[[ Line: 979 ]]
    -- upvalues: v13 (copy), v17 (copy)
    return {
        openContextualMenu = function(v205, v206, v207) --[[ Line: 981 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v204 (copy), v13 (ref)
            v204(v13(v205, v206, v207));
        end, 
        openSponsoredTooltip = function() --[[ Line: 984 ]] --[[ Name: openSponsoredTooltip ]]
            -- upvalues: v204 (copy), v17 (ref)
            return v204(v17());
        end
    };
end)(v60);
v60 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v60);
return function(v208) --[[ Line: 994 ]]
    -- upvalues: v26 (copy), l_IsVRAppBuild_0 (copy), v19 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 (copy), v24 (copy), v60 (ref), v29 (copy)
    local v209 = v26.useRef(nil);
    local v210 = not l_IsVRAppBuild_0() and v208.useHoverTile;
    local v211 = ("%*_%*_%*"):format(v208.impressionsTag or "", v208.index or "0", v208.gameTileLayoutType or "Narrow");
    if v208.impressionsTag == nil or v208.index == nil then
        v210 = false;
    end;
    local v212 = v19(v209, v211, v210);
    local v213 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v214 = v213 and true or v208.useHoverTile;
    local v215 = nil;
    v215 = if v208.useExperienceTileMetadata ~= nil then v208.useExperienceTileMetadata else v213;
    local v216 = if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then v24(v208.entry.universeId, v208.topicId) else nil;
    return v26.createElement(v60, v29.Dictionary.join(v208, {
        useExperienceTileMetadata = v215, 
        hasBackground = v214, 
        hoverRef = v209, 
        isHovered = v212, 
        tileBadges = if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then v216 else nil
    }));
end;