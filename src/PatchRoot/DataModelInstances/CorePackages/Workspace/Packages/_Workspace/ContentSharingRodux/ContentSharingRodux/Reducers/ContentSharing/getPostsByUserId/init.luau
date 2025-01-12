local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContentSharingRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Utils.mergeSortPosts);
local v5 = {
    byUserId = {}
};
local function _(v6, v7) --[[ Line: 17 ]]
    if v6 == nil or v7 == nil then
        return nil;
    else
        return (math.max(v6, v7));
    end;
end;
local function _(v9, v10) --[[ Line: 25 ]]
    if v9 == nil or v10 == nil then
        return nil;
    else
        return (math.min(v9, v10));
    end;
end;
local function _(v12) --[[ Line: 33 ]]
    return {
        nextTimeCursor = v12.responseBody.nextTimeCursor, 
        posts = v12.responseBody.posts, 
        previousTimeCursor = v12.responseBody.previousTimeCursor
    };
end;
local function v21(v14, v15) --[[ Line: 41 ]]
    -- upvalues: v4 (copy), v2 (copy)
    if #v15.responseBody.posts == 0 then
        return v14;
    else
        local v16 = tostring(v15.responseBody.posts[1].creatorUserId);
        local v17 = {};
        if v14.byUserId[v16] ~= nil then
            local v18 = {};
            local l_nextTimeCursor_0 = v14.byUserId[v16].nextTimeCursor;
            local l_nextTimeCursor_1 = v15.responseBody.nextTimeCursor;
            v18.nextTimeCursor = if not (l_nextTimeCursor_0 ~= nil) or l_nextTimeCursor_1 == nil then nil else math.max(l_nextTimeCursor_0, l_nextTimeCursor_1);
            v18.posts = v4(v14.byUserId[v16].posts or {}, v15.responseBody.posts);
            l_nextTimeCursor_0 = v14.byUserId[v16].previousTimeCursor;
            l_nextTimeCursor_1 = v15.responseBody.previousTimeCursor;
            v18.previousTimeCursor = if not (l_nextTimeCursor_0 ~= nil) or l_nextTimeCursor_1 == nil then nil else math.min(l_nextTimeCursor_0, l_nextTimeCursor_1);
            v17[v16] = v18;
        else
            v17[v16] = {
                nextTimeCursor = v15.responseBody.nextTimeCursor, 
                posts = v15.responseBody.posts, 
                previousTimeCursor = v15.responseBody.previousTimeCursor
            };
        end;
        return {
            byUserId = v2.Dictionary.join(v14.byUserId, v17)
        };
    end;
end;
local function v25(v22, v23) --[[ Line: 68 ]]
    -- upvalues: v2 (copy)
    local v24 = tostring(v23.queryArgs.userId);
    return {
        byUserId = v2.Dictionary.join(v22.byUserId, {
            [v24] = {
                nextTimeCursor = v23.responseBody.nextTimeCursor, 
                posts = v23.responseBody.posts, 
                previousTimeCursor = v23.responseBody.previousTimeCursor
            }
        })
    };
end;
return function(v26) --[[ Line: 78 ]]
    -- upvalues: v3 (copy), v5 (copy), v25 (copy), v21 (copy)
    local l_ContentSharingNetworking_0 = v26.ContentSharingNetworking;
    return v3.createReducer(v5, {
        [l_ContentSharingNetworking_0.GetPostsByUserId.Succeeded.name] = v25, 
        [l_ContentSharingNetworking_0.GetPostsByPostId.Succeeded.name] = v25, 
        [l_ContentSharingNetworking_0.GetPostsByCursor.Succeeded.name] = v21
    });
end;