local v0 = require(script.Parent.getCalls);
local v1 = require(script.Parent.cmpLiteralArgs);
local v2 = require(script.Parent.cmpPredicateArgs);
local v3 = require(script.Parent.fmtArgs);
local v13 = {
    args = function(v4, v5) --[[ Line: 10 ]] --[[ Name: args ]]
        -- upvalues: v0 (copy), v3 (copy)
        local v6 = v0(v4);
        local v7 = #v6;
        if v7 == 0 then
            return false, "mock was not called";
        else
            local v8 = nil;
            for v9 = 1, v7 do
                local v10 = nil;
                local v11, v12 = v5(v6[v9].args);
                v10 = v11;
                v8 = v12;
                if v10 then
                    return true;
                end;
            end;
            if not v8 then
                v8 = v3(v6[v7].args) .. " did not match";
            end;
            if v7 > 1 then
                v8 = v8 .. " (+" .. v7 - 1 .. " other calls)";
            end;
            return false, v8;
        end;
    end
};
v13.literals = function(v14, ...) --[[ Line: 36 ]] --[[ Name: literals ]]
    -- upvalues: v13 (copy), v1 (copy)
    local v15 = table.pack(...);
    return v13.args(v14, function(v16) --[[ Line: 38 ]]
        -- upvalues: v1 (ref), v15 (copy)
        return v1(v15, v16);
    end);
end;
v13.predicates = function(v17, ...) --[[ Line: 43 ]] --[[ Name: predicates ]]
    -- upvalues: v13 (copy), v2 (copy)
    local v18 = table.pack(...);
    return v13.args(v17, function(v19) --[[ Line: 45 ]]
        -- upvalues: v2 (ref), v18 (copy)
        return v2(v18, v19);
    end);
end;
return v13;