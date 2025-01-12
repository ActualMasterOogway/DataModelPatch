local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagLuaAppDeprecateGamesApiCalls_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDeprecateGamesApiCalls;
local v3 = {
    ChatGames = "ChatSorts", 
    Games = "GamesDefaultSorts", 
    HomeGames = "HomeSorts", 
    GamesSeeAll = "GamesAllSorts", 
    UnifiedHomeSorts = "UnifiedHomeSorts"
};
return function(v4, v5) --[[ Line: 50 ]]
    -- upvalues: l_FFlagLuaAppDeprecateGamesApiCalls_0 (copy), l_Url_0 (copy), v3 (copy)
    if l_FFlagLuaAppDeprecateGamesApiCalls_0 then
        assert(false, "GamesGetSorts is deprecated; should not be called anymore");
    end;
    return v4(string.format("%sv1/games/sorts?gameSortsContext=%s", l_Url_0.GAME_URL, v3[v5]), "GET");
end;