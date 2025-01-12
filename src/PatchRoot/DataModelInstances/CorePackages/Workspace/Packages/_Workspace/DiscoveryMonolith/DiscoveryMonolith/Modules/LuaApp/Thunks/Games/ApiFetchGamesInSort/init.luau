local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_ReportToDiagByCountryCode_0 = require(l_Parent_0.Analytics).ReportToDiagByCountryCode;
local v4 = require(l_Parent_0.Promise);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v8 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsEntryModel_0 = v8.TopicContentsEntryModel;
local l_TopicContentsModel_0 = v8.TopicContentsModel;
local l_AddTopicContents_0 = v8.AddTopicContents;
local v12 = require(l_Parent_0.DiscoveryTypes);
local l_GameSortGroups_0 = v12.GameSortGroups;
local v14 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v14.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v14.FetchStatusNamespace;
local l_SetFetchStatus_0 = v14.SetFetchStatus;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_getSelectedGameFilterOptions_0 = require(l_Parent_0.GameFilters).DataStore.getSelectedGameFilterOptions;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v21 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetList);
local v22 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSortContents);
local v23 = require(script.Parent.updateGamesSortData);
local v24 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v25 = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"));
local v26 = require(l_Modules_0.Personalization.Flags.GetFStringLuaAppExploreApiSupportedSortNames);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FFlagLuaAppDeprecateGamesApiCalls_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDeprecateGamesApiCalls;
local v29 = string.split(v26(), ",");
local function v32(v30, v31) --[[ Line: 39 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v30, v31);
end;
return function(v33, v34, v35, v36) --[[ Line: 43 ]]
    -- upvalues: v4 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppDeprecateGamesApiCalls_0 (copy), v29 (copy), v24 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_GameFiltersReducer_0 (copy), l_GameSortGroups_0 (copy), l_getSelectedGameFilterOptions_0 (copy), v12 (copy), v22 (copy), v21 (copy), v32 (copy), v23 (copy), l_TopicContentsEntryModel_0 (copy), v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy), l_ReportToDiagByCountryCode_0 (copy), v25 (copy)
    return function(v37) --[[ Line: 44 ]]
        -- upvalues: v34 (copy), v4 (ref), l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_RetrievalStatus_0 (ref), l_FFlagLuaAppDeprecateGamesApiCalls_0 (ref), v29 (ref), v36 (copy), v24 (ref), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), l_GameFiltersReducer_0 (ref), l_GameSortGroups_0 (ref), l_getSelectedGameFilterOptions_0 (ref), v12 (ref), v22 (ref), v21 (ref), v32 (ref), v33 (copy), v23 (ref), v35 (copy), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_ReportToDiagByCountryCode_0 (ref), v25 (ref)
        if v34 == nil or v34.name == nil then
            return v4.resolve("Invalid sort request");
        else
            assert(v34, "sort should always exist; assert for linter");
            if v37:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSorts][v34.name] == l_RetrievalStatus_0.Fetching then
                return v4.resolve("Request for sort " .. v34.name .. " has been debounced");
            else
                local v38 = nil;
                if l_FFlagLuaAppDeprecateGamesApiCalls_0 then
                    v38 = true;
                else
                    local v39 = false;
                    if v29 then
                        for _, v41 in v29 do
                            if v34.name == v41 then
                                v39 = true;
                                break;
                            end;
                        end;
                    end;
                    v38 = v39;
                end;
                local v42 = v36 or {};
                if v38 then
                    v42.sortId = v34.name;
                    v42.sessionId = v24:Get();
                    if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
                        local v43 = v37:getState().Personalization[l_GameFiltersReducer_0.key][l_GameSortGroups_0.Games];
                        local l_l_getSelectedGameFilterOptions_0_0 = l_getSelectedGameFilterOptions_0;
                        local v45 = if v43 then v43.allFilters else {};
                        for v46, v47 in (l_l_getSelectedGameFilterOptions_0_0(v45)) do
                            if v42[v46] then
                                warn((("URL parameter %* already exists"):format(v46)));
                            else
                                v42[v46] = v47;
                            end;
                        end;
                    end;
                else
                    v42.sortToken = v34.token;
                    v42.contextUniverseId = v34.contextUniverseId;
                    v42.contextCountryRegionId = v34.contextCountryRegionId;
                    v42.gameSetTargetId = v34.gameSetTargetId;
                    v42.startRows = v42.startRows or 0;
                    v42.maxRows = v42.maxRows or v12.Constants.DEFAULT_GAME_FETCH_COUNT;
                end;
                local v48 = if v38 then v22 else v21;
                v37:dispatch(v32(v34.name, l_RetrievalStatus_0.Fetching));
                return v48(v33, v42):andThen(function(v49) --[[ Line: 110 ]]
                    -- upvalues: v38 (ref), v23 (ref), v33 (ref), v37 (copy), v35 (ref), v32 (ref), v34 (ref), l_RetrievalStatus_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), v42 (copy), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_ReportToDiagByCountryCode_0 (ref), v25 (ref)
                    if v38 then
                        v23(v33, v37, v49.responseBody, v35);
                        v37:dispatch(v32(v34.name, l_RetrievalStatus_0.Done));
                        return;
                    else
                        local v50 = {};
                        local l_responseBody_0 = v49.responseBody;
                        if #l_responseBody_0.games == 0 then
                            warn("Found no games in this sort:", v34.displayName);
                        end;
                        local function v57(v52, v53) --[[ Line: 125 ]] --[[ Name: forEachGameInfo ]]
                            -- upvalues: l_TopicContentsEntryModel_0 (ref), v2 (ref), v50 (copy)
                            l_TopicContentsEntryModel_0.fromGamesApiData(v52):match(function(v54) --[[ Line: 129 ]]
                                -- upvalues: v2 (ref), v53 (copy), v50 (ref)
                                local v55 = v2.Dictionary.join(v53, v54);
                                table.insert(v50, v55);
                            end):matchError(function(v56) --[[ Line: 133 ]]
                                warn(v56);
                            end);
                        end;
                        l_parseAndAddGameInfos_0(v33, v37, l_responseBody_0.games, l_GameInfoModel_0.fromGamesApi, v57);
                        local v58 = {
                            entries = v50, 
                            rowsRequested = v42.startRows + v42.maxRows, 
                            hasMoreRows = l_responseBody_0.hasMoreRows, 
                            nextPageExclusiveStartId = l_responseBody_0.nextPageExclusiveStartId, 
                            nextPageToken = ""
                        };
                        if not v35 then
                            v58.updatedTimestamp = tick();
                        end;
                        local v59 = l_TopicContentsModel_0.fromData(v58);
                        v37:dispatch(l_AddTopicContents_0(v34.name, v59, v35));
                        v37:dispatch(v32(v34.name, l_RetrievalStatus_0.Done));
                        l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v49.responseTimeMs, v25);
                        return;
                    end;
                end, function(v60) --[[ Line: 165 ]]
                    -- upvalues: v37 (copy), v32 (ref), v34 (ref), l_RetrievalStatus_0 (ref), v4 (ref)
                    v37:dispatch(v32(v34.name, l_RetrievalStatus_0.Failed));
                    return v4.reject(v60);
                end);
            end;
        end;
    end;
end;