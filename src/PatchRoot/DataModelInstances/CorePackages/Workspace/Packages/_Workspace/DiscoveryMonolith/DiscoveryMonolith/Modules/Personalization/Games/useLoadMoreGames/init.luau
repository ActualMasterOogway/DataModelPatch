local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_DEFAULT_GAME_FETCH_COUNT_0 = require(l_Parent_0.DiscoveryTypes).Constants.DEFAULT_GAME_FETCH_COUNT;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v10 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v12 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
return function(v13, v14, v15, v16, v17, v18) --[[ Line: 26 ]] --[[ Name: useLoadMoreGames ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), l_useDispatch_0 (copy), v2 (copy), v10 (copy), v12 (copy), l_DEFAULT_GAME_FETCH_COUNT_0 (copy), v11 (copy)
    local v19 = v13 and v13.hasMoreRows or false;
    local v20 = v15 == l_RetrievalStatus_0.Fetching;
    local v21 = v19 and not v20;
    local v22 = l_useRoactService_0(l_RoactNetworking_0);
    local v23 = l_useRoactService_0(l_AppLogging_0);
    local v24 = l_useDispatch_0();
    return (v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v21 (copy), v13 (copy), v14 (copy), v16 (copy), v24 (copy), v10 (ref), v12 (ref), v22 (copy), v17 (copy), v18 (copy), l_DEFAULT_GAME_FETCH_COUNT_0 (ref), v23 (copy), v11 (ref)
        if not v21 then
            return;
        elseif v13 == nil or v14 == nil then
            return;
        elseif v16 then
            return v24((v10((v12(v22, v17, v18, l_DEFAULT_GAME_FETCH_COUNT_0, v23)))));
        elseif v13 then
            return v24((v10((v11(v22, v14, true, {
                startRows = v13.rowsRequested, 
                maxRows = l_DEFAULT_GAME_FETCH_COUNT_0, 
                exclusiveStartId = v13.nextPageExclusiveStartId, 
                pageToken = v13.nextPageToken
            })))));
        else
            return;
        end;
    end, {
        v21, 
        v22, 
        v24, 
        v17, 
        v16, 
        v14, 
        v13, 
        v18, 
        v23
    }));
end;