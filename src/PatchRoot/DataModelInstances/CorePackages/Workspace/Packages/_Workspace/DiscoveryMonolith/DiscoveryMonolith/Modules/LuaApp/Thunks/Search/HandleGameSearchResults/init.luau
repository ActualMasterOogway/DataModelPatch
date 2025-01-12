local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local v5 = require(l_Parent_0.GameIconRodux);
local l_ApiFetchBigGameIcons_0 = v5.BigGameIcons.ApiFetchBigGameIcons;
local l_BigGameIconReducer_0 = v5.BigGameIcons.BigGameIconReducer;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v10 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v11 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v12 = require(l_Modules_0.LuaApp.Actions.SetSearchInGames);
local v13 = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames);
local v14 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v15 = require(l_Modules_0.LuaApp.Models.SearchInGames);
local v16 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v17 = require(l_Modules_0.Personalization.Search.mapContentTypeToTreatmentType);
local v18 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed);
return function(v19, v20, v21) --[[ Line: 30 ]]
    -- upvalues: l_BigGameIconReducer_0 (copy), v11 (copy), v3 (copy), v16 (copy), v2 (copy), v14 (copy), v17 (copy), v18 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), v15 (copy), v13 (copy), v12 (copy), v10 (copy), l_ApiFetchBigGameIcons_0 (copy)
    return function(v22) --[[ Line: 31 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), v21 (copy), v20 (copy), v11 (ref), v3 (ref), v16 (ref), v2 (ref), v14 (ref), v17 (ref), v18 (ref), l_parseAndAddGameInfos_0 (ref), v19 (copy), l_GameInfoModel_0 (ref), v15 (ref), v13 (ref), v12 (ref), v10 (ref), l_ApiFetchBigGameIcons_0 (ref)
        local v23 = {};
        local v24 = v22:getState()[l_BigGameIconReducer_0.key];
        local l_responseBody_0 = v21.responseBody;
        if v22:getState().RequestsStatus.SearchesInGamesStatus[v20.searchUuid] == v11.Removed then
            return v3.resolve("Search with Uuid " .. v20.searchUuid .. " has been terminated");
        else
            local v26 = nil;
            local v27 = false;
            local v28 = {};
            for v29, v30 in pairs(l_responseBody_0.searchResults) do
                local v31 = v30.contents[1];
                local l_topicId_0 = v30.topicId;
                local v33 = tostring(v31.rootPlaceId);
                local v34 = v30.contentGroupType == v16.ContentGroupType.Game;
                if v34 then
                    table.insert(v28, v31);
                end;
                local v35 = v2.Dictionary.join(v31, {
                    topicId = l_topicId_0, 
                    placeId = v33
                });
                v14.fromJsonData(v35, v34):match(function(v36) --[[ Line: 64 ]]
                    -- upvalues: v23 (copy), v29 (copy), v17 (ref), v30 (copy), v22 (copy), v18 (ref), v20 (ref), l_topicId_0 (copy), v34 (copy), v31 (copy), v26 (ref), v27 (ref)
                    v23[v29] = v36;
                    local v37 = v17(v30.contentGroupType);
                    v22:dispatch(v18(v20.searchUuid, l_topicId_0, v37, v29, {}));
                    if v34 and v29 == 1 and v31.emphasis then
                        v26 = v31.universeId;
                        v27 = true;
                    end;
                end):matchError(function(v38) --[[ Line: 74 ]]
                    warn(v38);
                end);
            end;
            l_parseAndAddGameInfos_0(v19, v22, v28, l_GameInfoModel_0.fromSearchApi, nil);
            local v39 = v15.fromOmniSearch(v20.searchKeyword, v23, v27, l_responseBody_0.nextPageToken);
            if v20.isAppend then
                v22:dispatch(v13(v20.searchUuid, v39));
            else
                v22:dispatch(v12(v20.searchUuid, v39));
            end;
            v22:dispatch(v10(v20.searchUuid, v11.Done));
            if v26 and v24[v26] == nil then
                v22:dispatch(l_ApiFetchBigGameIcons_0(v19, {
                    v26
                }));
            end;
            return v3.resolve();
        end;
    end;
end;