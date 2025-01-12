local l_Parent_0 = script:FindFirstAncestor("DiscoveryTestHelpers").Parent;
local v1 = require(l_Parent_0.Promise);
local function v4(v2, v3) --[[ Line: 5 ]] --[[ Name: checkAction ]]
    if not v2 then
        return;
    elseif typeof(v2) == "function" then
        v3(v2());
        return;
    elseif typeof(v2) == "table" then
        if v2.tap and typeof(v2.tap) == "function" then
            v2:tap(v3);
            return;
        else
            v3(v2);
            return;
        end;
    else
        v3(v2);
        return;
    end;
end;
return function(v5, v6) --[[ Line: 25 ]] --[[ Name: makeActionCheckMiddleware ]]
    -- upvalues: v1 (copy), v4 (copy)
    return function(v7, v8) --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v1 (ref), v4 (ref), v5 (copy)
        return function(v9) --[[ Line: 27 ]]
            -- upvalues: v6 (ref), v1 (ref), v8 (copy), v4 (ref), v5 (ref), v7 (copy)
            if typeof(v9) == "function" then
                if v6 then
                    return v1.resolve();
                else
                    local v10 = v9(v8);
                    v4(v10, v5);
                    return v10;
                end;
            else
                v4(v9, v5);
                return v7(v9);
            end;
        end;
    end;
end;