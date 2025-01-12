local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v3 = game:DefineFastString("LuaAppCollectionViewsExpLayer", l_AppUserLayers_0.GridUILayer);
local function _(v4) --[[ Line: 13 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
    -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v3_0 = v3;
    local v6 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_0, true);
    if v6 and v6[v4] ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_0);
        return v6[v4];
    else
        return false;
    end;
end;
return {
    getIsPYMKCollectionCarouselEnabled = function() --[[ Line: 25 ]] --[[ Name: getIsPYMKCollectionCarouselEnabled ]]
        -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v3_1 = v3;
        local v9 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_1, true);
        if v9 and v9.IsPYMKCollectionCarouselEnabled ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_1);
            return v9.IsPYMKCollectionCarouselEnabled;
        else
            return false;
        end;
    end, 
    getIsFriendCollectionCarouselEnabled = function() --[[ Line: 28 ]] --[[ Name: getIsFriendCollectionCarouselEnabled ]]
        -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v3_2 = v3;
        local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_2, true);
        if v11 and v11.IsFriendCollectionCarouselEnabled ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_2);
            return v11.IsFriendCollectionCarouselEnabled;
        else
            return false;
        end;
    end
};