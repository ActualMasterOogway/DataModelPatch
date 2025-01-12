local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.ArgCheck);
return function(v3, v4, v5, v6) --[[ Line: 24 ]] --[[ Name: getEntitiesForPartialFeedItem ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_firstIndex_0 = v4.firstIndex;
    local l_numberOfTiles_0 = v4.numberOfTiles;
    if not l_firstIndex_0 or not l_numberOfTiles_0 or l_firstIndex_0 == 1e999 then
        return {};
    else
        local v9 = 0;
        local v10 = 0;
        local v11 = false;
        if v5 then
            if l_firstIndex_0 == 1 then
                v11 = true;
            elseif l_firstIndex_0 > 1 then
                v2.assert(l_firstIndex_0 > 3);
                v9 = 3;
            end;
            v10 = 3;
        end;
        local v12 = l_firstIndex_0 - v9;
        local v13 = nil;
        v13 = if l_numberOfTiles_0 == 1e999 then #v3 else math.clamp(l_firstIndex_0 + l_numberOfTiles_0 - v10 - 1, 1, #v3);
        local v14 = {};
        for v15 = v12, v13 do
            local v16 = #v14 + 1;
            local v17 = v6 and v16 <= v6 - 1 and 1 or 3;
            local v18 = if v16 ~= 1 and v11 and v6 then v16 + v17 else v16;
            table.insert(v14, (v1.Dictionary.join(v3[v15], {
                uiIndex = v18, 
                topicContentsIndex = v15
            })));
        end;
        return v14;
    end;
end;