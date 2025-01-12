local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_script_FirstAncestor_0.Analytics.filterImpressionsEvent);
return function(v5, v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: sendFilterImpressions ]]
    -- upvalues: v2 (copy), v4 (copy)
    if not v5 then
        return;
    elseif not v6 or #v6 == 0 then
        return;
    elseif not v7 or #v7 == 0 then
        return;
    else
        local v10 = {
            gameSetTypeId = v9.gameSetTypeId, 
            gameSetTargetId = v9.gameSetTargetId, 
            sortPos = v9.sortPos
        };
        local v11 = {};
        local v12 = {};
        local v13 = {};
        for _, v15 in v6 do
            local v16 = v7[v15];
            if v16 then
                table.insert(v11, v15);
                table.insert(v12, v16.filterId);
                table.insert(v13, v16.selectedOptionId);
            end;
        end;
        local v17 = #v12;
        v2.assert(v17 == #v11);
        v2.assert(v17 == #v13);
        v10.absPositions = table.concat(v11, ",");
        v10.filterIds = table.concat(v12, ",");
        v10.selectedOptionIds = table.concat(v13, ",");
        v4(v5, v8, v10);
        return;
    end;
end;