local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/explore-api/v1/get-sorts"
});
return function(v5, v6, v7, v8) --[[ Line: 28 ]]
    -- upvalues: l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_UrlBuilder_0 (copy), v4 (copy)
    local v9 = {
        sessionId = v8, 
        sortsPageToken = v6
    };
    if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
        for v10, v11 in v7 do
            if v9[v10] then
                warn((("URL parameter %* already exists"):format(v10)));
            else
                v9[v10] = v11;
            end;
        end;
    end;
    return v5(l_UrlBuilder_0.addQueryString(v4(), v9), "GET");
end;