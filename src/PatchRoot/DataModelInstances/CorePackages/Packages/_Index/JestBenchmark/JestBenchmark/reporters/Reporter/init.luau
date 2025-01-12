return {
    initializeReporter = function(v0, v1) --[[ Line: 29 ]] --[[ Name: initializeReporter ]]
        local v2 = {};
        local v3 = {};
        local v4 = {};
        local v5 = {};
        local v6 = {};
        local v7 = {};
        local v8 = 0;
        local v9 = nil;
        local function v13(v10) --[[ Line: 47 ]] --[[ Name: report ]]
            -- upvalues: v3 (copy), v9 (ref), v7 (copy), v8 (ref)
            if #v3 == 0 then
                error("Began reporting values before calling Reporter.start");
            end;
            local v11 = os.clock();
            if type(v10) == "function" then
                local v12 = if v9 then v11 - v9 else nil;
                table.insert(v7, v10(v7[v8], v12));
            else
                table.insert(v7, v10);
            end;
            v9 = v11;
            v8 = v8 + 1;
        end;
        local function v15(v14) --[[ Line: 64 ]] --[[ Name: start ]]
            -- upvalues: v2 (copy), v8 (ref), v3 (copy)
            table.insert(v2, v8 + 1);
            table.insert(v3, v14);
        end;
        local function v18() --[[ Line: 70 ]] --[[ Name: stop ]]
            -- upvalues: v2 (copy), v3 (copy), v6 (copy), v4 (copy), v5 (copy), v8 (ref)
            local v16 = table.remove(v2);
            local v17 = table.remove(v3);
            if not v16 or not v17 then
                error("Reporter.stop() called without a corresponding Reporter.start()");
            end;
            table.insert(v6, v17);
            table.insert(v4, v16);
            table.insert(v5, v8);
        end;
        return {
            start = v15, 
            stop = v18, 
            report = v13, 
            finish = function() --[[ Line: 82 ]] --[[ Name: finish ]]
                -- upvalues: v2 (copy), v3 (copy), v6 (copy), v4 (copy), v5 (copy), v7 (copy), v1 (copy), v0 (copy)
                if #v2 > 0 or #v3 > 0 then
                    error("Reporting finished without closing all Reporter.start() sections with a Reporter.stop() call");
                end;
                local v19 = table.create(#v6);
                local v20 = table.create(#v4);
                for v21, v22 in v4 do
                    local v23 = v5[v21];
                    local v24 = table.create(v23 - v22 + 1);
                    table.move(v7, v22, v23, 1, v24);
                    v20[v21] = v1(v24);
                    v19[v21] = v0 .. "_" .. v6[v21];
                end;
                return v19, v20;
            end
        };
    end
};