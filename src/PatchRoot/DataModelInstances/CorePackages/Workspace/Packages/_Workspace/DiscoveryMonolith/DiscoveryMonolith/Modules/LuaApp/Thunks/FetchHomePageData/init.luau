local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v3 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_callOnce_0 = require(l_Parent_0.AppCommonLib).callOnce;
local l_AvatarThumbnailRequests_0 = require(l_Parent_0.UserLib).Utils.AvatarThumbnailRequests;
local l_PreloadUsersThumbnail_0 = require(l_Parent_0.UserLib).Thunks.PreloadUsersThumbnail;
local l_FetchFriendsCarousel_0 = require(l_Parent_0.FriendsCarousel).FetchFriendsCarousel;
local l_MemStorageKeys_0 = require(l_Parent_0.RobloxAppEnums).MemStorageKeys;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v14 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v15 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v16 = require(l_Modules_0.LuaApp.Actions.SetHomePageDataStatus);
local v17 = require(l_Modules_0.LuaApp.Actions.SetFetchHomePageDataStatusAll);
local v18 = require(l_Modules_0.LuaApp.Thunks.LegacyUpdateUsers);
local v19 = require(l_Modules_0.LuaApp.Thunks.FetchAdditionalFriendsInfo);
local v20 = require(l_Modules_0.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation);
local v21 = require(l_Modules_0.LuaApp.Flags.GetIxpPerfRegressionTestSeconds);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v23 = l_Logger_0:new(script.Name);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeHome");
local function v56(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) --[[ Line: 32 ]] --[[ Name: fetchHomePageData ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v3 (copy), v16 (copy), v17 (copy), v22 (copy), v20 (copy), v13 (copy), l_AppPage_0 (copy), v15 (copy), l_GameSortGroups_0 (copy), l_FetchFriendsCarousel_0 (copy), v18 (copy), v19 (copy), v21 (copy), l_callOnce_0 (copy), l_MemStorageKeys_0 (copy), v23 (copy), l_PreloadUsersThumbnail_0 (copy), l_AvatarThumbnailRequests_0 (copy), l_FVariable_0 (copy), v14 (copy)
    if v29:getState().Startup.HomePageDataStatus == l_RetrievalStatus_0.Fetching then
        return v3.resolve("home page data is already fetching");
    else
        if v31 then
            v31:logEvent("fetch_homepage_data_begin");
        end;
        local v35 = tick();
        v29:dispatch(v16(l_RetrievalStatus_0.Fetching));
        v29:dispatch(v17(l_RetrievalStatus_0.Fetching));
        if v22() then
            v29:dispatch(v20(v25));
        end;
        local v37 = v30 and function() --[[ Line: 61 ]]
            -- upvalues: v32 (copy), v29 (copy), v13 (ref), v25 (copy), v26 (copy), l_AppPage_0 (ref), v33 (copy), v31 (copy)
            local v36 = nil;
            if v32 then
                v36 = v32:popPendingPrefetchGuid();
            end;
            return v29:dispatch(v13(v25, v26, l_AppPage_0.Home, nil, v36, v33, v31));
        end or function() --[[ Line: 78 ]]
            -- upvalues: v29 (copy), v15 (ref), v25 (copy), l_GameSortGroups_0 (ref)
            return v29:dispatch(v15(v25, l_GameSortGroups_0.HomeGames, nil));
        end;
        local function _() --[[ Line: 82 ]]
            -- upvalues: v29 (copy), l_FetchFriendsCarousel_0 (ref), v18 (ref), v19 (ref), v25 (copy)
            return v29:dispatch(l_FetchFriendsCarousel_0()):andThen(function(v38) --[[ Line: 83 ]]
                -- upvalues: v29 (ref), v18 (ref), v19 (ref), v25 (ref)
                v29:dispatch(v18(v38));
                v29:dispatch(v19(v25, v38));
                return v38;
            end);
        end;
        local function _() --[[ Line: 89 ]]
            -- upvalues: v21 (ref), l_callOnce_0 (ref), l_MemStorageKeys_0 (ref)
            local v40, v41 = v21();
            if not v40 then
                return;
            else
                l_callOnce_0(l_MemStorageKeys_0.PerfRegressionTestTTI, function() --[[ Line: 95 ]]
                    -- upvalues: v41 (copy)
                    if v41 ~= 0 then
                        task.wait(v41);
                    end;
                end);
                return;
            end;
        end;
        v29:dispatch(l_FetchFriendsCarousel_0()):andThen(function(v43) --[[ Line: 83 ]]
            -- upvalues: v29 (copy), v18 (ref), v19 (ref), v25 (copy)
            v29:dispatch(v18(v43));
            v29:dispatch(v19(v25, v43));
            return v43;
        end):catch(function(v44) --[[ Line: 102 ]]
            -- upvalues: v23 (ref)
            v23:error((("Error fetching friends sort: %*"):format(v44)));
        end);
        v29:dispatch(l_PreloadUsersThumbnail_0({
            v28
        }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER, v34));
        v29:dispatch(l_PreloadUsersThumbnail_0({
            v28
        }, l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON, v34));
        if v30 then
            return v37():andThen(function(_) --[[ Line: 110 ]]
                -- upvalues: v21 (ref), l_callOnce_0 (ref), l_MemStorageKeys_0 (ref), v29 (copy), v16 (ref), l_RetrievalStatus_0 (ref), v17 (ref), v35 (copy), v27 (copy), l_FVariable_0 (ref), v31 (copy)
                local v46, v47 = v21();
                if v46 then
                    l_callOnce_0(l_MemStorageKeys_0.PerfRegressionTestTTI, function() --[[ Line: 95 ]]
                        -- upvalues: v47 (copy)
                        if v47 ~= 0 then
                            task.wait(v47);
                        end;
                    end);
                end;
                v29:dispatch(v16(l_RetrievalStatus_0.Done));
                v29:dispatch(v17(l_RetrievalStatus_0.Done));
                v46 = (tick() - v35) * 1000;
                v27.Diag:reportStats(l_FVariable_0, v46);
                if v31 then
                    v31:logEvent("fetch_homepage_data_end");
                end;
            end, function(_) --[[ Line: 120 ]]
                -- upvalues: v29 (copy), v16 (ref), l_RetrievalStatus_0 (ref), v17 (ref), v31 (copy)
                v29:dispatch(v16(l_RetrievalStatus_0.Failed));
                v29:dispatch(v17(l_RetrievalStatus_0.Failed));
                if v31 then
                    v31:logEvent("fetch_homepage_data_error");
                end;
            end);
        else
            return v37():andThen(function(_) --[[ Line: 129 ]]
                -- upvalues: v29 (copy), v16 (ref), l_RetrievalStatus_0 (ref), v14 (ref), v25 (copy), l_GameSortGroups_0 (ref), v3 (ref)
                v29:dispatch(v16(l_RetrievalStatus_0.Done));
                local v50 = {
                    v29:dispatch(v14(v25, l_GameSortGroups_0.HomeGames))
                };
                return v3.all(v50);
            end, function(v51) --[[ Line: 136 ]]
                -- upvalues: v29 (copy), v16 (ref), l_RetrievalStatus_0 (ref), v3 (ref)
                v29:dispatch(v16(l_RetrievalStatus_0.Failed));
                return v3.reject(v51);
            end):andThen(function(_) --[[ Line: 140 ]]
                -- upvalues: v29 (copy), l_RetrievalStatus_0 (ref), v17 (ref), v35 (copy), v27 (copy), l_FVariable_0 (ref), v31 (copy)
                local v53 = v29:getState().Startup.HomePageDataStatus == l_RetrievalStatus_0.Failed;
                v29:dispatch(v17(v53 and l_RetrievalStatus_0.Failed or l_RetrievalStatus_0.Done));
                local v54 = (tick() - v35) * 1000;
                v27.Diag:reportStats(l_FVariable_0, v54);
                if v31 then
                    v31:logEvent("fetch_homepage_data_end");
                end;
            end, function(_) --[[ Line: 151 ]]
                -- upvalues: v29 (copy), v17 (ref), l_RetrievalStatus_0 (ref), v31 (copy)
                v29:dispatch(v17(l_RetrievalStatus_0.Failed));
                if v31 then
                    v31:logEvent("fetch_homepage_data_error");
                end;
            end);
        end;
    end;
end;
return function(v57, v58, v59, v60, v61, v62, v63, v64, v65) --[[ Line: 160 ]]
    -- upvalues: v56 (copy)
    return function(v66) --[[ Line: 171 ]]
        -- upvalues: v56 (ref), v57 (copy), v58 (copy), v59 (copy), v60 (copy), v61 (copy), v62 (copy), v63 (copy), v64 (copy), v65 (copy)
        return v56(v57, v58, v59, v60, v66, v61, v62, v63, v64, v65);
    end;
end;