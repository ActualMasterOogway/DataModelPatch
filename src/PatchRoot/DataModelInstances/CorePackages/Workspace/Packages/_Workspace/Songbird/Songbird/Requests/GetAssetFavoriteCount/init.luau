local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v4(string.format("%s/v1/favorites/assets/%s/count", l_Url_0.CATALOG_URL, v5), "GET", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;