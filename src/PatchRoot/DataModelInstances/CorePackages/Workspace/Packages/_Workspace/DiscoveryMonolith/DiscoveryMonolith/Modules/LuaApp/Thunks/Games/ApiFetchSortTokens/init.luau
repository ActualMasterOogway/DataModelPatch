local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v7 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfoModel_0 = v7.TopicInfoModel;
local l_AddTopicInfos_0 = v7.AddTopicInfos;
local v10 = require(l_Parent_0.FetchStatusRodux);
local l_SetFetchStatus_0 = v10.SetFetchStatus;
local l_FetchStatusNamespace_0 = v10.FetchStatusNamespace;
local l_FetchStatusReducer_0 = v10.FetchStatusReducer;
local l_ReportToDiagByCountryCode_0 = require(l_Parent_0.Analytics).ReportToDiagByCountryCode;
local v15 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v15.SetNextDataExpirationTime;
local l_ExpirationTimeNamespace_0 = v15.ExpirationTimeNamespace;
local l_ExploreContentType_0 = require(l_Parent_0.DiscoveryTypes).ExploreContentType;
local l_updateGameFiltersData_0 = require(l_Parent_0.GameFilters).DataStore.updateGameFiltersData;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_getSelectedGameFilterOptions_0 = require(l_Parent_0.GameFilters).DataStore.getSelectedGameFilterOptions;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v23 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v24 = require(l_Modules_0.LuaApp.Thunks.Games.updateGamesSortData);
local v25 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v26 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local v27 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetSorts);
local v28 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSorts);
local v29 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSortsMetadata);
local v30 = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup);
local v31 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v32 = require(l_Modules_0.Personalization.Games.Discovery.SetDiscoveryNextPageId);
local v33 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddExploreOmniItems);
local l_FFlagLuaAppDeprecateGamesApiCalls_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDeprecateGamesApiCalls;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_min_0 = math.min;
local v37 = tonumber(settings():GetFVariable("PercentReportingGamesSortsRTT"));
local function v40(v38, v39) --[[ Line: 45 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSortToken, v38, v39);
end;
local function v53(v41, v42, v43) --[[ Line: 49 ]] --[[ Name: parseSortDataIntoStore ]]
    -- upvalues: l_TopicInfoModel_0 (copy), v25 (copy), l_min_0 (copy), l_AddTopicInfos_0 (copy), v31 (copy), l_GameSortGroups_0 (copy), v33 (copy), l_AppPage_0 (copy)
    local l_responseBody_0 = v43.responseBody;
    if l_responseBody_0.sorts then
        local v45 = {};
        local v46 = {};
        local v47 = {};
        local v48 = nil;
        local v49 = l_responseBody_0.pageContext and l_responseBody_0.pageContext.pageId;
        for _, v51 in ipairs(l_responseBody_0.sorts) do
            local v52 = l_TopicInfoModel_0.fromGamesApi(v51);
            v52.treatmentType = v25.Carousel;
            v45[#v45 + 1] = v52;
            v46[#v46 + 1] = v51.name;
            v47[#v47 + 1] = v51.topicLayoutData;
            if not v48 then
                v48 = v51.tokenExpiryInSeconds;
            else
                v48 = l_min_0(v48, v51.tokenExpiryInSeconds);
            end;
        end;
        v42:dispatch(l_AddTopicInfos_0(v45));
        v42:dispatch(v31(v41, v46, v49, v47));
        if v41 == l_GameSortGroups_0.HomeGames then
            v42:dispatch(v33(l_AppPage_0.Home, v45, false));
        end;
        return v48;
    else
        return -1;
    end;
end;
local function v65(v54, v55, v56, v57, v58) --[[ Line: 84 ]] --[[ Name: parseExploreSortDataIntoStore ]]
    -- upvalues: v5 (copy), l_TopicInfoModel_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_ExploreContentType_0 (copy), l_updateGameFiltersData_0 (copy), v24 (copy), l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), l_AddTopicInfos_0 (copy), v30 (copy), v31 (copy), l_GameSortGroups_0 (copy), v33 (copy), l_AppPage_0 (copy)
    if not v57 or #v57 == 0 then
        return v5.reject("No sort data found in response.");
    else
        local v59 = {};
        local v60 = {};
        local v61 = {};
        for v62, v63 in ipairs(v57) do
            local v64 = l_TopicInfoModel_0.fromExploreJsonData(v63);
            v59[v62] = v64;
            v60[v62] = v64.name;
            v61[v62] = v64.topicLayoutData;
            if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
                if v63.contentType == l_ExploreContentType_0.Filters then
                    l_updateGameFiltersData_0(v55, v56, v63.filters);
                elseif v63.contentType == l_ExploreContentType_0.Games then
                    if v63.games then
                        v24(v54, v55, v63);
                        v55:dispatch(l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v64.name, l_RetrievalStatus_0.Done));
                    end;
                else
                    warn((("unsupported explore content type: %*"):format(v63.contentType)));
                end;
            elseif v63.games then
                v24(v54, v55, v63);
                v55:dispatch(l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v64.name, l_RetrievalStatus_0.Done));
            end;
        end;
        v55:dispatch(l_AddTopicInfos_0(v59));
        if v58 then
            v55:dispatch(v30(v56, v60, v61));
        else
            v55:dispatch(v31(v56, v60, "", v61));
        end;
        if v56 == l_GameSortGroups_0.Games then
            v55:dispatch(v33(l_AppPage_0.Games, v59, v58));
        end;
        return v5.resolve();
    end;
end;
local function v84(v66, v67, v68, v69, v70) --[[ Line: 139 ]] --[[ Name: fetchToken ]]
    -- upvalues: l_GameSortGroups_0 (copy), v29 (copy), v23 (copy), v65 (copy), v40 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_GameFiltersReducer_0 (copy), l_getSelectedGameFilterOptions_0 (copy), v4 (copy), v28 (copy), v5 (copy), v32 (copy), v26 (copy), l_AppPage_0 (copy), l_FFlagLuaAppDeprecateGamesApiCalls_0 (copy), v27 (copy), v53 (copy), l_SetNextDataExpirationTime_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_ReportToDiagByCountryCode_0 (copy), v37 (copy)
    local v71 = v69 and v69 ~= "";
    if v68 == l_GameSortGroups_0.GamesList then
        return v29(v66, v23:Get()):andThen(function(v72) --[[ Line: 142 ]]
            -- upvalues: v65 (ref), v66 (copy), v67 (copy), v68 (copy), v40 (ref), l_RetrievalStatus_0 (ref)
            local v73 = v72 and v72.responseBody and v72.responseBody.sortMetadata;
            return v65(v66, v67, v68, v73):andThen(function() --[[ Line: 144 ]]
                -- upvalues: v67 (ref), v40 (ref), v68 (ref), l_RetrievalStatus_0 (ref)
                v67:dispatch(v40(v68, l_RetrievalStatus_0.Done));
            end);
        end):catch(function() --[[ Line: 147 ]]
            -- upvalues: v67 (copy), v40 (ref), v68 (copy), l_RetrievalStatus_0 (ref)
            v67:dispatch(v40(v68, l_RetrievalStatus_0.Failed));
        end);
    elseif v68 == l_GameSortGroups_0.Games then
        if not v71 then
            v23:Refresh();
        end;
        local v74 = nil;
        if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
            local v75 = v67:getState().Personalization[l_GameFiltersReducer_0.key][v68];
            local v76 = l_getSelectedGameFilterOptions_0(if v75 then v75.allFilters else {});
            v74 = v4.Dictionary.join(v76, v70 or {});
        end;
        return v28(v66, v69, if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v74 else nil, v23:Get()):andThen(function(v77) --[[ Line: 169 ]]
            -- upvalues: v5 (ref), v67 (copy), v32 (ref), v26 (ref), l_AppPage_0 (ref), v65 (ref), v66 (copy), v68 (copy), v71 (copy), v40 (ref), l_RetrievalStatus_0 (ref)
            if not v77 or not v77.responseBody or not v77.responseBody.sorts then
                return v5.reject("Invalid response");
            else
                local l_sorts_0 = v77.responseBody.sorts;
                local v79 = v77.responseBody.nextSortsPageToken or "";
                v67:dispatch(v32(v79));
                v67:dispatch(v26(l_AppPage_0.Games));
                return v65(v66, v67, v68, l_sorts_0, v71):andThen(function() --[[ Line: 178 ]]
                    -- upvalues: v67 (ref), v40 (ref), v68 (ref), l_RetrievalStatus_0 (ref)
                    return v67:dispatch(v40(v68, l_RetrievalStatus_0.Done));
                end);
            end;
        end):catch(function() --[[ Line: 182 ]]
            -- upvalues: v67 (copy), v40 (ref), v68 (copy), l_RetrievalStatus_0 (ref), v5 (ref)
            v67:dispatch(v40(v68, l_RetrievalStatus_0.Failed));
            return v5.reject("Update failed");
        end);
    elseif l_FFlagLuaAppDeprecateGamesApiCalls_0 then
        local v80 = ("Unsupported GameSortGroups %* called."):format(v68);
        v67:dispatch(v40(v68, l_RetrievalStatus_0.Failed));
        return v5.reject(v80);
    else
        return v27(v66, v68):andThen(function(v81) --[[ Line: 193 ]]
            -- upvalues: v53 (ref), v68 (copy), v67 (copy), v40 (ref), l_RetrievalStatus_0 (ref), v5 (ref), l_SetNextDataExpirationTime_0 (ref), l_ExpirationTimeNamespace_0 (ref), l_ReportToDiagByCountryCode_0 (ref), v37 (ref), l_GameSortGroups_0 (ref), v26 (ref), l_AppPage_0 (ref)
            local v82 = v53(v68, v67, v81);
            if v82 < 0 then
                v67:dispatch(v40(v68, l_RetrievalStatus_0.Failed));
                return v5.reject("No sort data found in response.");
            else
                v67:dispatch(l_SetNextDataExpirationTime_0(v68, tick() + v82, l_ExpirationTimeNamespace_0.GameSortGroup));
                v67:dispatch(v40(v68, l_RetrievalStatus_0.Done));
                l_ReportToDiagByCountryCode_0("GamesSorts", "RoundTripTime", v81.responseTimeMs, v37);
                if v68 == l_GameSortGroups_0.HomeGames then
                    v67:dispatch(v26(l_AppPage_0.Home));
                elseif v68 == l_GameSortGroups_0.Games then
                    v67:dispatch(v26(l_AppPage_0.Games));
                end;
                return v5.resolve();
            end;
        end, function(v83) --[[ Line: 228 ]]
            -- upvalues: v67 (copy), v40 (ref), v68 (copy), l_RetrievalStatus_0 (ref), v5 (ref)
            v67:dispatch(v40(v68, l_RetrievalStatus_0.Failed));
            return v5.reject(v83);
        end);
    end;
end;
return function(v85, v86, v87, v88) --[[ Line: 242 ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v5 (copy), v40 (copy), v84 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy)
    return function(v89) --[[ Line: 243 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), v86 (copy), l_RetrievalStatus_0 (ref), v5 (ref), v40 (ref), v84 (ref), v85 (copy), v87 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (ref), v88 (copy)
        if v89:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSortToken][v86] == l_RetrievalStatus_0.Fetching then
            return v5.resolve("Data is fetching.");
        else
            v89:dispatch(v40(v86, l_RetrievalStatus_0.Fetching));
            return v84(v85, v89, v86, v87, if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v88 else nil);
        end;
    end;
end;