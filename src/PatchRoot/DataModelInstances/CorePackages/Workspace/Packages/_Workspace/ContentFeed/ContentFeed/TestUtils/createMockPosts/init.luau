local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 5 ]]
    local v3 = 1;
    local v4 = {};
    for _, v6 in pairs(v2) do
        table.insert(v4, {
            caption = "caption", 
            creatorUserId = 1, 
            experienceContext = {
                experienceId = v6.experienceId or "123", 
                placeId = "456"
            }, 
            postId = v6.postId or "123", 
            screenshotMetadata = {
                height = 101, 
                width = 101, 
                fullSizeUrl = ""
            }, 
            uploadedAtTimestamp = v3
        });
        v3 = v3 + 1;
    end;
    return v4;
end;