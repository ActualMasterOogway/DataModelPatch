local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local l_getSetTimeoutFn_0 = require(script.helpers).getSetTimeoutFn;
local v3 = {
    timeout = 5000, 
    interval = 50
};
return function(v4, v5, v6) --[[ Line: 19 ]] --[[ Name: waitForExpect ]]
    -- upvalues: v3 (copy), l_getSetTimeoutFn_0 (copy), v1 (copy)
    local v7 = v5 or v3.timeout;
    local v8 = v6 or v3.interval;
    local v9 = l_getSetTimeoutFn_0();
    if v8 < 50 then
        v8 = 50;
    end;
    local v10 = math.ceil(v7 / v8);
    local v11 = 0;
    return v1.new(function(v12, v13) --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v10 (copy), v9 (copy), v8 (ref), v1 (ref), v4 (copy)
        local v14 = nil;
        local v15 = nil;
        v14 = function(v16) --[[ Line: 32 ]] --[[ Name: rejectOrRerun ]]
            -- upvalues: v11 (ref), v10 (ref), v13 (copy), v9 (ref), v15 (ref), v8 (ref)
            if v10 < v11 then
                v13(v16);
                return;
            else
                v9(v15, v8);
                return;
            end;
        end;
        v15 = function() --[[ Line: 39 ]] --[[ Name: runExpectation ]]
            -- upvalues: v11 (ref), v1 (ref), v4 (ref), v12 (copy), v14 (ref)
            v11 = v11 + 1;
            xpcall(function() --[[ Line: 41 ]]
                -- upvalues: v1 (ref), v4 (ref), v12 (ref), v14 (ref)
                v1.delay(0):andThen(function() --[[ Line: 43 ]]
                    -- upvalues: v4 (ref)
                    return v4();
                end):andThen(function() --[[ Line: 46 ]]
                    -- upvalues: v1 (ref)
                    return v1.delay(0);
                end):andThen(function() --[[ Line: 49 ]]
                    -- upvalues: v12 (ref)
                    return v12();
                end):catch(v14);
            end, function(v17) --[[ Line: 53 ]]
                -- upvalues: v14 (ref)
                v14(v17);
            end);
        end;
        v9(v15, 50);
    end);
end;