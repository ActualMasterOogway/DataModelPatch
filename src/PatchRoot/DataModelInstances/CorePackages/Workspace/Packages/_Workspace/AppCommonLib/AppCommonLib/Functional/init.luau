return {
    Filter = function(v0, v1) --[[ Line: 11 ]] --[[ Name: Filter ]]
        local v2 = {};
        for v3 = 1, #v0 do
            local v4 = v0[v3];
            if v1(v4, v3) then
                table.insert(v2, v4);
            end;
        end;
        return v2;
    end, 
    Map = function(v5, v6) --[[ Line: 27 ]] --[[ Name: Map ]]
        local v7 = {};
        for v8 = 1, #v5 do
            v7[v8] = v6(v5[v8], v8);
        end;
        return v7;
    end, 
    MapReverse = function(v9, v10) --[[ Line: 40 ]] --[[ Name: MapReverse ]]
        local v11 = {};
        for v12 = #v9, 1, -1 do
            v11[v12] = v10(v9[v12], v12);
        end;
        return v11;
    end, 
    FilterMap = function(v13, v14) --[[ Line: 56 ]] --[[ Name: FilterMap ]]
        local v15 = {};
        for v16 = 1, #v13 do
            local v17 = v14(v13[v16], v16);
            if v17 ~= nil then
                table.insert(v15, v17);
            end;
        end;
        return v15;
    end, 
    Fold = function(v18, v19, v20) --[[ Line: 74 ]] --[[ Name: Fold ]]
        local l_v19_0 = v19;
        for v22 = 1, #v18 do
            l_v19_0 = v20(l_v19_0, v18[v22], v22);
        end;
        return l_v19_0;
    end, 
    FoldDictionary = function(v23, v24, v25) --[[ Line: 87 ]] --[[ Name: FoldDictionary ]]
        local l_v24_0 = v24;
        for v27, v28 in pairs(v23) do
            l_v24_0 = v25(l_v24_0, v27, v28);
        end;
        return l_v24_0;
    end, 
    Take = function(v29, v30, v31) --[[ Line: 100 ]] --[[ Name: Take ]]
        v31 = v31 or 1;
        local v32 = v30 + (v31 - 1);
        if #v29 < v32 then
            v32 = #v29;
        end;
        local v33 = {};
        for v34 = v31, v32 do
            local v35 = v29[v34];
            v33[v34 - (v31 - 1)] = v35;
        end;
        return v33;
    end, 
    Find = function(v36, v37) --[[ Line: 122 ]] --[[ Name: Find ]]
        for v38, v39 in ipairs(v36) do
            if v39 == v37 then
                return v38;
            end;
        end;
        return nil;
    end
};