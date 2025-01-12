local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 19 ]]
    -- upvalues: l_Url_0 (copy)
    local l_APIS_URL_0 = l_Url_0.APIS_URL;
    local v5 = l_Url_0:makeQueryString(v3);
    return v2(string.format("%ssearch-api/search-landing-page?%s", l_APIS_URL_0, v5), "GET");
end;