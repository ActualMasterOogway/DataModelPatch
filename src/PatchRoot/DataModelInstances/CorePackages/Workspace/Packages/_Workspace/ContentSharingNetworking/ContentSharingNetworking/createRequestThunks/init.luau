local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createDeletePost);
local v2 = require(l_networkRequests_0.createGetPostsByCursor);
local v3 = require(l_networkRequests_0.createGetPostsByPostId);
local v4 = require(l_networkRequests_0.createGetPostsByUserId);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), l_networkRequests_0 (copy)
    return {
        DeletePost = v1(v5), 
        GetPostsByCursor = v2(v5), 
        GetPostsByPostId = v3(v5), 
        GetPostsByUserId = v4(v5), 
        GetActiveCategories = require(l_networkRequests_0.createGetActiveCategories)(v5)
    };
end;