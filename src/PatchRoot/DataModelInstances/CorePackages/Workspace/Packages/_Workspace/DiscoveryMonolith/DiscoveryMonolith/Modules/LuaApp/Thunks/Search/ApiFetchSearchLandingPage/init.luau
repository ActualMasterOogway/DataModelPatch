local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.TopicInfosRodux);
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_AddTopicInfos_0 = v4.AddTopicInfos;
local v7 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsEntryModel_0 = v7.TopicContentsEntryModel;
local l_TopicContentsModel_0 = v7.TopicContentsModel;
local l_AddTopicContents_0 = v7.AddTopicContents;
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_TopicInfoModel_0 = v4.TopicInfoModel;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v15 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion);
local v16 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniAutocompleteSorts);
ApiFetchSearchLandingPage = function(v17, v18) --[[ Line: 24 ]] --[[ Name: ApiFetchSearchLandingPage ]]
    -- upvalues: v15 (copy), v3 (copy), l_OmniRecommendationsContentType_0 (copy), l_TopicContentsEntryModel_0 (copy), v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_TopicInfoModel_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy), l_AddTopicInfos_0 (copy), v16 (copy)
    return function(v19) --[[ Line: 25 ]]
        -- upvalues: v18 (copy), v15 (ref), v17 (copy), v3 (ref), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v16 (ref)
        local v20 = {
            sessionId = v18
        };
        return v15(v17, v20):andThen(function(v21) --[[ Line: 28 ]]
            -- upvalues: v3 (ref), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), v17 (ref), v19 (copy), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v16 (ref)
            local l_responseBody_0 = v21.responseBody;
            if not l_responseBody_0.sorts then
                return v3.reject("No sorts found");
            else
                local v23 = {};
                local v24 = {};
                for _, v26 in pairs(l_responseBody_0.sorts) do
                    if v26.contentType == l_OmniRecommendationsContentType_0.Game then
                        local v27 = {};
                        if v26.games == nil then
                            warn((("Sort with %* contentType found with no games table! %*"):format(v26.contentType, v26.sortDisplayName)));
                        elseif #v26.games == 0 then
                            warn((("Found no games in this sort: %*"):format(v26.sortDisplayName)));
                        else
                            local function v33(v28, v29) --[[ Line: 53 ]] --[[ Name: forEachGameInfo ]]
                                -- upvalues: l_TopicContentsEntryModel_0 (ref), v2 (ref), v27 (copy)
                                l_TopicContentsEntryModel_0.fromOmniAutocompleteApi(v28):match(function(v30) --[[ Line: 57 ]]
                                    -- upvalues: v2 (ref), v29 (copy), v27 (ref)
                                    local v31 = v2.Dictionary.join(v29, v30);
                                    table.insert(v27, v31);
                                end):matchError(function(v32) --[[ Line: 61 ]]
                                    warn(v32);
                                end);
                            end;
                            l_parseAndAddGameInfos_0(v17, v19, v26.games, l_GameInfoModel_0.fromOmniAutocompleteApi, v33);
                            local v34 = {
                                entries = v27, 
                                hasMoreRows = false, 
                                nextPageToken = "", 
                                nextPageExclusiveStartId = 0, 
                                rowsRequested = 1, 
                                updatedTimestamp = tick()
                            };
                            local v35 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v26);
                            local v36 = l_TopicContentsModel_0.fromData(v34);
                            v19:dispatch(l_AddTopicContents_0(v26.sortId, v36, false));
                            table.insert(v24, v26);
                            table.insert(v23, v35);
                        end;
                    elseif v26.contentType == l_OmniRecommendationsContentType_0.TrendingSearches then
                        local v37 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v26);
                        local v38 = {
                            entries = v26.queries, 
                            hasMoreRows = false, 
                            nextPageToken = "", 
                            nextPageExclusiveStartId = 0, 
                            rowsRequested = 1, 
                            updatedTimestamp = tick()
                        };
                        local v39 = l_TopicContentsModel_0.fromData(v38);
                        v19:dispatch(l_AddTopicContents_0(v26.sortId, v39, false));
                        table.insert(v24, v26);
                        table.insert(v23, v37);
                    end;
                end;
                v19:dispatch(l_AddTopicInfos_0(v23));
                v19:dispatch(v16(v24));
                return v3.resolve(v21);
            end;
        end):catch(function(v40) --[[ Line: 111 ]]
            -- upvalues: v3 (ref)
            warn(v40);
            return v3.reject(v40);
        end);
    end;
end;
return ApiFetchSearchLandingPage;