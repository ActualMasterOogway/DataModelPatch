local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.JestGlobals);
local l_expect_0 = v3.expect;
local l_jest_0 = v3.jest;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local function _(v7, v8) --[[ Line: 14 ]] --[[ Name: wrapTestFunction ]]
    -- upvalues: l_console_0 (copy), l_jest_0 (copy), v2 (copy), l_expect_0 (copy)
    return function(...) --[[ Line: 15 ]]
        -- upvalues: l_console_0 (ref), v8 (copy), l_jest_0 (ref), v2 (ref), v7 (copy), l_expect_0 (ref)
        local v9 = table.pack(...);
        local v10 = l_console_0[v8];
        local v11 = l_jest_0.fn(function() --[[ Line: 19 ]]

        end);
        l_console_0[v8] = v11;
        return v2.new(function(v12) --[[ Line: 23 ]]
            -- upvalues: v7 (ref), v9 (copy)
            v12(if v7 then v7(table.unpack(v9)) else nil);
        end):andThen(function() --[[ Line: 28 ]]
            -- upvalues: l_expect_0 (ref), v11 (copy), l_console_0 (ref), v8 (ref), v10 (copy)
            l_expect_0(v11).toMatchSnapshot();
            v11:mockClear();
            l_console_0[v8] = v10;
        end):catch(function(v13) --[[ Line: 34 ]]
            -- upvalues: l_expect_0 (ref), v11 (copy), l_console_0 (ref), v8 (ref), v10 (copy)
            l_expect_0(v11).toMatchSnapshot();
            v11:mockClear();
            l_console_0[v8] = v10;
            error(v13);
        end);
    end;
end;
v0.withErrorSpy = function(v15, ...) --[[ Line: 51 ]] --[[ Name: withErrorSpy ]]
    -- upvalues: l_console_0 (copy), l_jest_0 (copy), v2 (copy), l_expect_0 (copy)
    local v16 = {
        ...
    };
    local v17 = v16[2];
    local v18 = "error";
    v16[2] = function(...) --[[ Line: 15 ]]
        -- upvalues: l_console_0 (ref), v18 (copy), l_jest_0 (ref), v2 (ref), v17 (copy), l_expect_0 (ref)
        local v19 = table.pack(...);
        local v20 = l_console_0[v18];
        local v21 = l_jest_0.fn(function() --[[ Line: 19 ]]

        end);
        l_console_0[v18] = v21;
        return v2.new(function(v22) --[[ Line: 23 ]]
            -- upvalues: v17 (ref), v19 (copy)
            v22(if v17 then v17(table.unpack(v19)) else nil);
        end):andThen(function() --[[ Line: 28 ]]
            -- upvalues: l_expect_0 (ref), v21 (copy), l_console_0 (ref), v18 (ref), v20 (copy)
            l_expect_0(v21).toMatchSnapshot();
            v21:mockClear();
            l_console_0[v18] = v20;
        end):catch(function(v23) --[[ Line: 34 ]]
            -- upvalues: l_expect_0 (ref), v21 (copy), l_console_0 (ref), v18 (ref), v20 (copy)
            l_expect_0(v21).toMatchSnapshot();
            v21:mockClear();
            l_console_0[v18] = v20;
            error(v23);
        end);
    end;
    return v15(table.unpack(v16));
end;
v0.withWarningSpy = function(v24, ...) --[[ Line: 60 ]] --[[ Name: withWarningSpy ]]
    -- upvalues: l_console_0 (copy), l_jest_0 (copy), v2 (copy), l_expect_0 (copy)
    local v25 = {
        ...
    };
    local v26 = v25[2];
    local v27 = "warn";
    v25[2] = function(...) --[[ Line: 15 ]]
        -- upvalues: l_console_0 (ref), v27 (copy), l_jest_0 (ref), v2 (ref), v26 (copy), l_expect_0 (ref)
        local v28 = table.pack(...);
        local v29 = l_console_0[v27];
        local v30 = l_jest_0.fn(function() --[[ Line: 19 ]]

        end);
        l_console_0[v27] = v30;
        return v2.new(function(v31) --[[ Line: 23 ]]
            -- upvalues: v26 (ref), v28 (copy)
            v31(if v26 then v26(table.unpack(v28)) else nil);
        end):andThen(function() --[[ Line: 28 ]]
            -- upvalues: l_expect_0 (ref), v30 (copy), l_console_0 (ref), v27 (ref), v29 (copy)
            l_expect_0(v30).toMatchSnapshot();
            v30:mockClear();
            l_console_0[v27] = v29;
        end):catch(function(v32) --[[ Line: 34 ]]
            -- upvalues: l_expect_0 (ref), v30 (copy), l_console_0 (ref), v27 (ref), v29 (copy)
            l_expect_0(v30).toMatchSnapshot();
            v30:mockClear();
            l_console_0[v27] = v29;
            error(v32);
        end);
    end;
    return v24(table.unpack(v25));
end;
v0.withLogSpy = function(v33, ...) --[[ Line: 69 ]] --[[ Name: withLogSpy ]]
    -- upvalues: l_console_0 (copy), l_jest_0 (copy), v2 (copy), l_expect_0 (copy)
    local v34 = {
        ...
    };
    local v35 = v34[2];
    local v36 = "log";
    v34[2] = function(...) --[[ Line: 15 ]]
        -- upvalues: l_console_0 (ref), v36 (copy), l_jest_0 (ref), v2 (ref), v35 (copy), l_expect_0 (ref)
        local v37 = table.pack(...);
        local v38 = l_console_0[v36];
        local v39 = l_jest_0.fn(function() --[[ Line: 19 ]]

        end);
        l_console_0[v36] = v39;
        return v2.new(function(v40) --[[ Line: 23 ]]
            -- upvalues: v35 (ref), v37 (copy)
            v40(if v35 then v35(table.unpack(v37)) else nil);
        end):andThen(function() --[[ Line: 28 ]]
            -- upvalues: l_expect_0 (ref), v39 (copy), l_console_0 (ref), v36 (ref), v38 (copy)
            l_expect_0(v39).toMatchSnapshot();
            v39:mockClear();
            l_console_0[v36] = v38;
        end):catch(function(v41) --[[ Line: 34 ]]
            -- upvalues: l_expect_0 (ref), v39 (copy), l_console_0 (ref), v36 (ref), v38 (copy)
            l_expect_0(v39).toMatchSnapshot();
            v39:mockClear();
            l_console_0[v36] = v38;
            error(v41);
        end);
    end;
    return v33(table.unpack(v34));
end;
return v0;