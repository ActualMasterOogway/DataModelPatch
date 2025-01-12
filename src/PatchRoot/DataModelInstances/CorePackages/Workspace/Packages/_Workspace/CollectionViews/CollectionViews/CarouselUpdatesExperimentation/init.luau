local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppCarouselUpdatesExpLayer", "PlayerApp.GridUI");
local function _(v3) --[[ Line: 7 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_0 = v2;
    local v5 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_0, true);
    if v5 and v5[v3] ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_0);
        return v5[v3];
    else
        return false;
    end;
end;
return {
    getIsUpdatedHeaderEnabled = function() --[[ Line: 19 ]] --[[ Name: getIsUpdatedHeaderEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_1 = v2;
        local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_1, true);
        if v8 and v8.IsUpdatedHeaderEnabled ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_1);
            return v8.IsUpdatedHeaderEnabled;
        else
            return false;
        end;
    end, 
    getIsDesktopScrollable = function() --[[ Line: 22 ]] --[[ Name: getIsDesktopScrollable ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_2 = v2;
        local v10 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_2, true);
        if v10 and v10.IsDesktopScrollable ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_2);
            return v10.IsDesktopScrollable;
        else
            return false;
        end;
    end
};