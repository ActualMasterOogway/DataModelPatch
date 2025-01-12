local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_AddSystemInfoToArgs_0 = require(l_Parent_0.DiscoveryUtils).AddSystemInfoToArgs;
return function(v3, v4) --[[ Line: 54 ]]
    -- upvalues: l_Url_0 (copy), l_AddSystemInfoToArgs_0 (copy)
    local l_APIS_URL_0 = l_Url_0.APIS_URL;
    l_AddSystemInfoToArgs_0(v4);
    local v6 = l_Url_0:makeQueryString(v4);
    return v3(string.format("%ssearch-api/omni-search?%s", l_APIS_URL_0, v6), "GET");
end;