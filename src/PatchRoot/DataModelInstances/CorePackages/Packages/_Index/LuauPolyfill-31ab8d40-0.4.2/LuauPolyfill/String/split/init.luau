local v0 = require(script.Parent.findOr);
local v1 = require(script.Parent.slice);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
local l_MAX_SAFE_INTEGER_0 = require(l_Parent_0.Number).MAX_SAFE_INTEGER;
return function(v5, v6, v7) --[[ Line: 12 ]] --[[ Name: split ]]
    -- upvalues: l_MAX_SAFE_INTEGER_0 (copy), v0 (copy), v1 (copy)
    if v6 == nil then
        return {
            v5
        };
    elseif v7 == 0 then
        return {};
    else
        local v8 = if not (v7 ~= nil) or v7 < 0 then l_MAX_SAFE_INTEGER_0 else v7;
        local v9 = nil;
        if typeof(v6) == "string" then
            if v6 == "" then
                local v10 = {};
                for v11 in v5:gmatch(".") do
                    table.insert(v10, v11);
                end;
                return v10;
            else
                v9 = {
                    v6
                };
            end;
        else
            v9 = v6;
        end;
        local v12 = 1;
        local v13 = {};
        local v14 = nil;
        local v15, v16 = utf8.len(v5);
        assert(v15 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v5, (tostring(v16))));
        repeat
            local v17 = v0(v5, v9, v12);
            if v17 ~= nil then
                table.insert(v13, v1(v5, v12, v17.index));
                local v18 = utf8.len(v17.match);
                v12 = v17.index + v18;
            else
                table.insert(v13, v1(v5, v12, nil));
            end;
            if v17 ~= nil then
                v14 = v17;
            end;
        until v17 == nil or v15 < v12 or v8 <= #v13;
        if v14 ~= nil then
            local v19, v20 = utf8.len(v14.match);
            assert(v19 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v14.match, (tostring(v20))));
            if v14.index + v19 == v15 + 1 then
                table.insert(v13, "");
            end;
        end;
        return v13;
    end;
end;