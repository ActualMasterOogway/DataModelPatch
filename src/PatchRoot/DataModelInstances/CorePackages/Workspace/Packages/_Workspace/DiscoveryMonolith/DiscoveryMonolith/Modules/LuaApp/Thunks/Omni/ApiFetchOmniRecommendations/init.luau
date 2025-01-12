local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfoModel_0 = v3.TopicInfoModel;
local l_AddTopicInfos_0 = v3.AddTopicInfos;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_MakeOmniRecommendationsRequest_0 = require(l_Parent_0.GraphQlShared).MakeOmniRecommendationsRequest;
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.DiscoveryTypes);
local v11 = require(l_Parent_0.DiscoveryUtils);
local l_OmniRecommendationsPageType_0 = v11.OmniRecommendationsPageType;
local v13 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v13.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v13.FetchStatusNamespace;
local l_SetFetchStatus_0 = v13.SetFetchStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v18 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v19 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v20 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v21 = require(l_Modules_0.LuaApp.Thunks.Omni.parseAndAddContentMetadata);
local _ = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v23 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendations);
local v24 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime);
local v25 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local v26 = game:DefineFastFlag("LuaAppLogOmniRequestErrors", false);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken);
local l_IsPrefetchOneCopyEnabled_0 = require(l_Parent_0.SharedFlags).IsPrefetchOneCopyEnabled;
local function v31(v29, v30) --[[ Line: 35 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.OmniRecommendations, v29, v30);
end;
local function v58(v32, v33, v34, v35, v36, v37, v38, v39) --[[ Line: 39 ]] --[[ Name: fetchOmni ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v9 (copy), v31 (copy), l_HttpService_0 (copy), v27 (copy), v19 (copy), l_IsPrefetchOneCopyEnabled_0 (copy), l_MakeOmniRecommendationsRequest_0 (copy), v11 (copy), l_OmniRecommendationsPageType_0 (copy), v21 (copy), v10 (copy), v23 (copy), v20 (copy), l_TopicInfoModel_0 (copy), l_AddTopicInfos_0 (copy), v18 (copy), v24 (copy), l_AppPage_0 (copy), v25 (copy), v26 (copy)
    if v32:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][v35] == l_RetrievalStatus_0.Fetching then
        return v9.resolve("Data is fetching");
    else
        v32:dispatch(v31(v35, l_RetrievalStatus_0.Fetching));
        local v40 = nil;
        v40 = v37 or l_HttpService_0:GenerateGUID(false):lower();
        local v41 = nil;
        if v36 then
            local v42 = v32:getState().OmniRecommendations[v35];
            if v42 then
                v41 = v42.nextPageToken;
                v40 = v42.omniSessionId;
            end;
            if v27() and (v41 == nil or v41 == "") then
                v32:dispatch(v31(v35, l_RetrievalStatus_0.Done));
                return v9.resolve("nextPageToken is empty");
            end;
        end;
        local v43 = {};
        for _, v45 in pairs(v19) do
            table.insert(v43, v45);
        end;
        local _ = nil;
        return (if l_IsPrefetchOneCopyEnabled_0() then v34(v33, v35, v40, v41, v43, v38) else l_MakeOmniRecommendationsRequest_0(v33, v35, v40, v41, v43, v38)):andThen(function(v47) --[[ Line: 109 ]]
            -- upvalues: v11 (ref), v39 (copy), v32 (copy), v31 (ref), v35 (copy), l_RetrievalStatus_0 (ref), v9 (ref), l_OmniRecommendationsPageType_0 (ref), v21 (ref), v33 (copy), v10 (ref), v23 (ref), v40 (ref), v36 (copy), v20 (ref), l_TopicInfoModel_0 (ref), l_AddTopicInfos_0 (ref), v18 (ref), v24 (ref), l_AppPage_0 (ref), v25 (ref)
            v11.logResponseTelemetry("discovery-api/omni-recommendation", v47, v39);
            local l_responseBody_0 = v47.responseBody;
            if l_responseBody_0 == nil or l_responseBody_0.sorts == nil or #l_responseBody_0.sorts == 0 then
                v32:dispatch(v31(v35, l_RetrievalStatus_0.Failed));
                return v9.reject("No sort data found in response.");
            elseif l_OmniRecommendationsPageType_0.toAppPage(l_responseBody_0.pageType) ~= v35 then
                v32:dispatch(v31(v35, l_RetrievalStatus_0.Failed));
                return v9.reject("Wrong sort data found in response.");
            else
                local v49 = v21(v33, v32, l_responseBody_0);
                v49[v10.OmniRecommendationsContentType.Game] = nil;
                v23.fromJsonData(l_responseBody_0, v40):match(function(v50) --[[ Line: 129 ]]
                    -- upvalues: v36 (ref), v49 (copy), v32 (ref), v20 (ref), l_TopicInfoModel_0 (ref), l_AddTopicInfos_0 (ref), v18 (ref), v35 (ref), v24 (ref), v31 (ref), l_RetrievalStatus_0 (ref), l_AppPage_0 (ref), v25 (ref)
                    local v51 = nil;
                    if not v36 then
                        v51 = tick();
                    end;
                    v50.metadata = v49;
                    v32:dispatch(v20(v50, v36));
                    local v52 = {};
                    if v50.sorts then
                        for _, v54 in v50.sorts do
                            local v55 = l_TopicInfoModel_0.fromOmniApi(v54);
                            v52[#v52 + 1] = v55;
                        end;
                    end;
                    v32:dispatch(l_AddTopicInfos_0(v52));
                    v32:dispatch(v18(v35, nil, v51));
                    v32:dispatch(v24(v35, v50.sortsExpirationTime));
                    v32:dispatch(v31(v35, l_RetrievalStatus_0.Done));
                    if v35 == l_AppPage_0.Home and not v36 then
                        v32:dispatch(v25(l_AppPage_0.Home));
                    end;
                end):matchError(function(v56) --[[ Line: 171 ]]
                    -- upvalues: v32 (ref), v31 (ref), v35 (ref), l_RetrievalStatus_0 (ref)
                    v32:dispatch(v31(v35, l_RetrievalStatus_0.Failed));
                    warn(v56);
                end);
                return v9.resolve();
            end;
        end, function(v57) --[[ Line: 176 ]]
            -- upvalues: v26 (ref), v11 (ref), v39 (copy), v32 (copy), v31 (ref), v35 (copy), l_RetrievalStatus_0 (ref), v9 (ref)
            if v26 then
                v11.logResponseError("discovery-api/omni-recommendation", v57, v39);
            end;
            v32:dispatch(v31(v35, l_RetrievalStatus_0.Failed));
            return v9.reject(v57);
        end);
    end;
end;
return function(v59, v60, v61, v62, v63, v64, v65) --[[ Line: 185 ]]
    -- upvalues: v58 (copy)
    return function(v66) --[[ Line: 194 ]]
        -- upvalues: v58 (ref), v59 (copy), v60 (copy), v61 (copy), v62 (copy), v63 (copy), v64 (copy), v65 (copy)
        return v58(v66, v59, v60, v61, v62, v63, v64, v65);
    end;
end;