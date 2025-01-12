local l_Parent_0 = script:FindFirstAncestor("GameIconRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4) --[[ Line: 19 ]]
    -- upvalues: l_Url_0 (copy)
    local v5 = l_Url_0:makeQueryString({
        universeIds = table.concat(v3, ","), 
        format = "png", 
        size = v4
    });
    return v2(string.format("%sv1/games/icons?%s", l_Url_0.THUMBNAILS_URL, v5), "GET");
end;