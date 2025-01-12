local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagLuaAppDeprecateGamesApiCalls_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDeprecateGamesApiCalls;
return function(v3, v4) --[[ Line: 77 ]]
    -- upvalues: l_FFlagLuaAppDeprecateGamesApiCalls_0 (copy), l_Url_0 (copy)
    if l_FFlagLuaAppDeprecateGamesApiCalls_0 then
        assert(false, "GamesGetList is deprecated; should not be called anymore");
    end;
    local v5 = l_Url_0:makeQueryString(v4);
    return v3(string.format("%sv1/games/list?%s", l_Url_0.GAME_URL, v5), "GET");
end;