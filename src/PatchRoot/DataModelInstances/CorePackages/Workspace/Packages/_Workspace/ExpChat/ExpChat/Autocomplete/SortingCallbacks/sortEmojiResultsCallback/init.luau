local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v3 = require(l_Parent_0.EmojiList);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagSortAutocompleteByPopularity);
return function(v5) --[[ Line: 7 ]]
    -- upvalues: v4 (copy), l_List_0 (copy), v3 (copy)
    if v4() then
        return l_List_0.sort(v5, function(v6, v7) --[[ Line: 11 ]]
            -- upvalues: v3 (ref)
            if v3[v6].popularity == v3[v7].popularity then
                return v6 < v7;
            else
                return v3[v6].popularity < v3[v7].popularity;
            end;
        end);
    else
        return l_List_0.sort(v5);
    end;
end;