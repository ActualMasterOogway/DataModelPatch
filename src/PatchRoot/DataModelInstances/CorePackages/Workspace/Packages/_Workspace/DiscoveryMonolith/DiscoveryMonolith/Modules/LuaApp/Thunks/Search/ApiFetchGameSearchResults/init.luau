local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReportToDiagByCountryCode_0 = require(l_Parent_0.Analytics).ReportToDiagByCountryCode;
local v4 = require(l_Parent_0.Promise);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v7 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v8 = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch);
local v9 = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults);
local v10 = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"));
local v11 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppURLEncodeGameSearchQuery);
return function(v12, v13) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v11 (copy), l_HttpService_0 (copy), v7 (copy), v6 (copy), v8 (copy), v9 (copy), l_ReportToDiagByCountryCode_0 (copy), v10 (copy)
    return function(v14) --[[ Line: 19 ]]
        -- upvalues: v13 (copy), v4 (ref), v11 (ref), l_HttpService_0 (ref), v7 (ref), v6 (ref), v8 (ref), v12 (copy), v9 (ref), l_ReportToDiagByCountryCode_0 (ref), v10 (ref)
        local l_searchKeyword_0 = v13.searchKeyword;
        local l_searchUuid_0 = v13.searchUuid;
        if not l_searchUuid_0 then
            return v4.reject("Must have a searchUuid.");
        elseif not l_searchKeyword_0 then
            return v4.reject("Must have a searchKeyword to search with.");
        else
            if v11 then
                l_searchKeyword_0 = l_HttpService_0:UrlEncode(l_searchKeyword_0);
            end;
            if v14:getState().RequestsStatus.SearchesInGamesStatus[l_searchUuid_0] == v7.Fetching then
                return v4.resolve("Search with Uuid " .. l_searchUuid_0 .. " has been debounced");
            else
                local v17 = {
                    SearchQuery = l_searchKeyword_0, 
                    SessionId = l_searchUuid_0, 
                    PageType = "all", 
                    GlobalSessionId = v13.omniSearchUuid
                };
                if v13.isAppend then
                    local v18 = v14:getState().Search.SearchesInGames[l_searchUuid_0];
                    assert(v18, "Should always have SearchesInGames for searchUuid");
                    v17.PageToken = v18.nextPageToken;
                end;
                v14:dispatch(v6(l_searchUuid_0, v7.Fetching));
                return v8(v12, v17):andThen(function(v19) --[[ Line: 56 ]]
                    -- upvalues: v14 (copy), v9 (ref), v12 (ref), v13 (ref), l_ReportToDiagByCountryCode_0 (ref), v10 (ref)
                    local v20 = v14:dispatch(v9(v12, v13, v19));
                    l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v19.responseTimeMs, v10);
                    return v20;
                end, function(v21) --[[ Line: 61 ]]
                    -- upvalues: v14 (copy), v6 (ref), l_searchUuid_0 (copy), v7 (ref), v4 (ref)
                    v14:dispatch(v6(l_searchUuid_0, v7.Failed));
                    return v4.reject(v21);
                end);
            end;
        end;
    end;
end;