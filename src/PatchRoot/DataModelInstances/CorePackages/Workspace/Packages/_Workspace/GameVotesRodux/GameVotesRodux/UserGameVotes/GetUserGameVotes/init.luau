local l_Parent_0 = script:FindFirstAncestor("GameVotesRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 19 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v3) == "string", "GetUserGameVotes request expects universeId to be a string");
    return v2(string.format("%sv1/games/%s/votes/user", l_Url_0.GAME_URL, v3), "GET");
end;