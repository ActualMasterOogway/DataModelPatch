local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2, v3, v4) --[[ Line: 25 ]]
    local v5 = {};
    if v3 then
        v5 = {};
        for v6, v7 in v2 do
            if v4 ~= nil then
                v5[v6] = v3(v4, v7, v6);
            else
                v5[v6] = v3(v7, v6);
            end;
        end;
        return v5;
    else
        v5 = {};
        for v8, v9 in v2 do
            v5[v8] = v9;
        end;
        return v5;
    end;
end;