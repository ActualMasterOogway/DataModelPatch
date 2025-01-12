local _ = game:GetService("CorePackages");
return {
    TableConcat = function(v1, v2) --[[ Line: 14 ]] --[[ Name: TableConcat ]]
        for v3 = 1, #v2 do
            v1[#v1 + 1] = v2[v3];
        end;
        return v1;
    end, 
    SortByName = function(v4) --[[ Line: 23 ]] --[[ Name: SortByName ]]
        table.sort(v4, function(v5, v6) --[[ Line: 24 ]] --[[ Name: compareInstanceNames ]]
            return v5.Name < v6.Name;
        end);
        return v4;
    end
};