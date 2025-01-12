local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.CollectionViews);
local v4 = require(l_script_FirstAncestor_0.Common.sortEventsByStartDate);
local l_useGetGameTileHeight_0 = require(l_script_FirstAncestor_0.Parent.GameCollections).useGetGameTileHeight;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_script_FirstAncestor_0.Parent.Style).useDesignTokens;
local l_FrameBoundsImpressionsTracker_0 = require(l_script_FirstAncestor_0.Parent.Impressions).FrameBoundsImpressionsTracker;
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionImpressionsSignal_0 = v3.useCollectionImpressionsSignal;
local l_AppUserLayers_0 = require(l_script_FirstAncestor_0.Parent.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment).useUserExperiment;
local l_FFlagFixEventTileDesign_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagFixEventTileDesign;
local l_FFlagEnableEventsRedesignExperiment_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableEventsRedesignExperiment;
local v15 = game:DefineFastFlag("EventUseBottomButtonByDefault", false);
local v16 = require(script.Parent.EventTile);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
return function(v19) --[[ Line: 48 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagEnableEventsRedesignExperiment_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v15 (copy), l_useCallback_0 (copy), v2 (copy), v16 (copy), l_useGetGameTileHeight_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useEffect_0 (copy), l_CollectionCarousel_0 (copy), l_FFlagFixEventTileDesign_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v20 = l_useDesignTokens_0();
    local v22 = if l_FFlagEnableEventsRedesignExperiment_0 then l_useUserExperiment_0({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v21) --[[ Line: 52 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v21[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {}).eventComponentUseBottomButton;
    end, false) else nil;
    local v23 = v15 or v22;
    local v28 = l_useCallback_0(function(v24, v25, v26, _) --[[ Line: 59 ]]
        -- upvalues: v2 (ref), v16 (ref), v19 (copy), v23 (copy)
        return v2.createElement(v16, {
            Event = v24, 
            DefaultThumbnail = v19.defaultThumbnail, 
            onJoinEvent = v19.onJoinEvent, 
            onRsvpChanged = v19.onRsvpChanged, 
            onTileActivated = v19.onTileActivated, 
            impressionsTag = "EventsListCarousel", 
            layoutOrder = v25, 
            size = v26, 
            footerButtonEnabled = v23
        }), v24.id;
    end, {
        v19.defaultThumbnail, 
        v19.onJoinEvent, 
        v19.onRsvpChanged, 
        v19.onTileActivated
    });
    local v29 = l_useGetGameTileHeight_0(false, "Event", true, false, false, nil, if v23 then v20.Global.Size_350 + v20.Global.Space_100 else 0);
    local v30 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EventsListTitle"
    });
    local v31 = v4(v19.virtualEvents);
    local v32 = v2.useRef({});
    local v37 = l_useCallback_0(function(v33) --[[ Line: 90 ]]
        -- upvalues: v31 (copy), v32 (copy), v19 (copy)
        for _, v35 in v33 do
            local v36 = v31[v35];
            if not v32.current[v36.id] then
                v32.current[v36.id] = true;
                v19.onEventImpression(v36);
            end;
        end;
    end, {
        v19.onEventImpression, 
        v31
    });
    local v38 = v2.useRef(nil);
    local v39, v40 = l_useCollectionImpressionsSignal_0();
    local v41, v42 = v2.useState(os.clock());
    l_useEffect_0(function() --[[ Line: 103 ]]
        -- upvalues: v42 (copy)
        v42(os.clock());
    end, {
        v19.virtualEvents
    });
    if #v19.virtualEvents == 0 then
        return nil;
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ClipsDescendants = not v19.peekViewFormat, 
            LayoutOrder = v19.layoutOrder
        }, {
            EventsCarousel = v2.createElement(l_CollectionCarousel_0, {
                scrollingFrameRef = v38, 
                title = v30.title, 
                hideHeaderButton = true, 
                items = v31, 
                renderItem = v28, 
                getItemHeight = v29, 
                onViewableItemsChanged = v40, 
                onChangeCanvasPosition = v40, 
                numColumns = v19.peekViewFormat and 1 or 2, 
                columnGap = v20.Global.Space_150, 
                maxItemsToShow = if l_FFlagFixEventTileDesign_0 then nil else 4, 
                fractionalItemAmount = 0.33, 
                sideMargin = 0
            }), 
            FrameBoundsImpressionsTracker = v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                pageContext = v19.referralSource, 
                parentRef = v38, 
                impressionsTag = "EventsListCarousel", 
                scrollViewPositionChangedSignal = v39, 
                sendImpressions = v37, 
                dataUpdatedTimestamp = v41
            })
        });
    end;
end;