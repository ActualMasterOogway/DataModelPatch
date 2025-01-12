local l_Parent_0 = script:FindFirstAncestor("PlayerFeedback").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4) --[[ Line: 9 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v3) == "string", "GamesGetPlayerFeedbackMetadata request expects channelId to be a string");
    assert(type(v4) == "string", "GamesGetPlayerFeedbackMetadata request expects assetId to be a string");
    return v2(string.format("%sasset-reviews-api/v1/channels/%s/assets/%s", l_Url_0.APIS_URL, v3, v4), "GET");
end;