local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_gamePlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gamePlayIntent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_feedScroll_0 = require(l_Parent_0.ScrollTelemetry).feedScroll;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local function _(v11, v12) --[[ Line: 21 ]] --[[ Name: getGameSetTypeId ]]
    if v11 ~= nil then
        if v12 then
            return v11.topicId;
        else
            return v11.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v14, v15) --[[ Line: 33 ]] --[[ Name: getGameSetTargetId ]]
    if not v15 and v14 ~= nil then
        return v14.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v17, v18) --[[ Line: 43 ]] --[[ Name: getAppliedFilters ]]
    if not v18 and v17 then
        return v17.appliedFilters;
    else
        return nil;
    end;
end;
return function(v20, v21, v22, v23, v24, v25) --[[ Line: 56 ]] --[[ Name: useGameSortAnalytics ]]
    -- upvalues: l_useStore_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v1 (copy), l_mutedError_0 (copy), l_gamePlayIntent_0 (copy), l_feedScroll_0 (copy)
    local v26 = l_useStore_0();
    local v27 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v28 = l_useRoactService_0(l_AppEventIngestService_0);
    local v29 = if v20 ~= nil then if v21 then v20.topicId else v20.gameSetTypeId else nil;
    local v30 = if not v21 and v20 ~= nil then v20.gameSetTargetId else nil;
    local v31 = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then if not v21 and v20 then v20.appliedFilters else nil else nil;
    return v1.useCallback(function(v32, v33) --[[ Line: 74 ]]
        -- upvalues: v25 (copy), l_mutedError_0 (ref), v27 (copy), v29 (copy), v30 (copy), v22 (copy), v23 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), v31 (copy)
        if v32 ~= nil and v25 ~= nil then
            local v34 = v25[v32];
            if not v34 then
                l_mutedError_0("reportGameDetailOpened requires a valid entry");
            end;
            v27.reportOpenGameDetailWithId(v34.placeId, v29, v30, v22, v32, #v25, v34.isSponsored, v34.universeId, v23, v33, if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v31 else nil, v34.topicContentsIndex or v32);
        end;
    end, {
        v27, 
        v22, 
        v23, 
        v29, 
        v30, 
        v25
    }), v1.useCallback(function(v35, v36, _, v38, v39) --[[ Line: 109 ]]
        -- upvalues: l_gamePlayIntent_0 (ref), v28 (copy), v22 (copy), v29 (copy), v30 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), v31 (copy)
        l_gamePlayIntent_0(v28, v38, {
            placeId = v35.placeId, 
            rootPlaceId = tonumber(v35.placeId), 
            universeId = v35.universeId, 
            sortIndex = tostring(v22), 
            sortEntryIndex = if v39 then tostring(v39) else nil, 
            referralSource = v36, 
            gameSetTypeId = v29, 
            gameSetTargetId = v30, 
            appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v31 else nil, 
            topicDataPosition = v35.topicContentsIndex or v39
        });
    end, {
        v22, 
        v28, 
        v29, 
        v30
    }), v1.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v27 (copy), v29 (copy), v30 (copy), v22 (copy)
        v27.reportSeeAllWithId(v29, v30, v22);
    end, {
        v27, 
        v29, 
        v30, 
        v22
    }), (v1.useCallback(function(v40, v41, v42) --[[ Line: 146 ]]
        -- upvalues: v24 (copy), l_mutedError_0 (ref), v26 (copy), v22 (copy), v29 (copy), v30 (copy), l_feedScroll_0 (ref), v28 (copy), v23 (copy)
        if v24 and v24.current ~= nil then
            local l_ScrollingDirection_0 = v24.current.ScrollingDirection;
            local v44 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v44 = v24.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v44 = v24.current.AbsoluteSize.Y;
            else
                l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
            end;
            local l_ScreenSize_0 = v26:getState().ScreenSize;
            local v46 = {
                distance = v40, 
                screenSizeX = l_ScreenSize_0.X, 
                screenSizeY = l_ScreenSize_0.Y, 
                scrollAreaSize = v44, 
                scrollDepth = if v44 > 0 then v40 / v44 else nil, 
                startDepth = if v44 > 0 then v42 / v44 else nil, 
                startPos = v42, 
                scrollDuration = v41, 
                sortPos = v22, 
                gameSetTypeId = v29, 
                gameSetTargetId = v30
            };
            l_feedScroll_0(v28, v23, l_ScrollingDirection_0, v46);
        end;
    end, {
        v28, 
        v22, 
        v23, 
        v24, 
        v29, 
        v30, 
        v26
    }));
end;