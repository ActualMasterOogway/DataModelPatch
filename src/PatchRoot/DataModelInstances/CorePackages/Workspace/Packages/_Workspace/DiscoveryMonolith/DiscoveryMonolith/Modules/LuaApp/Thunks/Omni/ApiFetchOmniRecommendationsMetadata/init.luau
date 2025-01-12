local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.DiscoveryUtils);
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v8 = require(l_Modules_0.LuaApp.Http.Requests.DiscoveryApi.OmniGetRecommendationsMetadata);
local v9 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus);
local v10 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v11 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v12 = require(l_Modules_0.LuaApp.Thunks.Omni.parseAndAddContentMetadata);
local function _(v13, v14, v15) --[[ Line: 18 ]] --[[ Name: itemForId ]]
    -- upvalues: v10 (copy)
    local v16 = v10.storeForContentType(v13, v14);
    if v16 == nil then
        return nil;
    else
        assert(v16, "store should always exist after this point");
        return v16[tostring(v15)];
    end;
end;
local function _(v18, v19, v20) --[[ Line: 28 ]] --[[ Name: getFetchingStatus ]]
    if v18.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
        return nil;
    else
        local v21 = v18.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[v19];
        if v21 == nil then
            return nil;
        else
            return v21[tostring(v20)];
        end;
    end;
end;
local function v60(v23, v24, v25, v26, v27, v28) --[[ Line: 39 ]] --[[ Name: fetchOmniMetadata ]]
    -- upvalues: v4 (copy), l_TopicContentsReducer_0 (copy), l_RetrievalStatus_0 (copy), v10 (copy), v9 (copy), v8 (copy), v5 (copy), v12 (copy), v11 (copy)
    local v29 = v23:getState();
    local v30 = v29.OmniRecommendations and v29.OmniRecommendations[v25] and v29.OmniRecommendations[v25].sorts[v26] or nil;
    if not v30 then
        return v4.reject("pageType, sortIndex combo doesn't exist");
    else
        assert(v30, "OmniRecommendations sort should always exist");
        local v31 = nil;
        local l_topicId_0 = v30.topicId;
        if l_topicId_0 == nil then
            return v4.reject("TopicId for sortIndex " .. tostring(v26) .. " doesn't exist");
        else
            l_topicId_0 = tostring(l_topicId_0);
            v31 = v29.Personalization[l_TopicContentsReducer_0.key][l_topicId_0];
            if not v31 then
                return v4.reject("TopicContents for id: " .. l_topicId_0 .. " doesn't exist");
            else
                assert(v31, "sortIndexContents always exists after this point");
                if not v31.hasMoreRows then
                    return v4.resolve("no more rows to fetch");
                elseif not v30.recommendations then
                    return v4.reject((("No recommendations for sort index %*"):format(v26)));
                else
                    local v33 = {};
                    local v34 = #v31.entries + 1;
                    for v35 = v34, math.min(v34 + v27, #v30.recommendations) do
                        local v36 = v30.recommendations[v35];
                        local l_contentType_0 = v36.contentType;
                        local l_contentId_0 = v36.contentId;
                        local v39;
                        if v29.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
                            v39 = nil;
                        else
                            local v40 = v29.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[l_contentType_0];
                            v39 = if v40 == nil then nil else v40[tostring(l_contentId_0)];
                        end;
                        l_contentType_0 = false;
                        if v39 ~= nil then
                            l_contentType_0 = v39 == l_RetrievalStatus_0.Fetching;
                        end;
                        local l_contentType_1 = v36.contentType;
                        local l_contentId_1 = v36.contentId;
                        local v43 = v10.storeForContentType(v29, l_contentType_1);
                        if v43 == nil then
                            l_contentId_0 = nil;
                        else
                            assert(v43, "store should always exist after this point");
                            l_contentId_0 = v43[tostring(l_contentId_1)];
                        end;
                        if l_contentId_0 == nil and not l_contentType_0 then
                            table.insert(v33, v36);
                        end;
                    end;
                    if #v33 == 0 then
                        return v4.resolve("nothing new to fetch");
                    else
                        local v44 = {};
                        for _, v46 in ipairs(v33) do
                            if v44[v46.contentType] == nil then
                                v44[v46.contentType] = {};
                            end;
                            v44[v46.contentType][tostring(v46.contentId)] = l_RetrievalStatus_0.Fetching;
                        end;
                        v23:dispatch(v9(v44));
                        return v8(v24, v33):andThen(function(v47) --[[ Line: 103 ]]
                            -- upvalues: v5 (ref), v28 (copy), v12 (ref), v24 (copy), v23 (copy), v11 (ref), v25 (copy), l_topicId_0 (ref), v44 (copy), l_RetrievalStatus_0 (ref), v9 (ref), v4 (ref)
                            v5.logResponseTelemetry("discovery-api/omni-recommendation-metadata", v47, v28);
                            local l_responseBody_0 = v47.responseBody;
                            local v49 = v12(v24, v23, l_responseBody_0);
                            v23:dispatch(v11(v25, l_topicId_0));
                            local v50 = {};
                            for v51, v52 in pairs(v44) do
                                v50[v51] = {};
                                for v53, _ in pairs(v52) do
                                    v50[v51][tostring(v53)] = l_RetrievalStatus_0.Failed;
                                end;
                            end;
                            for v55, v56 in pairs(v49) do
                                if not v50[v55] then
                                    v50[v55] = {};
                                end;
                                for v57, _ in pairs(v56) do
                                    v50[v55][tostring(v57)] = l_RetrievalStatus_0.Done;
                                end;
                            end;
                            v23:dispatch(v9(v50));
                            return v4.resolve();
                        end, function(v59) --[[ Line: 129 ]]
                            -- upvalues: v23 (copy), v9 (ref), v33 (copy), l_RetrievalStatus_0 (ref), v4 (ref)
                            v23:dispatch(v9(v33, l_RetrievalStatus_0.Failed));
                            warn(v59);
                            return v4.reject(v59);
                        end);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v61, v62, v63, v64, v65) --[[ Line: 136 ]]
    -- upvalues: v60 (copy)
    return function(v66) --[[ Line: 137 ]]
        -- upvalues: v60 (ref), v61 (copy), v62 (copy), v63 (copy), v64 (copy), v65 (copy)
        return v60(v66, v61, v62, v63, v64, v65);
    end;
end;