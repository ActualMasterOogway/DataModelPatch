local l_Parent_0 = script.Parent.Parent.Parent;
local l_expect_0 = require(l_Parent_0.JestGlobals).expect;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local _ = require(l_Parent_0.LuauRegExp);
return {
    default = function(v4, v5) --[[ Line: 26 ]]
        return function(...) --[[ Line: 27 ]]
            -- upvalues: v5 (copy), v4 (copy)
            local v6 = {
                ...
            };
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
                -- upvalues: v5 (ref), v6 (copy)
                return v5(table.unpack(v6));
            end);
            if not l_status_0 then
                v4(l_result_0);
            end;
            return l_result_0;
        end;
    end, 
    withError = function(v9, v10) --[[ Line: 40 ]] --[[ Name: withError ]]
        -- upvalues: l_console_0 (copy), l_expect_0 (copy)
        local v11 = nil;
        local l_error_0 = l_console_0.error;
        l_console_0.error = function(v13) --[[ Line: 44 ]]
            -- upvalues: v11 (ref)
            v11 = v13;
            return v11;
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 49 ]]
            -- upvalues: v9 (copy), l_expect_0 (ref), v11 (ref), v10 (copy)
            local v14 = v9();
            l_expect_0(v11).toMatch(v10);
            return v14;
        end);
        l_console_0.error = l_error_0;
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end
};