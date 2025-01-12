local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppGameTileMigrationExpLayer", "PlayerApp.HomePage.UX.TileLayer");
local function _(v3) --[[ Line: 8 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
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
    getIsTileMigrationEnabled = function() --[[ Line: 20 ]] --[[ Name: getIsTileMigrationEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_1 = v2;
        local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_1, true);
        if v8 and v8.IsTileMigrationEnabled ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_1);
            return v8.IsTileMigrationEnabled;
        else
            return false;
        end;
    end
};