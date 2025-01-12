local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 5 ]]
    local l_filePath_0 = v2.filePath;
    local v4, v5, v6 = string.match(l_filePath_0, "(%d+)_(%d+)_(%d+)%.?%w*$");
    if v4 == nil or v5 == nil or v6 == nil then
        return nil;
    else
        local v7 = tonumber(v4);
        local v8 = tonumber(v5);
        local v9 = tonumber(v6);
        assert(v7 ~= nil, "userId should not be nil");
        assert(v8 ~= nil, "placeId should not be nil");
        assert(v9 ~= nil, "unixTimestamp should not be nil");
        return {
            userId = v7, 
            placeId = v8, 
            unixTimestamp = v9
        };
    end;
end;