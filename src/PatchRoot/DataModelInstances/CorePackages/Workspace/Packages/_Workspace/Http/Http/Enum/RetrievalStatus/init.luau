local v0 = {};
local v1 = {
    NotStarted = "NotStarted", 
    Fetching = "Fetching", 
    Done = "Done", 
    Failed = "Failed"
};
setmetatable(v0, {
    __newindex = function(_, _, _) --[[ Line: 11 ]] --[[ Name: __newindex ]]

    end, 
    __index = function(_, v6) --[[ Line: 12 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy)
        assert(v1[v6] ~= nil, "RetrievalStatus Enum has no value: " .. tostring(v6));
        return v1[v6];
    end
});
return v0;