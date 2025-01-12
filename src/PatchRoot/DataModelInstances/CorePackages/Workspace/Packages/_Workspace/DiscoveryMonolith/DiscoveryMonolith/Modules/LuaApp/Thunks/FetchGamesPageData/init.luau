local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v3 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v7 = require(l_Modules_0.LuaApp.Actions.SetGamesPageDataStatus);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeGames");
return function(v10, v11, v12, v13) --[[ Line: 16 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v3 (copy), v7 (copy), v6 (copy), l_GameSortGroups_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_FVariable_0 (copy)
    return function(v14) --[[ Line: 17 ]]
        -- upvalues: l_RetrievalStatus_0 (ref), v3 (ref), v7 (ref), v6 (ref), v10 (copy), l_GameSortGroups_0 (ref), v12 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), v13 (copy), v11 (copy), l_FVariable_0 (ref)
        if v14:getState().Startup.GamesPageDataStatus == l_RetrievalStatus_0.Fetching then
            return v3.resolve("games page data is already fetching");
        else
            local v15 = tick();
            v14:dispatch(v7(l_RetrievalStatus_0.Fetching));
            return v14:dispatch(v6(v10, l_GameSortGroups_0.Games, v12, if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v13 else nil)):andThen(function() --[[ Line: 34 ]]
                -- upvalues: v14 (copy), v7 (ref), l_RetrievalStatus_0 (ref), v12 (ref), v15 (copy), v11 (ref), l_FVariable_0 (ref), v3 (ref)
                v14:dispatch(v7(l_RetrievalStatus_0.Done));
                if not v12 or v12 == "" then
                    local v16 = (tick() - v15) * 1000;
                    v11.Diag:reportStats(l_FVariable_0, v16);
                end;
                return v3.resolve();
            end, function(v17) --[[ Line: 45 ]]
                -- upvalues: v14 (copy), v7 (ref), l_RetrievalStatus_0 (ref), v3 (ref)
                v14:dispatch(v7(l_RetrievalStatus_0.Failed));
                return v3.reject(v17);
            end);
        end;
    end;
end;