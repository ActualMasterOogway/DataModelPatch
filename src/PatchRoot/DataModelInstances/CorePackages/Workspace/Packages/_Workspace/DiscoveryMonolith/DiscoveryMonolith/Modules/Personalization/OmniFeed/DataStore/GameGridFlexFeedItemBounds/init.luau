local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v5 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v6 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
local function v13(v7, v8) --[[ Line: 14 ]] --[[ Name: recalculateFlexBounds ]]
    -- upvalues: v2 (copy)
    local v9 = v2.Dictionary.join(v7 or {});
    local v10 = 1;
    for _, v12 in ipairs(v8) do
        v9[v12.sortKey] = {
            firstIndex = v10, 
            numberOfTiles = v12.numberOfTiles
        };
        v10 = v10 + v12.numberOfTiles;
    end;
    return v9;
end;
return function(v14, v15) --[[ Line: 30 ]]
    -- upvalues: v5 (copy), v13 (copy), v2 (copy), v6 (copy)
    v14 = v14 or {};
    if v15.type == v5.name then
        local v16 = v14[v15.topicId] or {};
        local v17 = v16.flexItemsInput or {};
        local v18 = {};
        local v19 = false;
        for _, v21 in ipairs(v17) do
            if not v19 then
                if v21.sortKey == v15.sortIndex then
                    table.insert(v18, {
                        sortKey = v15.sortIndex, 
                        numberOfTiles = v15.numberOfTiles
                    });
                    v19 = true;
                elseif v21.sortKey > v15.sortIndex then
                    table.insert(v18, {
                        sortKey = v15.sortIndex, 
                        numberOfTiles = v15.numberOfTiles
                    });
                    table.insert(v18, v21);
                    v19 = true;
                else
                    table.insert(v18, v21);
                end;
            else
                table.insert(v18, v21);
            end;
        end;
        if not v19 then
            table.insert(v18, {
                sortKey = v15.sortIndex, 
                numberOfTiles = v15.numberOfTiles
            });
            v19 = true;
        end;
        local v22 = v13(v16.flexItemsBounds, v18);
        return (v2.Dictionary.join(v14, {
            [v15.topicId] = {
                flexItemsInput = v18, 
                flexItemsBounds = v22
            }
        }));
    else
        if v15.type == v6.name then
            local v23 = v14[v15.topicId] or {};
            local v24 = v23.flexItemsInput or {};
            local v25 = {};
            for _, v27 in ipairs(v24) do
                if v27.sortKey ~= v15.sortIndex then
                    table.insert(v25, v27);
                end;
            end;
            local v28 = v13(v23.flexItemsBounds, v25);
            v14 = v2.Dictionary.join(v14, {
                [v15.topicId] = {
                    flexItemsInput = v25, 
                    flexItemsBounds = v28
                }
            });
        end;
        return v14;
    end;
end;