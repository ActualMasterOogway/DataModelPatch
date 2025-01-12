local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local v7 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRowData);
local v8 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearOmniFeedItemsRowData);
local v9 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRowData);
local v10 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetOmniFeedItemsRowData);
local function _(v11) --[[ Line: 14 ]] --[[ Name: getItemStartRowNumber ]]
    if v11 then
        if v11.startRowNumber and v11.numberOfRows then
            return v11.startRowNumber + v11.numberOfRows;
        else
            return nil;
        end;
    else
        return 1;
    end;
end;
local function v26(v13, v14, v15, v16) --[[ Line: 26 ]] --[[ Name: getUpdatedRowState ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v17 = v13[v14] or {};
    local v18 = v17[v15];
    if v18 and v18.numberOfRows ~= v16 then
        local v19 = {};
        local v20 = nil;
        for v21, v22 in v17 do
            if v21 ~= v15 and not v22.numberOfRows and not v20 then
                v20 = v6.getUniqueNameForAnalytics(v22.feedItem);
            end;
            local v23 = {
                feedItem = v22.feedItem
            };
            local v24;
            if v15 < v21 then
                local v25 = v19[v21 - 1];
                v24 = if v25 then if v25.startRowNumber and v25.numberOfRows then v25.startRowNumber + v25.numberOfRows else nil else 1;
            else
                v24 = v22.startRowNumber;
            end;
            v23.startRowNumber = v24;
            v23.numberOfRows = if v21 == v15 then v16 else v22.numberOfRows;
            v23.firstItemMissingRowData = v20;
            table.insert(v19, v23);
        end;
        return v3.Dictionary.join(v13, {
            [v14] = v19
        });
    else
        return nil;
    end;
end;
return function(v27, v28) --[[ Line: 62 ]]
    -- upvalues: v10 (copy), v6 (copy), v2 (copy), v3 (copy), v8 (copy), v9 (copy), v26 (copy), v7 (copy)
    v27 = v27 or {};
    if v28.type == v10.name then
        local v29 = v27[v28.appPage] or {};
        local v30 = {};
        local v31 = true;
        local v32 = nil;
        for v33 = 1, #v28.omniFeedItems do
            local v34 = v28.omniFeedItems[v33];
            local v35 = nil;
            if v31 and v33 <= #v29 and v29[v33].feedItem == v34 then
                v32 = v29[v33].firstItemMissingRowData;
                v35 = v29[v33];
            else
                v31 = false;
                local v36 = v6.getUniqueNameForAnalytics(v34);
                v2.assert(v34.numberOfRows ~= nil, (("Missing numberOfRows from server, feed item = %*"):format(v36)));
                local v37 = nil;
                if v34.numberOfRows then
                    if v34.numberOfRows < 0 or v34.numberOfRows > 1 then
                        v37 = nil;
                        if not v32 then
                            v32 = v36;
                        end;
                    else
                        v37 = v34.numberOfRows;
                    end;
                else
                    v37 = 1;
                end;
                local v38 = {
                    feedItem = v34
                };
                local v39 = if v33 > 1 then v30[v33 - 1] else nil;
                v38.startRowNumber = if v39 then if v39.startRowNumber and v39.numberOfRows then v39.startRowNumber + v39.numberOfRows else nil else 1;
                v38.numberOfRows = v37;
                v38.firstItemMissingRowData = v32;
                v35 = v38;
            end;
            table.insert(v30, v35);
        end;
        return (v3.Dictionary.join(v27, {
            [v28.appPage] = v30
        }));
    elseif v28.type == v8.name then
        return (v3.Dictionary.join(v27, {
            [v28.appPage] = {}
        }));
    elseif v28.type == v9.name then
        return v26(v27, v28.appPage, v28.feedItemPosition, v28.numberOfRows) or v27;
    else
        if v28.type == v7.name then
            v27 = v26(v27, v28.appPage, v28.feedItemPosition, 0) or v27;
        end;
        return v27;
    end;
end;