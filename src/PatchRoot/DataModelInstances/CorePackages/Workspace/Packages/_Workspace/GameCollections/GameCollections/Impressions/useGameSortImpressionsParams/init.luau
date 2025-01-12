local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local _ = require(l_Parent_0.DiscoveryTypes);
local v7 = require(script.Parent.SendGameImpressions);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local function _(v9, v10) --[[ Line: 20 ]] --[[ Name: getGameSetTypeId ]]
    if v9 ~= nil then
        if v10 then
            return v9.topicId;
        else
            return v9.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v12, v13) --[[ Line: 32 ]] --[[ Name: getGameSetTargetId ]]
    if not v13 and v12 ~= nil then
        return v12.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v15, v16) --[[ Line: 42 ]] --[[ Name: getAppliedFilters ]]
    if not v16 and v15 then
        return v15.appliedFilters;
    else
        return nil;
    end;
end;
return function(v18, v19, v20, v21, v22, v23, v24, _, v26, v27, v28, v29) --[[ Line: 58 ]] --[[ Name: useGameSortImpressionsParams ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), v1 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v7 (copy), l_Signal_0 (copy)
    local v30 = l_useRoactService_0(l_AppEventIngestService_0);
    local v31 = l_useRoactService_0(l_RoactAnalytics_0);
    local v37 = v1.useCallback(function(v32) --[[ Line: 76 ]]
        -- upvalues: v29 (copy), v18 (copy), v19 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), v7 (ref), v30 (copy), v31 (copy), v21 (copy), v20 (copy), v28 (copy), v24 (copy), v27 (copy), v22 (copy), v23 (copy)
        if v29 ~= nil then
            local l_v18_0 = v18;
            local l_v19_0 = v19;
            local v35 = if l_v18_0 ~= nil then if l_v19_0 then l_v18_0.topicId else l_v18_0.gameSetTypeId else nil;
            l_v19_0 = v18;
            l_v18_0 = if not v19 and l_v19_0 ~= nil then l_v19_0.gameSetTargetId else nil;
            if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
                local l_v18_1 = v18;
                l_v19_0 = if not v19 and l_v18_1 then l_v18_1.appliedFilters else nil;
            else
                l_v19_0 = nil;
            end;
            v7.sendFromTopicContents(v30, v31, v32, v29, v21, v35, v20, v28, l_v18_0, v24, v27, v22, v23, if l_FFlagLuaAppTopChartsFiltersEnabled_0 then l_v19_0 else nil);
        end;
    end, {
        v30, 
        v31, 
        v20, 
        v22, 
        v23, 
        v19, 
        v18, 
        v21, 
        v27, 
        v28, 
        v24, 
        v29
    });
    local v38 = v1.useRef(nil);
    if v38.current == nil then
        v38.current = l_Signal_0.new();
    end;
    local l_current_0 = v38.current;
    v1.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: l_current_0 (copy), v26 (copy)
        l_current_0:fire();
        local v40 = nil;
        if v26 then
            v40 = v26:connect(function() --[[ Line: 133 ]]
                -- upvalues: l_current_0 (ref)
                l_current_0:fire();
            end);
        end;
        return function() --[[ Line: 138 ]]
            -- upvalues: v40 (ref)
            if v40 then
                v40:disconnect();
            end;
        end;
    end, {
        v26, 
        l_current_0
    });
    return v37, l_current_0, (v1.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: l_current_0 (copy)
        l_current_0:fire();
    end, {
        l_current_0
    }));
end;