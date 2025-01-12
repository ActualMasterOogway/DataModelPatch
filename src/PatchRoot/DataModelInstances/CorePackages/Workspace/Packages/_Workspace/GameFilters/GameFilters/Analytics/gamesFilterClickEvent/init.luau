local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.t);
local v4 = v3.strictInterface({
    buttonName = v3.string, 
    filterId = v3.string, 
    selectedOptionId = v3.string, 
    previousOptionId = v3.optional(v3.string), 
    gameSetTypeId = v3.string, 
    gameSetTargetId = v3.optional(v3.number), 
    sortPos = v3.number
});
local v5 = {
    [l_AppPage_0.Games] = v4
};
return function(v6, v7, v8) --[[ Line: 25 ]] --[[ Name: gamesFilterClickEvent ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy)
    local v9 = v5[v7];
    if v9 then
        local v10, v11 = v9(v8);
        if not v10 then
            l_mutedError_0(v11);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check gamesFilterClick event parameters", v7));
    end;
    v6:sendEventDeferred(v7, "gamesFilterClick", v8);
end;