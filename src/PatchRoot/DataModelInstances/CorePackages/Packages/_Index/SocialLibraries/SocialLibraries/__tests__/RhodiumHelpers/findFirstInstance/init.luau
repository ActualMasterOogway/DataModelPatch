local function _(v0, v1) --[[ Line: 6 ]] --[[ Name: getProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0[v1];
    end);
    return l_status_0 == true and l_result_0 or nil;
end;
local function v11(v5, v6) --[[ Line: 14 ]] --[[ Name: propertyMatch ]]
    for v7, v8 in pairs(v6) do
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 7 ]]
            -- upvalues: v5 (copy), v7 (copy)
            return v5[v7];
        end);
        if (l_status_1 == true and l_result_1 or nil) ~= v8 then
            return false;
        end;
    end;
    return true;
end;
return function(v12, v13) --[[ Line: 24 ]] --[[ Name: findFirstInstance ]]
    -- upvalues: v11 (copy)
    for _, v15 in ipairs(v12:GetDescendants()) do
        if v11(v15, v13) then
            return v15;
        end;
    end;
    return nil;
end;