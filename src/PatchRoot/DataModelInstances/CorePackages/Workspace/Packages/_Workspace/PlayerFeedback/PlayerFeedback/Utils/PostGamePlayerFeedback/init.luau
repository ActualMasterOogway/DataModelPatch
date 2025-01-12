local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5, v6, v7, v8, v9) --[[ Line: 15 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    assert(type(v5) == "string", "PostGamePlayerFeedback request expects channelId to be a string");
    assert(type(v6) == "string", "PostGamePlayerFeedback request expects assetId to be a string");
    assert(type(v7) == "string", "PostGamePlayerFeedback request expects a valid category type");
    return v4(string.format("%sasset-reviews-api/v1/channels/%s/assets/%s/reviews", l_Url_0.APIS_URL, v5, v6), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            category_type = v7, 
            category_option_ids = v8, 
            comment = v9
        })
    });
end;