local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v8 = require(l_Parent_0.RoactServiceTags);
local l_AppLogging_0 = v8.AppLogging;
local l_RoactNetworking_0 = v8.RoactNetworking;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_parseBooleanString_0 = require(l_Parent_0.DiscoveryUtils).parseBooleanString;
local l_GameCollectionGrid_0 = require(l_Parent_0.GameCollections).GameCollectionGrid;
local l_PlaceholderGameGrid_0 = require(l_Parent_0.GameCollections).PlaceholderGameGrid;
local v17 = require(l_Parent_0.DiscoveryTypes);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local _ = require(l_Parent_0.GameTile);
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v24 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
local v25 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v26 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v27 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRowData);
local v28 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRowData);
local v29 = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds);
local v30 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v31 = game:DefineFastInt("GameGridFlexFeedItemTileNumPerFeed", 30);
local v32 = game:DefineFastFlag("GameGridFlexFeedItemNoCompatibility", false);
local v33 = game:DefineFastInt("GameGridMetaFetchMaxCompatibility", 300);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v17.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v17.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v36) --[[ Line: 55 ]]
    -- upvalues: v30 (copy), v26 (copy), l_parseBooleanString_0 (copy), l_AppPage_0 (copy), v2 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_useDispatch_0 (copy), v31 (copy), v29 (copy), v32 (copy), v25 (copy), v24 (copy), v33 (copy), l_mutedError_0 (copy), v3 (copy), l_dependencyArray_0 (copy), v28 (copy), v27 (copy), l_GameCollectionGrid_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_PlaceholderGameGrid_0 (copy)
    local l_verticalScrollingFrameRef_0 = v36[v30.key].verticalScrollingFrameRef;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    local v42 = "Narrow";
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    if v36.topicLayoutData then
        v40 = v36.topicLayoutData[v26.TopicLayoutDataKeys.ComponentType];
        if v40 then
            if v40 == v26.ComponentTypeDataKeys.EventTile then
                v42 = "Event";
            elseif v40 == v26.ComponentTypeDataKeys.GridTile then
                v42 = "Wide";
            end;
            local v46 = true;
            if v42 ~= "Wide" then
                v46 = v42 == "Event";
            end;
            v38 = v46;
        end;
        v39 = v36.topicLayoutData[v26.TopicLayoutDataKeys.PlayerCountStyle];
        v41 = v36.topicLayoutData[v26.TopicLayoutDataKeys.PlayButtonStyle];
        v43 = l_parseBooleanString_0(v36.topicLayoutData[v26.TopicLayoutDataKeys.HideTileMetadata]);
        v44 = l_parseBooleanString_0(v36.topicLayoutData[v26.TopicLayoutDataKeys.HideTileTitle]);
        v45 = l_parseBooleanString_0(v36.topicLayoutData[v26.TopicLayoutDataKeys.ContainedTile]);
    end;
    local v47 = nil;
    if v36.topicLayoutData then
        local v48 = v36.topicLayoutData[v26.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v49 = false;
        if v48 ~= nil then
            v49 = v48 == "true";
        end;
        v47 = v49;
    end;
    local l_appPage_0 = v36[v30.key].appPage;
    assert(l_appPage_0 == l_AppPage_0.Home, "component only supports the Home Page");
    local l_topicId_0 = v36.topicId;
    local l_feedItemPosition_0 = v36[v30.key].feedItemPosition;
    local l_sortIndex_0 = v36.sortIndex;
    local v54 = v36.topicName or "";
    local l_numberOfRows_0 = v36.numberOfRows;
    local v56, v57 = v2.useState(1);
    local v59 = l_useAppPolicy_0(function(v58) --[[ Line: 105 ]]
        return v58.useGridPageLayout();
    end);
    local v60 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v59 = v59 and not v60;
    local v61 = v2.useRef(false);
    local v62 = l_useRoactService_0(l_RoactNetworking_0);
    local v63 = l_useRoactService_0(l_AppLogging_0);
    local v65 = l_useSelector_0(function(v64) --[[ Line: 118 ]]
        return v64.FormFactor;
    end);
    local v67 = l_useSelector_0(function(v66) --[[ Line: 122 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v66.Personalization[l_TopicContentsReducer_0.key];
    end);
    local v70 = l_useSelector_0(function(v68) --[[ Line: 126 ]]
        -- upvalues: l_appPage_0 (copy)
        local v69 = v68.OmniRecommendations[l_appPage_0];
        if v69 then
            return v69.sorts;
        else
            return {};
        end;
    end);
    local v71 = l_useDispatch_0();
    local v72 = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else math.floor(v31 / v56);
    local v73 = v29(v36.topicId, l_feedItemPosition_0, v56, v72);
    local v82 = v2.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: l_topicId_0 (copy), v67 (copy), v32 (ref), v61 (copy), v70 (copy), v71 (copy), v25 (ref), v24 (ref), v62 (copy), l_appPage_0 (copy), l_sortIndex_0 (copy), v33 (ref), v63 (copy), l_mutedError_0 (ref), v73 (copy), v3 (ref)
        local v74 = nil;
        if l_topicId_0 then
            v74 = v67 and v67[l_topicId_0] or nil;
        end;
        local v75 = v74 and v74.entries or {};
        if not v32 then
            if v61.current then
                return v75;
            else
                local v76 = 0;
                for _, v78 in ipairs(v70) do
                    if v78.topicId == l_topicId_0 then
                        v76 = v76 + 1;
                    end;
                end;
                if v76 <= 1 then
                    v61.current = true;
                    v71((v25((v24(v62, l_appPage_0, l_sortIndex_0, v33, v63)))));
                    return v75;
                end;
            end;
        elseif v74 and v74.hasMoreRows then
            l_mutedError_0("Infinite SortlessGrid should have full topic entries in every feed");
        end;
        local v79 = {};
        local v80 = v73 and v73.firstIndex or nil;
        if v80 ~= nil then
            local v81 = v80 + (v73 and v73.numberOfTiles or 0);
            while v80 <= #v75 and v80 < v81 do
                table.insert(v79, (v3.Dictionary.join(v75[v80], {
                    topicContentsIndex = v80
                })));
                v80 = v80 + 1;
            end;
        end;
        return v79;
    end, l_dependencyArray_0(l_topicId_0, v67, v70, v73));
    local v85 = l_useSelector_0(function(v83) --[[ Line: 202 ]]
        -- upvalues: l_appPage_0 (copy), l_feedItemPosition_0 (copy)
        local v84 = v83.Personalization.OmniItemsRowData[l_appPage_0] or {};
        if l_feedItemPosition_0 then
            return v84[l_feedItemPosition_0];
        else
            return nil;
        end;
    end);
    local v86 = v85 and v85.feedItem or nil;
    v2.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: v82 (copy), v56 (copy), v71 (copy), v28 (ref), l_appPage_0 (copy), l_feedItemPosition_0 (copy), v27 (ref)
        local v87 = math.ceil(#v82 / v56);
        v71(v28(l_appPage_0, l_feedItemPosition_0, v87));
        return function() --[[ Line: 216 ]]
            -- upvalues: v71 (ref), v27 (ref), l_appPage_0 (ref), l_feedItemPosition_0 (ref)
            v71(v27(l_appPage_0, l_feedItemPosition_0));
        end;
    end, l_dependencyArray_0(l_appPage_0, v82, l_feedItemPosition_0, v56, v86));
    if #v82 > 0 then
        return v2.createElement(l_GameCollectionGrid_0, {
            entries = v82, 
            title = v54, 
            friendFooterEnabled = true, 
            sortIndex = l_sortIndex_0, 
            gameSortId = l_topicId_0, 
            pageContext = l_appPage_0, 
            scrollViewPositionChangedSignal = v36[v30.key].scrollViewPositionChangedSignal, 
            onItemsPerRowChanged = v57, 
            useGridTiles = v38, 
            playerCountStyle = v39, 
            isSponsoredFooterAllowed = v47, 
            componentType = v40, 
            gameTileLayoutType = v42, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            itemRowData = v85, 
            maxNumRows = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else nil, 
            playButtonStyle = v41, 
            sideMargin = if v65 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            shouldHideTileMetadata = v43, 
            shouldHideTileTitle = v44, 
            containedTile = v45
        });
    elseif v73 == nil then
        return (v2.createElement(l_PlaceholderGameGrid_0, {
            title = v54, 
            onItemsPerRowChanged = v57, 
            useGridTiles = v38, 
            componentType = v40, 
            gameTileLayoutType = v42, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            numRows = l_numberOfRows_0 or 0, 
            sideMargin = if v65 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            shouldHideTileMetadata = v43, 
            shouldHideTileTitle = v44, 
            containedTile = v45
        }));
    else
        return nil;
    end;
end;