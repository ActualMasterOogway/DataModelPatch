local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v1.TOOLTIP_GAME_ENGINE_FEATURE);
return {
    getKey = function(v3) --[[ Line: 7 ]] --[[ Name: getKey ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v1 (copy)
        if not l_game_EngineFeature_0 then
            return true;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
                -- upvalues: v3 (copy), v1 (ref)
                return v3:GetItem(v1.TOOLTIP_APP_STORAGE_KEY);
            end);
            if l_status_0 then
                return l_result_0 == "true";
            else
                return false;
            end;
        end;
    end, 
    updateKey = function(v6, v7) --[[ Line: 23 ]] --[[ Name: updateKey ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v1 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            pcall(function() --[[ Line: 28 ]]
                -- upvalues: v6 (copy), v1 (ref), v7 (copy)
                v6:SetItem(v1.TOOLTIP_APP_STORAGE_KEY, (tostring(v7)));
                v6:Flush();
            end);
            return;
        end;
    end
};