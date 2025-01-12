local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = {
    new = function() --[[ Line: 9 ]] --[[ Name: new ]]
        return {};
    end
};
v3.mockFromExploreApi = function(v4, v5) --[[ Line: 15 ]] --[[ Name: mockFromExploreApi ]]
    -- upvalues: v3 (copy)
    local v6 = v3.fromExploreJsonData({
        filterId = v4, 
        filterType = "", 
        filterDisplayName = "", 
        filterOptions = {
            {
                optionId = v4 .. "_option", 
                optionDisplayName = ""
            }
        }, 
        defaultOptionId = v4 .. "_option", 
        selectedOptionId = v4 .. "_option"
    });
    v6.selectedOptionDisplayName = v5 or "";
    return v6;
end;
v3.fromExploreJsonData = function(v7) --[[ Line: 35 ]] --[[ Name: fromExploreJsonData ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v8 = v3.new();
    v8.filterId = v7.filterId;
    v8.filterType = v7.filterType;
    v8.filterDisplayName = v7.filterDisplayName;
    v8.defaultOptionId = v7.defaultOptionId;
    v8.selectedOptionId = v7.selectedOptionId;
    local v9 = {};
    for _, v11 in ipairs(v7.filterOptions) do
        table.insert(v9, {
            optionId = v11.optionId, 
            optionDisplayName = v11.optionDisplayName
        });
        if v11.optionId == v7.selectedOptionId then
            v1.assert(v8.selectedOptionDisplayName == nil, "Multiple selected options found");
            v8.selectedOptionDisplayName = v11.optionDisplayName;
        end;
    end;
    v8.filterOptions = v9;
    return v8;
end;
return v3;